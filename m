Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5857C07B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:30 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id h81so823986ybg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iwr8i+X3FUoa1i1yIZ7NoaQwhAoG+ErLnp9qB7RZGz8=;
	b=ds+Pgc1dnBayVi6HHuBXtcqUolxOKda/a+rvdS5aKqEKcYXnSjxbgKgMvUmApRObU/
	suiIJQOtNG9oeQ7Klie4TL+9eylhLbntdEMJJjNUIRtVdCK0ClcL92KAaPqrGTSVF2EG
	x3xrccpUrBq0kHfdshlA7C4S6cGP5V95IIt4jaihtaIZEzftPQHsXTw6Lk6kkr0x1eKR
	QGy7fFqz+5vNhI0ueNK3zB2StvERfHcYKSGTG01A+mBuKWsuQPlKl5f+QIi1rs+FqQ5c
	VBtBz6UZqPQdtSYcjjeXB70CZ+C0Jb1yI41pFmfwwUAC9g5JTWfbF1HFg/0CEaJ9nEYY
	I8KQ==
X-Gm-Message-State: AJcUukd/chAr5CIm5pZ20fK+PgVaup91P1ySzBkWf5OGIa+GNBfkZy/j
	otLzXN08ZcfV3KT1GyocffgPW7S6
X-Google-Smtp-Source: ALg8bN67JSW55XrSgw06X/9EFcdPguAhDD5B3ue4vle94pzBpbaVmHnA9jjOjRq/jAv4dzEVMyCgNg==
X-Received: by 2002:a25:420b:: with SMTP id p11mr3334578yba.1.1547563531106;
	Tue, 15 Jan 2019 06:45:31 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:30 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:11 +0000
Message-Id: <20190115144525.29388-2-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 01/15] util-linux: simplify version upgrades (MAJOR_VERSION)
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

There doesn't appear to be a need to manually and
explicitly specificy the major version (for the
download URL), it can be deduced easily from PV.

Do so.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc       | 3 ++-
 meta/recipes-core/util-linux/util-linux_2.32.1.bb | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b5f77f7b6b..a1702da5b4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -24,7 +24,8 @@ DEPENDS = "zlib ncurses virtual/crypt"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
+MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
            "
 
 PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
diff --git a/meta/recipes-core/util-linux/util-linux_2.32.1.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
index c909836cbb..b0492afff3 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -1,4 +1,3 @@
-MAJOR_VERSION = "2.32"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
-- 
2.20.1


