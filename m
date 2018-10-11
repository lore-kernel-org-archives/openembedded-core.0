Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2511571B1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 18:08:54 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id k206-v6so8807984ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OK8g/nByVUDlmR0WDIrrZFoeIZAI4rH9LMkRHf7iZNU=;
	b=S+H/Zx6q+hLTIbwW2EbQYW87qr6ed/ofW9wclm1XuoEvFHGcmSK+zfG1t+9UrJz4r1
	FY5d9MIRmHeQhcIbojHelHRn28VGeRwSCtB/mBMJrJG/BGFh2euVHO0RvAWeMJ/ioxSj
	GXRBgPTOBVxdc9oTFBX4SDD9aX+7iX1gh4xKGtoMNEJQ8AwzLz3tRdxJC2A2UocnPHS8
	EOMifQRtm648KTokFPurtmgVl4yw87Z7G5fg2kqoeQn7ogY+rbsV5ezbQ3VOaao/1jSL
	0NNwjTDTJiirjEmhw9Kur7BokuSZO5nSzJGdrHoJHFeCPr/dVJ2HrfNPOAL494/tJuxP
	guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OK8g/nByVUDlmR0WDIrrZFoeIZAI4rH9LMkRHf7iZNU=;
	b=Zs6Yt/ZXEJwDl9zLZ6Ogiqlfg6qROLrQivdkIrT9srWpxEMejldpfhPC6rRRTOl9yn
	n6B4sQhbcXk7gdBrlUYpuL6VPv2jHzh+du0nRct0Y/hpQWziJBoT6ElJK9297Idj6qad
	4Ck6qznrS50iY4ohh0tT0yjZUhQZ1YMUqDifajcains6CIBC5angyt+nilLS5+HBX5V1
	nNpbwM8ooQKmiD5NFfL4NOqxOc79eGS+Xh6/VmpwlmUSpOyi94wJfz0ExuMuRbHNVEZm
	0Q8y5kz+FoTqD0NBXn0tBqJCFseTfRpq2dfj741vUsfBdJlwsoxwN4cMnJTYKbxAfW/W
	PDPA==
X-Gm-Message-State: ABuFfojoRYzzM+yrQcRqY2uIfKpsLtGdfLbMEOaj/NMWVHI7x0/dpDcL
	rse0G27SHUhJ2Lby5jV1HJpFVLvD
X-Google-Smtp-Source: ACcGV624WhH+eGU1duLaMQRCWToREIBP1lkePvhpDJwJ7TRhUCD914RJyAJgqCrIxK154SrqIsj0hA==
X-Received: by 2002:a24:4486:: with SMTP id
	o128-v6mr2149022ita.23.1539281335473; 
	Thu, 11 Oct 2018 11:08:55 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k15-v6sm4792378itk.8.2018.10.11.11.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 11:08:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 13:08:43 -0500
Message-Id: <20181011180843.13983-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] initscripts: populate-volatiles: Speed up processing
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
X-List-Received-Date: Thu, 11 Oct 2018 18:08:55 -0000

Checking the requirements for each volatiles file in the
populate-volatiles script can be very slow when there are a large number
of volatiles files, easily consuming over 80% of the processing time.
These checks don't usually uncover any problems so concatenate all the
volatiles files together and process them as one large file for a "fast
path" option. This ensures that the penalty for checking the
requirements is only incurred once. In the event that checking the
requirements for the unified file fails, fall back to the slow process
of checking each one individually so that the offending one can be
skipped.

[YOCTO #12949]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 35316ec2baa..51eef0ca713 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -154,8 +154,11 @@ check_requirements() {
 
 apply_cfgfile() {
 	CFGFILE="$1"
+	SKIP_REQUIREMENTS="$2"
 
-	check_requirements "${CFGFILE}" || {
+	[ "${VERBOSE}" != "no" ] && echo "Applying ${CFGFILE}"
+
+	[ "${SKIP_REQUIREMENTS}" == "yes" ] || check_requirements "${CFGFILE}" || {
 		echo "Skipping ${CFGFILE}"
 		return 1
 	}
@@ -231,10 +234,32 @@ then
 	sh ${ROOT_DIR}/etc/volatile.cache
 else
 	rm -f ${ROOT_DIR}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
-	for file in `ls -1 "${CFGDIR}" | sort`; do
-		apply_cfgfile "${CFGDIR}/${file}"
+
+	# Fast path: check_requirements is slow and most of the time doesn't
+	# find any problems. If there are a lot of config files, it is much
+	# faster to to concatenate them all together and process them once to
+	# avoid the overhead of calling check_requirements repeatedly
+	TMP_FILE="${TMPROOT}/tmp_volatile.$$"
+	rm -f "$TMP_FILE"
+
+	CFGFILES="`ls -1 "${CFGDIR}" | sort`"
+	for file in ${CFGFILES}; do
+		cat "${CFGDIR}/${file}" >> "$TMP_FILE"
 	done
 
+	if check_requirements "$TMP_FILE"
+	then
+		apply_cfgfile "$TMP_FILE" "yes"
+	else
+		# Slow path: One or more config files failed requirements.
+		# Process each one individually so the offending one can be
+		# skipped
+		for file in ${CFGFILES}; do
+			apply_cfgfile "${CFGDIR}/${file}"
+		done
+	fi
+	rm "$TMP_FILE"
+
 	[ -e ${ROOT_DIR}/etc/volatile.cache.build ] && sync && mv ${ROOT_DIR}/etc/volatile.cache.build ${ROOT_DIR}/etc/volatile.cache
 fi
 
-- 
2.17.1


