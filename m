Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08ADC021B5
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 13:58:54 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.23326.1740146329507860060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 05:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=VZozp6AC;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 51LDwkro2170485
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:58:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1740146326;
	bh=4hkasL4rktzImzher/upS8Hob84hwXqZCDrTsm5j+tk=; l=3383;
	h=From:To:Cc:Subject:Date;
	b=VZozp6ACnVg+yh26hQhuK+6R8m2GgjNnTw4MQ5TEC5lRM8n1s4dAoyGg6ajjGMscP
	 eBJyve641sCg34iR/6S48bgr1kw1GOxcs7ItNFu4KLgklhrgllYiLQ7K0ASP8pVpQ7
	 AaYe0lyFXMXvxNGugP9bG8aOiO83MRS7c9kr9gfcxxIc68L9qSsgY+2hhZ9lBvJuHN
	 05qVeU62Qd7v5KNrRvGnO/P84fQT2BP7/kay56EJzwftc8Is8rf96ZLbt2aGlCQSza
	 wedwEpj98borMZNRd1+POzQGl6eQ/XQuSMN2FeuemKG71FIvz0oktnEwei21HetobC
	 mx9xf68el/Vkg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 51LDwhX8926569
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 21 Feb 2025 14:58:44 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id JSQQQDUHGA; Fri, 21 Feb 2025 14:58:43 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 51LDwhEa2121878
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 21 Feb 2025 14:58:43 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.98)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1tlTYB-00000007L5D-04mW;
	Fri, 21 Feb 2025 14:58:43 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/2] cargo_common: use 'config.toml' instead of plain 'config'
Date: Fri, 21 Feb 2025 14:58:38 +0100
Message-ID: <20f200e881bf71d035de9823cc2270bbe9a8fe77.1740146289.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 67b886938c284250d7b4172d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 13:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211797

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

cargo configuration has been renamed from plain 'config' to
'config.toml' in rust-1.38.

Using the old name is still supported but creates warnings like

| $ cargo
| warning: `/sdk.../home/cargo/config` is deprecated in favor of `config.toml`
| note: if you need to support cargo 1.38 or earlier, you can symlink `config` to `config.toml`

Use the new name.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/cargo_common.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c528ae7f39d2..c9eb2d09a522 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -47,14 +47,14 @@ CARGO_RUST_TARGET_CCLD ??= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
 	mkdir -p ${CARGO_HOME}/bitbake
 
-	cat <<- EOF > ${CARGO_HOME}/config
+	cat <<- EOF > ${CARGO_HOME}/config.toml
 	# EXTRA_OECARGO_PATHS
 	paths = [
 	$(for p in ${EXTRA_OECARGO_PATHS}; do echo \"$p\",; done)
 	]
 	EOF
 
-	cat <<- EOF >> ${CARGO_HOME}/config
+	cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 	# Local mirror vendored by bitbake
 	[source.bitbake]
@@ -62,7 +62,7 @@ cargo_common_do_configure () {
 	EOF
 
 	if [ ${CARGO_DISABLE_BITBAKE_VENDORING} = "0" ]; then
-		cat <<- EOF >> ${CARGO_HOME}/config
+		cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 		[source.crates-io]
 		replace-with = "bitbake"
@@ -70,7 +70,7 @@ cargo_common_do_configure () {
 		EOF
 	fi
 
-	cat <<- EOF >> ${CARGO_HOME}/config
+	cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 	[http]
 	# Multiplexing can't be enabled because http2 can't be enabled
@@ -82,7 +82,7 @@ cargo_common_do_configure () {
 
 	EOF
 
-	cat <<- EOF >> ${CARGO_HOME}/config
+	cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 	# HOST_SYS
 	[target.${RUST_HOST_SYS}]
@@ -90,7 +90,7 @@ cargo_common_do_configure () {
 	EOF
 
 	if [ "${RUST_HOST_SYS}" != "${RUST_BUILD_SYS}" ]; then
-		cat <<- EOF >> ${CARGO_HOME}/config
+		cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 		# BUILD_SYS
 		[target.${RUST_BUILD_SYS}]
@@ -99,7 +99,7 @@ cargo_common_do_configure () {
 	fi
 
 	if [ "${RUST_TARGET_SYS}" != "${RUST_BUILD_SYS}" -a "${RUST_TARGET_SYS}" != "${RUST_HOST_SYS}" ]; then
-		cat <<- EOF >> ${CARGO_HOME}/config
+		cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 		# TARGET_SYS
 		[target.${RUST_TARGET_SYS}]
@@ -110,7 +110,7 @@ cargo_common_do_configure () {
 	# Put build output in build directory preferred by bitbake instead of
 	# inside source directory unless they are the same
 	if [ "${B}" != "${S}" ]; then
-		cat <<- EOF >> ${CARGO_HOME}/config
+		cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 		[build]
 		# Use out of tree build destination to avoid polluting the source tree
@@ -118,7 +118,7 @@ cargo_common_do_configure () {
 		EOF
 	fi
 
-	cat <<- EOF >> ${CARGO_HOME}/config
+	cat <<- EOF >> ${CARGO_HOME}/config.toml
 
 	[term]
 	progress.when = 'always'
@@ -129,7 +129,7 @@ cargo_common_do_configure () {
 python cargo_common_do_patch_paths() {
     import shutil
 
-    cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config")
+    cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
     if not os.path.exists(cargo_config):
         return
 
-- 
2.48.1


