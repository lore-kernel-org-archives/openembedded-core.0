Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 542167D9D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 18:21:21 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f12so1201817iog.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 11:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xoCX+ZuWyBhjeUQOik/Zu3Pl+DAmvvRLu4GLP2dlK1M=;
	b=BJelmvR3GX+tioGljvwLPbu6c9Ci6xtjkhbgYI6SZsSdFRGYCN/UGopcregJC60kRL
	RhavKu1M/reFieaQ1QugiS06XDKpOVGlR597ynoJRPYHiJlPktfvD7S942Ks8R+FYp4g
	46ehNvP7BoNm7w0/MDqrgmMF3s77Pl3fk3XtjT3w4HB9BNKjXMowWYH7LwlGFWQkDSgy
	dQZpCz7VQ1IJDFd08RiSVb4OPm8uxx6YcZmfRnSVHG/OlgZaVPsbV9nrZ8HamzUS4GQW
	IP9ReSzgECKWaLaO3btwi3IYDHjQQQX5pGEG6N4UFHlIB0Sm2w4o1D1iVw8Y/0MAUjYl
	GiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xoCX+ZuWyBhjeUQOik/Zu3Pl+DAmvvRLu4GLP2dlK1M=;
	b=dUzpN3LOCLKVnkvFZ7xuNqXybcPqfsmy1ZW3juxrWtuULbLgIgMXO5uNzWdAqTuxyj
	P56VqpTgkJQjSN8J9gv6l7KKkwSWpGcYXq2Th8b/nufDlOuNkjtD//OLRXSVBU+qdX0M
	5e3kCZwXy/ve/fDfUROHa7JY3IpfQAKwPefVyY3YceSyQ3wTl6C1M1XMCMjObkiLZOLy
	qECvsnjLuH3L1v3qFy71VO5typdKEye5JzcY9UKr5drlwidr41run3xOT812GrZ8NobH
	UQ82AqLL8NHeZuM8N11Wz1kyOyKEhIf6qPfnT1h295y7dvOciTHMnUQQkVSJZ2hF1uJz
	3lvA==
X-Gm-Message-State: APjAAAXnlIOtmBP0NvpZlszgHPto1+EZuVyrXJh47O4cWJ7tBQZ8xsfi
	udTrV7cASzRK1S2lXwii3QaYfj/y
X-Google-Smtp-Source: APXvYqwZRkUe7ctv+rUMcziYsXEJZ/fHiUNm1giSWHR2wycQZCEBe/bfkIqZTmuJ4FEkW34vI4NjeA==
X-Received: by 2002:a02:a909:: with SMTP id n9mr1348006jam.57.1568658081785;
	Mon, 16 Sep 2019 11:21:21 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id q5sm28931781iot.5.2019.09.16.11.21.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 11:21:21 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 13:21:14 -0500
Message-Id: <20190916182114.17200-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] classes/reproducible_build: Move SDE deploy to another directory
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
X-List-Received-Date: Mon, 16 Sep 2019 18:21:21 -0000
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
 meta/classes/reproducible_build.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 8788ad7145c..4753d458b58 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -39,19 +39,23 @@ inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'repr
 
 SDE_DIR ="${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
+SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
 SSTATETASKS += "do_deploy_source_date_epoch"
 
 do_deploy_source_date_epoch () {
     echo "Deploying SDE to ${SDE_DIR}."
+    mkdir -p ${SDE_DEPLOYDIR}
+    cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
 }
 
 python do_deploy_source_date_epoch_setscene () {
     sstate_setscene(d)
+    os.rename(os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt'), d.getVar('SDE_FILE'))
 }
 
-do_deploy_source_date_epoch[dirs] = "${SDE_DIR}"
-do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
+do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
+do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
 addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
-- 
2.21.0


