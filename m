Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 292177867E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:28:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 100so18112939wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=3yBQm3qSkhrqWzWtBGsxNyq/asroUx3N6T/0vUhB2lg=;
	b=mFDMuHSx9MR5MeWd3Pz9dqjtV7h4HB7W3n0RsthkiwbJoAteqLcLY7XPIYNghV+buI
	dOlFCahRHfjOZppFzEtgJUPA6uC0RoPl6kfn3m4GD87Ydur5SPCnZbDgLurUA5HPkIab
	BJLkzmlviuhvKOiPJRqz/RMbc632Br1qYSmSlWgdu/JjHY7r8KyzqjTz3Ph6JVk5+IqT
	9xeTwbk1LxqP1tmT2K3LQ+Dyc4CmKS/loCWGonNe2f1koJT3qUm/RXTIjrReiyp4rtE5
	WaMB3JFK2X1Bqo5oD5GK7aGnnN2tmZC0U+F9g/sdxAL/I2bgl3x6q/yHhqetXWs2KT3p
	r65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=3yBQm3qSkhrqWzWtBGsxNyq/asroUx3N6T/0vUhB2lg=;
	b=dQPXw3FnDKdKWBWhutNcw9LuaxChg+UzM8IZujZ7Wad+at1KJWPzUQIdghddCrtVjN
	PDwbCUWkWS/iwghjjHuZgIcxb9yoC2umJhkLyg2GqA9ItKBH0BqrdFvEzZ5B1iKkds1o
	/ZOM7Tz2u8fGzYZWi03ck/xYK0dB5OpBQX0fl/3QYrUpcO9GLiN+npz74AywxA/zQBbB
	L0PtF9TWYj80g41ALc2vXMbHuz7aqYFxSwVGUMP2J1y2qPL262VYfDX1jjUT3+nIVYdA
	zS14Vcx7HDVXyEkd2VKb40AyuPcj3Ad6sO65avoQzgW6jeLW8xB0f10ULBOFlFwH1Url
	8eXg==
X-Gm-Message-State: AKwxytfqcRxB4c1pETr7X6Vq6LOzFpMvHrniNUUaI6CMhx8JRz6zUsNT
	L6+5tJxjCRYRNEMSybsJPdp5TLN8
X-Google-Smtp-Source: ACJfBotJnuvnTK0oGGYHsZwoNqVeLRBl5KH3BQ+nC+ChL5WJgZedud7jbTu+b7KSxeM3XeQUF4wWSQ==
X-Received: by 10.223.138.247 with SMTP id z52mr2074514wrz.254.1516181333558; 
	Wed, 17 Jan 2018 01:28:53 -0800 (PST)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id 44sm6153882wrv.0.2018.01.17.01.28.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 01:28:52 -0800 (PST)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 10:28:50 +0100
Message-Id: <20180117092850.9694-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] kernel-fitimage: use sha256 checksum
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
X-List-Received-Date: Wed, 17 Jan 2018 09:28:53 -0000

Update the bbclass to use sha256 instead of sha1.

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a50f8a18ee..b8c2815fba 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -100,7 +100,7 @@ EOF
 # $4 ... Compression type
 fitimage_emit_section_kernel() {
 
-	kernel_csum="sha1"
+	kernel_csum="sha256"
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -133,7 +133,7 @@ EOF
 # $3 ... Path to DTB image
 fitimage_emit_section_dtb() {
 
-	dtb_csum="sha1"
+	dtb_csum="sha256"
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -157,7 +157,7 @@ EOF
 # $3 ... Path to setup image
 fitimage_emit_section_setup() {
 
-	setup_csum="sha1"
+	setup_csum="sha256"
 
 	cat << EOF >> ${1}
                 setup@${2} {
@@ -184,7 +184,7 @@ EOF
 # $3 ... Path to ramdisk image
 fitimage_emit_section_ramdisk() {
 
-	ramdisk_csum="sha1"
+	ramdisk_csum="sha256"
 	ramdisk_ctype="none"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
@@ -242,7 +242,7 @@ EOF
 # $6 ... default flag
 fitimage_emit_section_config() {
 
-	conf_csum="sha1"
+	conf_csum="sha256"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
-- 
2.13.6


