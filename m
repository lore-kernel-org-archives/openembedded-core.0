Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDEF9605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id g195so3652010qke.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CdFVkLjmh/6ID/s320qZcuRQJJPypIeesmc+fQDAXXQ=;
	b=GPUoDT17nI2c8X7sOglDleFjWNpw7CsMN8hOzPwY1KzshNH/z8K3+c34pQtLP1CBUD
	XaltPygNU/YdkAtoiCbLQ3mH13hK1QM0FHwqvK8zXeCos6Q2YfgjvYR0iIyOmP+0y3Y7
	fuQb9mJ58cQAOY0nkhkZJgbgDEQ0M2UoegL5ibZIsUhw6JvgAruS2gaDLMdQiir6U/cS
	LZTKRftM0D9eFSCa4CTONu2g93vyKaT33v9ETSII71oNSjs3UtHBrawdRPMEIiW4HQ2j
	oObAhZCVXu+YymNBzs9gkMe22OsOn2mqRCz/IEkXKq5rqx6ARM6tLc5BY3mGjtZm/KvR
	wlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CdFVkLjmh/6ID/s320qZcuRQJJPypIeesmc+fQDAXXQ=;
	b=b5vzVzt5O9dPZSbhTYmF2CAdFOLpKTcKsIhm24ovmj9kj1dlRrAi1OMcWW9s5J4V/c
	4ontlgEG4m2ZltauRfSRbUuyh3A61kR3E8RBPo/RORmxYwILziYynkdoCy1AMvGY+31y
	7hTNxzS1ZROjc9zCe0wHQSx5D9VSN2VOI49tipMZCi+Sjf8NefnbaOTmRgaRGc5wiQFf
	u35SsU5lHzg9J/OX4N3KByI6GyiGG1WMZA3H1bdMeNAEaVh63x+76XmnpXs8bO1Ta8CB
	/aPuJDn0ZqIFbXU/wjIhr2l0TEWYucJ+RZjtHy6zq3Xq/7vi/xQy3q5RlJ4/IxWwl8a+
	P3FA==
X-Gm-Message-State: APjAAAXUdi8PrsP864jwqSNEom/ulnNDFCAs4Xyrkia8FERR73iXSiVd
	4h4ZrY754MNZECo/i9h5xNA=
X-Google-Smtp-Source: APXvYqzqd6S6jCw03wD319HTqkBIq8CU1Frxyztq5SwHV/DK/yx16/WrOJ9zHXIqW5dY39xdNt5GnQ==
X-Received: by 2002:a37:801:: with SMTP id 1mr144317qki.326.1580944379902;
	Wed, 05 Feb 2020 15:12:59 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:47 -0500
Message-Id: <308b2425ab2d20304fe33ada34a3089967a24af8.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] kernel-yocto: Only override CONFIG_LOCALVERSION if LINUX_VERSION_EXTENSION is set
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
X-List-Received-Date: Wed, 05 Feb 2020 23:13:00 -0000
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

CONFIG_LOCALVERSION may already be set in a defconfig or config fragment
and this should not be unconditionally overridden.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 9a4d2864eb..e8a9b1f18e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -359,8 +359,10 @@ do_kernel_configme() {
 		bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
 	fi
 
-	echo "# Global settings from linux recipe" >> ${B}/.config
-	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
+		echo "# Global settings from linux recipe" >> ${B}/.config
+		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.19.1


