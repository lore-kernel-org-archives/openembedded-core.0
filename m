Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.8356.1620997491541996255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 06:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:41458 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lhXUo-0004N7-Ey
	for openembedded-core@lists.openembedded.org; Fri, 14 May 2021 09:04:50 -0400
Date: Fri, 14 May 2021 09:04:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: can we not assign default values to "EXTRA_*" variables?
Message-ID: <9cea5034-229c-2424-68ce-803f156711@crashcourse.ca>
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


  i just got burned by taking the very advice i'd been giving out for
years. when people ask about how to add new image features to their
images, they point to IMAGE_FEATURES and ask if that's the way to do
it, as in one of:

  IMAGE_FEATURES += ...
  IMAGE_FEATURES_append = ...

well, ok, i say, that will work, but i mention that there is an
associated variable, EXTRA_IMAGE_FEATURES, that is kind of meant for
just that purpose -- it lets you define the "EXTRA" stuff you want,
and that will just be added pursuant to this in bitbake.conf:

  EXTRA_IMAGE_FEATURES ??= ""
  IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"

advisee went off happy, followed my advice, and came back complaining
that while the new image features were there, the "debug-tweaks"
feature that had been there all this time was now gone.

  crap.

  because that's when i remembered that the standard OE
local.conf.sample file contains the line:

  EXTRA_IMAGE_FEATURES ?= "debug-tweaks"

so, of course, taking my advice stomped all over the soft assignment
of "debug-tweaks". and while i know this has been the setting for
years and years, it seems non-intuitive -- it seems more
understandable if there is a general pattern that says, "if there is a
regular variable and an associated 'EXTRA_' variable, it's always safe
to just assign what you want to add to the EXTRA_ one."

  or maybe i'm just overthinking this.

rday
