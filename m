Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084A6CD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 10:48:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5231.1780655290687316079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 03:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l5awDWBQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: adityags2004@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so2169438e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 03:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780655289; cv=none;
        d=google.com; s=arc-20240605;
        b=UJbHYe7X8uKh2Cj5YRg62dTr4CoLUHF7zAlKA7odNqB1e/MG8r2fKHE+zUeC8JWG0f
         D/l5oz8Vlpywgn5F4XMTE2Mh2rkfntRWoxt4NpHCKkn1gQ1IVq6EX3SsYAqQ3xdIrRr5
         uNRkyg//1cug67nLFy6e6qXIj/FRjBbiPj6+c9aqWGuPO47C1rJwqkQ8PdbV/86DNW61
         pe7XVI7EMzBYkVULf7AI/BHHyw9G5P8grRwm63OrCsi+OL7ndSUhQvt2k5W3x7fcfdol
         KstgknNucYD+Co9ZctTq7UjbgEXM7RieJ05LKNq1jxHyioM6Sv/BOjpmzyVv1rEWLljB
         9Ykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=//xRrLgeNZblar6M1IJAD+0u3f0pyOsZeWMaPQXzbUg=;
        fh=7T5fgh5iWnve6c6Qn2vGdyJAqFFyjwQqYCBWNb2ZoRc=;
        b=Sk3/BhqK3feD8/DXgt1wvyCpMxHzmN55Fhtv51jc2BTsAeKSOHjAbxtChpYiPHb/B0
         wix+NGrgGBJZnEWrA5D4BCvXoxo7ooHMPw5knAWLu+II41yoyAtDvMiuHXl6hwDz3fbs
         Gw0AOtnRs3GJsze2joD5BFd/nIxackmAjhzDr83RUpeX/Bvw+ub2TpnAj9sotdjRwiCN
         SkJtKhZyHB0FQ/6agLF+cVnT1Vd1x+NPtXEXwOnB8fd0OCi6uivdUhcKzAS73IK2cLwN
         jMI7nIMuLG9JHQbD321K4K7jjS6vNCTrf4/JPhVawBur7i2W8CNS+Q3IxqYRqLdbMm3h
         7UBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780655289; x=1781260089; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//xRrLgeNZblar6M1IJAD+0u3f0pyOsZeWMaPQXzbUg=;
        b=l5awDWBQpFn4zLXfa3qusiNJfxfpftlSTSjQYshFDIfv1CajJYARTffx/dJMYx7fgt
         d5i1IuL7cgsRYW3mJxEUznIvkV7t0cXXamZ5GlNXM8SlCox9WwMkIvLCQ5MQ5TE48A0b
         pbuAr60OCwtxT6wwsraRaadWBFk99WLq4UJcwbpB+lMqrqcWnxCMG74Mf30AFGuwV2lV
         KUEp1W9jz3kvk8q4a9JusU2ETJWMPdINpA1VlYkpDKQ9XfDY2Vxp5+Hwwiu4/R5Xd0Jt
         kCPfxTbohwjXklp4wQhXr9YmVLFnEshRhxwI4cKfmG9fMEoOhkVFl/9BF8stH1w7jsi7
         MbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780655289; x=1781260089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//xRrLgeNZblar6M1IJAD+0u3f0pyOsZeWMaPQXzbUg=;
        b=czpFX/5+Ecez5eEEElLAxTGL4+GZ5JzOf2vq8hmRunGlOsXlj5qUDMTVRCFYwHoKTU
         U8mi6g4JvPyPJ9yy8B4sV4zxJyqg7PULVsgKHfV0WCaRZXyUaylMOcebk3Xw0nE9tZIy
         mtBeHqPie8E0XwnslP2V7QeU2iiHvugti3reNX3YadoHUBbkkkM5zO5qItj1kJz5ogIL
         b/xmy1BRV/uSZn+YIaHcgLhPTOKuONoox6QoXmd/5SOC/BfE0t/BWDJxEsZlTW497gvV
         M1x+w6E5gBSvUIgmiJJvUGP3EfZZ2GRso89udR6dWF3cR0w8XTaZwTdvLP4jCvkz+mvK
         zvJg==
X-Gm-Message-State: AOJu0YwFR+0nj4KmuuB2SAGl4URSFavPwMgp5Jb57DqfG/LcDRLDZG05
	ag/ZLXVJ9mDRlbKm2eLluPY3vZ/fQIXpdjpsI+Rzn2SIxXYJQ4ZSjqEpOUayZKbmD1+ue96X/Ol
	03Znj00tkdczNGH/tBC4SCFVzt8iRO29cLw==
X-Gm-Gg: Acq92OETw0DTqdnjeTw18Er/Ztbvn4tCYrDYpbvg04baZ4RQi6P7RDrTrhfVTWn8gX+
	XslacaCZ95bQXDm0Z46ll/HDzaCTbqArZtdHpsFGqd0EqCOa5puhXGii+S+AT0qS0qyP3ikRY/P
	YE4RZkL1M+FglfvfYHJQx8qOYghLsPIFkskFNgjjvS4lXFEjgxYgR6WzwuyWCM54QYE5vnqIKZe
	33YbfyAuSqsth+m+ESb/wj5zCPMZpKAI0rJrZFZqPZmtmtdo3YcF/S7MA4kc4shn1gzWGsj3w6K
	icjbibUCmRUs1eXCBbyFhgn2lVxeANYQnqDiFpnUleqo4oXvjV7sI8fAX6mFzd+NLtOaedMx+Po
	zJ9AHzTCG+i7TpeI4qqw=
X-Received: by 2002:ac2:568d:0:b0:5aa:71e1:edab with SMTP id
 2adb3069b0e04-5aa886fee66mr579127e87.23.1780655288355; Fri, 05 Jun 2026
 03:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260605081737.1568-1-adityags2004@gmail.com> <CANNYZj9thZKkUceNJpbbaMyCHzjy=HdJYjjtCcCkzy=UToOfxw@mail.gmail.com>
In-Reply-To: <CANNYZj9thZKkUceNJpbbaMyCHzjy=HdJYjjtCcCkzy=UToOfxw@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 5 Jun 2026 15:57:57 +0530
X-Gm-Features: AVVi8CecB_JKNNMKsJ7VHo2J9Vd5AhVqh06f-OusiIEpSUlOLcSkqtKU70zzzkA
Message-ID: <CAHaUZZAUoOqO8ODDLCvip2QJksnDATEwpKyVgPh46hDYv9vk4Q@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000ee0d0506537f1db6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 10:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238161

--000000000000ee0d0506537f1db6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the update.

I've reviewed the merged commit and verified that the fix is already
present and complete, including the required metadata.

My latest submission (v11) also included the missing Signed-off-by, so I
believe there are no remaining differences to address.

Thanks again for reviewing and integrating the fix.

Regards,
Aditya

On Fri, Jun 5, 2026, 3:49=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmail.=
com>
wrote:

> Hello Aditya,
>
> an earlier version of the patch was already fixed up and merged; the
> patch review participants decided that it's better to fix the
> frustrating CI failures quicker than do more review-fix-resend cycles:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Dccabae3036a71=
3cac8b08731b765ff1dc3ed93eb
>
> I'd suggest you rebase the latest commit on top of current oe-core
> master with 'git rebase', and send any remaining differences (e.g. the
> missing signed-off-by) as a separate patch (remember to also edit the
> commit message so it matches the patch content).
>
> Alex
>
> On Fri, 5 Jun 2026 at 10:18, Aditya GS <adityags2004@gmail.com> wrote:
> >
> > Backport upstream fix to improve stability of randtest.sh by
> > retrying when sigma is too small, avoiding intermittent failures.
> >
> > [YOCTO #16254]
> >
> > Signed-off-by: Aditya GS <adityags2004@gmail.com>
> > ---
> >  .../gawk/files/randtest-fix.patch             | 138 ++++++++++++++++++
> >  meta/recipes-extended/gawk/gawk_5.4.0.bb      |   1 +
> >  2 files changed, 139 insertions(+)
> >  create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
> >
> > diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch
> b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > new file mode 100644
> > index 0000000000..0aafa0f282
> > --- /dev/null
> > +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > @@ -0,0 +1,138 @@
> > +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> > +From: "Arnold D. Robbins" <arnold@skeeve.com>
> > +Date: Thu, 28 May 2026 09:52:41 -0400
> > +Subject: Improve test/randtest.sh.
> > +
> > +Upstream-Status: Backport
> > +
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4bc864=
913437619af7a9834a1c24915acd
> > +
> > +Signed-off-by: Aditya GS <adityags2004@gmail.com>
> > +
> > +---
> > +
> > +diff --git a/test/randtest.sh b/test/randtest.sh
> > +index 597376a8..6ae6f830 100755
> > +--- a/test/randtest.sh
> > ++++ b/test/randtest.sh
> > +@@ -45,68 +45,77 @@ $AWK 'BEGIN{
> > +     nsamples=3D('$NSAMPLES');
> > +     max_allowed_sigma=3D('$MAX_ALLOWED_SIGMA');
> > +     nruns=3D('$NRUNS');
> > +-    for(tau=3D0;tau<nsamples/2;tau++) corr[tau]=3D0;
> > ++    max_retries=3D5
> > +
> > +-    for(run=3D0;run<nruns;run++) {
> > +-      sum=3D0;
> > ++    for (retry=3D0; retry<max_retries; retry++) {
> > ++        for(tau=3D0; tau<nsamples/2; tau++) corr[tau]=3D0;
> > +
> > +-      # Fill an array with a sequence of samples that are a
> > +-      # function of pairs of rand() values.
> > ++        for(run=3D0; run<nruns; run++) {
> > ++            sum=3D0;
> > +
> > +-      for(i=3D0;i<nsamples;i++) {
> > +-         samp[i]=3D((rand()-0.5)*(rand()-0.5))^2;
> > +-         sum=3Dsum+samp[i];
> > +-         }
> > ++          # Fill an array with a sequence of samples that are a
> > ++          # function of pairs of rand() values.
> > +
> > +-      # Subtract off the mean of the sequence:
> > ++            for(i=3D0; i<nsamples; i++) {
> > ++                samp[i]=3D((rand()-0.5)*(rand()-0.5))^2;
> > ++              sum=3Dsum+samp[i];
> > ++            }
> > +
> > +-      mean=3Dsum/nsamples;
> > +-      for(i=3D0;i<nsamples;i++) samp[i]=3Dsamp[i]-mean;
> > ++          # Subtract off the mean of the sequence:
> > +
> > +-      # Calculate an autocorrelation function on the sequence.
> > +-      # Because the values of rand() should be independent, there
> > +-      # should be no peaks in the autocorrelation.
> > ++          mean=3Dsum/nsamples;
> > ++          for(i=3D0;i<nsamples;i++) samp[i]=3Dsamp[i]-mean;
> > +
> > +-      for(tau=3D0;tau<nsamples/2;tau++) {
> > +-          sum=3D0;
> > +-          for(i=3D0;i<nsamples/2;i++) sum=3Dsum+samp[i]*samp[i+tau];
> > +-          corr[tau]=3Dcorr[tau]+sum;
> > +-          }
> > ++          # Calculate an autocorrelation function on the sequence.
> > ++          # Because the values of rand() should be independent, there
> > ++          # should be no peaks in the autocorrelation.
> > +
> > +-      }
> > +-    # Normalize the autocorrelation to the tau=3D0 value.
> > ++            for(tau=3D0; tau<nsamples/2; tau++) {
> > ++              sum=3D0;
> > ++              for(i=3D0;i<nsamples/2;i++) sum=3Dsum+samp[i]*samp[i+ta=
u];
> > ++              corr[tau]=3Dcorr[tau]+sum;
> > ++            }
> > +
> > +-    max_corr=3Dcorr[0];
> > +-    for(tau=3D0;tau<nsamples/2;tau++) corr[tau]=3Dcorr[tau]/max_corr;
> > ++        }
> > ++        # Normalize the autocorrelation to the tau=3D0 value.
> > +
> > +-    # OPTIONALLY Print out the autocorrelation values:
> > ++        max_corr=3Dcorr[0];
> > ++        for(tau=3D0;tau<nsamples/2;tau++) corr[tau]=3Dcorr[tau]/max_c=
orr;
> > +
> > +-    # for(tau=3D0;tau<nsamples/2;tau++) print tau, corr[tau] >
> "pairpower_corr.data";
> > ++        # OPTIONALLY Print out the autocorrelation values:
> > +
> > +-    # Calculate the sigma for the non-zero tau values:
> > ++        # for(tau=3D0;tau<nsamples/2;tau++) print tau, corr[tau] >
> "pairpower_corr.data";
> > +
> > +-    power_sum=3D0;
> > ++        # Calculate the sigma for the non-zero tau values:
> > +
> > +-    for(tau=3D1;tau<nsamples/2;tau++) power_sum=3Dpower_sum+(corr[tau=
])^2;
> > ++        power_sum=3D0;
> > +
> > +-    sigma=3Dsqrt(power_sum/(nsamples/2-1));
> > ++        for(tau=3D1;tau<nsamples/2;tau++)
> power_sum=3Dpower_sum+(corr[tau])^2;
> > +
> > +-    # See if any of the correlations exceed a reasonable number of
> sigma:
> > ++        sigma=3Dsqrt(power_sum/(nsamples/2-1));
> > +
> > +-    passed=3D1;
> > +-    for(tau=3D1;tau<nsamples/2;tau++) {
> > +-      if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
> > +-          print "Tau=3D", tau ", Autocorr=3D", corr[tau]/sigma, "sigm=
a";
> > +-          passed=3D0;
> > +-          }
> > ++        if (sigma < 1e-6) {
> > ++            print "Sigma too small, retrying run", retry
> > ++            continue
> > +         }
> > +-    if(!passed) {
> > +-      print "Test failed."
> > +-      exit(1);
> > ++
> > ++        # See if any of the correlations exceed a reasonable number o=
f
> sigma:
> > ++
> > ++        for(tau=3D1;tau<nsamples/2;tau++) {
> > ++            if (abs(corr[tau])/sigma > max_allowed_sigma) {
> > ++                print "Tau=3D", tau ", Autocorr=3D", corr[tau]/sigma,
> "sigma";
> > ++                print "Test failed."
> > ++                exit 1
> > ++            }
> > +         }
> > +-    else exit (0);
> > ++
> > ++        exit 0
> > +     }
> > +
> > ++    print "Test failed after retries due to unstable sigma"
> > ++    exit 1
> > ++}
> > ++
> > + function abs(abs_input) { return(sqrt(abs_input^2)) ; }
> > + '
> > +
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb
> b/meta/recipes-extended/gawk/gawk_5.4.0.bb
> > index d7211f28f3..71e7ddb31f 100644
> > --- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
> > +++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
> > @@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] =3D
> "--enable-pma,--disable-pma, "
> >  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
> >             file://run-ptest \
> >
>  file://0001-configure.ac-re-enable-disabled-printf-features.patch \
> > +          file://randtest-fix.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
> > --
> > 2.34.1
> >
>

--000000000000ee0d0506537f1db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi Alex,</div><div dir=3D"auto"><br></d=
iv>Thanks for the update.<div dir=3D"auto"><br></div><div dir=3D"auto">I&#3=
9;ve reviewed the merged commit and verified that the fix is already presen=
t and complete, including the required metadata.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">My latest submission (v11) also included the missi=
ng Signed-off-by, so I believe there are no remaining differences to addres=
s.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks again for revi=
ewing and integrating the fix.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Regards,=C2=A0</div><div dir=3D"auto">Aditya</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Jun 5, 2026, 3:49=E2=80=AFPM Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hello Aditya,<br>
<br>
an earlier version of the patch was already fixed up and merged; the<br>
patch review participants decided that it&#39;s better to fix the<br>
frustrating CI failures quicker than do more review-fix-resend cycles:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Dccab=
ae3036a713cac8b08731b765ff1dc3ed93eb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dcca=
bae3036a713cac8b08731b765ff1dc3ed93eb</a><br>
<br>
I&#39;d suggest you rebase the latest commit on top of current oe-core<br>
master with &#39;git rebase&#39;, and send any remaining differences (e.g. =
the<br>
missing signed-off-by) as a separate patch (remember to also edit the<br>
commit message so it matches the patch content).<br>
<br>
Alex<br>
<br>
On Fri, 5 Jun 2026 at 10:18, Aditya GS &lt;<a href=3D"mailto:adityags2004@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; Backport upstream fix to improve stability of randtest.sh by<br>
&gt; retrying when sigma is too small, avoiding intermittent failures.<br>
&gt;<br>
&gt; [YOCTO #16254]<br>
&gt;<br>
&gt; Signed-off-by: Aditya GS &lt;<a href=3D"mailto:adityags2004@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gawk/files/randtest-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 138 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-extended/gawk/<a href=3D"http://gawk_5.4.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.4.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 139 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/met=
a/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0aafa0f282<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; @@ -0,0 +1,138 @@<br>
&gt; +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Arnold D. Robbins&quot; &lt;<a href=3D"mailto:arnold@skee=
ve.com" target=3D"_blank" rel=3D"noreferrer">arnold@skeeve.com</a>&gt;<br>
&gt; +Date: Thu, 28 May 2026 09:52:41 -0400<br>
&gt; +Subject: Improve test/randtest.sh.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +<a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=
=3Df2250f4bc864913437619af7a9834a1c24915acd" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?i=
d=3Df2250f4bc864913437619af7a9834a1c24915acd</a><br>
&gt; +<br>
&gt; +Signed-off-by: Aditya GS &lt;<a href=3D"mailto:adityags2004@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; +<br>
&gt; +diff --git a/test/randtest.sh b/test/randtest.sh<br>
&gt; +index 597376a8..6ae6f830 100755<br>
&gt; +--- a/test/randtest.sh<br>
&gt; ++++ b/test/randtest.sh<br>
&gt; +@@ -45,68 +45,77 @@ $AWK &#39;BEGIN{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nsamples=3D(&#39;$NSAMPLES&#39;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0max_allowed_sigma=3D(&#39;$MAX_ALLOWED_SIGMA&#39;=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nruns=3D(&#39;$NRUNS&#39;);<br>
&gt; +-=C2=A0 =C2=A0 for(tau=3D0;tau&lt;nsamples/2;tau++) corr[tau]=3D0;<br=
>
&gt; ++=C2=A0 =C2=A0 max_retries=3D5<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 for(run=3D0;run&lt;nruns;run++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sum=3D0;<br>
&gt; ++=C2=A0 =C2=A0 for (retry=3D0; retry&lt;max_retries; retry++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(tau=3D0; tau&lt;nsamples/2; tau++) c=
orr[tau]=3D0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # Fill an array with a sequence of samples that=
 are a<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # function of pairs of rand() values.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(run=3D0; run&lt;nruns; run++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum=3D0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(i=3D0;i&lt;nsamples;i++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0samp[i]=3D((rand()-0.5)*(rand()-0.=
5))^2;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sum=3Dsum+samp[i];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Fill an array with a sequence o=
f samples that are a<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # function of pairs of rand() val=
ues.<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # Subtract off the mean of the sequence:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(i=3D0; i&lt;nsamples; =
i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 samp[i]=3D((=
rand()-0.5)*(rand()-0.5))^2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum=3Dsum+samp[i];<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 mean=3Dsum/nsamples;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(i=3D0;i&lt;nsamples;i++) samp[i]=3Dsamp[i]-=
mean;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Subtract off the mean of the se=
quence:<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # Calculate an autocorrelation function on the =
sequence.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # Because the values of rand() should be indepe=
ndent, there<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 # should be no peaks in the autocorrelation.<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mean=3Dsum/nsamples;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(i=3D0;i&lt;nsamples;i++) samp=
[i]=3Dsamp[i]-mean;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 for(tau=3D0;tau&lt;nsamples/2;tau++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum=3D0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(i=3D0;i&lt;nsamples/2;i++) su=
m=3Dsum+samp[i]*samp[i+tau];<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 corr[tau]=3Dcorr[tau]+sum;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Calculate an autocorrelation fu=
nction on the sequence.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Because the values of rand() sh=
ould be independent, there<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # should be no peaks in the autoc=
orrelation.<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 # Normalize the autocorrelation to the tau=3D0 value.<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(tau=3D0; tau&lt;nsampl=
es/2; tau++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum=3D0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for(i=3D0;i&lt;nsam=
ples/2;i++) sum=3Dsum+samp[i]*samp[i+tau];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 corr[tau]=3Dcorr[ta=
u]+sum;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 max_corr=3Dcorr[0];<br>
&gt; +-=C2=A0 =C2=A0 for(tau=3D0;tau&lt;nsamples/2;tau++) corr[tau]=3Dcorr[=
tau]/max_corr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Normalize the autocorrelation to the t=
au=3D0 value.<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 # OPTIONALLY Print out the autocorrelation values:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 max_corr=3Dcorr[0];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(tau=3D0;tau&lt;nsamples/2;tau++) cor=
r[tau]=3Dcorr[tau]/max_corr;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 # for(tau=3D0;tau&lt;nsamples/2;tau++) print tau, corr=
[tau] &gt; &quot;pairpower_corr.data&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # OPTIONALLY Print out the autocorrelati=
on values:<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 # Calculate the sigma for the non-zero tau values:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # for(tau=3D0;tau&lt;nsamples/2;tau++) p=
rint tau, corr[tau] &gt; &quot;pairpower_corr.data&quot;;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 power_sum=3D0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Calculate the sigma for the non-zero t=
au values:<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 for(tau=3D1;tau&lt;nsamples/2;tau++) power_sum=3Dpower=
_sum+(corr[tau])^2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 power_sum=3D0;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 sigma=3Dsqrt(power_sum/(nsamples/2-1));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(tau=3D1;tau&lt;nsamples/2;tau++) pow=
er_sum=3Dpower_sum+(corr[tau])^2;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 # See if any of the correlations exceed a reasonable n=
umber of sigma:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sigma=3Dsqrt(power_sum/(nsamples/2-1));<=
br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 passed=3D1;<br>
&gt; +-=C2=A0 =C2=A0 for(tau=3D1;tau&lt;nsamples/2;tau++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if ( abs(corr[tau])/sigma &gt; max_allowed_sigm=
a ) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;Tau=3D&quot;, tau &qu=
ot;, Autocorr=3D&quot;, corr[tau]/sigma, &quot;sigma&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 passed=3D0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sigma &lt; 1e-6) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;Sigma too smal=
l, retrying run&quot;, retry<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 if(!passed) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 print &quot;Test failed.&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # See if any of the correlations exceed =
a reasonable number of sigma:<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for(tau=3D1;tau&lt;nsamples/2;tau++) {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (abs(corr[tau])/sigma &=
gt; max_allowed_sigma) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=
Tau=3D&quot;, tau &quot;, Autocorr=3D&quot;, corr[tau]/sigma, &quot;sigma&q=
uot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print &quot;=
Test failed.&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 else exit (0);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 print &quot;Test failed after retries due to unstable =
sigma&quot;<br>
&gt; ++=C2=A0 =C2=A0 exit 1<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + function abs(abs_input) { return(sqrt(abs_input^2)) ; }<br>
&gt; + &#39;<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.4.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.4.0.bb</a> b/meta=
/recipes-extended/gawk/<a href=3D"http://gawk_5.4.0.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">gawk_5.4.0.bb</a><br>
&gt; index d7211f28f3..71e7ddb31f 100644<br>
&gt; --- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.4.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.4.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.4.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.4.0.bb</a><br>
&gt; @@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] =3D &quot;--enable-pma,-=
-disable-pma, &quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.a=
c-re-enable-disabled-printf-features.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://randtest-fix.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;3dd430f0cd3b4428c6c3f6afc021b9cd3c1=
f8c93f7a688dc268ca428a90b4ac1&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</blockquote></div>

--000000000000ee0d0506537f1db6--

