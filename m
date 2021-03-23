Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.6548.1616494410231362265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 03:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:52352 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lOe2S-00FWHI-MA
	for openembedded-core@lists.openembedded.org; Tue, 23 Mar 2021 06:13:29 -0400
Date: Tue, 23 Mar 2021 06:13:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: proper (vs weird) way to define proprietary licenses
Message-ID: <8763d612-bc5d-1dc6-84d7-88936ca479c6@crashcourse.ca>
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


  once again into the code base i'm poring over, and this time, it's
about defining proprietary licenses for internal recipes.

  turns out the meta-boundary layer has a nice example of what i'm
sure is the right way to do this (i've rarely had to do this myself),
wherein the layer's "layer.conf" file defines where to go get some
extra licenses:

  LICENSE_PATH += "${LAYERDIR}/licenses"

or possibly some variant like (for ubiquitous acme corp.):

  LICENSE_PATH += "${LAYERDIR}/files/acme-licenses"

to pair up with OE's .../files/common-licenses, you get the idea.

  so i was puzzled when i saw all these clearly proprietary recipes
that did not define LICENSE or LIC_FILES_CHKSUM values but, instead,
inherited "acme-license.bbclass", whereupon ... well ...

acme-license.bbclass
====================

  HOMEPAGE = "https://acme.com"
  LICENSE  = "Acme-Corp-License"
  LIC_FILES_CHKSUM =
	"file://${THISDIR}/../../files/acme-licenses/${LICENSE};
	md5=deadbeef..."

*sigh* ... while this might save a couple lines per recipe file, i
can't believe this is a reasonable approach. has anyone else seen this
strategy?

  in any event, i'm adding this to my current list of "stuff you might
want to avoid doing when using openembedded."

rday
