Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4804C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:47:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.13237.1665524831588451879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PFf4JFlh;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id a67so12645520edf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYuSpVxytIPrnopIqI2wKfmsW8u5HM8USwONHhmTbio=;
        b=PFf4JFlhPTVVAk8zhCbZKRmn6bzmYWtR+QLSCe+ZTnpGHwz7wH/bnANmaAdVST36hz
         m58eLC+JySjCCJToLQ/UyohcU7+oGxMMg6AQvpIqfRisOtgQBT6IGRJSYyAvShSO+M3b
         2Sv6eX2AaewiYza8q/wsqURF72FHODL4xBRbpJjUs0iIlmy2noiq4SfWt94OGDVlgJMa
         nxpxCinGNa26HMzYfzAfNXa35ezaUdS++qiJssxCu/keNI0BrGGs/zGF7qWCxBHP2fHU
         MfhvJoQGISZrA0GpDjimnmM+Uafv2Wh90As1PLgyXxpBjX7P7H1pWpJcnwP6sLdHPztJ
         /Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYuSpVxytIPrnopIqI2wKfmsW8u5HM8USwONHhmTbio=;
        b=LpWgrRqw4b8RrrXuWGPYuuGhnYrFrvTFx773iBJ9ZM+CvKutYn4EOZE81Ubhy0IZJj
         szAWEXegcWc3ZjGnVI3+nVjMcjvYMttW+AMUW0KDtgNblD4tmquptOBSgG4YLseeFYRj
         MynyEoZijAZitZ4yrJqMONtfvWK3o6cIlICqGL8I8FKITl4Fbse3MRoxFxleC0tjZw4k
         XIyeUkqYjvHAGyQRpfMpS2f39v4SJpnjItuN7bEAdvhVPjC9CAb0Aic+rq75m+s/ZMOK
         wLiZw17vINfBm8GCUEQobh42xUmJ0jnAXC4x/PWFQjWnJaEqEgryo1Nf548S6/NdphDk
         Dbag==
X-Gm-Message-State: ACrzQf2jPXtoGaO7TQ4k3UVrZVt9wXb80P1LcmmmRhqJQ7NO9Fz1u3Y5
	CprX5O19N/hN0tm3MYNv7QkgMBDhpXwfXfXc55kKKQ==
X-Google-Smtp-Source: AMsMyM5F9fLv8CS+mN811XXwic6P2lwTwLkMvjUcQWqFEh22VDawnys7sKl4gJIAb9J26Ghavq2bRWhYYayQhX5hpAM=
X-Received: by 2002:a05:6402:1e8e:b0:45c:af84:63dd with SMTP id
 f14-20020a0564021e8e00b0045caf8463ddmr75791edf.190.1665524829962; Tue, 11 Oct
 2022 14:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221011161059.41454-1-vkumbhar@mvista.com>
In-Reply-To: <20221011161059.41454-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Oct 2022 11:46:59 -1000
Message-ID: <CAOSpxdZx_7brZeM4aTVqQj7vdNNM0TKvPb1NTM3TOvzJVP1NoQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] bind: fix CVE-2022-38178
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 21:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171642

On Tue, Oct 11, 2022 at 6:11 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
> MR: 122537
> Type: Security Fix
> Disposition: Backport from https://gitlab.isc.org/isc-projects/bind9/-/commit/1af23378ebb11da2eb0f412e4563d6c4165fbd3d
> ChangeID: f93f9a7755124934083d77cf9334fffb32a0c220
> Description:
>     CVE-2022-38178 bind: Free ctx on invalid siglen
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../bind/bind/0001-CVE-2022-38178.patch       | 28 +++++++++++++++++++
>  .../recipes-connectivity/bind/bind_9.11.22.bb |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch

Same issue with filename and internal mvista tags.
>
> diff --git a/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
> new file mode 100644
> index 0000000000..bf48dd69a1
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/0001-CVE-2022-38178.patch
> @@ -0,0 +1,28 @@
> +From cedf585da4809d1bde70cfe800d0f15e3cdccb58 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Sun, 9 Oct 2022 19:54:32 +0530
> +Subject: [PATCH] CVE-2022-38178
> +
> +Upstream-Status: https://gitlab.isc.org/isc-projects/bind9/-/commit/7c0028cfad2ae5fdf82c4d02d3b8b3a1e96dc6ec
> +CVE: CVE-2022-38178
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + lib/dns/openssleddsa_link.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/dns/openssleddsa_link.c b/lib/dns/openssleddsa_link.c
> +index 76c7737..295f08e 100644
> +--- a/lib/dns/openssleddsa_link.c
> ++++ b/lib/dns/openssleddsa_link.c
> +@@ -325,7 +325,7 @@ openssleddsa_verify(dst_context_t *dctx, const isc_region_t *sig) {
> +               siglen = DNS_SIG_ED448SIZE;
> +
> +       if (sig->length != siglen)
> +-              return (DST_R_VERIFYFAILURE);
> ++               DST_RET(DST_R_VERIFYFAILURE);
> +
> +       isc_buffer_usedregion(buf, &tbsreg);
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
> index 3b4a299b36..b075d01e2b 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
>             file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
> +           file://0001-CVE-2022-38178.patch \

And again, patch won't apply because you aren't using the current dunfell head.

Please rebase and send a V2

Thanks!

Steve

>             "
>
>  SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171632): https://lists.openembedded.org/g/openembedded-core/message/171632
> Mute This Topic: https://lists.openembedded.org/mt/94262351/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

