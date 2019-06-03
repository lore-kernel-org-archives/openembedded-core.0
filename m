Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5F37E334
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e6so7193941pgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gHY7ipFoN5GvmLVPhZKZhqbq5p043Zdk4QuQSyOY7X0=;
	b=D2y7bjkpul8eMRrB0FOUeYHrX1paN9xMpAww5yzSKPhpVWNF7r6FGnJZk9tNhk89lf
	+upfm8Zx3IZZLcK4zrGGNqmnrmvNq1eXPmipx1z6N1BBeg/l2qzyLoZRpHRAVtcZjL0r
	EHJgYj/aO9fooAjbScPRAz1Fz5mkV9OSvooD7ZqGp2uLCA7OutB7bj6y4WY7rXYxctWW
	7//FYR7mKgGKe0foDiGbtnblW8S5X/sQvvZAjhUeOk9BhfIkJ1aecm4Xt2PnM3JK2fYK
	UpMgAulG5kexS/5GjtayV55MxYI90/xIIwAom9LSTaxUNxgmTLeAfwN8pkQJuNatTrTi
	MWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gHY7ipFoN5GvmLVPhZKZhqbq5p043Zdk4QuQSyOY7X0=;
	b=aN1ygDykgkG13LHuH7yEi3ehkYI4v6/Vnh9rD8dqqqJ+sgfHduZ3PbWBtQZvPcKdPo
	JlYaouOOVw2QsD7zhZTGRh+xA0Cf5xNnq2ppzNTmpRJ3lFJ/PHhTedgLy4fWunencvpn
	5O0Wz+jC+2+0d7rznCNWxfV/yuKsxGhaPW9lbZkY4xOYXz3qbwtzDdnTzwzT/3M2Gu57
	r7OtB2xnluVPGryT8LwUMaUYbLV++zPYCpC03kruuER4Se24KHdAEY4CWt14M9iQKpUy
	IXp4QSZR45CExeSljgjeskhYmmT2nCTbBdrQRwe9HPGoz76VtEfNo2DEY3r7RQmT6N94
	BrgQ==
X-Gm-Message-State: APjAAAWeLTDFcq6X6vgGjh++gPSJMAPVmu/YLS+0QGkFfe0pr8gQE0lM
	Uu5AzdLHL3iurrO8KCEwKwuUcgob
X-Google-Smtp-Source: APXvYqyoyo9OVFBF775sA4U8+ZyifLNS171hJL6sn9V1SeDezyD6/Ind0Hkepq7AxbZq4NC1hxM+5g==
X-Received: by 2002:a17:90a:62c6:: with SMTP id
	k6mr29413954pjs.7.1559574439251; 
	Mon, 03 Jun 2019 08:07:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:55 -0700
Message-Id: <67846b3b2d2d45401d500bff5cf3d4d71c003f7a.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 12/21] npm: fix node and npm default directory conflict
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:18 -0000

From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>

Fixes [YOCTO #13349]

When dealing with node modules which have declared "bin" files [1], npm
will create a link in '/usr/bin' with a relative link to
'../lib/node_modules/<module bin file>'.

The commits e9270af4296ce2af292059617a717e42fc17425c and
2713d9bcc39c712ef34003ce8424416441be558e explicitely use
'/usr/lib/node/' as install directory, but does not care about the "bin"
symbolic linked files.

In order to keep valid links, and to keep it as simple as possible, the
path '/usr/lib/node_modules/' is used as install directory for npm. And
a symbolic link is created to have a valid '/usr/lib/node/' path, needed
for node.

[1]: https://docs.npmjs.com/files/package.json#bin

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/npm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 3dd2d13..9703f4c 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -10,7 +10,7 @@ def node_pkgname(d):
 
 NPMPN ?= "${@node_pkgname(d)}"
 
-NPM_INSTALLDIR = "${libdir}/node/${NPMPN}"
+NPM_INSTALLDIR = "${libdir}/node_modules/${NPMPN}"
 
 # function maps arch names to npm arch names
 def npm_oe_arch_map(target_arch, d):
@@ -55,7 +55,7 @@ npm_do_install() {
 	mkdir -p ${D}${libdir}/node_modules
 	local NPM_PACKFILE=$(npm pack .)
 	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPM_PACKFILE}
-	mv ${D}${libdir}/node_modules ${D}${libdir}/node
+	ln -fs node_modules ${D}${libdir}/node
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
@@ -85,6 +85,8 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN} += " \
+    ${bindir} \
+    ${libdir}/node \
     ${NPM_INSTALLDIR} \
 "
 
-- 
2.7.4


