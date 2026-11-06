Received: from mailrelay-egress7.pub.mailoutpod3-cph3.one.com (mailrelay-egress7.pub.mailoutpod3-cph3.one.com [46.30.211.246])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6724.1793974438143370508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:14:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=meC+Z2mX;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=O+Tq8kC5;
 spf=none, err=SPF record not found (domain: berginkonsult.se, ip: 46.30.211.246, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793974435; x=1794579235;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=/XncJGseMLAYL3zWLuWEYB8secQA/5MJvkbBJgGrgPs=;
	b=meC+Z2mX96M0OKqnF4LkojQzUalP3UvbB4+PFL53pRYHRdYIUS4/I1zEfru5s/T9K2Ujri+yKuyqF
	 CAKyM1zH0V4v5ki96S/TXQyn3WPCUGyowr0DX8IRWFvrsHaaF47qmTBwpFanC+R3zNHFmUuwBcEBCo
	 ycPisQCjysJvOLGqnmHzmLpsSUa/EUqVmVtrmIZDYqLiHMMODN56/RFqR4iGJYxbRX2OGJss9UJbKs
	 +uCoCZ/XPIfI62v0MPDc4/UIp4OOg9qzDV9EufgsYG1LjuBn/4UnOHtscZlL/JzxFvPDLmbaYkNDlX
	 0IMtLuVnLAEdAm1JzJtWlPz28kpERqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793974435; x=1794579235;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=/XncJGseMLAYL3zWLuWEYB8secQA/5MJvkbBJgGrgPs=;
	b=O+Tq8kC5jbJk7VZQDIRIBtw6Rn7AYzpoYuUZbLRnjzHZEJnp9S/xPakTnfzWB0dYZAkAPyo7y88/j
	 b/JvrlQDw==
X-HalOne-ID: 4b141721-d9ec-11f1-8920-1b46ed53ce32
Received: from pbkserver2.metrum.local (c83-191-168-223.bredband.tele2.se [83.191.168.223])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4b141721-d9ec-11f1-8920-1b46ed53ce32;
	Fri, 06 Nov 2026 14:13:55 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 0/2] useradd: consistent shadow files across package backends
Date: Fri,  6 Nov 2026 15:13:46 +0100
Message-ID: <20261106141348.2757557-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249651
Content-Type: text/plain; charset="utf-8"

On ipk and deb rootfs, useradd/groupadd run from preinsts before
shadow's postinst has created /etc/shadow and /etc/gshadow, so
--system accounts end up with different aging and gshadow password
fields than on rpm [YOCTO #14139].

Patch 1 creates the shadow files in useradd_preinst, patch 2 adds an
oe-selftest that compares /etc/shadow and /etc/gshadow per account
across rpm, ipk and deb rootfs.

Tested with oe-selftest -r usergrouptests
imagefeatures.ImageFeatures.test_useradd_static on poky, and
usergrouptests on poky-altcfg. The new test fails without patch 1
on both.

Peter Bergin (2):
  useradd.bbclass: create shadow files before useradd on ipk/deb rootfs
  oe-selftest: usergrouptests: compare shadow files across package
    backends

 meta/classes/useradd.bbclass                  | 11 +++++++++
 .../lib/oeqa/selftest/cases/usergrouptests.py | 24 +++++++++++++++++++
 2 files changed, 35 insertions(+)

