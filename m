Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6492A6B12B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:07 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id u89-v6so23540783lje.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZQ4WCHqxLdOr/ONHM2gUW2fxaHk6pi/KD7pq0+87fEI=;
	b=dXbKHaKyHb9tgTbJ2BGCeu4qfLIPPJ5o2LTnVW60fes/lG9ow4dvQ/idknEklrZC3q
	i5lQtPG8rRuEk67ZlcjEy8kSaqD7dccLKJXvBi7K2FkwlGsvYdvGdxiQ0aSUwckSsLCM
	56zlRBAHgDQxAnSZd585znwOJiMKqjQ2hP92lu/NLEcZL04D2WfSZ1lFrGUfVfkEieFt
	97C9FaI4YHH8YlVAjv/rhF9LM7MXLc/c7Lc1tIpDVT7RAcBHIyHpzgHJS7rOP4AGSPm1
	qCbLEGrTJUe2Hic+GmxfdKmKRsRHGX7UXDmd/PL6qek3sxBmVFtoSjr9B1d+7iCURwaI
	8jqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZQ4WCHqxLdOr/ONHM2gUW2fxaHk6pi/KD7pq0+87fEI=;
	b=Kn95DapsNfIDCWFw95WxSHbkgdxvulB9GkAn0FXc6uwQSjO1yHePlWmxTrbxr+N9Yy
	m6gGR9iMQivFXp5ukf8ljQwus5iYaYeYpkl+FCntXkeDPH+YyfX6LybpyuSjaguPqbp4
	pcOofwd3BB+bSTOYtUz3N9tkGzcVDGHjJ+A8wM2EXj9rLgb3QhE4B0euGiAS1/LAewti
	N5Rp5xWAPWR+FJfrjTfX885B0bNxEak9fvURUTLesc1afKKNvMiFsTdaA/0uKsAn3/YA
	rjOcb99Y68yjYH5ssycuWVoKR6OMEEu8ydc3G7bDftQtuvxGc/lM1l1Myy74bntdkX8o
	4b6A==
X-Gm-Message-State: AJcUukfp0AUntafLHAC669FGQSYjMuqAaTShLiMGjAzbixUiFxa34E+/
	+sHmvKBHdN9nioUqUyZnqoTztMHdOrg=
X-Google-Smtp-Source: ALg8bN4hXdHrVrQ3Y4e0isFV/bLqzy3IafaIKCDKj2UUi9d229ZWu0CJZ4JSLMBgKHq5Y5WehBdH8Q==
X-Received: by 2002:a2e:93d7:: with SMTP id
	p23-v6mr21532291ljh.22.1546257967634; 
	Mon, 31 Dec 2018 04:06:07 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:07 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:57 +0100
Message-Id: <20181231120559.25470-6-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 5/7] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:07 -0000
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


