Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 432057E01C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 15:04:13 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r4so3765797wro.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q2IM6Sb2wy2ahaVRW3NsNmm7HaIaiJHxg/nghv3KBqo=;
	b=eU1g+GxiPinm5uDFNRuq1mgyzHNOPNJxPtqna86zxi+rEUP1Ou1IYZV3m1KFy4kzbH
	47dZJstjhAECS/hbqR0yH+7Q2QM688yPsc6C91l/i9F5zqJM7/v5okQaDTg2X00fygLE
	+Kodx42Ro9MiAKw0MzMLoe4a/rCXIZ9VfucI+ni2e12WRuagXHFp8v1avOQdLYzwwNvB
	UzkDrCK6oEYoIy8boAfBAmuuVHjLidFBX+p3Itm+lbSXnviQOL3g0hD1hgfYMcHy2iF/
	lAxCGe5IgyK1J/F3Rvlmx/us0IWvX1G0i+tqqhvoFC1+z1cT2xrj3ge2DQ8Dwdn3LozZ
	NLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q2IM6Sb2wy2ahaVRW3NsNmm7HaIaiJHxg/nghv3KBqo=;
	b=lCK+BII4UwLNat8XN2/szbTPZ5XQkAhWthZ37dx+XkQ/dHqOsy7p3ydAmloXP1z7tH
	8vAaR16oszv7wK8AGyIDyS6Df/5TI1W8NLEaYyxwFubzBP/0B/S6Msp1Fr5ZZPzOqrPW
	0LCi+A0Na2iiw4Y0+WE/U/ySH0WZYIXHqNCoMLjnxLZR5xN+PDx+lGKXGBS5+u8fkF1q
	VirySE6zagwMl6v10siFolkFQ7d1PToFLnzubX252taOXW753aWKN4p7YeMc3XfHb92f
	TSangwdGJZC9FW2NT2ZedV9N6cGthgzvW+EkN3/RhfnlFRuYHPb4MtJe/So9V/B8xvmY
	seAQ==
X-Gm-Message-State: APjAAAV9Bye93SF3P/4uPSrLLTE5PxkafAJzIH1kEOPwSkTkMtQXlGc8
	W/+VA2/NEZxcZEym/7ioBXL1jpmF
X-Google-Smtp-Source: APXvYqwsO6i3E0VMIyG71DTp+6dEG28yAe2JuiJ5w3DssBpD13pGLCNQagDS2H46HpiJK6uk1H16/Q==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr17121483wrf.78.1558019053667; 
	Thu, 16 May 2019 08:04:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a4sm7318053wmf.45.2019.05.16.08.04.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 08:04:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 17:04:03 +0200
Message-Id: <20190516150405.124743-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] packagegroup-cross-canadian: repackage when TUNE_ARCH changes
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
X-List-Received-Date: Thu, 16 May 2019 15:04:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb            | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index d551147b5a4..3b430c08148 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -16,3 +16,9 @@ RDEPENDS_${PN} = "\
     ${@all_multilib_tune_values(d, 'GDB')} \
     meta-environment-${MACHINE} \
     "
+
+# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
+# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
+# This will result in erroneous reuse of previous sstate packages. The following line
+# establishes a direct dependency instead.
+do_package[vardeps] += "TUNE_ARCH"
-- 
2.17.1


