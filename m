Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.2443.1586286690964803850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:45146 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jLtdB-001jcH-44
	for openembedded-core@lists.openembedded.org; Tue, 07 Apr 2020 15:11:30 -0400
Date: Tue, 7 Apr 2020 15:11:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: clarify use of "$D" in pkg_postinst routines?
Message-ID: <alpine.LFD.2.21.2004071503180.10456@localhost.localdomain>
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


  first time looking closely at pkg_postinst_* routines, so can
someone clarify the use of "$D" in those routines? at the moment, i'm
*guessing* that those routines need to be able to run in two different
contexts (but i could be wrong):

  1) at image creation time
  2) at later package installation time on a running system

i'm aware that bitbake requires the use of curly braces, so always
must use "${D}", so in something like this from xorg-font-common.inc,
how does OE process this shell function? as in, what context do those
routines run in?

  pkg_postinst_${PN} () {
        for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
                mkfontdir $fontdir
                mkfontscale $fontdir
        done
        for fontdir in `find $D/usr/share/fonts/X11 -type d`; do
                mkfontdir $fontdir
                mkfontscale $fontdir
        done
  }

it seems(?) clear that testing $D is the way to tell which of the two
contexts one is running in, as in:

  pkg_postinst_${PN}_class-target () {
        if [ "x$D" != "x" ]; then
          rootarg="--root $D"
        else
          rootarg=""
        fi
        ... snip ...

such that if $D is the empty string, then you're in the context of a
running system. am i close?

rday

p.s. i notice there are two ways that $D is used to define the
context. in some cases, just using it (as in the first example above)
is sufficient, while in other cases (as in the second case), the
routine needs to actually test the value.
