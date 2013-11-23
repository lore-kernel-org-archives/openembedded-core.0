Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B21B86CD0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2013 06:32:12 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id q10so2275618pdj.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TYyCkjI1rW4ZFcaSqe0pgsD2T4Zv5O30TGCV7WHVD/M=;
	b=d/ZokUfjWLCDiIQeqpEcMBsxHaqSyjJt7qO2SRquq2JndH6j0VcfkctOQgDe4fMikX
	QSr6LSoSzVXAHUsZa06Y26pFqqA2tgOoFz/KNM1uiqr7OzdqlMW5A3mbQuP0TkXBp+7N
	k4LtJTZciNWkPbmAqHusPeRH+eT0A2M75oE5dGZo5COQjB/hGqF1o2LtTwf5wtjqFR8k
	8olECtn8odBJFr5XTZIq6pd9fe/Z5zvAkzABX2cwn3tMsA4601l0CPyB5E0TtssLR2NM
	MQoVGUlWC0jRPERl25zKAp2ZPqJWTwKyKIk3H5w/OyrDNNwkjYrHmUx9OE0/SGr7xzKy
	3AXQ==
X-Received: by 10.66.65.165 with SMTP id y5mr16163014pas.101.1385188332241;
	Fri, 22 Nov 2013 22:32:12 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id m2sm57757317pbn.19.2013.11.22.22.32.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 22:32:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2013 22:28:44 -0800
Message-Id: <1385188124-3602-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [PATCH] systemd-systemctl: Add preset capability
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
X-List-Received-Date: Sat, 23 Nov 2013 06:32:13 -0000

systemd has presets as described here

http://lists.freedesktop.org/archives/systemd-devel/2011-July/002830.html

This patch will let distros define presets file
which will override the enable/disable specified
by recipes.

systemctl preset without any argument will run presents
on all services

systemctl preset service1 service2 will run presets on
specified pervice.

something like enable * or disable *
would mean that all services will be either enabled or
disabled by default.

If no user-presets are specified then 'enable' is default

systemd allows basic globs but we do not implement them
except '*'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd-systemctl/systemctl            | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index f786656..b37f27a 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -33,6 +33,14 @@ while [ $# != 0 ]; do
 			cmd_args="1"
 			shift
 			;;
+		preset)
+			shift
+
+			action="$opt"
+			services="$1"
+			cmd_args="1"
+			shift
+			;;
 		--root=*)
 			ROOT=${opt##--root=}
 			cmd_args="0"
@@ -49,8 +57,16 @@ while [ $# != 0 ]; do
 			;;
 	esac
 done
+if [ "$action" = "preset" -a "$service_file" = "" ]; then
+	services=$(for f in `find $ROOT/etc/systemd/system $ROOT/lib/systemd/system $ROOT/usr/lib/systemd/system -type f 2>1`; do basename $f; done)
+	services="$services $opt"
+	presetall=1
+fi
 
 for service in $services; do
+	if [ "$presetall" = "1" ]; then
+		action="preset"
+	fi
 	if [ "$action" = "mask" ]; then
 		if [ ! -d $ROOT/etc/systemd/system/ ]; then
 			mkdir -p $ROOT/etc/systemd/system/
@@ -80,7 +96,17 @@ for service in $services; do
 	# If any new unit types are added to systemd they should be added
 	# to this regular expression.
 	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|path\|timer\|snapshot\)$'
-
+	if [ "$action" = "preset" ]; then
+		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
+		if [ -z "$action" ]; then
+			globalpreset=`egrep -sh  '\*'  $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
+			if [ -n "$globalpreset" ]; then
+				action="$globalpreset"
+			else
+				action="enable"
+			fi
+		fi
+	fi
 	# create the required symbolic links
 	wanted_by=$(sed '/^WantedBy[[:space:]]*=/s,[^=]*=,,p;d' "$ROOT/$service_file" \
 		        | tr ',' '\n' \
-- 
1.8.4.3


