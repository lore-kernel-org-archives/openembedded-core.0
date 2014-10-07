Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C75D65E0C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 16:21:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s97GL7mB015704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 09:21:07 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 7 Oct 2014 09:21:06 -0700
Message-ID: <543412F2.3050603@windriver.com>
Date: Tue, 7 Oct 2014 11:21:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
In-Reply-To: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
Subject: Re: Multiple issues building from dizzy or master
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
X-List-Received-Date: Tue, 07 Oct 2014 16:21:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/14, 10:24 AM, Lauren Post wrote:
> We've been trying for a few weeks to move all our builds to master (yesterday dizzy for poky which is the same) and been having random strange problems on multiple jenkins machines we do our daily builds on.  I talked to Otavio about it but wonder if we are missing something.    I'd appreciate any ideas.   We can build our kernel and uboot fine but when we try to build a more complex image with qt5 we have not succeeded any build since yesterday.
>
> As of today we are now getting errors in db compilation
> On both locally and on Jenkins we keep getting a db compile error as of today.
> ./db_cxx.h:59:22: fatal error: iostream.h: No such file or directory
>   #include <iostream.h>
>                        ^
> ---------------------------------------------------------------------
> For last week we've been battling random gcc_runtime configure errors only on Jenkins machines.
>
> This is the configure error.
> checking dynamic linker characteristics... configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.

I hit this issue w/ Aarch64 builds, and the issue was that gcc linker definition 
did not match the installed library path definition.

In the aarch64 case, the ld.so lives in '/lib', and everything else in the 'oe 
libdir' (which if set to 'lib64') was causing issue.  I finally fixed it in my 
local build by symlinking ld.so into both places.

(I realize this isn't likely on the same architecture, but I suspect the same 
issue is possible here.  Basically the compiler and glibc are not synchronized 
and are looking in different locations for their components.)

> -------------------------------------------------------------------------------------------------------
> As of yesterday morning, we are also having many unpack errors on many files
> that are disappearing from our downloads before unpack. The fetch is working but
> then when it unpacks the package has disappeared from downloads. I've seen this
> on multiple components (libx11, xproto, inputproto, util-linux). Seems to happen
> more often with rm_work set but I've seen it without it set.

I don't use rm_work myself.  But a few of my coworkers do.  The only place 
they've hit an issue is on a specific CentOS based machine.  We've not been able 
to track it down, but rm_work appeared to run BEFORE the final staging...

> I'd appreciate any ideas. The only one I can reproduce locally is the db
> error  above but the others seem to only happen on Jenkins machines. We have 4
> different Jenkins machines all of which can't build on the master branch but
> have built fine for months on daisy and dora branches.

There was a recent bug found that affect systems with 64-bit inodes.  Check if 
you have that, you may need a 'pseudo' update... back porting from master should 
be fine for older versions.  (Master was updated yesterday?)

> By the way you can't set your gcc to 4.8.2 - liburcu breaks if you try to
> use  the older compiler. So not sure if any of the gcc runtime issues are related to
> the new gcc version. Not sure if we should keep gcc 4.8.2 in dizzy if it can't
> be used.
>
> Thanks for any ideas.  I've tried everything I can think of.
>
> Lauren Post
> i.MX Freescale
>


