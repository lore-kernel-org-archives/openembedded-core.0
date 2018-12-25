Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 34A356B06A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 09:21:05 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z13so9285074lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2018 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=HldECoAYkt60OKkAQJszrsEmH//Wnxh9zCUy5cAa0mw=;
	b=ewu8hOR7lP/uF8hQb6TpXTM6clgxZk2Io7pk1K2qJxteGoTn3zS3kAu+Ucrm1MRj4i
	D0IT/L676QckdD9nysvkG70PN9hh1xQAkEfljdMv5ywv648Yb69MWrkCwNXJ/oxn4YeD
	p08GvcuAO2zAuvuQwb61GxNhRqKq/hdxnXs+qebBFC/d2beqLe7sSZUixqbvh658+lAp
	GjNJu9N0mVcPoQ2eeznU8s2umF+Y+15SR3wySC1UI10UZd4aDOxUulDUA4YaCSZfkmo8
	RD+dmQtdx9yK/nS/dqeyWNChhZTleeJov31HQeysW9n7NGxA4btnc81Ux9Y611Ed9Xdi
	k3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HldECoAYkt60OKkAQJszrsEmH//Wnxh9zCUy5cAa0mw=;
	b=Neg1mKEAZgJxwnqo65QoVSTFjguC28b00n3H+HSgRVEj4Ct5SfCNtCD9eCzvElDjeL
	x0mOFfi5RQGc5GMQBKnM7bIjUsIB2gMuXy6c2d31yelDF+8o0E9Z3/5uLeDl/O437kW9
	3/LLlXrQzXEJAID01EI8+oTGZUFSepO/R1tv879ebIKcjcg6OH/PsF+kgi1GtC2sMfCj
	5kVyRdUj9kDkjpE2mihm1/ZTaQ5Cd0jFXTpkqINPAM2XNJfJdO0Qc0l2BXZP95Uc8BXv
	YZticY46dVzIbbe8RzXis5J5wMLfA2Bxe1+J5JRuxKy4Ooxwtaw23eb5KdwU4xjOnic6
	omTQ==
X-Gm-Message-State: AA+aEWZh+VO4ToLamShI1ZrT/0xlHI0HZ59nvEcRDnPPfdFfEAiE5QuK
	wY3rm1FDX4Ht63h7Bq2wNm8D4I77
X-Google-Smtp-Source: AFSGD/WsQkvcPsEQKbVSzSIDc1kcVxtcZu/2B+ahaixv4K3K3OJ2ZitkBqFX2JDNsr4lPlLQG0h3tw==
X-Received: by 2002:a19:a302:: with SMTP id m2mr8479193lfe.108.1545729666015; 
	Tue, 25 Dec 2018 01:21:06 -0800 (PST)
Received: from skeletor.lan
	(c-52c6e155.194090-0-69706f6e6c79.bbcust.telenor.se. [85.225.198.82])
	by smtp.gmail.com with ESMTPSA id
	o5-v6sm6839294ljh.75.2018.12.25.01.21.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Dec 2018 01:21:05 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Dec 2018 10:20:34 +0100
Message-Id: <20181225092034.31624-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] initramfs-boot: create /dev/console
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
X-List-Received-Date: Tue, 25 Dec 2018 09:21:06 -0000

The Yocto kernel expects a proper /dev/console to exist before running init,
otherwise booting will fail with the message:

  Kernel panic - not syncing: /dev/console is missing or not a character device!
  Please ensure your rootfs is properly configured

Add similar fix as was done for initramfs-framework and initramfs-live-boot
in commits

  0352841cd92f6316bcac092e2fff9d28c352b36b
  1b64664f0c388f41084f5db6e46e3e68c53fb6d9

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index 7ae7969f5e..29ec5ec2ff 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -9,8 +9,13 @@ S = "${WORKDIR}"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-boot.sh ${D}/init
+
+        # Create device nodes expected by some kernels in initramfs
+        # before even executing /init.
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
 }
 
 inherit allarch
 
-FILES_${PN} += " /init "
+FILES_${PN} += "/init /dev/console"
-- 
2.11.0


