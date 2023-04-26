Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2C3C7EE21
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:23:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.3678.1682501006796083052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R9l8sCWR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2117060006;
	Wed, 26 Apr 2023 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682501004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8hcW42eNbNPhlFe6JSiwEaapgE79rkrEIhrfrdoX90=;
	b=R9l8sCWRkVzVcjNUtPC3xQw54q/h5fYdragV7eo2HjgQ5KXpS8UAbU/EB6PRs6C1PsxRy+
	470lioZEnI1qZ22W05imR5CSJF/vfbYjX+mFmKaJiL61oyjbQK7pZ3znvHi+JI/nQIaBGf
	Om03meDQz9DVNOjXKMJ5DmKzfyhFHt4rzhcoIkwlYzFoaPgIR+7PFv3PA7pAI89TUSfnKI
	/9tihpIpBoGXK4eJYnSyGLG1/V3P2ZJCb1ZvIdK/imDZ6m3h+RjGbC84yDfobARw1iBdTS
	3aRUi05U33mtSB77VaF0mdgJJCjXz1JqaUtlagNuhCzkBgYkOxCRHad8mDLGNw==
Date: Wed, 26 Apr 2023 11:23:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [PATCH V1] Fix error SRCDIR when using usrmerge
 DISTRO_FEATURES
Message-ID: <20230426112322.7cc80ff4@booty>
In-Reply-To: <1682490667-2414-1-git-send-email-qiutt@fujitsu.com>
References: <1682490667-2414-1-git-send-email-qiutt@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180415

Hello Qiu,

On Wed, 26 Apr 2023 14:31:07 +0800
"qiutt@fujitsu.com" <qiutt@fujitsu.com> wrote:

> From: Qiu Tingting <qiutt@fujitsu.com>
> 
> When build e2fsprogs ptest with usrmerge DISTRO_FEATURES,
> in test_script and test_one scripts, value of SRCDIR has problem.
>   SRCDIR=/usr/usr/lib/e2fsprogs/ptest/test
> 
> ptest log
>   # ptest-runner e2fsprogs
>   START: ptest-runner
>   2022-12-17T11:08
>   BEGIN: /usr/lib/e2fsprogs/ptest
>   ls: cannot access '/usr/usr/lib/e2fsprogs/ptest/test/[a-zA-Z]_*': No such file or directory
>   ./test_script: line 54: /usr/usr/lib/e2fsprogs/ptest/test/test_post: No such file or directory
>   DURATION: 0
>   END: /usr/lib/e2fsprogs/ptest
>   2022-12-17T11:08
>   STOP: ptest-runner
>   TOTAL: 1 FAIL: 0
> 
> Reason
>   In Makefile.in, SRCDIR is set by prefix and libdir.
>     @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_one
>     @echo "SRCDIR=${prefix}${libdir}/e2fsprogs/ptest/test" >> test_script
>   prefix=/usr
>   libdir=/usr/lib (when usrmerge is set)
> 
> solution
>   After ptest compiling, check and modify SRCDIR in test_script and test_one.
> 
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> index 2620610903..3219817c08 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> @@ -122,6 +122,8 @@ RDEPENDS:${PN}-ptest += "e2fsprogs-badblocks e2fsprogs-dumpe2fs e2fsprogs-e2fsck
>  
>  do_compile_ptest() {
>  	oe_runmake -C ${B}/tests
> +	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_one
> +	sed -i 's/\/usr\/usr/\/usr/g' -i ${B}/tests/test_script

There is a duplicate '-i' in each line.

Also the regex would more readable by using another spearator character,
which would allow getting rid of the backslashes e.g.: 

sed -i 's,/usr/usr,/usr,g' -i ${B}/tests/test_one

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

