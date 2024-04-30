Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38B6C41513
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.201.1714512257839739688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=myUEZyEJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so39427985ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512257; x=1715117057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zo6Mz2N9tt3vhNeUEbu66Y01gjwuC3EBkCvuXlBQjWA=;
        b=myUEZyEJMvSIaMKmZuKpKtirYT93W30xnfcgKtVHEyW2TYKiAUiw4PlqsuuI2rbGYo
         qscEtuT6NqM9KM9SOrc2YXx+4TZz7SrMteXNCvNOc3JWf52fawICavvulQdh8+oZ0pdb
         /geH1OLmJe7SUaovzOxkXIqw/6M7u7rDKEW4PvMUY1xBG5XORBSA/RayeamZoa9DcXS3
         fnopUPIZh0D8vo3+olL0+u4Q149w+JN2xKJINdeCjSwmVR9aAxj9GJwiDx2mw5sVva3F
         zehxmA2r7x1jaR5KMJOQ6WLQ7x9UkGCagMHE94MvZ0ciAh3F8C4RTg5HrM5U3hZrHiAH
         GB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512257; x=1715117057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo6Mz2N9tt3vhNeUEbu66Y01gjwuC3EBkCvuXlBQjWA=;
        b=r/JgGeF+kkLpn8BrEuR2adMunAoGyj9B8KkEHd3zLbSWW0oQ0ghVoCxai3yoN9ZVs6
         R/zWIdxKNX2Qlz0pCdWITn4iOztQ2e8d3BOzQ7sbrLFuBQqSY769y9zVO35AEtvVNMNE
         90Cj16Y+cn0QOQfw64eO7nosAHkC+CrE4mdGxqK9ZYIAigeZqVO/cj0KTk1UxwtiRzdf
         1PziAvnP58IZXkTqVGDZbxoct7FN5aJROlRRrqLNr9LCUt8e98PDGDyrS+WP3qTkt8jd
         iW1tCOzZ6VEhyEspYCKtLOF8Co6Dms681Va3N2f3wtKdp3GQ2ultAjj9vJXH2rw1ol9K
         Jgjw==
X-Gm-Message-State: AOJu0Yz+OzUSzfA/6dhm89KuaoyUS7Dcey/He82iB3Ji/gs9wo6uSHkG
	ofa5U+f6g1cCJ5a6Ukhd/DkUAJeu+h51fHeioyFyOM0IC0GcEH/5hIo8QstrgyQTTfmZhtwnCIJ
	j5V8=
X-Google-Smtp-Source: AGHT+IGk2tSbJF4vyBCdQhSNS2Rb2tqRUvQn0stYZ0kunHQ1u4ERTTGfRDCaAhgjkJeE9EWUEcZJZQ==
X-Received: by 2002:a17:903:22c4:b0:1ea:264:da9e with SMTP id y4-20020a17090322c400b001ea0264da9emr855136plg.43.1714512257139;
        Tue, 30 Apr 2024 14:24:17 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/17] rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once
Date: Tue, 30 Apr 2024 14:23:48 -0700
Message-Id: <b56ec552ac34a41b531bc36a55f46e0216d40baf.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198767

From: Michael Glembotzki <m.glembo@gmail.com>

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting
the file dropbear.default, the line will still be appended a second time.

DROPBEAR_RSAKEY_DIR="/path/to/dropbear"
DROPBEAR_EXTRA_ARGS="-B"
DROPBEAR_RSAKEY_DIR=/var/lib/dropbear

Signed-off-by: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index e81b69a239..920da94ba2 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -206,7 +206,9 @@ read_only_rootfs_hook () {
 		# Also tweak the key location for dropbear in the same way.
 		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-				echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				if ! grep -q "^DROPBEAR_RSAKEY_DIR=" ${IMAGE_ROOTFS}/etc/default/dropbear ; then
+					echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				fi
 			fi
 		fi
 	fi
-- 
2.34.1


