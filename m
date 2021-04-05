Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.3724.1617625288074917343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 05:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:45964 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTOEQ-008FrM-HP
	for openembedded-core@lists.openembedded.org; Mon, 05 Apr 2021 08:21:27 -0400
Date: Mon, 5 Apr 2021 08:21:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: non-standard (legacy?) use of BBFILE_PATTERN?
Message-ID: <56a2bdad-4776-f9db-4456-8150f67a414c@crashcourse.ca>
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


  sort of a followup to something richard purdie wrote recently
regarding BBFILE_PATTERN. these days, the standard for any layer is to
define, in layer.conf, the following:

  BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
        ${LAYERDIR}/recipes-*/*/*.bbappend"
  ... snip ...
  BBFILE_PATTERN_my-layer = "^${LAYERDIR}/"

AIUI, the combination of those two settings means that this layer will
add to the recipes mix all bb and bbappend files that match the
wildcard pattern in BBFILES. so far, so good.

  recently, though, i ran across the following -- a
(properly-structured) "main" layer, which contained three sub-layers,
call them "sub1", sub2" and "sub3", very much like how the
meta-cloud-services layer is in itself a valid layer, but also
contains, as subdirectories, more focused, related layers. again,
nothing wildly unusual here.

https://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/tree/

  what i ran across was a "main" layer with those three "sub" layers,
wherein layer.conf contained that standard BBFILES setting, but then
continued on to do this (all else was standard content)":

  BBFILE_PATTERN_main = "^${LAYERDIR}/(?!sub1|sub2|sub3)

i assumed (based on no actual knowledge) that that represented some
sort of legacy way to say, "all .bb and .bbappend files, *except* for
any in those subdirectories" -- effectively a filtering mechanism, is
that about right?

  i can see how that might be useful if those sub-layers contained
recipe and append files that exactly matched the top-level BBFILES
wildcard pattern but, as with meta-cloud-services, those sub-layers
are valid layers in their own right, so that all of *their* .bb and
.bbappend files would be one level further down and wouldn't be picked
up by the "main" BBFILES wildcard pattern, anyway.

  does that look like what's happening here? just a legacy holdover
from when that might have been a more common way to associate recipes
with layers?

rday
