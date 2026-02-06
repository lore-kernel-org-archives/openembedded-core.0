Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1507FEE208C
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:55:52 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8822.1770375346868358277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=foff02Lj;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4094fbd1808so275379fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770375346; cv=none;
        d=google.com; s=arc-20240605;
        b=MSIsPQKIwK2+udSKJ3lgBhd/2RNVCxXN3OGZxy9nxmf3dPrtj6SFn0Ew2Cuxd3SiRP
         n8esik/OFDwnbNmcOw0FD0uF6zEJVdnB0LZku7iCNFDE8bSPXK0Tz41fA6DwHKD6Iv8O
         eNTUv2E65TMb438vZEVe6cya5QC4y3vgorZhK2fEza8qghM5xyd7X8zr6wS/s3R9IAe4
         i87CwnQFRAHyIZ3XtFRVjCEByCQjEf+jzqpkwBKBpHdL45+E3HmqqIkkaofv3US1VYEQ
         sw/3YDH3DV2GWsCi/Y9GWooTq8FQ0wVcc5XMt/BliT1GhUv1Dp/dtiB8PgVj6aDrvokD
         i3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Th0W73Nqgyn5NoeYnBxadQ6KA/6Pw5u5hRsV2jGqIi4=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=NjPsVgVVA3IZUI5GDPslsf12B32phWu0f32PBD6sx0XC4z3GVwXYC4v39qQwlyL0Ht
         p/X03uBYmxqAjy681k1PqHO0iM5sRuEAI3fc77E1LIHlAkXWXi0JSSU1hMOjgjMa/EBU
         tVwTbT0EoDhqoAAhdoTA6khrpmLSvL7BYnxe3BeUhb4kNIJeXBoQaeLidAVckPy8n2jE
         DABpNXnlmtQwC+4iu5WmQdM2P6J3xlz8869Lp2iRR6JrM/LFelhMhEWvPWMfJE2h5sgz
         Gam/cs5ruB/yKpLWyza7GblJ6wzg5GOAv5xp42gyrxa6VGFuAxWNIRkIbUSfaLCq3R0g
         vXhw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375346; x=1770980146; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th0W73Nqgyn5NoeYnBxadQ6KA/6Pw5u5hRsV2jGqIi4=;
        b=foff02Ljz1UHM55xqQc12L6uRQsPbZlKTv4PAh9+SLDgiSszDERCcDzxN5JUN3PNh8
         t/X73ya+BwGfSuvjwbivq1zDxWridNA8pPoAuAt4pup9k5xhmgYs+X5CB4ETdTPKgfnv
         xBeUKbhRQZTShR9mNmZG4jZa/txOZgk2c3CZgCG2OUoLYxZKNJOh5aJLllt/eAxTijQt
         L2CoTbPKdAFYy/EgLK7PDsTX+0HcucOVpN0GjSqVIaOw5DTmCm3pwWQcIvbN1StWhhP/
         /6A4PkZ0pJTN1mEN27jJKNrTl9gQ3yLgVynC+ANtcu0JCHsfYZkt8LKuqLGLVG7hjWnN
         AQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375346; x=1770980146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Th0W73Nqgyn5NoeYnBxadQ6KA/6Pw5u5hRsV2jGqIi4=;
        b=WR6IeOFNf7itqX+Cs4+2GQoKpxgi5NCB+1JQS72ETj3IxUK10OqPW/ISJGkJnhkSPv
         SuPAZFmZ37BFDHPDXw5x1Nc0Y1D7Os4DeMN04zPYfALlvw5mNYobb5+vCzLWTmxEtPTj
         Jur2Y5UyUZkUe119gM5+u69LUXO2QDEL2gEtw5fIngQBOVuHNXyIqnIF46XugxHdD8U1
         ySn6hkeRnwp8dxqWRxlMAHnqPbiWOr0HpzB/Wx4PuZ794qI2QxpGSKCCZxDl44gssjku
         NgZRLyJAK5oGIw0TRjS/lzi7+Hnpny4k8VovaNN5Gw7BsQQkhBLawmigqnLB4P7GVTwP
         /H7Q==
X-Gm-Message-State: AOJu0YzLwGwBSFJ0YX11LynUm7xyyN3Y9C+352IwO9WfPxorTxco4Hpa
	8an5AhuibkvDaMqVwsNvpfgk1ROL+O3ybxad24pqmbTMBcvXv/vKVy48in7+t/OLVgQzW5BxQDW
	hhLYbVylu761SNf5aU25AE35TsZjQ89vRdA==
X-Gm-Gg: AZuq6aJ3AVtUCjto+t8eb+OY2ZP36Jaj8fRBDhki9uVh2RuaW2EOTLJel2eKMsSQrsx
	zAtj77H7VUkpid+kQ5wPt/RxINlj0KL94LhxJiwTy3ANNp9zPhFwVzVaUbkmMIa/nVv06PnYWK2
	TcgV56cEyNOHvLWVirzWSBVg+G/r+TaWyVqicLftbmxNnhILSAg6orx93driiKTGm/rCoeUXwqX
	Khgwwkwg6e+Vo1f40WScQArmudVQ6nvq3R7ttEOhSLtSE0tU9BkyY81qxLrdbRLdqbeLlYe
X-Received: by 2002:a05:6820:6aca:b0:663:9b9:9297 with SMTP id
 006d021491bc7-66d0c6685ccmr1118310eaf.64.1770375345919; Fri, 06 Feb 2026
 02:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
 <20260206104322.2604271-2-ankur.tyagi85@gmail.com> <AS1PR10MB56975AF8854ECD9772244297FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56975AF8854ECD9772244297FD66A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 6 Feb 2026 23:55:34 +1300
X-Gm-Features: AZwV_QiDVBLRHpzP49A5bZBOp5IXQiLySWVosat_08ICgKwl3W3OMUpfMRD600Y
Message-ID: <CADySD0HO2+XsWrr77rKSD09ZJSPobo=7NDsddYgfy8dNBwW8eA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230609

On Fri, Feb 6, 2026 at 11:49=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> This patch is not needed because vim was upgraded on master.
> https://git.openembedded.org/openembedded-core/commit/?id=3Dcf63518d20c3c=
4a61b0e726edf1df2201e88e8ab
>

Got it, thanks Peter.

> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> > lists.openembedded.org
> > Sent: Friday, February 6, 2026 11:43
> > To: openembedded-core@lists.openembedded.org
> > Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > Subject: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta/recipes-support/vim/vim_9.1.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-
> > support/vim/vim_9.1.bb
> > index fee9f055e9..c492342ffb 100644
> > --- a/meta/recipes-support/vim/vim_9.1.bb
> > +++ b/meta/recipes-support/vim/vim_9.1.bb
> > @@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] =3D "${bindir}/xxd"
> >  # in many places for _FORTIFY_SOURCE=3D2.  Security flags become part =
of CC.
> >  #
> >  lcl_maybe_fortify =3D "${@oe.utils.conditional('DEBUG_BUILD','1','','-
> > D_FORTIFY_SOURCE=3D1',d)}"
> > +
> > +CVE_STATUS[CVE-2025-66476] =3D "not-applicable-platform: Issue only ap=
plies on
> > Windows"

