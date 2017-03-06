Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 074E77768E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 08:51:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n11so12508562wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 00:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1+Y8j5uo/+vlVsDVs3ClUJ0Q0gHFxLozmIPlcE8sdUE=;
	b=WI19d/BhDKr7MiZo25LasQvC0dQn+q4RNmbX0d1p4JcL1/aGNN9aG+oxbV8f7F3sqa
	qeJQOHjHvW50rKSQsusMTvI5ogGpxSInM1bPNT07JH5y5Lb+xYGzwnSlYYS5zdFj+kej
	lW3wp2VemYIGeJteggJD9W3PPgrP95MvOA+wW9iGAUthC7sfPj6K79srk+52ra1ol0bV
	BWqAz2wWb9KbegdN/V4Ass/XGQdS5zwlg+IyVfcTEAbAGwHsTxhy/H6MeM7tw/1D0Zt6
	j/NhpxW51pvlkfGGCxa8J264cnusT83JgZ+UIZhZ+w4wsgyqhQpSGi7+IVIVCz4DyyPZ
	KI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1+Y8j5uo/+vlVsDVs3ClUJ0Q0gHFxLozmIPlcE8sdUE=;
	b=kzRTTcC79nd7kFYqlaKOWmzKakGcBuAWz5efNTRoKfjiUUEt6ZRUg9n8KUIFyBCJ3k
	Ee/kpvSHAgEzFUEPDznKoEPlrmzZwpwf3YaWG+RL5RM3dOWMScjCSitL8TZ0WS5UTuaO
	k0xeqq2tCXxm5MRgwuwwoAxisbxlF7VnNiAKg0al46Qn0P1Jehiie7CmrZEOYOcH5OHC
	R3WFu24AQoDyMYoQbPGTADjgj5qpCXThJet5Jgawxkvs34kG+SumVcwb3udBaFrpb+DG
	FHhBkXRfqvJ+x8xM4zBGv3GHt62F3P11gA7RuvQYQJnn2guQT5CUf3Y/lD6WUYb9KwSK
	AGiw==
X-Gm-Message-State: AMke39k5xmiEp6OyZiukllLBybsx1dpXCdOL2sLNWdULrs5ZZLfTeNe7fvzlLPtTBJ8yFw==
X-Received: by 10.28.147.147 with SMTP id v141mr13845704wmd.110.1488790269740; 
	Mon, 06 Mar 2017 00:51:09 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	j184sm13899469wmd.31.2017.03.06.00.51.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 00:51:09 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 06 Mar 2017 09:51:08 +0100
Message-ID: <2821013.tYPUGW0tn2@crde-port-20.cahors.local>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 06 Mar 2017 08:51:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

Ping

----------  Forwarded Message  ----------

Subject: [PATCH] initscripts: Populate volatile from existing file
Date: mercredi 25 janvier 2017, 12:35:52 CET
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
CC: David Vincent <freesilicon@gmail.com>

In some cases, it may be useful to populate a volatile file from an
existing one, e.g. a file in a read-only rootfs that may be edited in a
read-write destination.

To provide this behavior, creation of volatile files has been updated to
copy a file which has been given in the <linksource> field. If set to
none, the current behavior is preserved.

Signed-off-by: David Vincent <freesilicon@gmail.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh     | 16 +++++++++++++
+--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-
volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-
volatile.sh
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
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -
$1-.\" >/dev/tty0 2>&1;
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/
dev/tty0 2>&1 "
 
@@ -187,7 +197,9 @@ apply_cfgfile() {
 
 		case "${TTYPE}" in
 			"f")  [ "${VERBOSE}" != "no" ] && echo "Creating file -${TNAME}-."
-				create_file "${TNAME}"
+				TSOURCE="$TLTARGET"
+				[ "${TSOURCE}" = "none" ] && TSOURCE=""
+				create_file "${TNAME}" "${TSOURCE}" &
 				;;
 			"d")  [ "${VERBOSE}" != "no" ] && echo "Creating directory -$
{TNAME}-."
 				mk_dir "${TNAME}"
-- 
2.11.0


-----------------------------------------

