Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576D8CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 09:06:48 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6609.1778749598054998418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 02:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PemRNdiW;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: adam.blank.g@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-479dc6d26e3so4444666b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 02:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778749597; cv=none;
        d=google.com; s=arc-20240605;
        b=Ufnzi+uXXWpl6/umAsUdj1gBXclOy0Ovkov5GSUNuCOVTtZNwf8u2buDtRfZw2A2b6
         IaBys0UJpw6OdEKQOcEeACK7t2+b7q+GsdRgDh47tcU618R92GvlOG2Q8Jj5pfLejQVO
         /pzRi4TPeb5LdMN5nL4gDerrv9BN/x1/idGlX2Jr8mB7kETFcrW0O3y9jUqvZ/yXy40p
         CdFh1hvLuRIcpHNXxR3oYflDs/xLeWCTlfmRAVfh7kwQeH77l2r8PkeOeWrl+G/ButaZ
         GHNXZA8+6rUkqUkxRDh2BIXLEdXzLTgPg9uK+fpYSwvy55G2VeQmGrhNH2nugCMR+5QH
         yS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3N26aZUxMsGrDn7scAnsDI6jE/6h5X78U926jp5xeOA=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=iLECRhYPxIPYGPy9MJrTENWyjc+aUf49gZkhjDav5g7hYy5TIiPL3RW35n4PDuG9za
         ygiUwVnmWvCnYcWFkyFGxI5odAA1mUx2oZcCPXpoJIxtx69AbAGX4soZsw82Ov2cqyXD
         XXZvLk2SvYSBS/Ji9dMYkUIH9CskUhVMWF8NcsdEH9PKhGoDDCXsFoHKFPI2kCNcwr1K
         /oDjLrE5G27LLr7/6YVOLiJIkxF8I6Uj7s6Vu7yVRgzzqlFkAfBobdxPlfW8Yl15TtZt
         K+E9XzhSZ8pQDcmCcztISil8THDRdWnTWsUpZUbrzi23ZnYGv1sZMdokM4VKCwYDk2l+
         FWYQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778749597; x=1779354397; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3N26aZUxMsGrDn7scAnsDI6jE/6h5X78U926jp5xeOA=;
        b=PemRNdiW4+aS6ch8tRQ/YmGg1pO3MrC+hyTy06pc+3kcIAFBByBloW2JrVkgYP0Gfm
         iG4bqWfMh+xG5/zV0agdwGaXY9sMSEBxzLlXO0JgRSSEbBRCQar0+B7V59ALIcy9H6tu
         1L8A1d89T2sVUofUzjImkKXq/ZTXzYZVnBEjCktEFUddcxBZEpOzJ+nHDx72wSTDjM9c
         LSop98mXTxvpTICOgRQcSB5xb7wqKnKNq669T0gZvqsRu2y3HB8EyXyzodIex5Ct7r9B
         sAUvE/IZKseBny3/GclOMQY1KfNQfwnvL37gSg/BzbR53zl1AFcLGSBTdkPym1Hhu0aQ
         Kz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778749597; x=1779354397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N26aZUxMsGrDn7scAnsDI6jE/6h5X78U926jp5xeOA=;
        b=JTLGaAcY3HXuE7fuX2kePqXGR9rObHolI/gkAVQ+4fPVwn9QpyhX0om51h8nUJlZqh
         4qn21ZH6/9iknH9K21GiQHcnsS/CX6WeNyjly1J544YO1M05X0iWQYCisNQWP82DYB3f
         xjPpipd3pXoi0vz2aR4i3BYlC4A+YWnEKsULySXRSoj+/tr4274XcWvVHHwIQ1Ii0G9e
         1o74zpj9VcfGAIiNcEZbdE8avf18vGdMHwNCHlHCVs+mKwEDiY2zWxeT6x51zpRb9BYR
         SvwH+yXZEOYBbfFgVRecAP57v1JE0z/KYzX+cu8pRpFRK7NehiGTPDNRPXQwv1ZJyaWD
         9Keg==
X-Gm-Message-State: AOJu0YxlmBTuVUYl8UjsCvkl7ZAaSzapnj0MCqe/zokRgIoHvP9y2T1i
	Jh2rnTZDWJQ2E1e1uYgUNGN0Ao4f9DlCWDIx2jxjepj/6G91QcYXRbPXXyZRAw3XzpP63A2JcZs
	gcLQxWcH+pW1R0Sup8bJWV9wqs8t671Y=
X-Gm-Gg: Acq92OHw+L0i15xwVwbkvG51ikhXsoPShSgLWiQPY09q+fxTS+Cs/V9XsiRdCT1YnC6
	D744udr9U3QEmXVosbj7IU2F4loKb4LlX1kUxol+uK/yyUeVzuqEiYM64X+Z5nkENpfpymAgMo4
	ZT/YCtZe5w/GNxBnrmnviz5Ui6eVPQi7cmkP6Xt9qM8f3iurZqbCXyUrPgBbowxiMrv7P9AuLTH
	7/dmrViZCOizDuAQkIruGUBM42vlP8OmhOLffrcf9dADeqt4oPUg6KjN5VJq+g+fbvvPfMHiYJC
	cUbsm/P8lH2LSVcLrw==
X-Received: by 2002:a05:6820:4b83:b0:694:8d83:a344 with SMTP id
 006d021491bc7-69b7aa5d8b7mr3447739eaf.16.1778749597138; Thu, 14 May 2026
 02:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
 <64eb162c5c22721ff9d11d9c1f0d6c15aea3640a.camel@linuxfoundation.org>
 <CAFAffzxnk+YvferrFbRO2O_rrz8FvGbgKAmGewq0Rf=Mxye-cA@mail.gmail.com> <f59f44f5584cc54bea8813854aeb88ed10ba4014.camel@linuxfoundation.org>
In-Reply-To: <f59f44f5584cc54bea8813854aeb88ed10ba4014.camel@linuxfoundation.org>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 14 May 2026 11:06:26 +0200
X-Gm-Features: AVHnY4Khy-QWnv2mynzp9V_aERWGwsJSbBHVuIpxHQtzipQFMDwiXb2G8-3X_8g
Message-ID: <CAFAffzx821mRbp1V0ZUQ86edKpHZ=JPQOEjZ2Tfx=nimwEUzag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] Remove 'extend_recipe_sysroot' from 'BB_HASHEXCLUDE_COMMON'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e1c30f0651c36939"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 09:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237019

--000000000000e1c30f0651c36939
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 17:39, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-04-30 at 17:15 +0200, Adam Blank via
> lists.openembedded.org wrote:
> > >
> > > which is a lot of non-trivial change and a lot of extra data in the
> > > sigdata file.
> > >
> > > Do we really want all of this data to be added into every signature
> > > computation?
> > >
> > > Are we 100% sure that add the newly added variable dependencies are
> > > "safe" and won't trigger sstate cache reuse issues?
> >
> > Well, obviously such increase in the visibility of dependencies is
> > not a comforting or welcome thing, but let's not forget, that those
> > dependencies truly are there :-)
> > I'd ask the opposite question: given the extent and nature of the
> > relations exposed by this change, do we want to keep wholesale hiding
> > them with the current implementation?
> > Or in other words, are those particular dependencies (stemming from
> > 'extend_recipe_sysroot') so irrelevant for the overall signature and
> > sstate management, that it is justifiable to keep ignoring them in
> > such a unique way and on such a fundamental level?
> >
> > Unless it is truly a desirable situation and the whole subject can be
> > dismissed, what would be the recommended way to tackle it?
>
> FWIW I was finally able to isolate one example of a change here which
> isn't desired.
>
> For qemu-helper-native, we saw do_fetch change signatures when it
> shouldn't really have done. The change was:
>
> basehash changed from
> ba2bcd325c42f37db9aa87567dbf0ccd217f4f12910558975a9e52e642dd426c to
> bd5120be022a43e6fd1273a14f0ceda3b72847308d4c4e65bfe91f9fea21683e
> Variable SSTATETASKS value changed:
> "do_create_package_spdx do_create_recipe_sbom do_create_recipe_spdx
> do_create_spdx do_deploy_source_date_epoch do_package do_package_qa
> [-do_package_write_deb-] do_package_write_ipk [-do_package_write_rpm-]
> do_packagedata do_populate_lic do_populate_sysroot do_recipe_qa"
>
> which was probably a PACKAGE_CLASSES change in configuration triggering
> it.
>
> Whether this is the only undesired change in dependencies, I'm not sure
> but we do need to track these kinds of issues down.
>

I'd like to help somehow, but I don't have at my disposal a sufficiently
powerful setup.
Please let me know if I can be of any assistance.

Thanks,
Adam



>
> Cheers,
>
> Richard
>

--000000000000e1c30f0651c36939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 13 May 2026 at 17:39,=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 2026-04-30 at 17:15 +0200, Adam Bl=
ank via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; &gt; <br>
&gt; &gt; which is a lot of non-trivial change and a lot of extra data in t=
he<br>
&gt; &gt; sigdata file.<br>
&gt; &gt; <br>
&gt; &gt; Do we really want all of this data to be added into every signatu=
re<br>
&gt; &gt; computation?<br>
&gt; &gt; <br>
&gt; &gt; Are we 100% sure that add the newly added variable dependencies a=
re<br>
&gt; &gt; &quot;safe&quot; and won&#39;t trigger sstate cache reuse issues?=
<br>
&gt; <br>
&gt; Well, obviously such increase in the visibility of dependencies is<br>
&gt; not a comforting or welcome thing, but let&#39;s not forget, that thos=
e<br>
&gt; dependencies truly are there :-)<br>
&gt; I&#39;d ask the opposite question: given the extent and nature of the<=
br>
&gt; relations exposed by this change, do we want to keep wholesale hiding<=
br>
&gt; them with the current implementation?<br>
&gt; Or in other words, are those particular dependencies (stemming from<br=
>
&gt; &#39;extend_recipe_sysroot&#39;) so irrelevant for the overall signatu=
re and<br>
&gt; sstate management, that it is justifiable to keep ignoring them in<br>
&gt; such a unique way and on such a fundamental level?<br>
&gt; <br>
&gt; Unless it is truly a desirable situation and the whole subject can be<=
br>
&gt; dismissed, what would be the recommended way to tackle it?<br>
<br>
FWIW I was finally able to isolate one example of a change here which<br>
isn&#39;t desired.<br>
<br>
For qemu-helper-native, we saw do_fetch change signatures when it<br>
shouldn&#39;t really have done. The change was:<br>
<br>
basehash changed from ba2bcd325c42f37db9aa87567dbf0ccd217f4f12910558975a9e5=
2e642dd426c to bd5120be022a43e6fd1273a14f0ceda3b72847308d4c4e65bfe91f9fea21=
683e<br>
Variable SSTATETASKS value changed:<br>
&quot;do_create_package_spdx do_create_recipe_sbom do_create_recipe_spdx do=
_create_spdx do_deploy_source_date_epoch do_package do_package_qa [-do_pack=
age_write_deb-] do_package_write_ipk [-do_package_write_rpm-] do_packagedat=
a do_populate_lic do_populate_sysroot do_recipe_qa&quot;<br>
<br>
which was probably a PACKAGE_CLASSES change in configuration triggering<br>
it.<br>
<br>
Whether this is the only undesired change in dependencies, I&#39;m not sure=
<br>
but we do need to track these kinds of issues down.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d=
 like to help somehow, but I don&#39;t have at my disposal a sufficiently p=
owerful setup.</div><div class=3D"gmail_default" style=3D"font-size:small">=
Please let me know if I can be of any assistance.</div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Thanks,</div><div class=
=3D"gmail_default" style=3D"font-size:small">Adam</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000e1c30f0651c36939--

