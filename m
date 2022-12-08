Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A83C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 09:24:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9327.1670491439398441611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 01:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a7YZQ2Nd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CBBAF1BF204;
	Thu,  8 Dec 2022 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670491437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EpY3HuolKUUEO8geKNN4SbRuydYrIkTIeBVQgHjnyQc=;
	b=a7YZQ2Nd0jmD5pWAyrQ83vHsR3KStku/lmCxLM1XCZ76/iAPaCDF7Orq9yRlNIQeuKUEXk
	1Tha2iWJ4BMPRDTAvIuzeVHPvbDr5RkScyp6r4xZVuyz82WAVTJ6Up0MNCwjo9uBRaRMQm
	MwfjNtHB2SLR+MjNfKAURHhGWLDWB++m9Z8Rd6zWv7HJOQHOrOAlIKbiyQx0Et0u/Vi8CM
	kwpHUhsFd7IANqM2ygrFhD5a4sxkMqBXixQW40QffSJXdek858Qd7Mn90jQ4T5+BOA1+/6
	p5w98Vprg8hNwR88d34tYDKolmwQvg/hZWKrNwVd6vGaSy3cRMVtoJb2wrn18w==
Date: Thu, 8 Dec 2022 10:23:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Manoj Saun <manojsingh.saun@windriver.com>
Cc: openembedded-core@lists.openembedded.org, narpat.mali@windriver.com
Subject: Re: [OE-core] [meta-core][PATCH 1/1] libksba: fix CVE-2022-3515
Message-ID: <Y5GtKvwEUpRfP0wp@mail.local>
References: <20221208062744.3450638-1-manojsingh.saun@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208062744.3450638-1-manojsingh.saun@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 09:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174393

Hello,

On 08/12/2022 06:27:44+0000, Manoj Saun wrote:
> libksba: integer overflow may lead to remote code execution.
> 
> Reference:
> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
> 
> Upstream fixes:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=commit;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b
> 

The patch is missing Upstream-Status:

Missing Upstream-Status tag (meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch)

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
> View/Reply Online (#174384): https://lists.openembedded.org/g/openembedded-core/message/174384
> Mute This Topic: https://lists.openembedded.org/mt/95533228/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

