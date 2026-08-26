Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7650EC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:01 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8268.1787734910632837888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=NoMGo8p2;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=taf0qGxhutyLH0K4TWsPbln69f/HUb4MWTWC3C7icMk=; b=NoMGo8p2rb1Z3sE8wg12yG1rVH
	OxSvQkhKlEllLjnCv7bEleDr9GhJXB9eNiBL36/cNWJKBAZdimHhQF1KTbcYHat6V5jbSAi6ieYFJ
	8w71p5JWaPaAyfXBzx5l6/tUJ3XanJhtzrEcm2Mx5kRZzkaC8eh+h0vPXBnxpI+Lhn/s65SLj4fMF
	odmAviH9ERL0RaTzwK1seV2inhq12nizuduKDs7ZXkRMkFeAJkzjO0OGI+XENJ3cZMm7gyafeiW15
	sHovEOo4tmxOd1a7oMHXSWkiWgv/QLk5hIE/uEinrgeVo4ltvl2xgE1PWi/xKX9RaZZKNh4d2UCgb
	5XLC1gNQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wz9W0-000FaN-1J;
	Wed, 26 Aug 2026 11:01:48 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wz9W0-000PpH-0V;
	Wed, 26 Aug 2026 11:01:48 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 1/2] sysvinit: rc: fix inconsistent indentation
Date: Wed, 26 Aug 2026 11:00:39 +0200
Message-ID: <1db75a3d2c4cb52e5e36c7095f601ac6f08c1f1d.1787734737.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28104/Wed Aug 26 08:24:01 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244385

The file was mixing various kinds of whitespace for indentation
including tabs, 2 spaces, 4 spaces and 8 spaces. It also indented some
of its toplevel code with 2 spaces.

Clean it up to use tabs consistently.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/recipes-core/sysvinit/sysvinit/rc | 122 ++++++++++++-------------
 1 file changed, 61 insertions(+), 61 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/rc b/meta/recipes-core/sysvinit/sysvinit/rc
index 41196ec90b..f1169ec3ac 100755
--- a/meta/recipes-core/sysvinit/sysvinit/rc
+++ b/meta/recipes-core/sysvinit/sysvinit/rc
@@ -20,16 +20,16 @@ export VERBOSE
 export PSPLASH_FIFO_DIR
 
 startup_progress() {
-    step=$(($step + $step_change))
-    if [ "$num_steps" != "0" ]; then
-        progress=$((($step * $progress_size / $num_steps) + $first_step))
-    else
-        progress=$progress_size
-    fi
-    #echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
-    if type psplash-write >/dev/null 2>&1; then
-        psplash-write "PROGRESS $progress" || true
-    fi
+	step=$(($step + $step_change))
+	if [ "$num_steps" != "0" ]; then
+		progress=$((($step * $progress_size / $num_steps) + $first_step))
+	else
+		progress=$progress_size
+	fi
+	#echo "PROGRESS is $progress $runlevel $first_step + ($step of $num_steps) $step_change $progress_size"
+	if type psplash-write >/dev/null 2>&1; then
+		psplash-write "PROGRESS $progress" || true
+	fi
 }
 
 
@@ -37,57 +37,57 @@ startup_progress() {
 # Start script or program.
 #
 startup() {
-  # Handle verbosity
-  [ "$VERBOSE" = very ] && echo "INIT: Running $@..."
-
-  case "$1" in
-	*.sh)
-		# Source shell script for speed.
-		(
-			trap - INT QUIT TSTP
-			scriptname=$1
-			shift
-			. $scriptname
-		)
-		;;
-	*)
-		"$@"
-		;;
-  esac
-  startup_progress
+	# Handle verbosity
+	[ "$VERBOSE" = very ] && echo "INIT: Running $@..."
+
+	case "$1" in
+		*.sh)
+			# Source shell script for speed.
+			(
+				trap - INT QUIT TSTP
+				scriptname=$1
+				shift
+				. $scriptname
+			)
+			;;
+		*)
+			"$@"
+			;;
+	esac
+	startup_progress
 }
 
-  # Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
-  trap ":" INT QUIT TSTP
+# Ignore CTRL-C only in this shell, so we can interrupt subprocesses.
+trap ":" INT QUIT TSTP
 
-  # Set onlcr to avoid staircase effect.
-  stty onlcr 0>&1
+# Set onlcr to avoid staircase effect.
+stty onlcr 0>&1
 
-  # Limit stack size for startup scripts
-  [ "$STACK_SIZE" = "" ] || ulimit -S -s $STACK_SIZE
+# Limit stack size for startup scripts
+[ "$STACK_SIZE" = "" ] || ulimit -S -s $STACK_SIZE
 
-  # Now find out what the current and what the previous runlevel are.
+# Now find out what the current and what the previous runlevel are.
 
-  runlevel=$RUNLEVEL
-  # Get first argument. Set new runlevel to this argument.
-  [ "$1" != "" ] && runlevel=$1
-  if [ "$runlevel" = "" ]
-  then
+runlevel=$RUNLEVEL
+# Get first argument. Set new runlevel to this argument.
+[ "$1" != "" ] && runlevel=$1
+if [ "$runlevel" = "" ]
+then
 	echo "Usage: $0 <runlevel>" >&2
 	exit 1
-  fi
-  previous=$PREVLEVEL
-  [ "$previous" = "" ] && previous=N
+fi
+previous=$PREVLEVEL
+[ "$previous" = "" ] && previous=N
 
-  export runlevel previous
+export runlevel previous
 
-  # Is there an rc directory for this new runlevel?
-  if [ -d /etc/rc$runlevel.d ]
-  then
+# Is there an rc directory for this new runlevel?
+if [ -d /etc/rc$runlevel.d ]
+then
 	# Find out where in the progress bar the initramfs got to.
 	PROGRESS_STATE=0
 	#if [ -f /dev/.initramfs/progress_state ]; then
-	#    . /dev/.initramfs/progress_state
+	#	. /dev/.initramfs/progress_state
 	#fi
 
 	# Split the remaining portion of the progress bar into thirds
@@ -100,7 +100,7 @@ startup() {
 			progress_size=100
 			step_change=1
 			;;
-	        S)
+		S)
 			# Begin where the initramfs left off and use 2/3
 			# of the remaining space
 			first_step=$PROGRESS_STATE
@@ -117,14 +117,14 @@ startup() {
 
 	num_steps=0
 	for s in /etc/rc$runlevel.d/[SK]*; do
-            case "${s##/etc/rc$runlevel.d/S??}" in
-                gdm|xdm|kdm|reboot|halt)
-                    break
-                    ;;
-            esac
-            num_steps=$(($num_steps + 1))
-        done
-        step=0
+		case "${s##/etc/rc$runlevel.d/S??}" in
+			gdm|xdm|kdm|reboot|halt)
+				break
+				;;
+		esac
+		num_steps=$(($num_steps + 1))
+	done
+	step=0
 
 	# First, run the KILL scripts.
 	if [ $previous != N ]
@@ -172,11 +172,11 @@ startup() {
 				;;
 		esac
 	done
-  fi
+fi
 
 #Uncomment to cause psplash to exit manually, otherwise it exits when it sees a VC switch
 if [ "x$runlevel" != "xS" ] && [ ! -x /etc/rc${runlevel}.d/S??xserver-nodm ]; then
-    if type psplash-write >/dev/null 2>&1; then
-        psplash-write "QUIT" || true
-    fi
+	if type psplash-write >/dev/null 2>&1; then
+		psplash-write "QUIT" || true
+	fi
 fi
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


