Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
	(p3plsmtpa09-09.prod.phx3.secureserver.net [173.201.193.238])
	by mail.openembedded.org (Postfix) with ESMTP id DFF2A6BD9E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 08:40:13 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-09.prod.phx3.secureserver.net with 
	id KLgD1m00D1mTNtu01LgDGp; Sat, 31 Aug 2013 01:40:14 -0700
Message-ID: <5221ABED.6060705@pabigot.com>
Date: Sat, 31 Aug 2013 03:40:13 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <521CF70C.2050100@pabigot.com> <2056053.nfWMgOXbJx@helios>
In-Reply-To: <2056053.nfWMgOXbJx@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-x11-free dependence on gtk+
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
X-List-Received-Date: Sat, 31 Aug 2013 08:40:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2013 08:37 AM, Paul Eggleton wrote:
> Hi Peter,
>
> On Tuesday 27 August 2013 13:59:24 Peter A. Bigot wrote:
>> Since "bitbake qt4-x11-free" failed for me until I did "bitbake gtk+",
>> qt4-x11-free needs some sort of dependency on gtk+ to avoid the failure
>> below.  I'm guessing it's something like the following added to
>> qt4-x11-free.inc:
>>
>> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '',
>> d)}"
>> PACKAGECONFIG[gtk] = "-gtkstyle,-no-gtkstyle,gtk+"
>>
>> but since it takes about an hour to build qt4-x11-free on my system I'm
>> hoping somebody can tell me whether that's the right approach.
> This seems reasonable to me. I can't actually reproduce the failure, but I can
> see how the dependency comes in and it does look to be on by default.

What actually happens is qt4 assumes -gtkstyle, but disables it if gtk+ 
(not gtk+3) can't be located in sysroots by invoking pkgconfig.

qt4-x11-free already depends on x11 so looking for x11 in 
DISTRO_FEATURES will always succeed.

Further, PACKAGECONFIG doesn't work because the recipe uses qmake and I 
can't see where changes to EXTRA_OECONF are ever applied.

So unless there's a way to do something like PACKAGECONFIG that isn't 
PACKAGECONFIG, the options I see are either add -gtkstyle to 
QT_X11_FLAGS and gtk+ to DEPENDS, or leave DEPENDS alone and add 
-no-gtkstyle to QT_X11_FLAGS. I don't knowingly use qt4 so don't know 
whether the GTK theme is important, but I'm inclined to the former path 
(unconditionally enable gtk+).

Any better way to solve this?

Peter

> Looking at bitbake -g output (for master at least) it seems like gtk+3 will
> always be built by default when building qt4-x11-free because pulseaudio
> depends upon it, so that explains how this problem doesn't often come up. Of
> course if gtk+3 is rebuilding when qt4-x11-free is in do_compile, or you've
> disabled pulseaudio, then this issue will occur so we do need to do something
> such as the above. I think the PACKAGECONFIG option for this should be called
> "gtkstyle" rather than just "gtk" to give a better idea of what it's enabling
> though. Would you please send an actual patch to add this?
>
> Thanks,
> Paul
>


