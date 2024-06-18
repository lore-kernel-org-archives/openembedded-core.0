Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609A0C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 16:53:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.836.1718729626885525616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OYtCGJmE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EC1460002;
	Tue, 18 Jun 2024 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718729624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvjwiugxT5xDMQB9QbFzBEzJgfDa45DeqVFi+LdWny8=;
	b=OYtCGJmEg+Kx85Ov3RRy+5ElLyf0tqJwYk80hVadClW+Qy1mO4eQbfeRNisgz7GAo72BYU
	/S0YfzZWMrqs/mK9eNGHCe0XNp4JVSCa56urvs3hFYkS0etUmQsnWgoxQNYLHnMBS1JwKA
	ppnulHbPpEm0Y3HJmGdS8eq7Y0drhuHqkeDH6Geft2lGiAQo0JJRAQDt4CTnY5pNvjrfGj
	rwpOOBjtsm7y6OOg+B0go3zMtSBvDxQmLiK8Qb3eFWQNsbICWaHwrIm0pPeISZoM0lwCTK
	y0m6RKAGBtH3tDAPRP+X1nFQLA4mUlRztMjQ8SSAMbpjgr7qQ6IiEFQiGOsXrQ==
Date: Tue, 18 Jun 2024 18:53:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Hundeb?ll <martin@geanix.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] ell: add ptest
Message-ID: <20240618165343c5b1eb1d@mail.local>
References: <20240617133643.1856546-1-martin@geanix.com>
 <20240617133643.1856546-2-martin@geanix.com>
 <17DA243CAF230652.27929@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17DA243CAF230652.27929@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 16:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200879

On 18/06/2024 17:54:07+0200, Alexandre Belloni via lists.openembedded.org wrote:
> Hello,
> 
> I didn't test v2 but I guess it was not updated. This caused
> reproducibility issues:
> 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240618-sbhq7ol0/packages/diff-html/
> 
> and ptest failures:
> 
> {'ell': ['test-dbus', 'test-dbus-message-fds', 'test-dbus-properties']}
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6547/steps/13/logs/stdio
> https://autobuilder.yocto.io/pub/non-release/20240618-14/testresults/qemuarm64-ptest/ell.log
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6725/steps/12/logs/stdio
> https://autobuilder.yocto.io/pub/non-release/20240618-14/testresults/qemux86-64-ptest/ell.log
> 

It also breaks on arm and clang:

https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/508/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/142/builds/293/steps/12/logs/stdio

> 
> On 17/06/2024 15:36:41+0200, Martin Hundeb?ll wrote:
> > Depends on  openssl-native and xxd-native to allow generating
> > certificates used for testing.
> > 
> > Create the ${B}/unit dir as that seems to be missing with the automake
> > patches used for building tests separately from running them.
> > 
> > In order to build the test cases, both --enable-tests and
> > --enable-maintainer-mode must be passed to configure.
> > 
> > A few unit tests looks for files in ../ell-0.66/unit (i.e. $(top_srcdir)
> > in automake) when running. Instead of playing games with symlinks or
> > install paths, the "correct" path is just (re)defined in CFLAGS.
> > 
> > A (submitted) patch is added to make dbus-server run correctly when
> > testing with "nonetwork" passed to runqemu.
> > 
> > Skip a few tests that require additional kernel modules to be enabled.
> > 
> > Test execution time is about 10 seconds.
> > 
> > Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/recipes-core/ell/ell_0.66.bb             | 25 ++++++++++--
> >  ...-specify-tcp-hostname-in-dbus-config.patch | 38 +++++++++++++++++++
> >  meta/recipes-core/ell/files/run-ptest         | 23 +++++++++++
> >  4 files changed, 84 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
> >  create mode 100644 meta/recipes-core/ell/files/run-ptest
> > 
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index da6fa6ee9723..c60575a45cc2 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -15,6 +15,7 @@ PTESTS_FAST = "\
> >      cpio \
> >      diffstat \
> >      diffutils \
> > +    ell \
> >      ethtool \
> >      expat \
> >      expect \
> > diff --git a/meta/recipes-core/ell/ell_0.66.bb b/meta/recipes-core/ell/ell_0.66.bb
> > index 899e2f684936..d53db2edc189 100644
> > --- a/meta/recipes-core/ell/ell_0.66.bb
> > +++ b/meta/recipes-core/ell/ell_0.66.bb
> > @@ -10,9 +10,28 @@ SECTION = "libs"
> >  LICENSE  = "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> >  
> > -DEPENDS = "dbus"
> > +DEPENDS = "dbus openssl-native xxd-native"
> >  
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >  
> > -SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> > +SRC_URI = " \
> > +    https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
> > +    file://0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch \
> > +    file://run-ptest \
> > +"
> >  SRC_URI[sha256sum] = "7a78b757080ed6518c1c4fa26ad6a7a3d6e4e385386a20b6fb52379e7d1ffa36"
> > +
> > +EXTRA_OECONF += "--enable-tests --enable-maintainer-mode"
> > +CFLAGS += "-UUNITDIR -DUNITDIR="\\"./unit/\\"""
> > +
> > +do_compile:prepend() {
> > +    mkdir -p ${B}/unit
> > +}
> > +
> > +do_install_ptest() {
> > +    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
> > +    install -Dt ${D}${PTEST_PATH}/unit \
> > +        ${S}/unit/dbus.conf \
> > +        ${S}/unit/settings.test \
> > +        $(find ${B}/unit -name \*.pem -type f)
> > +}
> > diff --git a/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch b/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
> > new file mode 100644
> > index 000000000000..328e51683215
> > --- /dev/null
> > +++ b/meta/recipes-core/ell/files/0001-unit-don-t-specify-tcp-hostname-in-dbus-config.patch
> > @@ -0,0 +1,38 @@
> > +From d5ebbb5ea68848c5fad5517adf2f885de142a66e Mon Sep 17 00:00:00 2001
> > +From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
> > +Date: Mon, 17 Jun 2024 14:14:03 +0200
> > +Subject: [PATCH] unit: don't specify tcp hostname in dbus config
> > +To: ell@lists.linux.dev
> > +
> > +Testing dbus with no network interfaces available on the host fails
> > +with:
> > +  dbus-daemon[291]: Failed to start message bus: Failed to lookup host/port: "*:14046": Name or service not known (-2)
> > +
> > +Seems like "*" isn't a valid hostname in such cases:
> > +  https://bugs.freedesktop.org/show_bug.cgi?id=28979
> > +
> > +According to the linked issue, the fix is to simply omit the host= and
> > +bind= parameters in the config.
> > +
> > +Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> > +Upstream-Status: Submitted [https://lore.kernel.org/ell/20240617122939.1249697-1-martin@geanix.com/]
> > +---
> > + unit/dbus.conf | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/unit/dbus.conf b/unit/dbus.conf
> > +index 5fe41a9ad6a6..3651e44538b1 100644
> > +--- a/unit/dbus.conf
> > ++++ b/unit/dbus.conf
> > +@@ -7,7 +7,7 @@
> > +   <allow_anonymous />
> > + 
> > +   <listen>unix:path=/tmp/ell-test-bus</listen>
> > +-  <listen>tcp:host=localhost,bind=*,port=14046,family=ipv4</listen>
> > ++  <listen>tcp:port=14046</listen>
> > +   <apparmor mode="disabled" />
> > + 
> > +   <policy context="default">
> > +-- 
> > +2.45.2
> > +
> > diff --git a/meta/recipes-core/ell/files/run-ptest b/meta/recipes-core/ell/files/run-ptest
> > new file mode 100644
> > index 000000000000..5b3acdd98b8a
> > --- /dev/null
> > +++ b/meta/recipes-core/ell/files/run-ptest
> > @@ -0,0 +1,23 @@
> > +#!/bin/sh
> > +
> > +ret_val=0
> > +
> > +for test in test-*; do
> > +    case "$test" in
> > +        test-pem | test-key)
> > +            if ! [ -d /sys/module/pkcs8_key_parser ]; then
> > +                echo "SKIP: $test"
> > +                continue
> > +            fi
> > +            ;;
> > +    esac
> > +
> > +    if "./$test" >> ell_test.log 2>&1; then
> > +        echo "PASS: $test"
> > +    else
> > +        echo "FAIL: $test"
> > +        ret_val=1
> > +    fi
> > +done
> > +
> > +exit $ret_val
> > -- 
> > 2.45.2
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200878): https://lists.openembedded.org/g/openembedded-core/message/200878
> Mute This Topic: https://lists.openembedded.org/mt/106720607/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

