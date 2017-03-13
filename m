Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 80E3C7770F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 10:01:58 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id y193so61279492lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ZVoZDCvsEU63OBkbzsQlyebl7u0e1RlJrZy36u5fAY=;
	b=py8NuFHf5un0KU7Yfv21fDr7LUwv0PxsfUh2Po1i8UmLwTUVeekV4xFlRC2KC+2BzL
	UovRNWiEaUa4d76uak3N53rsFukmENE49smTW2F5WEmUBqzZzGnKnofg009HehraWPRS
	HE3PbNelJFQN+ZtdxOEmnLWtPCSXdvbIU82sngfw2eN0RLIUbmEsJG1iMGv+N22fA0Lv
	dzkWN5k04aS7P2Lvlg3outauKgxto80ckn2t/cCiFFPH3UD2d5hse83mpBmjOtmZwVR5
	E+KpERaZVoknOsq9oXdHAdgK+sJvhJ2tpzlXtb7Juncpz0+meRMaFNvMXEASqx4PkaJP
	X0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ZVoZDCvsEU63OBkbzsQlyebl7u0e1RlJrZy36u5fAY=;
	b=pHsFmM2JtPepvPHhv1fjowOw5PZn/ltGWXa2VPAgxJL8vlrJMlBJm9n5j41UsiVT9D
	X6n0NT4kdQlqbdB6AsngmCaMVn48UfN7IcPAbzTSqc6CRPdS0ab0TqZk4WDYOyF6qpuY
	Y6Q31zfBMT6bcxfYOED492c6MVDHY2gD3N5curXYD0AlkE+/uRftNAm3san5MmastaqW
	m3x0jvLQ+7xCV1NLVAVlzuyYINk3Dwyxh12hWJfCFtndVh0oTVMVWrDBGMRey7ITZUN6
	K+uSQ8xld5DdcNo9L/OFolSsN8baf4GTlF3vLc4EJicGhJoNQaNobHqQt813OQh3gP+F
	+Xug==
X-Gm-Message-State: AMke39nZHbqA2Gv24gY/ImvolgPoN8/xD8zPJffC/Mi+/QeFBcWKdDm640Sc+rfsZfomBg==
X-Received: by 10.46.87.14 with SMTP id l14mr9799504ljb.93.1489399319276;
	Mon, 13 Mar 2017 03:01:59 -0700 (PDT)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	g102sm3547698lfi.38.2017.03.13.03.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Mar 2017 03:01:58 -0700 (PDT)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 11:01:53 +0100
Message-Id: <a1008b68678b680897904ca9979ddd527f9a4a26.1489399045.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489399045.git.anders@chargestorm.se>
References: <cover.1489399045.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 2/2] classes/npm: allow installation of devDependencies
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
X-List-Received-Date: Mon, 13 Mar 2017 10:01:59 -0000

Often, eg when using angular2, there's a need to install also
the devDependencies.

The default is to keep the old behaviour, to not install
devDependencies.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/npm.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index c538040..a69bedb 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -14,6 +14,7 @@ def npm_oe_arch_map(target_arch, d):
     return target_arch
 
 NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH'), d)}"
+NPM_INSTALL_DEV = "0"
 
 npm_do_compile() {
 	# Copy in any additionally fetched modules
@@ -23,12 +24,20 @@ npm_do_compile() {
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
 	export HOME=${WORKDIR}
-	npm config set dev false
+	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
+		npm config set dev true
+	else
+		npm config set dev false
+	fi
 	npm set cache ${WORKDIR}/npm_cache
 	# clear cache before every build
 	npm cache clear
 	# Install pkg into ${S} without going to the registry
-	npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry install
+	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
+		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --no-registry install
+	else
+		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry install
+	fi
 }
 
 npm_do_install() {
-- 
2.10.2


