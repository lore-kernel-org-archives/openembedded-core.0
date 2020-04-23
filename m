Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.811.1587678301325120734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 14:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57728 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jRjeV-003op7-6m
	for openembedded-core@lists.openembedded.org; Thu, 23 Apr 2020 17:44:59 -0400
Date: Thu, 23 Apr 2020 17:44:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: OE installs /sbin/nologin, but systemd accounts use /bin/nologin
Message-ID: <alpine.LFD.2.21.2004231738580.1391967@localhost.localdomain>
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


  followup to previous post ... with master oe-core, i did:

  * MACHINE = qemuarm64
  * core-image-minimal

with only customization:

  INIT_MANAGER = "systemd"

the end result was a bootable QEMU image which had the executable
/sbin/nologin, but a number of systemd-related user accounts with
login shell "/bin/nologin" (which does not exist in the image).

  the systemd accounts are clearly created as a result of this from
the systemd recipe file (which hardcodes the selection of
/bin/nologin):

USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'networkd', '--system -d / -M --shell /bin/nologin systemd-network;',
'', d)}"

USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;',
'', d)}"

USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'timesyncd', '--system -d / -M --shell /bin/nologin
systemd-timesync;', '', d)}"

  is this a bug? how does one properly make this consistent?

rday
