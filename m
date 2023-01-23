Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B939C54EAA
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:36 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.33747.1674440551918814516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FbIXnogX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id v3so7963259pgh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJM9jovykKVLW6PfsvwW3MzbO9JEPsFDbaWFiBRh1mI=;
        b=FbIXnogXlI+syvJOBgg9Dd4MWLygrWPpvogfT3VaillHqkGFDoD5i0xuAluda1Cz2p
         iEWQMrEqR4SOejdMH9iD3E17oWtkb6Hl7ma5yhmgqdjsjQhoMVxlnED2khEudV8QxKa4
         NSZq/BDjJT1NfBEtwQQfi97mY0F19IOJvatFBO6xpxPoLM/jjUXZzQya0uu8tFHz7ANE
         K3xR9EPjBqY/h3tTDKAUJuickFWjZ/iH4eU+610WYABbxuQBiPOKKWb7LNTG4cl12yo/
         jQSxXXtocZrJxRvG69zJvv3ukJcHzZp8Ibyo6Rx0e7TsRa4aPVl/5cTXgQKd+CvGWCPA
         Et6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJM9jovykKVLW6PfsvwW3MzbO9JEPsFDbaWFiBRh1mI=;
        b=m6qTzHTNFoukaCN/cD8aRvNvK5R75YSCxhUk315y14WB9f47DnCTtvQN04YVxj1DmX
         JN/xRii9S3w1R/BvNKxqM/Cp5pQBtkfTMjHwfrPS+JpzXpkI6yWkPWLFqDzgOP86N1Yz
         etnDwxMn+Ud87+HicPoH3AcyUM3RzC2vRmjSqHXUqJjJU06YdOCkZXLWbuRxykeYhnag
         RgOqUq0IuNM8JFfo0ZAqgxsQoGFDD87zaZCJaYIaqIsz0eSIMgbsatWmIxyqO4hcJLWd
         fyWqjhhCVz+d6jpfKdK2t9aniPV20vrfzCPdJM04G19t7jGUQuPPG37BVNpu0ykXKkFk
         LqNg==
X-Gm-Message-State: AFqh2kpZf4bnPL2c08kEdJ+QWUeK2IeyuxbDSbW6vA5la2kQktBXZ2kl
	wVhQON18lZFuSHKbOxNs8U839x6Z3hrHSJ8vwj0=
X-Google-Smtp-Source: AMrXdXu/akdJPsnjL9YMsELCcz7+aZFZ76lemXAhgVCyJt8i/InCsrC5T5/D2diC0fZAIRxEV4l0XA==
X-Received: by 2002:aa7:8f11:0:b0:58e:2112:bc2d with SMTP id x17-20020aa78f11000000b0058e2112bc2dmr9741465pfr.6.1674440550944;
        Sun, 22 Jan 2023 18:22:30 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.22.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:22:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/32] kernel-fitimage: Allow user to select dtb when multiple dtb exists
Date: Sun, 22 Jan 2023 16:21:18 -1000
Message-Id: <678ad9458a17d9feebb2ea897be4b9bc0daf3391.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176288

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
(cherry picked from commit cd397284fa5f17de7e0a0d4b6b26fb8b56c3cd48)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 3cd4a45bbe..27e17db951 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -67,6 +67,9 @@ FIT_CONF_PREFIX[doc] = "Prefix to use for FIT configuration node name"
 
 FIT_SUPPORTED_INITRAMFS_FSTYPES ?= "cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.zst cpio.gz ext2.gz cpio"
 
+# Allow user to select the default DTB for FIT image when multiple dtb's exists.
+FIT_CONF_DEFAULT_DTB ?= ""
+
 # Keys used to sign individually image nodes.
 # The keys to sign image nodes must be different from those used to sign
 # configuration nodes, otherwise the "required" property, from
@@ -369,6 +372,7 @@ fitimage_emit_section_config() {
 	bootscr_line=""
 	setup_line=""
 	default_line=""
+	default_dtb_image="${FIT_CONF_DEFAULT_DTB}"
 
 	# conf node name is selected based on dtb ID if it is present,
 	# otherwise its selected based on kernel ID
@@ -411,7 +415,17 @@ fitimage_emit_section_config() {
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


