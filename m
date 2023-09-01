Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F13CA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 10:02:17 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2844.1693562526787811048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 03:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GSqpqNtB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4E231C0005;
	Fri,  1 Sep 2023 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693562524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2o/7RGN/4bfLDqTLWzufIkevVYjg+lx+PdU0R6gaIS8=;
	b=GSqpqNtBCOoKaMjuGr3ucPEJo/MesRRqUn3ackSD1A5iQRXObid10Norau94QRNZIDY7Zx
	DIsqTBFvl/rjgG+kiznEp+59aZw0Z43dxfDZPcfYx+YEqW17YCBSC3HkQdPii2W8x/A7e1
	se+Jj5v+2Ep5tl4dPlm+6QGAfHtHT+fC1gkC3bgTBScIEZMCFU65Ak0JWTxjjBFeXblgEt
	CSYBZV7OBztYnDATpvwOnQ2Dcke5Wk2g+9+13XfeQk4WefCxoi12kFukmuFxc7bi1TOnyF
	8fRXwf1Q0A2XV5a9Z4lVXKmB8nrfqLIljc6E6dZIEF2cxkECVX1WSZib2vygXw==
Date: Fri, 1 Sep 2023 12:02:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] json-c: upgrade 0.16 -> 0.17
Message-ID: <20230901100203a11b0a8b@mail.local>
References: <1693449116-27622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1693449116-27622-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 10:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186999

New ptest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5537/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5354/steps/13/logs/stdio

'json-c': ['test_json_patch.test']


On 31/08/2023 10:31:56+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-Fix-build-with-clang-15.patch
> removed since it's included in 0.17.
> 
> Changelog:
> ===========
> New features
> ------------
> * json_patch: add first implementation only with patch application
> * Add --disable-static and --disable-dynamic options to the cmake-configure script.
> * Add -DBUILD_APPS=NO option to disable app build
> * Minimum cmake version is now 3.9
> 
> Significant changes and bug fixes
> ---------------------------------
> * When serializing with JSON_C_TO_STRING_PRETTY set, keep the opening and
>   closing curly or square braces on same line for empty objects or arrays.
> * Disable locale handling when targeting a uClibc system due to problems
>   with its duplocale() function.
> * When parsing with JSON_TOKENER_STRICT set, integer overflow/underflow
>   now result in a json_tokener_error_parse_number.  Without that flag
>   values are capped at INT64_MIN/UINT64_MAX.
> * Fix memory leak with emtpy strings in json_object_set_string
> * json_object_from_fd_ex: fail if file is too large (>=INT_MAX bytes)
> * Add back json_number_chars, but only because it's part of the public API.
> * Entirely drop mode bits from open(O_RDONLY) to avoid warnings on certain
>   platforms.
> * Specify dependent libraries, including -lbsd, in a more consistent way so
>   linking against a static json-c works better
> * Fix a variety of build problems and add & improve tests
> * Update RFC reference to https://www.rfc-editor.org/rfc/rfc8259
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../json-c/0001-Fix-build-with-clang-15.patch | 34 -------------------
>  .../json-c/{json-c_0.16.bb => json-c_0.17.bb} | 10 +++---
>  2 files changed, 4 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
>  rename meta/recipes-devtools/json-c/{json-c_0.16.bb => json-c_0.17.bb} (78%)
> 
> diff --git a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch b/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
> deleted file mode 100644
> index 215f4d829a..0000000000
> --- a/meta/recipes-devtools/json-c/json-c/0001-Fix-build-with-clang-15.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 0145b575ac1fe6a77e00d639864f26fc91ceb12f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 13 Aug 2022 20:37:03 -0700
> -Subject: [PATCH] Fix build with clang-15+
> -
> -Fixes
> -json_util.c:63:35: error: a function declaration without a prototype is deprecated in all versions of C [-We
> -rror,-Wstrict-prototypes]
> -const char *json_util_get_last_err()
> -                                  ^
> -                                   void
> -
> -Upstream-Status: Backport [https://github.com/json-c/json-c/pull/783]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - json_util.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/json_util.c b/json_util.c
> -index 952770a..83d9c68 100644
> ---- a/json_util.c
> -+++ b/json_util.c
> -@@ -60,7 +60,7 @@ static int _json_object_to_fd(int fd, struct json_object *obj, int flags, const
> - 
> - static char _last_err[256] = "";
> - 
> --const char *json_util_get_last_err()
> -+const char *json_util_get_last_err(void)
> - {
> - 	if (_last_err[0] == '\0')
> - 		return NULL;
> --- 
> -2.37.2
> -
> diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
> similarity index 78%
> rename from meta/recipes-devtools/json-c/json-c_0.16.bb
> rename to meta/recipes-devtools/json-c/json-c_0.17.bb
> index 3aba41dfcf..aff5ad5076 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.16.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
> @@ -4,12 +4,10 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>  
> -SRC_URI = " \
> -    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> -    file://0001-Fix-build-with-clang-15.patch \
> -    file://run-ptest \
> -"
> -SRC_URI[sha256sum] = "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b"
> +SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> +           file://run-ptest \
> +           "
> +SRC_URI[sha256sum] = "7550914d58fb63b2c3546f3ccfbe11f1c094147bd31a69dcd23714d7956159e6"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
>  UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186933): https://lists.openembedded.org/g/openembedded-core/message/186933
> Mute This Topic: https://lists.openembedded.org/mt/101066854/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

