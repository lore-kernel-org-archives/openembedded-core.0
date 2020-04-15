Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.18092.1586967916329378465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 09:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eIaWbjVR;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 20so9794251qkl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vsDR5dcUUQzKcIGSVjwEImgArgJY1d9d7LZ44fV7iQE=;
        b=eIaWbjVRribqIU8IzDnkV6U4lvgarkOj/p+8xZ6Hdv36570043dgBtMNTR7cuF1dND
         m4/C4PJhdTStEGHAyV3f6YUKpTX04gZjZwL4ThdXxJYPgwgZgBzCLD+7/qSKJ5UnWJYo
         a9gmNavs2uLZhmwXYe+pC+8bC5LdCQI06LU52wLZABgJkKfqVi8shOOaV0BPtgGo/XJZ
         mqi68bXtj+GeDjEk1SJjvVDelnatB7C2z9OQHjyaj8J42qdDlJwEC/a598TqKqEZlYCf
         K1CT243+aeTq1x9aBJL8JBvuKdA7YfUI8FsQpsTYr0DvZwjNukBqIDxTQ4WYzqERlZDA
         zLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vsDR5dcUUQzKcIGSVjwEImgArgJY1d9d7LZ44fV7iQE=;
        b=qaOExS84OWZNHUwzHL74/Gea6BBoCZwHZqoPYc4vpq2eKDCZOUq4sg0l0Wxb2GUpAY
         fV9brKT24dYysNA5rT53RGZkL2Dq9LHxjUgoftGeQcuIZ5xe6GsZ7HtoEEQgTFv2cLFJ
         NB4eoSByAuvsA15zqruv/W1oQXGYkv/3nM4AuBRh9g9lSCNXJM8qYvf/XMCifpeKvcS6
         mQXcYIuHQxVtGJqonR3F2QTzYAcEFZKasGo3DIJXY68w2ANU9vbRdGsH7xoz/cygU3Py
         gw/huKrvJJoqmhK9ou1V/Jqa1XvpaPe0ciZp5Qj2dKnfPMDpNEh8HAT+9v+qIeyaFxRU
         ZGkQ==
X-Gm-Message-State: AGi0PubD2oQunsprlBxY5fgubqEpbXNytOZgrST9QQmmg6w8npIWEaLm
	LEEyoD/L772jtykOrcaasWxLxCmF
X-Google-Smtp-Source: APiQypLkf1BiR7kzURifzJuNybTk7TrLU16A4JHDYhtW6WJtDsT+ZP0UwflmGdmAl3W5y7Rpa2b+Ew==
X-Received: by 2002:a37:b803:: with SMTP id i3mr21688877qkf.304.1586967915255;
        Wed, 15 Apr 2020 09:25:15 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id n31sm13147495qtc.36.2020.04.15.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 09:25:14 -0700 (PDT)
From: "Maxime Roussin-B?langer" <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jeff.dagenais@gmail.com,
	champagne.guillaume.c@gmail.com,
	=?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v2] tzdata: remove exit 0 from pkg_postinst
Date: Wed, 15 Apr 2020 12:24:46 -0400
Message-Id: <20200415162446.4765-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Documentation says that if you exit 0 in a pkg_postinst it will marked as
installed.
If you exit 0, before running postinst-intercepts defer_to_first_boot, the
pkg_postinst_ontarget script will not be present on target.

The "exit 0" in tzdata makes it difficult to have a bbappend with a
pkg_postinst_target step when you have `INSTALL_TIMEZONE_FILE = 0`

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
v2: split patch series in different mailing list

 meta/recipes-extended/timezone/tzdata.bb | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 1e2d9bd1b9..1e2b440fb0 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -60,12 +60,8 @@ pkg_postinst_${PN} () {
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
 	fi
-	
-	if [ -z "${tz}" ] ; then
-		exit 0
-	fi
-	
-	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+
+	if [ ! -z "${tz}" -a ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
-- 
2.20.1

