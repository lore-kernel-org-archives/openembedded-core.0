Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E84727F50D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n14so7357481wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KJF17fgMvqPXQ+EKBMa+7E3Rlo/CFvG4fuPBLEapcpE=;
	b=Ux4kxYPLlM+yc+3b0j+oh2jUAKnCUNhdhS+qTcCOVRLJk6UPSjhTSzWa+bp/OZcRDW
	wkOnClkpo7Ct1sAYZ00JWolyJ+/FimNVExaK2xXayaBOPgwZ9iOStH3WN3J4x7WZgiMX
	8RqqRDCl5pn/O77leHjCX95fZIMn3FgHsWcFANyrwkVn4/tROihVzW1g3YHvFzYyuh84
	/up/Dz1VudAHGAnsyD6TIb9T1YKbFpBmCzn4aIVluPmXTzqI96o0M5jr0fMzlIC+X37+
	G6nStwTFoAVQi8xlDuYBeknr1p4tRpfq7vImu3qA3fVJSN2339SVoJWUrM7dqHyMMaFx
	ObjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KJF17fgMvqPXQ+EKBMa+7E3Rlo/CFvG4fuPBLEapcpE=;
	b=qHfeujeqMhWZxvfxkLqQ3a2Bq/FF6QgDlR31A0PY73EHU5d36C7a54+3rTC4XP8XOH
	9fymwmJVvs5iZFNL+HOht3ThS6z113WR3XbAdKv2xjEvmsy15lMeXglvCPzH/aVRNz89
	cvjQw6hKKKqkPtD1COZ1dd07MkJuEEmBQOHEXu0AIdzmbvWwzG01MYbvj3vwcVkhkBgZ
	/W9jKlHyHfaO1OHbW16OvK+U47BO3jDlAPCBDBqO6iw9yAflc3eWvdNmvQ2Zc82eikn3
	9chuROWaPp6XXAFZIJzfTPen4gIyRkUMVPxtvU5ym+i21VtcWXLWYA5FJle3rtls6R5J
	GOZw==
X-Gm-Message-State: APjAAAWsbWNu2h8VRPBtqsOjAkNio5yu1OVvX7j+cKApi7O26mhyWuxr
	Z+r9crxiq4tdI/V9J8E8Bs2w+cRS0ng=
X-Google-Smtp-Source: APXvYqzhYww64YuNtgXqmBhOJ7U5DAor5XM5Y8Q7LvIJzJ1ZIglclSbMjrUMCYmUoA8fd2zacKK8TQ==
X-Received: by 2002:adf:8068:: with SMTP id 95mr8632671wrk.249.1570706339508; 
	Thu, 10 Oct 2019 04:18:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:44 +0200
Message-Id: <20191010111848.3825-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/10] iproute2: make elfutils support optional
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
X-List-Received-Date: Thu, 10 Oct 2019 11:18:59 -0000

The use case is as well allowing gpl3-free builds without
pulling in outdated meta-gpl2 recipes.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index d72871767f9..fc31b8444ee 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -9,14 +9,15 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
-DEPENDS = "flex-native bison-native iptables elfutils libcap"
+DEPENDS = "flex-native bison-native iptables libcap"
 
 inherit update-alternatives bash-completion pkgconfig
 
 CLEANBROKEN = "1"
 
-PACKAGECONFIG ??= "tipc"
+PACKAGECONFIG ??= "tipc elf"
 PACKAGECONFIG[tipc] = ",,libmnl,"
+PACKAGECONFIG[elf] = ",,elfutils,"
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
                 ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
-- 
2.17.1


