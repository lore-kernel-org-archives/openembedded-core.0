Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAB547F370
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:17:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so4654496wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lHPXWrTZlQk2DmleQxnjhxVX1IynQRPEuB3pSEzYWxk=;
	b=tka7fDG7rDN39EPhPk5CJ7sCxbFUJyacVpm7FW1cHNZ9WPz6yTgp5b7wAKbI6Uu9Z0
	242Blq/dvX8c8K911su0sMPK9+rc6uQZR/1bw5FfJ1x7PS3T8HT72aNUxEg65a0Cn/G8
	JNvMkDDqFv9lQTiaAgXDhgNIf0ZISNvajMQLn71Cb9eyRuWasg2F0Y0hC1mMp8DCAWYP
	A+30VtUc3SPDl8uKWF0OkIdRr4gc3fFVsFuC8Pb7oYU9B8ecnPi7jWKFebvWd5fhGYRW
	wForYomHLOrZYCd+G7o9LSJ3WDfO6SJcrilWazRx6V8PgT4e9A1bnPFQ6feOVrJXqNl2
	jlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lHPXWrTZlQk2DmleQxnjhxVX1IynQRPEuB3pSEzYWxk=;
	b=LxeynB6GrZJeqR6utgZVpbWd/RbbP7f9VG/dWt2aUd6XOYnuNKPN11o9KqkZISSqmw
	s3RB0Q7RpTMacmTbCATz93/Jkve5MKi8z4kSAtA10gX0ppoRHFZHPFaE9fBTzOtoPMAH
	374cl0F+vdOmjKeJeCg7yLsUz3+0Rlg5M/jjX+O/vgYefxApNWHlBP9VPDc8Dxq0riZa
	lHLgbCV0wACC2kgUo6t2Yg1ldUCM9sHB90lKeb3JSHInyyo0vehmaBPd+0ZGNEwR2TOH
	O2RYn6zKrEAG7rfLfV+ypDjebfF0eppteT2JLswNRud0SuaL7IrBmVi1qB07makl0VwS
	gMlQ==
X-Gm-Message-State: APjAAAVPPAxOmC2rYEIN/Fyi9JkbJOn6/ll8eF4kRQuQmq3fqeDETJ5A
	JtupbWSnsV5vCedJ233y5mu+tIDxwK4=
X-Google-Smtp-Source: APXvYqzZqbY3P1DlmAqPwHCrshynh2ueCMYpY7Ax2AFqyYudQWo5XoWuuEu7NBtk9bZFZhUwNsuoJA==
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr8495363wma.53.1565975825251; 
	Fri, 16 Aug 2019 10:17:05 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b4sm2896009wma.5.2019.08.16.10.17.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:17:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:17:01 +0000
Message-Id: <761ae5220450b4f031e7e554ace9df00138ddcc6.1565973637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565973637.git.Martin.Jansa@gmail.com>
References: <cover.1565973637.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 5/6] kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
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
X-List-Received-Date: Fri, 16 Aug 2019 17:17:05 -0000

* do_install doesn't use whole "version" as do_deploy does, e.g.
  ${PKGE}-${PKGV}-${PKGR}-${MACHINE}
  it installs only the files with only ${KERNEL_VERSION} in filename or
  path, so it doesn't need expanded AUTOINC value in PKGV nor
  EXPANDPRAUTO in PKGR like do_deploy does

* it was introduced in
  http://git.openembedded.org/openembedded-core/commit/?id=1392f959cb8cd50b5a4492899e54f3ed68ef56d7
  but it's not clear why it was needed back then, but doesn't seem to be
  useful at all currently, only causes multiple EXTENDPRAUTO bumps every
  time different linux-yocto is being built.

* There are currently 4 EXTENDPRAUTO bumps during each build as shown in
  prserv:

  $ sqlite3 cache/prserv.sqlite3
    SQLite version 3.27.2 2019-02-25 16:06:06
    Enter ".help" for usage hints.
    sqlite> select * from PRMAIN_nohist where version like 'linux-yocto-dev%';
    linux-yocto-dev-4.19+gitAUTOINC+57b791cb9f_122d468967-r0|qemux86|20601304a6e4fa0b7ac13fa1262040c976c862d177077799dc15492215fa51df|0
    linux-yocto-dev-4.19+gitAUTOINC+57b791cb9f_122d468967-r0|qemux86|2820d331b7eba5165943bc016a1c274d42e7605e24244873b15cc1c9c6f657e2|1
    linux-yocto-dev-4.19+gitAUTOINC+57b791cb9f_122d468967-r0|qemux86|4f29da98c268aa5bf1c4767bb2bb157fc6077b1d76dfd434028b18bf3252e0c0|2
    linux-yocto-dev-4.19+gitAUTOINC+57b791cb9f_122d468967-r0|qemux86|23d8d17b23bc6db1dd7f0f30086f0ec6ade2b2180e787a78d89b6e43b8c4fad6|3
    linux-yocto-dev-5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0|qemux86|2a23d8783f794b3e79b438889ec60661ca635f9ec09d0519176a31d832377f1c|0
    linux-yocto-dev-5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0|qemux86|dafc2a636e7e18357b7efbf99981af45234105c3f46b056edfd2142d5a5d4993|1
    linux-yocto-dev-5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0|qemux86|09798369f303700fb8d42550d959e310a05fb4573b71646df51acc00d3a6fe89|2
    linux-yocto-dev-5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0|qemux86|dab07eb869034df28be59ae13914989ab88bdca5a9a9362ca96b4eb38180afd7|3

  the TASKHASHes correspond to do_install, do_package, do_deploy, do_deploy_links tasks:
  $ ls tmp-glibc/stamps/qemux86-webos-linux/linux-yocto-dev/5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0.do_*sigdata*{2a23d8783f794b3e79b438889ec60661ca635f9ec09d0519176a31d832377f1c,dafc2a636e7e18357b7efbf99981af45234105c3f46b056edfd2142d5a5d4993,09798369f303700fb8d42550d959e310a05fb4573b71646df51acc00d3a6fe89,dab07eb869034df28be59ae13914989ab88bdca5a9a9362ca96b4eb38180afd7}*
    tmp-glibc/stamps/qemux86-webos-linux/linux-yocto-dev/5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0.do_install.sigdata.2a23d8783f794b3e79b438889ec60661ca635f9ec09d0519176a31d832377f1c
    tmp-glibc/stamps/qemux86-webos-linux/linux-yocto-dev/5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0.do_package.sigdata.dafc2a636e7e18357b7efbf99981af45234105c3f46b056edfd2142d5a5d4993
    tmp-glibc/stamps/qemux86-webos-linux/linux-yocto-dev/5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0.do_deploy.sigdata.09798369f303700fb8d42550d959e310a05fb4573b71646df51acc00d3a6fe89
    tmp-glibc/stamps/qemux86-webos-linux/linux-yocto-dev/5.0~rc6+gitAUTOINC+e721b5d6ab_8b7d7ef74a-r0.do_deploy_links.sigdata.dab07eb869034df28be59ae13914989ab88bdca5a9a9362ca96b4eb38180afd7

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bda3af2950..e41adcbebe 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -383,7 +383,6 @@ kernel_do_install() {
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
-do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
-- 
2.17.1


