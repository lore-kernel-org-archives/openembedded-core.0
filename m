Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E2F4F607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:55:06 +0000 (UTC)
Received: by padck2 with SMTP id ck2so13930057pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 17:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1EznWYKpZMs/bQBThhflzu8aGHEEzvQNIeuYy9QaRhI=;
	b=rE+2TGfTMXqZvtY4FdQJA4UxCOmk7L2sKh+yvJMt/qWrf1/i4liCKMHzshWXefokHK
	zuds1mO0Co/Ob5IBC4QoN5QpzVDsEg0j2jiOtEeMtvCekwRtjOMkUHHP+kBDBkAaC55/
	9Hrr8tlYyix3zVuX9YtbA7/XDvRkLunpgqWErqVQDE6KINVsAFQG4kweQcDrXuhV6FZQ
	yhsvvauq3yz7K069Mt2S+b295yWPC1/4g7k/4eTNH25BbpbMXIrGjb3UVY/sbD/uEDAf
	sMpq4Fh9ywThNJ/5bT0QrHzSCAFuwRfPie32YP+4uvrwNzHFUd5RX6t0aAAMWOeNB9bd
	rdmA==
X-Received: by 10.70.20.5 with SMTP id j5mr2622854pde.40.1436921706911;
	Tue, 14 Jul 2015 17:55:06 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	bs3sm2588952pbd.47.2015.07.14.17.55.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 17:55:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 17:54:42 -0700
Message-Id: <1436921682-5965-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] sstate.bbclass: remove redundant cd and mkdir commands
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
X-List-Received-Date: Wed, 15 Jul 2015 00:55:09 -0000

Update sstate_create_package and sstate_unpack_package to remove
redundant initial mkdir and cd commands. The working directory is
now setup correctly before the shell functions are called.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/sstate.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 5b64b49..2a050dc 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -646,10 +646,9 @@ python sstate_task_postfunc () {
 
 #
 # Shell function to generate a sstate package from a directory
-# set as SSTATE_BUILDDIR
+# set as SSTATE_BUILDDIR. Will be run from within SSTATE_BUILDDIR.
 #
 sstate_create_package () {
-	cd ${SSTATE_BUILDDIR}
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
@@ -672,10 +671,9 @@ sstate_create_package () {
 
 #
 # Shell function to decompress and prepare a package for installation
+# Will be run from within SSTATE_INSTDIR.
 #
 sstate_unpack_package () {
-	mkdir -p ${SSTATE_INSTDIR}
-	cd ${SSTATE_INSTDIR}
 	tar -xmvzf ${SSTATE_PKG}
 	# Use "! -w ||" to return true for read only files
 	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-- 
1.9.1


