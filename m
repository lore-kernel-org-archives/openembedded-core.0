Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9690D7E873
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 11:22:02 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id w13so26682472eds.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IwP4OK6QTVf1YgJhAxnN0ZZHdHTp5Anxe9lT5Q81VV8=;
	b=lO4ED2q/gowQBJaFzVZ3DNIMC0tiy4B+ewSoxZ4ZH42zUgEtbvemWy8IkDKplq9d5R
	QNaDRRJ7NHEgEOtr4S8WDJ0XfiIuBOxkhbB0umfcvE98aIPyE6B+xS7qKvrivW4lyPey
	VboWGAYiX/xl7VAkz4MUlFuNzr6nBXZBRZPJ5qBEXkCZYT9BDPY/iCXlJhKJMkETbZxs
	TXjacKIvraEDToC7zHfsbS2XNX5AEJRdS1lVinjAgzsa71dNAAyOpC0Xq4/rxggzyMyg
	K7GNSmz0qnEahj/i5IYb3X5CiQWjkrphRGoXmhGdNfYR1hc7tM9n1OsC/uF3YYNLZzN+
	E7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=IwP4OK6QTVf1YgJhAxnN0ZZHdHTp5Anxe9lT5Q81VV8=;
	b=qeEfgUsrjVVIqjxMUJmI+iw7Q+r+S/+H8iE+jsN8kgKvqEuWbllCa8U5EywWDxxNbC
	0miwxOF/G3eW7t3+XhBpTl78HwOifTjHusqQne9/CkZaGfGyFJx0t1KasnSZolW/PV6A
	48rYr3qSecTJF5KtMPrZYGvevPFXFIvOiB0UNCowOlVnvItEFaDbaOtEWiyKl6OqLRZZ
	PMyZ5GfZHTeqXZgTUi1+JPfHEpJDQsp+xZyfG18tc4iGElDXeAMdFZ1suljACjrMjrUa
	BXb0fx0WwaB3y81flQdNpYXjQWaVbRPnCuhbc7rr7yf+KvOsKWfy4KQEeB8d2ZyvHTg5
	xKwQ==
X-Gm-Message-State: APjAAAU+f+GF9r5KOrThTwxY0jwFqutOC1Pw0iRWI4EfvPDE/W0rkk3Z
	ahd+0GocH5tau9SHfrpCyDhGMnmPoSU=
X-Google-Smtp-Source: APXvYqzbZN4gV8LQssJYm4FYrtDLUz1AFNI9HjRjfDxjtT6dqZCizKhNbVUnpCuh0C+Ad+U7PUBuYg==
X-Received: by 2002:aa7:c99a:: with SMTP id c26mr37940646edt.118.1560943323023;
	Wed, 19 Jun 2019 04:22:03 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 93sm5528438edk.84.2019.06.19.04.22.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 04:22:02 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Wed, 19 Jun 2019 13:21:53 +0200
Message-Id: <20190619112154.9464-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v2] dpkg: Use less as pager
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
X-List-Received-Date: Wed, 19 Jun 2019 11:22:02 -0000
Content-Transfer-Encoding: 8bit

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

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


