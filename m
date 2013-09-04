Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-09.prod.phx3.secureserver.net
	(p3plsmtpa08-09.prod.phx3.secureserver.net [173.201.193.110])
	by mail.openembedded.org (Postfix) with ESMTP id E07E86BD8B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 11:20:10 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-09.prod.phx3.secureserver.net with 
	id LzLB1m00F1mTNtu01zLBbD; Wed, 04 Sep 2013 04:20:12 -0700
Message-ID: <5227176D.2050105@pabigot.com>
Date: Wed, 04 Sep 2013 06:20:13 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <521CF70C.2050100@pabigot.com> <2056053.nfWMgOXbJx@helios>
	<5221ABED.6060705@pabigot.com> <1522300.pfxjxHF61P@helios>
In-Reply-To: <1522300.pfxjxHF61P@helios>
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
X-List-Received-Date: Wed, 04 Sep 2013 11:20:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2013 05:56 AM, Paul Eggleton wrote:
> Hi Peter,
>   
> On Saturday 31 August 2013 03:40:13 Peter A. Bigot wrote:
>> On 08/30/2013 08:37 AM, Paul Eggleton wrote:
>>> On Tuesday 27 August 2013 13:59:24 Peter A. Bigot wrote:
>>>> Since "bitbake qt4-x11-free" failed for me until I did "bitbake gtk+",
>>>> qt4-x11-free needs some sort of dependency on gtk+ to avoid the failure
>>>> below.  I'm guessing it's something like the following added to
>>>> qt4-x11-free.inc:
>>>>
>>>> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '',
>>>> d)}"
>>>> PACKAGECONFIG[gtk] = "-gtkstyle,-no-gtkstyle,gtk+"
>>>>
>>>> but since it takes about an hour to build qt4-x11-free on my system I'm
>>>> hoping somebody can tell me whether that's the right approach.
>>> This seems reasonable to me. I can't actually reproduce the failure, but I
>>> can see how the dependency comes in and it does look to be on by default.
>> What actually happens is qt4 assumes -gtkstyle, but disables it if gtk+
>> (not gtk+3) can't be located in sysroots by invoking pkgconfig.
>>
>> qt4-x11-free already depends on x11 so looking for x11 in
>> DISTRO_FEATURES will always succeed.
> Right, that check alone wouldn't solve anything.
>   
>> Further, PACKAGECONFIG doesn't work because the recipe uses qmake and I
>> can't see where changes to EXTRA_OECONF are ever applied.
> Indeed, I had missed that - that's because we haven't yet used PACKAGECONFIG
> in conjunction with Qt (mainly because a lot of the Qt configure options
> effectively have more than two states which PACKAGECONFIG can't handle) and Qt
> doesn't use autotools so it doesn't already use EXTRA_OECONF.
>
>> So unless there's a way to do something like PACKAGECONFIG that isn't
>> PACKAGECONFIG, the options I see are either add -gtkstyle to
>> QT_X11_FLAGS and gtk+ to DEPENDS, or leave DEPENDS alone and add
>> -no-gtkstyle to QT_X11_FLAGS. I don't knowingly use qt4 so don't know
>> whether the GTK theme is important, but I'm inclined to the former path
>> (unconditionally enable gtk+).
>>
>> Any better way to solve this?
> We could add ${EXTRA_OECONF} to the configure command line and then the
> previously suggested PACKAGECONFIG will work. I'm tempted to suggest this
> should be off by default as well since most users of Qt in our environment will
> neither want nor expect it to depend on GTK+; having QGtkStyle enabled is (I
> would think) peripheral to most embedded use cases.

I actually tried that and the build blew up; I think some sort of 
machine-specific options got inherited and placed where they weren't 
expected (Qt's configure is not autoconf configure), but didn't bother 
looking closely.

Any solution other than forcing either -gtkstyle or -no-gtkstyle is more 
intrusive than I want to take on, especially for a recipe I don't 
personally rely on and at this stage of the development cycle.  Since I 
can't tell what the right choice is and turning it off may break the 
observed existing behavior in many cases, I've opened bug 5116 for 
somebody more qualified to handle.

Peter

>
> Cheers,
> Paul
>


