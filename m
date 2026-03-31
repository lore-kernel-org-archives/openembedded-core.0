Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99BE109B47C
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:46:42 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22204.1774968393710179837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RrOfaUfv;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso7174950c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774968393; cv=none;
        d=google.com; s=arc-20240605;
        b=RKOxE4fsADThOW587NHs67aR9MHffYY5nHWB0BxvlDMnT+k7RUUhf+t5FF5JEeq8Zi
         uQazKqeXrEhW7LWP2nRuARei3MdFg53YoBLr6Z0YQLTj3GfisaO+o/N2zo0S+53lY8Qn
         90HlyPT2ADmxwa8ZkkPHTzws/fUcOkhgmudz5dQ1f/0EmPhL03T29eHuEY0R18PR8DLN
         jYg0bEr57t1DZue8suVwKM9lU05sOjDvaxOisYmPrrouh82qm/fnS2lQMtlP10q0EcNE
         mUZtQ3QBG7DVuacMDFXMXv0fh3/Svh+Vsz2cjBE8IR99nZUj+LzM0SeDmKKyu/4Hz8C4
         +qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7oLHt5BMrEqinTLcE/1g6uiy34fqS25O2E2QfCPEWwM=;
        fh=WABLZ1G7thb1iYij3Th4TTGgsrVnSbkKcpu+44AYYUU=;
        b=LAdr+uykOE0VEso8sEItph9n2C2kJZgpEN9m0lwr8oJvLuM15lAY5Lpcg+JHHc7R8A
         Blvt7M7RATalKChcjDOBRoFhupiBRR5SYtjFsg667EulQEL9rywgFUlXgu3ZmUszvpMg
         IKViII0JQmho4YoDXol1QZeUtMoROSoNNSsOg4v1UIvY7ViMlV7nriVfdozWJSnD2oGC
         aBhG9wqjBV8Je9M3oqUw4tz0bSIAj0cnWpqRNj1M4sgXsn4UcuSBwL89KDxKxvz+MzC6
         tIweA7NcSsMPRS/UNgcrPB2NSYG75OpCJtTGScVGOq75y8lmAuRnx/prQpOwXoKRDAW9
         2jcQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774968393; x=1775573193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7oLHt5BMrEqinTLcE/1g6uiy34fqS25O2E2QfCPEWwM=;
        b=RrOfaUfvjisRA0Mo1kuWjMFT4Pbu0FfI6u3OoKO0zFetRmkaV7fyj6qlVPrx3y4u5E
         1a4CIvyW2ftT/wfOBCIe4F5JH/XpAajHAZB1ZQJrMJkEQmQYoCh+j7MnHC9Q2j+norhQ
         rbWiyUnDcxN7qlMTqoHKR2ceFT7lPvgPUTlCuMhEOxI7X59XbvteMJaDojSh0XUAMfql
         exBMf3XRr+sIM8H/HvzCwz8nUYWPKzvAz/01BjQHmDqXJJ5JH85ZEIPpC1xnf3JNKpZS
         yuzXVto/6LSWm+8dhbZEWhYjV+a7tri6PexPVNdHnrrOFjAvt5ZLaLWU37E4YOlczi/Q
         duIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968393; x=1775573193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oLHt5BMrEqinTLcE/1g6uiy34fqS25O2E2QfCPEWwM=;
        b=FvkiIuQnGLgYWWlVRIcsyPVYD87u74rh80f2LN2iyANzL+/EwcqUIootkGUur+ucfm
         lE/eG8RTObGKGZyRTR/KFTFvCsKIV5zD3wBwQS0zXpkwa3O5K/thxtaeVe+MX/JvjPuL
         4js6lxmpFFMAAKOtrOxRbScrq/CS8FkyfJSGvpOHzhcR44YTuDdrjXPjlHKC/ZEACIfz
         WxXynawLqbKsRMbglDjW7sMAy7QS1LKvyqRd56PAA9/tFpecB0Fwh4PV+kNsWFSxLOpR
         UFdlCu3pEqybv92nrdqc3BMsxXFLHj7zaY7KkhGN/j0BX6t4ca91INQGpjAsoNYcHptw
         MQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWefRt6UBsU6t3XAHJlYVCq4lY5ACPtr4r2N69RghlZ8fJWmfJKMR/Qte0y6i3ulk6haSnTX+ypNUuFSObthxDG9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjAGhURNtT9Eqh6oE2BfEvzTcVbPbfZ6pOzeU71SkV5B/FeQto
	IPMWpCsMQ6cWgkfcPpCfLqeijqgUFTsyy/Je8J+s8hZD9uN167mOz/PbD1rAyUri5BOoeXnn9OR
	eB6PfEWZeO+eBZc1eHufTVHmL/VJcOY3y4n5g
X-Gm-Gg: ATEYQzzBddGLKo2rESr2jn1zJFAgC6cBHGzrc+3/hS2Q2z/UqLpyDP4bE2jMP1YZIHl
	oib9pRh+bwN1BiapwP+sJLmLh7RGSlTtpClUc1dpvqu1EPK7mXKM4EqyBkYArimw/JdKTQaUTps
	/DsnovGLW1yNvT8L6LpfMjM2h1KTaXAJ+50DJA2FqOVm9vL5Us+dePfiJNwxa9sykVy+rmSLzP6
	h6ImIkF6mna/QqT9RRU/IUanQRIdkh7YxfdmO4iiLSTnyulHYbfxnJHdLrc8/3DHZBh5BRfASlB
	g18/jMkMHQHB/CKcJM3y4c1orh196X041T5o7byj
X-Received: by 2002:a05:7023:b0d:b0:128:d4db:447a with SMTP id
 a92af1059eb24-12ab28f63c2mr8052124c88.29.1774968392951; Tue, 31 Mar 2026
 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260331141956.608976-1-stondo@gmail.com> <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
In-Reply-To: <dc8346baa9db2434b2296c22550e40ac7389201e.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 31 Mar 2026 16:46:20 +0200
X-Gm-Features: AQROBzAKJL9Z5PJIH1QixBY3DDZb8kJB50PMWvlfk_AGpJwYnwF1zBCshwgRkZo
Message-ID: <CAApg2=QSBugMbP=ii0YDGDQQ9ztBm86e-jYcyYR0DKKMi-XGzQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/2] spdx30: Add OpenVEX standalone document generation
To: richard.purdie@linuxfoundation.org
Cc: stondo@gmail.com, openembedded-core@lists.openembedded.org, 
	JPEWhacker@gmail.com, ross.burton@arm.com, marta.rybczynska@syslinbit.com, 
	benjamin.robin@bootlin.com, peter.marko@siemens.com, 
	adrian.freihofer@siemens.com, mathieu.dubois-briand@bootlin.com, 
	stefano.tondo.ext@siemens.com
Content-Type: multipart/alternative; boundary="0000000000008cac3e064e53088d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 14:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234296

--0000000000008cac3e064e53088d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 4:23=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> On Tue, 2026-03-31 at 16:19 +0200, stondo@gmail.com wrote:
> > Back at the end of December 2025, I had a conversation with Adrian
> > regarding OpenVEX. Following my SPDX 3.0 enhancement series that was
> > merged recently [1], I would like to propose adding OpenVEX [2]
> > standalone document generation to the SPDX 3.0 workflow.
> >
> >
> > Context: current VEX landscape in oe-core
> > -----------------------------------------
> >
> > Yocto currently has three VEX-related mechanisms:
> >
> > 1. SPDX embedded VEX (Joshua's recipe-level architecture in
> >    create-spdx-3.0): VEX assessment relationships embedded inside SPDX
> >    3.0 documents, controlled by SPDX_INCLUDE_VEX. This is the richest
> >    VEX data source, now at recipe level after the package VEX
> >    removal [3].
> >
> > 2. vex.bbclass (Marta Rybczynska): A standalone do_generate_vex task
> >    that produces per-recipe JSON files and a rootfs manifest in a custo=
m
> >    Yocto JSON format. Used for CVE reporting and consumed by external
> >    analysis tools.
> >
> > 3. sbom-cve-check (Benjamin Robin, under review [4]): Post-build CVE
> >    analysis using an external tool that reads SPDX SBOMs + vex.bbclass
> >    manifests, then re-exports enriched SPDX 3 data.
> >
> > What is currently missing is output in the OpenVEX format (openvex.dev)=
,
> > which is a lightweight, interoperable JSON format adopted by an
> > increasing number of vulnerability management tools.
>
> vex.bbclass is about to be removed, which simplifies things a bit.
>
> Is there any reason we can't have an external script which extracts the
> vex data from the spdx?
>
> My personal view is that it might better to support various
> conversion/extraction tools rather than trying to output all the
> formats someone might want directly...
>
>
Useful VEX information includes vendor context (eg. checked that the
vulnerability
is not reachable under normal usage conditions). We do not have a framework
to
do so today. Necessarily, such VEX output will need to be manually edited b=
y
vendors before publication.

Because of that, I agree with Richard that a standalone tool that extracts
the annotation
from SPDX and allows users to modify/add annotations is a better solution.

Kind regards,
Marta

--0000000000008cac3e064e53088d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31,=
 2026 at 4:23=E2=80=AFPM Richard Purdie via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a href=3D"mailt=
o:linuxfoundation.org@lists.openembedded.org">linuxfoundation.org@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Tue, 2026-03-31 at 16:19 +0200, <a href=3D"mailto:stondo@gm=
ail.com" target=3D"_blank">stondo@gmail.com</a> wrote:<br>
&gt; Back at the end of December 2025, I had a conversation with Adrian<br>
&gt; regarding OpenVEX. Following my SPDX 3.0 enhancement series that was<b=
r>
&gt; merged recently [1], I would like to propose adding OpenVEX [2]<br>
&gt; standalone document generation to the SPDX 3.0 workflow.<br>
&gt; <br>
&gt; <br>
&gt; Context: current VEX landscape in oe-core<br>
&gt; -----------------------------------------<br>
&gt; <br>
&gt; Yocto currently has three VEX-related mechanisms:<br>
&gt; <br>
&gt; 1. SPDX embedded VEX (Joshua&#39;s recipe-level architecture in<br>
&gt; =C2=A0=C2=A0 create-spdx-3.0): VEX assessment relationships embedded i=
nside SPDX<br>
&gt; =C2=A0=C2=A0 3.0 documents, controlled by SPDX_INCLUDE_VEX. This is th=
e richest<br>
&gt; =C2=A0=C2=A0 VEX data source, now at recipe level after the package VE=
X<br>
&gt; =C2=A0=C2=A0 removal [3].<br>
&gt; <br>
&gt; 2. vex.bbclass (Marta Rybczynska): A standalone do_generate_vex task<b=
r>
&gt; =C2=A0=C2=A0 that produces per-recipe JSON files and a rootfs manifest=
 in a custom<br>
&gt; =C2=A0=C2=A0 Yocto JSON format. Used for CVE reporting and consumed by=
 external<br>
&gt; =C2=A0=C2=A0 analysis tools.<br>
&gt; <br>
&gt; 3. sbom-cve-check (Benjamin Robin, under review [4]): Post-build CVE<b=
r>
&gt; =C2=A0=C2=A0 analysis using an external tool that reads SPDX SBOMs + v=
ex.bbclass<br>
&gt; =C2=A0=C2=A0 manifests, then re-exports enriched SPDX 3 data.<br>
&gt; <br>
&gt; What is currently missing is output in the OpenVEX format (<a href=3D"=
http://openvex.dev" rel=3D"noreferrer" target=3D"_blank">openvex.dev</a>),<=
br>
&gt; which is a lightweight, interoperable JSON format adopted by an<br>
&gt; increasing number of vulnerability management tools.<br>
<br>
vex.bbclass is about to be removed, which simplifies things a bit.<br>
<br>
Is there any reason we can&#39;t have an external script which extracts the=
<br>
vex data from the spdx?<br>
<br>
My personal view is that it might better to support various<br>
conversion/extraction tools rather than trying to output all the<br>
formats someone might want directly...<br><br></blockquote><div><br></div><=
div>Useful VEX information includes vendor context (eg. checked that the vu=
lnerability</div><div>is not reachable under normal usage conditions). We d=
o not have a framework to</div><div>do so today. Necessarily, such VEX outp=
ut will need to be manually edited by</div><div>vendors before publication.=
</div><div><br></div><div>Because of that, I agree with Richard that a stan=
dalone tool that extracts the annotation</div><div>from SPDX and allows use=
rs to modify/add annotations is a better solution.</div><div><br></div><div=
>Kind regards,</div><div>Marta</div></div></div>

--0000000000008cac3e064e53088d--

