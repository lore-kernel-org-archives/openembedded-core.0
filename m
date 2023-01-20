Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BD0C38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:00 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.82076.1674238314528266940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=2AhNAkYE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id v3so4751220pgh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh813h5cftB1CuIO7OSeJeVfR0fI+DH4kYWPF/rT654=;
        b=2AhNAkYE5u/hxb9WnyOg+D2pDDuWjNx1W49Qx/TXKNcsaS5gnsUI2vUuhwf/xw6S/Y
         2k8r1oh5gPd5lUyxh+4T+cQswpuHcOl2L9SqR+w0ch4xsGiBGnk7KsMJIU8fyoTAG3mz
         QBvChAyIdAz/lO5jQBJXczdAzEPJ/693S9Qo7JMPLwQCI5pKzWbe48Sd6NNlBNz7piKD
         vTuz+P9oNmC/q4S0aKWWW8BEbJDCFd7nNMrPLioIsDRqAhjeor6r75YXEEk5vKTVggrc
         oKukX3u7bS/Tsm1hRJg42r5GubMRVDE10R0DP3OWwIU5ctPMaU3yJge+hB7ypjJOXwDw
         RDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gh813h5cftB1CuIO7OSeJeVfR0fI+DH4kYWPF/rT654=;
        b=JyUJhPGhZ98rGkyH/VxLJvAXNaWAsrV8ItO3+v5L9LM7M/ve/lksAMRhpy2c8NmyzA
         z+0uNfMo48F5974YmjFJoETFzJDBFtsASH8pB8RJMWGVvI3U/LiR8jABpWow5Ij4niJG
         7zjcydRMe5iU3b4TJfb7qAizKRRYnzMLNh//ipGVnD4ymA6FI2I0azP83c8Vx16Rf8G6
         e4VLb2VmhOUhbNAypoWgNT0SwDQuwqikPw15pSDicVjZdMn8+YZ3PxGV3XMFE+ygSq0l
         5rKGeqtqad93p5gYnPbrBlaldx6CanU97D2zWRM/LlfBE2yjCN+uxOUQjnRY6ADiwVN2
         JuCg==
X-Gm-Message-State: AFqh2kpqPw9EsxUjIB2fITI+qhw1hIxptizU3SkTgLVEmqwnY+V73vSY
	dFgYYKKST8rNM0+gunT4zJzPDxKdUeWtRPBKXeg=
X-Google-Smtp-Source: AMrXdXucmt3mIV3Cz9iIHHBYHBE6/OAOVGhcYzjqhdXxD3rxtw8dVLcySqdNESamuieGXKTAkZJy+g==
X-Received: by 2002:a62:1cce:0:b0:58d:c617:8e9f with SMTP id c197-20020a621cce000000b0058dc6178e9fmr16701084pfc.3.1674238313482;
        Fri, 20 Jan 2023 10:11:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/41] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Fri, 20 Jan 2023 08:10:44 -1000
Message-Id: <43926dfc527d865f1051299b2dd688770e149b23.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176234

From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>

Allow user to select the default DTB for FIT image when multiple
dtb's exists.

From machine.conf or local.conf user can specify the default dtb
for FIT image as shown below.

FIT_CONF_DEFAULT_DTB = "board-default.dtb"

Also fallback to avaialable dtb when FIT_CONF_DEFAULT_DTB doesn't
exits or empty.

Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 06cdc4f1ec..f6d82ce061 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -73,6 +73,9 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# Allow user to select the default DTB for FIT image when multiple dtb's exists.
+FIT_CONF_DEFAULT_DTB ?= ""
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -375,6 +378,7 @@ fitimage_emit_section_config() {
 	bootscr_line=""
 	setup_line=""
 	default_line=""
+	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -417,7 +421,17 @@ fitimage_emit_section_config() {
 		# default node is selected based on dtb ID if it is present,
 		# otherwise its selected based on kernel ID
 		if [ -n "$dtb_image" ]; then
-			default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        # Select default node as user specified dtb when
+		        # multiple dtb exists.
+		        if [ -n "$default_dtb_image" ]; then
+			        if [ -s "${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image" ]; then
+			                default_line="default = \"${FIT_CONF_PREFIX}$default_dtb_image\";"
+			        else
+			                bbwarn "Couldn't find a valid user specified dtb in ${EXTERNAL_KERNEL_DEVICETREE}/$default_dtb_image"
+			        fi
+		        else
+			        default_line="default = \"${FIT_CONF_PREFIX}$dtb_image\";"
+		        fi
 		else
 			default_line="default = \"${FIT_CONF_PREFIX}$kernel_id\";"
 		fi
-- 
2.25.1


