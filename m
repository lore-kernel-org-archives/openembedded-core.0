Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBA9E7718B
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 15:30:05 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.8596.1735140595527792133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 07:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oc6VyuY4;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd1962a75bso42610686d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 07:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735140594; x=1735745394; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TQSD5fTiOmkmnhteZ9XPGsFPWlHwxk80JkOCEQDICqE=;
        b=Oc6VyuY4dcWV2uqModv7q9SAAXs/m2RcYUMBDPilYw+cG7VJ11wUxFrlCFHNwgfK4I
         DxoqQ1uOrr4Iy6vQOSGKREz7nczUsorFD7ggapdE2goXb32xAhEUKJKVzW2mO5SsPzBq
         whNjJx5zysHy+HKYXRd4ByM24MMkzXZQ+AS/I2xDKt21UrquVVQ8uXjSwSZTonWw1UuB
         Oyh1nrADb+Z1oiE5Y0VlJFnVWWdlFt4CbN6d97FFkFcdbOJP0euEcUvVzzn3OgzTHBTz
         zN9bwMNle9jrFYs+e7lDUEI5JFSXE1JTaJrJN4RARcZ+sMi/NsVqJvN2k8NbLvoATfcD
         d1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735140594; x=1735745394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQSD5fTiOmkmnhteZ9XPGsFPWlHwxk80JkOCEQDICqE=;
        b=bsMVZX5hk7zWqTEKIMPe0PByTYzxlKaXHaXKNWAh1AbRi9ySMm24vNsGaJ0RJ2L4w/
         ITGS6N60VJDY9iS9ugDXNv0nSQ6WIEpsRMk/D03eJB08MNp5dEMDe7obglJ75rdpoB2R
         sVu1+s/KKxvXqXeg2QqMtOoizN27PAfbttt/Oh3rEOR1RZJ418CzlSn67ZWBk/kKEUWb
         02JQ0lp+Xo94Ctg+lr9Ls4GkyinXDOZmoQZugsFz/YTbhrXFIqna3jKhsMo+Jytewg8p
         CS58Mt/UY+nItPQo70xYis4SqcxzsdQi2xDh/ehqyD5OSGipTH30QZaP86F09xACyJy0
         Loqg==
X-Forwarded-Encrypted: i=1; AJvYcCU12o5b5Q8wD9/maFDybnG/Z1WL1MS7Wc9LymtPcC9Wz43IArV9XZs/TIyPcr0XxEb7j9jCITQpepCQ5KAOrdaTYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8mBX9ptSc3uIgAZ40dIOGnN6GazM5LZV1FosRAFCxmOfam65R
	GK9hlx5xGLJbXMy6TShee0kB2ugZ3gr9TrKab/ela6SwVMI4hF8/vcnfhPi/BgQOtMAlBOwLBk3
	3ZYf5s/FfbVTdojk3e+OdFvXRSlo=
X-Gm-Gg: ASbGncvMM/zfslO3RoiQ7wsvMurzEXAI89+cbT0PIKer4N7DhZhnBugy5itmarsNZdm
	r/7VzQAWFnSdl3ThgKmrXT3wdfH5jKUeCqyDfYLLRq/o5KFEhs31h0vbf1i2faxXFrEtQsRd3
X-Google-Smtp-Source: AGHT+IFNKKS3IloiXkFIniR7zwkixJdZkeCGVapSjfBIC0AdgIMJxJYCLkXGR8a/sjs2OSd5hkmW0+69NNF5GFDDyjA=
X-Received: by 2002:a05:6214:407:b0:6d8:b3a7:759e with SMTP id
 6a1803df08f44-6dd233a49c4mr346094486d6.46.1735140594406; Wed, 25 Dec 2024
 07:29:54 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
 <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org> <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
In-Reply-To: <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Dec 2024 16:29:43 +0100
Message-ID: <CANNYZj8_OShX4sPqhGpb3HSbN0quMKUcoFtKhLrcGTLtG1d-Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Joshua Watt <jpewhacker@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 15:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209082

On Fri, 20 Dec 2024 at 18:39, Joshua Watt <jpewhacker@gmail.com> wrote:
> 1) bitbake-config-build is way too aggressive in the files it looks
> for as fragments. My editor (vim) creates hidden temporary files that
> I kept having to manually delete or the tool would attempt to parse
> them and fail. I would recommend that it only consider non-hidden
> files that end in .conf as valid fragments.
> 2) It would be convenient if `bitbake-config-build enable-fragment`
> and `bitbake-config-build disable-fragment` could take more than one
> fragment, as this would make scripting in CI more straight forward.

I see the patches for these have been sent, thanks.

> 3) The biggest problem I had with this is that I can't set variables
> like MACHINE/DISTRO etc. in fragments, I think this is due to how
> deferred the evaluation of this is. Without being able to do this, I'm
> not sure how useful this system will be for me (or at least, it won't
> be able to replace any of the current mechanisms I use). I think what
> users are generally after here is that they can really easily share a
> configuration in source control (which this does well), but if it
> can't control everything it's of limited use.

I tried this locally with poky and adding DISTRO/MACHINE to one of the
selftest fragments, and it works properly, so if you can provide a way
to reproduce this problem I'd appreciate. Or there's something else on
your side that gets in the way.

Here's the output of bitbake -e (DISTRO is similarly adjusted as expected):

#
# $MACHINE [3 operations]
#   set /srv/storage/alex/yocto/build-64/conf/local.conf:38
#     [_defaultval] "qemux86-64"
#   set /srv/work/alex/poky/meta/conf/documentation.conf:279
#     [doc] "Specifies the target device for which the image is built.
You define MACHINE in the conf/local.conf file in the Build
Directory."
#   set /srv/work/alex/poky/meta-selftest/conf/fragments/test-fragment.conf:5
#     "qemuarm"
# pre-expansion value:
#   "qemuarm"
MACHINE="qemuarm"

Alex

