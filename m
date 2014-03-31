Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 268DD6B593
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 01:52:33 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id jy13so4579818veb.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 18:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/2zxMxVnX54Zc41QKpORZ6G/FrMV+h+ajosNVsrmzSk=;
	b=zsgdSovDtx72wnFnw5Y+wCm3UiAJSHO4gODYJjEQNDfVV0LsLNa89xqQDy3NMt70hR
	+mHUNzzkbBnYk/+nteKDKrKarcjdmmGB8IWMhM1rM+mEFVeYBjIqs4Na0WaiUdW1obb1
	zAJxh1iGRode11zLdizheRciWNtq2bJWi628QrwfbNOgruLLQAoJAhLpjzE3HjNtwPbe
	unuAxdA3xJXtmqzYfEqFwl8OzkRWphSlXWrHmIlPFdTOrNvMCVrqB/IQ8I9XhJfAXLh4
	dMBtLPZprwl9URpfQQhpArrLaH36TXO5R720qZ4jNSqZMd9YbJsFzXxw2H14Ct4tzTSr
	exbA==
X-Received: by 10.220.250.203 with SMTP id mp11mr20617005vcb.2.1396230754452; 
	Sun, 30 Mar 2014 18:52:34 -0700 (PDT)
Received: from [192.168.1.3] ([187.106.6.19]) by mx.google.com with ESMTPSA id
	xr10sm14415737vec.2.2014.03.30.18.52.33 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Mar 2014 18:52:34 -0700 (PDT)
Message-ID: <5338CA5F.2080104@gmail.com>
Date: Sun, 30 Mar 2014 22:52:31 -0300
From: =?ISO-8859-1?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>	<CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>	<CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
	<CAP9ODKqVPgoyH_XveWsJugSyHfBd0q0cccKWD2wkTMg7dKJd-Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqVPgoyH_XveWsJugSyHfBd0q0cccKWD2wkTMg7dKJd-Q@mail.gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2014 01:52:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


Hi Tom,

Let's back in this context. This is really important and I was waiting 
to complete the previous stage.

Em 17-03-2014 13:11, Otavio Salvador escreveu:
>>>
>>> If my understand is right, I like the feature. My only concern is
>>> people overusing it and adding contents which are not 'tracked' in the
>>> build system in a product release which seems attractive when we first
>>> think about it but cause some management, tracking and authenticity
>>> check problems in long term.
>>>
>>>
>>> I don't know how to better address this from wic perspective. Usually
>>> we end doing multiple images as part of the build process for those
>>> special cases and I don't know how wic could be 'told' about those
>>> secondary rootfs existence.
>>>

I have been working on it since Otavio's concerns about 'contents which 
are not tracked'.

So extending my previous patches (80% done) to handle this situation is 
quite easy. Like this:

bitbake directdisk-multi-image-e img1=core-image-minimal -e 
img2=core-image-minimal -e img3=core-image-minimal

directdisk-multi-image.wks:

part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label 
boot --active --align 1024

part / --source rootfs --image-name=img1 --ondisk sda --fstype=ext3 
--label primary --align 1024

part /standby --source rootfs --image-name=img2 --ondisk sda 
--fstype=ext3 --label secondary --align 1024

part /root --source rootfs --image-name=img3 --ondisk sda --fstype=ext3 
--label root_sec --align 1024


If the user put '--image-name' and '--rootfs-dir' the '--image-name' 
takes precedence.

As wic is a generic tool, the user could prefer to use images from OE or 
any other rootfs-dir.

Tom, what do you think? Could I go ahead?

Thanks

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


