Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DE07979BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 16:24:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m16-v6so9647754ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vVGl5d7uVyyLSUuQycnyRjv2faEW0/3/yqeQkTe61gk=;
	b=FcaXwlSocGauyLtmvaHuQsFpM5ng8vYztwqEQppxvwjagh3/BcwshImJk53ycvj0BG
	C/9wP+9Y1iBzX9Pby1PkIcOhW5ETZPeBt71VsQmNrSuQgjnCf9BnUn3slK3fqY545yVl
	lj9E23lGwGLO/2+KzuYHDWbPKDZi7rR8BD0MifscZYtVxtxd0+LvvqVd8Wc4HmIjt9iw
	c0saNwFEnEvWdUgnu7kWrrO2UO5osY326Fy4SWX2Ksq8CK5KDBqwIZ8HsDbuCgUJTf90
	1xRbkCIzbhOVHqwo36+70bzGktMQd4OCo9hkjodt1lnz33gz7OhePAZIOV1H5Tbzk32M
	IFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vVGl5d7uVyyLSUuQycnyRjv2faEW0/3/yqeQkTe61gk=;
	b=L2lbjfcC55GkAnF4dvdPvBT6K9wnfM+tLXMWz+oSc7+8IYE2ANTBING2GYFJuYvWkF
	fLTs2LHV0SFNSJSQT44YWzz4Fu6ge+HrTtn0BFIDdib8yuGrWvJIWQfz+qDsO12hVOtV
	WAV2nBDO5jGXs2IkXKSvB+Fhsr7UxJfAh3OENNNquaDq9zHrdktpv0EAV6Pv8q2sVwXH
	4S51iiUJCpzlF7JzUcxK7voAGMKcxWJDS+s5Mn7UGbxxIlY2ykROFlDS2GOGNBSbqsxg
	SrNQ4aOt2G6+NWMQLZ6g0lq6c7Dt8rwvP2VIluAcGOOq496WGSjOHSSW37ovi1znRsfN
	i2OQ==
X-Gm-Message-State: ABuFfoiRV4Hkqt1LPeURgtnQPBn+lzX+2mP0FFf2bTAZ5Cs4UWz7vO1l
	5405ES9oRmtCqs9ISp5yjCWNXbL0
X-Google-Smtp-Source: ACcGV60K1baT4UrwdVW874Z5svQqMhHXIwROi8jBb2x/XYN93fiAt1LrH5DonFQh5uVNxvvHjQxHMw==
X-Received: by 2002:a6b:b281:: with SMTP id
	b123-v6mr4714142iof.140.1539361453525; 
	Fri, 12 Oct 2018 09:24:13 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	s7-v6sm442187iod.69.2018.10.12.09.24.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 09:24:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 11:24:09 -0500
Message-Id: <20181012162409.32746-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011180843.13983-1-JPEWhacker@gmail.com>
References: <20181011180843.13983-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] initscripts: populate-volatiles: Speed up processing
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
X-List-Received-Date: Fri, 12 Oct 2018 16:24:13 -0000

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

The core file is handled separately because it is responsible for
creating the temp directory used by check_requirements and thus must
always run first and without having its requirements checked.

[YOCTO #12949]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../initscripts-1.0/populate-volatile.sh      | 37 +++++++++++++++++--
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 35316ec2baa..824f8f3a6ba 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -112,7 +112,6 @@ check_requirements() {
 	}
 
 	CFGFILE="$1"
-	[ `basename "${CFGFILE}"` = "${COREDEF}" ] && return 0
 
 	TMP_INTERMED="${TMPROOT}/tmp.$$"
 	TMP_DEFINED="${TMPROOT}/tmpdefined.$$"
@@ -154,8 +153,11 @@ check_requirements() {
 
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
@@ -231,10 +233,37 @@ then
 	sh ${ROOT_DIR}/etc/volatile.cache
 else
 	rm -f ${ROOT_DIR}/etc/volatile.cache ${ROOT_DIR}/etc/volatile.cache.build
-	for file in `ls -1 "${CFGDIR}" | sort`; do
-		apply_cfgfile "${CFGDIR}/${file}"
+
+	# Apply the core file with out checking requirements. ${TMPROOT} is
+	# needed by check_requirements but is setup by this file, so it must be
+	# processed first and without being checked.
+	[ -e "${CFGDIR}/${COREDEF}" ] && apply_cfgfile "${CFGDIR}/${COREDEF}" "yes"
+
+	# Fast path: check_requirements is slow and most of the time doesn't
+	# find any problems. If there are a lot of config files, it is much
+	# faster to to concatenate them all together and process them once to
+	# avoid the overhead of calling check_requirements repeatedly
+	TMP_FILE="${TMPROOT}/tmp_volatile.$$"
+	rm -f "$TMP_FILE"
+
+	CFGFILES="`ls -1 "${CFGDIR}" | grep -v "^${COREDEF}\$" | sort`"
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


