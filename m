Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7QkG-0008HD-6c
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:27:11 +0100
Received: by mail-ve0-f177.google.com with SMTP id m1so4770794ves.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 05:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=WAiiMvx6u52ogfudocDcCa16EYbWlim57cLdML07IpI=;
	b=o4VLdvLM+OlInOBCxIVsrqDMu287Cbk5CSUn8tEX6BqNF+cOjZIIzMH1VNBiYSLOnS
	s49BanIYi9ecbyhR+Y9ASYtLGezQeYo4sJqPCegYpIKvpCyov7O5wttxudJ8S0svqVlR
	Lu8dl3tyfWgq6faSuQv6fe3tLzdfuwB957+Kwlps5/ug1VFQ3NQl7kO6nrGFu0dLNLrB
	r/Y+AzkwO7d4xXHF/4utFbsF7Gw3CRAs3QD6OeURZ18qDkblFqVaSfTALHiLH3B8Oe8S
	zwo7rBYIO1Rp0rxRjIuZl4cLTpkWuyjnh2Yz+10we+7kTVH4VqS+9qboyLcev/TQ6NAb
	d6uA==
X-Received: by 10.52.24.98 with SMTP id t2mr13410015vdf.69.1361193049023; Mon,
	18 Feb 2013 05:10:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 05:10:27 -0800 (PST)
In-Reply-To: <20130218102402.GA15710@xiaoyu.lan>
References: <20130218102402.GA15710@xiaoyu.lan>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 13:10:27 +0000
Message-ID: <CAJTo0LbOcDd5N6Be=sYrEEJdPoPtX5Cw+tnze=0DAhjp53M7hg@mail.gmail.com>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
X-Gm-Message-State: ALoCoQlN8J4mhlsHQ8C7TT8Ttw/AbzlYNbGsCKmTxEsXP8z+ur6FvRAGQ5f9yhJtyKz0btGscGlQ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: State of systemd from an integrator point of view
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 13:27:17 -0000
Content-Type: text/plain; charset=UTF-8

Hi Holger,

On 18 February 2013 10:24, Holger Hans Peter Freyther
<holger@moiji-mobile.com> wrote:
> this is my second attempt to use systemd with Poky for our sysmoBTS
> product (mostly to replace some respawn shell scripts and not to use
> the daemontools). I aborted the first trial because of journald and
> now that systemd is being merged into OE-Core I started again and I
> would like to share some of my issues.

Great feedback, thanks Holger.

> * systemd as a watchdog. For our BTS I have a init script for the
> watchdog package and a configuration file in our BSP layer. For systemd
> I want the watchdog functionality provided by systemd itself. So I
> have a system.conf in my BSP layer an this line in my machine config:
>
> MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "\
>         ...
>         ${@['watchdog', ''][d.getVar('DISTRO_FEATURES_INITMAN', True) == 'systemd']} \
>         kernel-module-rtfifo "
>
> IMAGE_FSTYPES ?= "tar.bz2 cpio.gz ubifs ubi jffs2"
>
> MACHINE_EXTRA_RDEPENDS = "\
>         ...
>         ${@['watchdog', ''][d.getVar('DISTRO_FEATURES_INITMAN', True) == 'systemd']} \
>         "
>
> this is obviously not a piece of beauty.. and it would be nicer if
> systemd itself could build a watchdog package or such...

The INITMAN variable is injected into DISTRO_FEATURES, so I do find
the more idiomatic base_contains more readable:

${@base_contains("DISTRO_FEATURES", "systemd", "", "watchdog", d)}

systemd could RPROVIDE="watchdog" but as the means to configure it are
different that might not be ideal, and if you ever switched entirely
to systemd with these conditionals it's obvious where your redundant
dependencies are.

Personally, I'd stick with conditional dependencies.

> * systemd and svsv start scripts. I am using the busybox ifplugd to
> configure the network on plug/un-plug of the cable. My start script ended
> with .sh in the name. systemd recognized the script but failed to start
> it. Renaming it to not end with .sh fixed the issue for me. This is more
> like a systemd bug than OE but I wonder if we could change update-rc.d
> bbclass to check the for the .sh in the start script and then complain
> about it?

Oh, interesting.  Without any thinking I can't think of reasons why
that would fail.    Filed #3900.

> * systemd's journald is not suitable for small devices. I think the default
> should be to disable the journald and do not disable the busybox log
> application in the systemd-compat units package. journald is dominated by
> memory allocations and reading procfs over and over again.

Agreed, although it would be good if the journal could be tuned.  IMHO
it's technically great, just young.

I wonder if we can split out the bulk of the journal binaries into a
separate package, so by default it's disabled and then installing
systemd-journal would enable it.

Filed #3901.

Cheers,
Ross


