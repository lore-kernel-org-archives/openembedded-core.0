Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 68C5A771C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:36 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o6so46540020qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=340fvUQlt7JhS1xtRQYOSmeEWrk+1Lhk/hDO+7PQpi0=;
	b=GDmNnuKxEqHjLBLl/JWiJRnsVv0Pme3Ye4BDAEKfziwhlyZhQtMqvUtMj11Hq8aiGO
	prynlLCGdunxvL1bwf1X3RQ/KDkcTbDfnwyoVpnPW49V1duQnZz8FXVEFxVblLzgx5uV
	NPuDVfIh+IHNQzqem7iC6ZbNRF3eEZ8dWFlbsk6jvFikv3h/WEE7qae+aj1k9iI6LRQL
	r4b5mdUL7QBWn1Nk7VaOqJpOzSOOPj0PKWd/V8qFsM9FM1zjLkan2VjIeYLi4c3K2u1Q
	cmpFA/ad7wmE81/CAVimNNXdhBngLphWSlczjyM39HtnYSrgZlUrkIvbHNQtwgcwHuW+
	pf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=340fvUQlt7JhS1xtRQYOSmeEWrk+1Lhk/hDO+7PQpi0=;
	b=SK+vUZpKGfOtyIbqSjBfZKeUHYLbcyjliFXMFDKKb8ipZyUO5M33glwShMMckCgvW4
	9Bstqq/Lly4Jafao65fjws1DLKwuil8OwloE3keXlVk5SF6Rew6wRHgUENpZVxeYo26Y
	/0B75fPn++X7OLQGegHN7ynv7OrcR7Pa6oxv0x0RkKyh7ysYVUJ4mapbyaZQF+7nR+bo
	dUDkKHCOTIEJTJBaFpijofJ8T5CRMMTWxCh056ejwB+05AWzampkgvMlwCXPGOplkUtz
	fByRW+AyxBFlkfAbx2qLrsBizIrQWeteBda6cJLci1EI3PpBzbbvz+Kt05Ff0qkeKxBy
	ujjA==
X-Gm-Message-State: AG10YOR4CgW34qWEEe2J6Q5oNiP6hdJUAN4XcBB+zjDuEfiLZgrUzwlWrMkqyHzWKymqBw==
X-Received: by 10.55.33.229 with SMTP id f98mr25947856qki.18.1454303317723;
	Sun, 31 Jan 2016 21:08:37 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:27 +0000
Message-Id: <a4966fca6efdd035a8b661d1451723020e7ca0e9.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 6/8] db: Use cross libtool
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:37 -0000

db is not reconfigured like usual autotools based components so it
generates its own libtool, and this libtool is not equipped to do cross
builds, e.g. when building using clang on musl, it misdirects linker to
use libstdc++.so from build host instead of target, the reason being it
does not understand sysroot.

Use cross libtool instead to build the target versions

Fixes errors like below

| libtool: link: arm-oe-linux-musleabi-ranlib .libs/libdb-6.0.a
|
/a/builder/mnt/build-oe/tmp-musl/sysroots/x86_64-linux/usr/bin/arm-oe-linux-musleabi/arm-oe-linux-musleabi-ld:
error: /usr/lib/libstdc++.so: incompatible target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 1 +
 meta/recipes-support/db/db_6.0.30.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index e8b814e..3dc1da5 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -76,6 +76,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
+EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index db9f0ab..eac84b8 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -83,6 +83,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
+EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
-- 
2.7.0


