Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.5677.1620135072728812512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 06:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:58888 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldv8p-0005ud-Qm
	for openembedded-core@lists.openembedded.org; Tue, 04 May 2021 09:31:11 -0400
Date: Tue, 4 May 2021 09:31:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: making the meaning of "FILES_${PN}-bin" a little more obvious?
Message-ID: <bff7177-906f-f4e7-8085-6f245ad9a262@crashcourse.ca>
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


  more nitpickery, but i note in OE's current bitbake.conf the
initially odd definitions:

  FILES_${PN} = "${bindir}/* ${sbindir}/* ...'
     ... snip ...

  FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"

i say "odd" since someone perusing that file could be confused, first,
that that "-bin" package definition overlaps with the base package
file list and, more, that just above that, the definition of PACKAGES
doesn't include the "-bin" package:

  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev \
      ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"

so anyone currently RTFS is likely to stop and think, "what the heck
is the '-bin' package defined for if it's not even included in the
normal package list?"

  of course, one need to consult lib_package.bbclass to finally
understand what its purpose is:

  PACKAGE_BEFORE_PN = "${PN}-bin"

but if that's the only purpose for that package definition, would it
not make more sense to just move it to lib_package.bbclass so it's
next to the variable setting that actually causes it to be processed?

  of course it works as is, it just seems unnecessarily confusing,
unless there's some subtle ordering requirement happening here.

rday
