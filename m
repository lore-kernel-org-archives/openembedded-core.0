Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41EECA0EDB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 20:52:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.86138.1755031923297200096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 13:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MR2wuKmn;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af93381a1d2so946461466b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031922; x=1755636722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uI/+Ko3lE7jQNoA3fuF0Hvt5DVfHzOKt/819htLLlN8=;
        b=MR2wuKmnZpP6Szc3JO8fOc+wXGxa5FR3qt8aPkNFsPMBf7ToX22hqvNydpfh4R5Emo
         fPe3GrEz0YgWhfvJDgcQO6/KE8a8tz+A3O5AuuLRwmyRqLtt/JLjLWr3/66UshN0jpp+
         o4E3J4/3zQihcMnuQrBXsseuybaxiu9qXAhvRtkZw7ArzoJyCYvQhBafTVcwU4INb6w/
         SZMAYTqvL8sdcqhAY/RuNrca57X9V3UTlYl0jIImZR6MLVXxumP8olHP6wstoOXCxxtH
         /Y0Sa+KepK7EASCOkCrA4VO312ziB8t7+CBT5Uw2f0YCqZsRAlJHGYjLob/g10vN+PGl
         mcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031922; x=1755636722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI/+Ko3lE7jQNoA3fuF0Hvt5DVfHzOKt/819htLLlN8=;
        b=DLKNH4NTNMGdn53W/wcmHn93wvI+BzJUqlRYsS0qcjsNPJvnELTLT/b/eUV6sa7j3P
         vt2ynRI4NcX8DdX/IdJ2pUtNjRjMHCJ+djUMzohkFkwjJ045mRHGSgy/Gqquy8sSW3Gc
         PlGLlm8J2F4Z3vtkGfdzMNfQvCbWQ2xxI6C9i6dxVvZWkr54/eYmzTQGcd570QDBPYx3
         5fzzZDD4McxNu1bCI6pXjYM14Ixit2CwULLkVxbzQgWQwhlYqpEYx3OQo8iq3LqfrnPf
         QXjU2cEbVArtvPe/pBJVb7XglZVErOseo0ktt9bn5VQPLf4JBQwt6rv3RHdzhOls9+og
         J0Rw==
X-Gm-Message-State: AOJu0Yz5Hcw1M1lXmVoj0o6SdpATfJifYBClRIrky5alTb6UNTjf0P3G
	BjwjyBRyAJtCqx8b0nG89gL/Lz1Ioz5rEx/vUYHXmo+J583NV8sNWiBitKP0SCjUDzg=
X-Gm-Gg: ASbGncv3zB3nxoNqr0kNfM43drtycU44JhxZLEAO2bQ3JZHftyA3NIyHTSmLYfSGwQE
	v8dWlhMEmzTtp/R6C8K63C3J1KsGogo3WcIc3G/f6UlKIhSWL6bkWVgKkG/OJHz2AXa+qn9ax3x
	IzrN/SxXUFfv6YaggPOdF178kufkm5e63HuBYYrasoDr77TMVRVVoMVR2+DWqUorGYNlNY7nGRs
	bkIScp21HdK32D0Kh4Gs8JmClRCMYkVvBWQwEmLRmwdVOhwD8sl2H5P0IAJ/WNst64CV4zY6zVR
	nEEhXJe9DAxojg7idcQCLZIp3U52TES/o9vZHzCcL7/QXRRjx1DGEVfaUVWwp5mURKUO+Q/GpMT
	uOej2krCYyZ0H9XXKPkbP7FUBYeBEE4H6G4HYXU7i29o0k01gv+P0KBld3FdldTtjsdTi1v1KoR
	/GU0lZiizTjfOyHQwXCBCkYF6LTCschknyLQf6VQ==
X-Google-Smtp-Source: AGHT+IH9jvphZi1hplOt5tUHq7DMLh8XX74GEX+DVut/g2w6Weu6QhC+894IbNaAOOOVZ+tfEzoOkA==
X-Received: by 2002:a17:907:1c26:b0:ad8:9c97:c2e5 with SMTP id a640c23a62f3a-afca4a919camr73863166b.0.1755031921457;
        Tue, 12 Aug 2025 13:52:01 -0700 (PDT)
Received: from DESKTOP-RK42V0R.localdomain (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a37a8sm2278759366b.40.2025.08.12.13.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:52:01 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2] go-cross-canadian: fix binaries install and GOARCH
Date: Tue, 12 Aug 2025 22:50:50 +0200
Message-ID: <20250812205050.13599-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 20:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221778

set GOARCH to HOST_GOARCH which is set from SDKMACHINE,
since GOARCH defaults to TARGET_GOARCH, which is set from MACHINE (wrong arch).

Also fix do_install to correctly install all binaries from
${GO_BUILD_BINDIR} by using 'find -type f' to avoid issues when the
directory contains subdirectories (e.g. "linux_arm").

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- Fixed commit message
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 39330fc98b..4a6f2f4c36 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -5,6 +5,8 @@ DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go
            virtual/nativesdk-compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
+GOARCH = "${HOST_GOARCH}"
+
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
@@ -51,7 +53,7 @@ do_install() {
 	install -d ${D}${libdir}/go/pkg/tool
 	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
-	for f in ${B}/${GO_BUILD_BINDIR}/*
+	for f in $(find ${B}/${GO_BUILD_BINDIR} -type f)
 	do
 		base=`basename $f`
 		install -m755 $f ${D}${libdir}/go/bin
-- 
2.43.0


