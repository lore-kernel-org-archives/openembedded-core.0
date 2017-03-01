Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id EA8167755D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 17:20:09 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id k202so22555114lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Mar 2017 09:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ZVoZDCvsEU63OBkbzsQlyebl7u0e1RlJrZy36u5fAY=;
	b=rSKSNUpMZ53kZiTgBFKGrZ0gbVUADCxEQ5rXx5u+LYeRNpT3SEf5Fp5bB3GiKPYxHa
	Yp/quqneEcDL3+YkJFZDcaNaR1icsDTgsY41+JPYPqBsCFPzEf6LIhuHxDWWbqiFUeYV
	yelY2IgRVdesn8NIBXGqt8nODMAJjEbRop5UJAF0qK/+19/ybJ5cDJFBeKSBNomERCrB
	Q2em108mpoZOYSGM/a6QR86RO3ScRBXun1e+3wcbbomMuvsx9G6+WQ4X/dIlcqhekuPq
	5geVbV7OBW9E9V9WFvSV7gCN0v4TcLm151olzZlqAXc/3jHEZXVRnC00cQmJn+bJMTVn
	1EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ZVoZDCvsEU63OBkbzsQlyebl7u0e1RlJrZy36u5fAY=;
	b=q4Op/dpBH/XnkwcH7pVRXZAuCEtqAU+qy1ZgPuDI5vnpem0QqwNSkmHeWvG3joYo/b
	HAdsa0fNB6bL2Pz4VcfZ96w1nz+o/N+9S7hWIxpBWNtCUX2FfC8NtsRWRa+ODZ1ps97n
	SY56oUH02p+U/GW/EH4NhEOMAjwKlpwD2cZNecwUbk6AbbtZzwJy+kfUoD/o7Y+cqs53
	/O7IilMXZJQ0HSkNyi5gb7jEer/5R5Z5Qe5cdAkY+Tyo54ZKgrqERCnH65YJBpZ4mAIs
	UP2VjaAkm/oPtSVBbfbswenEyXTHQfpm+bR+iYi+cDGf9wVVVi8Jdxc5M63phnixEgXA
	NedQ==
X-Gm-Message-State: AMke39nlhzSiB8nqyJL7+uVc6dDe1MydIMh1vDYS7x2d6J4a4OY5HDm7ClN/JT7/40yKlg==
X-Received: by 10.25.159.16 with SMTP id i16mr3000303lfe.54.1488388810584;
	Wed, 01 Mar 2017 09:20:10 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	g16sm1211147lji.62.2017.03.01.09.20.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Mar 2017 09:20:09 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 18:19:58 +0100
Message-Id: <b1711469087d8a7d98062ebd948a7e89a5b467c4.1488388550.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1488388550.git.anders@chargestorm.se>
References: <cover.1488388550.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 4/7] classes/npm: allow installation of devDependencies
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
X-List-Received-Date: Wed, 01 Mar 2017 17:20:10 -0000

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


