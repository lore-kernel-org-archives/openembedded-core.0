Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D890D6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:55:15 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so9223937wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MTNr13NQ8XBDC8eCKo08wGwEo+kfxFGhi0X7zLEusiI=;
	b=UGiHnped96G5eqeWj2BZzD+5Ah9J7TSTp/njqYVO2uEjOAW3kM5TJh3yKkE7FXPlVW
	/Iwxw2WCR4+Pk8ZN3pabTJk6A5EV/8N6WUIpTbivtlN82QMrpbsh6Kc8zmCtCxI0zj6Q
	yhdptWuR+mq78oi94VvhEPitVNWXfSIbhj1dkag6QAhAvrTawjj0692ZPwRGz8t+O+E/
	IFqG3CKPa744zBvIoM2jHVnD8W5YGR8DqCDbLsZBsmt0u9d9WhU1kTsGuMUEe9hKe6IW
	nMcYfgff1oJLqPCyytddqV5YFft6HrgfzonCaie6CJ4ZpzBY1bivPqs94nL6E5RKmFdX
	sDOg==
X-Gm-Message-State: AE9vXwMHXicWwc617MZf66zuHsB7DCgEoWN5lP0kNyIontQEXp1EHrUgOH4cFocsXUioNw==
X-Received: by 10.28.29.215 with SMTP id d206mr9730206wmd.75.1472471715325;
	Mon, 29 Aug 2016 04:55:15 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o5sm9137789wmg.16.2016.08.29.04.55.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 04:55:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:55:08 +0100
Message-Id: <20160829115510.19560-2-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160829115510.19560-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160829115510.19560-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 1/3] boost: fix a musl compilation warning
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
X-List-Received-Date: Mon, 29 Aug 2016 11:55:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 ...detail-socket_types.hpp-fix-poll.h-includ.patch | 46 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch

diff --git a/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch b/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
new file mode 100644
index 0000000..0e3f005
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch
@@ -0,0 +1,46 @@
+From 40192301130dcd913aa6d9cb9dba9e5f8dbd9d16 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Wed, 24 Aug 2016 21:01:43 +0100
+Subject: [PATCH 1/3] use POSIX poll.h instead of sys/poll.h
+
+POSIX specifies that <poll.h> is the correct header to
+include for poll()
+  http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
+whereas <sys/poll.h> is only needed for ancient glibc (<2.3),
+so let's follow POSIX instead.
+
+As a side-effect, this silences a warning when compiling
+against the musl C-library:
+
+In file included from ./boost/asio/detail/socket_types.hpp:61:0,
+                 from ./boost/asio/ip/address_v4.hpp:21,
+                 from ./boost/asio/ip/address.hpp:21,
+                 from libs/log/src/init_from_settings.cpp:65:
+<sysroot>/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
+ #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+  ^~~~~~~
+
+etc.
+
+Signed-off-by: André Draszik <adraszik@tycoint.com>
+---
+Upstream-Status: Submitted https://svn.boost.org/trac/boost/ticket/12419
+ boost/asio/detail/socket_types.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boost/asio/detail/socket_types.hpp b/boost/asio/detail/socket_types.hpp
+index e8c7109..7e65d3c 100644
+--- a/boost/asio/detail/socket_types.hpp
++++ b/boost/asio/detail/socket_types.hpp
+@@ -58,7 +58,7 @@
+ #else
+ # include <sys/ioctl.h>
+ # if !defined(__SYMBIAN32__)
+-#  include <sys/poll.h>
++#  include <poll.h>
+ # endif
+ # include <sys/types.h>
+ # include <sys/stat.h>
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index 1116444..41ff203 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -5,4 +5,5 @@ SRC_URI += "\
     file://arm-intrinsics.patch \
     file://consider-hardfp.patch \
     file://boost-CVE-2012-2677.patch \
+    file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
 "
-- 
2.9.3


