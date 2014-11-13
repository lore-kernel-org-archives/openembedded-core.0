Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-07.prod.phx3.secureserver.net
	(p3plsmtpa08-07.prod.phx3.secureserver.net [173.201.193.108])
	by mail.openembedded.org (Postfix) with ESMTP id 31A1565C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 13:23:43 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-07.prod.phx3.secureserver.net with 
	id F1Pd1p0010BVjqb011Pg6j; Thu, 13 Nov 2014 06:23:42 -0700
Message-ID: <5464B0D8.3070807@pabigot.com>
Date: Thu, 13 Nov 2014 07:23:36 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1415647839.git.pab@pabigot.com>		
	<4df30acac92f854aa92f221c7663c952da8d9f1f.1415647839.git.pab@pabigot.com>	
	<1415790370.2820.45.camel@linuxfoundation.org>	
	<54636528.6060403@pabigot.com>
	<1415873194.2820.60.camel@linuxfoundation.org>
In-Reply-To: <1415873194.2820.60.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 07/14] qt-mobility: switch to virtual/bluez
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
X-List-Received-Date: Thu, 13 Nov 2014 13:23:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2014 04:06 AM, Richard Purdie wrote:
> On Wed, 2014-11-12 at 07:48 -0600, Peter A. Bigot wrote:
>> You raise some good questions.  I'll come back to whether the name for
>> "whatever provides build-time support for bluetooth" should be spelled
>> "virtual/bluez" or something else.
> Naming is probably the least of the worries here. I will say that
> virtual/* has a very specific meaning in DEPENDS space though.

So let me step back and explain what I'm doing.

I don't use *any* of these packages with bluetooth (as I think I stated 
originally).  I need bluez5 on the system because that's the only 
solution that has an evolving BT-LE with GATT API that I can use for 
custom applications.  bluez4 is useless to me.

Because bluez5 and bluez4 cannot be co-resident, I can't use bluez5 
unless I can tell everything that hard-codes a dependency on bluez4 to 
suck it up and try bluez5 instead, or de-couple them from bluez entirely.

I could decouple by explicitly excluding some recipes and overriding 
default PACKAGECONFIG settings for others in local.conf, but that 
doesn't provide a solution anybody else can leverage.  Yocto 5031's been 
open for way too long.  I believe we all agree this needs to be fixed.


>
>> I think using bluez5 (bluetooth5) and bluez4 (bluetooth) as distinct
>> PACKAGECONFIG options would be a mistake, because it propagates the
>> assumption that "bluetooth" in Linux is a multivalent concept. Bluetooth
>> in Linux is bluez.  Bluez is bluez5.  Work stopped on bluez4 over two
>> years ago, and nobody's come up with third alternative.  IMO, the
>> packageconfig option should be "bluetooth", not "bluez*".  I did see
>> what Chris Larson wrote in
>> http://lists.openembedded.org/pipermail/openembedded-core/2014-March/091008.html
>> but I just don't see the value in adding extra infrastructure for a
>> bunch of options that either don't exist now or won't exist in the near
>> future.
> This kind of misses the problem though. Personally, I'd love to just
> switch to bluez5 and be done with it. Our userbase expects something
> with a little more thought though, there are people who will be
> transitioning at different times and we can't really force them into a
> flag day.

I don't like the "flag day" idea either, so I think there should be a 
way for whoever's putting together a system to select between bluez4 and 
bluez5 as the provider of bluetooth capability.  It should also be a 
single point of variation that informs the rest of the system.  I 
actually prefer your DISTRO_FEATURES solution over the 
PREFERRED_PROVIDER I used because whether a distro chooses to be based 
on bluez4 or bluez5 seems comparable to whether they choose to be based 
on systemd or sysvinit.

> The issue is that if we just have a single "blue*" option, you basically
> have no idea what you're going to get out of the build, it fails on the
> determinism tests. You say qt5 may or may not work with 4, I suspect
> there are several packages with this issue. My concern is that as we
> update software, we basically have no idea what we're enabling or
> disabling. This is exactly the kind of thing PACKAGECONFIG is meant to
> spell out though.
>
> This is why I suggested a 4 and 5 PACKAGECONFIG option since it then
> clearly states what its building.

There are two problems with doing it at the PACKAGECONFIG level with 
distinct bluez4 and bluez5 options.  First, how does the distro provide 
a mechanism for selecting between bluez4 and bluez5 being set in 
PACKAGECONFIG_foo for all the recipes in all layers that are affected by 
the distro-level decision?  I can't see any solution that doesn't 
involve a well-defined conditional expression used in the recipe or in 
the layer.conf, whether it's testing the value of 
PREFERRED_PROVIDER_virtual/bluez or the presence of a specific key in 
DISTRO_FEATURES.

Once you go there, you get the second problem.  Only one of the sixteen 
packages distinguishes bluez4 from bluez5 in a meaningful way during 
configuration.  For the others, you just ask for bluetooth.  
Deterministically selecting either bluez4 or bluez5 to be present via 
DEPENDS doesn't change whether it'll work with your selection, it just 
makes it explicit which one you're using---though it's not explicit if 
the choice is controlled by an externally-customizable variable like 
PACKAGECONFIG.

Each recipe will work completely with both bluez4 and bluez5, or will 
work at build time but fail at runtime with one or both, or will fail at 
build time with one or both.  From my experience I expect most bluez4 
packages fall into the "bluez5 builds fine but maybe doesn't work".  
There's simply no way to detect that without actually using the package 
in a context where bluetooth is tested, which may require specific 
hardware like headsets.

> FWIW I do agree bluez4 is a dead end so calling the options "bluez4" and
> "bluez" (for v5) would be ideal. We have some issues with legacy
> namespace though and I'm not sure how we handle that.
>
>> Of the roughly 16 recipes I had to touch, only one (pulseaudio) clearly
>> distinguishes between bluez4 and bluez5 when being configured, and I
>> suspect that's just to simplify transition.  The others either figure
>> out which version they were given and use it, or will only work with one
>> or the other.  They all at least build with virtual/bluez, though they
>> might internally disable bluetooth support or fail at runtime if bluez5
>> is what's available.  (Qt 5.4 will support bluez5; it's unclear to me
>> whether it still supports bluez4.)
>>
>> There are and will continue to be certain recipes that will never move
>> beyond bluez4, because they're no longer maintained or nobody has found
>> it worthwhile (obex stuff) or a priority (headset stuff) to re-implement
>> the functionality they depend on under the new API. So we do need to
>> support using bluez4 and bluez5 as alternatives. But most recipes don't
>> seem to care who provides "bluetooth", and if it's currently bluez4 and
>> the package is maintained it'll eventually become bluez5.  Thus
>> "virtual/bluez".  AFAIK the libbluetooth API is unchanged; it's the dbus
>> API that's different.  If consensus is to substitute something like
>> "distro/bluez" instead of "virtual/bluez" to remove the implication it's
>> completely API-equivalent that'd be fine, but I think we do need some
>> name to serve that role without putting the conditional in every recipe
>> that might reference the selected bluetooth solution.
> My reasoning is that if we need to provide specific PACKAGECONFIG for
> determinism, we may as well then depend specifically on the recipe
> namespaces.
>
> "virtual/*" does not map to this usage as Chris mentions. I've been
> around long enough to see what misuse of the provider namespace does and
> I don't want to go there again. Introducing a "distro/bluez" would
> probably just confuse things since its a new convention without well
> defined meaning and we don't have a common case of this to deal with in
> general.
>
>> Using bluez4 and bluez5 in DISTRO_FEATURES makes some sense, as a
>> parallel to systemd vs sysvinit.  (I don't like "bluetooth5" because
>> there's no such thing; since we already have "bluetooth" I'd suggest
>> making "bluez4" the canonical spelling and interpreting "bluetooth" in
>> the absence of "bluez5" as being an alias for "bluez4".)
> That alias support means more anonymous code we can likely never get rid
> of so it makes me nervous. The DISTRO_FEATURES part is actually the part
> I like least about my proposal as it happens, but I'm failing to see a
> good way of presenting this to users in a way which lets them choose the
> time of their upgrade clearly and ensures that builds are deterministic.
>
>>    This provides
>> a way to set the PREFERRED_PROVIDER for "distro/bluez" and possibly to
>> set the PNBLACKLISTs to exclude the recipes that are not appropriate
>> under bluez4.
>>
>> Then we just use "distro/bluez" instead of "virtual/bluez" in all the
>> recipes.
>>
>> Is that any closer to acceptable?
> I remain sceptical I'm afraid, I certainly don't see distro/ as having
> any value over virtual/ :(.

OK.  So how about this:

Eliminate "bluetooth" as a DISTRO_FEATURE and switch to "bluez4", 
"bluez5", or nothing.  Add diagnostics if the system detects a violation 
of this, so existing users are notified of the change. Treat this 
distinction as parallel to systemd vs sysvinit.

For recipes that depend on bluetooth:

1) add one or both of PACKAGECONFIG[bluez4] and PACKAGECONFIG[bluez5] 
settings that explicitly add the dependency on the specific version.  
For the recipes that don't make their needs clear, we could add both or 
just bluez4.  If we do both, most will probably look something like:

PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"

2) If the existing default PACKAGECONFIG for these includes "bluetooth" 
or "bluez", select the appropriate default based on the DISTRO_FEATURE 
setting.  There should be a system-level variable DISTRO_BLUEZ to be "", 
"bluez4", or "bluez5" so each recipe doesn't replicate the really ugly 
oe.utils.contains code to extract the desired substring from 
DISTRO_FEATURES in every recipe.

At this point, we have an OE-Core that allows the user to select which 
system provides bluetooth support, recipes in oe-core and meta-oe that 
build correctly to the best of our knowledge with either one, and a way 
of explicitly selecting the provider on a per-recipe basis.  What we 
don't have is knowledge of whether packages that are now enabled for 
bluez5 actually work with bluez5. But we can't get that knowledge at the 
root of the development community where we're sitting; it's gotta come 
from the users.

Since we're at the very beginning of a new development cycle there will 
be no better time to introduce this level of breakage and tell everybody 
"Hey, test your systems with bluez4 and bluez5 and tell us what doesn't 
work", unless you want to announce it now and do it in 1.9 which I don't 
think would help much.

If we can't make any progress at all on enabling bluez5 out of concern 
for breaking existing bluez4 users who aren't actively engaged there's 
more and more kinds of goodness that's unavailable to our users, and 
more and more packages that will end up supporting only bluez5 so 
wouldn't be upgradable.  This problem is only going to get worse.

Peter


>
> Cheers,
>
> Richard
>


