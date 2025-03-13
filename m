Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E2FC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 17:22:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.20949.1741886552282177690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 10:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIsufSnN;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso755061f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741886551; x=1742491351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyYaOVB/s6dmk1YwYjZNKe9b5t65q8muFF5V2JJ/mIA=;
        b=UIsufSnNnzvpH0VVcvCKb0IumHpBGdF3G7XK4hKfLw0EN5fsOQ3cusuWimQszYg+pc
         IhnlGbA0x3iyh/Rpy4/DfSCTw++EyMtgRnOGE024mBCSW92Nex6IPkfuUZh/TU2vj3rX
         JXPGykbmcpBJTUuo5rlDvh3iGWBFXk038Mo+wlNOc58vWqP/KJr3LIGtQURbsRMEAIUX
         mZx/oGdmwFQc/YIqOP8OA6HjdEUvL+GQk2cg6cFz1SXDRoRXcM++yjEqVOgaFnpWMG4h
         0pH81fQY3QPOQz46oKhBYyovs+6BatNjrjNRcPMP1kvOuAzqXlnrk3VlkJDR/dxlerry
         WwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886551; x=1742491351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyYaOVB/s6dmk1YwYjZNKe9b5t65q8muFF5V2JJ/mIA=;
        b=Mw1ehaNXj9SFX0dO84D2jr6gTofjU2K0zPXgyRz3qvuzorS01AUXYkay0foGzb//Tp
         x8z2Ik5Bh3Mv7rnZIU0jY8khWWdPRylFaXg3JcQkWU/lZNm72AAZ568q3GFAhEcAqbad
         Lz3oDhgxrbmydatCDJARkvmQMPO4eOIrcsSqT/WfY/PxeAhpkfUwi7CMYvl9DYHGFZs6
         RGJa7G3Dn0V4H6Kviq8J/hIc/YFuDzdKRzQ5niSR6CiTtwc+OtIT/46lPDDSNRwwBp7a
         +IHy4TGSLKFcq/mnTfbeNWMFIGvjT+9sa7DUJ7TamSdU/HXPYMW5sq2OohNDnW8e5FiI
         KrIQ==
X-Gm-Message-State: AOJu0Yw1hZBThTiK2KLsDF/s44H50k0e04bvNWsE2YXQVVC5IGijkxqH
	ZvRVy6ES3oeScVmp9cLZdZd5gAEMAdFlV0akhcvI0evZrcLoAIk6M1hm+w==
X-Gm-Gg: ASbGncvKeDY5uUTYdxvr2LRkzuqqRvMs+hEYwlSxO0KoVLQv8QXqXkcmkEUgTb6cqVQ
	3XXc8ySmGcPgBKpFDxWwvu+QAjShOjbcHJmjPXNPicK2GRKrEoL83MyKfoF73AOt39r635KU5u7
	wBWBrymQmUtX5fXUj3seDcyg9+PwgorjUQKKsrVGEyxqYd+SAHegBFbH7zcb7Kzgdk7xuiMEvHx
	KhXxFHEPIHB2ARwJAfh8eF3pnqlemCm6k2utQyMel+n7oMh4GJ23FYfT55JK4pmm4/vZl/sjHlo
	VoK+LrWMe4udJJdbKRrtGM7npfn11BRDRgTwJoW41cGYVUxMq9ga52UOA61V3Gidop61igA2AM1
	Ql9nBhQ==
X-Google-Smtp-Source: AGHT+IEQrBU366M/Jy+4Jn1Jcba2UTFt9VlX36GRPTct/obMyizXXQsbbTcDjkUQnzmrU2ufncS4qg==
X-Received: by 2002:a05:6000:1863:b0:391:3988:1c97 with SMTP id ffacd0b85a97d-392641bd708mr10653152f8f.17.1741886550573;
        Thu, 13 Mar 2025 10:22:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm2758445f8f.62.2025.03.13.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 10:22:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] scripts/install-buildtools: add an option to specify where downloads go
Date: Thu, 13 Mar 2025 18:22:22 +0100
Message-Id: <20250313172223.3407902-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212795

From: Alexander Kanavin <alex@linutronix.de>

By default the script puts everything it downloads into a temporary
directory and erases it after unpacking and installing the buildtools.

This isn't great for traceability and reproducibility of builds
(being able to see what was downloaded exactly, and being able
to reproduce setting up a build, especially if the buildtools
download location isn't available for whatever reason).

This commit adds an option to download items into a specified directory
and keep them there. I would particularly like to use it with
bitbake-setup, where an optional feature to install the buildtools
(exact implementation details tbd) would ensure the tarball remains
available on local disk.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/install-buildtools | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 639ebb12d78..6287416c9a7 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -142,6 +142,9 @@ def main():
                         default=DEFAULT_INSTALL_DIR,
                         help='directory where buildtools SDK will be installed (optional)',
                         action='store')
+    parser.add_argument('--downloads-directory',
+                        help='use this directory for tarball/checksum downloads and do not erase them (default is a temporary directory which is deleted after unpacking and installing the buildtools)',
+                        action='store')
     parser.add_argument('-r', '--release',
                         default=DEFAULT_RELEASE,
                         help='Yocto Project release string for SDK which will be '
@@ -235,11 +238,12 @@ def main():
                 safe_filename = quote(filename)
                 buildtools_url = "%s/%s/buildtools/%s" % (base_url, args.release, safe_filename)
 
-    tmpsdk_dir = tempfile.mkdtemp()
+    sdk_dir = args.downloads_directory or tempfile.mkdtemp()
+    os.makedirs(sdk_dir, exist_ok=True)
     try:
         # Fetch installer
         logger.info("Fetching buildtools installer")
-        tmpbuildtools = os.path.join(tmpsdk_dir, filename)
+        tmpbuildtools = os.path.join(sdk_dir, filename)
         ret = subprocess.call("wget -q -O %s %s" %
                               (tmpbuildtools, buildtools_url), shell=True)
         if ret != 0:
@@ -252,7 +256,7 @@ def main():
             checksum_type = "sha256sum"
             check_url = "{}.{}".format(buildtools_url, checksum_type)
             checksum_filename = "{}.{}".format(filename, checksum_type)
-            tmpbuildtools_checksum = os.path.join(tmpsdk_dir, checksum_filename)
+            tmpbuildtools_checksum = os.path.join(sdk_dir, checksum_filename)
             ret = subprocess.call("wget -q -O %s %s" %
                                     (tmpbuildtools_checksum, check_url), shell=True)
             if ret != 0:
@@ -347,7 +351,8 @@ def main():
 
     finally:
         # cleanup tmp directory
-        shutil.rmtree(tmpsdk_dir)
+        if not args.downloads_directory:
+            shutil.rmtree(sdk_dir)
 
 
 if __name__ == '__main__':
-- 
2.39.5


