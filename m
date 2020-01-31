Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 024CF60665
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 19:07:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z16so4602453iod.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 11:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YmxOHHMXBhrS2MB0qScPtl7DWbhsSc4woWst7PjdK8Q=;
	b=NtujQPqeF2TbqiI0cRTa/ZecdyTTq80rdeo+xu71F8dDqZneu07jZztTMMz0BFrLv7
	TVrDCLh2Zn5kLthU7UDZwmqOHM29tDZhMQ+FT57AXrVvdgiv7qBtto8/WScmvlyz52yB
	5uSG+FyPUI4CssBn32TG5Yyylw8c+JLhgi9LdmlJJmibLVOZx26dOwiWsSw1aPLx2byf
	yDcKBd37ZULgBKFf90wB9jCDdogEhrP+rCy/EyW8i+cs+RXS7mENhV0oF4G0/kEqwz/a
	GRxX1wKhFTtBa80SkLwkowT/F5XQ0oWj4WrGs7XW1HH/8ZmEDhhiBrLaqR9vSzUhWm+a
	rurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YmxOHHMXBhrS2MB0qScPtl7DWbhsSc4woWst7PjdK8Q=;
	b=g3jjtNQrUXWGZIlRSidagUA8WfmHhiV/Z/F6mkJprzFeeOheI54EiL5YOeMxrkuAOO
	uRxkkss7jrxbamS9lP9NFJIBNZ8f4gocFROAFUsx/5O012jpMc6ALZaOx4rOsHiPePzr
	2M5c/4hfKyIWOesKVKrrBszCM8O0SBiRhni9NBnuIwMAHo0+gJtnSDn850+TKoJLBHH3
	ao4G7A/q4rAY3A5wLa2HY9o37HMHyyy+a+P2oglImu2bgVObOBMPYLEbFWR2bhqY2VYe
	uIVoRaSO9Tk82jp2rJs0d0nbLLvzWV2v9MA8RqDS4rVZRChk6bvvTs7YSQsWui4qWd1s
	T6pQ==
X-Gm-Message-State: APjAAAVwGPJj0L6g+HD4+9eyREG8UpONPG0Z7fYnkmkk0uK1njwLfw56
	3Zpfgsv0ATFPiRN+LvzTi2f0D5mZ3aY=
X-Google-Smtp-Source: APXvYqzbo83osBKzJEOenWQkdpnkydicgJIEruGWM8kqoxrqkM4d3I/BpIJXMBU59e+qB6qJNN0flQ==
X-Received: by 2002:a05:6602:214f:: with SMTP id
	y15mr9714563ioy.69.1580497637902; 
	Fri, 31 Jan 2020 11:07:17 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id h9sm3489189ili.41.2020.01.31.11.07.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 11:07:17 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 13:04:16 -0600
Message-Id: <20200131190416.2261621-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] classes/reproducible_build: Read SDE file later
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
X-List-Received-Date: Fri, 31 Jan 2020 19:07:18 -0000
Content-Transfer-Encoding: 8bit

Defers the resolution of the SOURCE_DATE_EPOCH until the variable needs
to be actually realized with a value. The previous method of loading the
value in anonymous python had issues because it could occur before other
anonymous python functions that affect the location of the epoch file,
such as when a recipe uses AUTOINC/AUTOREV or allarch.bbclass.

Also adds more logging to help diagnose issues in the future.

[YOCTO #13763]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 43 +++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 39b6e40cacc..41950f1412c 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -44,10 +44,12 @@ SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
-    echo "Deploying SDE to ${SDE_DIR}."
     mkdir -p ${SDE_DEPLOYDIR}
     if [ -e ${SDE_FILE} ]; then
+        echo "Deploying SDE from ${SDE_FILE} -> ${SDE_DEPLOYDIR}."
         cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+    else
+        echo "${SDE_FILE} not found!"
     fi
 }
 
@@ -56,7 +58,11 @@ python do_deploy_source_date_epoch_setscene () {
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
     if os.path.exists(sde_file):
-        os.rename(sde_file, d.getVar('SDE_FILE'))
+        target = d.getVar('SDE_FILE')
+        bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, target))
+        os.rename(sde_file, target)
+    else:
+        bb.debug(1, "%s not found!" % sde_file)
 }
 
 do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
@@ -164,16 +170,35 @@ python do_create_source_date_epoch_stamp() {
         f.write(str(source_date_epoch))
 }
 
+def get_source_date_epoch_value(d):
+    if d.getVar('BUILD_REPRODUCIBLE_BINARIES') != '1':
+        return ''
+
+    cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
+    if cached:
+        return cached
+
+    epochfile = d.getVar('SDE_FILE')
+    source_date_epoch = 0
+    if os.path.isfile(epochfile):
+        with open(epochfile, 'r') as f:
+            s = f.read()
+            try:
+                source_date_epoch = int(s)
+            except ValueError:
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to 0" % s)
+                source_date_epoch = 0
+        bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
+    else:
+        bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
+
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
+    return str(source_date_epoch)
+
+export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         d.appendVarFlag("do_unpack", "postfuncs", " do_create_source_date_epoch_stamp")
-        epochfile = d.getVar('SDE_FILE')
-        source_date_epoch = "0"
-        if os.path.isfile(epochfile):
-            with open(epochfile, 'r') as f:
-                source_date_epoch = f.read()
-            bb.debug(1, "SOURCE_DATE_EPOCH: %s" % source_date_epoch)
-        d.setVar('SOURCE_DATE_EPOCH', source_date_epoch)
 }
-- 
2.24.1


