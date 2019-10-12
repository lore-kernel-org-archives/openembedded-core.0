Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 481957F646
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 13:03:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y135so11219653wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 06:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fOS6heepyNJH6sEUxOiBtawb9p1pf76Ynm9nPG6nC20=;
	b=kz81UqzOwlcU0kGQN1u4+pwlV5us2LkX+PQ5z/3WWGaLXARt48KCNDsRF4RFZUsjfF
	zUG4rLFkr2mBcyjGMBV5QKzgZyE3ovLkILklp/5VtgzVvg2Oh3U6eKBjeROw/SP9oqKb
	WUqUE59HeBfjsYh6Z6lCJGCmfhCGbEkLASBT913+AGxUfI42FvCFIXiTWhwqdz/Ymfl2
	DTzPCoxm15houNsypfwxFyIfhJhRmuE1oYqWW58rXkVYLl7AFf35KLDfRAl2GrZQkfQR
	PnWsqUjN0o8pywy6Cd9E60d/JfWRD+ewrtevliNWH6ZutuhC2lMuEBsYGHiagOdHhttv
	F1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fOS6heepyNJH6sEUxOiBtawb9p1pf76Ynm9nPG6nC20=;
	b=OfT5XoBB+baaYkRY98WFOco5bjBbnGuRFDsJIsWZojwFWHDe5udZBQif2ybWfbNMPI
	AxN1Juwwkx/y6yWKYKDXlB3wbEeMf7rh0e1m9kTpZI1SF2+U30sZPlx5aVXjnjLwKZ9p
	ZmkKhzerc10uQHOsq6wpSuzvKe5K2lSZpvyOkCCDwIMSSrzGm5F3CNUoZ9B9/vkAA7Gw
	Tj29lY4TFfeE6Qq7bN7za8gDeX4UUgSbjotv7mroUr1mtXqtacTXLex3iGLx/nnY2f/O
	ta2E0u/qirU1PzcwGXm93BLSLWV54Zt3aKIW2rKv7P4f/aK50sPJS+q7qq/u9y2dDHl/
	tzBw==
X-Gm-Message-State: APjAAAWp2V6sOD7qod1ouu6kp/s5zLsRzPh4eb6sx4Fo1TIyoTy4JdZ1
	ub4GgmYUoTZ4KDKuyzkBYoWDvyK1erY=
X-Google-Smtp-Source: APXvYqyomi6fCKrhGI/nH4AZBDHmZDqer0KllSYLS3uAfq7jjCuDzYkqJSvn/5qK78IZGFXNj4zZuA==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr7586779wmt.167.1570885398509; 
	Sat, 12 Oct 2019 06:03:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q15sm22457596wrg.65.2019.10.12.06.03.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Oct 2019 06:03:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 13:03:11 +0000
Message-Id: <62720fb4e8ca20a700e96f720f4466ef5acd31e8.1570885333.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1570885333.git.Martin.Jansa@gmail.com>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
Subject: [PATCH][RESEND 5/6] kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
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
X-List-Received-Date: Sat, 12 Oct 2019 13:03:18 -0000

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
index e8ee556f93..8003d0a929 100644
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
2.17.1


