Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A7C5571D7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 19:57:12 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id e1so8550475qkh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 11:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=0oMidxyCoUkzhEb6ac3smlzXpUucbGHGPoPNe1LjQIw=;
	b=djUjWYpvjzdZoyPMlKDQzGqa6wPgqpUiDj4nxRY1pPfKSci+v9K09NWMrXVRFYQshx
	4jHwkqf5bqTU8b3eCnLU8oAADI+2tKFDDAIvYfKQFpRNA1PTCIU7sw8qJbnaEnelCpt9
	RoAg3+fLXk78u09VcruBiu39UHOMqYwObmMLKtqWB+QzG1b0M+hvkm2uonM1k7a4yRXZ
	SByXAZ9auernrHhsdokEpiQL33Vmx6cEJFUpJQ4miAWDLGzo1mGxyNSguRIMATlx1oDU
	LA/Rq9zggGeWNEFYHTJ7FpkOXTeruzL3+cBVE52Wwq5UcDHqA5ydGtxW4MUz+89OUSUS
	0dyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=0oMidxyCoUkzhEb6ac3smlzXpUucbGHGPoPNe1LjQIw=;
	b=LBj6+mulA81VnosNEfVwlDtG0nnlqUqp7ESBZOVGZz6dLSzNM72HaK0PN0ShF1ZwvM
	Y7lIpGVk9i48e7CKlZ8Y2xI+wbFanUiEX16Q8KteQBekoWeDX4//OhtWwVOpMrxSOmJx
	yD8j5fPJFImXFYDElHPvCUSJKl0DLlPUIotKM1MrT04nnZNzBlrmoTPUDB4DSLkmbeMA
	2RMAPlGdsbovGpO1s74Bi2xoIGoKiE7MYp8g+s1OOp6OQCzgEC3+HFu1edGpz2Kv7xUv
	QhSjenUBozs4GdHD6VHZZCY4x+DIlzDWbKW0kuXsrhO9ocsawbC0+HrE4c40mrsr6bvc
	v6dQ==
X-Gm-Message-State: AIkVDXKpTnhGH1VDfSbS5uEGqRbdbcMYUMtKUdpBbab4iuQRUx4JAIodmX1C0+MIFHT90w==
X-Received: by 10.55.99.85 with SMTP id x82mr18856849qkb.147.1484337433197;
	Fri, 13 Jan 2017 11:57:13 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h184sm9907640qkf.23.2017.01.13.11.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 11:57:12 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 17:56:49 -0200
Message-Id: <20170113195649.17518-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] openssl: Use linux-aarch64 target for aarch64
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
X-List-Received-Date: Fri, 13 Jan 2017 19:57:14 -0000

aarch64 target was being configured for linux-generic64 but openssl has
linux-aarch64 target. Change to use linux-aarch64 as default.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 2ef8b38be8..5cca019e1d 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -84,7 +84,7 @@ do_configure () {
 		target=linux-elf-armeb
 		;;
 	linux-aarch64*)
-		target=linux-generic64
+		target=linux-aarch64
 		;;
 	linux-sh3)
 		target=debian-sh3
-- 
2.11.0


