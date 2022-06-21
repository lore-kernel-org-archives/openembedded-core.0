Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2773EC433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:02:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.40951.1655798537244869388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hUiSwSS2;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A4545100019;
	Tue, 21 Jun 2022 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655798534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8sgYNMuL/BkDEkkwt9hw+bAf45wY21K/Blv8jYvY/s=;
	b=hUiSwSS2Bq9SmKqvGmNQSSjRVEEDmP4xHGE1/7GvLvxh/8DmrOIuab9D9AOYZKFrRDIUEG
	8j1j8cfWD2p593RPrZBtP9XrW3WPFOdPpHsYsrJNNFrSBJY5DbZZCFD7zLylK9/wdOmjNX
	DiJeygwFR2h7//lV2cN0nQqgxKN5k6Sv76MJw0B+Uy6hJM0QSrU6+w3L2+XnAG2lxHXcNM
	3l92DJZyHYW5ATi7jHfjD30kp2YhIRe8Oao7LxQjdHvslfp+rdEx1oobvC4iHo/L5cKE9+
	YEoBfE2zoiqQAyPGNbOmaC+BUYWxQXh68z8+RWAygRdrjjePWyDqDOgqynVRFw==
Date: Tue, 21 Jun 2022 10:02:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Yogesh Tyagi" <yogesh.tyagi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Add ptest to curl
Message-ID: <20220621100209.7adaacdc@booty>
In-Reply-To: <20220620064200.66981-1-yogesh.tyagi@intel.com>
References: <20220620064200.66981-1-yogesh.tyagi@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167133

On Mon, 20 Jun 2022 14:42:00 +0800
"Yogesh Tyagi" <yogesh.tyagi@intel.com> wrote:

> - curl-ptest is taking around 270 seconds to execute so
>   added curl-ptest to PTESTS_SLOW
> - This patch is rework on an existing patch provided
>   by Maxin B. John (maxin.john@intel.com)
>   https://www.openembedded.org/pipermail/openembedded-core/2017-July/139176.html
> - Below is the run log of curl-ptest
>   START: ptest-runner
>   2022-06-20T03:28
>   BEGIN: /usr/lib/curl/ptest
>   ********* System characteristics ********
>   * curl 7.83.1 (x86_64-poky-linux-gnu)
>   * libcurl/7.83.1 OpenSSL/3.0.3 zlib/1.2.12 libidn2/2.3.2
>   * Features: alt-svc AsynchDNS Debug HSTS HTTPS-proxy IDN Largefile libz NTLM SSL TLS-SRP UnixSockets
>   * Disabled: headers-api
>   * Host: qemux86-64
>   * System: Linux qemux86-64 5.15.44-yocto-standard #1 SMP PREEMPT Tue May 31 20:28:59 UTC 2022 x86_64 GNU/Linux
>   * OS: linux
>   * Servers: HTTP-unix
>   * Env:
>   * Seed: 238592
>   *****************************************
>   PASS: test 0001 (1   out of 1487, remaining: 25:45, took 1.040s, duration: 00:01)
>   PASS: test 0002 (2   out of 1487, remaining: 13:50, took 0.078s, duration: 00:01)
>   ...
>   ...
>   PASS: test 3015 (1477 out of 1487, remaining: 00:01, took 0.024s, duration: 03:20)
>   PASS: test 3016 (1478 out of 1487, remaining: 00:01, took 0.023s, duration: 03:21)
>   PASS: test 3019 (1481 out of 1487, remaining: 00:00, took 0.015s, duration: 03:21)
>   PASS: test 3020 (1482 out of 1487, remaining: 00:00, took 0.014s, duration: 03:21)
>   test 3025...The tool set in the test case for this: 'lib3025' does not exist
>   TESTDONE: 1280 tests were considered during 201 seconds.
>   TESTDONE: 784 tests out of PASS: 804 report: 97%
> 
>   TESTFAIL: These test cases failed: 356 412 413 971 1119 1132 1135 1139 1140 1165 1167 1173 1185 1400 1401 1402 1403 1404 1405 1465
> 
>   DURATION: 207
>   END: /usr/lib/curl/ptest
>   2022-06-20T03:31
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
> - The failed testcase are either trying to parse man page/dcoumentation pages or
>   require --libcurl option to be enabled in curl configuration
>   [YOCTO #6707]
> 
> Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/curl/curl/run-ptest      |  6 +++++
>  meta/recipes-support/curl/curl_7.83.1.bb      | 22 +++++++++++++++++--
>  3 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index a1ead90649..6c4339e3e1 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -81,6 +81,7 @@ PTESTS_SLOW = "\
>      babeltrace2-ptest \
>      busybox-ptest \
>      coreutils-ptest \
> +    curl-ptest \
>      dbus-ptest \
>      e2fsprogs-ptest \
>      findutils-ptest \
> diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
> new file mode 100644
> index 0000000000..614e822922
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +cd tests
> +./runtests.pl -a -n -s | sed \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
> +     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
> +     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
> diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.83.1.bb
> index 1d9de29a65..34c2298fe1 100644
> --- a/meta/recipes-support/curl/curl_7.83.1.bb
> +++ b/meta/recipes-support/curl/curl_7.83.1.bb
> @@ -9,13 +9,16 @@ SECTION = "console/network"
>  LICENSE = "MIT-open-group"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
>  
> -SRC_URI = "https://curl.se/download/${BP}.tar.xz"
> +SRC_URI = "https://curl.se/download/${BP}.tar.xz \
> +           file://run-ptest \
> +"
> +
>  SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
>  
>  # Curl has used many names over the years...
>  CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
>  
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig multilib_header ptest
>  
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?= "/dev/urandom"
> @@ -80,6 +83,21 @@ do_install:append:class-target() {
>  	    ${D}${bindir}/curl-config
>  }
>  
> +do_compile_ptest() {
> +	oe_runmake test
> +	oe_runmake -C ${B}/tests/server
> +}
> +
> +do_install_ptest() {
> +	cp -rf ${B}/tests ${D}${PTEST_PATH}
> +	cp -rf ${S}/tests ${D}${PTEST_PATH}
> +	install -d ${D}${PTEST_PATH}/src
> +	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
> +	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS:${PN}-ptest += "bash perl-modules"

We have many failures on the autobuilders with this patch applied due
to:

Error: 
 Problem: conflicting requests
  - nothing provides perl-modules needed by curl-ptest-7.83.1-r0.core2_64

Some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5410/steps/18/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5378/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5392/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5388/steps/16/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5388/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/5373/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/5398/steps/12/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

