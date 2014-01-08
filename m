Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A8C166D1D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 15:17:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08FHF1R015235; Wed, 8 Jan 2014 15:17:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OPS3fRalYUEO; Wed,  8 Jan 2014 15:17:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s08FH8Jq015221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 8 Jan 2014 15:17:10 GMT
Message-ID: <1389194223.6899.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 08 Jan 2014 15:17:03 +0000
In-Reply-To: <52CD692A.80504@topic.nl>
References: <cover.1389186276.git.irina.patru@intel.com>
	<52CD5193.2060702@topic.nl> <52CD5795.8000005@balister.org>
	<52CD692A.80504@topic.nl>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What package installs a C compiler on my target?
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
X-List-Received-Date: Wed, 08 Jan 2014 15:17:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-01-08 at 16:05 +0100, Mike Looijmans wrote:
> ﻿On 01/08/2014 02:50 PM, Philip Balister wrote:
> > On 01/08/2014 08:24 AM, Mike Looijmans wrote:
> >> Probably a silly question that has been asked a thousand times, but my
> >> searches on Google only give me the answer to the wrong question (how to
> >> build FOR the target, which I already know how to do).
> >>
> >> I want to run the C compiler on the board itself. That is, a GCC that
> >> runs on the board and compiles (and links etc.) C code for that board.
> >>
> >> What package(s) do I need to build and install to accomplish this?
> >
> >  From one of my images:
> >
> >
> > IMAGE_FEATURES += "splash ssh-server-openssh tools-sdk \
> > tools-debug debug-tweaks \
> > dev-pkgs dbg-pkgs \
> > "
> > looks like tools-sdk is the one you want. dev- and dbg- packages might
> > also be helpful, but will make the image larger. Especially the debug ones.
> 
> $ bitbake tools-sdk
> ERROR: Nothing PROVIDES 'tools-sdk'
> 
> So I guess it's a package that's provided in another layer (I have oe-core and 
> most of meta-oe).
> 
> So far, the following set I've derived through trial and error seems to come 
> close:
> 
> TARGET_COMPILER_TOOLS = "\
>      binutils \
>      binutils-symlinks \
>      cpp \
>      cpp-symlinks \
>      g++ \
>      g++-symlinks \
>      gcc \
>      gcc-symlinks \
>      make \
>      packagegroup-core-standalone-sdk-target \
> "
> 
> This allows a basic "hello world" to compile on target in C and C++ code. Make 
> wasn't really required, but it's very convenient to have...
> 
> I'm mostly surprised that there wasn't a packagegroup to contain this set.
> 
> It increased the image size to about 130MB, but in this particular case, that 
> won't be a problem.
> 
> Anyway, thanks for the tips all. Guess this list may be useful to others...

Philip was correct in that its an IMAGE_FEATURE, not something you
bitbake. The code in question basically triggers:

core-image.bbclass:PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"

which are indeed similar to your list above and the package groups do
exist...

Cheers,

Richard



