Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id AD41D78A71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:13:14 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h10-v6so8795262wre.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 10:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F6+bDB2FL8uTTYau1Kzk3RSIftCGEAtmMPJN3R7puV4=;
	b=qsTOLpWBzCwrt3JDGpjYBMnmbqZ3e8VoMBwYUBoLKRVxbk/YjnwpBQKmPmTaHLiZyE
	TBrh7of2Hx/8QCzTGN9GuI5q4ZUcZ4JMNlnzQwq6tc2E1qJztBStIuy1c+0NEZxiOe9p
	EoTMtl6gwrkRK98ymzTNyBapttCkY0eIm3Zh29ZF6m52Ztif/70Bv4hFi+vTDkOyH5NE
	A4UEQwh9rcFSimEHF40PrDLbioFaVFyTn6aj5UGdL6yD/vZA8mID6XGtvX832fb35UgQ
	5UDInBXgkP1tfGZOeajMK3Odc5T4wtmrgsCEfyXJ8BjmqbZdKWylbITb0a6kNtePSlgh
	jOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F6+bDB2FL8uTTYau1Kzk3RSIftCGEAtmMPJN3R7puV4=;
	b=sGmHiaNGDShn4ae8JPZV2V395z3GZQqOl2X4VuhYt+/np6GGLOEmKBpxn/S9s8c/yA
	3TSEA1AxdxFMQXNUnw6AtXzc+9d/RBDzGIrlDcp202DoGLSyuAtN58jgRnQXPqLBGzO2
	PFP13I2mUalKf4mw2T+fWr3UkvcPGvhCBB6DV7q/2RuyTT1nRSiB++JZdfo3URtq9PsJ
	KtcOb+Mnd6gDyXnF7YkoyrYvfO8Kz7qFZF+cAfvGtnp2yuETftHPm6ZHCBwcq8dSUq/U
	jEh+POL4iYGv8GLxCdi5MEvCaVoYiYDIzkalbcQSqdPFgUpcYgNM24w9pxqlGd7aDwko
	V/yg==
X-Gm-Message-State: AOUpUlH2vgxTFND8eNwwlRvsHmbI9/tYg4f+3eD2sX99Orv6wOYIWEUT
	9zM/ZnngJ9+W8riJiuW5njQBMd2zy5Y=
X-Google-Smtp-Source: AAOMgpeJmecHiSD4Q/bTa6wOjf1RLIQFdqXEeZo7eLTYFb2mRr1URzxAGugkuA7MKgrEuykfnjG4zw==
X-Received: by 2002:adf:adae:: with SMTP id
	w43-v6mr8411206wrc.251.1532020395180; 
	Thu, 19 Jul 2018 10:13:15 -0700 (PDT)
Received: from ip-172-31-46-180.eu-central-1.compute.internal
	(ec2-35-158-255-28.eu-central-1.compute.amazonaws.com.
	[35.158.255.28]) by smtp.gmail.com with ESMTPSA id
	q1-v6sm10364657wrw.42.2018.07.19.10.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jul 2018 10:13:14 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 17:12:59 +0000
Message-Id: <1532020379-32243-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Thu, 19 Jul 2018 17:13:14 -0000

To handle the case where ${COREBASE} isn't the git directory, but
${COREBASE}/meta might be (since that's the layer that sets up the COREBASE
variable), use the timestamp from there. If that fails use the timestamp
from conf/bitbake.conf.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index adc50c9..0afebff 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
 reproducible_final_image_task () {
     if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct 2>/dev/null` || true
+            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
+                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
+            fi
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-- 
2.7.4


