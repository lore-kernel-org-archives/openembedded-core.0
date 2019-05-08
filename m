Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9531A7DDDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 15:57:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 198so3928351wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 08:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u93S2Mr9HZX8F7JhUTE24sPjgF7wAPGPXZ2de/J2CVM=;
	b=duqRkGV5W6m4uLVcqbE7ESgFZIsYiYT/PNCRA3RmkOnSRbL2RvBTzgDkP0AGQmZgNX
	vyXP0akZAaDBa9Zlmmsul7P1wiJggC1Ms0p66vl8ypVhj/QUZS5tzO7aQUsjR2I1wsw2
	r4HFCp6XSzQVu8unYuPo6acxNC2ylAOeUGX5MQuWj0c9tH6wRhjAwtt5HCOvbwUL6vHH
	KEx3MGv490b5Vwt8DLfK8cO6J3QhviIBBM2mdiTW34y/9rbNNndTVltJMoO4mNZGhcOu
	QPVKlaOdL8cLA1lAxvuDVpd+/4kxjt9mx/6oTWkwkUikM219BzR5xBVgkDjsd9YKsV56
	TgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u93S2Mr9HZX8F7JhUTE24sPjgF7wAPGPXZ2de/J2CVM=;
	b=ETPAcbBUbGCjEiVCGJHhdI6DE0mi31Z+OkJxBbShDYvmMNcOnziy4sLebgj0gTtvO1
	yobP0DYje4n4buQDwdMbFsx9rtFtH2/IctZ3R9unrCjaJDQgbaFYuatXXypLZSURmfm5
	/2isj6k5xroXdI6YhMmY8Zbh0LdGHXx97DW5FA5TVLAA4fidII0XHsF7DEplftPnYtno
	jCOyu+rNVfchKjgvWtTBrp0b3MDUs9oGCVRP+Il4kZt+eo7K3CgaqrgYIu9dLMWIGt80
	7QPGYFFkNyRD0kFrZyBQqbERnIAm/u018oLAef34F1RuZ8pvyO01rTSBWDgKsWjBMFse
	YANg==
X-Gm-Message-State: APjAAAWrHB22meiDf7LZ0+yXf2WSDCKckA2QNF84VIvc6WEXqy7W1RS2
	wI5Z+8NsieXc5t4UQoeS6rTAvkPv
X-Google-Smtp-Source: APXvYqzZJvH2u5fNbH57hqN+6DXdpxBPxOpWkamsva8bDbmdWZDhuNu/D5qTwD+OGPh2Yuput7PoNw==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr3549161wmb.13.1557331063024; 
	Wed, 08 May 2019 08:57:43 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id m6sm4027175wmc.32.2019.05.08.08.57.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 08:57:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:57:25 +0100
Message-Id: <20190508155728.66729-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 0/3] Fix mask, preset, enable and restore /etc/machine-id in stateful images
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
X-List-Received-Date: Wed, 08 May 2019 15:57:43 -0000


The recent changes to systemd.bbclass broke support for
SYSTEMD_AUTO_ENABLE set to anything other than "enable" or "disable",
whereas there are existing users for "mask" and "preset".

In addition /etc/machine-id was not created as an empty file which
caused systemd to fail to do it's boot time update of it if the rootfs
was ro at boot.

Finally instance creation from templates whilst present was no longer
correctly exposed.

Changes in v2:
- use stateless-rootfs in IMAGE_FEATURES, not DISTRO_FEATURES
- restore support for enable command
- restore mask and preset targets, fix instance creation

Alex Kiernan (3):
  systemd: Default to non-stateless images
  systemd-systemctl: Restore support for enable command
  systemd: Restore mask and preset targets, fix instance creation

 meta/classes/image.bbclass                    |   9 +-
 meta/classes/systemd.bbclass                  |  37 +++-
 .../systemd/systemd-systemctl/systemctl       | 186 +++++++++++-------
 3 files changed, 142 insertions(+), 90 deletions(-)

-- 
2.17.1


