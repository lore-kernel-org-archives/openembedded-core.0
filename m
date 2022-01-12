Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3A7C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 19:24:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2156.1642015476382765953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MVxt7lfx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id fo11so4040904qvb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cduilqZkU/yTewp+8BuLH9zjqZ20bsUIEwnBZGBhVrc=;
        b=MVxt7lfxBzCDUpxS+MPaML4zimah2LB+3NJeyj7GtILqko7k05cd//a5wnDmGqg47c
         vKjBdrh7BKltnBmeFMs6bOO5je7ZaFeG1ksPD0tERzTN0AOLih2Fp8h4kAjNvwXzVhUF
         fPt/2SSS2hFg8U6eLqkx+cqYFsCQeA2ezGlpA7yYAUpBISDTPJ4YQMIOgGq4r9KIEhBc
         yAg9VA+MiW2+s2Jk+LVBxtyt//vIaqPtoaPWwECHjizcV/yoTa9ScYosZQYIglAktOjN
         vKyd7dyzLGzoR+NcaHE4tJFfZwV+2y7zY7Nk0zzXMgp0oy8YYLVWmNU6AM6sAUrOk1Pj
         /k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cduilqZkU/yTewp+8BuLH9zjqZ20bsUIEwnBZGBhVrc=;
        b=CZXkRdc0Ib4bL/HNRaIcPc+Rt+HDEd+hb1KQ5iHhy+FdAem2GFFTZ7zhZSp0Co/pJ/
         mm2CRfQ+sUch22pJVjFrsEWEpExqkddXp7eK0GTvcdSU85e7Zyal38gkvk1qzRHyZ+0N
         4VzZbXJWnRAvsDhHqK+CxMGXRSDShzL1Yu9VRr+SWoxENgR22kU04AFN8KHljTj4BQ0v
         zy3UElec5K7qViGqDDt2E/Hgx4wy3IBBS2RQC+AgAEtfE5lNfpwiT2eEt8WbwRx1DRv9
         uHmM5W0nrPsryLZJ04iPAgpHYcGEGKCDECXBz24dWJwHp3/2BApIgWwGVDWGNiQYFeTE
         tzjQ==
X-Gm-Message-State: AOAM530SPBvBAC1UPFoe8TyPfUxVpdygAx0TyFHcTvdHkCJO6FipBij8
	YNzQRtdz99EEZtq6senirli/7aj0F0jPY20jIJxUjnvChoizpg==
X-Google-Smtp-Source: 
 ABdhPJyQOA51N2nBvpvsJfjX4VBJE7V95Oyw5oONuh42nWdRrtjA4/3KQ1W1Ah1Xov2drv0Wv2WvHOMLZQPAhHd/KwE=
X-Received: by 2002:a05:6214:2262:: with SMTP id
 gs2mr1179406qvb.34.1642015475079;
 Wed, 12 Jan 2022 11:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
 <337f48d3-805c-a061-1aa7-d30e6845490f@gmail.com>
In-Reply-To: <337f48d3-805c-a061-1aa7-d30e6845490f@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 12 Jan 2022 14:24:24 -0500
Message-ID: 
 <CAPoiz9wbeB4P=uFBeymniazJut=CdXfQE2SvgWSFLGDbXS8=Aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
To: Khem Raj <raj.khem@gmail.com>
Cc: Kevin Hao <kexin.hao@windriver.com>,
 openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 19:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160499

On Wed, Jan 12, 2022 at 12:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 1/12/22 1:07 AM, Kevin Hao wrote:
> > The crc extension is optional for the ARMv8.0 but is mandatory for the
> > cortexa72, so there is no reason not to enable it for the cortexa72
> > tune. With this change, the cortexa72-crc seems redundant. But we
> > had better to keep it to be compatible with the BSP which already used
> > that tune.
>
> this looks good. Is there a way to warn such users to migrate to better
> option ?

We could just remove the crc and when it breaks they'll look....

>
> >
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> > ---
> >   .../machine/include/arm/armv8a/tune-cortexa72.inc    | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > index 3651cf6e802b..4c9add32f5f5 100644
> > --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > @@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
> >   ARMPKGARCH:tune-cortexa72             = "cortexa72"
> >   ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
> >   ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
> > -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
> > -TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
> > -TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
> > +TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> > +TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
> > +TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
> >   BASE_LIB:tune-cortexa72            = "lib64"
> >   BASE_LIB:tune-cortexa72-crc        = "lib64"
> >   BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160496): https://lists.openembedded.org/g/openembedded-core/message/160496
> Mute This Topic: https://lists.openembedded.org/mt/88369540/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

