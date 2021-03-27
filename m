Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.4974.1616841096407350353
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 03:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:50574 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lQ6E9-000z6X-Tq; Sat, 27 Mar 2021 06:31:34 -0400
Date: Sat, 27 Mar 2021 06:31:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] some trivial(?) questions about packagegroups
In-Reply-To: <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com>
Message-ID: <30fe8fd8-11e0-cab0-223-d5676cdffd@crashcourse.ca>
References: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca> <CAJ86T=W8ooDN4td5n1-c_WDpUV6P3wwHQP_f2QyOSYdRXHK_Ag@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Mar 2021, Andre McCurdy wrote:

> On Fri, Mar 26, 2021 at 8:45 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   what should be easy questions about packagegroups, inspired by my
> > running across some puzzling packagegroup recipes in my travels
> > recently. (i'll start with examples out of oe-core).
> >
> >   first, as with any other recipe, given a "trivial" packagegroup
> > like, say, packagegroup-core-eclipse-debug.bb:
> >
> >   SUMMARY = "Remote debugging tools for Eclipse integration"
> >
> >   inherit packagegroup
> >
> >   RDEPENDS_${PN} = "\
> >     gdbserver \
> >     tcf-agent \
> >     openssh-sftp-server \
> >     "
> >
> > there is no need to add a "PROVIDES" line since every recipe file
> > automatically provides its own name. so far, so good.
> >
> >   if we move up to packagegroup-core-nfs.bb, note how this recipe file
> > defines two additional packagegroups, and has to add a PROVIDES line
> > in order to make those new names accessible:
> >
> >   PROVIDES = "${PACKAGES}"
> >   PACKAGES = "${PN}-server ${PN}-client"
> >
> >   SUMMARY_${PN}-client = "NFS client"
> >   RDEPENDS_${PN}-client = "nfs-utils-client"
> >
> >   SUMMARY_${PN}-server = "NFS server"
> >   RDEPENDS_${PN}-server = "\
> >     nfs-utils \
> >     nfs-utils-client \
> >     "
> >
> > so the question is, must one supply a PROVIDES line for any
> > packagegroup names above and beyond the one that comes with the recipe
> > file itself? i ask what seems like a dumb question as i've run across
> > packagegroup recipe files that define multiple additional
> > packagegroups, but do not add them to the PROVIDES line. what is that
> > supposed to represent?
>
> PROVIDES sets up a name which can be used as DEPENDS (ie a build
> time dependency) in other recipes. If PROVIDES contains more than
> one name, they all just become aliases for each other.
>
> Since packagegroup recipes only define run time dependencies,
> nothing should have a build time dependency on a packagegroup
> recipe... and so there's no obvious reason to set PROVIDES to
> anything. Leaving the default will be fine (although it won't be
> used for anything).

  i could have *sworn* that, once upon a time, i verified (in some
weird way) the necessity for the PROVIDES line in a packagegroup, but
it seems i was mistaken. so if this is the case, then why do a couple
of OE packagegroup recipe files contain such a line?

  packagegroup-base.bb
  ====================

  inherit packagegroup

  PROVIDES = "${PACKAGES}"           <=== ?????
  PACKAGES = ' \
            packagegroup-base \
            packagegroup-base-extended \
            packagegroup-distro-base \
            packagegroup-machine-base \
            ... etc etc ...

surely this is not meant to alias all those distinct packagegroup
definitions.

rday

p.s. see also,
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
