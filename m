Return-Path: <m.glembo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36154C10F15
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 09:16:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.12564.1714036571906970430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Apr 2024 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICEPEwjO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: m.glembo@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a519e1b0e2dso101176566b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714036570; x=1714641370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/uZd7oOorTaZ4VWb/8istAsU2ifoohRpTeU2X26+DU=;
        b=ICEPEwjOlAPgEvQwAtRr/mXTYv2C0rhxXQCBFbTdII9/V1YfiTk1CPkfRO4OBOTnVJ
         xrpabyfqoO8TU5UlsW06l0eshLZgpJkv1HAPqG2Vl7ugg3XZCD/TK0wKj5198UxZfb91
         18lZ7vRQnVURleOgRCMxApD7sYk9fTNzEtu0KgExy2Qh3lfP7fBGu55R6dURCahGCQn1
         GoOCPaeMJQRsmf7vkvAoAPH+1Dh5CftMkhUbpL2injG47Ado04K90Y5XiTdXj+OcVGWW
         cC7Ho2nFBRgHJSY4j34HldUxjwsZRM9YnfSpmO+uDjizFe5dtadXh+n5JUUKDN2U28PM
         HIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714036570; x=1714641370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/uZd7oOorTaZ4VWb/8istAsU2ifoohRpTeU2X26+DU=;
        b=AKNorbRnDJF+c6NLGO0IZ/OZuQ3jTMxkIIGRIaoA6DNnCZ94zHgzx04tRfGCIGI/Nk
         R54frAh+g/zx73VRvsQ1qsCsbA6oxtz8KJc929+WnlzFnKikSD3fH2dbfFdNNFtxMezH
         d+D6MbrEU240p/pVeXkfUeJgTo/fxr2jcFWoJlIha9rElo03YfdtHDZXIlbktP9MXJQA
         ofpLknyCrysL8p3IPYrWnuEvkaAMumVHsDK1oWsbrxo+Uu+h3Cs/9Mt+QoYGVrDVp9nH
         SFN8qX24p+gpEyzA09yPPlZtJd+QzSEScziOx3fchYnTljQXmrSQ5L4yF+FUb7c4VhZ3
         9r7A==
X-Gm-Message-State: AOJu0YyT3LZyHZV14TVyC/rDoS20XRc5QjX9SNkYycFwadOU+uZUc0/B
	ZhNrnvKn0bCdKVmqg4KOv3hj2cHg9TI4gEePUD/cYiCqpiddUyn7QPyivw==
X-Google-Smtp-Source: AGHT+IGQugKO68/lWvWoeZ2cu8XVwFTQWwINIz+Izv3YcVhCuVY8plFIOIIlFezTg8jfGIiv4wUZ3A==
X-Received: by 2002:a17:906:fe03:b0:a58:9748:c94c with SMTP id wy3-20020a170906fe0300b00a589748c94cmr3433478ejb.8.1714036569649;
        Thu, 25 Apr 2024 02:16:09 -0700 (PDT)
Received: from localhost.localdomain ([213.61.209.158])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906164400b00a55967a9038sm6893274ejd.95.2024.04.25.02.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 02:16:09 -0700 (PDT)
From: Michael Glembotzki <m.glembo@gmail.com>
X-Google-Original-From: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
Subject: [kirkstone][poky][PATCH] rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once
Date: Thu, 25 Apr 2024 11:11:14 +0200
Message-ID: <20240425091113.708546-2-Michael.Glembotzki@iris-sensing.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 09:16:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198698

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting
the file dropbear.default, the line will still be appended a second time.

DROPBEAR_RSAKEY_DIR="/path/to/dropbear"
DROPBEAR_EXTRA_ARGS="-B"
DROPBEAR_RSAKEY_DIR=/var/lib/dropbear

(Backport of rev: 6045314d2968f6f5a0877a4dd45f35c766a40e40)

Signed-off-by: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
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
2.44.0


