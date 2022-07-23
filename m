Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863C1C43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 12:27:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.5665.1658579227120981457
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 05:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pgmt2RQN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2D46C1C0005;
	Sat, 23 Jul 2022 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658579224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HPGpmX7O9NAYZk0fvSAOZanA+wS+ZWJPb3rtYu6BQlw=;
	b=pgmt2RQNLFL3tr0DSuKyWPzCJe2o5i6uiqTsfQu4pvMXtso1nMYLYxmTC6ViG+x8LKO4Qf
	T2zoNNIbrKvVIuzwr9JSZFIg+17ojoe6PwbfpzIMUBZOE8ZJspSn2qML+pUWc1V3DibFag
	B4CwstpGneiZ3tJZGhyj6b9IsqJXbRAY34wRcp2lWn4Efd3sKx5J6LEOOjneorxMLKQgXr
	CHW4H6v6ANY1XG1JoZAQ3kEOtPzGxd0wQW9WTmM9dW9UbZPFuIrdVqHSEAIqEcPk0bwtzM
	wp1GZGbu/AOhe5vKAbCTpvXQwxLmSh0GzfFYoqMNKxDqfpsGyp0UHwCND5LeBQ==
Date: Sat, 23 Jul 2022 14:27:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, denis@denix.org,
	richard.purdie@linuxfoundation.org, raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Message-ID: <YtvpFxiRz1bAFTR7@mail.local>
References: <20220715115515.4012984-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715115515.4012984-1-sean@geanix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 12:27:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168433

Hello,

This doesn't pass the selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3865/steps/14/logs/stdio

2022-07-23 10:00:43,013 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.test_find_path (subunit.RemotedTestCase)
2022-07-23 10:00:43,026 - oe-selftest - INFO -  ... FAIL
Stderr:
2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078751/conf/local.conf
2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generate pkgdata
2022-07-23 10:00:43,026 - oe-selftest - INFO - 3: 49/59 163/494 (3.69s) (pkgdata.OePkgdataUtilTests.test_find_path)
2022-07-23 10:00:43,026 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/pkgdata.py", line 50, in test_find_path
    result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/utils/commands.py", line 207, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'oe-pkgdata-util find-path /lib/libz.so.1' returned non-zero exit status 1:
ERROR: Unable to find any package producing path /lib/libz.so.1
Stderr:
2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078751/conf/local.conf
2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generate pkgdata
2022-07-23 10:00:47,408 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.test_glob (subunit.RemotedTestCase)
2022-07-23 10:00:47,408 - oe-selftest - INFO -  ... ok
2022-07-23 10:00:47,408 - oe-selftest - INFO - 3: 50/59 164/494 (4.39s) (pkgdata.OePkgdataUtilTests.test_glob)
2022-07-23 10:00:53,202 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.test_list_pkg_files (subunit.RemotedTestCase)
2022-07-23 10:00:53,202 - oe-selftest - INFO -  ... FAIL
Stderr:
2022-07-23 08:46:34,614 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-2078751/conf/local.conf
2022-07-23 08:46:34,615 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2022-07-23 10:00:17,568 - oe-selftest - INFO - Running bitbake to generate pkgdata
2022-07-23 10:00:53,202 - oe-selftest - INFO - 3: 51/59 165/494 (5.79s) (pkgdata.OePkgdataUtilTests.test_list_pkg_files)
2022-07-23 10:00:53,202 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/pkgdata.py", line 147, in test_list_pkg_files
    self.assertTrue(found, 'Could not find zlib library file %s in libz1 package file list: %s' % (libspec, files['libz1']))
  File "/usr/lib64/python3.9/unittest/case.py", line 688, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : Could not find zlib library file /lib/libz.so.1.* in libz1 package file list: ['/usr/lib/libz.so.1', '/usr/lib/libz.so.1.2.12']


On 15/07/2022 13:55:14+0200, Sean Nyekjaer wrote:
> This is done in preparation for adding packages from the zlib contrib
> directory.
> Unfortunatly it's not possible to add these via pkgconfig.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> With this we are maintaining the same verison number for both zlib and
> minizip in the recipe name. Would it be better to have it in the inc
> file?
> 
> PV = "1.2.12" ?
> 
>  meta/recipes-core/zlib/zlib.inc       |  4 ++++
>  meta/recipes-core/zlib/zlib_1.2.12.bb | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-core/zlib/zlib.inc
> 
> diff --git a/meta/recipes-core/zlib/zlib.inc b/meta/recipes-core/zlib/zlib.inc
> new file mode 100644
> index 0000000000..b607a82312
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib.inc
> @@ -0,0 +1,4 @@
> +SRC_URI = "https://zlib.net/zlib-${PV}.tar.xz"
> +UPSTREAM_CHECK_URI = "http://zlib.net/"
> +
> +SRC_URI[sha256sum] = "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
> diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zlib/zlib_1.2.12.bb
> index e921703137..ba986d8cf2 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.12.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
> @@ -6,16 +6,16 @@ SECTION = "libs"
>  LICENSE = "Zlib"
>  LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
>  
> -SRC_URI = "https://zlib.net/${BP}.tar.xz \
> -           file://cc.patch \
> -           file://ldflags-tests.patch \
> -           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> -           file://run-ptest \
> -           file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
> -           "
> -UPSTREAM_CHECK_URI = "http://zlib.net/"
> +include zlib.inc
> +
> +SRC_URI += "file://cc.patch \
> +            file://ldflags-tests.patch \
> +            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
> +            file://run-ptest \
> +            file://0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch \
> +"
>  
> -SRC_URI[sha256sum] = "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18"
> +UPSTREAM_CHECK_URI = "http://zlib.net/"
>  
>  CFLAGS += "-D_REENTRANT"
>  
> -- 
> 2.37.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168059): https://lists.openembedded.org/g/openembedded-core/message/168059
> Mute This Topic: https://lists.openembedded.org/mt/92398812/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

