Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2377A78436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 09:15:22 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 126-v6so1540308oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F4ebJRLl12EFP+C+zrqsVFeyjvfRwthBG+hGOmamTnw=;
	b=dviFLXPmoCPDbCW7DAPLr5vN/mGrGpN7j3r2lT/lyIQAHAnwVR0mNUNT0LnEwi74yy
	kthPByM6+ri+1M+dMk9WizU2Yzfq/rchWNqoA95DpL1ZJqUwQkYYETl7iL0L3dT9Lolq
	re2BFjZ+pWjVX4oQwh5BUhwEqI2gIQej7/rE4GRe1WCF+nl5HB7TwfMAs8KszEjBRPIR
	i1vWLO3MSysxJ3HVEwYg26qEjCy344E0BNVzpdbqZc6eZVeJZ2l5MhVsqQal+TF5vqrK
	OdSu1OeFKQrXaXTkzfA8wXauj4Plj2dpk//dBE1DgLO+RqgmPENFtYMNiiua/3m+GZOR
	2d3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F4ebJRLl12EFP+C+zrqsVFeyjvfRwthBG+hGOmamTnw=;
	b=eaz5xpxF7HW9KS8wies9SjVdJJoJjm8EgvOSrU6OzaUCLG5amy+XSGJiUpZoz+kVG8
	ZuKwQeDYuo5E15lAXhw1fnXa0lc2T3+4cZAjfmJqyf8locoBi5eXws7fdrD+/dViNMrM
	eyBBTTw31Fta02rjTs4KskNZj+nOMpzTmBHy4JuqQmS9StJN/yvW7iGJH+Drtuh+GQEC
	E8YgnXvPF0QQSy+0pGQylfb0Q/Q/f6Mnm6CgwtHm6UhgyHVVFTcYET1kQElFMap3U+XG
	VBU7SKQwOn9T/S/23KLTbs8z9ojOFf5PGAaHbJlxR6Wvh7rZavuh+k97oreb4Vl1LP8j
	zUUw==
X-Gm-Message-State: AElRT7E0eZTCmv81D9I0zk7WgpMCd5G+/7xml94HiEn5DupVyQPOoR04
	yvTeMIREOWEqQZyubC/oySaO2l3U1XAfduZ4m/jxkw==
X-Google-Smtp-Source: AIpwx49QbVT0GCVlN8/YHgk4cOg0IfIRAqa08jIx4ntUYQfvtZsd0hRXOiSFQKPVxyz8sdHRoxLj+QFh96fazHaHoyM=
X-Received: by 10.202.27.13 with SMTP id b13mr822111oib.70.1522228524108; Wed,
	28 Mar 2018 02:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 02:15:03 -0700 (PDT)
In-Reply-To: <CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 10:15:03 +0100
Message-ID: <CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Wed, 28 Mar 2018 09:15:23 -0000
Content-Type: text/plain; charset="UTF-8"

On 27 March 2018 at 23:43, Andre McCurdy <armccurdy@gmail.com> wrote:
>> ++      //va_start (ap, number);
>
> Without knowing anything about pseudo, commenting this out looks odd?

It appears that pseudo's wrappers pass a va_list for you.

Then again I know little about pseudo and just hacked until something worked.

With this patch I was getting occasional failures of the pseudo-using
bitbake-worker, so its not quite ready, but Peter is working on a
better form anyway.

Ross

