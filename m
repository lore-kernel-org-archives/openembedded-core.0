Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3FF270030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:12:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id k184so18605675wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=v1Nt29cRd9GN7XyeoJ2Ay7PsTRTwrCVx98CQxl2m6og=;
	b=AjfIBJy6Fxfj6S+hGM3gvU7YYj2tFSb9GOoz2grsP50AhrgMW0Lzd8DWeHG2mQrQ1o
	WS+J6oLYs1B7CCqm/5JwhxjEu6ll9ZHqBE/TScWpSVzyZYD6yN7mhEO0RDObcUfaiegB
	Q+hR/Iz2Ed3u9MkqzIvP1ctITXYmHqPOxmPXe+lHl6Jj1i+c8AbxUmDNNsDr0BRAMObj
	wrg/BBZ0n2BOYn47rBiupMlOy6hK4wCFHKtSM44Aan0/LxUa6vAZOTvS+iQ9EVcFb2mD
	58rzfRL2JLqQGG6s2HYcH+vMZhK3S4MQVSemJb/rn8dDQAUm3D7RIGjTksrVdrjbEMUl
	9h5Q==
X-Gm-Message-State: ALyK8tKVvcVGLMVTEyokoRddwhQoHqhaVWT/3QkFnJHTq5gDk638mOcENZsQs5cGZBK/3g==
X-Received: by 10.28.187.8 with SMTP id l8mr19673878wmf.2.1465571561125;
	Fri, 10 Jun 2016 08:12:41 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id
	d7sm36240332wmd.11.2016.06.10.08.12.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 08:12:40 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:12:38 +0100
Message-Id: <1465571559-21739-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2] mips: add a tune for using MIPS16e ASE instructions
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
X-List-Received-Date: Fri, 10 Jun 2016 15:12:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

The MIPS16e instruction set still has to be enabled by setting
MIPS_INSTRUCTION_SET = 'mips16e'
in e.g. distro.conf and can be disabled on a per-recipe basis as
needed.

This is a similar approach as is available on ARM for Thumb support.

Note that contrary to the ARM Thumb support in OE, we do add a new
OVERRIDE (mips16e), as there are some recipes in OE that need to be
compiled slightly differently if mips16e mode is requested.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/conf/machine/include/mips/feature-mips-mips16e.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/mips/feature-mips-mips16e.inc

diff --git a/meta/conf/machine/include/mips/feature-mips-mips16e.inc b/meta/conf/machine/include/mips/feature-mips-mips16e.inc
new file mode 100644
index 0000000..05011de
--- /dev/null
+++ b/meta/conf/machine/include/mips/feature-mips-mips16e.inc
@@ -0,0 +1,17 @@
+TUNEVALID[mips16e] = "Build target packages with MIPS16e ASE instructions"
+MIPS_MIPS16E_OPT = "${@['mno-mips16', 'mips16'][d.getVar('MIPS_INSTRUCTION_SET', True) == 'mips16e']}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' -${MIPS_MIPS16E_OPT}', '', d)}"
+
+MIPSPKGSFX_MIPS16E .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', '-m16', '', d) if d.getVar('MIPS_MIPS16E_OPT', True) == 'mips16' else ''}"
+
+# Whether to compile with code to allow interworking between the two
+# instruction sets. This allows mips16e code to be executed on a primarily
+# mips32/64 system and vice versa. It is strongly recommended that DISTROs not
+# turn this off - the actual cost is very small.
+TUNEVALID[no-interlink-compressed] = "Disable mixing of standard and MIPS16e code"
+MIPS16_TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'no-interlink-compressed', ' -mno-interlink-compressed', ' -minterlink-compressed', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' ${MIPS16_TUNE_CCARGS}', '', d)}"
+OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ':mips16e', '', d)}"
+
+# show status (if compiling in MIPS16e mode)
+BUILDCFG_VARS += "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTRUCTION_SET', True) == 'mips16e']}"
-- 
2.8.1


