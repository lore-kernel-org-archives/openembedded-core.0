Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EE9C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 17:41:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.2134.1657302064358344086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 10:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6SjrafId;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id dn9so33558884ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RY+EYMK+aj0p+/IeP/cGEzaVpQ+ItLvMSiamtbyqHhc=;
        b=6SjrafIdBYgGjOzciPYgArQ0ApJFA8+2HuPOQ7Pj/LXXqr1DmVmOYequ8zJsetblOp
         D8Cv0CAon4pMDyS89xjHsb3OR/Safr/W4HQpcew3HNWr+iHAg7SnyFE6WiyPQgjwhrCh
         A/k9+rRZhXdR3ocbzJcXH+ZIeEKBmGE4Mq46t7c4zQVx64JecLwD+jUePnTB67NSH0ZT
         0V0yGIPn65CT33RrecEXbMfQ9+PB2N6BzXqiPIjiQ5R+2qNvsBoq0RiOzDxvqXj7JCH5
         twh3Y5zVkg5N5JVMDEhNz+NYJVG/d7hcqqURyEn6QXsLFfaxOosVNbCl09QZGDufGo2/
         OE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RY+EYMK+aj0p+/IeP/cGEzaVpQ+ItLvMSiamtbyqHhc=;
        b=sD9kQ9TBIOrH71QFQrUrvYjUwYQZ+WOETAjmvMCHEDi6h+TitbQNRjsk9iRnqmQEl0
         A7sivS6A5e19rlVheSvqM+cQQQTCTgRgdy+4WvjGrz+PyZ9Jx5KmqYzlykkK9uz2WiLo
         P/jT+z1ot5qdinFoMuZGI25A1qkzvlVH4Ub4DfnqW0KAmypQOzpFgOgUsFsLQNn1/i6M
         H/WPQwpD/Ytc/VLmrWn3wKpLHA6rbUis5U+dDBUVWm2L0Ho3Rs28YSRzJVUMrIvFB+B7
         q81PE//6lXfqMBllxB2tBOTMBLA+NOYtlkFRdcpG2n2aITvjmiw/14BRgKWrMO58vr99
         FLlg==
X-Gm-Message-State: AJIora/jhMN37seBpemPVSc+yd5MPcgUP9u0aFDdnj7uV34PsxiHE1q0
	W/MlEnUo6iBcRDNYWbsNt1wVB61egzr1FVgTzz5EQQ==
X-Google-Smtp-Source: 
 AGRyM1u5uk/nU8M6k+WLdjpHZCnGIw5Qh9QbZPF+fpRmjFaT0s0x8lFEZPmJ8XiyiX5qRfzPCa/DAC6gQA4ebWSCnZ0=
X-Received: by 2002:a17:906:938a:b0:726:942a:54ef with SMTP id
 l10-20020a170906938a00b00726942a54efmr4681632ejx.728.1657302062423; Fri, 08
 Jul 2022 10:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220708120611.6577-1-akash.hadke@kpit.com>
In-Reply-To: <20220708120611.6577-1-akash.hadke@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 8 Jul 2022 07:40:51 -1000
Message-ID: 
 <CAOSpxdb_a==pbT26dFtLCBWTQP-BYdYGbVY66Xxc-FfYKwnmdA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] cve-extra-exclusions.inc: Use
 conditional override
To: akash.hadke@kpit.com
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 17:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167827

We're trying to keep CVE check tooling in sync across master and the
LTS branches as much as possible.

So you should submit this approach first to master, and then versions
for kirkstone and dunfell.

I appreciate your help with CVEs!

Steve

On Fri, Jul 8, 2022 at 2:07 AM akash hadke via lists.openembedded.org
<akash.hadke=kpit.com@lists.openembedded.org> wrote:
>
> Use conditional override for CVE_CHECK_WHITELIST variable
> to whitelist CVEs for specific recipe.
>
> After including cve-extra-exclusions.inc all CVEs from
> file are getting shown in whitelist list for every component even
> if that CVE is not related to it.
>
> This change can help to set actual whitelisted CVEs for
> the recipe.
>
> Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index e02a4d1fde..4c8716c1a8 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -19,7 +19,7 @@
>  # strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
>  # CVE is more than 20 years old with no resolution evident
>  # broken links in CVE database references make resolution impractical
> -CVE_CHECK_WHITELIST += "CVE-2000-0006"
> +CVE_CHECK_WHITELIST:pn-strace += "CVE-2000-0006"
>
>  # epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-0238
>  # The issue here is spoofing of domain names using characters from other character sets.
> @@ -28,26 +28,26 @@ CVE_CHECK_WHITELIST += "CVE-2000-0006"
>  # there is unlikely ever to be a single fix to webkit or epiphany which addresses this
>  # problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
>  # we can seem to take.
> -CVE_CHECK_WHITELIST += "CVE-2005-0238"
> +CVE_CHECK_WHITELIST:pn-epiphany += "CVE-2005-0238"
>
>  # glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-4756
>  # Issue is memory exhaustion via glob() calls, e.g. from within an ftp server
>  # Best discussion in https://bugzilla.redhat.com/show_bug.cgi?id=681681
>  # Upstream don't see it as a security issue, ftp servers shouldn't be passing
>  # this to libc glob. Exclude as upstream have no plans to add BSD's GLOB_LIMIT or similar
> -CVE_CHECK_WHITELIST += "CVE-2010-4756"
> +CVE_CHECK_WHITELIST:pn-glibc += "CVE-2010-4756"
>
>  # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29509
>  # go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29511
>  # The encoding/xml package in go can potentially be used for security exploits if not used correctly
>  # CVE applies to a netapp product as well as flagging a general issue. We don't ship anything
>  # exposing this interface in an exploitable way
> -CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
> +CVE_CHECK_WHITELIST:pn-go += "CVE-2020-29509 CVE-2020-29511"
>
>  # db
>  # Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
>  # supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
> -CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
> +CVE_CHECK_WHITELIST:pn-db += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
>  CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
>  CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
>  CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167821): https://lists.openembedded.org/g/openembedded-core/message/167821
> Mute This Topic: https://lists.openembedded.org/mt/92249813/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

