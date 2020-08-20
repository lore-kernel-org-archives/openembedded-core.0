Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.105576.1597906653192840656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 23:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=py8VGZgb;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id kr4so561947pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ND3BOw1C+ksmzrW2xHONH4rzX7qxzHFL0dKUa/kWl3w=;
        b=py8VGZgb5lo7lH0rmpOL8r026ngXsX2c5HGBaQYm5Czk4bDkDIwBYlpaGqPmyu+sUU
         Zm/H/sXAOSEGj7Lv2zFUDlli84/AbsSVZZk6KQsydLjX/v4u5ZfgGRSy5WQmZFGrQdoY
         WN1lntx5uKy1Cu5rHgt8LhilhbzOBWn+7M9YLF1s0W5UuLE505v/YuAdqsJtlAg36a2Z
         WLjAMCdf5G/gfkmnd/ms3D07OJyg6L0C0+hJDthbLO+hkxCxSYE1JT2mThahicR2PXFM
         vGdbk2YSr3TKZt6My0mPSSH5qo2p3KInLJI4AoDreRKgd0+OGa+r0XIYdjfCtqkQzCsQ
         tCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ND3BOw1C+ksmzrW2xHONH4rzX7qxzHFL0dKUa/kWl3w=;
        b=imtXjInwA8+CsNAuv5IM4b+Z/y5/89Znz7wICIu2R4H/vnDfRcwStjE8v2qYQz5Pe3
         JkE4ieiV2wYibVVGaH3Iyv27i77S6sKpEBC/YHNG4QvycguXKNqCaLAzeK4AgOagERRI
         Z75Wt59ck7AgMOUpZUK1xCGy1OCby5yzdbC8hR3zShQs/eG7njQaIFIcmAvqRFg4QGlj
         DWHlqv/BqW2gmKXFI8xxVfmXWQqVplhLg7f61cMDDVpCeZA9GcialLgE48lOr8KFp8zr
         uRNPPALLZ8OBKVKQr4u3wDyaAaDjnX7tfqi6m99eUGZsFYlH2rOUp/J/9ySFuFOEU3hD
         sdbw==
X-Gm-Message-State: AOAM5328q3VrkQAZgH4FaTEodbrUlSq5lSs46K0o9h47a7WrMTC+Wwvy
	0Wl+4Bc5vLOV6eq1Mi2sk1rcQrhGEZPWhw==
X-Google-Smtp-Source: ABdhPJx9KO8jyFK+1nhEhy/rsasXBzn5Hbhzhc4YDxyADMa7762w1YG94XDt8u8ImR6oTpTZLQvrLA==
X-Received: by 2002:a17:902:c3c1:: with SMTP id j1mr1537447plj.315.1597906652444;
        Wed, 19 Aug 2020 23:57:32 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id 77sm1534936pfx.85.2020.08.19.23.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 23:57:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH 2/4] gcc-cross-canadian: Install gcc/g++ wrappers for musl
Date: Wed, 19 Aug 2020 23:57:25 -0700
Message-Id: <20200820065727.2589128-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820065727.2589128-1-raj.khem@gmail.com>
References: <20200820065727.2589128-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
configured for glibc by default, this helps in creating correct
compiler defaults for musl based SDK compilers

[YOCTO #13459]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Leon Woestenberg <leon@sidebranch.com>
---
 .../gcc/gcc-cross-canadian.inc                | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 553ef7fe62..49127192e5 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -139,6 +139,26 @@ do_install () {
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
+					echo "#!/usr/bin/env sh" > $d/$p
+					echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
+					chmod 0755 $d/$p
+					;;
+				esac
+			done
+		done
+	done
 }
 
 ELFUTILS = "nativesdk-elfutils"
-- 
2.28.0

