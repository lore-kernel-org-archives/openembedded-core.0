Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.437.1621357224858625390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 10:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:41968 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lj34y-0004ug-V9
	for openembedded-core@lists.openembedded.org; Tue, 18 May 2021 13:00:23 -0400
Date: Tue, 18 May 2021 13:00:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: how to create debugfs while ruthlessly stripping image contents?
Message-ID: <6d91cd1-9948-23e-1d73-e3eb2b73adbc@crashcourse.ca>
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


  muh colleague just presented me with the following ... until
recently, build was properly producing bootable image while
simultaneously creating companion debugfs. so far, so good.

  then enough packages were added so that image didn't fit in target
eMMC, so decision was made to strip bins and libs in ${D} image/
directory via sneaking the following into do_install_append():

  ${STRIP} -p --strip-unneeded ${D}${bindir}/*
  ${STRIP} -p --strip-unneeded ${D}${libdir}/*

as soon as this kicked in, the complaint was that numerous objects
were now missing from the debugfs, and i *suspect* (working to
confirm) that, having stripped all those binaries and libraries before
the packaging step kicks in, a lot of stuff that would have ended up
in the debugfs is now bypassed since it lacks the appropriate
debugging info anymore.

  i'm looking at the various variables to see what would support:

  1) stripping image-bound bins and libs, while
  2) retaining debugging info to build debugfs

a stack overflow page suggests something like:

  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
  INHIBIT_PACKAGE_STRIP = "1"
  DEBUG_BUILD = "1"
  EXTRA_IMAGE_FEATURES_append = " dbg-pkgs"

but i'm open to what to set to get the desired effect.

rday
