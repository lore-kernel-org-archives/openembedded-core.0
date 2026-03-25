Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60619106B522
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:35:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21458.1774442095413298801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M2MZEX6G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso23526515e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774442094; x=1775046894; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2McwT3AT9sCAUPIoLrbnH/bdLShNbktlWVd/ICjNJ9k=;
        b=M2MZEX6GNDujtKVGk2kr36gB1x1I5zeuuTeYDlMB3/Uij2KrZ79vd+bHhZil232XXe
         gchVgwcVrG+UUGHChqCOSOha+7TmBF98jR6gZhZKGRocp671pGTubHQcRU/qcP2AgPqr
         W43UWQxSMw7+lUU/GNp/6btbS/HLXm3AHok3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442094; x=1775046894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2McwT3AT9sCAUPIoLrbnH/bdLShNbktlWVd/ICjNJ9k=;
        b=ScQeCeN0NWyoSeu6gjZkiA53O9BZCPjNjihtNfRjlEzRESwuCES5S8R0ZalUOYEcdZ
         iL8DJpVzwzYRisKjlNV7NOCXiMABVZJcAxBKOxEw/7EJ2jkSN2emBUMKVAt+tLg2P7bK
         VXKTTiNvr3PMcBlmCiOmat6uyzWMcq0p2N87PgMveRzqi7RVccVsjvgZaVPtvDC1GcMj
         ynHiKi22xUqG7spA2oUiVPMt26vbFSKIWyg8Q0N+rIQbjZk+CqaynPsz1f+D1F6DNix7
         9oiujrkxlyWtM2zr+QqzLZ9Tg9qH1Bu4GLHx6lYVe6kgT8cJHTAmRTE/fBT8THkVJFuL
         dc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3dJEInbxZTJotlBably9da/2RmEUu7lNYiJ9lIOowcI5SMt+K95MdPFo0u5FM/QLu9o2JPWunB/Ldz4LzROrYig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhBKCLxAJdr+p8UzBN1s9CB981kNbwUOxDWBmjmk5cc6972pej
	42UzUmsLQmj9Aq5yB59yJzMjiw3QR4IatUxDInGm4p0arYaqj4aN26oc/AVz0oRjSE0=
X-Gm-Gg: ATEYQzzJCCcOMyrMuglY5yUgHghex0kNHoCbMuT8/N2GvP/zp0v1YbyOhInsEReFyf6
	lVWb28GFnWDkWyEiSeWtT1kXE/s5qsvJ4WJBp775mwejI+Rpl5fOD2U+xWBgUGYYBPuY91RMhk4
	7cmKQUEu6BSeuXDiFWh7XSfS4FVZ5cmAzSHoVWHTlxl92Atj/NW3sDXUtnj/j5PmtwvSUWGgU6Q
	YX8Tuz2DtAwOtX31qnZJnGXV5OTX4CguLwT52m5iEcYImZhYlS1J+vETQRfK2/P7rxLCM+kQ7jV
	vPo+vJRAvGRdpS/Of4T97VD0fwF4CFklmkYBsth3CVx5f12pd3geC/TIAXpFtMiWkZH10q5NGNA
	MphMFYnh/hQniSxkW+2LqcmGbHggPfLXE9s2FJp0jFMfOtZ062Gj6UzbFW5HaVUlxSh9Wn3ggCC
	/g2OMpyUcc8CPn6SKwhCJEHnjQ+izlCmNzY7xT0HYAMK22m/1YvuwOrkqrEQBWIGMQW1V8o9BdA
	hwGto3Mqjpk5th2G1/j0S0EwGo=
X-Received: by 2002:a05:600c:1548:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48715ff7a16mr55007745e9.13.1774442093562;
        Wed, 25 Mar 2026 05:34:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:74e2:2425:51dc:4aed? ([2001:8b0:aba:5f3c:74e2:2425:51dc:4aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172f916asm29586325e9.5.2026.03.25.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:34:52 -0700 (PDT)
Message-ID: <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: fix buildpaths QA with LTO
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: patrick@stwcx.xyz, openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2026 12:34:52 +0000
In-Reply-To: <acPLE7KjSfvxXthX@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
	 <acPLE7KjSfvxXthX@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233897

On Wed, 2026-03-25 at 07:46 -0400, Patrick Williams via lists.openembedded.=
org wrote:
> On Wed, Mar 25, 2026 at 07:39:51AM -0400, Patrick Williams wrote:
> > When LTO is enabled, due to a gcc bug[1], the linker needs the same
> > flags in DEBUG_PREFIX_MAP as the compiler.=C2=A0 Without this the build=
paths
> > QA failure can occur due to unstripped build directory strings in the
> > DWARF data.
> >=20
> > With GCC 15.2 this can be noticed by setting many meson-built packages,
> > such as systemd, with:
> >=20
> > =C2=A0=C2=A0=C2=A0 EXTRA_OEMESON:append:class-target =3D " -Db_lto=3Dtr=
ue"
> >=20
> > Add the DEBUG_PREFIX_MAP to the TARGET_LDFLAGS for gcc.
> >=20
> > While the lto.inc enables LTO across the whole image, some packages
> > either manually enable LTO on their own or downstream recipe
> > maintainers have explicitly set LTO in specific packages, so it is not
> > sufficient to set this in lto.inc only.
> >=20
> > [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805
> >=20
> > Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> > ---
>=20
> A few other mailing list threads also talk about this problem.
>=20
> One alternative is to re-add it to the TARGET_LDFLAGS in bitbake.conf by
> reverting 1797741aad02b8bf429fac4b81e30cdda64b5448 [1], but that seems to
> have problems for cgo applications which might be resolved by another
> patch[2].=C2=A0 Adding to lto.inc[3] isn't sufficient for the reasons I
> mentioned above.
>=20
> [1]: https://lore.kernel.org/openembedded-core/20260122194959.13457-2-rs@=
ti.com/#t
> [2]: https://lore.kernel.org/openembedded-core/20260127170344.2960247-2-r=
s@ti.com/
> [3]: https://lore.kernel.org/openembedded-core/20260204052638.284617-1-ch=
angqing.li@windriver.com/

We're not seeing the error with OE-Core today in any of our automated
testing. Reading the above, it implies that we should see some kind of
failure with some components auto-selecting it? Something therefore
isn't adding up.

Whilst there is an open gcc bug report, that bug report is basically
asking for specific test cases to debug and fix the issue further.

So I think we need more info on where/when things are breaking since
we're not seeing it out the box.

Cheers,

Richard







