Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA4DC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 07:26:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.15433.1718781984936346251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 00:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D8I9NI0J;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9CDD1BF205;
	Wed, 19 Jun 2024 07:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718781983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNOxfCGJTv18sKlXFY2bKpXNEdpXBhnA9ukIsxcTdhQ=;
	b=D8I9NI0J3xO0AuE2xypq7qVVrItOuzDYVsCvYiE9LCnAR6MNGZhNXtu21Km1GprPlmEb0w
	E1WTcIf77GQjWlKz8diSFKZ8R2KSovLPh1pEhzzmEal5OAw8k8sz6KPOssLFTe/2uUX5Ye
	hwPLnyJPzqSejk/VjZiJMTg8KaCY0KgW8HPDsnBn0x5bwcER7UQ3PO93IuswOsvGXsAsjf
	tlMTcGOAWw0LoJV4j4HCzthqIJu+mqHGxUuTyOWRAJonbXi79H+9OrTTu07hdTnZ9Hit9n
	kDyh5NKk000NOjUWFSZ04AlSpduSDDUqgEvNA+MjHxNhO7YfuhLRwcy7CrolXw==
Date: Wed, 19 Jun 2024 09:26:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Hundeb?ll <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/3] ofono: add ptests
Message-ID: <20240619072622774b7022@mail.local>
References: <20240618073439.2068944-1-martin@geanix.com>
 <20240618073439.2068944-3-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618073439.2068944-3-martin@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 07:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200885

ptest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6727/steps/12/logs/stdio
https://autobuilder.yocto.io/pub/non-release/20240618-20/testresults/qemux86-64-ptest/ofono.log

This seems intermittent as it didn't happen on arm

On 18/06/2024 09:34:37+0200, Martin Hundeb?ll wrote:
> Install and run the unit tests already provided by ofono. Test execution
> time is about a second.
> 
> Signed-off-by: Martin Hundeb�ll <martin@geanix.com>
> ---
> 
> Change since v1:
>  * add missing run-ptest file
> 
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-connectivity/ofono/ofono/run-ptest | 14 ++++++++++++++
>  meta/recipes-connectivity/ofono/ofono_2.8.bb    | 12 +++++++++++-
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/ofono/ofono/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index c60575a45cc2..60cbea0f19e9 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -53,6 +53,7 @@ PTESTS_FAST = "\
>      lzo \
>      m4 \
>      nettle \
> +    ofono \
>      opkg \
>      pango \
>      popt \
> diff --git a/meta/recipes-connectivity/ofono/ofono/run-ptest b/meta/recipes-connectivity/ofono/ofono/run-ptest
> new file mode 100644
> index 000000000000..ba0f66ee4170
> --- /dev/null
> +++ b/meta/recipes-connectivity/ofono/ofono/run-ptest
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +
> +ret_val=0
> +
> +for test in test-*; do
> +    if "./$test" >> ofono_test.log 2>&1; then
> +        echo "PASS: $test"
> +    else
> +        echo "FAIL: $test"
> +        ret_val=1
> +    fi
> +done
> +
> +exit $ret_val
> diff --git a/meta/recipes-connectivity/ofono/ofono_2.8.bb b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> index 809485d42178..f54367848f05 100644
> --- a/meta/recipes-connectivity/ofono/ofono_2.8.bb
> +++ b/meta/recipes-connectivity/ofono/ofono_2.8.bb
> @@ -10,10 +10,11 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
>  SRC_URI = "\
>      ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>      file://ofono \
> +    file://run-ptest \
>  "
>  SRC_URI[sha256sum] = "b5aef455b3a374ce43bad43c2ade9d0430d9c0d28952385c44ac7d0dc933bbb8"
>  
> -inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
> +inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data ptest
>  
>  INITSCRIPT_NAME = "ofono"
>  INITSCRIPT_PARAMS = "defaults 22"
> @@ -28,11 +29,20 @@ PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"
>  
>  EXTRA_OECONF += "--enable-test --enable-external-ell"
>  
> +do_compile_ptest() {
> +    oe_runmake buildtest-TESTS
> +}
> +
>  do_install:append() {
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${UNPACKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
>  }
>  
> +do_install_ptest() {
> +    install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/unit -executable -type f)
> +    install -m644 -Dt ${D}${PTEST_PATH}/unit ${B}/unit/test-provision.db
> +}
> +
>  PACKAGES =+ "${PN}-tests"
>  
>  FILES:${PN} += "${systemd_unitdir}"
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200861): https://lists.openembedded.org/g/openembedded-core/message/200861
> Mute This Topic: https://lists.openembedded.org/mt/106736942/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

