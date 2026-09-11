Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74445C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:51:06 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41298.1789138262453011391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HbZxDRQT;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-87ffa98d4a9so8873837b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789138261; cv=none;
        d=google.com; s=arc-20260327;
        b=iijZ0Bo4BqaxohDkki1eEZmUSF4aR5aUpeP+DlX4lid1N0/7nzuf9pM/S45J3sqxv9
         Y70T9f+fmc2lOoHX6rg2GU8+sm7k9ZY0nlmAT52Kig1yGyaIxvWECENfv/FD15fEmSaZ
         AKlsKKrwa5CdR2RvNMBwV928w6B94112t1bg1FZQ9zUlGWvMy1Fwl1y/P/rnn7m7DAim
         BPULb2kwke2o84oMAKuzE6ojy+L8SWFgAUhJYyELl2jdo5EmdeO0Jg7nj7u5ndRCR6I1
         nDotUz72nD49o+o10Gbhd+EMypPKBF0ttk2VpS7f6zHuZ++WdOZu642LZy/swKYS+uti
         /85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=txSPGgCEtbyofUMliNHaSlYBLU7QgKDH9/mytQabRd8=;
        fh=I7T9xo7H0yqO1cDUtKX8D9+86EPaeI8Cop/3loUtdnY=;
        b=pm4CGt/Ztz7TIevM0JpF4VzDxe06/Jb2Tb61UZZyB8zcCjehCOqa6k3ooMgKRIG4xI
         Lq3bXnfwL8Pi7VfU81BIk3ZuhBLrPxGKUU2LD0S1f8H2qLDddo9R9gCz37dp/XW8qJBa
         hwPkgBfolxOxgKmBr4paXrqVJRAZNRVgIuJT3ETlrQexJd5YHtgkue7JC7efdKv+aHDW
         mc4cOA2YXckAUcCsJKnNHMsPEEEFJqHAAoUlteXtZxQbXBkZXFhthFHdlSv7pP+RFH2J
         SGpOnzjWvBUXlN46Pp/y4ZK8I8MASr+u9fY0WsTBFvoQyjWk7iLfKs0ejTXdyoke54CT
         lPhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138261; x=1789743061; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txSPGgCEtbyofUMliNHaSlYBLU7QgKDH9/mytQabRd8=;
        b=HbZxDRQTy6vIrfygVU59PXWO/CSatnijGgVju2R5IV8uPLAaupwa6r/M01jjAqsRas
         AfJ7zoXb9y27LMsS1omWtJnCbYp0lykjRPwf1/RwSNYw909+pPfla8as2Y4XpS6AsoRw
         vpzpXX6IDsKIg9M5+unUimGNwFzuHOB37X2Ab8JI322Uz+lW6x0CPFoZm8B/WwWZmuDO
         7D/cMrOmuZjqA9+agi26kYMVnVc7haESkn0jBTYMip7j4Q63/p8RY8uj/AnZuSXDJIu9
         XhourNEG8vw6y0Os2PKjBVzS7I2nVdDe/SShplOLWVHxLNvy7+63gZkDtf6PH+EsK6Qm
         2/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138261; x=1789743061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=txSPGgCEtbyofUMliNHaSlYBLU7QgKDH9/mytQabRd8=;
        b=ko6YQiX1bIs9B1jLZydorYLIePEJHcEVvQYD5GghtyCAvVZW3Xe1ew6zGS+CQQLSdU
         nm77KG94I7j/aEViI9IkUFkhXiWA8kEsUBcJVovV2OdfWpfotE1fD8YRP3yh3bjIubFV
         nEgSocpY6u49lbTCJe3moXIAgim1+pUuqcw0ZRi424+VnOIjwypVtEs/0M4WuZ/CFb/i
         uVy0JmJnbR0pAb8qytiYV3fTwkFsQm8nTrw6cDtpSOqGWPO9DPnmviFqF0TySY73ZI9L
         ubt6wL+ZjctGxhF9exvPBERiNw3rjxrvdIQSlJC/m0BMRZ7Bg3WqxnWjxjfEkoLNEC/l
         2CXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNzAUiYL5XyICDXOJ1w6vD0PEOSU8atlytFbyjemnCGcOCT4bFADeXibWmhWPti2PTbFX0sNg3mtDGMc+71BhUmg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nekUNk+vCUelcghqzBoZDufP+pEkut/OJ6HgrgEJFNy4ojdqa1
	E49TC93rFdTmLxBFh7vSAkJh1X896jPp3awIocHqIQam+Q/J57/cFsGuy/UxXTYg9CA+m9jEwWZ
	xIL8rLC/ehnko5mZqInH4jFoVDK/0XcS3iQ==
X-Gm-Gg: AYBFou2w1sNyap769n033/DRYqzDj+cGrIAU8zN9n+jeKWEqjoHkX6EI554x/QZWNxz
	wyb8+DprgyLsNr0Gvj9hT9PqOj8pU7OJ65CBi5K2O1eupsHMDGuTRuw+5FJkb4ZYUJHxXReWLDW
	TDfspKrvWsPT1YTii35GhrsbjCpOTfVZoACcVliL6uj82bFnp42rVBYcFA6NodKB9aA37CG4yM8
	CfcfpwNKI1ZHjUGT/yPTdUdjNyGhxqZHvXxKfnR45BmuozLrLgt+DzAlRbnNyX4xpLJcjL29aJ8
	sHeGlN9cVUYIRjspf08HM91XeUosxLbz1NGdrFAVsg20BNrsHdiaWgCgUjzybjhKnxviuYrf17V
	8z2+Y96xBGYLaH1/hxBcy7t0Sr9Y+KT5jW6tiIvT3nX5MlegfazuQASR5GPvbxTlz2UeziBS1dd
	P52TQlecBrKHnLuPjQ6eXjlYObC2AEMupfh0blzndlyIpNr9zFM9sL5A3Dk6l/kt0KEBmhkl4z1
	BEA2E2v1rSUFMDMVcTxIUPIgpvymUgn8sQ=
X-Received: by 2002:a05:690c:6d82:b0:887:1d0a:f124 with SMTP id
 00721157ae682-8871d1a5910mr133037b3.25.1789138261457; Fri, 11 Sep 2026
 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260911115237.1538030-1-sunilkumar.dora@windriver.com> <57b22a197440f052d86c5199f694d008e811db2c.camel@linuxfoundation.org>
In-Reply-To: <57b22a197440f052d86c5199f694d008e811db2c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Sep 2026 07:50:35 -0700
X-Gm-Features: AcwNN1VcFNuP5ag9FUwpGrMedCwYRZVk9WqZgJh0hhJ09Vu8KkFiT76Gw6z4cTo
Message-ID: <CAMKF1soqVQ7y8nOcJydco1YohTK+gv-4pFe1_Dand0cx-2E3Jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang/llvm: Upgrade to 23.1.1 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org, 
	sundeep.kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000874120065b3636d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245658

--000000000000874120065b3636d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:41=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2026-09-11 at 17:22 +0530, Dora, Sunil Kumar via
> lists.openembedded.org wrote:
> > From: Sunil Dora <sunilkumar.dora@windriver.com>
> >
> > https://discourse.llvm.org/t/llvm-23-1-1-released/91760
> >
> > Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and
> > mark the musl ssp_nonshared driver patch as a backport: both fixes
> > are included in this release.
>
> Sorry, I don't quite follow. Why are we marking it as a backport if it
> is included in the release?
>

Good point, I thought backport to 23 release branch was after the 23.1.1
release tag was made but it
is included in tag so I wonder if release tarballs do not have it ?


>
> Cheers,
>
> Richard
>

--000000000000874120065b3636d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11,=
 2026 at 7:41=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-09-11=
 at 17:22 +0530, Dora, Sunil Kumar via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@windriver.com" =
target=3D"_blank">sunilkumar.dora@windriver.com</a>&gt;<br>
&gt; <br>
&gt; <a href=3D"https://discourse.llvm.org/t/llvm-23-1-1-released/91760" re=
l=3D"noreferrer" target=3D"_blank">https://discourse.llvm.org/t/llvm-23-1-1=
-released/91760</a><br>
&gt; <br>
&gt; Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and<br=
>
&gt; mark the musl ssp_nonshared driver patch as a backport: both fixes<br>
&gt; are included in this release.<br>
<br>
Sorry, I don&#39;t quite follow. Why are we marking it as a backport if it<=
br>
is included in the release?<br></blockquote><div><br></div><div>Good point,=
 I thought backport to 23 release branch was after the 23.1.1 release tag w=
as made but it</div><div>is included in tag so I wonder if release tarballs=
 do not=C2=A0have it ?</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000874120065b3636d8--

