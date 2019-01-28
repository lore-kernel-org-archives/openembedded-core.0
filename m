Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 487817C5BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:57 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t18-v6so15544712ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=btpzXWTCKPRSRrJDp60A8ZuwuZH5ZoG6vhoGPX5Thq4W6OT//0R9d8fZNTtMNRHA3P
	AWv6uv+dr4gIdRdXCBZ9ZIntcRg/dAJYICw5Q0rOLztymXjrjRNgCYLlxmRuWvnsXVF8
	nDUgWLjtds9EdCaedOPYw9V101Gz6Oi3/TmUu1RxlxeN/q67j+2+mQ1fj+i4zDaIoHtT
	0D+7RPsr0Ny22iHmdN3hdKqsANlcJ6FVo1Bippz6h+HOiBOPoXfDbUhZ2BBis6gRbjbO
	JJGoqGf2t12/K8zeCXgxOAqur+IpIqP5B+akxR0D2WD432gewiHHs24qIge1o7X9CVFj
	MZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m4TplUmXLmUFTUx1cYHsbA1jP8gf1/eon/FLVVeglDQ=;
	b=NUoYGM0uCwrOZP2LiYjRt2g2epvKnprgV6Ex3kZ5WKA46KNam3fXxGs3eqASAvyGe9
	ALPoQuZuroFYnEDvvpeslXfRgYIdiln3cRUTftud4RNAnszjAaKFw2sxVRCxeWDJi/wH
	0THx+xC/zOgVMP4UEvbo8OQ9MiBaLnFDNR4ra9RMPzfzuZDJHOqz0wLCa80MJyyLihGN
	iR1V1Hqcx5m4g/DsmIJphgv/L8RZbT3NcUW2PwnoqZRBVUa+AaPRpu4rfp5aGyVOyFXJ
	LcUU5yAI1AzDgcyBozJq4PGbZEwe12cOkQxMgG8VSVn2+Qy7zHLH6bJaE4ZPYV/HYBYH
	OqXA==
X-Gm-Message-State: AJcUukfek8jTs4+ifC1pntztU9BgFD1LyvUoTYzIj8W5Pm2nRCnxm8x6
	hpY1h/OOonBnrwT1pM5ej+zFOy/iXw4=
X-Google-Smtp-Source: ALg8bN4GZBycY0Dq+mbWvo2uH7zrOhrvUMrHwigmEZ/O4QWPfXA76/MbzRHIqAzyrAmE9nTA8xFEWA==
X-Received: by 2002:a2e:9b84:: with SMTP id
	z4-v6mr10123391lji.93.1548709137483; 
	Mon, 28 Jan 2019 12:58:57 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:56 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:47 +0100
Message-Id: <20190128205848.12834-6-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 5/6] systemd-systemctl-native: simplify and support preset-all
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
X-List-Received-Date: Mon, 28 Jan 2019 20:58:57 -0000
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


