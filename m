Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.14698.1616773510474469743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 08:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:37052 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lPoe4-00EApy-Gg
	for openembedded-core@lists.openembedded.org; Fri, 26 Mar 2021 11:45:09 -0400
Date: Fri, 26 Mar 2021 11:45:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: some trivial(?) questions about packagegroups
Message-ID: <117b58d-f7c6-6187-dc33-66d75292cc58@crashcourse.ca>
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


  what should be easy questions about packagegroups, inspired by my
running across some puzzling packagegroup recipes in my travels
recently. (i'll start with examples out of oe-core).

  first, as with any other recipe, given a "trivial" packagegroup
like, say, packagegroup-core-eclipse-debug.bb:

  SUMMARY = "Remote debugging tools for Eclipse integration"

  inherit packagegroup

  RDEPENDS_${PN} = "\
    gdbserver \
    tcf-agent \
    openssh-sftp-server \
    "

there is no need to add a "PROVIDES" line since every recipe file
automatically provides its own name. so far, so good.

  if we move up to packagegroup-core-nfs.bb, note how this recipe file
defines two additional packagegroups, and has to add a PROVIDES line
in order to make those new names accessible:

  PROVIDES = "${PACKAGES}"
  PACKAGES = "${PN}-server ${PN}-client"

  SUMMARY_${PN}-client = "NFS client"
  RDEPENDS_${PN}-client = "nfs-utils-client"

  SUMMARY_${PN}-server = "NFS server"
  RDEPENDS_${PN}-server = "\
    nfs-utils \
    nfs-utils-client \
    "

so the question is, must one supply a PROVIDES line for any
packagegroup names above and beyond the one that comes with the recipe
file itself? i ask what seems like a dumb question as i've run across
packagegroup recipe files that define multiple additional
packagegroups, but do not add them to the PROVIDES line. what is that
supposed to represent?

rday
