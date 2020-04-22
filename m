Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.1668.1587587135667985484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 13:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:39614 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jRLw5-0002GD-Mz
	for openembedded-core@lists.openembedded.org; Wed, 22 Apr 2020 16:25:34 -0400
Date: Wed, 22 Apr 2020 16:25:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: trying to clarify the variety of "nologin" install directories
Message-ID: <alpine.LFD.2.21.2004221621110.682713@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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


  was asked by a colleague this morning why an admittedly old (morty)
build had the "nologin" executable installed in both /sbin and
/usr/sbin, and they were clearly different (sizes were 6K and 10K).
took a quick look, and noticed that nologin was apparently being
installed by both the shadow and util-linux packages.

  wondered what else might be referring to nologin so, in the current
master of OE, i notice in meta/recipes-core/systemd/systemd_230.bb
numerous references to nologin of the form:

USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;',
'', d)}"

  which now presents a *third* possibility for the location of
nologin: /bin/nologin.

  so i'm going to dig into history to see in what way "nologin" has
moved around, but if there's a summary somewhere, that would be just
ducky.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
