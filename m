Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DEED149E9
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:30:02 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.2623.1729880995509321208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eezBT8oj;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a39620ff54so8559505ab.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880994; x=1730485794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwHANkg+/AKNAbqmNyaZ1upVuNY4lRhpwrCYjr5MFeA=;
        b=eezBT8ojc8truwjBDlqh0jsT9jeeeZoynqlzQI731YdFIi0XSgxTy+DT5dhbi59sz3
         Mpbh7NAFp6KQEGpDMHl895K+Rb9ygP1Z+IgspdeEoQSt/TM4HNNktpZ8IJbEI2w0i+Az
         FehzL63A+GbCfLfH6dQ5vL83FC7iQ6eTIRZwZWFN1ZBd6bHLcXWEB9IvS8rLo5RExejb
         Q5G3zQmBhH+UeP773E4ylaArpoQGhu2Wtggg4CknBUU4vKf1DySL9v3XVuAr6rPX+j4t
         qGrQqYqK+UrzNcWSJ7NmhZ+b71ywIjZLRY/LgIXwnGyMzwQg+rnhxjQKEFmIfZhVK3Yf
         cjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880994; x=1730485794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwHANkg+/AKNAbqmNyaZ1upVuNY4lRhpwrCYjr5MFeA=;
        b=Dyo9ah7reCGvvBM/RKi/oTLSWObSCiNPBWsNrkjVxqCgqqRj41E4aTNHuULfw2Hocl
         adjCIUMcOjvadN+Jw76ubv/ACdRdYtRqMk1IXh3bakQGFcHa40tVz8q0MgS+VocGIt9W
         dqdl1OKkfdgfpCVJGHDtOqWyet5vV3ZMUCA8ilRQ/5QmQYcI5fmdAipTtEEyzjMDLy02
         cR4yYYi5mqy5T9u0p3u0jtSxypx3o+rESOHnaiTnX3UqLBlnIFUmJ/D6+dRoVygjUB6x
         lYSYD5txPQ0VHlimgPsG3SeRT28MoT4P2c/jILdUW+V4HtUjPfocu0sekiz/vMSRyqqA
         mgOw==
X-Gm-Message-State: AOJu0YxNNJi5n17ae9K42iGgjoF1dj9ohn/1gF9T4GStH1Q7bwk0RGyE
	oW+UO0pw1dt5JkWbthAqmtuI+xoTg8Ivse2QUbhoc64z7tuzqa+U6x9KVk5UFa76Mo1z1mD+czI
	5
X-Google-Smtp-Source: AGHT+IEU6qaqn870WZd8Pw+TqYGF1por8Wn8RwRHhSLevHN/TgWTPYM3dhWYbNpyyQFTE0LkcneeoA==
X-Received: by 2002:a05:6e02:2162:b0:3a3:40f0:cb8c with SMTP id e9e14a558f8ab-3a4ed2e92a3mr1790455ab.17.1729880994383;
        Fri, 25 Oct 2024 11:29:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] rootfs-postcommands.bbclass: make opkg status reproducible
Date: Fri, 25 Oct 2024 11:29:29 -0700
Message-Id: <0520ec21a0f595a68c2869dbe613633f0594d3d3.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206370

From: Jonas Gorski <jonas.gorski@bisdn.de>

opkg stores the current time as Installed-Time in its status file when
installing packages to the rootfs. Make this reproducible by replacing
Installed-Time with ${REPRODUCIBLE_TIMESTAMP_ROOTFS}, which then also
matches the files' datestamps.

Based on OpenWrt's approach for the issue [1].

[1] https://github.com/openwrt/openwrt/blob/main/include/rootfs.mk#L103

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61a9b1b1cb618ce90ba7886036f41263075c07df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 920da94ba2..5f4d67f93c 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -487,6 +487,10 @@ rootfs_reproducible () {
 			find ${IMAGE_ROOTFS}${sysconfdir}/gconf -name '%gconf.xml' -print0 | xargs -0r \
 			sed -i -e 's@\bmtime="[0-9][0-9]*"@mtime="'${REPRODUCIBLE_TIMESTAMP_ROOTFS}'"@g'
 		fi
+
+		if [ -f ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status ]; then
+			sed -i 's/^Installed-Time: .*/Installed-Time: ${REPRODUCIBLE_TIMESTAMP_ROOTFS}/' ${IMAGE_ROOTFS}${localstatedir}/lib/opkg/status
+		fi
 	fi
 }
 
-- 
2.34.1


