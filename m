Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id F37537F331
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 06:01:43 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id k1so7758319wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 23:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XhNJbalNHCvuKRwUzG+WAc/B4brQVo8BdrB4e2IiVUA=;
	b=Qdiy4RjS/xtfbs3k6qL4xjqu3a2l9KrEO3JfbKfeLDDTEXjt22Cs14ie1NTgI4zWrB
	2DquEnwI58H4HoibCNFgIu0JecNJeIMfzl0ppsbFiBF8HfY4GK2j1twwjdOPirS8p306
	vJXcJZZLBod+x2CCBsmc9kQbPpRZti4JmcBGwssQ3Ui0dTCFIpKEWvO3nTYEXfBB6mZ/
	hu53w5eFD3iQlcCpKKz4aphah+QnDCvC2JP1hj1kIS5PukKxQbai1Vm0/wRRq8ro5lq8
	yPjuV2I/krqZyV7n4mHeHbTEJekuZof0NnwfdCFJMs+b7A+I5NhIszyowJTPCCfn8Jpv
	ADig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XhNJbalNHCvuKRwUzG+WAc/B4brQVo8BdrB4e2IiVUA=;
	b=qmU3jhiW/BIUYaOkalBzxiq+cvNmh/njTtLvRXK6QIbIjqI/mVJUJIQw1wm9TZXFhv
	eODW+TrQfwArRPdmHq+oNS0PsLyvFFKygJV1BWKXBcNqWuP4v3NR19yM4alrcop7g5Ha
	tS4BlcrPMflU63SdRCRQ74Bcf8RoD1kW4eLpo6IwbG+EvxzVPkoZnYyRCnjB9pR1naBZ
	/lG5sSoYfCx7PjJYKHy9vlZpC2OjeXccdnSTEF7zwGKLNZcqZXrt6yDNhV8fsnrP+voh
	G1dk2Le7mg0pGL/QMik8dTfloLIjHsaROtfw9pfeanHmwgKivaLaKRSAdFaBUq++8gRd
	tRew==
X-Gm-Message-State: APjAAAUDf6f6hJtCF6mWoxx9r5FsZiq5myw29Vl6YBszylXvr4KfnLZw
	Y4BimdIZC2xOOSeBFsbdo+ANTGLSAY0=
X-Google-Smtp-Source: APXvYqxzju20DkAEKumHaaRP5k37HxTT2Lg3OCOkuZpTUxXtvIBcUuJ5E8hhCuGqa+cvcl9+1TNuTg==
X-Received: by 2002:a1c:356:: with SMTP id 83mr3084726wmd.40.1566540104530;
	Thu, 22 Aug 2019 23:01:44 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e6sm1859889wrw.35.2019.08.22.23.01.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Aug 2019 23:01:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 06:01:34 +0000
Message-Id: <4de3662e8e4bbe5e25641d513d73d2a38d98d92a.1566540028.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
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
X-List-Received-Date: Fri, 23 Aug 2019 06:01:44 -0000

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
index 8046a69d83..df203d2b4f 100644
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


