Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 82EA261B21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:32:26 +0000 (UTC)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
	([174.114.100.179]:42376 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jFFt4-00F5vS-ID; Fri, 20 Mar 2020 07:32:27 -0400
Date: Fri, 20 Mar 2020 07:32:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
In-Reply-To: <CADySD0EMgZoMWYjwcjXv_8AHD3p0nmytd8sgBVdfB8ddq9anJA@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2003200730490.8837@localhost.localdomain>
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
	<CADySD0EMgZoMWYjwcjXv_8AHD3p0nmytd8sgBVdfB8ddq9anJA@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: recipe design curiosity: how to best install a package configuration file?
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
X-List-Received-Date: Fri, 20 Mar 2020 11:32:26 -0000
Content-Type: multipart/mixed; boundary="8323328-513952832-1584703946=:8837"

--8323328-513952832-1584703946=:8837
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 21 Mar 2020, Ankur Tyagi wrote:

> what if sample file is updated in new version? Now you have to
> maintain the copy in your "file/" as well.
>
> If you are using sample file as it is, then keeping a copy is
> probably not a good idea
>
> Cheers
> Ankur

  i actually think that's an argument in my favour ... i would be very
nervous about how upgrading a recipe version would quietly upgrade my
configuration file. i would far prefer to have to manually upgrade my
configuration to keep in step.

rday

>         got into a discussion yesterday about the "cleanest" way to design a
>       .bbappend file to install a package's configuration file, so i'm
>       curious about best practices, and here's an example. (and i'm asking
>       as it looks like this will be an issue for a number of recipes i'm
>       looking at.)
>
>         current recipe for conntrack-tools:
>
>       http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
>
>       note how the recipe install step installs a conntrack.conf.sample
>       file:
>
>       do_install_append() {
>         install -d ${D}/${sysconfdir}/conntrackd
>         install -d ${D}/${sysconfdir}/init.d
>         install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
>         ...
>
>       so far, so good. now, in cases where a sample conf file is provided,
>       there is, of course, no guarantee that it will be applicable out of
>       the box -- one *expects* that it might be necessary to tweak such a
>       file and install it as part of a .bbappend file. and here's the point
>       of contention.
>
>         in this current situation, it turns out that that sample conf file
>       just happens to be appropriate, so the entire .bbappend file for this
>       recipe consists of:
>
>       do_install_append () {
>           install -m 0644  \
>           ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample \
>           ${D}/${sysconfdir}/conntrackd/conntrackd.conf
>       }
>
>         yes, that will work, but i suggested that, even though it's
>       convenient, the problem with that approach is that looking at the
>       .bbappend file doesn't show you the contents of the file that will be
>       installed. to see the actual conf file, you'd have to peruse the
>       source, or check the final result ... you get the idea.
>
>         i suggested that, even though the sample file in *this* case was
>       perfectly appropriate, i would choose to make a copy of it under
>       files/, and install the conf file from *there*, the advantage being
>       that the actual file being installed is immediately readable.
>
>         does anyone have any strong opinions on this? it seems mundane, but
>       i think the latter approach is still superior, especially since i
>       suspect most sample configuration files would have to be adjusted,
>       anyway.
>
>         thoughts? just trying to collect some best practices to apply to
>       this project.
>
>       rday
>       --
>       _______________________________________________
>       Openembedded-core mailing list
>       Openembedded-core@lists.openembedded.org
>       http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-513952832-1584703946=:8837--
