Return-Path: <freesilicon@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9388171E4F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:36:43 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id x1so20620417lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 03:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ubghij5U+29Xn9m/8EY0itLd4pQFcY84wLrN9kL4UUY=;
	b=MLJBpOdcuDl0gb0rmreoQYI+j2j/NBqL4RVX7mR18IhjbBVC6VW4O1YvT++ovYsFIf
	AiugmakQkjA0IYDvJZNbluEYwyDsOYM69OSj7qfpZWFLLzPk1/B7wf89rg0cobutzYQb
	SBxZ8hk7DaydTEmsxDtubwUczNA0+5wDfXsW3QJPBP8HTIjP8HRLKvI/mly1wuWqy7n3
	XBwLax0jxQRxPhH5FpSXy2KEsMVWCvaDhfTJ6jGuZskUVkq4jvH0sxeCpzkcEEBp6ca0
	70tDdouI0ie+9Hsbw7/yPzFtXa4gxmLPfsbLbJF8YwZ7CIEb2jOBu/hrTJ4538qCaEQr
	9Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ubghij5U+29Xn9m/8EY0itLd4pQFcY84wLrN9kL4UUY=;
	b=NqY8gbJUau4vQTDmQBuQE68RcdF3Ral6bvQGub66BniKhF+H+ATTWgbzhuzjt8Z3Cv
	aWoTasdEmpqoq94fRYnGhlXV7XC2HBB4hSw2uzrhMOlK80g0sd5H8LkdBRzjjGIuXd+E
	cHtyHlwjcF+Td2nfrjVhmddwrIMkmnBnUZ6gDTEfVwt9l+OL5TbQ435LOTRTAgNN7Qrp
	q3m3gHbpv6w4Yj+9p9Eso6J6LVSYNXnBVRaG3EhnjG6gn8TVeQfrMM72McEQ9HNpMmXp
	vYWxZLPub6qYpmk/3BxnrRigXu/W9H3867OOBpZrqNQLoI27629TZoMVAGYco4ZRBJro
	IETQ==
X-Gm-Message-State: AIkVDXKu/5dwp05TNE1Fg+2kSbof1xy4Jb5w6yEAJi2R4/BlZZObO+iIBVKz2o9xUrvEug==
X-Received: by 10.223.161.74 with SMTP id r10mr15439368wrr.16.1485344203345;
	Wed, 25 Jan 2017 03:36:43 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	r24sm24513040wrr.25.2017.01.25.03.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 03:36:42 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:35:52 +0100
Message-Id: <20170125113552.19254-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Wed, 25 Jan 2017 11:36:44 -0000

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
2.11.0


