Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id DD1C5771C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:24 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id b35so109280178qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sHaZe5bgot/nYAz+caHCASUlqKKoWU4EIBPL2gSqpk4=;
	b=P8UMG7vl3nYZ2RTauvDQcCe8qKcOJtTpxdWTGOe+520nlnsNfzi3rglZZ78NQGl/Fd
	4YF0JeOgFXGckxHBchG2XvQiFdZOEk73npeHvJHXZCFzBiqo+ULdA3KnfBgUUlH6ZEqe
	/YzmCXVUHH4L3RwpEi8Rgu3ClBl6kSs1G8KszuJMw9bYvDc7uiFM6J0y/GanCjmLrOMf
	2vrjGA43QVCH9ZzUrWSWqVFcvYX9oVQR2nGjYDVyTCwZYdxZUpsuILVrtHtto5+gbqk7
	I4QVAVca2E4IB+Jo0Y7Cck937a7n8tq+I5G7HwUBFISAcKf6YuMhptdpubkV5IPxHd1m
	XW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sHaZe5bgot/nYAz+caHCASUlqKKoWU4EIBPL2gSqpk4=;
	b=CWeL6sjOu3kjB0L/bB67FfwCa9ZvXzcSdF5kgx0ijO9BLUYF+DITUip+LYIYAmnLdB
	rYXxJbZ01OqerNafJvNrvCsBD43WPW6hg7C/XGRuMzOlvP7gQL0ThCnIVtLY485hfHtj
	KpgiSBPhnFU7FwRQraRd1MgWdwNBHeFIOGHvjN0vwPScSw84sdnQjYiX0GXXKwuFecKS
	9LurAjldIonvB1A6NX0BnM8GKvxxJ/00/wbGV9e5541TG3QJnD4W6PfZD/1ARTNqGl/S
	CLSF+6MLdq/+3Qb7iJjbYBk5TIw+uD+ybprgja9u8n+JBdqAEooFXzc058bHgHI6AffA
	L7cA==
X-Gm-Message-State: AG10YOQ5iKzo+8o6EW9Vm8vbAyH0KNfdPo6LONcsO4K3M7kTC+Cl2xsVMN4b+zqnzR+9sA==
X-Received: by 10.140.150.131 with SMTP id 125mr27209328qhw.91.1454303304961; 
	Sun, 31 Jan 2016 21:08:24 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n83sm12539739qhn.20.2016.01.31.21.08.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:19 +0000
Message-Id: <cover.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/8] Musl related and misc fixes
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:25 -0000

Fix few more recipes to be able to build on musl
Cleanup cruft left after pth removal
libtool-cross for PIE link issues
db to use cross libtool to avoid link errors exposed by clang
boost VFP issues seen on qemuarm

The following changes since commit fd75637d97cc3d669229e59c1d21ce7038fc92d7:

  native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS (2016-01-31 13:29:38 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (8):
  libnss-mdns: Check for nss.h before using
  nss-myhostname: Fix build on musl
  distutils: Consider S != B case
  pth: Remove dead code
  libtool-cross: Unset pre|post dep objects
  db: Use cross libtool
  local.conf.sample.extended: Document HOW-TO enable systemd or busbox
    for init system
  boost: Fix build on soft-float ABI arm systems

 meta/classes/distutils.bbclass                     |  27 ++++--
 meta/classes/distutils3.bbclass                    |  26 +++--
 meta/conf/local.conf.sample                        |  25 +++--
 meta/conf/local.conf.sample.extended               |  28 +++++-
 .../libnss-mdns/0001-check-for-nss.h.patch         |  56 +++++++++++
 .../libnss-mdns/libnss-mdns_0.10.bb                |   4 +-
 .../libtool/libtool-cross_2.4.6.bb                 |   6 +-
 .../boost/boost/consider-hardfp.patch              |  19 ++++
 meta/recipes-support/boost/boost_1.60.0.bb         |   1 +
 meta/recipes-support/db/db_5.3.28.bb               |   1 +
 meta/recipes-support/db/db_6.0.30.bb               |   1 +
 ...tname-Check-for-nss.h-presense-before-use.patch |  51 ++++++++++
 .../nss-myhostname/nss-myhostname_0.3.bb           |   4 +-
 .../pth/files/pth-add-pkgconfig-support.patch      | 105 ---------------------
 .../pth/files/pth-fix-parallel.patch               |  48 ----------
 15 files changed, 211 insertions(+), 191 deletions(-)
 create mode 100644 meta/recipes-connectivity/libnss-mdns/libnss-mdns/0001-check-for-nss.h.patch
 create mode 100644 meta/recipes-support/boost/boost/consider-hardfp.patch
 create mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname/0001-nss-myhostname-Check-for-nss.h-presense-before-use.patch
 delete mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/pth/files/pth-fix-parallel.patch

-- 
2.7.0


