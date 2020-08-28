Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3135.1598645316872985830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 13:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mark.asselstine@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07SK8Uqe005461
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 13:08:31 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 28 Aug 2020
 13:08:30 -0700
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] xinput-calibrator: make _once run only once
Date: Fri, 28 Aug 2020 16:08:23 -0400
Message-ID: <20200828200823.13630-2-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200828200823.13630-1-mark.asselstine@windriver.com>
References: <20200828200823.13630-1-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If no calibratable devices are found then no calibration is
written. With no configuration file created each and every login will
result in a fresh attempt to perform calibrations, which is
undesirable for many reasons. Since HW doesn't change often we are
better off writing an 'empty' calibration file to avoid further
attempts to perform calibration. If new HW is added the file can
simply be removed to force a new calibration attempt.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...r_pointercal.sh-allow-skipping-calib.patch | 32 +++++++++++++++++++
 .../xinput-calibrator_git.bb                  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal.sh-allow-skipping-calib.patch

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal.sh-allow-skipping-calib.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal.sh-allow-skipping-calib.patch
new file mode 100644
index 0000000000..a7fade3428
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput_calibrator_pointercal.sh-allow-skipping-calib.patch
@@ -0,0 +1,32 @@
+From d89d5e25a805d5ccc6d9fb2245da45cdc6b5ac33 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Fri, 28 Aug 2020 14:48:40 -0400
+Subject: [PATCH] xinput_calibrator_pointercal.sh: allow skipping calibration
+
+If no suitable devices are found then no configuration file will be
+written. This results in a new attempt to perform calibration on every
+login. Instead we write an "empty" file with just some brief
+instructions on how to force a new calibration. This will result in a
+calibration attempt only being run on the first login (future logins
+have things end with the sourcing of an empty config only).
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ scripts/xinput_calibrator_pointercal.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
+index 0ada7da..a331af1 100755
+--- a/scripts/xinput_calibrator_pointercal.sh
++++ b/scripts/xinput_calibrator_pointercal.sh
+@@ -41,4 +41,7 @@ CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set'
+ if [ ! -z "$CALDATA" ] ; then
+   echo $CALDATA > $CALFILE
+   echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
++else
++  echo "# Delete this file to force xinput_calibrator to redo calibration" > $CALFILE
++  echo "Created $CALFILE as an empty calibration file, no devices found."
+ fi
+-- 
+2.27.0
+
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index c59f97895c..6f4ea03958 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
+           file://xinput_calibrator_pointercal.sh-allow-skipping-calib.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.27.0

