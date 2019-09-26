Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7697E21C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 17:58:03 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j4so8804545iog.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JHyAirehyVFQR3IKKBRPIUv0FxAEOvXt+IvUudH7bdk=;
	b=ewwyQtGBpeuiFcPG6mA0PUbmJwE6LS0W6W1WrKP8KXRDzP4/Vy/WoW75KiRGXN6w9C
	/zbzH105RUB+sITA38Z4jrMBd4+QXPHK3K/rqO5LF1wHr8RH3X2GEe4L7jQ/mWLnzjR7
	ymMTMRkEjtm2rnBTJiA7I+md1246eBf08MxGLood1sVPgjTp6KQoSQuSRR55GIoHU+8U
	5m+m/g4A6zbNCoCqoLtY7R8DWqeTlRtQ9V4+10aWBJrGhy2kA4zkV+JFWE3RsIdGw8jF
	XJ70l6TrA8WxwLPSMPzW3WIeXwhYtVBC61r4x7zVsHDkG6lQ5unJRAvtEpI+qW6VjMQV
	8/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JHyAirehyVFQR3IKKBRPIUv0FxAEOvXt+IvUudH7bdk=;
	b=WuF8vpwC+rRmhhnUXXskwAhVbXZ1WN60GbKpjoJHN2L+fxPCm9kdzOgtlaHgjfsCWk
	7bb7AER+iLYtbEpGkk39cyvrR9D3024UEsIWBKu/mzy86u3m+egRfNy0GNO/2KXslMlC
	N8hOL5wnSzZFU3stP3q3p25Vnqqibuj/zIcFEy+7te3oselcuIypAfVa21HbFpGH2Bnl
	45ST6atzvfYnfXKaPbD4VTeS6z2rtQt5CrsesUlxWQ1vIbADHeOdGTo//ZbWXzrt8Ylb
	WMw0hUJSs1NJVYqvsDtR/tSBH5BvidxDhndCnwECGbePsOrzVnjhtlJh+2QRPclmCmKI
	AbhQ==
X-Gm-Message-State: APjAAAUvfwU5UfTKUMw6deZcCkQA5fWFs3JhCvAotBmZMDU0hIl+w3ie
	jT4cgp7xT1AVBn4gcmqdCm6aj500
X-Google-Smtp-Source: APXvYqyYWmzgn1j70QeilWwUMEajXD4w7IdlbZoPXx5KKbew2b0Objgu3uQX/T3YhWh6vOdjUHdI4w==
X-Received: by 2002:a5d:8e0d:: with SMTP id e13mr4473234iod.3.1569520684256;
	Thu, 26 Sep 2019 10:58:04 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id 26sm2696ilx.47.2019.09.26.10.58.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 10:58:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 12:57:51 -0500
Message-Id: <20190926175751.12195-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190916182114.17200-1-JPEWhacker@gmail.com>
References: <20190916182114.17200-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] classes/reproducible_build: Move SDE deploy to another directory
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
X-List-Received-Date: Thu, 26 Sep 2019 17:58:03 -0000
Content-Transfer-Encoding: 8bit

The deployment of the source date epoch file had a race condition where
any task attempting to read from the file would race with creation of
the sstate archive for the do_deploy_source_date_epoch task. The
creation of the sstate archive requires moving the directory to a
temporary location, then moving it back. This means that the file
disappears for a short period of time, which will cause a failure if any
other task is running and trying to open the file to get the current
source date epoch.

The solution is to copy the source date epoch file to a separate
directory when deploying so the file never disappears. When the file is
restored from sstate, it is moved to the correct location after being
extracted.

[YOCTO #13501]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 8788ad7145c..99b749a9ee2 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -39,19 +39,27 @@ inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'repr
 
 SDE_DIR ="${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
+SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
 SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
     echo "Deploying SDE to ${SDE_DIR}."
+    mkdir -p ${SDE_DEPLOYDIR}
+    if [ -e ${SDE_FILE} ]; then
+        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
+    fi
 }
 
 python do_deploy_source_date_epoch_setscene () {
     sstate_setscene(d)
+    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
+    if os.path.exists(sde_file):
+        os.rename(sde_file, d.getVar('SDE_FILE'))
 }
 
-do_deploy_source_date_epoch[dirs] = "${SDE_DIR}"
-do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
+do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
+do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
 addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
-- 
2.21.0


