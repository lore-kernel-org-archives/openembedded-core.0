Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9894ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 23:59:50 +0000 (UTC)
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com
 [209.85.128.202])
 by mx.groups.io with SMTP id smtpd.web09.5594.1661817580827262197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=f00AgU8T;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.128.202,
 mailfrom: 37finywmkaoudhrnvvnsl.jvt@flex--wak.bounces.google.com)
Received: by mail-yw1-f202.google.com with SMTP id
 00721157ae682-31f5960500bso150748257b3.14
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=y9inXDZigg5ZMQMQynC34mwiAcpgvFjY2dVf+jbsu3I=;
        b=f00AgU8T3alWSZCYRSSds5dTNrS1tWgy6voy31yek8lZT4KdVVuHZLWdI7WTuXYTlz
         DnUi6hQeMyhaBErp4hORBf2HzPHzQnbHRVLUSq3O+Y28N9f1O7IU9rh7IUxCqMfIX2Bl
         zis9a+JTnZ+fC7ASUu0a5rGlh4eRtqFNS5D8TGq5YxjHHoAPjbQx9hTTeo/pxWoq+FlI
         vy6S8NDgz9qHIg/0BOgyPQ8gUoIUgmF/Xr7js1BSkvBD0be1V/sDV9iwHPk72SlMN/yP
         ER8cEnp9ZaijDFT98oMDdL1rOB41vqo31BCRe42UCZu0am8PMhVt2JjRYG004N76CzXt
         ag9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=y9inXDZigg5ZMQMQynC34mwiAcpgvFjY2dVf+jbsu3I=;
        b=G2nwoQL+xy/TXfeUoT0BvWUMHrq/Rx0OE4VseD16DTesGYx7H7Wb+Vc6H+B1iDsJod
         M8qRF9X6ya3D3o3EuJaonwae6xhjfmaU49Id4KlmUMPw55wHl2jy9EMFkin9F2unfMRa
         p/nh2iAVC83PdHCILkOl4RgmoYfUCu08TtdGCo7N55d4fgK6biLvc+zlMLjH79AQ8Wyb
         bEAgvCdBdNfR065UBvXvdhX1/y9BuTQckPozX83wrmCYWDii9LzGqPuRXfzL6+uwkGCS
         1lb0S681uxvrwNHHRthWRJDyvyapiIjM9VEAUYMYaueYExAXODo2sbh3CMd61DKuVLVp
         tuug==
X-Gm-Message-State: ACgBeo3MT+qt/sRZNOK/T+eWCBlB/fpr7K14/DMkIHW1SpCBEShsdkrs
	/0IOTnHIV3l/wm/PCpLSvTQjat723Qnrs975LpHrLRoBAzcCda+ar1x0cO5m3AW+N0swUYW7kin
	509RPHCUEHPuarTvej/bVcDjC7XlXX3C1xrU0Ge6oZlYMJGmEahz6ynF9BGf9UhjMh2FKWdb7VD
	4FNg==
X-Google-Smtp-Source: 
 AA6agR700+JFgCVmdpZr3emwVxHPUfWswhFDmUuRgl0ryMuJNfDjlVveoRI+2boh2SlCOwp60GYqoUU=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:f09:65fb:3a24:a5b4])
 (user=wak job=sendgmr) by 2002:a25:e90e:0:b0:695:64cf:5d2 with SMTP id
 n14-20020a25e90e000000b0069564cf05d2mr9790964ybd.541.1661817580002; Mon, 29
 Aug 2022 16:59:40 -0700 (PDT)
Date: Mon, 29 Aug 2022 16:59:35 -0700
Message-Id: <20220829235935.670738-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH] rootfs-postcommands: Make /etc/timestamp consistent with
 image
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 23:59:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170041

This makes the determination of the timestamp for the /etc/timestamp
file consistent with mtimes in the generated image. This is desirable to
make the built image reproducible with the git commit date instead of
the current date.

Change-Id: I7d9fe32906aa93baf53948aa40b7a98fb05dd384
Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 215e38e33d..8d710186d7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -312,12 +312,14 @@ python write_image_manifest () {
 # Can be used to create /etc/timestamp during image construction to give a reasonably
 # sane default time setting
 rootfs_update_timestamp () {
-	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
-		# Convert UTC into %4Y%2m%2d%2H%2M%2S
-		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
-	else
-		sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
+	if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+		REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
+		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
+			REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
+		fi
 	fi
+	# Convert UTC into %4Y%2m%2d%2H%2M%2S
+	sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
 	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
 	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
 }
-- 
2.37.2.672.g94769d06f0-goog


