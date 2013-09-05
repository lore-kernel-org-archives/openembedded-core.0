Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id E7C346C6BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:48:33 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so1178416vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yh0O5dYRvl9Ff1EF+DyyrSCe7nYEfbJQSZJ824OKLA8=;
	b=JDQPRFzLscs6NoOiZPjSMYJBu3B0sP5h9JLZG9zzNBmq3386cqPTTYb/CeZJkv0R8z
	OBij0qz3RVxU4dcqW7qjhk2hjLrSElZkvCI5KytdqJGa7wdkEXmNcUY86xBNf58JF5Oy
	ocR92RsnRgrrd6bZ/vmMBK6HWk2mtx5eLwVEDH4lVPg2puI0ae1yQuZg9BO6tdJLhz0N
	Xk7AAnOLcC6I/gTT4wQE1/+uUWNFAJzw3q4Nln2ZTCUFORtTSN+3BLAnRVbOlpPZOpzR
	ez3O1O4CCWD724L2CmdHEwmghqPIUL5QUm+odZJJCpmQMNGQLwqGzJbEg5gV74daf/j4
	DB3g==
X-Gm-Message-State: ALoCoQlrMCx7F2vBXGwuFrLncybvokpauF2dzVcko3WAJfCE0xuNZnSasJ39tuDer+ZUeslUv2O9
X-Received: by 10.220.11.7 with SMTP id r7mr6036281vcr.12.1378388915302; Thu,
	05 Sep 2013 06:48:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 06:48:15 -0700 (PDT)
In-Reply-To: <1378383839.6940.83.camel@phil-desktop.brightsign>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
	<CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
	<1378383289.32427.63.camel@ted>
	<1378383839.6940.83.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 14:48:15 +0100
Message-ID: <CAJTo0Lap0090_U49tN=aBZ_imJRT0JB0eoAu8e4CTgfouDQHfQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 13:48:34 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 13:23, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2013-09-05 at 13:14 +0100, Richard Purdie wrote:
>> * Figuring out any runtime issues with dlopen is the hardest part and we
>> don't actually have real data on whether there are issues there or not.
>
> Do we have any particular reason to believe that there would be issues
> (and if so, what they might be)?  I guess it should be easy enough to
> gather data if we know what we're looking for.

There won't be any problems with dlopen() because that only looks at
.so files.  Any issues will be at build time, I wouldn't be surprised
if some dependencies changed due to a difference in eg pkgconfig vs
.la linkage.  Then again some other distros blanket-delete .la files
by default so I don't expect any critical problems.

>> * They are used in places, for example the darwin shlibs code currently
>> uses them. It could be updated to use otool these days mind but I'd
>> probably make the current code a fallback for unknown arches since it is
>> guaranteed to work everywhere.
>
> There's no reason in principle that folks on darwin (and/or
> hitherto-undiscovered architectures) couldn't retain the .la files if
> they wanted.  The original patch that I sent used a DISTRO_FEATURE to
> control this and those people building for darwin could simply refrain
> from setting it.  Alternatively we could make it explicitly conditional
> on TARGET_OS or some such if there are reasons to believe that some
> targets do genuinely require this stuff.

I don't think a distro feature is the right approach, but however it's
set can easily be forced using a machine override for Darwin.

Ross

