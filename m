Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8D3B615F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 17:25:08 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 84so2237087pfy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 09:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mFR2ca85oP/Kd3M8fp6wOJpcqSf5MZiF4+IEhC7KerM=;
	b=OLEv77FMC85gU+Rs2WiDL/I4DXJ0m2itpLI7cZfjOAQpLzYz3x4HQ6rWZ6ChE/YgUO
	BfGnLQQTtcvpVX7UukFY2Y13aieWai7MqlE/q2JwjEodeRbkn9GgPHoNQkOB/Ppkj3Hc
	n1rIG0gskWct0cWDL+E8KwongKTIQst2lb9RbjaVQ0ABg3qGgdbMNBoCHC3Na1X+2oUg
	DS4A+JvITdEBK9e/lK/62iRSSCx8KUgapdMXd+0Eufzuw//H1dhQ7WN5V1prQV4PoMHK
	+eYNOrHZ439DREzXbnu9rmeobw/VFegCO5a6kHkLIl485PnuQo8kLUr4NTHvGITzrSR1
	R6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mFR2ca85oP/Kd3M8fp6wOJpcqSf5MZiF4+IEhC7KerM=;
	b=StfHdUNWcwg4sxiKXSppWWXeEcVG8XmxIdZC5zcZWzb7g/qzAKLxAjhlQBechGvfEu
	wynqbpVXib1zfh4B+Ljtp0AkzhFjpSOczTSfRTgwgL+xHd74lXgmZ2QvU1nLPIw6lMAB
	IYdR1JbX2i/WZNbSlXsKxhS2bKRwO1dOY0YGZJTbsnfecN4QLpHGZoq9lSjsPVb84iaF
	tAaYYQR/DEzmk9oJ6459H+yIt0nGSp9dbFVRF15QErzdL6lrAlkTNU4faFTcjHxQqOp8
	BVPQHXJLJftV/tykVmpa11W+OIh81KEOyoz22ehm+EvSdStXY05melatMZ9nVUFEF8tE
	jTmQ==
X-Gm-Message-State: APjAAAXu6JgN4QTbpAPGjF6llju9QN/RL+Hf4mGxJHO7CGe/NlZMdqWA
	2uRnDcb0lSBpNZhzTE4LrU11dgjO7mc=
X-Google-Smtp-Source: APXvYqzOsN0XMl/npPxxPUUBP7QPfquVYcOD11WFjhkmMVXRclebjdV213HtMXln0oevfLbGoefbAA==
X-Received: by 2002:a62:e30f:: with SMTP id g15mr32449437pfh.124.1582219509440;
	Thu, 20 Feb 2020 09:25:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id b4sm217577pfd.18.2020.02.20.09.25.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 09:25:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 09:25:18 -0800
Message-Id: <20200220172518.315182-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 20 Feb 2020 17:25:09 -0000
Content-Transfer-Encoding: 8bit

dnf depends on libsolv, and libsolv does not have and easy way to
jusr enable rpmdb support, it either has full rpm or nothing, perhaps it
could be improved in libsolv and we can use that but from now we have
no other option

dnf support only rpm backend and wont work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit message

 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..220f1aabbd 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..49afa04812 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.25.1


