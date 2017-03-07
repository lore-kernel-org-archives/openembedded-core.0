Return-Path: <msm-oss@mcclintock.net>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12C1D7763B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 19:48:52 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id x37so1652338ota.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 11:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=im20Qoulawvdsg3uL90+N//oOolp0HMsVq4dtNcOvXs=;
	b=K1VOujsZxM5/NHxBtxfVe2j3N9MsA4OMqV/jZYqIa2R220IJGc8aJaHMZTctvvogKK
	t79KBDkMW+5ddN+E7BStpQjn6TRyU/vXCGFkk6o7KcMJwA7wm6eXcFwZWUZi+/Fey3vw
	/hcggPRNrVXXyae52G2dGvVj5dYAeu6EHdUF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=im20Qoulawvdsg3uL90+N//oOolp0HMsVq4dtNcOvXs=;
	b=raEpo5NNNN2r5aFPrlJ99HeYD9DBzA8QlOYtsw7HEzTOFfRLcW6Bi+Iyn5jrhnlDFr
	tjQT58m46bStHfC58c01pTMhP2LEBKNWMZ6kSBxJhzM2MnJfzipfH88LoNyc76vH0Wgz
	Rf+1CZ2XewDB7zfhZSKn4I0sj2pG4y3uOQvEPRSdjx8cMCTTjqwDviS22cO9WDjpwwSg
	XvaNksHMPpOVgIdX8ZEc79n5Uq9SPg1sf9wAzvm7gMz1WapaNAy1xnMNQg3n/bWxKLe1
	Rtn/9rJAZfgrKPvrfpYdp4jcq2tBKDLNn4ygwYhOnIIv/NPROWLaY23NvrPiVjyUf4qj
	yibA==
X-Gm-Message-State: AMke39nve8lQnKOf5dMNCguEC1GQu8akx7MSKyATrQvpc/7pYYJF25Ys2VKwAuRr8YTYow==
X-Received: by 10.157.15.99 with SMTP id 90mr1464300ott.265.1488916133641;
	Tue, 07 Mar 2017 11:48:53 -0800 (PST)
Received: from pandora.lan ([2605:6000:1019:e0:55e1:79ce:f0d9:c3d8])
	by smtp.gmail.com with ESMTPSA id
	u131sm434250oig.24.2017.03.07.11.48.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Mar 2017 11:48:52 -0800 (PST)
From: Matthew McClintock <msm-oss@mcclintock.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 13:48:41 -0600
Message-Id: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 19:48:53 -0000

This is useful in a few scenarios:

1) A developer wants to be able to grep all the code in a particular
without having to run patch on various components until they guess the
right one (e.g. which component is generating an error/warning?)

2) Other code scanning tools that can be run without requiring a full
image to be built (legal, static code analysis, etc)

Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
---
 meta/classes/utility-tasks.bbclass | 7 +++++++
 meta/conf/documentation.conf       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index da69c3a..b922685 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -64,3 +64,10 @@ do_fetchall[recideptask] = "do_${BB_DEFAULT_TASK}"
 do_fetchall() {
 	:
 }
+
+addtask patchall after do_patch
+do_patchall[recrdeptask] = "do_patchall do_patch"
+do_patchall[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_patchall() {
+	:
+}
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 06527cb..5f4593c 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -40,6 +40,7 @@ do_package_write_rpm[doc] = "Creates the actual RPM packages and places them in
 do_package_write_tar[doc] = "Creates tar archives for packages and places them in the Package Feed area"
 do_packagedata[doc] = "Creates package metadata used by the build system to generate the final packages"
 do_patch[doc] = "Locates patch files and applies them to the source code"
+do_patchall[doc] = "Fetches, unpacks, and patches the source for all the components in a particular target"
 do_populate_lic[doc] = "Writes license information for the recipe that is collected later when the image is constructed"
 do_populate_sdk[doc] = "Creates the file and directory structure for an installable SDK"
 do_populate_sysroot[doc] = "Copies a subset of files installed by do_install into the sysroot in order to make them available to other recipes"
-- 
2.7.4


