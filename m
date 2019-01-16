Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5C87C19C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:28 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id n78so2436225yba.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=86jxYT/Dt33YelrfjYqkuBkcXSI0kfMMrm0pNxp5/vc=;
	b=Bi1A45PokYPoGKFcno0sT9YgubOadJOnWT6RZA1uNkaQJeld1WRXSnJiyfwCMes2nd
	LmPW8yBHI1TQupDOGpWxwyR9uMbxDEKvK7ihutPewSf5c4Iot6oVypFtXmrmy6iwBUck
	IKussZ9EX9RpqmzjwZk1YJL0Yolw1vG3NuZLBGhopcz3v7nx1H+O8ZuF7FLC3h/jMdrI
	vhjzc+sRwWY+H7NIw3r9865pRh6AaaeLiQrSSijk1V1Ijlz4OMw6Jv5YO8FfH9J4YplZ
	0XAWCQ+dC3kLR3MV5HlK0FGlGgwquxHUE2BskgIR4UZLi/6cKou+OoJClxbKV+n7yhHT
	frfQ==
X-Gm-Message-State: AJcUukfa+C2N03/URLsONDrLz2boXLZsXG9C+BQStChe86BMhmveQ7Q+
	Llvs8RIsnQQwWOC2skAkQWWwiUcP
X-Google-Smtp-Source: ALg8bN4ckkp6kbP6Ay4AJdgRXZbdi0BhSZ/5PN16rUsUP3eiEuASxW/JsCTmj8NbBbf9JBAztmpfbg==
X-Received: by 2002:a5b:546:: with SMTP id r6mr7784063ybp.174.1547643089203;
	Wed, 16 Jan 2019 04:51:29 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:28 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:10 +0000
Message-Id: <20190116125124.20177-2-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 01/15] util-linux: simplify version upgrades (MAJOR_VERSION)
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:28 -0000
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
index e514041a19..7bfec80508 100644
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


