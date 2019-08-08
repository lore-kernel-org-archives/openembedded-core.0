Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBB307F27E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 31so95538133wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8GWth9diprdOH9K3kkXe+BuIY3yS9vkserz5CEVJu9M=;
	b=sEarcnOZnZeX3n8d4DLv2VXnDvs3YPz7RdlUmuyLVtVpqNDe8Ok0FkrNip6NDgpb2i
	izy2ix8HngX6C4iwN0vW6ePnvpHS/yO4hvY0HTCFRciVwtUCDa0ftxi9hTT9u6BvnX0A
	KZvgNmCK1zn9i8kCtNGL8QjYqCBavhqHM0hdTwZiSO3jHfdC6EbFgHIEM+uxHa44jUgA
	D1JxvoZu7ElcS7occA6e2SGsUcS1a3LFwIQpPTmDN3HR7HRx1XSpkafDvrWhbCf8t7gc
	fDuMmIUl+rharEKP3oA+7+i2b8rNDW85NpxgNX1QaoxW4LKYxJt64SOQX7fZcirGnxRE
	Se/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8GWth9diprdOH9K3kkXe+BuIY3yS9vkserz5CEVJu9M=;
	b=jDepOH35f+GCd1WraqKHiJEosWmQc3B5G1RgQqY88x2t5MMa2epMgU/CyOhAK0HRFK
	2jg5Q4YsWkUqJROuSyaAW3Zy+1HrcVeeUvTJMDlyMuozsbFuaeO3QnRcIvDwtUOPDZ37
	RKPfYVgSwYmLrjODDiMc37JBc83oaEdPfJ6f6ufGwa+86RQOXg8CDbfdYO/2zXACjlHQ
	9nfoHzn703nm+OMQHC4RamZln63wAHXEXm2du8CP2Lyqjpf09rr1NC69m2pzM3ZctmwD
	4XiBDc+9BM4yjC7CPIMQgjTEzk4zqYZhFoqY9fjuzANxySA4agSTJaazv/cvnQ8CLA6V
	hmGg==
X-Gm-Message-State: APjAAAWVWg8RjYBuAs9a3oInjPDLPtP6wKutX8Ip7CUtghce2HLzhFrM
	SMlfBd1qc95Vr2PCkuSUNUqaSYR+/B0=
X-Google-Smtp-Source: APXvYqyipKiR4vDU15zAZff9iQc8JrNu9aBKiFlaoJpCqOi2aMcrQGbEQK+fTEXVihFjco1DH/lqpA==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr18603101wrs.88.1565280715526; 
	Thu, 08 Aug 2019 09:11:55 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:44 +0200
Message-Id: <20190808161150.44877-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/7] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:56 -0000

The recipe is special in that it does not auto-detect them
at packaging step (via EXCLUDE_FROM_SHLIBS). With the recursive
RDEPENDS qa check gone they need to be listed explicitly.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 807e47e0ee2..44d8ea87be1 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -152,7 +152,7 @@ do_install () {
 
 ELFUTILS = "nativesdk-elfutils"
 DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
-RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib nativesdk-gmp"
 
 SYSTEMHEADERS = "${target_includedir}/"
 SYSTEMLIBS = "${target_base_libdir}/"
-- 
2.17.1


