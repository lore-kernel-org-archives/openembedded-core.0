Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E73C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.53793.1677012313009278929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJ/r9Ng8;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id i4so886343ils.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqCXGzvdga7LI+WivlK9jdxVB+/cxmnzOZ5PaBI04YQ=;
        b=kJ/r9Ng8JyWKRILGnzW88Ydmz22sAlL0fVKf5/lPkuqYlVZ5rAiL7Qw9ahjFc4ZemD
         r32m2GOyf8D5ThvWEumpIap6ie/drzyh3N03AwEDivinIpzUSlS3Tk518h3tDsjIk5H6
         u05gd/ytl3ERmTaSP0XKpspxLvjpmnRHcYMQ41EBd7F7pGyb2/PDq9Cq7z11w+IuXc5O
         ATMceDzmqRJCrobzOSy0LB7RcgaJLTsl+fpTvj0JJywlr6WVNU3fBUsQDsofnMWiCcYe
         UOJGwk7LRN84oet8W2Mt1ewBUT2v8ZwWamoNTDOoGAES82Eu7HRRANAwVmRNuLyZy9yX
         VJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqCXGzvdga7LI+WivlK9jdxVB+/cxmnzOZ5PaBI04YQ=;
        b=nryMkAHNCTzyBVRbcqSXdqiXl2OzMOsxR3EDDIaULkXxx3msCT79/XhpCwe0D0MOOs
         gdu4h7ehFsZj3aLeW4ZQnP2cbOSIJlNjjt3B8SFStommFpQ4XPF5uXRyk5PUpICV0KsF
         FJ6yCnzY7JeuvpcdhanZBhIBddOuNai+P5Fioz73VXN8kdAUT3xQH4BgMxu3R/zQWY38
         F0XxJkUR9kInq2XmsTwVhHbmh2KFKw/60ZxwM1A2wGF5XECPg72lWJRx7+vRtLxhnMMm
         vYc0vTUZ0S9+gBgJ2521x/LaDXeiAXmDKCFk3FN2c80hWGSbSRCEpbNdl0d8UVO0gK9i
         TLCw==
X-Gm-Message-State: AO0yUKVmi7JjN+boqN8bcRs1uOVVuoRcSbuI62lgY1ecd8vTKwzu3R/p
	IXKyg/UQ522fglY9tXOwPcwknGhJ9+A=
X-Google-Smtp-Source: AK7set9IkESWkwNJ8pozcStJCJyuoZw37V1uYZ1KeY9KbpKBxjqzPF/f6F4yHJc1J/uk22wyEB/fiQ==
X-Received: by 2002:a05:6e02:20ef:b0:311:e5:5d11 with SMTP id q15-20020a056e0220ef00b0031100e55d11mr7173056ilv.9.1677012311881;
        Tue, 21 Feb 2023 12:45:11 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:11 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/11] build-appliance-image: add /lib64 symlink
Date: Tue, 21 Feb 2023 15:44:41 -0500
Message-Id: <20230221204445.23931-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177545

Add a /lib64 -> /lib symlink in case the build appliance is 64-bit.

Building rust-native requires cargo to be run. The native cargo is linked to
look for /lib64/ld-linux-x86-64.so.2 and can't be run without it. The build
produces the following error, even though that file does exist:

	FileNotFoundError: [Errno 2] No such file or directory: '/home/builder/poky/build/tmp/work/x86_64-linux/rust-native/1.66.1-r0/rust-snapshot/bin/cargo'

Trying to run this binary on its own gives:

	qemux86-64:~/poky/build$ tmp/work/x86_64-linux/rust-native/1.66.1-r0/rust-snapshot/bin/cargo
	-sh: tmp/work/x86_64-linux/rust-native/1.66.1-r0/rust-snapshot/bin/cargo: cannot execute: required file not found

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index ad5ea92b3eda..3a84de0a2b43 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -109,7 +109,13 @@ fakeroot do_populate_poky_src () {
 	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/.cache
 }
 
-IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
+fakeroot do_tweak_image () {
+	# add a /lib64 symlink
+	# this is needed for building rust-native on a 64-bit build appliance
+	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
+}
+
+IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; do_tweak_image; "
 # For pip usage above
 do_image[network] = "1"
 
-- 
2.36.0.rc2.17.g4027e30c53


