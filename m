Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1Ue3uR-0003bP-8X
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 15:44:24 +0200
Received: by mail-da0-f43.google.com with SMTP id u7so3351174dae.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Sf925aZWMymQ5bewteDA0hywZEpDLVwVcSjeOSD/j0Q=;
	b=qNSqQi9B+N2EGd/E/kWGnQ7lF2fc1DKPgdYQLbbvXFLEylloz1vvASWRU06V7wctq7
	EOwnkLG7sPGtV8KaYCEiaOrLS9Wq+z3LFkS3GdXaNVyqnhTcU+sC7PBnWs/9JpNbHbMI
	eCJcdnXZTLIIt4rtmaa8QuiQfV87XFO67iVU8O+/YTyz6h0733Fno5P3hQFs2ldl6vu6
	dg66vnZJkBgA4xzLS2UOS5KIeBQyvxoVxLvM+VwoUDTB3Le7i/43IPn2w5FwFwTaVYX1
	eq6j16Kq8q2L2JyfkMWI1sUt3hhNX7yO0k+8Iox5uMcADt1DqYxAoc7vmBAypYNbu7nq
	rCUA==
X-Received: by 10.66.27.17 with SMTP id p17mr56138520pag.108.1368969963726;
	Sun, 19 May 2013 06:26:03 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	vb8sm19733627pbc.11.2013.05.19.06.26.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 19 May 2013 06:26:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 May 2013 23:39:06 +1000
Message-Id: <1368970747-4760-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH 0/1] base-files: add /run directory from FHS 3 draft specification
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 May 2013 13:44:24 -0000

The /run directory needs to exist when using systemd otherwise startup
fails with the following error:
systemd[1]: Failed to mount /run: No such file or directory

This affects directdisk and vmdk images but images using an initrd do
not appear to be affected.

Tested with sysvinit and systemd running core-image-minimal qemux86
under QEMU.

Jonathan Liu (1):
  base-files: add /run directory from FHS 3 draft specification

 meta/recipes-core/base-files/base-files/fstab             |  1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb         | 12 ++++++------
 meta/recipes-core/initscripts/initscripts-1.0/volatiles   |  7 +++----
 meta/recipes-core/initscripts/initscripts_1.0.bb          |  2 +-
 meta/recipes-core/systemd/systemd/00-create-volatile.conf |  2 --
 meta/recipes-core/systemd/systemd/var-run.conf            |  4 ----
 meta/recipes-core/systemd/systemd_199.bb                  |  5 +----
 meta/recipes-core/udev/udev.inc                           |  6 +-----
 meta/recipes-core/udev/udev/init                          |  1 -
 meta/recipes-core/udev/udev/volatiles                     |  1 -
 meta/recipes-core/udev/udev_182.bb                        |  2 +-
 11 files changed, 14 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 delete mode 100644 meta/recipes-core/udev/udev/volatiles

-- 
1.8.2.3



