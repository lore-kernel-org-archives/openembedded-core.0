Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id C16FB6AE0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:56:46 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id n1so7592090qcw.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=ZL61ax9lg8jDOo10iX8jTlgQT4uIb5t+GuT5ztDPYAc=;
	b=NlJQh3VJQTxk0XMFBpKGF38bpwmLOZPlysVhazMoV1Yy0ySPTC1QDasXaJK8ShPEMw
	YBcQR9xr1/Rysa2whU5zfWYTXC0Hes9IDSXYKQOKEBupwS0Ewml9rsm/zWrhucqzefW1
	Wj0akR2Z6nUwSyUtwqRnUiUtiTEuoOjJTYtmAyGST2RePyVYQ3KUatc6lwC/w3iaBK+R
	vIda8JZfWI8m5+fG8ByCtdl/Aeb3+U4D8z9l3GBywcFHsYNvrQSUkGDczEMdnV7M+L2N
	2r22U2Yy9gZ5HISu88z5skplzt6BagT7cq4zMN5MJwc6nSu0txIKjVIFuMmXQwy816fi
	qfTg==
X-Received: by 10.49.71.70 with SMTP id s6mr137488qeu.66.1372183007225;
	Tue, 25 Jun 2013 10:56:47 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id n7sm27415147qat.1.2013.06.25.10.56.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 10:56:46 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jun 2013 14:56:27 -0300
Message-Id: <1372182987-27781-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] alsa-tools: Pass ACLOCAL_FLAGS so aclocal uses the right params
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
X-List-Received-Date: Tue, 25 Jun 2013 17:56:47 -0000

The compile step ends regenerating the configure scripts included in
the source subdirs, for it to properly work we need to pass the
ACLOCAL_FLAGS or the .m4 files won't be found.

,----[ Build error ]
| ./ac3dec
| aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
| configure.in:18: warning: macro 'AM_PATH_ALSA' not found in library
| automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
| configure.in:9: warning: AM_INIT_AUTOMAKE: two- and three-arguments forms are deprecated.  For more info, see:
| configure.in:9: http://www.gnu.org/software/automake/manual/automake.html#Modernize-AM_INIT_AUTOMAKE-invocation
| automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
| test/Makefile.am:1: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
| configure.in:18: error: possibly undefined macro: AM_PATH_ALSA
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| make: *** [all] Error 1
| ERROR: oe_runmake failed
`----

Reported-by: Rogerio Nunes <rogerio.nunes@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 24af545..a18cb46 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -33,7 +33,7 @@ do_configure () {
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
-    export ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
+    export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/"
 }
 
 FILES_${PN} += "${datadir}/ld10k1"
-- 
1.8.3.1


