Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id F38DC6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b128so4877562pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sRFkFtQNu/c9RuPbZQKQ20iMl/cNy+QCK9j3pq4pBWs=;
	b=UAk70bC2HGcdzMyIaY1698ptkCaDvfWhN+wdbjYl+FxWXRrmSstceKDP0YfQIBZSrH
	lijfO1jfA6Oth/rpd0YTRKsbCjxy8+XsBEgb8TjNMxf1lu8SRXcp/uQrsPr3Jga1KcRP
	CP9S/N6v2miQ74dNBHTQHEhGbYy/noOuKpBHknyHzKMRka4AtzVwZ4sHw8LpOjytZjcp
	qdmy6CmLHryR9pjMd0aGjeI4qaZgY6HAs8msRnwf4+nCT+LNf3mc0TlgDQLO3GZQOznQ
	C5/jiSlr6LCJLyajd5LAS/FiRvZliVCfNoyk4Vhh/Oiqwv+CZphENtFGG4LH2a1WhnIU
	AsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sRFkFtQNu/c9RuPbZQKQ20iMl/cNy+QCK9j3pq4pBWs=;
	b=H+K79ILOsU55YlGa7OmcGddohThaO+FbTz4FV+rDuGwWtHtHyD/8cF66voLWZt5BYJ
	jVkFZcDmVY1a1+LT/Gq0964x413PZKbV3qpLjSS9zdw3Aik9TSXmpAkbj4RRf5q32xvf
	MFNsAbml/74Y9Gx0RHIubYrpzUItsUKSWHMaISgAAysYx0MQ8e0H3zRaUbgqArpYrkks
	NfQKXSM5J/C+FwLc74A0twpYEYoJFiNZgPdE9pcRe4sEYlOeXqLcN8WFuSGyqstkeYkO
	FlE+MsUD+QOG+EAYyILcUIwJ+oD2+MxyiJMObeteFTiMDUwO60d8zHpLEXAzk6L0V3zY
	lOqg==
X-Gm-Message-State: APjAAAWcxEWmaN+brl+mnvLbDUfQGsevtG6Rp2ikGoydsxOdkKQR65p7
	VS0xv+WiJGSKp9wHYrPUFyNfaQfXNAI=
X-Google-Smtp-Source: APXvYqwmSs9E7kuR3xHI15LatBPPLOVZCyZf79sndJ8bLYxtDEEWMBoSO06cT0r+m/ymS9yHRELeZw==
X-Received: by 2002:a63:5007:: with SMTP id e7mr21209151pgb.2.1569818917801;
	Sun, 29 Sep 2019 21:48:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:38 -0700
Message-Id: <6b4c4fbaef8b4655efbc542fb7b97081dbaed8ce.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 43/54] kernel-fitimage: uboot-sign: fix missing signature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2019 04:48:37 -0000

From: Jun Nie <jun.nie@linaro.org>

u-boot.bin with dtb & signature should be placed in ${B} so that
it can be deployed by u-boot as expected. Otherwise, the version
without signature is installed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8beafff..1fc2a37 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -66,7 +66,7 @@ concat_dtb_helper() {
 		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 		cd ${DEPLOYDIR}
-		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 	else
 		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 	fi
@@ -77,10 +77,12 @@ concat_dtb() {
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
+				CONFIG_B_PATH="${config}"
 				cd ${B}/${config}
 				concat_dtb_helper
 			done
 		else
+			CONFIG_B_PATH=""
 			cd ${B}
 			concat_dtb_helper
 		fi
-- 
2.7.4


