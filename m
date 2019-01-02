Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 67ACB6B96C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:11:50 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id x85-v6so27419682ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9b+SkecgzJA/LT/NMUt6tA1CyqN+CKpPddxRsWxz6zI=;
	b=CWppTs+cbsDZFb/OLe0+xOwvnCw0zrcZ1LbcNeiPrRfKvl2P+wDhEPs3J159H3XwA6
	lQKpeRqUPB3EebLkBk+80ydGMLZ4mj/6PqGqRJHdD9S0KXGi9qRl+Ega6NCuPRGy6Uci
	3niw7HtqPOEZyExQaCoZ5D3ooDn4aZldPNn6inIDDjXIEaem7RuJpGisvx+in7PJfGem
	p4ijqrM7JuzByUs+ELAVIFbR4Q+I5X/8S1zwLT5RR27RTYRzUX6yYuhVpFwQgmQVCBhF
	K7r9CcxkQm4tHoFMbPhxF2x7nNXsEDbtcVuSq6s9dx4G3OizCKEg9ejhoZuxhUM1C50o
	YeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9b+SkecgzJA/LT/NMUt6tA1CyqN+CKpPddxRsWxz6zI=;
	b=ACLxTfvLHxXX0AGBs9iW/OEblExATDloCVoR326J2P4hC4nj75NmGfdCdqRgNM+Coi
	byFgahTVGG7UfPk8hbVx5mYTmrvr8C5MJ+789Cuyx+xBTS1IyrKq3wWnZXQ6VyppqzgD
	Q44lWNjptQIzN4vJyMRK3Tlb+oNkJGMy36V1eusLdr2MrT5fwsybge3FOehJzN8muTeQ
	D1qiugk0C4/DDT1VdMjN8J7tozIaj+mf12PRHliacAuP6VJCJEufLFeOJvKJhf2q0FCI
	Ri6IzRZ5zxkXuh0rYRHUU5Jv0pq116oy+lmDkc4mnf30TUr9JGOzhCetlB6FFow9ezaO
	UTCg==
X-Gm-Message-State: AJcUukc7AHHf0OSKXxdZMPy+hRnYnVdGbvwwhhVhk4HE2s2u9d1hUN3Y
	pWBSn66UFqm6UtSFWRwBdorsSPOW5+k=
X-Google-Smtp-Source: ALg8bN6y2N5yB1ErleRvdIFLKUp213V7RXDl2bvgZ2Pg+biNDvMsentSeH2dPKLth46HJTAWN3Hm9g==
X-Received: by 2002:a2e:9983:: with SMTP id
	w3-v6mr7819798lji.133.1546445510612; 
	Wed, 02 Jan 2019 08:11:50 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o17sm10040195lff.77.2019.01.02.08.11.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:11:50 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 17:11:39 +0100
Message-Id: <20190102161144.11264-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH v2 0/5] systemd patches
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
X-List-Received-Date: Wed, 02 Jan 2019 16:11:50 -0000
Content-Transfer-Encoding: 8bit

Changed in v2:
- address patchtest warnings:
  - include sign-offs on patches
  - include License-Update tag on patch that makes licensing change
- dropped patch implementing brute-force removal of unit files installed
  by systemd into /etc
- reworked the systemd-conf patch to restore the installation of the
  base systemd configuration files


**********

These patches make some modifications to systemd with the long-term goal
of being able to run OE in systemd's "stateless" configuration.
"Stateless" boils down to building an image with empty /etc and /var
directories so that volatile (tmpfs) filesystems can be mounted there;
this requires that the system subsequently be able to populate these
directories dynamically, which systemd mostly takes care of if things
are done right.

In these patches:
i)    Don't include machine-id in writable images so that systemd can run
its first-boot machinery
ii)   Move systemd configuration files out of /etc
iii)  Allow systemd to dynamically enable services and populate
/etc/systemd/system via the presets mechanism

There's a long way to go to get to a working "stateless" configuration.
Getting to a "volatile" system (just empty /var) should be easier and
I'll post patches moving things in that direction shortly.

/Jonas

Jonas Bonn (5):
  systemd: do not create machine-id
  systemd-conf: simplify creation of machine-specific configuration
  systemd: create preset files instead of installing in image
  systemd-systemctl-native: simplify and support preset-all
  rootfs-postcommands: call preset-all for read-only-rootfs

 meta/classes/rootfs-postcommands.bbclass      |  8 +++
 meta/classes/systemd.bbclass                  | 33 ++++++------
 meta/recipes-core/systemd/systemd-conf.bb     | 53 ++++++++-----------
 .../systemd/systemd-systemctl/systemctl       | 36 +++----------
 meta/recipes-core/systemd/systemd_239.bb      | 17 +++---
 5 files changed, 62 insertions(+), 85 deletions(-)

-- 
2.19.1


