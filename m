Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDBA7DBAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k16so16452371wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=APVUc7i3GPo2CefMozcYfSqWtT8DxQ93m44At+up5Ns=;
	b=iXaBgqK7ip3D+kDpPBv4O9Yw6dUVaWeYsGFCiAD3maRMlMLFVL09c8WkPuD24hyMTr
	Qg3TJoNTe3gF602NIyOy4oOaJ8Kbg9xwJkyr16VgkElHsOz5JL5Okeoq5Kh4Pup8x2yO
	C/RhEpCn8DTBCyaL2upYkCKKOP2k9uUIjNAOezFFIxEKkMNQUZ+4HxxJ6OQ25ihUgdyu
	d1ZjwuBR6rlyXsEzu9sCXYh4dR57ZuFuYn5f0p8b7bnJ5LK5grw8q129Uq5xSE3uBXS/
	XOdVE1cAFgXHrreK8obRGwtSewWY/R004SGXZXXmmL9AOldWGk/3Gpvz3cabwS3Ob1rc
	ECRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=APVUc7i3GPo2CefMozcYfSqWtT8DxQ93m44At+up5Ns=;
	b=KzO+uzxCNDKpDonhnbEg9qpDMfe66zkKblDGKil0cK97jJ0vN9GgB9ssRY4Sr65hcd
	4Au1kT6kmXpiudwQuQjC5xQZRz9HamQDKhd/klINiBgu6HuCZwBUyvuydpWft4gA3CnW
	eeRCKSMIwXZeQ0H8ivqUiFw1ImkhJ8tXDNS0YZEKBoSUEiTynuYU4srrRbAxR38SqMrQ
	MsRclmVI3akcRtgw4zcmODCjzwUV094ngk3V6rCc95EsuFzLS4wnjHYKRmtI5bqFfRAM
	/c5GMcTjslJMeFW7sbID3JVS7NDaq4kRWWGDFQ0ZWheRudPK5XhituiEQ57pM6SG329w
	Al3w==
X-Gm-Message-State: APjAAAXhORn7IRdEDIKb1+snQA3lAhiiRGz1Pk9Qa9A1dB8lcXpCILho
	2HMv1eO7qTSGIoh3RmfGHesYYiKl76g=
X-Google-Smtp-Source: APXvYqwMD4oQDNmTKDL80pQ1zU6HAwBjS7klY4g2SdrEskzOQU/WSpcohduUDqSikYKJiq/sfjHR6g==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr24376028wrw.101.1556549009532; 
	Mon, 29 Apr 2019 07:43:29 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:28 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:19 +0100
Message-Id: <20190429144325.63744-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2019 14:43:29 -0000


This is largely Jonas Bonn <jonas@norrbonn.se> patchset to move towards a
"stateless" configuration:

  These patches make some modifications to systemd with the long-term goal
  of being able to run OE in systemd's "stateless" configuration.
  "Stateless" boils down to building an image with empty /etc and /var
  directories so that volatile (tmpfs) filesystems can be mounted there;
  this requires that the system subsequently be able to populate these
  directories dynamically, which systemd mostly takes care of if things are
  done right.

  In these patches:
  i)   Don't include machine-id in writable images so that systemd can run
       its first-boot machinery
  ii)  Move systemd configuration files out of /etc
  iii) Allow systemd to dynamically enable services and populate
       /etc/systemd/system via the presets mechanism

  There's a long way to go to get to a working "stateless" configuration.
  Getting to a "volatile" system (just empty /var) should be easier and I'll
  post patches moving things in that direction shortly.

As a result of the systemd 242 upgrade, which includes 01d2041e41f4
("meson: stop creating enablement symlinks in /etc during
installation"), services such as systemd-networkd are no longer enabled
in images.

This patch set fixes this problem in addition to satisfying the goal of
moving towards "stateless" configurations.

The issue with respect to image testing during CI was caused by
systemd-time-wait-sync.service being enabled due to the lack of a
default preset policy:

https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto

We include a default policy of "enable nothing" which matches that used
by (at least) Arch and Fedora.

Changes in v5:
- rebased for systemd 242
- install default preset distribution policy of "enable nothing"

Changes in v4:
- add patch to make systemd-firstboot a non-default option to systemd to
  prevent unexpected prompts at runtime

Changes in v3:
- parameterize preset-file installation location (as suggested in patch
  review)

Changes in v2:
- address patchtest warnings:
  - include sign-offs on patches
  - include License-Update tag on patch that makes licensing change
- dropped patch implementing brute-force removal of unit files installed
  by systemd into /etc
- reworked the systemd-conf patch to restore the installation of the
  base systemd configuration files

Jonas Bonn (6):
  systemd: don't build firstboot by default
  systemd: do not create machine-id
  systemd-conf: simplify creation of machine-specific configuration
  systemd: create preset files instead of installing in image
  systemd-systemctl-native: simplify and support preset-all
  rootfs-postcommands: call preset-all for read-only-rootfs

 meta/classes/rootfs-postcommands.bbclass      |  8 +++
 meta/classes/systemd.bbclass                  | 33 ++++++------
 meta/recipes-core/systemd/systemd-conf_242.bb | 53 ++++++++-----------
 .../systemd/systemd-systemctl/systemctl       | 36 +++----------
 .../systemd/systemd/99-default.preset         |  1 +
 meta/recipes-core/systemd/systemd_242.bb      | 23 ++++----
 6 files changed, 68 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset

-- 
2.17.1


