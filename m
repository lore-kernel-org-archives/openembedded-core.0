Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA9460C18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:04:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a23so9231088plm.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P36REPv26l5tbZQwZ4z/kip9GDLptzsUZtds4RNQras=;
	b=jg1p0STAK5KdQT5N0hq3VkrWw1+4dmFofcdfD6bI0DQvVLITQRvMq7+1wnCLQk0O7k
	uDEWu14pmpQ5MDKkvfqe3CP/Np5lso328fjZdUOiB8UZMM6QGld+3pu1mb07oaGwa9NG
	LGRfnHv5sdL3/OXGIOBivQXncbPfwoZPF3x1V9QPV8Rx8WRKuJDQcqX08TGLanXCty+m
	LH/hOKlXlaeVsDBTTJ/Im4JM+loEwT4RjKTSVHg9qIljltRsjuKAjG+7WYnoPWVYa73Z
	L4P5YikoUHzChpUSv3jqi/01PtmmdhjbenA4Z7NRVXvltC/mQOTTC00iWvDZWETa2cEF
	LFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P36REPv26l5tbZQwZ4z/kip9GDLptzsUZtds4RNQras=;
	b=mpSK9c5D6hdUncBEpJ3ul61fKKXlxqJNq2VEIjuaKLA/kVS+bV5cgbeQ2I09PVgqHT
	j3aGBMiIDGd4i2i7STnvSGGQ/H9vZlYKCoP6ZIgcTjmi8Dz6wOxlvAYLsYft2jHZGhrd
	QB5EIegl8FanLFVig/AO6dinV5kSPeW8lwurF3NZ5pRVjbXV8EOLrSFF6UnOU3lTUQjj
	PrDe1qLie7Ld+tm8n6SWIgvu7ZriaxkPcU8qj3TEPOEWL0E9n8GTbMcw9sCGcYmSd6w5
	jQ0wAPy4ZLIKFqKikfX/UGrROm+txEHMCkserPQP0dft4YVdLitgTzOyMuyAlN4wOFoc
	y7Bg==
X-Gm-Message-State: ANhLgQ18Nt5YojQpEBnFG5LMAVnK48kMgBc7K4g3424SX8C9YLTVuybf
	rNlOBiIK2EiOFS1nCb9fGBzWvZJjrYU=
X-Google-Smtp-Source: ADFU+vuButTr/6s9i6E6Md1CpnpZQPK4q+L6pSUM26gDIaqQOEon5E9MG1WsE39VGcCwSgi8c+LbuA==
X-Received: by 2002:a17:902:8604:: with SMTP id
	f4mr3074762plo.278.1584428646736; 
	Tue, 17 Mar 2020 00:04:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::593])
	by smtp.gmail.com with ESMTPSA id
	jz19sm1754331pjb.48.2020.03.17.00.04.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 00:04:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:04:17 -0700
Message-Id: <20200317070417.1250936-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317070417.1250936-1-raj.khem@gmail.com>
References: <20200317070417.1250936-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] musl: Add support for multilib
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
X-List-Received-Date: Tue, 17 Mar 2020 07:04:06 -0000
Content-Transfer-Encoding: 8bit

ldso is always stored in /lib regardless of multilib
add ld-musl-${MUSL_LDSO_ARCH}.path to aid ldso finding default library
loading paths, it helps when using multilib, where system libraries are
moved to lib32 or lib64 paths under / or /usr

[YOCTO #11971]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 2a15a78cd5..82379fd1c5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -29,6 +29,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            libssp-nonshared \
           "
 GLIBC_LDSO = "${@get_glibc_loader(d)}"
+MUSL_LDSO_ARCH = "${@get_musl_loader_arch(d)}"
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
 
@@ -48,7 +49,7 @@ CONFIGUREOPTS = " \
     --bindir=${bindir} \
     --libdir=${libdir} \
     --includedir=${includedir} \
-    --syslibdir=${base_libdir} \
+    --syslibdir=/lib \
 "
 
 do_configure() {
@@ -61,8 +62,9 @@ do_compile() {
 
 do_install() {
 	oe_runmake install DESTDIR='${D}'
-
-	install -d ${D}${bindir}
+	install -d ${D}${bindir} ${D}${base_libdir} ${D}${sysconfdir}
+        echo "${base_libdir}" > ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
+        echo "${libdir}" >> ${D}${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
@@ -70,6 +72,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-glibc-compat"
 
+FILES_${PN} += "/lib/ld-musl-${MUSL_LDSO_ARCH}.so.1 ${sysconfdir}/ld-musl-${MUSL_LDSO_ARCH}.path"
 FILES_${PN}-glibc-compat += "${GLIBC_LDSO}"
 FILES_${PN}-staticdev = "${libdir}/libc.a"
 FILES_${PN}-dev =+ "${libdir}/libcrypt.a ${libdir}/libdl.a ${libdir}/libm.a \
@@ -83,3 +86,4 @@ RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
 LEAD_SONAME = "libc.so"
 INSANE_SKIP_${PN}-dev = "staticdev"
+INSANE_SKIP_${PN} = "libdir"
-- 
2.25.1


