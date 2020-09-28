Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.40658.1601309951113409062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4E7F31B
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6156E3F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:10 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] sstate: set mode explicitly when creating directories in sstate-cache
Date: Mon, 28 Sep 2020 17:19:00 +0100
Message-Id: <20200928161900.452970-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When creating directories in the sstate-cache, explicitly set the mode
passed to mkdir to 0775 so that the directories are group writable, as
otherwise they cannot be shared with other users.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 66a96a7603..a8ae75101d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -787,7 +787,7 @@ sstate_create_package () {
 		return
 	fi
=20
-	mkdir -p `dirname ${SSTATE_PKG}`
+	mkdir --mode=3D0775 -p `dirname ${SSTATE_PKG}`
 	TFILE=3D`mktemp ${SSTATE_PKG}.XXXXXXXX`
=20
 	# Use pigz if available
--=20
2.25.1

