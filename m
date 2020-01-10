Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 750007FF7A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 11:04:04 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so1520723wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 03:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=R/DbiPQo8twRwH5Tc1gDtp3gSjq0gYeEu+ORc4zwrAg=;
	b=DtvAl81xYjRDOmdUrP0OvqHLT23S487pXMOjPlo0Q9EvNIN2xRsNeH0/IkxjwPTrJn
	maQjqbijvhgISyX0XrIfEL52BogBp/2/ilLU1q/JyyMu8fR07FwFdMbqxX4aU/ihevyM
	WuAUBG6aqwLAfMeuATbAybnLohJ68sldcLN8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=R/DbiPQo8twRwH5Tc1gDtp3gSjq0gYeEu+ORc4zwrAg=;
	b=IxOwByW4V5mwMKKR2fIAhr++gS2RO6/bBLz2wBLBEtK/NgnDdQ+snPMJb1gcZcsvej
	QMmlUGBgL8YD0a6KESf+VmsBdqjj5lRgYRe5Z2NFIpPSaG5QFzwVcXrfDnZp/H0PXkFs
	Xr0JOps39Wdn6R5ozr9hQ3ULYuq8G5CnlV02OUgO7S8FY0PBMOwNqXqOq5YFNnhfCN/x
	8H8CBrtrdsY7fYZiYN/mwW2FVYzLaIFpeHi1R7bqqFSA2PRz+uwWtEhfaLrRTB6MCVXo
	hX32jrGRgBiarryJjfkEZYzwlM8RneLSfyxpGfNHwlBsEtRdO4+lH7zSD2HRtTh9pOqI
	P/EQ==
X-Gm-Message-State: APjAAAWwWOLY79K1fNx0NmS3dskCeO94cUQw7fGI2lMRUnqXrhsjR1m0
	W9cX011Uc3i4fLX5HK1W+0OfEu5nrrk=
X-Google-Smtp-Source: APXvYqwhAE0+Q8yZwPFnwH99AZs3taPSVzPNPcdftYeaDEvFGASEeQ5BPaq73aWyrGj4UCPxOdcoiw==
X-Received: by 2002:a1c:486:: with SMTP id 128mr3671554wme.163.1578654245135; 
	Fri, 10 Jan 2020 03:04:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id v8sm1771069wrw.2.2020.01.10.03.04.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 03:04:04 -0800 (PST)
Message-ID: <4ad81a54707dd53e62d16589a3a4d3b5284bef95.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 11:04:03 +0000
In-Reply-To: <20200108171936.14052-1-ross.burton@intel.com>
References: <20200108171936.14052-1-ross.burton@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] glib: support target/os/libc-specific Meson cross files
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
X-List-Received-Date: Fri, 10 Jan 2020 11:04:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 17:19 +0000, Ross Burton wrote:
> Build systems have a common problem that some tests can only be done
> by
> executing a piece of test code (compared to just compiling or linking
> test
> code).  In a cross-compilation the execution of this code isn't
> possible and the
> Meson solution to this is to allow 'cross properties' to be specified
> in the
> cross files.
> 
> GLib has a number of these, for example determining the direction the
> stack
> grows, whether /proc/self/cmdline exists, or the behaviour of
> snprintf().
> Previously we'd passed values for these to the Glib build for target
> builds, but
> this misses out nativesdk builds (which are also cross-compiled) and
> the fact
> that some of these values are specific to the platform, some are
> specific to the
> host OS, and some are specific to the libc implementation.
> 
> This problem has already been solved for autotools with the siteinfo
> class,
> which turns the target platform/OS/libc variables into filenames
> (such as common
> common-linux common-glibc).  We can look for these in FILESDIR and
> use them as
> cross files.
> 
> Assuming that there are no problems with this appoach it can be moved
> into
> meson.bbclass so that all Meson recipes can use it for their cross
> files.

FWIW this is continuing to cause selftest failures, despite my patch :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/610

Cheers,

Richard


