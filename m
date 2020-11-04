Received: from mail.bubus.at (mail.bubus.at [81.19.156.191])
 by mx.groups.io with SMTP id smtpd.web11.13290.1604499963041186506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bubus.at, ip: 81.19.156.191, mailfrom: dev@bubus.at)
Received: from brokenbit.skidata.net (83-215-125-121.lhau.dyn.salzburg-online.at [83.215.125.121])
	by mail.bubus.at (Postfix) with ESMTPSA id CFE6F6C20001;
	Wed,  4 Nov 2020 15:25:59 +0100 (CET)
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] weston-init: introduce WESTON_GROUP
Date: Wed,  4 Nov 2020 15:25:32 +0100
Message-Id: <20201104142532.73949-1-dev@bubus.at>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Richard Leitner <richard.leitner@skidata.com>

Currently the WESTON_USER variable is used as user and group name for
chown'ing XDG_RUNTIME_DIR. If WESTON_USER has no group with the same
name this fails.

Therefore add a new WESTON_GROUP variable which is set to WESTON_USER if
not specified to ensure backwards compatibility.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/met=
a/recipes-graphics/wayland/weston-init/weston-start
index ccc7093425..0b93dc964a 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -33,6 +33,10 @@ if [ -n "$WESTON_USER" ]; then
 		echo "ERROR: If you have WESTON_USER variable set, you also need WESTO=
N_TTY."
 		exit 1
 	fi
+	if [ -z "$WESTON_GROUP" ]; then
+		# no explicit WESTON_GROUP given, therefore use WESTON_USER
+		export WESTON_GROUP=3D"${WESTON_USER}"
+	fi
 	weston_args_user=3D"-u $WESTON_USER -t $WESTON_TTY"
 fi
=20
@@ -75,7 +79,7 @@ if test -z "$XDG_RUNTIME_DIR"; then
 	fi
 	if [ -n "$WESTON_USER" ]
 	then
-		chown $WESTON_USER:$WESTON_USER $XDG_RUNTIME_DIR
+		chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
 	fi
 fi
=20
--=20
2.28.0

