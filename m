Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10EACD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5132.1780654742882322839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 03:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=btlvlyr/;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ce9df31840so12090396d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 03:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780654742; cv=none;
        d=google.com; s=arc-20240605;
        b=b7Jbjp2RMiZ2dp8RqDkoeCwSMy42gKNfrJeHZ0UwY0ZXq7biVSpNb5OJKB6ReF/7pL
         pUB8wLRhaXEwMc1sDbcal+Qp0HYAIB3W25VjtXBCoEeT2CqnHGd9KrEF3PKyXvLb3Is7
         tHzf8GbmHea5W5BdOwyeEeMv5dOxKYQvIkm2/R5oEKCH+9/s6NA8Vi/3kNibzwBGD+kG
         556sAk4oq1LcJsWuKZmZF7/N8iO9+VNJHb95MfxIba9q/4qNB8WJyueKzyLE/ASAimNG
         QtOZ30MZ4w5ij6MU33EiXAavMqtQn53N94OpVx3nq1Nr3rduqdoiwymuI6a8v5B9CtcY
         XBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CuBUgLy+NQmdo6J0duA9FRIW1Js1nWocpH5DHQVLVbY=;
        fh=mknMAB465/bsbMm77BFD2bx8Fk8ciagIJ0ZJVcHYAd4=;
        b=QwpO+CXrJEZni9CoU/I3J3QEqEXifHgTJ77OLKpXt0wuywhqmBXug8C5pyOKIwt/7Y
         PX99Gl/JWhnXz9MBSqKb/W/M648sD4SJYHJnfAIchQt0SlgSzoZ3ruedGASU43J3Pk+7
         r6gehOKC5Mm3DM8J0wV/0n4NCfw5dM4oMUtQYRo1Qk2+XB5JbsVuheqELe5LRGCwDh64
         +RfUHcwx2uTMiKkZLV2o6Pi3hXa+tT39ukIFg+gdp/CTXgdpnbmaeyhWes7ohzHJmi4N
         kqCSPdqyCITKsZWpFb2XrsYNXGffVYfmZ/m7hWMs25nznIKAXVSBgCz3iq/YCK2XmoXa
         FMhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780654742; x=1781259542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CuBUgLy+NQmdo6J0duA9FRIW1Js1nWocpH5DHQVLVbY=;
        b=btlvlyr/YQLC6bWfyATChaXEWbuh4UKv7v3qR+uffuRqKSA1NACVCNfliaj7pDiMmb
         obA85IWI3LvQUzCIYomnsDDeITRd91WYfpy/1YiW/Wb+SvJbHMFiuag3R7mfm4/9j2pJ
         wvYf2GkiUt57mw5eyBUjw9MDVIOCwFuALvxHqrqfm88pPOJx9Z5WhZkWIvM5GYiyUkmS
         N5GpDDKuztmjWozcidKy0vkRAhKyBor+TwlzU6LFQItOh7X3KUjGczCRiNu9RywXajbZ
         x8N6jhM9m3VKjkNGhxLhhGQBKpHYGOXnvfJp8p1AFlQI0qAf5huiFjtfGMX5YXA4BXhu
         mhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780654742; x=1781259542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuBUgLy+NQmdo6J0duA9FRIW1Js1nWocpH5DHQVLVbY=;
        b=aTfxBWt3Hnk1rU1nNCrB7/nnVWC6yUvRnnfbxNSd+SCRmfGMQFYNVJdxqiRJRHaQ/o
         klE9BA4HsdXEzyJIfWqmQRX9g1Xv4rldyahxYi/bP2OWqXMCyxbIsQsIJh2LHAB9MGHp
         RK4RQwdAkMi6qtVNnF2mlQYDl+WgpfW48NH+hDYNZJz4JNdH6Zu9g+bKtf+JnkEgKMPk
         RnJR5MgE39Skw1NIZk0xz+HGFwa/JybEgzTb0p+1pjr96qUZR2ddy/up7KQh3OwPJoD4
         pjIIV4GrbU0B85qPPFOu1NDRpiU2Q5qfhi/6V5SMKHI2sRYLGsC8Tdran7uO+CBxRZaR
         8ttA==
X-Gm-Message-State: AOJu0Yz3508A98N3/XUQfvtMTdBv+fofDvw1pJt0JyY1CGRAbHfK6FWj
	iM4x/IzqmSxtpUX00ES7GNUY+w5iJEqePRTrxK9Lk/NYCSKb4euqQoosWhfnVWzCoIIfIvtfKxC
	0xRbgYpvm8WZ86XaGeadfnIjtNDwCkLs=
X-Gm-Gg: Acq92OFWcTVF91G4SfaEOXAdA9qBpasxqdLuxiLDRObeM5SSkHNl3+kQ6ue4qg3o+Pk
	e9vKt3XEGTJJbPBTZH1mITukwumVd5eRG0Hsf26w036abPMIlZr48exU6f3eNcUMby2QULQkwAu
	ASvYM6wZ6asMI/Vj8VqSmWkQjkauSuTz3/jkXI+7UsbN4v9hnZwqNuMeLmN6e6iRvCpV/JKr7sl
	D1iPopxszW29R6vqka8C74Nwbnri17Q1X0MDNWW6cflGtevriApDbeyY5zJXVGAblYcCp/iVN0J
	5JT2NdFD9CafP3gQytNsEfzWRSI025qW/xwv2y/fkPlLD/kWsaOU
X-Received: by 2002:a0c:efc4:0:b0:8ce:9ebe:1dd2 with SMTP id
 6a1803df08f44-8cee611fb89mr36578366d6.29.1780654741764; Fri, 05 Jun 2026
 03:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260605081737.1568-1-adityags2004@gmail.com>
In-Reply-To: <20260605081737.1568-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 12:18:48 +0200
X-Gm-Features: AVVi8CeMbNjwCcbZ-mahSzPuFBDuVyYL7SiuSnCi78iri2GpzbaFQkRqCdxA8yw
Message-ID: <CANNYZj9thZKkUceNJpbbaMyCHzjy=HdJYjjtCcCkzy=UToOfxw@mail.gmail.com>
Subject: Re: [PATCH] gawk: improve randtest stability
To: Aditya GS <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 10:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238159

Hello Aditya,

an earlier version of the patch was already fixed up and merged; the
patch review participants decided that it's better to fix the
frustrating CI failures quicker than do more review-fix-resend cycles:
https://git.openembedded.org/openembedded-core/commit/?id=ccabae3036a713cac8b08731b765ff1dc3ed93eb

I'd suggest you rebase the latest commit on top of current oe-core
master with 'git rebase', and send any remaining differences (e.g. the
missing signed-off-by) as a separate patch (remember to also edit the
commit message so it matches the patch content).

Alex

On Fri, 5 Jun 2026 at 10:18, Aditya GS <adityags2004@gmail.com> wrote:
>
> Backport upstream fix to improve stability of randtest.sh by
> retrying when sigma is too small, avoiding intermittent failures.
>
> [YOCTO #16254]
>
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> ---
>  .../gawk/files/randtest-fix.patch             | 138 ++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.4.0.bb      |   1 +
>  2 files changed, 139 insertions(+)
>  create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
>
> diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
> new file mode 100644
> index 0000000000..0aafa0f282
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> @@ -0,0 +1,138 @@
> +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> +From: "Arnold D. Robbins" <arnold@skeeve.com>
> +Date: Thu, 28 May 2026 09:52:41 -0400
> +Subject: Improve test/randtest.sh.
> +
> +Upstream-Status: Backport
> +https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a9834a1c24915acd
> +
> +Signed-off-by: Aditya GS <adityags2004@gmail.com>
> +
> +---
> +
> +diff --git a/test/randtest.sh b/test/randtest.sh
> +index 597376a8..6ae6f830 100755
> +--- a/test/randtest.sh
> ++++ b/test/randtest.sh
> +@@ -45,68 +45,77 @@ $AWK 'BEGIN{
> +     nsamples=('$NSAMPLES');
> +     max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
> +     nruns=('$NRUNS');
> +-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
> ++    max_retries=5
> +
> +-    for(run=0;run<nruns;run++) {
> +-      sum=0;
> ++    for (retry=0; retry<max_retries; retry++) {
> ++        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0;
> +
> +-      # Fill an array with a sequence of samples that are a
> +-      # function of pairs of rand() values.
> ++        for(run=0; run<nruns; run++) {
> ++            sum=0;
> +
> +-      for(i=0;i<nsamples;i++) {
> +-         samp[i]=((rand()-0.5)*(rand()-0.5))^2;
> +-         sum=sum+samp[i];
> +-         }
> ++          # Fill an array with a sequence of samples that are a
> ++          # function of pairs of rand() values.
> +
> +-      # Subtract off the mean of the sequence:
> ++            for(i=0; i<nsamples; i++) {
> ++                samp[i]=((rand()-0.5)*(rand()-0.5))^2;
> ++              sum=sum+samp[i];
> ++            }
> +
> +-      mean=sum/nsamples;
> +-      for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
> ++          # Subtract off the mean of the sequence:
> +
> +-      # Calculate an autocorrelation function on the sequence.
> +-      # Because the values of rand() should be independent, there
> +-      # should be no peaks in the autocorrelation.
> ++          mean=sum/nsamples;
> ++          for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
> +
> +-      for(tau=0;tau<nsamples/2;tau++) {
> +-          sum=0;
> +-          for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
> +-          corr[tau]=corr[tau]+sum;
> +-          }
> ++          # Calculate an autocorrelation function on the sequence.
> ++          # Because the values of rand() should be independent, there
> ++          # should be no peaks in the autocorrelation.
> +
> +-      }
> +-    # Normalize the autocorrelation to the tau=0 value.
> ++            for(tau=0; tau<nsamples/2; tau++) {
> ++              sum=0;
> ++              for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
> ++              corr[tau]=corr[tau]+sum;
> ++            }
> +
> +-    max_corr=corr[0];
> +-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
> ++        }
> ++        # Normalize the autocorrelation to the tau=0 value.
> +
> +-    # OPTIONALLY Print out the autocorrelation values:
> ++        max_corr=corr[0];
> ++        for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
> +
> +-    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
> ++        # OPTIONALLY Print out the autocorrelation values:
> +
> +-    # Calculate the sigma for the non-zero tau values:
> ++        # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
> +
> +-    power_sum=0;
> ++        # Calculate the sigma for the non-zero tau values:
> +
> +-    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
> ++        power_sum=0;
> +
> +-    sigma=sqrt(power_sum/(nsamples/2-1));
> ++        for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
> +
> +-    # See if any of the correlations exceed a reasonable number of sigma:
> ++        sigma=sqrt(power_sum/(nsamples/2-1));
> +
> +-    passed=1;
> +-    for(tau=1;tau<nsamples/2;tau++) {
> +-      if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
> +-          print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
> +-          passed=0;
> +-          }
> ++        if (sigma < 1e-6) {
> ++            print "Sigma too small, retrying run", retry
> ++            continue
> +         }
> +-    if(!passed) {
> +-      print "Test failed."
> +-      exit(1);
> ++
> ++        # See if any of the correlations exceed a reasonable number of sigma:
> ++
> ++        for(tau=1;tau<nsamples/2;tau++) {
> ++            if (abs(corr[tau])/sigma > max_allowed_sigma) {
> ++                print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
> ++                print "Test failed."
> ++                exit 1
> ++            }
> +         }
> +-    else exit (0);
> ++
> ++        exit 0
> +     }
> +
> ++    print "Test failed after retries due to unstable sigma"
> ++    exit 1
> ++}
> ++
> + function abs(abs_input) { return(sqrt(abs_input^2)) ; }
> + '
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
> index d7211f28f3..71e7ddb31f 100644
> --- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
> @@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
>  SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
>             file://run-ptest \
>             file://0001-configure.ac-re-enable-disabled-printf-features.patch \
> +          file://randtest-fix.patch \
>             "
>
>  SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
> --
> 2.34.1
>

