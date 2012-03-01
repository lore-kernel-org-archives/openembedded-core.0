Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S36uz-0006ML-KD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 15:23:41 +0100
Received: by wgbdr12 with SMTP id dr12so518519wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 06:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.216.137.97 as permitted sender) client-ip=10.216.137.97; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.216.137.97 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.216.137.97])
	by 10.216.137.97 with SMTP id x75mr2829244wei.25.1330611312114
	(num_hops = 1); Thu, 01 Mar 2012 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IUs6+W36AC1SL4CEecnNV99Ddgiu+miGJ4vwOaUwmCw=;
	b=wAtiazF/EqjSAamynxb2U7w8IEpJmRkFqoU8BdaftETxJdZNauGgsqZ+8Nmb3QutJf
	qbdJwT6dwwm1VCRRfqmtqdZT60kfVxef14tyEdfTO05hPZU5/D+kXktCx+bMPF+DKX7n
	USC3Ryh2euZbtrrMSji/PgxL5EP1Ap60PdB0g=
MIME-Version: 1.0
Received: by 10.216.137.97 with SMTP id x75mr2266591wei.25.1330611311945; Thu,
	01 Mar 2012 06:15:11 -0800 (PST)
Received: by 10.223.104.8 with HTTP; Thu, 1 Mar 2012 06:15:11 -0800 (PST)
In-Reply-To: <BFD998F2-6D5D-4E7D-8006-C133F0DF9C98@dominion.thruhere.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<CAGiJk9cJa7MoHjpTGB0xVbOrcHS=m95PShuHheKaoAYhGrcRdQ@mail.gmail.com>
	<BFD998F2-6D5D-4E7D-8006-C133F0DF9C98@dominion.thruhere.net>
Date: Thu, 1 Mar 2012 15:15:11 +0100
Message-ID: <CAGiJk9fNChJRLzHTLptShp+duFZy+o2bf_Enz6_kv_v-httwxg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 14:23:41 -0000
Content-Type: text/plain; charset=UTF-8

2012/3/1 Koen Kooi <koen@dominion.thruhere.net>:
>> * The user has to install kdelibsX-dev (X is either version 4 or 5)
>> since KDE (like Koen already stated) needs to execute KDE/Qt programs
>> that depend on the whole KDE stack again in a native flavor.
>
> Can we just build them natively and put them in the host sysroot?


Short answer: Yes but not with Qt-native from OE. Long answer:
For automoc4 this is no problem and meta-kde also got the recipe.

For the packages kconfig_compiler (needs libkdecore) and
makekdewidgets (needs libkdecore and libkdeui) it might work, as long
as the programs got their libraries.
Since building kdelibs native in OpenEmbedded would need a "full
featured" Qt-native and the other dependencies it would cause a lot
overhead.
Building libkdecore and kconfig_compiler alone works, but libkdeui
pulls "everything" else in.


The paths where KDE looks for the executables can be altered at the
kde4.inc file (see [1] )

>>
>>
>>
>> About the current status:
>> The main dependency kdelibs builds but in do_package there is a
>> ominous QA error:
>> ERROR: QA Issue: kdelibs4 rdepends on kdelibs4-dev
>> Since this error message is important, it will not help (me) much to
>> resolve the error.
>> In other words is there any way to debug this?
>
> No testlab in oe-core, but buildhistory pretty much does the same: http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again

Thanks, I will look into that.

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

[1] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/ea8f4cbc56b985708c33230a981ae9169e7fb156/recipes/kde4.inc#line67

-- 
Regards
Samuel


