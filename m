Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA0A78296
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:55:40 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k10so6860647wre.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M0s0DoqN1hPDBmgCUacfiiRcersPsFI63AHib2qKsTA=;
	b=mIEiHk7DVR32YFw7sYyzeUfd/d1wDnavOcyfjBzQOMP66N+tHJU5F5JxomyQVZGPw5
	tATJTsU6cmr47+8uObYf8epaqBtjM5d60+Fg79wONMmaIIPbPrxj1XuBOKuWwDEDKBlJ
	HFrMW0VZeCgyuUiolf7Gi2jYa0KIFJTk8hVD+GN3hngtECb5mN8VdBbhvMkSuSJ2fYaI
	cGHXP7Z/yNg+vA3/P/++QayAxj8bvofTTuuTzLmbgrchZxxrNkNb5USxg9L9hQs1/37Z
	2bzucr6zKffKZ8ZrZf8xUcPVDJTeP0SJXh+s4XPCZ8Msu6apmneO7Tnjnr8v+1txCbrB
	ZXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M0s0DoqN1hPDBmgCUacfiiRcersPsFI63AHib2qKsTA=;
	b=o6YfBcksPR0tYJkIg6Tjs4Km8tesdRzGXaEQOpyWpH7BZCjuIclCZ4BnYncxPfk5Oj
	3nwd+yhM1NOm9RwnFA4ntkG9LD78ROW88UroC9ccnxB0McMlrZD+k6hVAsGa0CI7y3MI
	83/RV8mZc4lDPPj/Vk6YKLeWs3/GjX6st+i3oVdB4Bowxyp7aB28APDEC327yNrIiXnZ
	3K7nA6KwRzv+/yzAwRKiBloCT8MgVIsfRloIpw4Oh560x/S1oOeEiNSiYwgpTK25RDu8
	M4WPALvR61i736vivkYTEcAHy6bXmvkcuwEGlSHbqTDasbtFPbyMLQ1P5QhAAuTvsmcW
	2r1A==
X-Gm-Message-State: AHYfb5gpEkX63c+gcpdmb1NA5rrv1rTGMtmVmsbPkLhf/orPmsTYFJkd
	cT3mLaoL8x0DuQON
X-Received: by 10.28.29.130 with SMTP id d124mr6476832wmd.78.1503348941263;
	Mon, 21 Aug 2017 13:55:41 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	z17sm9906671wmz.37.2017.08.21.13.55.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 13:55:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 22:57:21 +0200
Message-Id: <20170821205721.20086-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821205721.20086-1-Martin.Jansa@gmail.com>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Mon, 21 Aug 2017 20:55:41 -0000

* build with gcc-7 fails with:
  | ./config-util.h:1504:48: error: this use of "defined" may not be   portable [-Werror=expansion-to-defined]
  |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
  |                                                 ^~~~~~~~~~~~~~~
  and we're not building on Apple or BSD, so we should be able
  to just ignoreit until it's resolved properly in some newer gnulib
  and imported from gnulib to grub-2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index b949bebced..45f4c1ed34 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -36,6 +36,12 @@ EXTRA_OECONF += "--enable-efiemu=no"
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
 CFLAGS_append_class-native = " -Wno-error=trampolines"
 
+# this comes from gnulib and it's used only for Apple and BSD, so we can ignore it
+# ./config-util.h:1504:48: error: this use of "defined" may not be portable [-Werror=expansion-to-defined]
+#             || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
+#                                                ^~~~~~~~~~~~~~~
+CFLAGS_append_class-native = " -Wno-error=expansion-to-defined"
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
-- 
2.14.1


