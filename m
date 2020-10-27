Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web09.1066.1603815015479188622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 09:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XFnWraqd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id i1so2586894wro.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 09:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7BpuYiqU9EvbxvkE+xWeOlT5slUH+8PF2h6GAuuRtg=;
        b=XFnWraqdtc1DQ/2f0ZhqoIR28W6r7LcEOQcrbZoB1ee3SpL07dNkS6KoEtJy8MrApY
         x8XMeZL8FtC3okPlyC1KYvQAAVKDk7lCHNLXztBP2jH97Zhcpz+cwRdt55JNf04tpd9k
         g1GC3WTmgA2PiE7cnFAvsYyPPGe2nzNEH3nGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F7BpuYiqU9EvbxvkE+xWeOlT5slUH+8PF2h6GAuuRtg=;
        b=swPUtZFCcCDtaW6DmiKINiszrGfHio/6u9n9PdQdWd0rg7SwIDDQ8IVB9jPD2AD1vU
         s5D8A8igwlOafDCmeEsIznZ400yP9Q292qqEk4FUZETu9zu1AW5LumRIbJVp279xpujO
         qyVh+IREW1ffo9f1rjwT0P+h1ptjcEEXlaL6qSUuZ6dL96yHw8GLC3psNeTHnvMtrMJX
         X5qHy5hnGwyMRZlMjzSQ/r0NenMRJjUZkID/49OVNgC8L5mJMKcPA6uEtsbv5pBQhH7x
         V3Ks1aJtZaLeFeqzXKVi6I3TpzCZEkBGWHSJzbLcMEFCOTIIHMlOGTp4+mQupMh0Ceqc
         6Bzg==
X-Gm-Message-State: AOAM5318BP6AcDLrCVqX3+39YvlowgpKQ5iKDOS1k6xewyLcOrGx4UlN
	HtB9D/6peOj62Oxr7RfaheKUXgm2hSy9OA==
X-Google-Smtp-Source: ABdhPJx8lf9MlPmPQsmlfiodx1GsurZyPL7G7TMS1DUYn72LkwgfQ+Ag3Ynsx+/gRaIr1LGBfb7LZQ==
X-Received: by 2002:adf:81e5:: with SMTP id 92mr3688512wra.411.1603815013143;
        Tue, 27 Oct 2020 09:10:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id 71sm2659530wrm.20.2020.10.27.09.10.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 09:10:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Log timestamps for hashequiv in reprodubile builds for do_package
Date: Tue, 27 Oct 2020 16:10:11 +0000
Message-Id: <20201027161011.139938-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a task generates the same output with different timestamps,
hasequiv won't detect it but reproducibile builds will fail tests due
to the different timestamps.

Add do_package timestamps to the hash when reproducibile builds are enabled
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4b8f264012c..64fb84ec924 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -484,6 +484,9 @@ def OEOuthashBasic(path, sigfile, task, d):
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
     if "package_write_" in task or task == "package_qa":
         include_owners = False
+    include_timestamps = False
+    if task == "package":
+        include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
     extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
 
     try:
@@ -558,6 +561,9 @@ def OEOuthashBasic(path, sigfile, task, d):
                         bb.warn("KeyError in %s" % path)
                         raise
 
+                if include_timestamps:
+                    update_hash(" %10d" % s.st_mtime)
+
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
                     update_hash("%9s" % ("%d.%d" % (os.major(s.st_rdev), os.minor(s.st_rdev))))
-- 
2.25.1

