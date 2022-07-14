Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A9DCCA483
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 13:45:52 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.7762.1657806349388236532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eUIIo1aQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 26886200002;
	Thu, 14 Jul 2022 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657806347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Bq8RTysHPmhhnhPj0mffrL0Hlkww/jU5UfZHL5rG1M=;
	b=eUIIo1aQsZ54lDvph8FXZVaa/2Xc7Rdr0TLKoI0DDwvB7eVbnxErvuinQoeVaw+RfIew+V
	JS8UQj3sYnH90wrclINifrPd/XyUF2A0YdFIedvqNX8dYP3lY25QadBzd1K//FzvKfKaCI
	AZQRtFoOIcyhj9dSPYq+LN6LJyRpsiazou3JFyGzEbM56cPXB2XItiLvRh5Kt6M4AISkV+
	uXhLvaecvipjgP5jaKUFn1GzwzYISIb40D3lciqMx40Z1ve3RuKrom+EMf16r88mxlVX2q
	4caAnd1dMBmfB7Cs4Pj4Z6T6HcE8CgSk4IBtWlK3bcaUlxPXp3RKeVWQYnmVsg==
Date: Thu, 14 Jul 2022 15:45:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yogesh Tyagi <yogesh.tyagi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] curl : Add ptest
Message-ID: <YtAeCt5PXOaBeUbD@mail.local>
References: <20220706101827.76249-1-yogesh.tyagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706101827.76249-1-yogesh.tyagi@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 13:45:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168033

Hello,

This made it in master and we found a reproducibility issue. I've opened
this bug to track that:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14863

Could you have a look?

I guess that if the tests don't need the Makefiles, we could just drop
them.

Thanks!

On 06/07/2022 18:18:27+0800, Yogesh Tyagi wrote:
> - curl-ptest is taking around 200 seconds to execute so
>   added curl-ptest to PTESTS_SLOW
> - This patch is rework on an existing patch provided
>   by Maxin B. John (maxin.john@intel.com)
>   https://www.openembedded.org/pipermail/openembedded-core/2017-July/139176.html
> - Below is the run log of curl-ptest
>   START: ptest-runner
>   2022-07-03T15:52
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
>   * Seed: 238593
>   *****************************************
>   PASS: test 0001 (1   out of 1466, remaining: 25:07, took 1.029s, duration: 00:01)
>   PASS: test 0002 (2   out of 1466, remaining: 13:21, took 0.065s, duration: 00:01)
>   ...
>   ...
>   PASS: test 3019 (1460 out of 1466, remaining: 00:00, took 0.012s, duration: 03:16)
>   PASS: test 3020 (1461 out of 1466, remaining: 00:00, took 0.011s, duration: 03:16)
>   test 3025...The tool set in the test case for this: 'lib3025' does not exist
>   TESTDONE: 1280 tests were considered during 197 seconds.
>   TESTDONE: 783 tests out of PASS: 783 report: 100%
>   DURATION: 202
>   END: /usr/lib/curl/ptest
>   2022-07-03T15:56
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
> - disable the curl tests that are expected to fail
> - remove the generated file configurehelp.pm from curl test beacuse it is causing reproducible build failure.
>   this file is used by some curl tests to scan symbols from curl headers. we are anyway not installing curl
>   headers and already have disabled those tests.
>   [YOCTO #6707]
> 
> Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
> ---
> v4:removed configurehelp.pm from curl test which is causing reproducible build error
> 
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/curl/curl/disable-tests  | 28 +++++++++++++++++++
>  meta/recipes-support/curl/curl/run-ptest      |  6 ++++
>  meta/recipes-support/curl/curl_7.84.0.bb      | 21 +++++++++++++-
>  4 files changed, 55 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/curl/curl/disable-tests
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
> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
> new file mode 100644
> index 0000000000..92056bd8ca
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -0,0 +1,28 @@
> +# These CRL test (alt-avc) are failing
> +356
> +412
> +413
> +# These CRL tests are scanning docs
> +971
> +1119
> +1132
> +1135
> +# These CRL tests are scnning headers
> +1167
> +# These CRL tests are scanning man pages
> +1139
> +1140
> +1173
> +1177
> +# This CRL test is looking for m4 files
> +1165
> +# This CRL test is looking for src files
> +1185
> +# These CRL tests need --libcurl option to be enabled
> +1400
> +1401
> +1402
> +1403
> +1404
> +1405
> +1465
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
> diff --git a/meta/recipes-support/curl/curl_7.84.0.bb b/meta/recipes-support/curl/curl_7.84.0.bb
> index 74a19d20c9..0d829cdf23 100644
> --- a/meta/recipes-support/curl/curl_7.84.0.bb
> +++ b/meta/recipes-support/curl/curl_7.84.0.bb
> @@ -12,13 +12,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
>  SRC_URI = " \
>      https://curl.se/download/${BP}.tar.xz \
>      file://0001-easy_lock.h-include-sched.h-if-available-to-fix-buil.patch \
> +    file://run-ptest \
> +    file://disable-tests \
>  "
>  SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
>  
>  # Curl has used many names over the years...
>  CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
>  
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig multilib_header ptest
>  
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?= "/dev/urandom"
> @@ -83,6 +85,23 @@ do_install:append:class-target() {
>  	    ${D}${bindir}/curl-config
>  }
>  
> +do_compile_ptest() {
> +	oe_runmake test
> +	oe_runmake -C ${B}/tests/server
> +}
> +
> +do_install_ptest() {
> +	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
> +	rm  ${B}/tests/configurehelp.pm
> +	cp -rf ${B}/tests ${D}${PTEST_PATH}
> +	cp -rf ${S}/tests ${D}${PTEST_PATH}
> +	install -d ${D}${PTEST_PATH}/src
> +	ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
> +	cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS:${PN}-ptest += "bash perl-modules"
> +
>  PACKAGES =+ "lib${BPN}"
>  
>  FILES:lib${BPN} = "${libdir}/lib*.so.*"
> -- 
> 2.36.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167716): https://lists.openembedded.org/g/openembedded-core/message/167716
> Mute This Topic: https://lists.openembedded.org/mt/92203371/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

