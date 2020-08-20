Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.105579.1597910479842945542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 01:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bk08KexD;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id o5so763809pgb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TH9xpz3KuXXUFlkqdY4rLpqdjsw/2e+fR0HxCRxcH4I=;
        b=bk08KexD9bolhiDwJBovqWh7VJt19re9AvEyoEq3zzL1lWNSzwREzp810fvHJlX8pB
         Zb23w2NOS4j/mNnHNupuj9V132UNzwNzT+xbL2J0eijENuEqZIGnGlvNvnhOKAUConrT
         rtBLm1wXjOtHYIowphLxQUHYWgqgfvG3DP5F73VygFSun/5xpzLcvDy/62JAin90OhL8
         Uf30JP5iQQoIsbgKflkDP4Xq8Jc2iBhdMFLOyE6WqJGGCq6jf5pNjM6QtqOOQKwiVa5/
         u7yV2NA97q0KsMpY/bkVu/yJ6OHeWaoyy4YFhqpQUtvMuKH2ulXpqjdk5SNzCIpCl5hl
         l0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TH9xpz3KuXXUFlkqdY4rLpqdjsw/2e+fR0HxCRxcH4I=;
        b=TInuDuaKXY0dYXrJwtbv4uqQgqDLaGclw+4Kc+y6ZcUDpxmNojAqIY4p90apASbsTh
         JR6XuQ8/soiYt5OLLOd4zhNLGAZ6PbWm6bW7z53zW63uq7rQ/SsNIJ1ZRCrhvsIeGj8Z
         31oa7cwLf8CbAkDezK6AkDpotf5ZMUeP0GjbCOHBVQz7B3sA/NLDmXYlZcM1nNkNS/Jr
         8piK2Wey5jDzrp68WAX3zcdRZimD2AK0NuhzKAnIQA2TVSiqMTuRfmAcFu3SVR2UyFm9
         92mTW+ylkylHX8lBOLtu6ekpX8Jgns+/crpO1lm3ggeA/8omANjr7iISQL4CtDcnZ7zo
         R7hQ==
X-Gm-Message-State: AOAM533/OGnyCElHQrx6eVzbsRJl5o7vmXiBRBkE1LXnjLG80qP39zF/
	rLONmrNMmqoXiFFej6ryKS7iz1AfjWTRag==
X-Google-Smtp-Source: ABdhPJxqol5V9iD+KgIki6L9iYatTOOmd25I/eUITf3sBsyB8eiifwzUc2p1YGXu550g+UJ8kjS8NA==
X-Received: by 2002:a63:f30b:: with SMTP id l11mr1634129pgh.445.1597910479077;
        Thu, 20 Aug 2020 01:01:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id mp1sm1402119pjb.27.2020.08.20.01.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 01:01:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH V2 2/3] gcc-cross-canadian: Install gcc/g++ wrappers for musl
Date: Thu, 20 Aug 2020 01:01:14 -0700
Message-Id: <20200820080115.2715139-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820080115.2715139-1-raj.khem@gmail.com>
References: <20200820080115.2715139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
configured for glibc by default, this helps in creating correct
compiler defaults for musl based SDK compilers

[YOCTO #13459]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Leon Woestenberg <leon@sidebranch.com>
---
v2: Delete file before creating wrapper

 .../gcc/gcc-cross-canadian.inc                | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..c5935b978d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,29 @@ do_install () {
 	chown -R root:root ${D}
 	
 	cross_canadian_bindirlinks
+
+	for i in linux ${CANADIANEXTRAOS}
+	do
+		for v in ${CANADIANEXTRAVENDOR}
+		do
+			d=${D}${bindir}/../${TARGET_ARCH}$v-$i
+			install -d $d
+			for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
+			do
+				p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
+				case $i in
+				*musl*)
+					rm -rf $d/$p
+					echo "#!/usr/bin/env sh" > $d/$p
+					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
+					chmod 0755 $d/$p
+					;;
+				*)
+					;;
+				esac
+			done
+		done
+	done
 }
 
 ELFUTILS = "nativesdk-elfutils"
-- 
2.28.0

