Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAC375219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:29:39 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c198-v6so4176984qkg.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 11:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ImngK/ubtjlolimVspbbuRhPL61guZL1d/RVBRoWiiI=;
	b=tVEnWgzDDc/+hwrRMgRCncb0LjnV45Khcy2U9K9TRYRJC/NKcY6SreLOXXtpI1daUK
	XXfesT+O8HBaBtLP+01HzlbRY2+YJPo2I/hzVFJm1kaj/NEs9v/t9KZq8ocF2YGQ6sIn
	ZCT2E/8YAU5aQ7my3RKMdPRR6THeFgwdzUj/oMro2kxFgtXJPLm+mXj9jTj753nbno74
	0Qc3hWTwdvlrjEc4A3GUZC0O3xykPide5yZrBw9+C5Nlpd5n2/0atFxxQ8K6VVs/mbj7
	chR+AtiNzw9XN1+SLVlgamJ+aB2Ul7qFCNIg4+n2GcLtDMJHMl/RoliUrJwR7j4gHavM
	MniA==
X-Gm-Message-State: APt69E3yAwgr4Z4Uzto6cvUukKCVc5WSzYOS3w27wYkvrPsgVYF0kaLs
	hEb93M/UiJ+/apwBbFkH2x2Tbw==
X-Google-Smtp-Source: ADUXVKKH3CPNsYASyKQhNvFazJeLLydvIQgUJD68k3okENAwk3X3RsVqzJevS+cmNM+rRRcJsxe2sg==
X-Received: by 2002:a37:9984:: with SMTP id
	b126-v6mr2231522qke.307.1529692180270; 
	Fri, 22 Jun 2018 11:29:40 -0700 (PDT)
Received: from localhost.localdomain ([177.194.218.61])
	by smtp.gmail.com with ESMTPSA id
	u1-v6sm5264577qkd.45.2018.06.22.11.29.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Jun 2018 11:29:39 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 22 Jun 2018 15:29:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jun 2018 15:29:31 -0300
Message-Id: <20180622182931.5962-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] util-linux: Enable unshare utility
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
X-List-Received-Date: Fri, 22 Jun 2018 18:29:39 -0000

It allows to run program with some namespaces unshared from parent.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/util-linux/util-linux.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0b7db529fd..8b633e9ac6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,7 +35,7 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-lsblk util-linux-mkfs.cramfs util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit \
-             util-linux-ionice util-linux-switch-root"
+             util-linux-ionice util-linux-switch-root util-linux-unshare"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
 PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'util-linux-runuser util-linux-su', '', d)}"
 
@@ -46,7 +46,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --enable-kill --enable-last --enable-mesg --enable-partx \
                        --enable-raw --enable-rfkill --disable-login \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
-                       --enable-write --enable-mount \
+                       --enable-write --enable-mount --enable-unshare \
                        --enable-libuuid --enable-libblkid --enable-fsck \
                        --disable-minix --disable-bfs --without-udev \
                        usrsbin_execdir='${sbindir}' \
@@ -113,6 +113,7 @@ FILES_util-linux-sulogin = "${base_sbindir}/sulogin*"
 FILES_util-linux-mountpoint = "${base_bindir}/mountpoint.${BPN}"
 
 FILES_util-linux-switch-root = "${base_sbindir}/switch_root.${BPN}"
+FILES_util-linux-unshare = "${bindir}/unshare"
 
 # Util-linux' blkid replaces the e2fsprogs one
 FILES_util-linux-blkid = "${base_sbindir}/blkid*"
-- 
2.17.1


