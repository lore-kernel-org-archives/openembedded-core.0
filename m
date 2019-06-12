Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 176257E6EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 19:48:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so19854wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VIKq7hJYCg/kMwhh8l5zAHa0c4XvK7yAyMfTsGxtCI4=;
	b=q2YBiW1KBpnPlKN0qCGINesudgpQnOHXuK/yxmn9NJ/0A+xeUZ8/JOsHzMGPur7Awn
	z1dpb2VKke6JiRuJ+Z/qIJ/kbNuDrA8IOv6Jpbqk1ubZXsCsFCcqEudTCPfdZv5mIFRy
	WmzDzOzwtdc/49RUoFBz4eQvxVO4H/EzitFOzWia7Kfg+WCdMjPhJe+YrEWXRUfm9uNS
	HQuD22ls/T0cQA/EEp2Y8/JZBMHRZCxTcvtPInH/whWzz/af9agJP2ipak161GRG6trY
	dgFZCvng79mlNYDhaj9yO1zZsCZECWBbhvvP+Ro/Y6U3bAvK+5NSVxzDrskpx+NEgw5r
	zoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VIKq7hJYCg/kMwhh8l5zAHa0c4XvK7yAyMfTsGxtCI4=;
	b=iZoow6NiZG7XFgUx6cKAgGiQQmYiNpHWOQXY/1OKPW6gAnfJwBVxkXQbuaRNMfK4ux
	GLYNqo8zY4w8w+QMFCASEgd57FPaE9vdKFcBGFVAHNrqaV0QrotuHcVyy1vX3EImDyOi
	IMwhICXMGDSzuGvY2yFvQ0sM6pozkKsk9AjoYwkTpJygQyUICY/PTqyzbNDC4vTf094i
	x7//GbxPF7V42X0Oxl5aop+joKSRaQvrYJjzvFLqPtDSa9jAc6yRcFZWZ/usEPth7m8h
	UAoPxbEAsM/JjEUy4vH6BWUOFJ3XjCoNgg0rxgAHSaNm22pmQKP4uwGM37lJGpI/GAXd
	qNuw==
X-Gm-Message-State: APjAAAXKKLpMZYFsQIwMzsi1qCaNKoq16m3iwJ1InzIiMVr4kVGXQYFL
	k76BquQi63i+dHHonFZn8it7tOXY
X-Google-Smtp-Source: APXvYqzm8A7dLgbs0I89RclKOTt1kt8DMTJUcuKJrcknO8olW7aUmPt9xC2b3h00m0F3jcq9XpXtbA==
X-Received: by 2002:a5d:6583:: with SMTP id q3mr60736166wru.184.1560368895528; 
	Wed, 12 Jun 2019 12:48:15 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e7sm495181wmd.0.2019.06.12.12.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 12:48:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 19:48:16 +0000
Message-Id: <20190612194816.27465-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] pigz: install pigz, unpigz, pigzcat in native and nativesdk builds again
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
X-List-Received-Date: Wed, 12 Jun 2019 19:48:15 -0000

* since this commit:
  commit ad1db93d134db1ec4f6d6598c9741dc13e82e1f3
  Author: Anuj Mittal <anuj.mittal@intel.com>
  Date:   Tue May 28 06:32:10 2019 +0800
  Subject: Revert "pigz: pigz is not gzip"

  pigz-native and nativesdk-pigz no longer installs pigz, unpigz, pigzcat,
  so scripts explicitly depending on pigz-native and calling pigz started to fail.

* reverse the logic
  - all the builds install pigz, unpigz, pigzcat
  - only the native one installs it as gzip as well

* it could be optimized a bit more to create gzip as just a symlink
  in native case as well, but they are in different directories
  (pigz in base_bindir and gzip in bindir) and it's only 130kB..

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/pigz/pigz_2.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index 974c035147..6d62ce6cc5 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -23,7 +23,7 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 inherit update-alternatives
 
-do_install_class-target() {
+do_install() {
 	# Install files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
 	install ${B}/pigz ${D}${base_bindir}/pigz
@@ -31,7 +31,7 @@ do_install_class-target() {
 	ln -nsf pigz ${D}${base_bindir}/pigzcat
 }
 
-do_install() {
+do_install_append_class-native() {
 	install -d ${D}${bindir}
 	install ${B}/pigz ${D}${bindir}/gzip
 	ln -nsf gzip ${D}${bindir}/gunzip
-- 
2.17.1


