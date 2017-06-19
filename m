Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id F345377FA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 10:32:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f90so16041255wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 03:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L16Lm81NdFyRqggSJ/ftRihcpPRABMX9HTkRjJGrUZY=;
	b=Rpm5e/JdDzW2qtpT3RPta8yHtWwnW2TwmFIG+WrOQiLJ9yGC90hS2ZHxD0b23OHxhW
	j06D5vvTaPAKuRwR2W96QuyaP9pYmFJbTpK/KvyLgAtqrFJnv6Lw2au+TaZoGqgJ59Nk
	nd5aBxJG0tQXjjwJsN3XChI4bq2BtSPrGFMFPdNzPKnEXJB17Y7D0bktM3ErpwJB6P3w
	iejdt8wEio6rsl5+qwzlzPKS+6NsyDsWi60RA+7MuFxRmCAJmjehTMIp6V4ZNH1W2+4c
	+s71Os7OqNpew3XyW8+KxB+rU1DEXKfg9NTSulf50yVdOMhsDDsjBkiTUZZPueIw1ThK
	vH+A==
X-Gm-Message-State: AKS2vOyzLM63XhFIIEHYGEFik3p6UF4sYXmxeS7sPK4xjXWY2YJbgb0Q
	yalB8FT3bWDKQpBtaJE=
X-Received: by 10.28.199.75 with SMTP id x72mr14708896wmf.17.1497868360182;
	Mon, 19 Jun 2017 03:32:40 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a28sm13766345wra.17.2017.06.19.03.32.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 03:32:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 11:32:38 +0100
Message-Id: <20170619103238.2626-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] connman: fix nftables dependency
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
X-List-Received-Date: Mon, 19 Jun 2017 10:32:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

When building with nftables support, connman doesn't ever
depend on the nftables command line tool.

connman will depend on libmnl and libnftnl at build and
run time. In addition, the nftables rules it creates
depend on various kernel modules being present.

Update the PACKAGECONFIG to reflect this.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ab18f2fe01..132a58ff40 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -51,7 +51,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 
 INITSCRIPT_NAME = "connman"
-- 
2.11.0


