Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6DA7825E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 21:23:09 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id l145so2599318ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 14:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=lGNAX45R5LIupkjQxxJkuZ2vOS/roNkfsnkmjoU4NXo=;
	b=qBMNPFJbpYopXZbAynTVxaNImIBU+3ZR71vrYgaUky0TQY656rRKI8W045RARHrviD
	4UpzAdz3exLZE0s2DtOnLnFMzBc8LPOECyaZnmM6OCdd6gdKPOKH1e8JIy92itdhv036
	BIQWOkvqTP4veTN7qG4AyRgzheiiTENBf7jetjnoGtVvd/CGOldVDXgLZEZlB+npJEW0
	IWIFgArLWllIovbG0vDm58EqGezyKENvB96sNGfPGEISQz6b/2Lm3fedIMjSpcpo5+Rq
	qPSP2p/LzI8wdLevF3+75RXmGZyCvbHTlsKqFhyZBEP4CjEhksxZftPwNeVti2GhJ08K
	HR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lGNAX45R5LIupkjQxxJkuZ2vOS/roNkfsnkmjoU4NXo=;
	b=PzwU07qd6w1mWuWXZlRzR8j2Cs75w60FU225s+/Apt7IJEVliif/6vQZ0Y7l7Q3alq
	wI8VTxKY5UcD0dWYyhI2EaR8HBfFunGlKgCtyIxoB9ZMfsoxgRvzn9gjlSYRnBIR5Zge
	XyZ6cLxUiStk3bPDK+V7O6ANLG3/TjzSaslbVQ1S4cuY/g144ygsSVlJ1Fo9td5C4P69
	sw2DWdblNmFmlJD+YWp0B2QZIYslGzw5QQqVHRpDOV8owE3y3pdtA/sJxs5ErwRABIRZ
	9ROUI77EAf8fANUBav5er8dewjn9J1gNzso6MIcSRWvi8SiEY8+gTnd0MDTUMxPdj+yg
	UafQ==
X-Gm-Message-State: AODbwcB9aJ34oZB2V3S3X3sCLz/qtcIbTeWKCigCt30J3vJBOiQJUUt2
	qgdyG6RUVLGnGoTtw3I=
X-Received: by 10.36.57.137 with SMTP id l131mr6963837ita.61.1495833790978;
	Fri, 26 May 2017 14:23:10 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	h200sm801831ioe.62.2017.05.26.14.23.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 14:23:09 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 17:22:48 -0400
Message-Id: <20170526212248.16374-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Fri, 26 May 2017 21:23:11 -0000

Somewhere along the path from OpenGL ES 2.0 to OpenGL ES 3.0 are some
algorithms that are encumbered by patents. These algorithms are enabled with
mesa's --enable-texture-float configure flag. However, if hardware
acceleration is being used and the hardware supports --enable-texture-float,
it means the hardware vendor has paid for the patents.

This patch will add --enable-texture-float for any hardware-backed gallium
mesa driver. In other words, if you are only using the software backup
(swrast) you'll need to enable this flag if you know what you're doing (which
assumes you are complying with the patent). Otherwise we enable this flag so
the software can take full advantage of the hardware.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 447fd6d0df..7ea3a88b9f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -64,7 +64,7 @@ GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALL
 GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
-PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
+PACKAGECONFIG[gallium] = "${@'' if '${GALLIUMDRIVERS}'.strip() == 'swrast' else '--enable-texture-float'} --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 MESA_LLVM_RELEASE ?= "3.3"
 PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
-- 
2.13.0


