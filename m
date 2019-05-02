Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AD3096BCA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:10:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w15so4388360wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/0zCGYGJifzz88aWSxir+ii2D7b89BJ9LCXOEg0EvWk=;
	b=P9RywaPFjbH+XzJT7D0BYCbw/V+9YA1gCCJKQ/DKk8MZZaPsdBfjJLIU9UlHlezzWc
	i6ziPOAEczBhLfMba5FeZelhyAX5SVwdbyNbqQ1hHXJSm9mn+ZK57QhuQmts2MMWT4pD
	Q5mBNwR/wiJtgFrZGuI+lnitIc/kthDrZk7b3oF8CO+j6S+S3ND04mCbUl1tgYyIO6dS
	qBdONDbmILEJSUphVqSFPw+NUQVXZggfMmmTrpTAud2DZAbrdlLUa7oMDcBODbzyVzXT
	0P+uOOcvQ0+9sGh2/zWNBPUXn9o/0Ye9W8vhZclboM+N4pdcCnyBAHJjkgjgWHkiZexm
	bP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/0zCGYGJifzz88aWSxir+ii2D7b89BJ9LCXOEg0EvWk=;
	b=cV+G2BsNJ9r9ogzB8GozlJajEUI7KaLmXMH1ez1737mSHARgkiw+9xwpEQm2vt95EW
	MMCjQqNsHfaET+VRTrlwwA2kJE0QltBSfeOwJW+KNby5ZdTfV6nYdT1kZHujPq8zGMnZ
	HSqp7hrRKvpollyJkkRfdEwEo75ZuRyPKwzoAlyMRaS7jHoPSY6Fxg53sPuZeKbDhkAI
	FoxpLFFfFgXlOLlRfCmygAyiFKd3IrMLIYKUUb9IGWtgzq7VzHW8D52/ZYAkfX8cl+bs
	YIgs904ATwV7JncKJ7pWBX0+oWHkQ/Obndb3MrrU7mpAWr28wzpWtFOb8/22QVRBBPpm
	DMrA==
X-Gm-Message-State: APjAAAXCfjjwN9YV6D5v0CNGLqjGshWiTbKZla7gN8aRL1W0ezcQVotW
	9/x8O5Ghy2R2tKwq6Pmo9w+5l0E+
X-Google-Smtp-Source: APXvYqxgy5I7Mp6kQEcH/SCgS6M1nh9Vdx0fEQO5qy6m5r+ThJcYLSnLMekcn1Ymd/DPFTq5mCF+og==
X-Received: by 2002:a1c:eb07:: with SMTP id j7mr3704323wmh.138.1556831402168; 
	Thu, 02 May 2019 14:10:02 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id y184sm523486wmg.7.2019.05.02.14.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 14:10:01 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 22:09:38 +0100
Message-Id: <20190502210944.62696-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v6 0/6] systemd stateless configuration
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
X-List-Received-Date: Thu, 02 May 2019 21:10:01 -0000


This patch set is largely Jonas Bonn's to move towards a "stateless"
configuration:

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

However as a result of the systemd 242 upgrade, which includes 01d2041e41f4
("meson: stop creating enablement symlinks in /etc during installation"),
services such as systemd-networkd are no longer enabled in images.

This patch set fixes this problem in addition to satisfying the goal of
moving towards "stateless" configurations.

The issue with respect to image testing during CI was caused by
systemd-time-wait-sync.service being enabled due to the lack of a default
preset policy:

https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto

Changes in v6:
- switch configuration to simple overrides in /usr/lib/systemd/*.conf.d
- make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf
- don't exit in postinst as when that executes we're actually a
  concatenation of all fragments
- validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`
- rewrite systemctl-native in Python
- moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
  run for all images, not just read-only

Changes in v5:
- rebased for systemd 242
- install default preset distribution policy of "enable nothing"

Alex Kiernan (3):
  systemd-conf: simplify creation of machine-specific configuration
  systemctl-native: Rewrite in Python supporting preset-all and mask
  image: call systemctl preset-all for images

Jonas Bonn (3):
  systemd: don't build firstboot by default
  systemd: do not create machine-id
  systemd: create preset files instead of installing in image

 meta/classes/image.bbclass                    |   9 +-
 meta/classes/rootfs-postcommands.bbclass      |   6 +
 meta/classes/systemd.bbclass                  |  41 +-
 .../systemd/systemd-conf/journald.conf        |   3 +
 .../systemd/systemd-conf/logind.conf          |   2 +
 .../systemd/systemd-conf/system.conf          |   2 +
 .../systemd/systemd-conf/system.conf-qemuall  |   3 +
 meta/recipes-core/systemd/systemd-conf_242.bb |  61 +--
 .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++--------
 .../systemd/systemd/99-default.preset         |   1 +
 meta/recipes-core/systemd/systemd_242.bb      |  26 +-
 11 files changed, 360 insertions(+), 270 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf
 create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
 create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset

-- 
2.17.1


