Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.7330.1620991020656246393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 04:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:40648 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lhVoQ-0006Zo-RX
	for openembedded-core@lists.openembedded.org; Fri, 14 May 2021 07:16:59 -0400
Date: Fri, 14 May 2021 07:16:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there an easy to prevent *creation* of some recipe's packages?
Message-ID: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca>
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


  pretty sure i know the answer to this one, but was asked the other
day and wanted to make sure. in order to speed up the normal OE build,
someone suggested bypassing the creation of packages that weren't
going to be relevant, such as -dev, -doc and so on -- the idea was
that that could make a significant difference in build time.

  i pointed out that, based on default package definition as found in
bitbake.conf:

  PACKAGE_BEFORE_PN ?= ""
  PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
  ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
  PACKAGES_DYNAMIC = "^${PN}-locale-.*"
  FILES = ""

  FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/*   ${libdir}/lib*${SOLIBS} \
            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
     ... snip ...

for every recipe you build, those *are* the packages that will be
built and populated, short of overriding those values. i suggested
that, in normal behaviour, if you check the generated WORKDIR for any
recipe, you would first find the full package breakdown under
packages-split/, where individual package contents can be examined,
and you could further check out the rpms under deploy-rpms/, which
would be built regardless of whether you chose to install them or not.
(that's correct, yes?)

  i finally suggested that, sure, if you do some ugly hacking, i
guess you could save time by not even creating some of those packages,
but i speculated that that wouldn't be a significant saving and that
it wasn't worth trying to cut corners like that and you were more
likely to break things than save any meaningful build time.

  thoughts?

rday
