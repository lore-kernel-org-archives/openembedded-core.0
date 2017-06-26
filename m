Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 153CA7199E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 10:08:48 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f134so616972wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 03:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bxnaPjeqFFpNtYkgBNSemJZiIL3ghKZIbfJK4zytMUk=;
	b=GAQbo5NoBQ4lEfBnDDqTrXbi7PV0w0Bn9cS2IiCZL/U6rWPAM3K9mHiJi8k1GOw8Tk
	wtz6PE/2N9HkLhfGAP7uk0CKlS+6hlKi0BaAbR+yLlRbmWehsWthxtP2LriNBGR1BqCQ
	8mGdCHM6bHHvsECPtkvpvPyAWXg686iVkncbOK+X7mC+SMmx1A8XyuYoRbUwPjU6Srao
	bzLAwR7WkkoUN2fmaTQIjJqnQzYE24YdD8wNlAJxR9bXwlglzJL5xEs2+XF5c5zdlyC3
	EJRs/TVwkAypeVsN2yUT8fCLn3y4JTkqle9WNRWMO/7JA6Ne8SM6VoPXEJF1WsqsHAAo
	UtPA==
X-Gm-Message-State: AKS2vOzNMVZMjy6xbG05cR7o1r/VYSVmmLMBWw83fXGH5+Wgjqz5H1ld
	TTRD8fdkULrlOumenBs=
X-Received: by 10.28.18.201 with SMTP id 192mr12821332wms.2.1498471729576;
	Mon, 26 Jun 2017 03:08:49 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n31sm14295840wrn.59.2017.06.26.03.08.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 03:08:48 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 11:08:46 +0100
Message-Id: <20170626100846.3950-2-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626100846.3950-1-git@andred.net>
References: <20170619103238.2626-1-git@andred.net>
	<20170626100846.3950-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] connman: fix nftables dependency
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
X-List-Received-Date: Mon, 26 Jun 2017 10:08:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

When building with nftables support, connman doesn't ever
depend on the nftables command line tool.

connman will depend on libmnl and libnftnl at build and
run time. In addition, the nftables rules it creates
depend on various kernel modules being present.

Update the PACKAGECONFIG to reflect this. We use the
just introduced RRECOMMENDS field so as to make the
build still succeed if those kernel modules have been
linked statically into the kernel, i.e. when the
packages haven't actually been created.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ab18f2fe01..141a464121 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -51,7 +51,7 @@ PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2t
 PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
-PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,nftables,nftables"
+PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables-ipv4 kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-meta kernel-module-nft-masq-ipv4 kernel-module-nft-nat"
 PACKAGECONFIG[iptables] = "--with-firewall=iptables ,,iptables,iptables"
 
 INITSCRIPT_NAME = "connman"
-- 
2.11.0


