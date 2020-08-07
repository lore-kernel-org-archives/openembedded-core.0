Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.5045.1596831953327745822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 13:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=djrYZA3f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 3so2988907wmi.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2020 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YKihKPogIR+J8ICF1ZXx1k6d+kg0zo+vFWgjuKQ3UW8=;
        b=djrYZA3fhdZSiM+vjKO+Yp9uB6Ufi0etXnlOxCbtFQ9Cx8+blEkzNJ8so7YRaSwwgt
         sO4Q0wrDrsWxP/1TqmtAkvqmisaa4pMXsyR0dWs9BdjGifJ/KbOlkWmgPJVq5O79gzqS
         o+gqktffaafCbLC8G/7sBjWGXS+FSngUJ+vLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YKihKPogIR+J8ICF1ZXx1k6d+kg0zo+vFWgjuKQ3UW8=;
        b=Ix4g3229l8sEU3unChdqybsb3miaPhIytBfKu+WTj5qKjWN3heR/R/n8FbMDCsEzgd
         cktfXufipLl/vrBCn5E1NwLVxueNoCsHuissAOhnwNCLr9+YxaN0KKyIAO0DOJKoRyTI
         5QPc18JYWBMh8VYJupan8UBh5Ehqruw8xT4JHF0290KyxdSFHRtqGPJFEhPPqTaSd6cM
         dxYKGkGPMgzuQUcvdGVuzJ4EShU3x951ohC2ekjJa4RgAncFHbHVc35NHcXn8bBRDUze
         o4A+4AK6cN70HgWaS1jzJBvQjej6Gz+zaW1VBK/bxUihiEPeb541KqEh30ZVVHNBojDu
         FyfQ==
X-Gm-Message-State: AOAM531gupF2IiSJU9jIvDpm86O4uH5u/dYzvR4NnH3J6xYauwSjjD40
	PUPMjF+SPLFlT6pjzulhVJjOZeBchaHtrA==
X-Google-Smtp-Source: ABdhPJwLq58+e6L5d0MfNDoghcOJJQbN9yAr+gZb60nX5wDzNXusPc5qtmjKLQAU8/tyTQdeqxe2zg==
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr13768219wmt.94.1596831951668;
        Fri, 07 Aug 2020 13:25:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id q4sm11827770wme.31.2020.08.07.13.25.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 13:25:51 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] uninative: Handle PREMIRRORS generically
Date: Fri,  7 Aug 2020 21:25:48 +0100
Message-Id: <20200807202548.753073-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
References: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently uninative handles SOURCE_MIRROR_URL but not generic PREMIRRORS.
It can handle this better, attempt to iterate PREMIRRORS entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 70799bbf6d9..316c0f0616c 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -56,12 +56,17 @@ python uninative_event_fetchloader() {
             # Our games with path manipulation of DL_DIR mean standard PREMIRRORS don't work
             # and we can't easily put 'chksum' into the url path from a url parameter with
             # the current fetcher url handling
-            ownmirror = d.getVar('SOURCE_MIRROR_URL')
-            if ownmirror:
-                localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} ${SOURCE_MIRROR_URL}/uninative/%s/${UNINATIVE_TARBALL}" % chksum)
+            premirrors = bb.fetch2.mirror_from_string(localdata.getVar("PREMIRRORS"))
+            for line in premirrors:
+                try:
+                    (find, replace) = line
+                except ValueError:
+                    continue
+                if find.startswith("http"):
+                    localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} %s/uninative/%s/${UNINATIVE_TARBALL}" % (replace, chksum))
 
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
-            bb.note("Fetching uninative binary shim from %s" % srcuri)
+            bb.note("Fetching uninative binary shim %s (will check PREMIRRORS first)" % srcuri)
 
             fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
             fetcher.download()
-- 
2.25.1

