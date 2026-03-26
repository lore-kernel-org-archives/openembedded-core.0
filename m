Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DB210A88EC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:34:49 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54265.1774546484577152890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=s0udhd18;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D37B72226B1
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:34:43 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (100-118-167-109.trex-nlb.outbound.svc.cluster.local [100.118.167.109])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1A655221D14
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:34:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1774546483;
	b=gJalyXhRCanIp4Pe/EXM28hKkzQd8xk/oQgi4iv7A9as5hz2v+TWZVJJdrayZrmPBb9Mfz
	pmbke47lrV7Egyakk4wMs+12hmILa0Uld0F6gT0rHNRYyuRJb4x345hxDkVrVwZRytVlRj
	Ok1zblO9ctOqg6dTINucrp2tNZkBArvu3PyDK6JSQ4J05Rx1j1iBE5hLj/h/9pPgQDqCjG
	eAnJrEkhSh4YDyGPEjjw/gS4dgKZBkOC8CvJSkpN3zP7Yix4NEUIGEvJ3MFPt+6bEKMe5j
	gTDIJenjBQsY3nBHDdWcKqJ11VD1h84ZRu8Eb7l2lTciVUJrc96at/gHVHUNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1774546483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=dSrFpWjwVGvKwDYe4KFsxsn2i4FbWdyM7k6ev6tDmcY=;
	b=5K+6+pGn6FUSKiEfI4aqa9ZNmM5BF0TBEWDwWQ0UO2XbCCb/zcmcuRE0diySdZSjT0Pxwq
	7+mDvYHOWOPvl+A1JhS0vfNhvYmq1HGAcVRWd4sWtE50z4FeuuRTGqUlFVyYcmwQ79cwAL
	7gWN2J6Z7mshaRTKqMxmcEEfWvs+R/CGRHLxL1w9jKlGpup+RB2VjO5FIcUuQIqyChC3FN
	U2y6qvjobdHAJFcDt5IbqhG57Y7wb9g/V1Eu9VH/qXQFOFb9RjGxwmgTzYKLKnFATaSwbN
	y833liQpNe9pBeetJ1r2Gv+daZdi+o2HowwJGtp9Tg2yoaIbwrqvuNrHlhj0Kw==
ARC-Authentication-Results: i=1;
	rspamd-7f98bb5847-kg2h5;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Chemical-Daffy: 20728c2a21b11ae5_1774546483639_3558962832
X-MC-Loop-Signature: 1774546483639:3357154668
X-MC-Ingress-Time: 1774546483639
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.167.109 (trex/7.1.5);
	Thu, 26 Mar 2026 17:34:43 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:51f3:4618:26a2:7700])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fhW9r0d5fz1xtS;
	Thu, 26 Mar 2026 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1774546481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dSrFpWjwVGvKwDYe4KFsxsn2i4FbWdyM7k6ev6tDmcY=;
	b=s0udhd18uufkbR5f2MOBlBUNfaATFAhFZlgPMo6Uw5R5bazcUQdpr7tAV3h+7CdluRjB7Y
	HKkq5DsIdRzkiS9X/Oolmf4MXwxP9fdicpF8E5VXyLVrAGRLzyQaybzOEEN+dPB0YmbMDK
	vcBBDyYyrxFYUXJIaQv6M4iGGnNgIxxqiYuIkA4editalqtj3TLALOUsOVvf3IbB/aJG7p
	ae01DzR15MVHARasXjrhPrwBa3m4ofa5wdIitqCjk0t8N6+xiZOxTXGRcyE8evz7+AWQTw
	3c6PzTv9ewn+fkmc0yldZRxxEasgMpUJPnpaCMBzW4keoL/DBcz/UIgevKAe5w==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] initramfs-framework: init: fix kernel cmdline parsing
Message-ID: <20260326173432.3286250-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Date: Thu, 26 Mar 2026 17:34:39 +0000 (UTC)
X-CM-Envelope: MS4xfP2O8r0nltMuxz/pHzu8b6pazHy3DytFbqlnteCxVJnhutN+1ESbjsqpcyqogvknJUl+VFRwApxe9x6wyKda9IpWVa7mSpEjcxGCJ8bm4MW0YjozqizH ulWpIs8uMP+Yd+i1PxH4VkqH8K1Qr+NOnqt8wJM0xljBkXL0runCkY0TbJzgaXKrLNonb/BuJgAG+NJGGXyhVsLttisJmmtjRW+YnsRs0SjYut8BUSYE72Q9 dTrMj2zpV4wtvHhPW7K4u1Rv6Lyg8A77jYsLvJ5XWfn1WcvYs5Zk48ZIBIPbS51ud4ma30RZHG0awmMZ0qBHjwKoff3EcomwRDh90gRNM/A=
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69c56e31 a=evcieJ2VOb0sFVU3DIXQLA==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=rQ77ewIg1kzeZQ-SOVwA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234033

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Fix several issues with double quotes in kernel command line

- Kernel options like 'opt=3D"value"' were breaking the parser,
  causing the whole reminder of the command line to be ignored.
  The code only supported 'opt=3D"word1 word2..."

- Setting variables without removing quotes in the value

- Setting variables to values with spaces without enclosing
  the value with quotes. This caused execution errors evaluating
  expressions like:
  bootparam_opt=3Dword1 word2

The first fix is particularly needed for people using the kernel
"bootconfig" configuration parameters to add options to the kernel
command line:

CONFIG_BOOT_CONFIG=3Dy
CONFIG_BOOT_CONFIG_EMBED=3Dy
CONFIG_BOOT_CONFIG_EMBED_FILE=3D"additional-bootargs.bootconfig"

This mechanism systematically adds quotes around options
with values, for example:
init=3D"/sbin/preinit"

Without the fix, the wrong init program can be started from the
initramfs and debug messages are ignored when "debug" is
present after "init" in the kernel command line.

For readability and performance sake, also use shell variable operators
instead of "sed" to remove leading and trailing quotes.

Tested both on host and target machines.
With the below kernel command line:
rootwait init=3D"/sbin/preinit" debug root=3D/dev/mmcblk0p2 console=3Dtty=
mxc0 dyndbg=3D"file drivers/usb/core/hub.c +pltf" quiet

The following variables are set:
bootparam_rootwait=3D"true"
bootparam_init=3D"/sbin/preinit"
bootparam_root=3D"/dev/mmcblk0p2"
bootparam_debug=3D"true"
bootparam_console=3D"ttymxc0"
bootparam_dyndbg=3D"file drivers/usb/core/hub.c +pltf"
bootparam_quiet=3D"true"

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../initrdscripts/initramfs-framework/init    | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/m=
eta/recipes-core/initrdscripts/initramfs-framework/init
index 51db083e2e..67590ad765 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -94,9 +94,11 @@ fi
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	if [ -n "$quoted" ]; then
-		value=3D"$value $p"
-		if [ "`echo $p | sed -e 's/\"$//'`" !=3D "$p" ]; then
-			eval "bootparam_${quoted}=3D${value}"
+		p_rstripped=3D${p%\"}
+		value=3D"$value $p_rstripped"
+		if [ "$p_rstripped" !=3D "$p" ]; then
+			# End of a opt=3D"word1 word2..." parameter=20
+			eval "bootparam_${quoted}=3D\"${value}\""
 			unset quoted
 		fi
 		continue
@@ -105,11 +107,23 @@ for p in `cat /proc/cmdline`; do
 	opt=3D`echo $p | cut -d'=3D' -f1`
 	opt=3D`echo $opt | sed -e 'y/.-/__/'`
 	if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
+		# opt parameter
 		eval "bootparam_${opt}=3Dtrue"
 	else
-		value=3D"`echo $p | cut -d'=3D' -f2-`"
-		if [ "`echo $value | sed -e 's/^\"//'`" !=3D "$value" ]; then
+		value=3D"`echo $p | cut -d'=3D' -f2-`"	# Option value
+		value_lstripped=3D${value#\"}
+		value_rstripped=3D${value%\"}
+
+		if [ "$value_lstripped" !=3D "$value" ] && [ "$value_rstripped" !=3D "=
$value" ]; then
+			# opt=3D"value" parameter
+			eval "bootparam_${opt}=3D${value_lstripped%\"}"
+			continue
+		fi
+
+		if [ "$value_lstripped" !=3D "$value" ]; then
+			# Start of a opt=3D"word1 word2..." parameter=20
 			quoted=3D${opt}
+			value=3D${value_lstripped}
 			continue
 		fi
 		eval "bootparam_${opt}=3D\"${value}\""

