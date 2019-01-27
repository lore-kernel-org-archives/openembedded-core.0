Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 203877C30D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:29 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id n18-v6so11722235lji.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=sZ7ADi5p8ZkNOx/0KlQUtf9Oe/3yDtpegr2IlezbVmf4ZYY9hfLLvuiy9V2qOvOoIB
	u0eOwe/qW3ZdEmY0yPO3aImeIlmXWfppkL5otBagNtZJWJIxpobV8hPqxyjoA+NyHBOB
	4mZUU+9fKexzw3B8W3baUN+WHLxbqJD7v/jXib7tiKPwdsBMkcXuCXnu3BRnyeyHp3A1
	hEbJDpthCAm7Qnu1k74gLn6L4E5QPi3e48qehA6rWD+6jP+U/mtmrRNTOPMueT10k2/f
	7uYIm9xZQcO1xBfvAcDCKgjkO9dv2EkzlEwuTjRrGqYPbIh2D3Sh+GYDlwQs/l4c8Y+l
	5zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=O1Phq6rC676rkiiG+Ct3ld5X+8UkocR5Uqqh2SQKYl/mOxueu8a/+adabobrJ7BLGk
	hx1C2DGkGoz+HE3qnt/xjyjfBaDFJN8GKAIta9aZaMvTGMl8LH1pbW4H7R/s1BMNBovZ
	cQApNUekUkHebDvd7bCLe0Ws2v4arrQHVQsPv7K9J++hBqFVspe4g757DcDVyxq/UmpF
	NUNm8ZnhcZSHza9G2hjlm+sYS+lxn/I/wZ67ccRw1gBQAc6IvMkdqPYwXnK851K+I0/Z
	+BuOUOdepauFIVeSgzItvTpakANoNL5bQe7QQfO0/a/MTFA7cqtfWFb3vTKg9kqlmx0F
	LMOg==
X-Gm-Message-State: AJcUukdanfMkBhHG3m20dQPGcWWnp/hwl8LhSKEepLsUWJc3bOQItJZO
	Occ8uTH+aD2HFh9tQ/mxhyf+FNz8WrY=
X-Google-Smtp-Source: ALg8bN5OgEgGOmSQgM4o7ZLQI1mdsq1dfHyc4Nm7gLTDqbzhAwqEUNv/ERC9cDKaCv/uiTL6lCgMvg==
X-Received: by 2002:a2e:310a:: with SMTP id
	x10-v6mr13687466ljx.6.1548581909501; 
	Sun, 27 Jan 2019 01:38:29 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:28 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:20 +0100
Message-Id: <20190127093821.4803-5-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v3 4/5] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:29 -0000
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


