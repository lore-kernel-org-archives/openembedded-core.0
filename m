Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE8CC25B08
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.986.1660170747384561648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oMK/qDiH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f11so15571385pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=QBxHlnktdxp4F+g3lb9ZVqp1QoTcdzRm3HPtPAEL4Qs=;
        b=oMK/qDiHFNoGOKozYJUwxIHPs+YoI95WhNzVyevYItpVSrKSdhqZ17dU5uaUqzGN0t
         upNu7rkupkSIf2LfL+6sTB9lr+PdV3ejHFj6on3uVyatUxAextJhzSEnnxNllJLYorWU
         j97eB6zZ8qlqxMze/7XM8ZNRmAJn1F5hSY6788yraSuVgdV1HlhVVXV+Gbbf4PqLJf0o
         ep+v+9r2+OzyeiJ84bvQqQtEl8Ys9WpGkyA8cm1M/vPWs90iIg1M5LsP61TB2LuI8Pnb
         m3EGpAt4rPmiEUlVFDVEGdU34BO5Dejek9vW7eZ0xoSACbfmsiU3+/GiyzZrS2ixN9K0
         ySQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=QBxHlnktdxp4F+g3lb9ZVqp1QoTcdzRm3HPtPAEL4Qs=;
        b=bCXET6aS+UTh4BBHcIbbhtWLpLLkSMelStORzK3S7QRCFYBN77iCkGK+ZUiZJ91o0Q
         iL8TMJ89+hr3o6IvBE6FcunFo3IM+Fy/pisEG/eQbnSp1p6FSvzAOrTWOA9dXfI9snYi
         YBTtpRoQChtJsYbBh2EXYNrjXI6ub0AZ5VbaKVMghoE7MhxDxDqtUu6NqbTv7nTR3bzl
         3c2KDA3cPymfzp+KXvPAAbBMHVG0Yi875I3l8RAprr7Na/PrGnVs+QIvRiYUPu5xUSU7
         4NOFQ8/UyJG0mp+7YLsQfMo3k96bcHt0E4FiqUL0Q3/omWHpeWeL2fnHU9dxg6lP0tOi
         s36w==
X-Gm-Message-State: ACgBeo210BTyJtIYkUPf7uAkL/HaWsMmR6ppP9kBd3ibZ/CqaZz33p31
	7BXo2fXx7NFFbL9WdOCC/ktLOvxxBoqT7RPv
X-Google-Smtp-Source: 
 AA6agR4DRaRRz4EjUVaLEUeqpFKei3ZW9gk/j69KalRHqLl1QjoW+2WffdsQLvmRtpUtiltAmww2Bg==
X-Received: by 2002:a65:6e87:0:b0:41d:fefe:fd9d with SMTP id
 bm7-20020a656e87000000b0041dfefefd9dmr3129326pgb.557.1660170748464;
        Wed, 10 Aug 2022 15:32:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] cve_check: skip remote patches that haven't
 been fetched when searching for CVE tags
Date: Wed, 10 Aug 2022 12:32:01 -1000
Message-Id: 
 <a2d03f445c45558997484240d2549eaa1e103692.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169216

From: Ross Burton <ross.burton@arm.com>

If a remote patch is compressed we need to have run the unpack task for
the file to exist locally.  Currently cve_check only depends on fetch so
instead of erroring out, emit a warning that this file won't be scanned
for CVE references.

Typically, remote compressed patches won't contain our custom tags, so
this is unlikely to be an issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cefc8741438c91f74264da6b59dece2e31f9e5a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/cve_check.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index a4b831831b..30fdc3e3dd 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -114,9 +114,10 @@ def get_patched_cves(d):
     for url in oe.patch.src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
 
+        # Remote compressed patches may not be unpacked, so silently ignore them
         if not os.path.isfile(patch_file):
-            bb.error("File Not found: %s" % patch_file)
-            raise FileNotFoundError
+            bb.warn("%s does not exist, cannot extract CVE list" % patch_file)
+            continue
 
         # Check patch file name for CVE ID
         fname_match = cve_file_name_match.search(patch_file)
-- 
2.25.1


