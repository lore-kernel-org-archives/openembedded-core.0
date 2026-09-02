Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11A4C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:26 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11506.1788352884542188593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I2plKja3;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a20f56876eso9230561fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788352882; cv=none;
        d=google.com; s=arc-20260327;
        b=dSIffqV1FivU1eUC2ND1FFU2RghUHzb3hIa4hQom5lCrNcyyfbtp0Eua12S2Gp0E6n
         Cw8LCUNfamB5PmPm7FLStZfuQxJ649LifGdXy9hFEsEHZokVlp+c1xlpcaPzLnXRMZ3X
         J9U+sxcEUck2MpibGYVM10R5X1+tefOEQwj0vbc1JbzJOvzg1WFFJ6OHQ4zVgFM9y/zG
         PRW/AS6x5I1I0+FHOWKowoXDcPOzaiUQ2wnnjm9v4VD3/NJs19gA43I2JmxamZVxs04T
         85fFEp7rEyzkhxVJ8GS/hYl38XskfPouNnwRUKfpOA82Dz57pzbxE0LnHwUBgspbFvhS
         wgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oL7chveIxDD17muyOMORfZ2/WC63Q/TagEv2sfmICCw=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=qDnefxF10rGW31PU+62tAVv2oECU5zok9ir6Yb+v2HJQpdpYDKFVSQltvk8Uixnu23
         htg3DNl4YxsR/WN1wESVk3oQelvkF6wVVKWgqtpJRMboGy8wUeUhNIW89PcL58qcTKIV
         cwN1EJd52ZZT0mzC4l0pcJ1l/QnshLIXxuJyO2Pq1HjTb2uTDqwH4bf4PO00GDlgJ45s
         HCjtqGk3WthB+wB4gssgNMAeGhdpU1wX4Wno5H9t9I50Tx6FlWfGHZnWdL+z6u3FJa7/
         N9j79lhdTkR5CPA9mqHnoTqA0hzbmCdRdM7oIm7eOhx+OJctsRO6x9daMxNBQ8CPR7q/
         RzPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352882; x=1788957682; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oL7chveIxDD17muyOMORfZ2/WC63Q/TagEv2sfmICCw=;
        b=I2plKja3I+huUd32D9dw2q5VCg/8nXj7C7zSrgmDkt0w9aMNH1CI+9JtlTWodwLWXm
         PuQM1C6ORpANwbzhFbWkrBx/DllNuYLO+R+m0I4U+YEOszBNmrYE1o0zY5tmENxmzhdJ
         +Lel+2TIQ6C7V0hrJ8iAOie6CmdQ49qoxdCtHnkCXGxJ0ktuoSRg2jmEpYzR6h95j9Qh
         s9LAGtghJyjXhNDw5h9VSmpa0IvttHKMJFZomgJqMjeedH52+hyF6LJCMiFZPkd0iiPD
         IiDW8K0xacqf8WPWCadrb24FdgLs9pZ9HopyEm2hn3l2J3r7bQ9b8mdP84/CCluE3YHY
         Tllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352882; x=1788957682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oL7chveIxDD17muyOMORfZ2/WC63Q/TagEv2sfmICCw=;
        b=jP28WL5VuHnvYs+CCrpuYdr2wfZruGCRVhAH4QuyUK9+hmyw9a0ry+kpcTAd+RSHln
         3GhnDYSf4/6uKrVh6H3MovORsEt9DUCtvBbcmqZiaxJhy5ydILnEzWSLk9Z3YPHbdoH0
         ZPMNFyVsDAqh6/0x0of00TI1QpsSLnq4UtRuSOGMFBgEztLrgsweiIvpN6L7YFms/KG9
         kXrybqVM7OsHSl+k2vt3rypx8D9a3NAweDSOjRTVcCZ4ojnUa0q0tProESJqyYUFNvyL
         j+cJ5iVHv1XPKTOeNxWR72M2I/MSt9AncyxYaIZM28940MTJBTBKRtWJjt4quw+vaaEZ
         P2xA==
X-Gm-Message-State: AFuF++kZdfk370iqoj94z9sAMn/yMe9Y3PTgrfgSmkkB52z87mhkj9eS
	DVLUjjFdjQJ8Nw5v5ZspJyWUZd+al5TDh6Rjn56yiZBXI8xdHvgHns8FzXK56GsI11cK9BGjOwu
	GBXWvgslrHXfKUMDprzoirCqiPJSCRFoK7pM/
X-Gm-Gg: AYBFou024f0IO9ULVwprKJL/yrsJaanWU9d01JuQk3chNmkS1kDzpOMlgMULGXhIdSX
	vorlMW9c15zT4PssZWYcZgEUUtJlXb4RjoBKIphj2Pn2RbeCQh24ceAjDD5RY/onn1RO6oUgVno
	P9kBenrIi58n3yhgIQxYSwrrZtChi1L1q9zlXgvCmWo8hjO9LdoSwTxSBCW7eK2EUf6HIKbLDVK
	EqBfdSZP82cwW2tV7i/gxa7BwTy9DNaMJf2oBMfBXIn1jH04S3/xjb/lRaRGoxES3WaTyPgz20t
	kf45gHHRNpiHdTR8NVRrPObF+dH80gxPe1xNLc2yhM9AMDL/5l7jPA==
X-Received: by 2002:a2e:be25:0:b0:3a3:24f9:6e8b with SMTP id
 38308e7fff4ca-3a350111d2cmr8809311fa.11.1788352881844; Wed, 02 Sep 2026
 05:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260831060120.399342-2-alex.kiernan@gmail.com> <20c692768ef0b8ab15d6b884c11b5e0c5eb1f3ce.camel@linuxfoundation.org>
In-Reply-To: <20c692768ef0b8ab15d6b884c11b5e0c5eb1f3ce.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 2 Sep 2026 13:41:08 +0100
X-Gm-Features: AcwNN1U0eZgnAbk_3RKL8L_XIYhQYC7yhKTsDZOPjv6XYlrXVs8FZQj21wNDmmY
Message-ID: <CAO5Uq5S5O_O-9z2JXAJOhHrK2or5Qz47Mcd=OA4zYkgZq0GrRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Build .config from fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244945

On Wed, Sep 2, 2026 at 1:20=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2026-08-31 at 07:01 +0100, Alex Kiernan via lists.openembedded.or=
g wrote:
> > do_configure built wpa_supplicant's .config by sed-ing upstream's
> > defconfig and echoing CONFIG lines onto it, this is both fragile and
> > makes handling anything not covered by PACKAGECONFIG tricky.
> >
> > wpa_supplicant has no configure script and no kconfig - it's just make,
> > so switch do_configure to build the configuration from a base file and
> > .cfg fragments, which matches what CML1 recipes do (though this isn't
> > CML1).
> >
> > This should have no functional change; the effective configuration
> > should be identical.
> >
> > AI-Generated: Claude Opus 5 (Claude Code)
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  .../wpa-supplicant/wpa-supplicant/mbo.cfg     |  2 +
> >  .../wpa-supplicant/wpa-supplicant/suiteb.cfg  |  4 ++
> >  .../wpa-supplicant/tls-gnutls.cfg             | 23 ++++++++++
> >  .../wpa-supplicant/tls-openssl.cfg            |  7 +++
> >  .../wpa-supplicant/wpa-supplicant/wnm.cfg     |  2 +
> >  .../wpa-supplicant/wpa-supplicant_2.12.bb     | 46 +++++++------------
> >  6 files changed, 55 insertions(+), 29 deletions(-)
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant/mbo.cfg
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant/suiteb.cfg
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant/tls-gnutls.cfg
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant/tls-openssl.cfg
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-suppli=
cant/wnm.cfg
>
> I'm not convinced this is an improvement. It takes one relatively
> readable function and turns it into many different files spread all
> over and complicates the SRC_URI.
>
> I appreciate it isn't easy to add new entries currently but that could
> be solved by making this function a standalone function which a
> bbappend could add to, if the additional PACKAGECONFIG really isn't
> suitable for core.
>

Okay, I can do that instead... what really bit me was the need to
replace the whole config and then having override the entire
do_configure in order to stop it modifying it.

--=20
Alex Kiernan

