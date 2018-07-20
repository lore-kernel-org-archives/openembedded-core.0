Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 201D16FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 04:33:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t6-v6so9969777wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 21:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MdP4lLAgQr+2ObI47rTrzyO8Cs0YR1SUUXa6JXmKLXs=;
	b=AvR0oGozdHqOioPImlbMtqokIZu2V9PcPL5kUXlV/Jn6DNI1x2X07dtRP2sSrgjZ5e
	ofFU2e87TvhwcFwIzpZlFIJVO1NqBq6/zw4p5jzk2Hlv8W7VxP1r1+HcL/DoxHdCTVMm
	q3eBo8VYrU/HU0uvzhsKQrAc3o+7v5KkTYKhDrvA9oom+wssCsTty2CW/ec7s+Pg/cyG
	gK4N8CAwfC84OeBOtoWrrXcf/mUUmFTO2NxDV/DAavosFKW+9mZIb/1ogLPm7hGK7RSG
	NQkuIhAoc11IwxsqHeaFqrermxd1XddWGL9/QtQHh2xGulN1oZKiGXjV0SHDfQhGggmG
	wAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MdP4lLAgQr+2ObI47rTrzyO8Cs0YR1SUUXa6JXmKLXs=;
	b=gMGlgmn8GjvNNUuQvrrnnPN+ZdfsPQN5yGQRJqOVvxWv3s0iv+iSTX4jeSYpXOII08
	DKeNerV4GIR912L2DGuPj3Xn1dVQYQ74fv9DGzDc+nbIAj6S6q8n/EABgYNzNLxU26SW
	Ahv6lpqSt84DgSR6vBG/ScT/01VCq7oEXQF4W+1hhi/LSChaTZ1zMqWREGxODG6mgsCs
	yXbd+p/yBb/5Qq4b/uATDJwV3KejPvR9CIjDtzHrs+mZVemZsKrGxi+tVgQVyyrZaODI
	VeJ+N/IAB7G7AsOZjodTIcZPwLQtTsphfBYOsSZsYDP6SajKl15cLebU6WmP5cKVTd6m
	m91w==
X-Gm-Message-State: AOUpUlHMIW4vZsecPvoGeU1kcXwyV5C4joYwN1PKy/61OYCqob83hROE
	A8epoxvvLn3p3GcBPiKF5Z5GM3a7m+0=
X-Google-Smtp-Source: AAOMgpfEFIMWhZ2rr5pW4pL1EJifplFOgAtImypNBaoeiL3PNLq75URbUtquj3N9SsofhVpGXqMBmA==
X-Received: by 2002:adf:ce88:: with SMTP id r8-v6mr251372wrn.112.1532061200590;
	Thu, 19 Jul 2018 21:33:20 -0700 (PDT)
Received: from ip-172-31-46-180.eu-central-1.compute.internal
	(ec2-18-185-104-130.eu-central-1.compute.amazonaws.com.
	[18.185.104.130]) by smtp.gmail.com with ESMTPSA id
	e7-v6sm1559276wrm.14.2018.07.19.21.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jul 2018 21:33:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 04:33:17 +0000
Message-Id: <1532061197-12148-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] image: Use ${COREBASE}/meta for timestamp, fallback to bitbake.conf
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
X-List-Received-Date: Fri, 20 Jul 2018 04:33:20 -0000

To handle the case where ${COREBASE} isn't the git directory, avoid
erroring out when the git command fails. If we don't have a timestamp
after this, fall back to the timestamp from conf/bitbake.conf.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Revert to original behaviour and use ${COREBASE} as per Richard Purdie's
  advice

 meta/classes/image.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index adc50c9..48961b6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -651,7 +651,10 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
 reproducible_final_image_task () {
     if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
+            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
+                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
+            fi
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-- 
2.7.4


