Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5118D7DC17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f7so7943272wrs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8W2ROox/Tm3pkcprwdvKYyQVvq0zN48H2WH+q7+3tJ0=;
	b=Ll/at+cKFaWs5Gh0K0Vz3OcASqNVx3f6TuBicCOXCUfjSRe9d4+XuhxHa1PH4YeRQG
	eGrjpj2F+F2hfvuK6FSmnx1jiMja33zLy/+rzCAxB7pt38k+xZjG02TTVrMsVKZKcRPS
	AVHEeHRecbSKYN+kmhDg7c9RMpaUBFWZql1KKhZKRiYvroXGb0UbGuJIQDMjugr9+Fgf
	wNDsGREHYrOf0bOiCozw7SP2iicblvmVLlTBQ0vzfOvSfvsfi3YkjKyMIrxEERZqGyX8
	Rf7V7sMNuCUxnVrmlh3SKHPoh79GiKHZrF2aAxmcZwXZj5r63pNFGLsOhBptmn2XfkRz
	k6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8W2ROox/Tm3pkcprwdvKYyQVvq0zN48H2WH+q7+3tJ0=;
	b=jCabzRgIj2IR8t8SGpY4oukbD5F2MVx/2aQX9K/opndsaEt7qK74Q5ZBV0vT7xtl29
	VQ6gScKV3gcmbw8TMH5TqzFMGaLQ8jFRlh8VzngXo3da8oSydbd1b4JTSOc8+UzguHmy
	xvzg7T28q/ooQhXs7SsyGrNIDuaDNxFN9LhgC9/bEHXCqZRRmQ7lXP7JH+7aBMaBCKk4
	3OxpUtWFn0Z5eBtakmtaltBoK9tFrorItY0pd+u4Nk6p4NKlSLEgdPUpSRgCKiQbbEr8
	yoDx7jOICz6jjejU/GMgREcs/zrRxGwNHo1MDKacLa4SKsR4fYBzVsubJDEfFWKtW17I
	/+Gg==
X-Gm-Message-State: APjAAAUto4w8ndWzwrJkQXFeXHUMboBgKk+RElyEgx0uKPTPKpzcr869
	CfK/vZOrhZSR9iZVT2pOn9nJwGKudU4=
X-Google-Smtp-Source: APXvYqwfFBuXywZRjYVPYVGeWVlKWmuhfJFOlO2Yl9l+dwn08zq04AbIGCeCHhe5Dh3nxNPn4SkYYg==
X-Received: by 2002:a5d:6a51:: with SMTP id t17mr39800908wrw.329.1556549025908;
	Mon, 29 Apr 2019 07:43:45 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:45 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:24 +0100
Message-Id: <20190429144325.63744-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 5/6] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:45 -0000

From: Jonas Bonn <jonas@norrbonn.se>

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
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../systemd/systemd-systemctl/systemctl       | 36 ++++---------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 2bc648961761..ce50352018c0 100755
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
2.17.1


