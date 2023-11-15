Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F010C47075
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:18:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.5042.1700018283642721417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zyCjGFNx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso5616410b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018282; x=1700623082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArKgE67eBur1QH7o35YJ2kR0QyNgk9KdWPhF9xHxzt8=;
        b=zyCjGFNxA51ABVIledOjA/IA0Ovtfw8aePhghzFqo/7aSg9dSyxYb07tu6ZX1slVJq
         5ZieDLGyU4L4nEFsFZV6rVjEyNMxTZHTNAC4TZYL2iUSAVf+EXLnIZLfCvmNQ7Ij8bV6
         gecktKyTe7osMsQbVAH9j/2WqifY3zoqWnvCmL84fgjW/SduXNJOOwuNBEMqIYRTjRoT
         jEbnYcX3eZTsyG4vHYP1f/1UbLJu/+6jmS1RTOQ7+tndQ8ZzIHx1BXeEyF+RGTtnlPzI
         BWssaMYHE9swQMHGVyBCY7l2kpwLJnOReqRYRT7Af5Hgr5Qrg1CJWZKhVqNX+C0vrsuh
         JYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018282; x=1700623082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArKgE67eBur1QH7o35YJ2kR0QyNgk9KdWPhF9xHxzt8=;
        b=ATWH3FlcNYT1FnA4NvlT9E/tHIkA1zFUojBW0dn4d7q034QZH47HPDOXpnCvs94g3n
         pIpEKvYMVfC0LMr6gKvxSG1q7Vp2VOFq9D+mWTgcPKSiLTde94lde+3ohBQqSHC6XUKP
         hENQryFUQ/NCQw2Hrc0SiIb2OQuFXHt6SffxYppzhC6aeEZi3pEmr5KtCuIwFT6UMGbW
         Uo9ctl1l2j4W83N427N+6puG7uDsCDeR9UGposPn3N7Z8CoheY7+aH5WdVWiKu1VaI8i
         VcueXp3PHCVZs73ycK5vTUIkfFbg1HzY3Qyahzq8PIhPry61gHBHa+KYA9sHunEv5s0K
         AJsQ==
X-Gm-Message-State: AOJu0Yye8tSrzjXRTd/JYshuAPS9jpberSsT+yCQFuT54LnANoj3zf7a
	ZoS7C2SPspexaYoN4ZNt9p6sSq7Xjo5p+9358U240A==
X-Google-Smtp-Source: AGHT+IElvaecPpjfiTHqRvUNppNgDskiGSoVjD555EAscxBmPNaZ3+KwJBB4k+ZKs9WHgkeAFuTQJQ==
X-Received: by 2002:a05:6a21:185:b0:186:652a:7b9c with SMTP id le5-20020a056a21018500b00186652a7b9cmr9244552pzb.20.1700018282433;
        Tue, 14 Nov 2023 19:18:02 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.18.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:18:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/17] cve-check: don't warn if a patch is remote
Date: Tue, 14 Nov 2023 17:17:29 -1000
Message-Id: <32a19dfbaac38cd4864281a1131ac65e1216318f.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190542

From: Ross Burton <ross.burton@arm.com>

We don't make do_cve_check depend on do_unpack because that would be a
waste of time 99% of the time.  The compromise here is that we can't
scan remote patches for issues, but this isn't a problem so downgrade
the warning to a note.

Also move the check for CVEs in the filename before the local file check
so that even with remote patches, we still check for CVE references in
the name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0251cad677579f5b4dcc25fa2f8552c6040ac2cf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index a91d691c30..ed4af18ced 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -114,11 +114,6 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
-        # Remote compressed patches may not be unpacked, so silently ignore them
-        if not os.path.isfile(patch_file):
-            bb.warn("%s does not exist, cannot extract CVE list" % patch_file)
-            continue
-
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
         if fname_match:
@@ -126,6 +121,12 @@ def get_patched_cves(d):
             patched_cves.add(cve)
             bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
 
+        # Remote patches won't be present and compressed patches won't be
+        # unpacked, so say we're not scanning them
+        if not os.path.isfile(patch_file):
+            bb.note("%s is remote or compressed, not scanning content" % patch_file)
+            continue
+
         with open(patch_file, "r", encoding="utf-8") as f:
             try:
                 patch_text = f.read()
-- 
2.34.1


