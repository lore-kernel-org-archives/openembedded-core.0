Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60DEF7FC23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:41 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so11361410wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Tfzcu8sGMnxcWN2dI7dE6a33hU46UMuRj1/GwcgImlk=;
	b=Z01xr6ICOxrFMi/ePFH7S28pc5y0MY8LMkGliJixrYXjOJbTLIsCZSP6ZOiVPZGR+m
	sFvUsU5jLvFSnJxuvqEf84qNITzCYNKeKluVvkI273pOMoiibI+RjNC0WScdwvcC7iSL
	hP/mE42hGqlUKJ7sUwGd8PiYKi0Xsb76QYdaUt1MF9JhHAEy8CtyfvdWjqyAjzSZIk4H
	m+NHclgFO6KGf4eLvF8UZUcTlizVuj/D0AIi+58unOi5oOwZRDqL9sYFrwU/6CaN0MKv
	1+FtvIgZpANh19A5mtO8lBIlQIvzM5Qkv9O6eeoI7EpBhMk7Elyy20Kg1+O0yo4pBvwV
	y4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tfzcu8sGMnxcWN2dI7dE6a33hU46UMuRj1/GwcgImlk=;
	b=EFkySZheesW5mExTsd50c5U2qVDEyeEPohZ2UbQIO0WN3ziCjmrE7bSQDPpp5dsAG5
	eX0FCIMwdXZ2fSq9a+nvtC/DNUu1GUU4rUn03icOVqg/PfHTSNz+JgnKtAalDTd11gNZ
	cCOa9D7x+sabrsjDiymBRhOs0IoJjASmyg0zzE51RFTOgN0S7IMjVxCyjMGk006u8OBt
	sW7Oy1kgMA04k6YQAgwxIl4cGK/srgMsYZtRy8vzzRju4D5NArfAQew/2rm/5wZCEGwh
	u+kAt9H6xaC3zDF+6aAycZxrI5+sb9SwN1euDLrITZ4oMCjW3h+IMccGucswB8BgaxP1
	uuwQ==
X-Gm-Message-State: APjAAAXPhoVQxYy5WZyUxTgrgvlklnqBAuuU5yfnv0O05VVpYu9/KFLY
	yi/fauw6Kg3yaK9QUQZVKR87EC9bJks=
X-Google-Smtp-Source: APXvYqxLtgZDDnjU6GvEWjUZbK+cbwmhotb9AYVXkXhtqsF3YpY/dm5sEIWhjKBz+itXt5urzUoxng==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr23466565wrj.261.1578993161774;
	Tue, 14 Jan 2020 01:12:41 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	i8sm19202388wro.47.2020.01.14.01.12.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:24 +0100
Message-Id: <b1fd3a131d37085acd72ef1e5b5d8add51b15fbb.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 5/8] kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:41 -0000
Content-Transfer-Encoding: 8bit

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
index ff5673fb56..249704b6f8 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -385,7 +385,6 @@ kernel_do_install() {
 	install -d ${D}${sysconfdir}/modules-load.d
 	install -d ${D}${sysconfdir}/modprobe.d
 }
-do_install[prefuncs] += "package_get_auto_pr"
 
 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
-- 
2.20.1


