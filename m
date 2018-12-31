Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 420A16058C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:01 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k15-v6so23483405ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KHuI4/dcsXMSFZDjqXqFM1tmZJsvvv4x/EudA3+Re5I=;
	b=wHPHDpX/k4wS+x11dGyO4ucif+9OICZWqbuS2KEOyx57scTosXHYx1oxkgE5LyHwRi
	fG4/GJDHeRpGNIOgayhFTdJ3UR4y97y7V/x3eT583HMlQ23xsHvdTX9MRNbB/Lci5XWz
	aB8Ev8efsgAnQPR8obNLTbRbtiAY9WdMAApZleFb746tXSDLDlagyGHdRkAkkUct7Qhy
	aHJFSQdvY+Ss9okTnmMSYlI3rWxCbvajcuqs/OqQQOcK4OZow4Id9xZPdRvW7y/vIvrc
	qsWMhWeDEdT02D/rkIKysRx3oxr74kTMmqw8w1EfxifUVkzjt/EE8nO6i2pQFkbB58vL
	bPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KHuI4/dcsXMSFZDjqXqFM1tmZJsvvv4x/EudA3+Re5I=;
	b=UF3/afREYd/sqNZj9UzFj8tUa7rPkER0LZ5gG7u54Rt9O+NIRHncZqH5YpkCUB1XN3
	5iAve1JYRP+VlaLrYc8ki0CJmavNOgXT6QXVPaVb7Yubs9NCsa3Hrt0/KTw2J4aPLoZn
	NK+GU6Ou72sbwC4GXi6P/2lvz1wu/mhMnLVuxJbtT/X+p0Pp5H9zADWQrFgfzqXrqyBO
	MPVqe8UWLr22YvhajiV41QLbM5d9lh2t+HLx/H2B5YurxA0uMlKIuJMTl9DyrEP//E7d
	m5EXM5oI2b5RhAPrQ12rWIB5NE262+tQMzMU/UPd7nCVPP+vCGkCPGQ4BXSj3GblsLEu
	ydHQ==
X-Gm-Message-State: AJcUukfJ3UUQNFNp6x/pfFC/dER6pedBu/OjgjsBCrbNGdTo534Z/TmW
	OzMnPBUP/QQNW0iT+VgdNZF4DtlK7Ik=
X-Google-Smtp-Source: ALg8bN7HXXQbd5E/x90NYedjHn7bVBtFjQAFZMmFofPf4+K824vqx0+TPfPp9H5C12dTgXDLqi7Trw==
X-Received: by 2002:a2e:20c3:: with SMTP id
	g64-v6mr23421005lji.101.1546257961961; 
	Mon, 31 Dec 2018 04:06:01 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:01 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:52 +0100
Message-Id: <20181231120559.25470-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 0/7] systemd patches
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:02 -0000
Content-Transfer-Encoding: 8bit

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

Jonas Bonn (7):
  systemd: do not create machine-id
  systemd-conf: simplify creation of configuration
  systemd: move additional conffiles to systemd-conf
  systemd: create preset files instead of installing in image
  systemd-systemctl-native: simplify and support preset-all
  rootfs-postcommands: call preset-all for read-only-rootfs
  systemd: do not pre-enable services, rely on presets

 meta/classes/rootfs-postcommands.bbclass      |  8 ++++
 meta/classes/systemd.bbclass                  | 33 +++++++-------
 meta/recipes-core/systemd/systemd-conf.bb     | 45 +++++++------------
 .../systemd/systemd-systemctl/systemctl       | 36 +++------------
 meta/recipes-core/systemd/systemd_239.bb      |  4 ++
 5 files changed, 52 insertions(+), 74 deletions(-)

-- 
2.19.1


