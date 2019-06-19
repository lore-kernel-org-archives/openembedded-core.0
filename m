Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 89EF77E740
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 10:32:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m10so26464889edv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=09zDirjnLwH68NWcPjM3bXQs9Bjfaywut6ZXRdt94N8=;
	b=ojO0eNfaOMS1fQQBJJeCxYJSeItOTnzHn6vJkOLv2Rj5HczNQJeWytMGyd4vRzY2kj
	xB6REUtWCX5JpMFZ1buUVvbVvJ1GTsNhSHsA9zD9+Obt+b6QkQ/l+FEAnNLZD9kXACH4
	uAYuRGqhwaHiRk7ROf1tsZVwP0RscmuKvSeAhCGN24HNSDWKvVZq8qa5LfHH+6Gep2Rs
	Nu2uT9R3W0M8kJSJeF/wzRnergpSkVnfEm3kEDr2DtbppKOjVwb4SrbQtqQcoQR/R6GY
	2Z6SZqGHMqiCNRqyX5h8U77BCYkutS6NKDU3JpJmQ4BPQKNZ4gW3RxhCgoLgxw+HB9La
	wXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=09zDirjnLwH68NWcPjM3bXQs9Bjfaywut6ZXRdt94N8=;
	b=ptONbVn3EA7H6HnZDo2UgBStGMdrH3cr0d2V+Y62vSOXd75dSV+y+jSARsQ4jz/vMc
	ZYHJJ0j7pqHE4+zdORpRGdD/gG7b26setbEZBFFZbiQ5UcWlmL5P24vZJjoScBhDEdUZ
	AqnTRvc3dRe6mrx8KMblGAfIcskKhi6sLBDCD66VgYgSmpQ1GdaZqqONVfktMy2A5oI1
	JgrwhQ1VTrGr6Ws5rSlBR/wrT0cQUliGYXqC8DIBlhDOd/8A4xMLHz6KWUFIHwg6WSJY
	N/KBfbVwPrNwe4J163pSmWNB9VwcYX9Li1uXd+oGkkMSiYeSRHVvBPVYIQFuZ7HGHPHr
	d1Ag==
X-Gm-Message-State: APjAAAWGjrQLMBG3ziU7798B1LfRe76Bex4mq5aUqBadafm/iXLG/rSk
	2mJedzN2VeA579rmQ5Cm8cfdcs4N7Ig=
X-Google-Smtp-Source: APXvYqzibUCTCVGntiLo9ALZpSAsZY08wnIxe6BBsQoBp9y7pJS6MG3RtUbzyQPQ3PXVbQHLY4JyBA==
X-Received: by 2002:a17:907:2114:: with SMTP id
	qn20mr87974822ejb.138.1560940376757; 
	Wed, 19 Jun 2019 03:32:56 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x21sm3491075edb.0.2019.06.19.03.32.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 03:32:56 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Wed, 19 Jun 2019 12:32:51 +0200
Message-Id: <20190619103251.28854-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] dpkg: Use less as pager
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
X-List-Received-Date: Wed, 19 Jun 2019 10:32:56 -0000
Content-Transfer-Encoding: 8bit

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc         |  2 +-
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index fee7a75814..21ebf2d926 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl less"
 RDEPENDS_${PN}_class-native = ""
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
new file mode 100644
index 0000000000..e56b9d28af
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/pager.patch
@@ -0,0 +1,21 @@
+pager: Use less instead of pager
+
+pager is a Debianism. Istead use directly pager.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Suggested-by: Burton, Ross <ross.burton@intel.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
+index 2bb067a..6cbce80 100644
+--- a/lib/dpkg/dpkg.h
++++ b/lib/dpkg/dpkg.h
+@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
+ #define MAXUPDATES         250
+ 
+ #define DEFAULTSHELL        "sh"
+-#define DEFAULTPAGER        "pager"
++#define DEFAULTPAGER        "less"
+ 
+ #define MD5HASHLEN           32
+ #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index 77fbfb5c91..b83868fec0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.20.1


