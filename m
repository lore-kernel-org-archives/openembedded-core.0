Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3CAC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 15:28:35 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.68.1716391032792916135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 08:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=l0WGPRQd;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.44, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5a2d0d8644so907269066b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 08:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1716391031; x=1716995831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJjn6XHsbyNqi0qpBcYHf8nmBPSmGI1rFAqxcOOskW8=;
        b=l0WGPRQdkkB8VbhCZlA1lqC28ts7A3RMG+0BF79kkyJh4NZHh0U1jcpcdOJOYGGKFm
         z46IpM7vSV2zfirGC0LPvZUpuUYWEMCeSG6OGAF0gthY/CL6+J0lSOxaZQdz9ZQpxjjz
         N87zUVZbvu/WMVxMlDh1adQo/7H5GZfQElTM8keZrqFumxw0tT03G1rBOFL+brKz0gl9
         VzipGM3h/2YUxdYFW12vNpM65ZUDdo+l1C/nxsDcC6pMfLldmyF8TXQpfpCqLwMUpQ46
         JJpPIC4CRLbqLY3Xdvj5N+duqbiF6vaFJWwBHgcMkMw2O7CT5DoCwmiMeAnJi6xXDrVy
         9QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391031; x=1716995831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJjn6XHsbyNqi0qpBcYHf8nmBPSmGI1rFAqxcOOskW8=;
        b=J2Gog8wPobLPR55Pj4dN6vzp0lWe0Wg4XeISCUbitPepOQdMaH/hzOdUW5Z0/z8fKs
         SwRMWdfv1otTwuh0UNVM9Nn/XWwcyAEOJ9O1rXd7uy9gdybvBl2PYDsg+Hv5IabHykID
         6BqrnbCRJnI0EP3H5kpTNG1yc3fOJYpfwl4I5kDH3xXp5C/hEpkINqVoSL/3GjORwUbI
         PKpWh5QliNGDBnlUC6a+w3utgbOWPhqPLw6FeWARBe0f5waSaR4Zc6xBq/SHgiOhi04j
         nDT06ICXirC+Vn39H7gCPOBCBJHTNlCM/5A94Vdg1Du7l1dI+kDp1aYxA6x0dG/U6UA1
         hdrw==
X-Forwarded-Encrypted: i=1; AJvYcCW2oazNcldzbKtTqt/CY1EaiHC/tCAxNUAfrp3l51xrdQSQTMHN/qenYCo0i2FLPHW73riR0/PO7ve5MTTUuWbBS5sluvlrOgWeyt88qxT7MyR5G5qIZabm
X-Gm-Message-State: AOJu0Yx5Mu2rv8XYXpIm57W2wrmpFNQJ+KNPCo0ia2bGzQth0ZShzZz6
	1nJdTyy/wS/57xagbrVBA1PJgF6nvn+7b62CQTaatWcaRsbEDepmRq3tWbZDUXhvrqU4wuD13Kz
	UKQeSec422fE2FCpP781o7qYmgjeR1KIGWpX9aQ==
X-Google-Smtp-Source: AGHT+IGWBoTP7oqOdwlq5l6JdEikiMwYuL2ccbRwZtJWojJ0tIsgdbsuZpHso7Cou/dQgWYclKstANPlQ8FbcEQ8oeY=
X-Received: by 2002:a17:906:eb58:b0:a62:2c5f:5a64 with SMTP id
 a640c23a62f3a-a622c5f5ba5mr142867066b.15.1716391030907; Wed, 22 May 2024
 08:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <5e46a5c002cc62e0da9f3053c890120eb4582820.camel@linuxfoundation.org>
 <20240503144340.27385-1-ninette@thehoodiefirm.com> <20240503144340.27385-2-ninette@thehoodiefirm.com>
 <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
In-Reply-To: <dc7f3dc71d643c5491172b9fa9c761400b9d0499.camel@linuxfoundation.org>
From: "Ninette Adhikari" <ninette@neighbourhood.ie>
Date: Wed, 22 May 2024 17:16:59 +0200
Message-ID: <CAG1aeW1YUfrYqsjp3O86_ngm5P9Zk2-Okpcw7f1LG7CcPfgMhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] oe-build-perf-report: Add apache echarts to make report interactive
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: engineering@neighbourhood.ie, openembedded-core@lists.openembedded.org, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000b17c4006190c6d57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 15:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199763

--000000000000b17c4006190c6d57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Apologies for the late response. I have made changes to the chart tooltip
to include link to the poky repository with the commit hash. I have sent
the patch files to the mailing list. Let me know if this helps:)

With regards to the step chart preview inconsistency, I have looked at the
Apache echarts documentation but haven't had much luck to fix this. Please
let me know if it will be okay to leave it like this for now. Maybe echarts
will update their step charts to fix this in future.

Thanks,
Ninette

On Wed, May 15, 2024 at 5:56=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-05-03 at 16:43 +0200, Ninette Adhikari wrote:
> > From: Ninette Adhikari <
> 13760198+ninetteadhikari@users.noreply.github.com>
> >
> > - Add Apache echarts (https://echarts.apache.org/en/index.html) library
> to create build performance charts.
> > - Restructure data to time and value array format so that it can be use=
d
> by echarts.
> > - This commit also converts test duration to minutes to map against the
> values axis.
> > - Zoom is added to the line charts.
> > ---
> >  .../build_perf/html/measurement_chart.html    | 116 +++++++++++-------
> >  scripts/lib/build_perf/html/report.html       |   6 +-
> >  2 files changed, 72 insertions(+), 50 deletions(-)
>
> Thanks, I was able to test these:
>
>
> https://autobuilder.yocto.io/pub/non-release/20240514-17/testresults/buil=
dperf-alma8/perf-alma8_master-next_20240514121350_a8f48d1cb1.html
>
> https://autobuilder.yocto.io/pub/non-release/20240514-16/testresults/buil=
dperf-debian11/perf-debian11_master-next_20240514051235_a8f48d1cb1.html
>
> and they are definitely a huge improvement on what we had.
>
> I've merged them since I think at this point they're definitely better,
> thanks for making the tweaks others asked about.
>
> As Ross mentioned, the preview doesn't always quite match the chart
> itself.
>
> The other question we'd wondered about is whether we can show the
> commit hash as well as the commit number?
>
> The tricky part is that ideally we'd be able to copy/paste the hash or
> even make it a clickable link to the poky repository
> (e.g.
> https://git.yoctoproject.org/poky/commit/?id=3D6582436a1d1af7775a6bb651af=
f47a9db773e32b
> ) but I'm not sure how possible that is?
>
> The use case here is where for example there are the step changes in
> things like disk usage, or the kernel build time, we'd like to know
> which changes happened around that time. The commit number is good, and
> you can resolve it with a command like:
>
> git rev-list --reverse HEAD | nl -n ln | grep ^69808
>
> but a direct link to the revision would be ideal if possible.
>
> Regardless, this looks very very much improved on where it was, thanks!
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000b17c4006190c6d57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Richard,</div><div><br></div><div=
>Apologies for the late response. I have made changes to the chart tooltip =
to include link to the poky repository with the commit hash. I have sent th=
e patch files to the mailing list. Let me know if this helps:)</div><div><b=
r></div><div>With regards to the step chart preview inconsistency, I have l=
ooked at the Apache echarts documentation but haven&#39;t had much luck to =
fix this. Please let me know if it will be okay to leave it like this for n=
ow. Maybe echarts will update their step charts to fix this in future.</div=
><div><br></div><div>Thanks,</div><div>Ninette <br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 15, 20=
24 at 5:56=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2024-05-03 at=
 16:43 +0200, Ninette Adhikari wrote:<br>
&gt; From: Ninette Adhikari &lt;<a href=3D"mailto:13760198%2Bninetteadhikar=
i@users.noreply.github.com" target=3D"_blank">13760198+ninetteadhikari@user=
s.noreply.github.com</a>&gt;<br>
&gt; <br>
&gt; - Add Apache echarts (<a href=3D"https://echarts.apache.org/en/index.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://echarts.apache.org/en/ind=
ex.html</a>) library to create build performance charts.<br>
&gt; - Restructure data to time and value array format so that it can be us=
ed by echarts.<br>
&gt; - This commit also converts test duration to minutes to map against th=
e values axis.<br>
&gt; - Zoom is added to the line charts.<br>
&gt; ---<br>
&gt; =C2=A0.../build_perf/html/measurement_chart.html=C2=A0=C2=A0=C2=A0 | 1=
16 +++++++++++-------<br>
&gt; =C2=A0scripts/lib/build_perf/html/report.html=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
&gt; =C2=A02 files changed, 72 insertions(+), 50 deletions(-)<br>
<br>
Thanks, I was able to test these:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20240514-17/testres=
ults/buildperf-alma8/perf-alma8_master-next_20240514121350_a8f48d1cb1.html"=
 rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/pub/non-=
release/20240514-17/testresults/buildperf-alma8/perf-alma8_master-next_2024=
0514121350_a8f48d1cb1.html</a><br>
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20240514-16/testres=
ults/buildperf-debian11/perf-debian11_master-next_20240514051235_a8f48d1cb1=
.html" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/pu=
b/non-release/20240514-16/testresults/buildperf-debian11/perf-debian11_mast=
er-next_20240514051235_a8f48d1cb1.html</a><br>
<br>
and they are definitely a huge improvement on what we had.<br>
<br>
I&#39;ve merged them since I think at this point they&#39;re definitely bet=
ter,<br>
thanks for making the tweaks others asked about.<br>
<br>
As Ross mentioned, the preview doesn&#39;t always quite match the chart<br>
itself.<br>
<br>
The other question we&#39;d wondered about is whether we can show the<br>
commit hash as well as the commit number?<br>
<br>
The tricky part is that ideally we&#39;d be able to copy/paste the hash or<=
br>
even make it a clickable link to the poky repository<br>
(e.g.<a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D6582436a1d1a=
f7775a6bb651aff47a9db773e32b" rel=3D"noreferrer" target=3D"_blank">https://=
git.yoctoproject.org/poky/commit/?id=3D6582436a1d1af7775a6bb651aff47a9db773=
e32b</a><br>
) but I&#39;m not sure how possible that is?<br>
<br>
The use case here is where for example there are the step changes in<br>
things like disk usage, or the kernel build time, we&#39;d like to know<br>
which changes happened around that time. The commit number is good, and<br>
you can resolve it with a command like:<br>
<br>
git rev-list --reverse HEAD | nl -n ln | grep ^69808<br>
<br>
but a direct link to the revision would be ideal if possible.<br>
<br>
Regardless, this looks very very much improved on where it was, thanks!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000b17c4006190c6d57--

