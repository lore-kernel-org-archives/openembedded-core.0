Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QILjG-00012V-Ku
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:10:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p46E7Hg9028633
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 May 2011 07:07:17 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 May 2011 07:07:16 -0700
Message-ID: <4DC40093.8070701@windriver.com>
Date: Fri, 6 May 2011 09:07:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
In-Reply-To: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 14:10:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/6/11 8:39 AM, Koen Kooi wrote:
> Hi,
> 
> The past few days I have gotten systemd to work in OE.dev and I have some questions on how to do in the oe-core universe. First some background:
> 
> Systemd is a /sbin/init replacement using ideas from apples launchd like socket activation. Startup scripts are replaced by .ini like files:

I really want to start experimenting with systemd inside of oe-core.  Can we use
something like the distro flags we had briefly talked about in the TSC meetings
to control which init system is used?

Also a somewhat related question, does this belong in meta-oe or oe-core...
(This might be a good example in meta-oe of extending items within oe-core,
besides being a good place to experiment and prove out the functionality before
it goes into oe-core.)

...

> Now onto my issues:
> 
> packaging:
> In OE .dev I added FILES_${PN} += "${base_libdir}/systemd" to
> udev, dbus, rsyslog and avahi. This means we end up with both sysV script
> and systemd units. What I would like to have is ${PN}-sysvinit and 
> ${PN}-systemd and the image recipe can choose which init systems gets used.
> Is something like that possible? Are there better ways? Note that systemd
> support sysV initscripts as well, but it needs some care with naming. As I
> understand it, if a unit is found with the same name as a sysV script, only
> the unit will get used. A rootfs postprocess command that deletes /etc/init.d
> won't work, since itwill come back when upgrading the packages.>

This is where I think the distro flags could be useful..

The question is what is the best way to control the initscript files.  Should
they be bundled in with the base FILES_${PN}, and then at build-time it's
selected which type of initscript/configuration is enabled -- or should we add a
runtime requirement of ${PN}-init, and provide two alternative ways of
satisfying this.. one sysvinit and one systemd.. (both with appropriate run-time
dependencies)... of course that leads to rootfs construction issues, how does it
know which to select..  <thinking outloud a bit on this>

> building:
> At the moment systemd enabled software installs the units regardless or 
> config options. What should be do with software that has an option for that?
> And what if we need to patch the units files in? The initsystem is a choice
> at the image level, so artificially limiting it to a distro choice is not a
> good idea.

I think we need to define what the distro flags/choices end up meaning.  And if
we want the policy to be image generation time or distribution build-time.
While it would be possible to build a distro both ways, and determine strategy
at image creation time, the complexities noted above may help make a decision.

> sharing:
> The Arch people have a github with their custom units:
> https://github.com/falconindy/systemd-arch-units/ Do we use those? Do we use
> fedora ones https://bugzilla.redhat.com/show_bug.cgi?id=697698 ? People on
> #systemd are talking about a shared repo on fd.o, but nothing tangible yet.

We've got a few people starting to look into PAM.  I think it's somewhat similar
in that there are different ways things can be patches and configured -- we just
have to find a strategy and determine whats best.  If we don't have a systemd
lead within OE, then the best approach is likely to pick a distro that is close
enough to our needs to be used as a starting point.  (For something like PAM,
that is likely Fedora... while for systemd, Arch might be a good choice.. but I
don't know for sure.)

I'm definitely for re-use, but it'd be nice to have someone to champion this and
help define and describe policies.

> And related to this: how do I get the "installed but not packaged" output
> back? The bitbake logging changes are hiding it now, which is
> counterproductive.

Looks like this may have been a bit too aggressive of filtering.  IMHO this
should be a warning not "info" which is filter out.

--Mark

> 
> So, what are your thoughts on all this?
> 
> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



