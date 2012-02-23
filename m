Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0Nio-0000Rz-MN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 02:43:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F0FCA31592EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:35:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id N49VQBn5ufd3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:35:16 +0100 (CET)
Received: from [172.22.22.61] (drms-590edffa.pool.mediaWays.net
	[89.14.223.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 5218C31592E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:35:16 +0100 (CET)
Message-ID: <4F4597D2.1020809@opendreambox.org>
Date: Thu, 23 Feb 2012 02:35:14 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329917474.20261.142.camel@ted> <4F450191.20609@opendreambox.org>
	<1329945895.32110.21.camel@ted>
In-Reply-To: <1329945895.32110.21.camel@ted>
Subject: Re: [RFC][PATCH 0/5] drop dependency on GNOME if x11 is disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 01:43:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 22.02.2012 22:24, Richard Purdie wrote:
> On Wed, 2012-02-22 at 15:54 +0100, Andreas Oberritter wrote:
>> On 22.02.2012 14:31, Richard Purdie wrote:
>>> On Wed, 2012-02-22 at 12:26 +0100, Andreas Oberritter wrote:
>>>>  It also disables
>>>> some preinst and postrm hooks, but they don't really hurt on existing
>>>> images.
>>>
>>> I'd suggest for these we modify them to only run if the appropriate
>>> executables are present. If not present, then it won't hurt anything.
>>
>> OK. The small downside is that those hooks can't run at rootfs creation
>> time. Is there a "best practice" to check the existence of an executable
>> in $PATH from such a hook?
> 
> "which xxx"?

Thanks! That was probably too obvious. ;-)

>>>>  I suppose there aren't many images using GNOME packages
>>>> without x11. Any opinions?
>>>>
>>>> Is it OK to use the 'x11' flag for this purpose? Is anybody using
>>>> GNOME with a different backend? Would it be better to introduce
>>>> a 'gnome' (and 'gconf'?) distro feature flag?
>>>
>>> I looked at these patches and my conclusion was no, the x11 flag is not
>>> appropriate in this context.
>>>
>>> Why? It would break gtk+ compiled against directfb for example. In the
>>> future we'll likely have a similar issue if gtk+ is compiled against
>>> something like wayland.
>>
>> Gtk+ on directfb still built fine with these patches. Does it need
>> hicolor-icon-theme to run? In this case, RDEPENDS should be added to
>> gtk+, I guess. I don't see anything else possibly causing breakage.
> 
> I was thinking gtk+ would use the gnome classes too which upon
> inspection it does not.
> 
>> Nevertheless, I understand that 'x11' isn't appropriate. The upside of
>> using 'x11' was that it wouldn't break distributions, like new flags
>> would do.
> 
> Paul has a patch out to help with this problem.

Yes. I've seen the patch and I'd be happy to use it in case it's
eventually going to be merged.

>>> I also don't like "gnome" since you are using some gnome packages.
>>> Specifically, you seem to want to avoid gtk and gconf. So all things
>>> considered this needs a bit more discussion...
>>
>> Actually, I don't really need gtk+ either, but I'd still like to make it
>> available to our customers on the online feed.
>>
>> To be more specific, I'd like to disable GNOME infrastructure, not
>> necessarily all GNOME libraries. In other words, I'd like to keep those
>> libs that, though being hosted on gnome.org as part of the GNOME
>> project, don't depend on other GNOME (UI) libraries etc.). For example,
>> I'd like to use gstreamer, which depends on libsoup and librsvg, without
>> introducing unnecessary dependencies on gconf, gconf-native,
>> gnome-common, hicolor-icon-theme and libgnome-keyring and all of their
>> own dependencies.
>>
>> So how about 'gconf' and 'gnome-ui' as new distro features? Actually I
>> proposed 'gnome', because all modified bbclasses get inherited by
>> gnome.bbclass.
> 
> What is really worrying me here is this is very specific to your
> projects usecase.

Maybe. I'd be interested in other people's opinions, especially of those
who don't use x11 et al.

> There will be others who'd expect gtk+ to be excluded
> from "gnome-ui" for example. This is just the simplest case I can find
> but there are other issues and we need generic code for oe-core.

I don't think so. Gtk+ has never had any dependency on GNOME. The latter
is built upon Gtk+, just like KDE builds upon Qt. Nobody would expect Qt
to be excluded from builds if a 'kde' flag existed and was disabled.

Regarding the two individual recipes I've removed dependencies from:
- libproxy: When building without gconf, -DWITH_GNOME=no has to be set.
- libsoup: When building without libgnome-keyring, --without-gnome has
to be set.
So the nomenclature would be easy for these two recipes.

As a user of OE, I see recipes inheriting gnome and gnomebase, so I'd
imagine a possible 'gnome' flag would have an effect on those recipes.

I think we have very different opinions about what GNOME is. I'd say
that hosting on GNOME's FTP server doesn't make a package a GNOME
package (e.g. gtk+, which seems to have moved to gnome.org not very long
ago. another example would be xchat vs. xchat-gnome, both of which are
hosted on gnome.org). Libxml2 is hosted on gnome.org, too, but nobody
would expect it to become unavailable if 'gnome' wasn't enabled.

What I'd expect to become disabled are GNOME executables, e.g.
gnome-panel, gnome-applets, gnome-terminal, gconfd,
gnome-keyring-daemon, etc and everything else having gnome in its name.
What would be left are libraries not having gnome in their name (because
they're generic and used by many non-GNOME-projects) which don't require
any running GNOME daemons.

I just saw that Gentoo also has a 'gnome' use flag (as well as 'X' and
'gtk'). Maybe we should look how they handle it.

> I'm starting to wonder if these shouldn't be PACKAGECONFIG options for
> the individual packages which you as a distro would then override the
> defaults for.
> 
> You could also put some of these exclusions in your distro config. You
> can check for recipes which inherit gnomebase
> (bb.data.inherits("gnomebase", d)) and then run your skip package there
> if the PN list doesn't match.

Both are options I'll consider. However, I don't think that gconf, for
example, should be enabled or disabled on a per-recipe basis.

Besides that, it's quite ugly to use oe_filter_out() etc. to remove
dependencies (e.g. on gnome-common through gnomebase). I wonder whether
there's a better way to do that.

> The main problem is I can't come up with a good flag that describes the
> package set you want to exlcude, it really is rather custom to what
> you're doing.

With OE-classic, a lot of manual patching was needed to get rid of
unwanted UI dependencies. The 'x11' flag of OE-core is definitively a
step into the right direction. But if 'x11' doesn't cover all packages
that require x11 (*), I think we should rather introduce some more
flags, instead of adding local hacks in distro.conf.

Regards,
Andreas

*) I couldn't find any report of successful use of GNOME without an
Xserver. Gtk+ even dropped DirectFB support (which wasn't enough to run
GNOME) before 3.0. So 'x11' might very well suffice, at least until
Wayland stops being a theory for OE. It would be easy to replace some
occurences of 'x11' at a later stage, after Paul's patch has been
merged, of course.


