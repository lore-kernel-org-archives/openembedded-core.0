Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 726AC6BB2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:11:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id x85-v6so27419856ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=seV6FneEg4ZXgrsbYB+RF5ZPUkSMEi2f3TU2sNTcPQ0l1RrCeUWd254H8O+0BE10ej
	utu1u5GWkwNy8erCjXIA8Ig15CYbry9FM679u25Q0ba8Ui+RyEtixqjSVFqSwOBm75i+
	hcInWGWljfrbTQFUbNOvDQI7+W14CUkN4M60BLkgt+SG9uDVJKMiaSg3wj1hyuu8Lvq2
	PxMoD+HPIf8+cFdNaBkvbaiSl2F8BvauHriGaK1rNJBRiJKlGRrOHOyUYESP7dy7A7h5
	0WoRV8t7aSjgm67jh+vS7dVp/5UMw8ChuhueLC+D90mrkxq3xijKZHaxQsNeroMRSCzT
	8VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=E0FL1isc2N3L0DQ49Okz0OuEwE4TqWjhGEwdhvKcEFzL09KyYZzG4mlSnlEYy/B86O
	EjE7gXBzdmNKU0D8ox0qW9NN2TtguPIS3GAu6erTps+EsOS1S/sHXsUjcPUuaqukwbEW
	K4fp1UHZ8ek2NZUOoMaPKXbz8N/ODnTSvN2xIunlzIinYRizk/QhSVEjP9X89vbkcKEi
	bzxnRJS3ACtP7bRcB2U0+Gp7vcIbB8hDT1hxM3bXRayvbv7RUvAnwsVBb2CKMCY17a/J
	reB/VV1BOxRA0eRYPtmZOGtLnzB7+t1NuSzMJdfWpUQAZIIda52Tx2VuenaYJOBwQ6vt
	VHEw==
X-Gm-Message-State: AJcUukcGwJT1O7219R3NU+32kUagqWbVQtjVUbUToscWM3ddQTkRXJEA
	i1WwoITfcNGoICMLg4Z6iBlK86zhNl4=
X-Google-Smtp-Source: ALg8bN5Fn5VuAoQKtz8L/HDbVcBWr55CzCJcJSbeLWa/ftPSY2tP5X6auzKoC65Xywk0VZ8cBozixA==
X-Received: by 2002:a2e:b00a:: with SMTP id
	y10-v6mr9040854ljk.109.1546445514558; 
	Wed, 02 Jan 2019 08:11:54 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o17sm10040195lff.77.2019.01.02.08.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:11:53 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 17:11:43 +0100
Message-Id: <20190102161144.11264-5-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190102161144.11264-1-jonas@norrbonn.se>
References: <20190102161144.11264-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v2 4/5] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Wed, 02 Jan 2019 16:11:55 -0000
Content-Transfer-Encoding: 8bit

Now that the systemd class sets up service presets instead of actively
enabling services, the 'enable' and 'disable' subcommands for systemctl
are not actually used anywhere.  As such, we can remove these to make
sure that nobody inadvertently introduces new uses of them.

We do, however, one case where the enable/disable machinery is still
required; that is for the read-only-rootfs case where the 'preset-all'
command can not be called at runtime but needs to be called when creatng
the image.  For this case, we implement 'preset-all' here.

There was also a previous implement of 'preset'... not sure that this
ever worked as the implementation looks bogus and there aren't any users
anyway.  This patch removes the 'preset' subcommand, as well.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 .../systemd/systemd-systemctl/systemctl       | 36 ++++---------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2bc6489617..ce50352018 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -9,22 +9,6 @@ while [ $# != 0 ]; do
 	opt="$1"
 
 	case "$opt" in
-		enable)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
-		disable)
-			shift
-
-			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
-			;;
 		mask)
 			shift
 
@@ -33,13 +17,11 @@ while [ $# != 0 ]; do
 			cmd_args="1"
 			shift
 			;;
-		preset)
+		preset-all)
 			shift
 
 			action="$opt"
-			services="$1"
-			cmd_args="1"
-			shift
+			cmd_args="0"
 			;;
 		--root=*)
 			ROOT=${opt##--root=}
@@ -57,16 +39,12 @@ while [ $# != 0 ]; do
 			;;
 	esac
 done
-if [ "$action" = "preset" -a "$service_file" = "" ]; then
+
+if [ "$action" = "preset-all" ]; then
 	services=$(for f in `find $ROOT/etc/systemd/system $ROOT/lib/systemd/system $ROOT/usr/lib/systemd/system -type f 2>1`; do basename $f; done)
-	services="$services $opt"
-	presetall=1
 fi
 
 for service in $services; do
-	if [ "$presetall" = "1" ]; then
-		action="preset"
-	fi
 	if [ "$action" = "mask" ]; then
 		if [ ! -d $ROOT/etc/systemd/system/ ]; then
 			mkdir -p $ROOT/etc/systemd/system/
@@ -105,10 +83,10 @@ for service in $services; do
 	# If any new unit types are added to systemd they should be added
 	# to this regular expression.
 	unit_types_re='\.\(service\|socket\|device\|mount\|automount\|swap\|target\|target\.wants\|path\|timer\|snapshot\)\s*$'
-	if [ "$action" = "preset" ]; then
-		action=`egrep -sh  $service $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
+	if [ "$action" = "preset-all" ]; then
+		action=`egrep -sh  $service $ROOT/usr/lib/systemd/system-preset/*.preset | cut -f1 -d' '`
 		if [ -z "$action" ]; then
-			globalpreset=`egrep -sh  '\*'  $ROOT/etc/systemd/user-preset/*.preset | cut -f1 -d' '`
+			globalpreset=`egrep -sh  '\*'  $ROOT/usr/lib/systemd/system-preset/*.preset | cut -f1 -d' '`
 			if [ -n "$globalpreset" ]; then
 				action="$globalpreset"
 			else
-- 
2.19.1


