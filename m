Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id D059D7C75B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 22:24:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id a62so15487050wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MEkZ2FjNAVAQPI7JOPcVQgPAYVBBSl7mFRusDeHuGvE=;
	b=cQpp6YEET+rNGb8SVVha03/VPICpGL57Mrvs6d8kxQP9Ng6VEtrsXfqeVY0o2Kph1+
	nFn/FvvRkahTBOY45hCCsHygC09FW26QVx7rhmYR8AHakAswvJgLCL+09hI5QRuWGWWI
	ePmIcJOrgJhlWhxBLIaRV6YCtJd7r3psjLRTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MEkZ2FjNAVAQPI7JOPcVQgPAYVBBSl7mFRusDeHuGvE=;
	b=RBKhbCyLLYmzceQLGtvZPDs1OPWqDFF/iofqFLMTgsZDI+0AFrRvLxnxDvOdS/exF4
	xfpd8orInuXrOOqkPPrgFi5HJYPOQShqLumCXGR1I8hCJx2+M8hm+j9gPxYQqAWlVhGx
	0kWyHmfq6l37yHKrqLdNTRtv0/+tFY/5Lw/Ru1LredB01+E5KjCBmBvIA9/Pu8TFAg4B
	wUz5knAwjHwP8Mt1uu42Ah5tNBySTrKMZ0zEp5tTkEnylEw7XGeCqAz5vEZiGIYMc1/3
	pzYNlSZDg3TwAVrkZyAW2s3N5uuuwDKpQw8nSfDwXOdJEVRYr780lB9MUtqwP1niFmkM
	z/8Q==
X-Gm-Message-State: AHQUAuasvHrUUAW8WqX0OUUaeTmTkR1Ye98KD2998C1kwZnqijO3bnKK
	qruraLi++6xo1i+3Dc2teSXzjarTK14=
X-Google-Smtp-Source: AHgI3Ib164VlG/uFq3blJtjQdJA71PdD5w6qnpg42CltTKhrCz0J6BVbv2oCpyq0aq9elHl31Gg76A==
X-Received: by 2002:a7b:c0d5:: with SMTP id s21mr14918759wmh.153.1550442285199;
	Sun, 17 Feb 2019 14:24:45 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p1sm6681130wrx.50.2019.02.17.14.24.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 14:24:44 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 22:24:41 +0000
Message-Id: <20190217222441.32110-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190217222441.32110-1-richard.purdie@linuxfoundation.org>
References: <20190217222441.32110-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] glib-2.0: Improve shared-mime-info dependency handling
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
X-List-Received-Date: Sun, 17 Feb 2019 22:24:45 -0000
Content-Transfer-Encoding: 8bit

This cleans up the handling of the dependency and gets rid of a use of
remove which should never be needed in OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7e2847d4b22..a186c1d9eb6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -77,10 +77,12 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
                        ${bindir}/gdbus-codegen"
 FILES_${PN}-utils = "${bindir}/*"
 
-RRECOMMENDS_${PN} += "shared-mime-info"
+SHAREDMIMEDEP = "shared-mime-info"
+SHAREDMIMEDEP_class-native = ""
 # When cross compiling for Windows we don't want to include this
-RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
-RRECOMMENDS_${PN}_class-native = ""
+SHAREDMIMEDEP_mingw32 = ""
+
+RRECOMMENDS_${PN} += "${SHAREDMIMEDEP}"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.20.1


