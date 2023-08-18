Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63920C7113D
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 12:28:42 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.10100.1692361715906330253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 05:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c+opa3iT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C12120004;
	Fri, 18 Aug 2023 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692361713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EE9X/jRMG8VXR+5brPzE7TtGdo/czea6kfi5HUkATaA=;
	b=c+opa3iT9OiSKdtnX/T0AebBsnG0tulzJ5nZSPE05n4StL6WXN9d9DFZ7ZpauWv33bPbU0
	IlkRf3vvy+8Q7iUTN8/6u2gIfgGLSxs2Rjcsb+zvTdFt2sTMHTENFQbAYqgPkkYrSbvYAQ
	vu5oxLrm7TKq4xckfJwZvTrlvQoV0MaeDk1QLWGD+5yOurLgcXWk6PlsODoezV9tcdh2mv
	cNeaniP9qurxIW8NcMvuQlV/ap+IpOTTc6a4rr4cn8Jjbb28V0FnELLMYLdTuheMPLxkRp
	h458xfDzgL5/nhkTB1wBrsV4dwV7cXDdvoNzsI1iQo1oDR5mg9s5FH2pne31zw==
Date: Fri, 18 Aug 2023 14:28:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joe.slater@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [oe-core][PATCH 1/1] file: fix call to localtime_r()
Message-ID: <20230818122832d8ce9fc9@mail.local>
References: <20230816195030.3866083-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816195030.3866083-1-joe.slater@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 12:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186366

Hello,

On 16/08/2023 12:50:30-0700, Joe Slater via lists.openembedded.org wrote:
> From: Joe Slater <joe.slater@windriver.com>
> 
> Depending on the version of glibc, localtime_r() must
> be preceded by a call to tzset() or it will ignore any
> value of TZ in the environment.  This problem will only
> be seen when building file-native on outdated hosts.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-devtools/file/file_5.45.bb       |  4 ++-
>  .../recipes-devtools/file/files/print_c.patch | 32 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/file/files/print_c.patch
> 

This causes:

ERROR: file-native-5.45-r0 do_patch: QA Issue: Fuzz detected:
Applying patch print_c.patch
patching file src/print.c
Hunk #1 succeeded at 289 with fuzz 1 (offset 3 lines).
The context lines in the patches can be updated with devtool:
    devtool modify file-native
    devtool finish --force-patch-refresh file-native <layer_path>
Don't forget to review changes done by devtool!

> diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.45.bb
> index a7127023cb..8477668658 100644
> --- a/meta/recipes-devtools/file/file_5.45.bb
> +++ b/meta/recipes-devtools/file/file_5.45.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
>  DEPENDS = "file-replacement-native"
>  DEPENDS:class-native = "bzip2-replacement-native"
>  
> -SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
> +SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
> +           file://print_c.patch \
> +          "
>  
>  SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/file/files/print_c.patch b/meta/recipes-devtools/file/files/print_c.patch
> new file mode 100644
> index 0000000000..4526655d22
> --- /dev/null
> +++ b/meta/recipes-devtools/file/files/print_c.patch
> @@ -0,0 +1,32 @@
> +From e329257b8e22362b62e6c930447ef6feadd63f32 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Mon, 7 Aug 2023 22:37:19 +0000
> +Subject: [PATCH] print.c: initialize timezone data for localtime_r()
> +
> +The man page for localtime() points out that while it acts
> +like tzset() has been called, localtime_r() might not.  We
> +have a local version of localtime_r() that avoids this, but
> +we do not compile it.
> +
> +Upstream-Status: Submitted [file@astron.com]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + src/print.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/print.c b/src/print.c
> +index 18f42a05..b1de4908 100644
> +--- a/src/print.c
> ++++ b/src/print.c
> +@@ -286,6 +286,7 @@ file_fmtdatetime(char *buf, size_t bsize, uint64_t v, int flags)
> + 	}
> + 
> + 	if (flags & FILE_T_LOCAL) {
> ++		tzset();
> + 		tm = localtime_r(&t, &tmz);
> + 	} else {
> + 		tm = gmtime_r(&t, &tmz);
> +-- 
> +2.35.5
> +
> -- 
> 2.39.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186141): https://lists.openembedded.org/g/openembedded-core/message/186141
> Mute This Topic: https://lists.openembedded.org/mt/100786945/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

