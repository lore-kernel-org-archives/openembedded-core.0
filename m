Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA8175C51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 14:02:57 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160805140244137_0684;
	Fri, 05 Aug 2016 14:02:44 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=16798 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bVfjn-0000Ww-H6; Fri, 05 Aug 2016 10:04:36 -0400
Date: Fri, 5 Aug 2016 10:02:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Andrew Bradford <andrew@bradfordembedded.com>
In-Reply-To: <20160805130018.GD29547@kaim-eeyore.kodakalaris.net>
Message-ID: <alpine.LFD.2.20.1608051000330.17623@localhost.localdomain>
References: <alpine.LFD.2.20.1608050617280.13505@localhost.localdomain>
	<20160805130018.GD29547@kaim-eeyore.kodakalaris.net>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "parted" vs "sfdisk"
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
X-List-Received-Date: Fri, 05 Aug 2016 14:02:57 -0000
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Aug 2016, Andrew Bradford wrote:

> Hi Robert,
>
> On 08/05 06:19, Robert P. J. Day wrote:
> >
> >   your personal opinions, if you would -- i'm working on some scripts
> > to do automated installs on a target board, currently based on
> > parted, but parted seems a bit dense at times, and awkward, and i'm
> > thinking of switching to sfdisk.
> >
> >   for people who have done this sort of thing, do you have any strong
> > opinions either way of parted versus sfdisk? i realize that's not much
> > to go on, just curious about personal preferences, and why.
>
> sfdisk has changed both its input format and command-line options in
> recent versions of util-linux.  If you're scripting sfdisk, you need to
> be aware of this as some of the people who use your scripts will have
> varying versions of util-linux.  For example, in my experience,
> util-linux 2.28 in Debian Stretch and util-linux 2.25.2 in Debian Jessie
> cannot have their sfdisk executables scripted in the same way and then
> produce the same set of partitions when setting up an SD card for an
> embedded system.
>
> The change in input format and command-line options happened around
> util-linux 2.26-2.27 but I haven't dug into it too much to find out
> exactly when.
>
> The newer input format for sfdisk is quite nice, imho, and easy to read.
> You can do something like this now:
>
> {
> echo "label: dos"
> echo "start=1MiB size=32MiB type=0x0C bootable"
> echo "start=33MiB"
> } | sfdisk ${DEVICE}
>
> While the older sfdisk input format would look something like:
>
> {
> echo 1,32,0x0C,*
> echo 33,,,-
> } | sfdisk ${DEVICE}

  ah, now *that* i like ... of course, i'd probably use a here
document:

sfdisk ${DEVICE} <<-EOF
	label: dos
	start=1MiB size=32MiB type=0x0C bootable
	start=33MiB"
EOF

pretty sure that would have the same effect, yes?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


