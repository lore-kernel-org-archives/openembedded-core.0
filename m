Return-Path: <marc.ferland@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA4EA6A49A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 15:35:48 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c11so7415499qcv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=1uIFnuDFrfa5GtgBN7KSrfBRiluMNoc2loJZ3Jz98dY=;
	b=ZkBWPKHhDHr9fYbQRWDRSUqhqacsAYDKIGnFar3QJunjREdcpeGDwXTEcSor2eNIkR
	BTkS5eWIbNNeMyanMpx6kivSxgMP9rB3DudyS4a2eMv5aYsTrBhH9OV3CcCKTGOv3y3F
	OSuu1p0E+pMOieWwZ+7B63Q28ckRWhldNs7Lugs4CGRo0KhSJp+6yn/Pfz4DM/t0bJ/+
	JS7WvttfLDPTnftcuAcquDbxgf/mASBT2XOYyui+Juf0XdeECBEMjqOYg5g7g7u3mBJ7
	wHtTxC+kgkn+L/Y2ZRt+my4ubp4jUWzgsEwOvqz3yiWlOlWhWMOe7psJU1oD+R4UQIWT
	OPjA==
X-Received: by 10.224.57.82 with SMTP id b18mr493903qah.36.1372174549526;
	Tue, 25 Jun 2013 08:35:49 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id l4sm21885051qay.0.2013.06.25.08.35.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 08:35:48 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 25 Jun 2013 11:36:00 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2013 11:35:39 -0400
Message-Id: <1372174539-18297-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] lmsensors: fix fancontrol init script
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
X-List-Received-Date: Tue, 25 Jun 2013 15:35:49 -0000

Make the 'fancontrol stop' command work again by using the fancontrol
pid file instead of matching the process by name. While at it, also do
a bit of cleaning.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
index f179310..4433020 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          fancontrol
 # Required-Start:    $local_fs
@@ -16,8 +16,7 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="fan control daemon"
 NAME="fancontrol"
 FANCONTROL=`which $NAME`
-
-. /etc/init.d/functions || exit 1
+PIDFILE="/var/run/fancontrol.pid"
 
 # Exit if the package is not installed
 [ -x "$FANCONTROL" ] || exit 0
@@ -25,12 +24,12 @@ FANCONTROL=`which $NAME`
 case "$1" in
     start)
         echo -n "Starting $DESC: $NAME... "
-        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
+        start-stop-daemon -S -p $PIDFILE -b -x $FANCONTROL
         echo "done."
         ;;
     stop)
         echo -n "Stopping $DESC: $NAME... "
-        /sbin/start-stop-daemon -K -x $FANCONTROL
+        start-stop-daemon -K -p $PIDFILE
         echo "done."
         ;;
     restart)
-- 
1.8.1.2


