Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 505 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Feb 2015 10:32:26 UTC
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id 91ED97066B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:32:26 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id B503D1843669;
	Wed, 11 Feb 2015 11:24:01 +0100 (CET)
Message-ID: <54DB2D2C.3010404@herbrechtsmeier.net>
Date: Wed, 11 Feb 2015 11:21:32 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Matt Madison <matt@madison.systems>, 
	openembedded-core@lists.openembedded.org
References: <CAGgRHJpOuqFFie9tycFK+7N5nj_GjfP3oGTAAyZoy+i3tpAfvA@mail.gmail.com>
In-Reply-To: <CAGgRHJpOuqFFie9tycFK+7N5nj_GjfP3oGTAAyZoy+i3tpAfvA@mail.gmail.com>
Subject: Re: cmake.bbclass questions
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
X-List-Received-Date: Wed, 11 Feb 2015 10:32:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.02.2015 um 23:53 schrieb Matt Madison:
> I just finished some recipes for some CMake-built packages (from the 
> Kurento project).  I managed to get everything building, but I had to 
> modify how cmake.bbclass does things, and I'm wondering if there's a 
> better way to solve some of these.
>
> Each of the packages generates a pkg-config file and a CMake module 
> that are then used by other packages (later in the build) to locate 
> their dependencies.  I see that cmake.bbclass hard-codes the 
> CMAKE_MODULE_PATH setting to point to just the location in the native 
> sysroot, but target packages can't install their CMake modules there.  
> I tweaked the definition so that when building non-native packages, 
> CMAKE_MODULE_PATH points into both the target sysroot and the native 
> sysroot.  This seemed to do the trick, but wasn't sure it was the 
> correct way to solve this.
Instead of a CMake module the project should install a 
<Name>Config.cmake in its data directory and append a private module 
directory to the CMAKE_MODULE_PATH.

> The generated pkg-config files were a bit trickier - the CMakefiles 
> that generate them assume that the CMAKE_INSTALL_xxxDIR variables are 
> always relative paths, but cmake.bbclass passes in absolute paths -- 
> which, by my read of the CMake docs, is allowed.  I think in this case 
> the Kurento CMakefiles need fixing, but there were a lot of them, so 
> it was simpler to change cmake.bbclass to strip the prefix off the 
> front of those variable settings.
CMake supports relative and absolute paths for the CMAKE_INSTALL_xxxDIR 
variables but the default are relative paths.

The CMake files sould be fixed and extract the relative path from the 
full path variable:
file (RELATIVE_PATH CMAKE_INSTALL_RELATIVE_LIBDIR 
"${CMAKE_INSTALL_PREFIX}" "${CMAKE_INSTALL_FULL_LIBDIR}")

Regards,
   Stefan


