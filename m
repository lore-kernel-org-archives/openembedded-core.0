Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E800B78977
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y186so4930032pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EsVooicBH4ym8odMdNiw6ZT04hj2/MaaIOVmL9iVvIc=;
	b=kGfaPwMMqZ1rSKDZ4JGfqwwTdDBwKoGCoqP/GGyNYHfDmo4BlP80oz0O7WAaE2uw2X
	wso/3vPnJnNqr8QLRApn/5HIYll+AUWq1CpDGsqf9pfwQgQLWMvc7846h0+q75tWWir8
	8/CBd7zzStNthrauSKdNifzjY+WMdYvK2haoV/GbqGDFYVS6+viigxMHPtMLFkDbfwPG
	2+fZnr0u1GBPxgGtpZKOwJxtU0V5zKZUgsBhkqJh5yCRhNcKh6Mr7b+zvCFrlzKxN32W
	/6vZ8XVKDvKN8tdzQYPa+WKwKLtbYYzEI0DZP20c6+KmUYd97J//AsVtLJe3HCphhuA1
	I2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EsVooicBH4ym8odMdNiw6ZT04hj2/MaaIOVmL9iVvIc=;
	b=mtbSE2b8moGLUz/JbjA23zaFBVy0fxCgMRMjlOgtFOs2zMvwluUug032oF1Bkbmq/P
	KY/pxW1k4mS2WiYxFwY08kylUGQQAriseeRb+EU6P7EpJVEXZWkis2lMniTZzc/VDney
	a2XhZ7FbLAsbK/w1tjLG9BnDaHGYUs39/w7bfZV+3y/5AWL+u8u7QdjTvgMf6BIvVNUm
	Q1XYt+DX6gt8EDfgTaXJdSdSV2a7/QGz0ANgzm2QnytqHasU0E1+WscYGrB/wDPKTEfu
	NWWKMhsU3deqOnKd009boQorHsD38Cmgoeg88nI4ezTVA/gCIfN/r70YN4bETUpmaMO/
	BQsw==
X-Gm-Message-State: AElRT7Fe9evrHId0c7wNqC/rJxovhtwrpPiPXJ+/ud6LDrok0qMzJt2Z
	DpmAAyphqF3hht3coLWerzDSAg==
X-Google-Smtp-Source: AG47ELuzobyE50lWC+0zclSZC0ihw0apnxKsEfbuOqYrMxWtFUQyBecy62OfAWjnFAPIgRIfv9WzLg==
X-Received: by 10.101.73.7 with SMTP id p7mr3335150pgs.250.1521258046742;
	Fri, 16 Mar 2018 20:40:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm874800pfg.124.2018.03.16.20.40.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:33 -0700
Message-Id: <599013164ebd8a85844940a1b8b522dca3c1bf86.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] mtd-utils: Explicitly add pthread options to cflags
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
X-List-Received-Date: Sat, 17 Mar 2018 03:40:46 -0000

Some architectures e.g. riscv gcc does not add -D_REENTRANT
when enabling pthreads. Help it here by adding these options
while gcc gets fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 3c34bdd84e..d09d633022 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -24,6 +24,8 @@ S = "${WORKDIR}/git/"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
 PACKAGECONFIG[xattr] = ",,acl,"
 
+CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
+
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
 ALTERNATIVE_${PN} = "flash_eraseall"
-- 
2.16.2


