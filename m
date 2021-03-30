Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.1957.1617125248104227039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=r7ZUx2l4;
 spf=pass (domain: blade-group.com, ip: 209.85.221.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f51.google.com with SMTP id x7so16993808wrw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bokSzO1ePgQtYcHBGUt4x5Mu2mHTxCy6iJjLRIdmNLo=;
        b=r7ZUx2l4Lvg+c2GOewcIg5ZTyr+rvzKqTMVjEqB/a2xtViNrFrirg48l8le6HMMSC5
         01fCNxHL9dX077my9z5P8PiK/TUSu/3pmg0tL0zcv1HWh/DZjq4NfX1T/yUUMzZeb1tt
         D3WNYVhT4K2Bcc/Sjegyx52+x5QWEXUj+cc0sOBz34PZ9WOidmeOIR7wOLAuei+CMYIo
         0oMAcZ2hUqDKeisHQpDh3wZvwvlU3mxOLTTemyDNrNkNRG53YYMJ4YcSXeDxcwRncrxK
         OBpAGwB+KaiR7r3aC6I5h7+UVdPluva70jNivtBEETj9MPotWZJsfoPSpxLN9GkMhqvG
         foUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bokSzO1ePgQtYcHBGUt4x5Mu2mHTxCy6iJjLRIdmNLo=;
        b=AOCD14IBORo01kLvA6YXC08drBzU81zA6VuS/29P5rpUu5/WA5v/rFRk5F33Lr0vD+
         MgEqsTGZekMKHBLmoMKNfgSOYrarsfyJLqvkVA0nt01IIooMF+XbS0OZVUtHC7f4SPU1
         1CgTPLu4I/FF4qVzv4XvE8UyuzSZCxAE7VP07Bp8N33raI/Q6S9s3ILdJ6D2bReHtS2h
         3TFMgE2msrWF/4JDx371tLkRB+vE+hUgs8vfISNftAUc6qlc2yEoTD7LYxjBgbfMvvt5
         JXUJhNn894zIb8nHmRuZBRMO37SlV1TnfQnUE0HmU2jhhQeBMoWRgIQwBeIBGiNfEQjo
         Z1Ow==
X-Gm-Message-State: AOAM531K/OHukxoUOD4UzHpTA21viT3U0cBwTMXPNGJdv6QEdxib8G+g
	QxICSvEE3A+6AkTNIFLHbzFNbaVHu0oDSA==
X-Google-Smtp-Source: ABdhPJw6677klFzX9DJoSZCZ99tF6QZD5VxIN6OqhD6uSvNY/E/wpice5E5fFAftbSYyZh0+xkPWTQ==
X-Received: by 2002:adf:e411:: with SMTP id g17mr35001245wrm.225.1617125246680;
        Tue, 30 Mar 2021 10:27:26 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id n6sm36342679wrt.1.2021.03.30.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 10:27:26 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
Date: Tue, 30 Mar 2021 19:27:13 +0200
Message-Id: <20210330172713.753008-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This is not quite enough for the lack of a BSP to stand out clearly to
an unsuspecting user's eyes, but at least this line in the logs should
help some of us to get a clue:

  NOTE: Using kmeta BSP ''

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta/classes/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 35587dd564..c6228ad0b8 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -234,6 +234,7 @@ do_kernel_metadata() {
 		    KMETA_EXTERNAL_BSPS="t"
 		fi
 	fi
+	bbnote "Using kmeta BSP '$bsp_definition'"
 	meta_dir=$(kgit --meta)
 
 	KERNEL_FEATURES_FINAL=""
@@ -264,6 +265,7 @@ do_kernel_metadata() {
 	if [ "$mode" = "config" ]; then
 		# run1: pull all the configuration fragments, no matter where they come from
 		elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
+		bbnote "config: kmeta configuration fragments: $elements"
 		if [ -n "${elements}" ]; then
 			echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
 			scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
@@ -283,6 +285,7 @@ do_kernel_metadata() {
 	if [ "$mode" = "patch" ]; then
 		# run2: only generate patches for elements that have been passed on the SRC_URI
 		elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
+		bbnote "patch: kmeta configuration fragments: $elements"
 		if [ -n "${elements}" ]; then
 			scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
 			if [ $? -ne 0 ]; then
-- 
2.30.2

