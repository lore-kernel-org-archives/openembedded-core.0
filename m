Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB216E89C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 17:24:52 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id hl1so2217482igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gnOq2fkDrrCWFq7t/67Sysr/0hCK0vZPWWJM1Mtqilg=;
	b=CYCyXJD4DaBM4Lai20NUMKsTnWQNJltP1qXuwXrfwCexvdWh1XYHfr4YLzg/cQB5vK
	JG1rv7+BBzTyf/Uyr7JsQRIGKyJdr4Oz8RaNaYBXllndQdYrE35lxqFUrEsqK6hGwHHh
	on5W6tSzo4BIKwJhO8ukoxnc1Kukqx/P0qqltpvfhfmEp9/8BEGAk3Wh/TKUMshcFtis
	FRlzWf0KbuO0QI5mJPGAZoa0b6lWfrX0AOB0bOA0W2ndH862zHtryB8R3n7Q1mp7b6t+
	UmH/KUeE7/2VHU8tOdIX9hMmZuYfR2vqiHkbmfU7zBz8xswAMTdpKctV1YbAgZti2Sx8
	CK7g==
X-Received: by 10.43.141.81 with SMTP id jd17mr55423126icc.39.1395768292914;
	Tue, 25 Mar 2014 10:24:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Tue, 25 Mar 2014 10:24:22 -0700 (PDT)
In-Reply-To: <1395744951.24890.25.camel@ted>
References: <1395743836-17276-1-git-send-email-B40290@freescale.com>
	<1395744951.24890.25.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Mar 2014 10:24:22 -0700
Message-ID: <CAMKF1srOdzitgUsHD69DLij2MofhNgOkQ9d04DGH-14iS1Lx5Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: fix search paths for libstdbuf.so
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
X-List-Received-Date: Tue, 25 Mar 2014 17:24:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 25, 2014 at 3:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Khem added this back in 2011:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/meta/recipes-core/coreutils?h=rpurdie/t2&id=eee0b5aadba34130080df8aebc7e8dd57c7d5ccb
>
> Khem: Any idea what this was for?

coreutils changed this back in 8.13 timeframe to appease automake
which stopped accepting pkglib_PROGRAMS
and it was moved to pkglibexec_PROGRAMS list since this library is
special where you do not link to it directly
but preload it to divert stdio buffers coreutils devs did not
classifiy it to be installed in libdir but in libexecdir
instead and if you look stdbuf program which sets up this preloading
is hardwired to look into libexecdir and modifies the preload search
path to include libexecdir in search path, so
if we specify --libexecdir=.. to configure and make sure that this .so
lands in same directory on target then we are ok. did we change global
libexecdir ?

