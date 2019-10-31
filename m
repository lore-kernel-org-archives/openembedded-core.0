Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28B657F96B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:24 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q70so5425618wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H36xQDjJ+hLGMocRiZomLYtnSKu0iufCHD0IkuA6Y9A=;
	b=rqTIOTr2yyOrRyvAgAKRR/7+WN6YTKuKo4Cs3T16UuF5BG7U6KeOPaExX8X8kjnYGY
	vhKgMoDz7VeElhGqztdP57HHD576yY7AIUUnZ9C6VzmushbD4BaE3OYNBUW3vlwey2t8
	J0s4wfd8KoOG3rWGjfILaOHwirP9qsx+B/CAYxbGAYDFniUSgQ0zyszUzs1dDO6xbXp/
	dq3B6yaOpDzN25kYhQ5KYu7Zd0tYUOiR2ieofnOY3qgyKQEB/JNphZkwgtOu8ZkgmqoZ
	c6iChe+cQTQBfjG/SsCib4TZrQ3fkTFTE6UzdMRUmPoCl3iQA3JO7Bwl7OFMwAAiSaIO
	JqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H36xQDjJ+hLGMocRiZomLYtnSKu0iufCHD0IkuA6Y9A=;
	b=Spk32LfnfjYXsk8nX6VioGG6jDGyde4Kq75EFWAzno9gL8tQ1QZqMDKu8vnreNFXrK
	L0TxqDdFMOu3+UMx57NXTaSbv5Clvei8WJXJ5xyfEx844N3oVjYjDxynbmsgib2YfOsr
	TrxNqA81ox/dsaatKrhTS37mMmPmH4N5ZZL8ttvop90kU9mCQjSkmWtlmWs5pL6aqc1/
	X5MhUvUFpTsl4rcoostaVTFc1mqDsD1gq6S5UpJ4I7nYkwNq7L5cAnjgiixij0yuD3Wf
	kEcX4Cg+L0CGe0TzGI+C7ARNWzz/jnV3XJVFdXU4S4MRYVNsqiODaL/lGS1Wa6XNofzb
	Wmgw==
X-Gm-Message-State: APjAAAWwCpa3+EFZa+QRHD7wpfyTNhw7HpSM6IXb5hEQBLZFpRJ0KkER
	Bw+Fw+m0bHrT+7pley+ScT4Ytv74aVE=
X-Google-Smtp-Source: APXvYqxLW0FLkoxMXqQAjOVibItWorVkxo6fxuW/VHYw6XGsadFfu4JwtXgUGsMU9juPMMq+QcDupQ==
X-Received: by 2002:a1c:4606:: with SMTP id t6mr4297950wma.73.1572519324772;
	Thu, 31 Oct 2019 03:55:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:14 +0000
Message-Id: <20191031105518.7716-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031105518.7716-1-ross.burton@intel.com>
References: <20191031105518.7716-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] qemu-helper-native: pass compiler flags
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:24 -0000
Content-Transfer-Encoding: 8bit

Pass all of the compiler and linker flags so the build is correctly configured.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index d9d9da0fade..372eebd8864 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}"
 inherit native
 
 do_compile() {
-	${CC} tunctl.c -o tunctl
+	${CC} ${CFLAGS} ${LDFLAGS} -Wall tunctl.c -o tunctl
 }
 
 do_install() {
-- 
2.20.1


