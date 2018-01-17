Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0864786EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:26:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r78so14252459wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=NPRxpnKp5/bIsAreheKwRNX9BlkDjOe/f53DyaYWNqE=;
	b=ox4bv8rJsQWBOQKdWDjhDAvq0P5Jlc0fEGv9/llIZIH1eDTaA3UFFOHymwvbzY2DvH
	rqqsAwfaTEd0UTd9ezuS4tNEOcPG55cOQJXQxcGJ0Q/XygKUnpYfaVCVBs/oYVe1cpcO
	uSfL2xSDqtijKjj3wMqBYMBWgXEL5PBYL0rRRTpI85+KiJjZPFglU/rTpxjFmnXPPkHz
	NXbW5VUYIbrftn3A5WFUrSNG1uUK7zD0GakysACen/CSLERaAiryS7aye2oaQPOs7dQJ
	+d8CMtk5AGzwrEASwuqi7X7VquVO29Uxga3vPveotKyPMZc4HHr7L03jJRouDfw31fGJ
	1hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=NPRxpnKp5/bIsAreheKwRNX9BlkDjOe/f53DyaYWNqE=;
	b=jccWLKBsaSatwpRNuFj2phkfhtFJ0frJs4YJerFPIbLhI6Ld9nLGeC3/sr3rNqcefv
	Rqw+9rjl1FYhp0qwfXjPn+bsaaSmafcNs466J0OKO4G2E09Mnr4p39sdiIX1SLELjx2u
	FV64ucAQxOl62yZhEQnh2bsEusB0NGq9u9B2KZYhP6dCAs87+xux9Z6iRV3HG6tFoBqQ
	D5vPL6vrzysUIk7iL2ndX216OBTzHIJSnoJKEmgcXzaKEh7n/jyn97QVnD/X+DonYM7b
	5n55KUkwmgHm+8JtIUhNA6oQiHVedxzsvW01XEiagH25tYpRJFfYSySHI1BMAIZLh3nE
	xw6w==
X-Gm-Message-State: AKwxyte+66Q7YHAnnXnBne84nFnzGikKblR/DNyD18eas6OOu2qs9Oy5
	Rors/20xPsUXIBV923S1y+m1Pial
X-Google-Smtp-Source: ACJfBotxS2d20O8aJagJNQzZpRfg8TNwE6kavRfAqDjvp6+dD3QmsDJ+KWKv/ZP+FwfhCMvE6b6lCw==
X-Received: by 10.28.52.73 with SMTP id b70mr1470632wma.144.1516181185269;
	Wed, 17 Jan 2018 01:26:25 -0800 (PST)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id c11sm5819782wrc.8.2018.01.17.01.26.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 01:26:24 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 10:26:22 +0100
Message-Id: <20180117092622.747-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-fitimage: Allow unset load address for device tree binary
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
X-List-Received-Date: Wed, 17 Jan 2018 09:26:25 -0000

Allow the load address to remain unset if the UBOOT_DTB_LOADADDRESS
variable is also unset for dtb entries in the image tree. This
allows for U-Boot to decide dynamically where to load the dtb.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a50f8a18ee..b9eb2e3b65 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -134,6 +134,11 @@ EOF
 fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
+	dtb_loadline=""
+
+	if [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
+	fi
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -142,6 +147,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${dtb_loadline}
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
2.13.6


