Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD698788C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 01:41:41 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a16so16039889qtj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 17:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Naa8wqHTfpEp2oprirHPkLx55ymwT3Zag1qUU1OZoAQ=;
	b=fpYlgQT327Z1SxO0Iqv9NlPjei9lB4y8N6MNfCDKQZlrDI+79Epw2ib+bsB97JoLgE
	o2cansmkR2QaQxUFdvHdItedsEHkYwbvMEPiYdCTUoqyMqkKE6pZwARS8yqXVp9hcRCH
	e2bM9WkqVTmjx+Fi6c9tcH1MAVSvHw85+HqbeSPoVRDMgGfr/4iAXkfJwYLP0BHkYdsK
	gtEvM579m2X4Iq9ol0WrwQtIbcnM8z5lq9c1Cji3qfQMaCNbM0UpzUlYOBpv35J1vm36
	oDtNpSEO3v5qubAeFYatQ0Ercs/Ty8dcVgTgX4vM++YBtdlQCPFubRbnfy00FiaipAaI
	G0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Naa8wqHTfpEp2oprirHPkLx55ymwT3Zag1qUU1OZoAQ=;
	b=RaOD3Q28+UYkR5sG/3YoL6QLDgZMo7crRntJzlGDaW+agWpVmZSxgfbMnyBwBhWsx1
	Vxi8GrhnWYOdg6LbXirOVgW1BgGocS37YSGTBXMl6Gb4GZzi0pUZbYr9tzxh7HvpFUOV
	4/4ZId9Tiy4/v57Qozvphl2MfwO+wpD8GlQee3jttVrO37EQVgUyvWV9DNM8MnCnYkXd
	4u4XcbWe7iLC18HNLKe5UtAh+LtaRKp9rj8Kn5uYiKjImeNu+L8Jyc7kdv7xni27To9F
	TjDeR67i+Yjt9WeCsG0TyRAQL1PrOIqLbraoSiE1oBrxuIgC39AZ5peAKCv76o8bDxC9
	f+lA==
X-Gm-Message-State: AKwxytdUuUVIT4NAaMYccatvmbjoOTmETGLUBy50RajWwA9+f6cC/Fif
	tDkRWwV/keuuyLteiJqPZjURUqmzdg==
X-Google-Smtp-Source: ACJfBotNlGpyO4HFOb+UimFYE8tbSof8c9zKicanj3eJkIgfB+CzWAgEA6YVpVawwbAZsGSXzEs0eg==
X-Received: by 10.200.112.75 with SMTP id y11mr1822156qtm.295.1515462102394;
	Mon, 08 Jan 2018 17:41:42 -0800 (PST)
Received: from localhost.localdomain ([189.4.104.170])
	by smtp.gmail.com with ESMTPSA id
	y65sm8567857qke.24.2018.01.08.17.41.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Jan 2018 17:41:41 -0800 (PST)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 23:41:36 -0200
Message-Id: <1515462096-3795-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel.bbclass: remove bashism in kernel_do_install
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
X-List-Received-Date: Tue, 09 Jan 2018 01:41:42 -0000

possible bashism in run.do_install line 163 (should be 'b = a'):
if [ "kernel" == "kernel" ]; then

Fixes "[: kernel: unexpected operator" when not using bash by default,
which causes the default kernel image link to not be created.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f7b612f..c42f85c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -363,7 +363,7 @@ kernel_do_install() {
 	install -d ${D}/boot
 	for type in ${KERNEL_IMAGETYPES} ; do
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
-		if [ "${KERNEL_PACKAGE_NAME}" == "kernel" ]; then
+		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
 			ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
 		fi
 	done
-- 
2.7.4


