Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304E3C25B10
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:53:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.20199.1714395221509372221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 05:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Na6x2Fuy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e86d56b3bcso39906875ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714395221; x=1715000021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PJumBfHaICaiCVrO/fmKxHmLTrnJaIH7GTwnMrNl2g=;
        b=Na6x2FuyUnD+zJ3o/LcpQ9/GivdT3hDN99q2JQLGA49AmS5GJrG42Ax9olm14sJ4Fh
         9ue699E03xX/IgYZWutpcsAym2b5T9CEpbZce4Yi+epmiE/ReHb5Ua8J5TcdPgyQ2Shz
         2uTe5+spECtuAgjzrHL0BJy4DuBN+MqTlcNhGWGLUcfvMUggGCLEZ60U341kl19rZI20
         qHdliw0Sopzw750vtthjdn1IEynj5ZmWWp9ohXXhQDqm0szZu62h0PLq/ORkLhxDqMIz
         FkxrCqBFNuuddPbJ5ryjm+prHSfXVX/84OIMI4zw9X0fBZb3+QLpQgXuZV1oixP17pyf
         xUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395221; x=1715000021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PJumBfHaICaiCVrO/fmKxHmLTrnJaIH7GTwnMrNl2g=;
        b=INvU1VfQkFw12NFtrd0kzfwqEvHN8JlVPyAvlj6L02LbCZn4zTeJ7mtwMncmXEq1IH
         7x1H2mOQaX74BZQww1+HGlIhflFN/CugLMmpgGc/Xn/TUH28MoUrBKik/t7XQs4+R117
         hCXCGpfKGQx36ASTukWMidqDfRo8rdtLRRvqAATGduvAL9Qi41eCIioPhRpoUQIpThNT
         u3RFwg2YVLYrMFDqiTi/Brb3O63lpcoPiFjJgn7nQqEF+IPEMf9BTGaelKn9d7kJDUZQ
         lDODVEseK/XcH+rIaky3vtdc0WfdDMwlEumwhtVEVWVdRRDsh0l0BfN57Acg/AVSvqIY
         YFyQ==
X-Gm-Message-State: AOJu0YxsojBZ4oYVo/DHojePfz9jO45C4gVrpbHpx5SiikKr8LRkNwJd
	IvBMChaMQ+gKL5CvkxaStxjY3vvx0Mn2xtA8hFu9TEfpnm9hGpMIPRdjYwrmcZKBSjkvrUeF6sW
	+cQ7NMA==
X-Google-Smtp-Source: AGHT+IGC1Y1HIkawWT6GMBuEC1PuH0WIUmEt30eKhQWBabbTKYWYKn2zNAxWv2Haf9upGsgpgC0FnA==
X-Received: by 2002:a17:902:d4cf:b0:1eb:4a40:c486 with SMTP id o15-20020a170902d4cf00b001eb4a40c486mr8655940plg.14.1714395220764;
        Mon, 29 Apr 2024 05:53:40 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm20184399plt.251.2024.04.29.05.53.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:53:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/5] rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once
Date: Mon, 29 Apr 2024 05:53:25 -0700
Message-Id: <8a502301209ef144932ef5071c1a9b738db23270.1714394934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714394934.git.steve@sakoman.com>
References: <cover.1714394934.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 12:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198742

From: Michael Glembotzki <m.glembo@gmail.com>

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting
the file dropbear.default, the line will still be appended a second time.

DROPBEAR_RSAKEY_DIR="/path/to/dropbear"
DROPBEAR_EXTRA_ARGS="-B"
DROPBEAR_RSAKEY_DIR=/var/lib/dropbear

(Backport of rev: 6045314d2968f6f5a0877a4dd45f35c766a40e40)

Signed-off-by: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 5c0b3ec37c..f7517c66dc 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -119,7 +119,9 @@ read_only_rootfs_hook () {
 		# Also tweak the key location for dropbear in the same way.
 		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-				echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				if ! grep -q "^DROPBEAR_RSAKEY_DIR=" ${IMAGE_ROOTFS}/etc/default/dropbear ; then
+					echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				fi
 			fi
 		fi
 	fi
-- 
2.34.1


