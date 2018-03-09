Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F88678461
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 10:55:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z81so3107674wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 02:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zEuHGeGBVr5rzym/aJGeeFgAdaqh+72VIwgpEfsI9O8=;
	b=fge/BUU8YPSUCDojQeJIqD6fkeaWCMX7AkszNd6wXsdDKuorsBZat1Q76dOvGm+FNW
	o38k2hWuy4bcgyRykzn8dQCuXnhEnoYrS+gyogwJ75IN1s6aVzwtvOcBnbGaaRuggpH9
	jxGN0CsmuXGmaeVddTHmMmwYn/jt81BVygDVI/jQT57GHk2yBRBjWyNw0TEAc9T9YQZJ
	OMUS9vVD9BdYcx/lPClL6YJdCHhB9E/JkQMhilCt60ItcJYAdBK0CehRrlhP7FVWkGyY
	BLriFHhbcYv5Yzg4EBxCn1PeVrWmfJDu1oQNiJNfPt3/nerUElMJfj0MI2lAnoAUXpEg
	HAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zEuHGeGBVr5rzym/aJGeeFgAdaqh+72VIwgpEfsI9O8=;
	b=er2Ey/uz8Gomev1aq9KSPTRKT5Lx0pMRAUDgJ2FPTBvJccvMWdLcM5Cf6hpZr2mTFI
	He6tUqu49LwmUN8pAuhE1GURnIM8E0N/wyKxGuHWawD7YQ/HKoHf8377+WFhZ2qD7mBe
	nNtxOCfegMI5fr/xV3TIUJE4YsmXEo5WQxRarflcKQpZssdxQLLLpeadBEz0eJJicD5o
	RgXi58AFj8zM/OzDdaV2kjzHAlbE8Cmx1zk/aAKSQjQ9cSQlLP6ab6kLBSWXQd1oWaf5
	eMuzArlKPVxLaIpj1K3B7oyTZ877wEkcQha5/w2y6Rr1uVP0o6eR2RVVYPENV6eih/06
	HOnA==
X-Gm-Message-State: AElRT7GKFMHitgo+uaY7Nr0ZJHd0PHt/BuDaMJkMIB58Otid9N8SzsOZ
	Wtes+frZJ55PvWRRxKRQkXpo53xo
X-Google-Smtp-Source: AG47ELv/XuSqPTLNBAbMbb8b0PXbpggAaGXaP4xKMdX24G2ajO9Bfp7iW61v9a5yqqF+7Sob7yxC1w==
X-Received: by 10.80.173.232 with SMTP id b37mr22612025edd.203.1520592917411; 
	Fri, 09 Mar 2018 02:55:17 -0800 (PST)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id g50sm731694edb.56.2018.03.09.02.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 02:55:16 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 11:55:14 +0100
Message-Id: <20180309105514.3481-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] openssl: fix libdir logic to allow multiarch style paths
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
X-List-Received-Date: Fri, 09 Mar 2018 10:55:17 -0000

The recipes were using 'basename' to turn '/usr/lib' into 'lib', which breaks when libdir is '/usr/lib/tuple', leading to libraries ending up in '/usr/tuple', which isn't in FILES_*. Change the logic to use sed to strip the prefix instead.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-connectivity/openssl/openssl10.inc     | 3 ++-
 meta/recipes-connectivity/openssl/openssl_1.1.0g.bb | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 02a0e16..a65f80c 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -157,7 +157,8 @@ do_configure () {
         if [ "x$useprefix" = "x" ]; then
                 useprefix=/
         fi        
-	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=`basename ${libdir}` $target
+	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
+	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
 }
 
 do_compile_prepend_class-target () {
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
index 53f397a..0fd6819 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
@@ -116,7 +116,8 @@ do_configure () {
         if [ "x$useprefix" = "x" ]; then
                 useprefix=/
         fi
-	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=`basename ${libdir}` $target
+	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
+	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
 #| engines/afalg/e_afalg.c: In function 'eventfd':
-- 
2.9.5


