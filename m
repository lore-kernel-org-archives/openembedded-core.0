Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tq1TE-00016n-MH
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 14:01:28 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34934 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tq1Ei-0000GJ-80; Tue, 01 Jan 2013 07:46:28 -0500
Date: Tue, 1 Jan 2013 07:46:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <50E18137.9090009@mlbassoc.com>
Message-ID: <alpine.DEB.2.02.1301010737590.17984@oneiric>
References: <alpine.DEB.2.02.1212301442200.16593@oneiric>
	<50E18137.9090009@mlbassoc.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: any objection to my cleaning up some packagegroup files in oe-core?
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
X-List-Received-Date: Tue, 01 Jan 2013 13:01:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 31 Dec 2012, Gary Thomas wrote:

> On 2012-12-30 12:44, Robert P. J. Day wrote:
> >
> >    specifically, in cases like this in packagegroup-core-sdk.bb:
> >
> > RDEPENDS_packagegroup-core-sdk
> >
> > could more cleanly be expressed as:
> >
> > RDEPENDS_${PN}
> >
> > could it not?  there are quite a few of those unnecessarily verbose
> > constructs, anyone mind if i submit a patch to make that change?
>
> Why stop there?  It seems that recipe could use more changes:
>   RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
>   RREPLACES_packagegroup-core-sdk = "task-core-sdk"
>   RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"
>
>   RDEPENDS_packagegroup-core-sdk = "\
>
> All of these should use _${PN}
>
> Also, most of the recipes in meta/recipes-core/packagegroups/* could
> use similar changes to make them more readable and maintainable.

  good lord, there's a lot of that, such as in packagegroups-base.bb:

PROVIDES = "${PACKAGES}"
PACKAGES = ' \
            packagegroup-base \
            packagegroup-base-extended \
            packagegroup-distro-base \
            packagegroup-machine-base \
            \
            ${@base_contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
            ${@base_contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
            ${@base_contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
            ${@base_contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
            ... and lots more ...

  sure, there's a lot of that cleanup that could be done but a few
questions:

1) given how *much* there is, is it worth the non-functional churn?
i'm a big believer in consistency and aesthetics but even *i* would
understand if others didn't want to go down that road.

2) is there a standard for quoting here (single vs double)?  i've seen
both variations:

  ${@base_contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
  ${@base_contains("MACHINE_FEATURES", "alsa", 'packagegroup-base-alsa', "", d)} \

  although i don't think that matters for the eventual expansion of
${PN} inside the quotes

3) as i mentioned before, there are the occasional package defns that
mess up the prettiness, as with packagegroup-base:

  PACKAGES = ' \
            packagegroup-base \
            packagegroup-base-extended \
            packagegroup-distro-base \    <-- can't abbreviate obviously
            packagegroup-machine-base \


  anyway, i'd be willing to do some cleaning for the aesthetic
benefit, but only if others think it's worth it and there's a clear
style guide.  it would certainly cut down on the verbosity.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


