Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id DA73B732A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 13:14:36 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 9DED9184044A;
	Wed, 11 Feb 2015 14:14:36 +0100 (CET)
Message-ID: <54DB5528.9000407@herbrechtsmeier.net>
Date: Wed, 11 Feb 2015 14:12:08 +0100
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Matt Madison <matt@madison.systems>
References: <CAGgRHJpOuqFFie9tycFK+7N5nj_GjfP3oGTAAyZoy+i3tpAfvA@mail.gmail.com>	
	<54DB2D2C.3010404@herbrechtsmeier.net>
	<1423657981.6238.8.camel@workhorse.madison.systems>
In-Reply-To: <1423657981.6238.8.camel@workhorse.madison.systems>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 11 Feb 2015 13:14:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.02.2015 um 13:33 schrieb Matt Madison:
> On Wed, 2015-02-11 at 11:21 +0100, Stefan Herbrechtsmeier wrote:
>> Am 10.02.2015 um 23:53 schrieb Matt Madison:
>>> I just finished some recipes for some CMake-built packages (from the
>>> Kurento project).  I managed to get everything building, but I had to
>>> modify how cmake.bbclass does things, and I'm wondering if there's a
>>> better way to solve some of these.
>>>
>>> Each of the packages generates a pkg-config file and a CMake module
>>> that are then used by other packages (later in the build) to locate
>>> their dependencies.  I see that cmake.bbclass hard-codes the
>>> CMAKE_MODULE_PATH setting to point to just the location in the native
>>> sysroot, but target packages can't install their CMake modules there.
>>> I tweaked the definition so that when building non-native packages,
>>> CMAKE_MODULE_PATH points into both the target sysroot and the native
>>> sysroot.  This seemed to do the trick, but wasn't sure it was the
>>> correct way to solve this.
>> Instead of a CMake module the project should install a
>> <Name>Config.cmake in its data directory and append a private module
>> directory to the CMAKE_MODULE_PATH.
> Ah, OK. Is that the typical pattern for CMake-based packages?
Typically a find module is needed when the upstream is not built with CMake.

http://www.cmake.org/cmake/help/git-master/manual/cmake-packages.7.html#find-module-packages
http://www.cmake.org/cmake/help/git-master/manual/cmake-packages.7.html#creating-packages

The pattern avoids the installation of files into the data directory of 
a foreign project.

Regards,
   Stefan


