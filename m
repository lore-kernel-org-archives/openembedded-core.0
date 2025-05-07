Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF35FC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 08:31:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.3855.1746606710552277808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 01:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N075vVGg;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so7971971fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746606708; x=1747211508; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8sG7sE5/s2tbaDTRXuxdUuRzp9LjiRSf55OImkQCP/0=;
        b=N075vVGgHTuGqE6JGL1qOa24GGbj7tLr8OkNzqUmmDJiIwfxymZpS39XZs83SCWxDE
         1Hm4rCP8L2j/4SRmLyYTVDyUcwn5jBGV939ex5iWRiqoiVIrG7TgPhBrZ1/MHoI6TAo6
         DNDZN60lVkprRER/3wWI/1T2whhyGkFc4k1UOE4HYkwvmJu56uzrcK1HLbv6EdZ/shKg
         ycYsU4HMFpQtisiNDo2LZemK+t6JAxGiq8uQK0NlcKYkUts83ebdnoVr/p/I5Stf0XCK
         h/9abPU+F3TqpkG8lrRZFOpOmy5kkncLApVZd+60in3euMUbJ05C++gqOAdroSeUR9VM
         QdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746606708; x=1747211508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sG7sE5/s2tbaDTRXuxdUuRzp9LjiRSf55OImkQCP/0=;
        b=HaOtz7pbiZLlOPO5BXOfNePWPSXT2aTHSxzF30At0Xo5LA1woK3dFwRbP8oXBJMICK
         AKabVcZXZwZ6xw3tqqygyGcCBxs3CugkhTzNXD5p50jU0na3LGZsbNymNqEnxHFdU6TH
         efIbJTRNPbq8qRp3us8Q0pO/4HEpwvChzKKJeVW29bRAubbOBlC7gKL09Tn+fbk7HnuV
         gZjaqopBQWFMpGS45L5IZl+lOkteifkyposViHr5GzBaYVX1UT1STZx6czqg26Hh+iVM
         0c+Po1WRvXLd/CtbXA2ApwGQrH1fah1Bw4s58wN33O3i/9qlMHcYPoDpH/H+x8lhHRat
         moCg==
X-Forwarded-Encrypted: i=1; AJvYcCU6ajALUrxLpbp5KSD4tsYN1BNbJlmXMI/g6Ot7384XQe03d2IXZ7jWTfeQQXKvijzjxfv0p+cYqvp6sjalzA3ehw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy15xikh92A/sNvKWV0O7B/QYi+yj31KnYWSOAhq0bMixKoqIGh
	x92k4T7Q9dx7Ll8dz3SQP959Bynz04F6ITYxOF2yg/aLPCTEU249i9Spc1PZNdM=
X-Gm-Gg: ASbGnctlisVHwKsUNyco5CEZzGZfyrBRHEXSd/TWk9ee3gb3MlxK51s6GE4ByyEefXR
	5xsN8OOfiB7tu+muvgSWBTYUqTPl+SuRwGjTFwDPQ97hgIBsNgMlS6L+AXYakqfidXibSJqWD2D
	YTkFOfSohrlYrSgw8BRtlVIu8RPE8NIvUnxOz5XxlQcB/8fLoSzAVN5JdGLBlSUwhnrTbcTKdW5
	sWLbMjffMgWHNnQtnDRjgvlqTRgW57ejzbO0UVnIraTJPg4oTXwWWVQ19PcgH6vq5OZF1vfFKeV
	Z13MVCqauzLsUT2ApgNu7bK2O70UccTABIv1atMB1DBNUNSZPEh1/A+QVExAec0Qs0Dbc0CQSw=
	=
X-Google-Smtp-Source: AGHT+IGTf1c8vyjNQL7S4wXx1aHTN2y+e5RQ2nrs8pgmyY4OQKOqnuIbzNRpgmcTlzs2bximnffQ/w==
X-Received: by 2002:a05:651c:1589:b0:30b:f2d7:1e7c with SMTP id 38308e7fff4ca-326ad06ea53mr7385991fa.5.1746606708368;
        Wed, 07 May 2025 01:31:48 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202901716dsm22092881fa.26.2025.05.07.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:31:48 -0700 (PDT)
Date: Wed, 7 May 2025 11:31:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: raj.khem@gmail.com,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBsacm6DAvrHxHpO@nuoska>
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org>
 <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <183D310FC8853D5E.1749@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 08:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216102

Hi,

On Wed, May 07, 2025 at 11:22:49AM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> I think disabling linker warnings as errors in systemd is the way out for now.

Sent out https://lists.yoctoproject.org/g/yocto-patches/message/1524
which disables systemd linker warnings as errors and fixes this for me.

Cheers,

-Mikko

