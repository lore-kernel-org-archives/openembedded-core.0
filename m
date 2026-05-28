Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1572BCD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:17:26 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18454.1779995633242139595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 12:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hvcDAoMC;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393800f638bso99147121fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 12:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779995631; cv=none;
        d=google.com; s=arc-20240605;
        b=j0H0+XwVa0jA7e4U/TFNfiuSaaUgurGfUIcCAMbEd19oDdFeMb7nB8Zp6cTJ77nxtR
         3TsBknITeAPeawNf52KXI99SwAADhLekynuDR1qCFv2KHlJ+wc7msWz6M4iZwyPLz1PL
         V2KDfCPinPGKz0KJkimuqFMSAAItayF2ab2HRrTqMmdPoMZ247/vsxuZw6ET1JRju1XC
         XR3f2DxPuEvAM2Zx6OcC/FdZdjij4jii3vNhl8vrTUvGcaHBpkRz3LFv0V+rzY1ape5c
         hKPHLwyjnmLZRtYpvFaTzIuip/Z6201GU4XHduYOqmF+blYDELUYei2sSZODMP9PhNjo
         6oDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k5VMbxjo5bILBY0ZNU8r5wwA3DspwaijBGUb8llmXOQ=;
        fh=Ug+utZakG8cDypuyc3isAGmUAtkXdDk5XYoisK59YNI=;
        b=E/l6MhfiWd1Cd31Qw7/v5pmIjwwzjXvHaXGcVazaPSuwKCx4HranMgbuM+eN8a5vtC
         RohQBZOxI9WQbAAPjyp4l+z05GIMrr6EBhs6fg73GZDKJKEIaxcPwlnfzdgRSG+nVRM+
         QyY9t6VvgFiJxrnVMSI5oc86XqP8Vd6SBH91lFZelge4WXVQGT8n/OWx2sLEIPaEXPYv
         hNiBtq7ADOJ1UEjY6G1q739fdkeJR0CEksMC2yKkmTFtHVoOXTxACMo28XwZ5uDKIhpu
         iGuf4sJFuoRiF1KSzA/gpm7nGD+yjvg4fON6OnyHMj/Czl4CfA9orsHyXtDFNPQEctgR
         qvPA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779995631; x=1780600431; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k5VMbxjo5bILBY0ZNU8r5wwA3DspwaijBGUb8llmXOQ=;
        b=hvcDAoMCYM9Eyy2OTUAX630fHwMtTZLybsF5x68FBy/omzmowBYjBezwAFLTlL/Xu3
         XlwOH5g1r8qBZXF1GobvwVIzXag3JVG5Xig4uf+vdL/VT7sLVkRu2pzE9pXwhuCiCx1q
         zDshMEemAMUXNNkEXnGd1vsbuGBiy+DbQDqB5p26qXhPL9W5otuZ4ekWfcTjKPMkP6H3
         t4Cjt6Y/j56e4h6SGwJRU6iScKhYWbqj8WfxCcps1ZXNwhGnjLaqbNgjDsXwv0kDqevt
         TTzBKz97p28IBzD4xP65fXZaP8tjEiKzPgvObxX9kI7BdrqhInuGf/pkF+k0xRuycOxu
         hV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995631; x=1780600431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5VMbxjo5bILBY0ZNU8r5wwA3DspwaijBGUb8llmXOQ=;
        b=dtODWq+mBa6g9TPNyvUjMXrx6e4KY/QXNa1g/opfj1fWj/k9wydVeUqaixbFqss9bK
         qWUjIkClOB4psBWWD5nxdsZe2Fs7gh2JfFwkbbbTaOALQgzR43RTe+4Q9n9HiPYJs3ib
         9+rEmjwZcevzR3lVJ0e0czZqHnRLTSRm/cU3QvVcV2gEioIvaUiZT613USGoyatYH/c3
         arIuVDjV+UNNaDGWilKNQASRP8t3IQ+jcJx8rkNL9YBXkQ/A80wCWc+Shkry362qEYBR
         if4gl8Bmz63yTtL920VW1/m7GW1QypnGju+e4f+vF0debQAFM1zwBf7FnqP7ForwZv8A
         KV+w==
X-Gm-Message-State: AOJu0YwZ9lEYMDtaYkTTHyLT1mBoLpZWgEE5+lWjUzxVlFgyBy0OJWvz
	vEYMm7vCqNS4BDui9A700Az+JkKhsGCQZb/x4ZmkWXu4WerUoetFxDp+q5eU7MGNi5uOfuSyz2H
	KM0tHEjVQL+xUaW/xFA55XPLPVsnnR1M=
X-Gm-Gg: Acq92OE/NqgKgnSyva4q7/67EpPnNcjI0llrcXjwsTnEOt68yhZWCury1wwE9+cXDwq
	KJ54We2ZOhRCuQyyMxRxZTvtFIelP7mKS2Pm/mJeJcO+wPKZO0DQ1fymKER2r5mSQxt2jMM6jPf
	3wBYtLZoYvhgfyxtBEyrNp11N/KQxRk6iepsoA37vqYzGy/aCJrS3uN4BlJ2cCtSQmphiwjk9oD
	9GfarIV1om9UQTjdk91/4dU7Q3RS33CeUQfueub8jLA8FoFvUZFTWqnxBllYoDNhViZySJZwApB
	SqVAvbLq9cbCUV7U8gMM
X-Received: by 2002:a05:651c:1468:b0:38e:49e6:a363 with SMTP id
 38308e7fff4ca-39650895c6fmr252961fa.15.1779995631117; Thu, 28 May 2026
 12:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260528185722.671-1-adityags2004@gmail.com> <CANNYZj82A0TNrxnZ6jWwV_os2yXGvHhbnqD9zhpvZ56SCO3ojw@mail.gmail.com>
In-Reply-To: <CANNYZj82A0TNrxnZ6jWwV_os2yXGvHhbnqD9zhpvZ56SCO3ojw@mail.gmail.com>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Fri, 29 May 2026 00:43:38 +0530
X-Gm-Features: AVHnY4KLMuxYutTfH0xQ7NQgqDRfIiPnCJQlted4g4GHJL2E6XeMcLhNaDo5aA4
Message-ID: <CAHaUZZA7sd4ODqqAHSWCJ45braUfuSgU9rps3yHkENhsSiVHQg@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="0000000000004b680a0652e58731"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237726

--0000000000004b680a0652e58731
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for the suggestion and for your guidance throughout. I really
appreciate your patience and how friendly and helpful the feedback has been=
.

I just wanted to check if you would prefer that I resend the patch using
the -v2 option so it's clearly marked as an updated version, or if it's
fine to proceed as is for now.

Please let me know your preference.

Thanks,
Aditya

On Fri, May 29, 2026, 12:38=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> Thanks, this is good.
>
> It also helps to use -vN option when re-sending a patch or a patchset.
> The header will change to [PATCH v2] ... and so on, so it's easy to
> see which is the latest version.
>
> Alex
>
> On Thu, 28 May 2026 at 20:57, Aditya GS <adityags2004@gmail.com> wrote:
> >
> > Backport upstream fix to improve stability of randtest.sh by
> > retrying when sigma is too small, avoiding intermittent failures.
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254
> >
> > Signed-off-by: Aditya GS <adityags2004@gmail.com>
> > ---
> >  .../gawk/files/randtest-fix.patch             | 139 ++++++++++++++++++
> >  meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
> >  2 files changed, 140 insertions(+)
> >  create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
> >
> > diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch
> b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > new file mode 100644
> > index 0000000000..0b813e667e
> > --- /dev/null
> > +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > @@ -0,0 +1,139 @@
> > +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> > +From: "Arnold D. Robbins" <arnold@skeeve.com>
> > +Date: Thu, 28 May 2026 09:52:41 -0400
> > +Subject: [PATCH] Improve test/randtest.sh.
> > +
> > +Backport upstream fix to improve stability of randtest.sh by retrying
> > +when sigma is too small, avoiding intermittent failures.
> > +
> > +Upstream-Status: Backport
> > +[
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4bc864=
913437619af7a983
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
> > diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > index ac9d8500d6..06184a4b48 100644
> > --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr,
> mpfr"
> >  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> >             file://0001-m4-readline-add-missing-includes.patch \
> >             file://run-ptest \
> > +          file://randtest-fix.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
> > --
> > 2.34.1
> >
>

--0000000000004b680a0652e58731
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex,<div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the suggestion and for your guidance throughout. I really appreciat=
e your patience and how friendly and helpful the feedback has been.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I just wanted to check if you w=
ould prefer that I resend the patch using the -v2 option so it&#39;s clearl=
y marked as an updated version, or if it&#39;s fine to proceed as is for no=
w.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please let me know yo=
ur preference.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,=
=C2=A0</div><div dir=3D"auto">Aditya</div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May=
 29, 2026, 12:38=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.ka=
navin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Thanks, this is good.<br>
<br>
It also helps to use -vN option when re-sending a patch or a patchset.<br>
The header will change to [PATCH v2] ... and so on, so it&#39;s easy to<br>
see which is the latest version.<br>
<br>
Alex<br>
<br>
On Thu, 28 May 2026 at 20:57, Aditya GS &lt;<a href=3D"mailto:adityags2004@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Backport upstream fix to improve stability of randtest.sh by<br>
&gt; retrying when sigma is too small, avoiding intermittent failures.<br>
&gt;<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D16254</a><br>
&gt;<br>
&gt; Signed-off-by: Aditya GS &lt;<a href=3D"mailto:adityags2004@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gawk/files/randtest-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 139 ++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 140 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/met=
a/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0b813e667e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; @@ -0,0 +1,139 @@<br>
&gt; +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Arnold D. Robbins&quot; &lt;<a href=3D"mailto:arnold@skee=
ve.com" target=3D"_blank" rel=3D"noreferrer">arnold@skeeve.com</a>&gt;<br>
&gt; +Date: Thu, 28 May 2026 09:52:41 -0400<br>
&gt; +Subject: [PATCH] Improve test/randtest.sh.<br>
&gt; +<br>
&gt; +Backport upstream fix to improve stability of randtest.sh by retrying=
<br>
&gt; +when sigma is too small, avoiding intermittent failures.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?i=
d=3Df2250f4bc864913437619af7a983" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4=
bc864913437619af7a983</a><br>
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
&gt; diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a> b/meta=
/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; index ac9d8500d6..06184a4b48 100644<br>
&gt; --- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D &quot;--with-mpfr,--without-=
mpfr, mpfr&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-m4-readline=
-add-missing-includes.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://randtest-fix.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;378f8864ec21cfceaa048f7e1869ac9b459=
7b449087caf1eb55e440d30273336&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</blockquote></div>

--0000000000004b680a0652e58731--

