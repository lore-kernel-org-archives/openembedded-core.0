Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f173.google.com (mail-wj0-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id CBE8C70100
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 11:23:22 +0000 (UTC)
Received: by mail-wj0-f173.google.com with SMTP id xy5so201569065wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 03:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=04NOm0sggUVP+uKvrY+djyy3T9MDYHMn/GcNIo7jb1k=;
	b=QrB8+GvUBTBixK/tRT6GB/4KVtvjY4uFMK4WhAXvfYuywItR5FYxxcI03xRGVRxPTz
	m5j9gFexmKciKnxcUNRqT974HX6q5Pg0yQYaef1tQv1D+uVN7ecvFVtVD28efJelqjeS
	ZuOzrSwAriLLhp25OxEOTmN9hih3fZ/VBhepYuho5n6N6geqz625E+K5c5nN4aKXTAIC
	6GAmH4pOUyNRO0VnH5UEfwprtWUZwLJFWMuBp4LU5OJxCxkS8JtjpwkdrK1EXHAmCbNM
	4AqjC+jiPip2CO9KcxzN+pR5oMijONLRcusNKQc4zbV/M94Mjc0MhGgH2iWuZb3Y80pF
	xAcA==
X-Gm-Message-State: AKaTC02kU2rhVwyfaxcmt2nm4XSAzZaO5v2GwVyS8S8OyTCdgiQz9h+52qbzKjRmezGguw==
X-Received: by 10.194.148.134 with SMTP id ts6mr32727540wjb.220.1480591403641; 
	Thu, 01 Dec 2016 03:23:23 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d85sm12736909wmd.17.2016.12.01.03.23.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 03:23:22 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 11:23:22 +0000
Message-Id: <20161201112322.10190-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] arch-mips: sort new MACHINEOVERRIDES by priority
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
X-List-Received-Date: Thu, 01 Dec 2016 11:23:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

While I couldn't find explicit documentation, it appears
that the list of MACHINEOVERRIDES should be sorted from
less specific to more specific left to right, so that
more specific overrides take precedence.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index d8b2bcb..ec3af0a 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -52,15 +52,15 @@ TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKG
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
 # Various Global Machine Overrides
-MACHINEOVERRIDES =. "mipsarch:"
-MACHINEOVERRIDES =. "mipsarch${MIPSPKGSFX_ENDIAN2}:"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
+MACHINEOVERRIDES =. "mipsarch${MIPSPKGSFX_ENDIAN2}:"
+MACHINEOVERRIDES =. "mipsarch:"
 
 # Base tunes
 AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
-- 
2.10.2


