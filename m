Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3FCC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 07:57:27 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.8087.1670572640576682971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 23:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l7X2XZ9O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A02E4C0012;
	Fri,  9 Dec 2022 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670572638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SlP8SaWgeZ5gX6/zsgeeg7mWqiu7kAsGsLYA8lNsGpo=;
	b=l7X2XZ9OCx/4fbrzcUw1sBHag8N9UpPVk3l3rTwBA698UvajlTNw/X5Di05Q6L2v9Ilx7W
	8frLPZWx+c+v+SBqHMoXUxvTjjLO4cK3TTl0HXNaSsey2tYKn06s2ZQRbedJB4gqgbHuvJ
	x++ih08AIhTwDWu7Z1c82Pn/N2oLwrhvXrIuFwysuZi+oB50R9oFPnWMnU95Hufio6TjLh
	G7IQcGtKUqJVOmLr3TVjOoM6orkcQy8JQiru4bT66BE303Memf7vSjaNSm77xSQJDmuWOW
	c8T9mYGx3IOwftYTzeclxs2affZsF8nKDFuZtqn078kpWBqyeqB8x/rc4jRvdQ==
Date: Fri, 9 Dec 2022 08:57:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Manoj Saun <manojsingh.saun@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	archana.polampalli@windriver.com, narpat.mali@windriver.com,
	hari.gpillai@windriver.com
Subject: Re: [OE-core] [meta-core][PATCH 1/1] libksba: fix CVE-2022-3515
Message-ID: <Y5LqXZP8Q/d0KVhz@mail.local>
References: <20221209061130.3794053-1-manojsingh.saun@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209061130.3794053-1-manojsingh.saun@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 07:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174437

On 09/12/2022 06:11:30+0000, Manoj Saun wrote:
> libksba: integer overflow may lead to remote code execution.
> 
> Reference:
> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
> 
> Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b]
> 
> CVE: CVE-2022-3515

Those two tags need to go in the patch you are adding, not only in your
commit log

> 
> Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> ---
>  ...e-overflow-directly-in-the-TLV-parse.patch | 42 +++++++++++++++++++
>  meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
> 
> diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
> new file mode 100644
> index 0000000000..e2cb842a4d
> --- /dev/null
> +++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
> @@ -0,0 +1,42 @@
> +From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
> +From: Werner Koch <wk@gnupg.org>
> +Date: Wed, 5 Oct 2022 14:19:06 +0200
> +Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
> +
> +* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
> +used sum.
> +--
> +
> +It is quite common to have checks like
> +
> +    if (ti.nhdr + ti.length >= DIM(tmpbuf))
> +       return gpg_error (GPG_ERR_TOO_LARGE);
> +
> +This patch detects possible integer overflows immmediately when
> +creating the TI object.
> +
> +Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
> +---
> + src/ber-help.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/ber-help.c b/src/ber-help.c
> +index 81c31ed..56efb6a 100644
> +--- a/src/ber-help.c
> ++++ b/src/ber-help.c
> +@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_info *ti)
> +       ti->length = len;
> +     }
> + 
> ++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
> ++    {
> ++      ti->err_string = "header+length would overflow";
> ++      return gpg_error (GPG_ERR_EOVERFLOW);
> ++    }
> ++
> +   /* Without this kludge some example certs can't be parsed */
> +   if (ti->class == CLASS_UNIVERSAL && !ti->tag)
> +     ti->length = 0;
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes-support/libksba/libksba_1.6.2.bb
> index f6ecb9aec4..c25c23ef0f 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.2.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
> @@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
>  
>  UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
>  SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> -           file://ksba-add-pkgconfig-support.patch"
> +           file://ksba-add-pkgconfig-support.patch \
> +           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch"
>  
>  SRC_URI[sha256sum] = "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174430): https://lists.openembedded.org/g/openembedded-core/message/174430
> Mute This Topic: https://lists.openembedded.org/mt/95533228/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

