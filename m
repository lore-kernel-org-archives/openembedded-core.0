Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.54633.1585585913402541634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XeMppPeE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id j19so3899015wmi.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h5yU/G3kApCoE8OgSEBAoaTjqMZS/YMC2LXJKzd/RHc=;
        b=XeMppPeEw35c3wYxmane9WmYYOn21ybX/jFRinLgPp8bzYMPpWotk8GiPjRuP9WGz0
         psU9beS+4G5XOHdO0P7lZB38++ib69S2bM+mGuCdhDiDrr9guHB+lTdqLrHSlb6I60UY
         NsFcn2R4xO3XVvBuKVGd3GEX1X6h91hBA4lgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h5yU/G3kApCoE8OgSEBAoaTjqMZS/YMC2LXJKzd/RHc=;
        b=FbhLU219d9yQXnccGrnN/42uT0sApPdKE38pb+ehg/cPFwA9fE/yNj6YM2pGEil5Zc
         Z/1DH1VxlUoye9OewdH2DcCEUI0ZPQQHeJF2a7hawSA5AQ4rbu+6zpOSuhLj+4YGqtzu
         YaYXnBy0zWHXAG0dOBUNiEkqJ+XmKz2tZcmktnYrQcULwk7E/lC1GJgsciUXONH1YJ2d
         b4h6E0F8JmE+j/n6ExHMW8IsClggQpRawio7VUGnPJM6D8bY0Ca7Wf17i7ZYeuGHzHFd
         HGRjR9AvY7TvCbLkT3gzT/iosNeyPG+zsn4upujWOMNObFOVwyIIgJYjjkUspZsR1qH/
         KpLA==
X-Gm-Message-State: ANhLgQ3WWbPm8FUzkddiXKlq9EweENFxMcSzhQMyfl5zrQdhjxiGQp2n
	RF7sNHdKW7nfqOyN8D6Xsmd/FA==
X-Google-Smtp-Source: ADFU+vtqNU64W2MG9w/x2jSFqdB7METeWyoNhyUTAd2zt3LK52avI+Qu43Yk+HMIlkFd57Ypx24ZIg==
X-Received: by 2002:a1c:1b14:: with SMTP id b20mr85504wmb.163.1585585911807;
        Mon, 30 Mar 2020 09:31:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l12sm22340600wrt.73.2020.03.30.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 09:31:51 -0700 (PDT)
Message-ID: <673150a994845977a61edbd6a3a3e39f5dc8b3c6.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC PATCH 2/2] image.bbclass: deploy image artifacts in stages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
 Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>,
 Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Bartosz Golaszewski
	 <bgolaszewski@baylibre.com>
Date: Mon, 30 Mar 2020 17:31:49 +0100
In-Reply-To: <CAMRc=Md2DfUTEhR-DzswDc=LQSHdJ35NMeQCVMJ_qC7V_4jiEw@mail.gmail.com>
References: <20200323172808.26338-1-brgl@bgdev.pl>
	 <20200323172808.26338-3-brgl@bgdev.pl>
	 <CAMRc=Md2DfUTEhR-DzswDc=LQSHdJ35NMeQCVMJ_qC7V_4jiEw@mail.gmail.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2020-03-30 at 18:26 +0200, Bartosz Golaszewski wrote:
> pon., 23 mar 2020 o 18:28 Bartosz Golaszewski <brgl@bgdev.pl>
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
> > We need to completely delete the do_package task in order to avoid
> > problems with task hash changes as well as delete the IMGDEPLOYDIR
> > variable from the data object passed to each image task so that
> > it's
> > expanded with the correct override.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> It's been a week. Can I get some feedback on this? Is the idea at
> least remotely acceptable/can we build upon it?

FWIW at a quick glance I didn't think it was too bad.

I think there will be corner cases to resolve which I was hoping to
look into and give some pointers to but I haven't had the time.

I'm hoping somehow we can improve the FIXME you mention too.

The do_package change should probably be separated out - I'm guessing
we did noexec there for a reason though?

Also, you used {}.format which I'm torn on since most of the codebase
uses the other approach.

Its too late to get this into 3.1 and that is where I'm focusing my
effort right now but I think this is probably going the right way.

Cheers,

Richard




