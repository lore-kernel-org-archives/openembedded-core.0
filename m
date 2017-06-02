Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EDC3A77E83
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:17:17 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id e23so356988wre.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+c400+Wq9QQ7khhEtRHSGUHXNV4Pl1gL4BmbgmMBoss=;
	b=sqNznAQfUgnmlXQFupldgrmfnH/0ioEmAkKrMcdeTLt5McQXsCFhha6NM6HAEDbnRO
	Tk1yLXAIXbHaV77Zy8fGPEhUxcnjcHbZk2JPZ0msJCzPyxLYmXWD6Q5Mg/SvA3lOFwx5
	IEA3n9Pz7UCQ4q4GC0iQRxoolqLyXFuYq+Jy942cR02I5CgHWnZZH+5okMMiID2zUbV7
	CVLfPUhpkJJDfKMu+CutrUqJ8XMVvXmSDmHZ6quIzqk6j1OFbiq4cp8AuR8JeigXOi0f
	zs99YOhS20hmjzSSo4fSBhthLmqtu4rFea1sX0jxyUPy9wnzrSMob3Y7Px6+RgWN5QPV
	dN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+c400+Wq9QQ7khhEtRHSGUHXNV4Pl1gL4BmbgmMBoss=;
	b=bEDAKFMTAqdXNapeuomHEQBdhGkSv87Sta3c81Uwm6r0jZdPmUJspp7Q1LFWiZOot+
	08OHIwbLxq5ziJNKiyBOzzIVr6x11n3a6AKV1jEGU1IgWKll37A6j1S5EtDWqmzNjVuW
	sKIyjOyBZQw9ppZAxKAdnkAXY8p+z7VmpqOM2IKRCIqTFB/SEDDlD1Z40QiRA2+mRnqU
	ZJ7cGTxRooVHWfeFcGEtz944E3LA2SRvh0M6951ICyOoJ4GBWWypTvjyKXloi6jve1bL
	iXNjWT6JLQy/RFuuJOc1x79bOZ0AKfQNCTopvPbSRmvW8sHDrh5rK0DMAkJXqofUbOcA
	0Aow==
X-Gm-Message-State: AODbwcB8mr2+eCz5Kys8uZzqgBQUamn6ARaUMp+4qwYiLKyv5c3qnc5S
	jVvww5y742+v0tYOA/hWIA==
X-Received: by 10.223.150.81 with SMTP id c17mr5491257wra.124.1496416638230;
	Fri, 02 Jun 2017 08:17:18 -0700 (PDT)
Received: from crde-port-20.cahors.local ([37.169.200.106])
	by smtp.gmail.com with ESMTPSA id
	a24sm26904293wra.17.2017.06.02.08.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Jun 2017 08:17:17 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 17:16:03 +0200
Message-Id: <20170602151603.17994-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] initscripts: Populate volatile from existing file
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
X-List-Received-Date: Fri, 02 Jun 2017 15:17:18 -0000

In some cases, it may be useful to populate a volatile file from an
existing one, e.g. a file in a read-only rootfs that may be edited in a
read-write destination.

To provide this behavior, creation of volatile files has been updated to
copy a file which has been given in the <linksource> field. If set to
none, the current behavior is preserved.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh     | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 22a71ecaae..35316ec2ba 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -25,8 +25,18 @@ COREDEF="00_core"
 [ "${VERBOSE}" != "no" ] && echo "Populating volatile Filesystems."
 
 create_file() {
+	EXEC=""
+	[ -z "$2" ] && {
+		EXEC="
+		touch \"$1\";
+		"
+	} || {
+		EXEC="
+		cp \"$2\" \"$1\";
+		"
+	}
 	EXEC="
-	touch \"$1\";
+	${EXEC}
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
 
@@ -187,7 +197,9 @@ apply_cfgfile() {
 
 		case "${TTYPE}" in
 			"f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-				create_file "${TNAME}"
+				TSOURCE="$TLTARGET"
+				[ "${TSOURCE}" = "none" ] && TSOURCE=""
+				create_file "${TNAME}" "${TSOURCE}" &
 				;;
 			"d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -${TNAME}-."
 				mk_dir "${TNAME}"
-- 
2.13.0


