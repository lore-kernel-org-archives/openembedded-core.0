Return-Path: <quentin.schulz@streamunlimited.com>
Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
	by mail.openembedded.org (Postfix) with ESMTP id 9995D60C73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 12:12:18 +0000 (UTC)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 48kN1t1K2Hz5tl9;
	Fri, 20 Mar 2020 13:12:17 +0100 (CET)
Date: Fri, 20 Mar 2020 13:12:16 +0100
From: Quentin Schulz <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200320121216.23l62svwmpxquur5@qschulz>
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
User-Agent: NeoMutt/20180716
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
X-List-Received-Date: Fri, 20 Mar 2020 12:12:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Fri, Mar 20, 2020 at 07:04:05AM -0400, Robert P. J. Day wrote:
> 
>   got into a discussion yesterday about the "cleanest" way to design a
> .bbappend file to install a package's configuration file, so i'm
> curious about best practices, and here's an example. (and i'm asking
> as it looks like this will be an issue for a number of recipes i'm
> looking at.)
> 
>   current recipe for conntrack-tools:
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.5.bb
> 
> note how the recipe install step installs a conntrack.conf.sample
> file:
> 
> do_install_append() {
>   install -d ${D}/${sysconfdir}/conntrackd
>   install -d ${D}/${sysconfdir}/init.d
>   install -m 0644 ${S}/doc/sync/ftfw/conntrackd.conf ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample
>   ...
> 
> so far, so good. now, in cases where a sample conf file is provided,
> there is, of course, no guarantee that it will be applicable out of
> the box -- one *expects* that it might be necessary to tweak such a
> file and install it as part of a .bbappend file. and here's the point
> of contention.
> 
>   in this current situation, it turns out that that sample conf file
> just happens to be appropriate, so the entire .bbappend file for this
> recipe consists of:
> 
> do_install_append () {
>     install -m 0644  \
>     ${D}/${sysconfdir}/conntrackd/conntrackd.conf.sample \
>     ${D}/${sysconfdir}/conntrackd/conntrackd.conf
> }
> 
>   yes, that will work, but i suggested that, even though it's
> convenient, the problem with that approach is that looking at the
> .bbappend file doesn't show you the contents of the file that will be
> installed. to see the actual conf file, you'd have to peruse the
> source, or check the final result ... you get the idea.
> 
>   i suggested that, even though the sample file in *this* case was
> perfectly appropriate, i would choose to make a copy of it under
> files/, and install the conf file from *there*, the advantage being
> that the actual file being installed is immediately readable.
> 

Have a look at how wpa-supplicant is doing it.

It has two config files. wpa-supplicant.conf which is going straight
to the docs directory on the rootfs and wpa-supplicant.conf-sane which
is the one used by wpa-supplicant at runtime.

So when you want to override the default wpa-supplicant.conf, you
override wpa-supplicant.conf-sane in a bbappend.

I don't know if it's the proper way, but that's one and particularly in
poky which is usually done with best practices in mind.

Quentin

