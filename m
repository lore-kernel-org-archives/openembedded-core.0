Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 11F5A7E3BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:24 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g69so7103053plb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HJxwoZWNkB1IsuIOXO9/a0OLBrk+G2+Jrc47CiELwOU=;
	b=SvY7r8lwgDvApP085TREWzD0GmAK7O3uy9KlSTQxbEzoXF4eQruKfoaMPmXMRjFBNG
	1ZUDtTRLfa/yf/iVo3OyhlIJjjxFO/skBboAZSBRi6Wyu6Jaayt1TtBIZigbSXxMFaqC
	MvmWe+pMFBDGnlbYTaY2WFBP+taBP1MH8KY9aSu0G+lxe4Az5BpW9J2YNGjCtCyFsJVP
	bOxEH4+OOoWSP9gI8py6WmDDIdIXoDllV3IRGGkMG4vJILAqbJ0vMwmSIgGNIDjvYU3m
	o55Co43dVy987N2w0FWVDlZCCa78AiO0joIY4wqZZoGCw+EdRDVv8jTbG6v1fdRExQ4j
	vLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HJxwoZWNkB1IsuIOXO9/a0OLBrk+G2+Jrc47CiELwOU=;
	b=jjenr/u/miPlKC7+/7DJykNCMI9xCyxUALhFmJhhKFn3dmxGxlNmzGlhvWiq+jGmey
	bSoFZHThAR3IEZ05CymhnPyybAgXzMN4nb3W15d+UosLnWQvgftdqbdPDIPnFOwAd2ZS
	YgrTf9Kttx2f+0Vbc1pwPjnzBRJM+t6K61B5cMYteAsWs+WCMwtvOct9yLl+bI0ksYlJ
	5dCgK9hd5aCrXce182Ed/eYIQ0MIyW3fwsHr+wIasf/N6dKEkWe/90w+x/WgMvY0VqHX
	ammHkwnLkCXzqWraGBE44uYQh9VB9wDbn5AFS8aeUxRCDYHUTRIyFYtUrO0a+L+utKAx
	kxhA==
X-Gm-Message-State: APjAAAUN4xjjIUMCBAltmNFxqiijL1UrzooXn8psTqreIp8J4T0Utdzz
	DFelV65/jXVGipuUaUx93kE2M8lq
X-Google-Smtp-Source: APXvYqwhsr9HFB3GsqFWfSr6lIFt4s5p3Ew/F5Ufx0iufIaAbe1U9sBtYCb3usRWwhUxRz2+FO08Ow==
X-Received: by 2002:a17:902:8c94:: with SMTP id
	t20mr29298809plo.141.1559574446143; 
	Mon, 03 Jun 2019 08:07:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:07:04 -0700
Message-Id: <db0ebefad601034a017f536a92c04aa83479cf55.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 21/21] util-linux: Fix ptest dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:25 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We should append to the ptest RDEPENDS and RRECOMMENDS otherwise the bbclass
defaults are overwritten. This leads to ptest-runner not being installed in
minimal images. Also drop the duplicate ${PN} value which is unneeded once
we do this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6dfbe0b..7b9b4d2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -142,8 +142,8 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest = "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm ${PN} procps sed socat which xz"
-RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
+RDEPENDS_${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest += "kernel-module-scsi-debug"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
-- 
2.7.4


