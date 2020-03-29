Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.32824.1585505094842472333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 11:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:56558 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIcIn-00CQbr-4D
	for openembedded-core@lists.openembedded.org; Sun, 29 Mar 2020 14:04:53 -0400
Date: Sun, 29 Mar 2020 14:04:50 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: worth abbreviating packagegroup full names to using ${PN}?
Message-ID: <alpine.LFD.2.21.2003291352400.9579@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  currently, in oe-core packagegroup files, there are a number of
recipe files that use what i consider the "right" approach and use
${PN} to refer to the packagegroup name when defining the
packagegroup components, as in:

  RDEPENDS_${PN} = "\
    nativesdk-pkgconfig \
    nativesdk-qemu \
    ... snip ...

  RDEPENDS_${PN}_darwin = "\

and so on, and so on.

  OTOH, there's also a lot of this (spelling out the packagegroup name
in full):

  RDEPENDS_packagegroup-core-buildessential = "\
    autoconf \
    automake \
    ... snip ...

is it worth doing a quick cleanup of that to shorten all that? on the
one hand, it *sounds* like unnecessary churn, but on the other hand, i
think using ${PN} is a useful visual clue in that, if there is a full
packagegroup name in the recipe file, that should be a hint that
there's a *reason* for it to be there.

  however, two issues with this.

  first, in packagegroup file packagegroup-base.bb, there is the
"unfortunate" naming of:

PACKAGES = ' \
            packagegroup-base \
            packagegroup-base-extended \
            packagegroup-distro-base \       <---
            packagegroup-machine-base \      <---

where those two can't be abbreviated given the name structure. oh,
well.

  also, in that same recipe file, i assume that one could abbreviate
all the full names in

  PACKAGES = ' \
     ... snip ..
     ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \

as in, the above could be abbreviated as:

     ${@bb.utils.contains("MACHINE_FEATURES", "alsa", " ${PN}-alsa", "", d)} \

yes?

  anyway, is is worth the churn? i will defer.

rday




