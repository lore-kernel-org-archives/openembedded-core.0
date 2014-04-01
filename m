Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0C3026084B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:08:04 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id b6so9304086yha.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=eox6FQ7oH3rUg0T2elI2Iv5TsMnzT/Qa7+gQymIMqUc=;
	b=H3b5vUDzI0a+NDR0K1A82t2X7JJ9ROSjUmbXATd+R/PAyczcPW0xlG6gU4P5FrocP3
	x6pvZqak9nWtLI3aGBFiCk3YJDLFVkG6lce38tZVmccE8agEHwcmd+CMI4scgRvdnNY6
	GNtxf+mctFHrsr230DIsLMUC7LHIfWQlZT4KW/cWOyed3DduUO3FDk53rUP46k5lmEdT
	K6eERxpXzOsM/fvAI2FfXY6NgaZJq9jFZ73V7JmXJO9YQRhF4sLIUzFe0SHl10abEu8l
	uXN7fgsbAonhO9KbyRxD35hHra98d5yDvo8B1O5tV/pzyac1BHVoTBxFGB3YwO6xFsaZ
	IxiQ==
X-Received: by 10.236.199.212 with SMTP id x60mr14789470yhn.90.1396372084933; 
	Tue, 01 Apr 2014 10:08:04 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id y9sm31313654yhc.40.2014.04.01.10.08.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:08:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 2662A19F8126C; Tue,  1 Apr 2014 14:08:01 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  1 Apr 2014 14:08:00 -0300
Message-Id: <1396372080-27607-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
References: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] alsa-tools: Enable GTK support for X11 and Wayland
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
X-List-Received-Date: Tue, 01 Apr 2014 17:08:07 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This patch depends on the alsa-tools one I sent some minutes ago

 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index 4f64a38..fdbe82a 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://mips_has_no_io_h.patch \
            file://autotools.patch \
-           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
+           ${@base_any_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
 
 SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
 SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
@@ -20,7 +20,7 @@ inherit autotools-brokensep
 
 EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
 
 # configure.ac/.in doesn't exist so force copy
-- 
1.9.1


