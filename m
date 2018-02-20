Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 70C9678704
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 00:51:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t74so18298750wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=cELsNYmSRyNNJBdX0Qnwse3eUYvSMuB+D5HpFl+aLBM=;
	b=YGSer+s4ECVcaYCN9VELVY/JM+382FN07tKmsO4OFENGJL/yEZYVp7885TRA3bpOZC
	xAKaB0M3LjUWU8ITfVzS9Oe4h9l+oFOn/TVBhzF53vgCEJ+8AYgkqxKFNZ9/wr/dAMMD
	dVkG1+Rx0CUWxuhueCKSikkx11TrF4TRPNTX/kEvrIX6hBpPoSLf/orufX2v5kUSud1z
	creU20xGlVDiEuHzsXYzw/0gpaMsLBzImYjg2Uod4cSS5N+fziTAybUnsgZP0Gd2SGUb
	EUOFPdqtuVc+pcV3s7KB5Ok7f5t62mqqpms4H9zQBWatV7ioaPPw7OJBkW83QUvkdNCJ
	73tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cELsNYmSRyNNJBdX0Qnwse3eUYvSMuB+D5HpFl+aLBM=;
	b=tSqXpZpcbExSZZabDbvsFM7jEUlX4R9XuN5464UDps8W1gXxFShIj7xvazjlOLDxS4
	yDxvRY6y1vVFgpvTzML3iSLkRfoSebkeuTunr6cWXtvO/MxVOjbAJLs8PMBa1/6mwFSI
	QCMppyGHT6atdKDai5085XsDTouNfH8IwydyTsRtFvQWXOifmO9eIhmtJQXwB52PHCRR
	LIDROtU9vy0Ygi8pYzgIYQ5of+Xoo1WcJ6gdq6qYbrZnnA9WFEtYfARh9VVKCPZRWXN6
	F4iqExWhJ+i7+faRv08NLAOxsNiJBkw4PLZ8XD6RUMu4hA25Sjkb4AOr+826xPLIs0Bc
	8XBw==
X-Gm-Message-State: APf1xPBxuQTlbw2gTXXe/TwZbt/tZinotIxuCPzG3eg8xTY2rbG/tCEy
	/4q4xeqjPl34mU7jQqdg0+9ci4Bg
X-Google-Smtp-Source: AH8x2240QiSYqBb8yJyGBTgmKytaZkfmE/SDQkiqS7hwVFUr12/ai1mbEUJFQpW3mX5KeZMqL9fQXA==
X-Received: by 10.28.158.197 with SMTP id h188mr4685112wme.72.1519087890831;
	Mon, 19 Feb 2018 16:51:30 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c14sm18606211wmh.2.2018.02.19.16.51.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 16:51:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 00:51:22 +0000
Message-Id: <20180220005123.12127-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] libtirpc: stop dropping in NIS headers
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
X-List-Received-Date: Tue, 20 Feb 2018 00:51:30 -0000

libtirpc prior to 1.0.2 assumed that the system provided nis.h but this isn't
always true.  Until now we've been using a tarball of the missing files from
Gentoo, but libtirpc 1.0.2 added a copy of nis.h to the sources so this isn't
required anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
index f9718c576b6..1a73de9db05 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
-           ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://export_key_secretkey_is_set.patch \
            file://0001-replace-__bzero-with-memset-API.patch \
            file://0001-include-stdint.h-for-uintptr_t.patch \
@@ -20,19 +19,13 @@ SRC_URI_append_libc-musl = " \
                              file://Use-netbsd-queue.h.patch \
                            "
 
-SRC_URI[libtirpc.md5sum] = "d5a37f1dccec484f9cabe2b97e54e9a6"
-SRC_URI[libtirpc.sha256sum] = "723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5"
-SRC_URI[glibc-nfs.md5sum] = "5ae500b9d0b6b72cb875bc04944b9445"
-SRC_URI[glibc-nfs.sha256sum] = "2677cfedf626f3f5a8f6e507aed5bb8f79a7453b589d684dbbc086e755170d83"
+SRC_URI[md5sum] = "d5a37f1dccec484f9cabe2b97e54e9a6"
+SRC_URI[sha256sum] = "723c5ce92706cbb601a8db09110df1b4b69391643158f20ff587e20e7c5f90f5"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-do_configure_prepend () {
-        cp -r ${WORKDIR}/tirpc ${S}
-}
-
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.11.0


