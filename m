Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE16E63FEC
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 17:14:58 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20406.1775322897117231731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 10:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fFXgLk8b;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d91f82d819so2655131a34.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 10:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775322896; cv=none;
        d=google.com; s=arc-20240605;
        b=func7jRsuSaZS0WWIcFm3OG1bxRTruztveTxxRh0Tvsvowm43LAANHZCE7y8J5P5im
         NwRhFeVkKS1pv4iuUPyDdIRkLxW+UDzD4t2MlpVqxylkxCu3WO1enkrYl4fBCann5RVN
         beTiRcQAAjWmJK+mdM5gEXn3dBYBP26lc5dKeNVucrnC8aTQ1mXYh3t3ZGFYvfYN6vhY
         xUbk2+E/oZu6Q6DPiQ9nq3Ilo9VnT7sTJM3CJdGddZ/BoQu4O3dmyYOHwXaj4Qom4at3
         vM4zFKp2AzXNx0H8afEJMuoqb89ZPu4q0/RoRzUVYlq1hqwLzS/74En1zWQUVg9zKr/T
         ngHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aq2jLiPthw7Br8F++T3/I3ymttqhCRQXDiZr/1zszwU=;
        fh=TGF7TVa5Eshw5M6K2XLmjdIMKFhrsPaliuC+tv7wzuY=;
        b=Ytl+gSV2ZS5qAYmqGVJdrE4h294MQ4vKt0ZhZUV56UO1dQT5V3mdyMx4eQKY1DYxyp
         1BK4ThsEW+UsDFV0MU1xTKc970PX8POe0wsfnmcRJ+xXFLKgxe5fsA1sUsXpuUQCuFIe
         9cfsUG6IZEyVHYNxSzk+/OTrvEGR0c0o2Sw8G/Si5nkOsBEsVZ+o1jNXs5cVWmpFij/k
         tecrIUI2jid51o9i9fsLDwP7PgW0J8Zo8jsjldwAIYM/hZZooz3Fwp2VG5taUenZbfrL
         ciuV16yxDLKWfqLHGUpCXXWe5/UHxowx8IEJ2fcynBZCALse57Ef+s1Yn6sV7U/n52It
         DdHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775322896; x=1775927696; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq2jLiPthw7Br8F++T3/I3ymttqhCRQXDiZr/1zszwU=;
        b=fFXgLk8b0mnW+3BwZIDhi6Nbr4Wi0NPdKm5a2WDr1N38+fzf8+YJqcbe5gRQBioEIt
         dzel6byS4Peb55G0PTG5pI+xOqSTzW/L2rpt4FBxU6bBh+3Ty/RPzPBODlI9Dx6jfqq+
         ZsHLtIYkAVgBQjES3rZcwqENVGjtJEp93NiFoJaY+Ww7qGHgoJy4gFMz2dgf4RlS+T1A
         rwjaRWbRmhmXWUL4v5Rfj9G06rl9CeCDruSQUiuWXU1lzsb3tzUTBs3jawe4Q476HO2k
         N5R4QiZtqtyUpkXbihogY/OpSB7AZV3oQflseGGKmFicu/TTeNAmmRxyyNUs7RzxRDGJ
         mrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775322896; x=1775927696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq2jLiPthw7Br8F++T3/I3ymttqhCRQXDiZr/1zszwU=;
        b=IUzgNYkpe4xj7/nIckl0RNg8ZWOHZES3PpAhJYMeuLDlWGGJnJabWxngTEsnsWvl4t
         riuT13irTCKg+CAqCihYk4xgL+ad3/SzhzTFb4G3L+o4XeEbuAgJt+R/OEeUQDMtP1Vp
         FYs3P36z1+faEjmkcUUXKSnW9NovUBgHVDc+zpYzH3EXiB0XfNXpJo6rrgxmlX/H0Prs
         LmpaoXHdTEULYix8spy3KMGDOWyjulrZWoiG3NtnlPCHYN9j2Vicn2FmtDiofD3GLltb
         YVjFmmuxTtKj9/MMQBSgUgxSusNlVKlE0Y4RrAo5rKpkN0jm399BAh98Sq7Ialgo65jQ
         hJnA==
X-Gm-Message-State: AOJu0YxfQRYk5R8y+UCvZYXLy3xnk3qf8r9gqkaHNjJ0AHsRiyYmW2ep
	stwQnMVNkevL377wbGDT2JOFEKJuSmj/dBaPAvznz2XfBboVUzgRMFyp6Y6aX15zaTs6Hoa1yky
	j7qN+PQl3GJ6q/zUE+uDYIbQR7DXhlWE=
X-Gm-Gg: AeBDiesIy5xqjQj3dONLt7ovHS9LlSGrI6xYe8WTcgKUXvRvMOPatlqAVvauBSJi7Ig
	xvBQcZbAZ+v6/CHyehIwxW1PHBn5iKNahpWfGjivaxF1n+9VMW8rQWrQhSCnmui4yy29P7tr8wW
	eaRvC451+sYs8+bt1Ac+DyhaRGF0OxgSE1pyeujDccRlYBJNDcygTXgZwq9seqxiA+2C9VSiYEx
	UUF0kkS0de6atieaEOKWhO16c8FEhLqH4ZTHNT/sLsg0dfRtAwp6VIiFWdsI4SmrW5+vdp+eo38
	MJzXBxXJA779KJhS
X-Received: by 2002:a05:6830:81eb:b0:7d7:d0a3:ed00 with SMTP id
 46e09a7af769-7dbb73c555amr4202614a34.9.1775322896174; Sat, 04 Apr 2026
 10:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
 <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
 <DHJD0XSTONE6.2ZXL04SBPR664@bootlin.com> <CAFAffzx7EdXXEudpQGCgSA-1M7aDDwMuRLW+Dta5urcmVx_yWg@mail.gmail.com>
 <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com>
In-Reply-To: <DHJHIMYYUTH6.16YUU1V7MJZY@bootlin.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 4 Apr 2026 19:14:42 +0200
X-Gm-Features: AQROBzC2gkAEsiO7FfMJfsQ61XrZDUn01pbEBqZ4Zbn_cBT56jVFF5YsCLUK8hI
Message-ID: <CAFAffzzW9r43AE5hKbXihkXqZTWeO=sQGctTkmL4Eg+U9X31AA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] package_pkgdata: fix typo to stop
 calling undefined function
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000969218064ea59200"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 17:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234616

--000000000000969218064ea59200
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Apr 2026 at 13:31, Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:
> > Hmmm, can't see any connection between those tests and this particular
> > patch...
> > The thing is, that since the patch fixes a call to an undefined function,
> > there could not have been a test covering this case in the first place
> ;-)
> > In addition, the function call takes place only in the 'bitbake -b'
> case...
> >
> > Where can it be found, which other changes took place in those builds?
> >
> > On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand <
> > mathieu.dubois-briand@bootlin.com> wrote:
> >
>
> The tested branch can be found here:
>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3579
>
> But I confirm git bisect points to this commit, and the error is gone
> after a revert. You can easily reproduce the issue on your side:
> oe-selftest -r sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
>
>
I've run this test with my change cherry-picked onto the master, and have
got some inconclusive, partially random results... Here's what I did:
- the test started FAILING (as in the autobuilder)
- I replaced the corrected function invocation with an exception throw and
nothing changed (this proves, that this branch does not take part in this
test)
- I limited the packages built during the test to only some of the ones
failing - the test started PASSING
- I started restoring the original package list, and finally restored its
original state - the test kept PASSING
- I restored the original state of the workspace - master + my commit (the
exact same configuration that I started with) and the test kept PASSING
- I rerun the test a few times, each time in a new, fresh build, and after
about 3 FAILING runs it suddenly PASSED 2 times, before it started FAILING
again - all the time in the same state of the workspace

I did confirm, that the signatures differed indeed in the failing runs. I
chased it for a while, looked here and there (e.g. found it suspicious that
native, nativesdk, cross-canadian, etc. clear
out do_packagedata[stamp-extra-info] and allarch does not) but I cannot
even dream of the type of free time I'd need to familiarise myself
sufficiently with BitBake's hashing machinery.

I think the way to go now is to file a bug - what do you think?

Thanks,
Adam



> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000969218064ea59200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small">On Fri, 3 Apr 2026 at 13:31=
, Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@bootlin=
.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:</d=
iv></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri Apr 3, 2026 at 12:32 PM CEST, Adam Blank wrote:<br>
&gt; Hmmm, can&#39;t see any connection between those tests and this partic=
ular<br>
&gt; patch...<br>
&gt; The thing is, that since the patch fixes a call to an undefined functi=
on,<br>
&gt; there could not have been a test covering this case in the first place=
 ;-)<br>
&gt; In addition, the function call takes place only in the &#39;bitbake -b=
&#39; case...<br>
&gt;<br>
&gt; Where can it be found, which other changes took place in those builds?=
<br>
&gt;<br>
&gt; On Fri, 3 Apr 2026 at 10:00, Mathieu Dubois-Briand &lt;<br>
&gt; <a href=3D"mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank"=
>mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
<br>
The tested branch can be found here:<br>
<a href=3D"https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/aut=
obuilder.yoctoproject.org/valkyrie/a-full-3579" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/au=
tobuilder.yoctoproject.org/valkyrie/a-full-3579</a><br>
<br>
But I confirm git bisect points to this commit, and the error is gone<br>
after a revert. You can easily reproduce the issue on your side:<br>
oe-selftest -r sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs=
<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I&#39;ve run this test with my change cherry-picked onto t=
he master, and have got some inconclusive, partially random results... Here=
&#39;s what I did:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">- the test started FAILING (as in the autobuilder)</div><div class=3D"g=
mail_default" style=3D"font-size:small">- I replaced the corrected function=
 invocation with an exception throw and nothing changed (this proves, that =
this branch does not take part in this test)</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">- I limited the packages built during the tes=
t to only some of the ones failing - the test started PASSING</div></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">- I started restoring =
the original package list, and finally restored its original state - the te=
st kept PASSING</div><div class=3D"gmail_default" style=3D"font-size:small"=
>- I restored the original state of the workspace - master=C2=A0+ my commit=
 (the exact same configuration that I started with) and the test kept PASSI=
NG</div><div class=3D"gmail_default" style=3D"font-size:small">- I rerun th=
e test a few times, each time in a new, fresh build, and after about 3 FAIL=
ING runs it suddenly PASSED 2 times, before it started FAILING again - all =
the time in the same state of the workspace</div><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">I did confirm, that the si=
gnatures differed indeed in the failing runs. I chased it for a while, look=
ed here and there (e.g. found it suspicious that native, nativesdk, cross-c=
anadian, etc. clear out=C2=A0do_packagedata[stamp-extra-info] and allarch d=
oes not) but I cannot even dream of the type of free time I&#39;d need to f=
amiliarise myself sufficiently with BitBake&#39;s hashing machinery.</div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I thin=
k the way to go now is to file a bug - what do you think?</div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Thanks,</div><div=
 class=3D"gmail_default" style=3D"font-size:small">Adam</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
</div>
</div>

--000000000000969218064ea59200--

