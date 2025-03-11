Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074A4C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:42:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.5833.1741689727922338893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PNP12DRy;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf680d351so12124195e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741689726; x=1742294526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+7CKKRLgFMSduyq+GsNxPUiI3Zwt32mLDAPDL9eVcY=;
        b=PNP12DRyfMQ3WQl1kfGefE+RmXpDo/mb9EhTTJUUGzjN4mvbP6gQGYRmMoF6R2utBM
         oFqD6BpHcqsVoImzE9Ac41yDKIqtocU6JGTCp0QnarFtCV45ExTD+AnkK3Ye/mh2AcP0
         iOmRdPsHjgYaE8qk0bWPP8+eJa4P0JE4xGbpsKW/hAF/NXldvwe1D817f3z+CAuyTf9K
         HHjwuR1ZeA4bYPpOtJBo4/Bk6k9oyOriQP4PZVVWtM3NM+fcHDlDgNg6QhlKLyfu7mTt
         F3mtTl8nM6z/F5cKrYNHYMcgSjoJoiYtgnJw9pqQIKHbnTH38k3RiSzFL/gQJuAE3KQ4
         C9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689726; x=1742294526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+7CKKRLgFMSduyq+GsNxPUiI3Zwt32mLDAPDL9eVcY=;
        b=iLeZvbf3AwlL/5WvJ0vyJPEpLOmAcqjFKqBOk7CzPhxmqMy7sGwO4PzDVbSp1qpej8
         uQ8NLYUZ8iwcoEogQUW/7l0jDt5myUKzfV0BBqZhdBDoCUbsUZkTiIF4MKw0pBTE9rwR
         AGRLppX8WZm7lfEyA2R0CRc+c1hhBoiNwd7/B/yN19TYZ/BrDTo0qZyFsKJiJ8Httuc8
         FWC0ulpmihmpitHppiqAdASYyytHTETGIqMhlwC6W4LIF2Xujf0CL42TY+1ZWBYIP5gA
         o72fkZ/C9UddfijibVnUAgoZF68GsXikZtNst4ujjQp4VbHN0ZKgJT8KDWyAeaM20QC3
         tp2A==
X-Gm-Message-State: AOJu0YxXShPHAMQiSxmT/TaMCwVMZUv4QegAQBWh5rDk3f+q5RONLAKi
	o2H6Xha1TqugDt457aQQBVR1ciBnfMUfEBK6ZNTsuNTm13jWDU6vG0ACTw==
X-Gm-Gg: ASbGncvaOZchNN0Z3D86YYVnsPvk1sEU2iYA9hL8raZdu0mEfD+r4g8kkT0HeFuHsTL
	qkRhwEcdmkPEawJscYerdE9OusRHH1EVXuZ1VYmIUIVXS1tc4s6J/4m6nm445OHyJE5IMhxyjER
	zv3+s4hWpwCcgD3sZTqnvaiby16rJMDyK0TbgXbs6uSghD+PTkZ0WNRevtzxz3iLqxwYwtBXyxW
	v7++aaoyR4lkTbdrDUHjQYQtLiVw2cPUZ2m0LZL70bsdlfhLkbqqxCj+ND3aRnfipN4Jlv0Ky1Q
	PRuJT8+0DLhewHFVOOrfLhJ9sTGQ9ijq5Fm5BOE+syjA/B8AEVcbh6nkPFd5nx9hBMCfxaZag+W
	oXoS0m+3Kep/89Ber
X-Google-Smtp-Source: AGHT+IFQlY5jUNtrv1kq1HWSW0kNGUeEuMV8MA2IitEyJAj4YOtrxVC4hF9QsZVvbE1rjc+2HVn0IQ==
X-Received: by 2002:a05:600c:4f8a:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43d01d0b51cmr36409945e9.2.1741689726153;
        Tue, 11 Mar 2025 03:42:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee67ae5esm96201095e9.33.2025.03.11.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:42:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] scripts/install-buildtools: add an option to preserve downloads
Date: Tue, 11 Mar 2025 11:41:51 +0100
Message-Id: <20250311104152.393470-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212554

From: Alexander Kanavin <alex@linutronix.de>

By default the script puts everything it downloads into a temporary
directory and erases it after unpacking and installing the buildtools.

This isn't great for traceability and reproducibility of builds
(being able to see what was downloaded exactly, and being able
to reproduce setting up a build, especially if the buildtools
download location isn't available for whatever reason).

This commit adds an option to download items into a specified directory
and keep them there. I would particularly like to use it
with bitbake-setup, where an optional script to install the buildtools
would ensure the tarball remains available on local disk.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/install-buildtools | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 639ebb12d78..1a68aad53e7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -142,6 +142,9 @@ def main():
                         default=DEFAULT_INSTALL_DIR,
                         help='directory where buildtools SDK will be installed (optional)',
                         action='store')
+    parser.add_argument('--keep-downloads-directory',
+                        help='use this directory for tarball/checksum downloads and do not erase them (default is a temporary directory which is deleted after unpacking and installing the buildtools)',
+                        action='store')
     parser.add_argument('-r', '--release',
                         default=DEFAULT_RELEASE,
                         help='Yocto Project release string for SDK which will be '
@@ -235,11 +238,11 @@ def main():
                 safe_filename = quote(filename)
                 buildtools_url = "%s/%s/buildtools/%s" % (base_url, args.release, safe_filename)
 
-    tmpsdk_dir = tempfile.mkdtemp()
+    sdk_dir = args.keep_downloads_directory or tempfile.mkdtemp()
     try:
         # Fetch installer
         logger.info("Fetching buildtools installer")
-        tmpbuildtools = os.path.join(tmpsdk_dir, filename)
+        tmpbuildtools = os.path.join(sdk_dir, filename)
         ret = subprocess.call("wget -q -O %s %s" %
                               (tmpbuildtools, buildtools_url), shell=True)
         if ret != 0:
@@ -252,7 +255,7 @@ def main():
             checksum_type = "sha256sum"
             check_url = "{}.{}".format(buildtools_url, checksum_type)
             checksum_filename = "{}.{}".format(filename, checksum_type)
-            tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
+            tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
             ret = subprocess.call("wget -q -O %s %s" %
                                     (tmpbuildtools_checksum, check_url), shell=True)
             if ret != 0:
@@ -347,7 +350,8 @@ def main():
 
     finally:
         # cleanup tmp directory
-        shutil.rmtree(tmpsdk_dir)
+        if not args.keep_downloads_directory:
+            shutil.rmtree(sdk_dir)
 
 
 if __name__ == '__main__':
-- 
2.39.5


