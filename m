Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008DACD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 19:08:25 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18341.1779995300525290889
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 12:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SxrfeExq;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8bb09239328so99774716d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 12:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779995299; cv=none;
        d=google.com; s=arc-20240605;
        b=de7wBkih2zbx/94g7ex23/DgBoLRvMgU0OzPSTpYg9OCFt0uLH9Rct0+3MBcfD65pz
         ZSZXVgvVKnUXZftWQ25pR0n86H2KMt60zqgeEY/72SL2o7DMZIyoekg56imdDkXgvSmg
         ulTaYBZWW0za+g5H03uqkAh0l0K0NIGxenNWIUXXRMOvia7Awf03gbbySpUvQRWIjEqM
         ZPIj/p5jHXV+TU4BsnG682fXMIE1shn8pe8wjYWpCUZYxXnXzjWco2dkjR1bqY3pVUpB
         SdKiMdWFV2ddCpUvbkNXissj3oFX0VjMfGycihfyCKbYYXkuwBuRoFi4mf80wRPIqu0k
         kiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=162vb7yBCJzQAd6//RNBr9xoq3A0fx/KlBxCHpgy75s=;
        fh=mknMAB465/bsbMm77BFD2bx8Fk8ciagIJ0ZJVcHYAd4=;
        b=k5NoIe+VMCLsyvKZD2ipNzKG5Dp1OWR++zmGbABnDRVjC4M936OxfNCutmcJyhsNcs
         xR5TGShSWlLpixDshgKqoxOC1RIEx0gN92vQlCpNmaoj4TDv2S+uZD2jBl8A4nPyCc2g
         003OnZCzkegEecYU94ebFOx3J1DwKQ7YXVnZzHnTYrAFUVXPRRdJEO1oV47ZzbKJgmzt
         xaEiOzlgYyQHcojUumj6yFpLSCjG5mIpRckdWJKUKnhQmq0Zn9DBy9seyh8StcICkVKF
         tiHs+TOeUFiEg7pUPaeNeVISrtY9p3fvhNFYNqlbTpPza1auxY5bg2jlgRxcDRlj4DQZ
         EfMg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779995299; x=1780600099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=162vb7yBCJzQAd6//RNBr9xoq3A0fx/KlBxCHpgy75s=;
        b=SxrfeExqksa/2DNiXvWcfKM0d/WLQGmdvJwitbwsXqLrbqnn7NXyUn/ydo+mf1+J6T
         HsZdekzqqmj0cBW79dAjmqZI8HdFe6BU9K+eH0IFDMTvgqOkMZQOyx0NhNhMaNum+EXq
         3r0r7CXezNhax5EzX0VBr0XyIgrHdKh0qX8CHRPgjjpH95RE1gP2N8G1ML/0RWpAvj3S
         o649JFtF8cdGSFKr4Q8CN9aqLmD2rH8FyUZalvXlpC84Q9r/yn96ts7GRdvOYaIVT94P
         YI1B1GDmcV4B+RnbRs7UQhC9aed9t5Xk0NjHXK15Mstp7a0qlfUmguSU3oJ5FE1EeMXq
         uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995299; x=1780600099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=162vb7yBCJzQAd6//RNBr9xoq3A0fx/KlBxCHpgy75s=;
        b=oMgMVxjACD8C0d2UKvoP4RNv8qXUi3YgpRLEJTJ2Udil8l0zokYAHUts9nu0E+QzQ8
         HWG4pFDX0HXJORQumYT2/mUylwL1nZaLaHyQnlQWqSEANF78Gnb3n3lkE/DfUJ0Objab
         9ByJz4L0YVUkRHDYw7OqmZBkAOtU6UxxgFqQE+lVGW+BVx/Cpz9yd/ZR6xRYhLDHiCFy
         oqCV8IjXURxxfLPmlf1xQcWPey6nSVNk59E3tqZT8mpAXvnefo5T3Q6wliJ9ExeT1C1V
         v3zoPNi9qI6rG5I0bkZxG2cllLU80svAd4XLZW5vh4Ca9rpffZ7t30NIK0gcGElZ4KUK
         XjTQ==
X-Gm-Message-State: AOJu0Yzi+zkkiHyo0Y6Rw6I4SP0vkubHGBjizhkP+RNsL+f2PisjmTtZ
	s2MbqAOfp+GSbROWpM4oAOX5g+ykvajGDICxwQEVbkPyuHsjMYT2eym1s+/07zwwxqKVE4zTl1r
	OoF8YM62S9AA6rQRamZsgexUXfi3YlwA=
X-Gm-Gg: Acq92OEADNY9ede/B8EEOjZjoJvcSxHZy/saYZuoOXJ3Uw8RYOMTXxAOFTND3tYV7ZM
	W5sMZXOlg5l4FlvOslNw9Y9OOea8GZjAY4wpHO0pKXszarGOfsu8Fy4ZFfx1WD74vuZC5k48ELX
	nr2eoCRgzhvI/dF/oqXZTQ9oP+VcuZaOzyLxCjegaQrcf273k9/MQce/mIJqK2xUc62WapA+289
	k/N10wyfvvUXGpgoPLBUzkCG4EzvH/z33UW3F5Rl9fLnU+f3UGEVg8vlEX48KKau/4JxNI17yCU
	rCURkOMeZ62O0hAcnaNBJfryoGWDtN63qZXgpLkXdTX4brdbD8jL
X-Received: by 2002:ad4:594e:0:b0:8bd:de6d:c331 with SMTP id
 6a1803df08f44-8cce20d14d0mr8180806d6.17.1779995299485; Thu, 28 May 2026
 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260528185722.671-1-adityags2004@gmail.com>
In-Reply-To: <20260528185722.671-1-adityags2004@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 May 2026 21:08:08 +0200
X-Gm-Features: AVHnY4KKTGSFx6b_GX1vkPf1LIJcPtxnmEvBVo5LRA67Tlaf8CTnMMVu6AAX2yk
Message-ID: <CANNYZj82A0TNrxnZ6jWwV_os2yXGvHhbnqD9zhpvZ56SCO3ojw@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: Aditya GS <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 19:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237723

Thanks, this is good.

It also helps to use -vN option when re-sending a patch or a patchset.
The header will change to [PATCH v2] ... and so on, so it's easy to
see which is the latest version.

Alex

On Thu, 28 May 2026 at 20:57, Aditya GS <adityags2004@gmail.com> wrote:
>
> Backport upstream fix to improve stability of randtest.sh by
> retrying when sigma is too small, avoiding intermittent failures.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254
>
> Signed-off-by: Aditya GS <adityags2004@gmail.com>
> ---
>  .../gawk/files/randtest-fix.patch             | 139 ++++++++++++++++++
>  meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
>
> diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
> new file mode 100644
> index 0000000000..0b813e667e
> --- /dev/null
> +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> @@ -0,0 +1,139 @@
> +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> +From: "Arnold D. Robbins" <arnold@skeeve.com>
> +Date: Thu, 28 May 2026 09:52:41 -0400
> +Subject: [PATCH] Improve test/randtest.sh.
> +
> +Backport upstream fix to improve stability of randtest.sh by retrying
> +when sigma is too small, avoiding intermittent failures.
> +
> +Upstream-Status: Backport
> +[https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983
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
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> index ac9d8500d6..06184a4b48 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
>  SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://0001-m4-readline-add-missing-includes.patch \
>             file://run-ptest \
> +          file://randtest-fix.patch \
>             "
>
>  SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
> --
> 2.34.1
>

