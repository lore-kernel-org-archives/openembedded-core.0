Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2120F77E65
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:42:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f27so11081031pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 21:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+boB4codxxBUw1YY+lwTbuzcg5CJ8dEindgr1s+wo3s=;
	b=bKikKRsT2kEH/ZlhQ/mQ/Vxo3zSeW8AnTDUIUuTlnvf9dpcwZxPadXvoKUGboW61ON
	1LQ2iARW1NGVK9VRSfuWNbWxI5daN+fKM98pCoGTjNGjlpjgKLhf5H1WUglE0HJ89Sjf
	sv4kNuYqGHxlE7vbQKNt2oAPkv1D0bQn4ntPQG/+mHta2b0lU+tQKVgC2A8Mph/INPk7
	QKT/v59LN03bXRcsMDhacYZEc+WUaOHLgRVVqH0z9QYA6YEdXrsd4qtm47h4tBJroGk8
	KcZZKEsao+9ZWXIP9XhTo2KngDd8nhGAZarBbx/D9MMSVA3bu0JqcREZalYwihGMz3kF
	yKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+boB4codxxBUw1YY+lwTbuzcg5CJ8dEindgr1s+wo3s=;
	b=Ke4rPADcCFZ3ITDQpASzxGVZgnDU5+770iw+3/PbxbuduVkruXY1bXi8VNSAgIQQCy
	29KoUBG89xdU8xTuF7qKz3nDJdv/XiViZPx7qJXoBB0UHr3BLc5Ezr2V/uPNa4NA1b/h
	pi+n0xK7G4FfhS1PfoYS9B9ufXJdu+jfTl0xSrQLgeX69F5NAK62FouvlzNLmJVFPpwU
	xCqplRCD9HOjfLuNA3LUmHnafyYNPclQg6R7qlD/bmGOyAN/FQXm8hIpEp7bNdagE9TZ
	FT1S00S50y7GEod2UVefmIEE9yOLUgrRlTV/N0ITjHdlyW99WKMPGgljUAxg34ecIZmS
	ZHtg==
X-Gm-Message-State: AODbwcA+hFywDi+Jq+YBDGNwf9wUDcwrw6I3GMjqNqidxHlKnJXHl26q
	qXIsD4QNNnhpGqZc
X-Received: by 10.99.142.75 with SMTP id k72mr4936023pge.99.1496378525438;
	Thu, 01 Jun 2017 21:42:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	t66sm37003163pfe.134.2017.06.01.21.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 21:42:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 21:41:53 -0700
Message-Id: <20170602044153.9629-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602044153.9629-1-raj.khem@gmail.com>
References: <20170602044153.9629-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] setuptoools.bbclass: Do not use -pie with hardening
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
X-List-Received-Date: Fri, 02 Jun 2017 04:42:04 -0000

Fix build when PIE is turned on. It tries to build
.so file using -pie and -shared flags together because
its doing compile and link in same step CFLAGS and LDFLAGS
are combined and does not work, ending in errors e.g.

| /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-musleabi/python-pygpgme/0.3-r0/recipe-sysroot/usr/l
ib/Scrt1.o: In function `_start_c':
| /usr/src/debug/musl/1.1.16+gitAUTOINC+179766aa2e-r0/git/crt/crt1.c:17: undefined reference to `main'
| collect2: error: ld returned 1 exit status

This error while cryptic is due to the fact that we are
building a shared library but also pass -pie flag to the link
step after specify LDHSARED ( which is -shared linker flags )

we can not use -pie when doing shared libs. This is true for all the python
modules inheriting setup tools

Disable the pie flags thusly for all modules using setuptools since
this setting is done in setuptools makefiles which are then used
during module compiles

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/setuptools.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 56343b1c73..7d0c5267d7 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -6,3 +6,5 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.0


