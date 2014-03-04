Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0EE6E9D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 16:46:07 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so1064608wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 08:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jkG0+RSb8OVcQVcNT+rqbU4eb65HgYUarxVytCUTvQY=;
	b=GLUm9zoByfCKEV0jF13YNDstpj2rB3wraQlVvrKP5oBmKoA6nhiQcjfmt0imU1rhv/
	FQrxIhMlLlFP/Xl1blWHu7AMI0RrQrlUNJoDc5QBeIOnuQ+ldhuFZRj1gM2NT2oPGvjF
	SQ6rVoCvZk797zhEa+aMHZ0Loj9XHuiFEYM5BNC91cPdAYfrHJLCjzDRikW9LH8w4q4u
	+7zyYZJgv7kDN+x5kBslg/Bf0Gy7c03IQAkIBgolIF1liQq1MoaEsfkViYj8LTeOqDXL
	8PJxGOBY4+lfwn5SInmvLtbg2zX8MfHylCXELJ2/pgFgPMSGrNiooya7lu6mZIqm0Mlb
	s38w==
X-Gm-Message-State: ALoCoQnRM99JG5z0XEqkbnnRYE0DZ8nTCDznDr/MX9zgo2knYkBzcJlKWQzZgacoYM4hCIvlgi3i
X-Received: by 10.194.2.194 with SMTP id 2mr600336wjw.73.1393951568441;
	Tue, 04 Mar 2014 08:46:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uq2sm54540928wjc.5.2014.03.04.08.46.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 08:46:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 16:46:01 +0000
Message-Id: <1393951562-14251-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393951562-14251-1-git-send-email-ross.burton@intel.com>
References: <1393951562-14251-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] gcc-cross: don't use oe.path.relative
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
X-List-Received-Date: Tue, 04 Mar 2014 16:46:10 -0000

Instead of using oe.path.relative, use the Python Standard Library function
os.path.relpath.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 477f499..8d979b1 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -95,7 +95,7 @@ FILES_${PN}-doc = "\
 EXEEXT = ""
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${bindir}"))}"
+BINRELPATH = "${@os.path.relpath(d.expand("${bindir}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 5c4319f..777c970 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -138,7 +138,7 @@ STOP
 INHIBIT_PACKAGE_STRIP = "1"
 
 # Compute how to get from libexecdir to bindir in python (easier than shell)
-BINRELPATH = "${@oe.path.relative(d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"), d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"))}"
+BINRELPATH = "${@os.path.relpath(d.expand("${STAGING_DIR_NATIVE}${prefix_native}/bin/${MULTIMACH_TARGET_SYS}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install-host
-- 
1.7.10.4


