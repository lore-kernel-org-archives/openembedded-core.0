Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.896.1589474920004388109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 09:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SKGeS0Xp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w64so1362050wmg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=02eoMNqCB1X0l+l0KQZXPdLWulapYu8DktFhXLE1rzE=;
        b=SKGeS0Xpmp/OKZDzb9FCfDNGQVb5Scxnd1+0zuSu/c9Ip4MO9PvgpjcKgT2uXunJJ1
         zlrL5MNFzSntb+6SazuuJErsSOE6X26aiR/UkN/We2YABB/Xx5nQFFloYQw6eswLqc1p
         vQA2Qo7Slqtwl67jiqRrYSksV/D6Mitavwf0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=02eoMNqCB1X0l+l0KQZXPdLWulapYu8DktFhXLE1rzE=;
        b=EmDnoJP7TLTbH1Wpxz2BeSnw1vIUkK0g1C4k2HneQErAV979r7QSnOzwu9O1Lq00Jw
         mroMeAZ2WZvnfcR3zTiDnoVKnTpu6fcJAFQafQ/Fw0LW9UgykAB+a7mtgTkvK2w4t/s1
         uS2h56jM/rxW/K3VWHB+tjNNRohZi6wRwyFY/NsR7z+x8ANSkFk8U1DK2txJdgslH3t9
         CxyqvKENwnW/Qtdz1c3+KvxmOji72i+SVXJyogkNt4u2au2RVepGU8cTqxYqqGUMRxYi
         ZVAGRhnSBw56ZH81pG4UxNE2zfC3EQLh/i3jaClJNlFiwiogO2UqyaEEMEQSR+Ib6eA+
         YRVg==
X-Gm-Message-State: AGi0Puay+FVSUoIGDgaipeTOyxQq1hWvaapS8NW1s7Jvc5RpGneY+j0O
	6qxbcu2hj42qCIP1+EfEaLibuQ==
X-Google-Smtp-Source: APiQypLiSO6ezfIHsQUQm4KgqjpWBSyUXxuhNhVwV2ssgORpu3B0MvA8eR+utjoh5+K4uEVLaGu6FQ==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr52770861wmj.185.1589474918518;
        Thu, 14 May 2020 09:48:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b14sm29696000wmb.18.2020.05.14.09.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:48:37 -0700 (PDT)
Message-ID: <1aed1c0bb5cd4f685cadba893415208da91cf7fd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-OE][PATCH v3] image.bbclass: deploy image artifacts in stages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
 Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Bartosz Golaszewski
	 <bgolaszewski@baylibre.com>
Date: Thu, 14 May 2020 17:48:36 +0100
In-Reply-To: <CAMRc=Me-Ek8d181vzfhi44cMmRsu=Qw1HiErCpjiWZGxkc5LCw@mail.gmail.com>
References: <20200512140529.27606-1-brgl@bgdev.pl>
	 <CAMRc=Me-Ek8d181vzfhi44cMmRsu=Qw1HiErCpjiWZGxkc5LCw@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-05-14 at 18:16 +0200, Bartosz Golaszewski wrote:
> wt., 12 maj 2020 o 16:05 Bartosz Golaszewski <brgl@bgdev.pl>
> napisał(a):
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > Make each IMAGE_CMD task an sstate task with its own IMGDEPLOYDIR
> > override. This way each generated set of artifacts is deployed as
> > soon
> > as it's ready instead of the do_image_complete task handling the
> > entire
> > deployement. This allows us to better fine-tune dependencies e.g.
> > we
> > can make do_image_wic depend on fitImage task which can in turn
> > depend
> > on do_image_ext4.
> > 
> > We need delete the IMGDEPLOYDIR variable from the data object
> > passed
> > to each image task so that it gets expanded with the correct
> > override.
> > 
> > In order to make sure that tasks added to SSTATETASKS in anonymous
> > python
> > functions are correctly setup, move the code that assigns pre- and
> > postfuncs to an event handler invoked on
> > bb.event.RecipeTaskPreProcess
> > in sstate.bbclass. This event is fired right after the anonymous
> > functions.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> 
> Hi all!
> 
> I just noticed I tagged this patch as [meta-OE] instead of [OE-core]
> -
> hope it's not an issue? Should I resend it with a correct tag?

I did notice but no need to resend. I was planning to queue the patches
for testing.

Cheers,

Richard

