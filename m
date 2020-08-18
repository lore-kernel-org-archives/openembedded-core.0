Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web10.77645.1597790242732624853
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 15:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=KRN4Ocsd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.219.196, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-yb1-f196.google.com with SMTP id q3so12254816ybp.7
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9pktuDAL6OjoD05x5c4mUwWs7bUmTJMLkQscJTHcnc=;
        b=KRN4Ocsd2SHDsdjSF2UGa2tKRHL+7S4gG/ioD+jXPQW2RRl4rcLnkQ43yRmX5LpGI+
         3iDlrXLxBcOtOafXq69HpM8VRBCYm2W+P7xjqGcXyvX1GjVqjEhlQZUr2P1MKGyQWbLW
         uUvOBd44PwwKuZOjV+HbYcqBlVOH/NY7Zij3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9pktuDAL6OjoD05x5c4mUwWs7bUmTJMLkQscJTHcnc=;
        b=lMKu6brWPQR9YMRb0pI/RBkFKUDd2Z2RUvfsYUwcCSnhl/i1lELLCvrH1EO0t2oODW
         EdBm9msS/gcIG3ytGeSnzBRvQnY516BTT6U4G2fau+ovY6M2JRAB1vLAnN2O3CFgHKOy
         ARzisc2RYSwj3mXTlSmVQvququppB3ECZJzpho9DukfkJbV+nG6ncYHgklelLHQGDOc/
         SzsoikHByz29XikngUS2Vw1BQ207JJgo4AUAAVIgRnwgbYa+Z2hkau/Wgg1H1XtDLMTr
         bapY7/G21Rgzt3v82qZKP04nhxJnFz0X91qTVce2DfyQfBjXTHrlxH3AV2GQ3FAySeNr
         NQVw==
X-Gm-Message-State: AOAM531Z6RXS1SuRCJHLt0/4cvo2arajkmEsWZ6M81uKQweiH3gjaAzR
	tCEz33zXD622EK30W/kTDj9v1jtugbaKiMzf6vIQLQ==
X-Google-Smtp-Source: ABdhPJyfzxEAaLGqqd+gm50EUFKD5CqWn++Rs10aHkHxwhdyXzHsH8IcceIw6c0QYdWRt5jX56NdYdDDdGJlIBkjlvA=
X-Received: by 2002:a25:6981:: with SMTP id e123mr28546184ybc.346.1597790241823;
 Tue, 18 Aug 2020 15:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200818211332.38006-1-jonathan.richardson@broadcom.com> <CAMKF1sqe-3pePMJh67AG8kMriyJw5hSbMzwvDbKQku5pEJQdcg@mail.gmail.com>
In-Reply-To: <CAMKF1sqe-3pePMJh67AG8kMriyJw5hSbMzwvDbKQku5pEJQdcg@mail.gmail.com>
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
Date: Tue, 18 Aug 2020 15:37:10 -0700
Message-ID: <CAHrpVsW_jBMoEywWvgcOAngi76Q5Qfc8J61Qu_hn91GjO655QQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] cortex-m0plus.inc: Add tuning for cortex M0 plus
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 2:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 18, 2020 at 2:13 PM Jonathan Richardson via
> lists.openembedded.org
> <jonathan.richardson=broadcom.com@lists.openembedded.org> wrote:
> >
> > Add tuning files for ARM cortex m0 plus and the armv6-m architecture
> > that it is based on.
> >
> > Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv6m.inc | 20 +++++++++++++++++++
> >  .../machine/include/tune-cortex-m0plus.inc    | 11 ++++++++++
> >  2 files changed, 31 insertions(+)
> >  create mode 100755 meta/conf/machine/include/arm/arch-armv6m.inc
> >  create mode 100755 meta/conf/machine/include/tune-cortex-m0plus.inc
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
> > new file mode 100755
> > index 0000000000..8202ef52f7
> > --- /dev/null
> > +++ b/meta/conf/machine/include/arm/arch-armv6m.inc
> > @@ -0,0 +1,20 @@
> > +# Tuning for ARMV6-m defined in ARM v6-M ArchitectureReference Manual
> > +# at https://static.docs.arm.com/ddi0419/d/DDI0419D_armv6m_arm.pdf
> > +DEFAULTTUNE ?= "armv6m"
> > +
> > +TUNEVALID[armv6m] = "Enable instructions for ARMv6-m"
> > +TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
> > +
> > +# Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
> > +# SVC is a valid instruction.
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
> > +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '' ,d)}"
> > +
> > +require conf/machine/include/arm/arch-armv5.inc
> > +
> > +# Little Endian
> > +AVAILTUNES += "armv6m"
> > +ARMPKGARCH_tune-armv6m             = "armv6m"
> > +TUNE_FEATURES_tune-armv6m          = "armv6m"
> > +PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
> > +BASE_LIB_tune-armv6m               = "lib32"
>
> do we need BASE_LIB defined here ?
>
I guess we don't actually. I see it's only set for the 64 bit arm
tuning files. I'll remove it.
