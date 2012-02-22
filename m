Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0DiJ-0004Gx-Ja
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:02:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A288A315926E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 15:54:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Lyi7zsW16vAx
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 15:54:10 +0100 (CET)
Received: from [172.22.22.61] (drms-590edffa.pool.mediaWays.net
	[89.14.223.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id B8059315924C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 15:54:10 +0100 (CET)
Message-ID: <4F450191.20609@opendreambox.org>
Date: Wed, 22 Feb 2012 15:54:09 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329917474.20261.142.camel@ted>
In-Reply-To: <1329917474.20261.142.camel@ted>
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
X-List-Received-Date: Wed, 22 Feb 2012 15:02:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 22.02.2012 14:31, Richard Purdie wrote:
> On Wed, 2012-02-22 at 12:26 +0100, Andreas Oberritter wrote:
>> I'd like to stop various GNOME packages from being built in a
>> distro which doesn't use x11. For me, this fixes many unwanted
>> dependencies, e.g. librsvg -> gconf -> polkit -> systemd -> udev-systemd
>> on a system with an old kernel (2.6.18), which cannot use a recent
>> udev. Of course, it saves some build time, too.
> 
> That dependency doesn't exist in OE-Core FWIW.

Yes, this is caused by meta-oe.

>> I guess, additional PR bumps for all users of gconf, gnomebase and
>> gtk-icon-cache bbclasses are required in order to pick up this change,
>> right?
> 
> This is one of the few cases I'm tempted to say no, its not required.
> 
>>  Does someone already have a script to automatically generate
>> a list of affected recipes? Is the PR bump required, considering that
>> this change mainly reduces build-time dependencies?
> 
> The plan is to rely on sstate's hash changes and the OEBasicHash
> signature generator for this in future.
> 
>>  It also disables
>> some preinst and postrm hooks, but they don't really hurt on existing
>> images.
> 
> I'd suggest for these we modify them to only run if the appropriate
> executables are present. If not present, then it won't hurt anything.

OK. The small downside is that those hooks can't run at rootfs creation
time. Is there a "best practice" to check the existence of an executable
in $PATH from such a hook?

>>  I suppose there aren't many images using GNOME packages
>> without x11. Any opinions?
>>
>> Is it OK to use the 'x11' flag for this purpose? Is anybody using
>> GNOME with a different backend? Would it be better to introduce
>> a 'gnome' (and 'gconf'?) distro feature flag?
> 
> I looked at these patches and my conclusion was no, the x11 flag is not
> appropriate in this context.
> 
> Why? It would break gtk+ compiled against directfb for example. In the
> future we'll likely have a similar issue if gtk+ is compiled against
> something like wayland.

Gtk+ on directfb still built fine with these patches. Does it need
hicolor-icon-theme to run? In this case, RDEPENDS should be added to
gtk+, I guess. I don't see anything else possibly causing breakage.

Nevertheless, I understand that 'x11' isn't appropriate. The upside of
using 'x11' was that it wouldn't break distributions, like new flags
would do.

> I also don't like "gnome" since you are using some gnome packages.
> Specifically, you seem to want to avoid gtk and gconf. So all things
> considered this needs a bit more discussion...

Actually, I don't really need gtk+ either, but I'd still like to make it
available to our customers on the online feed.

To be more specific, I'd like to disable GNOME infrastructure, not
necessarily all GNOME libraries. In other words, I'd like to keep those
libs that, though being hosted on gnome.org as part of the GNOME
project, don't depend on other GNOME (UI) libraries etc.). For example,
I'd like to use gstreamer, which depends on libsoup and librsvg, without
introducing unnecessary dependencies on gconf, gconf-native,
gnome-common, hicolor-icon-theme and libgnome-keyring and all of their
own dependencies.

So how about 'gconf' and 'gnome-ui' as new distro features? Actually I
proposed 'gnome', because all modified bbclasses get inherited by
gnome.bbclass.

Regards,
Andreas


