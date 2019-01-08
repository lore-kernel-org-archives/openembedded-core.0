Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id ADCB87BD98
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 14:38:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z5so4243664wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 06:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dKP/CWZc7w2m9XEFVKS0s+Qwh5TmDtYGF1ChSNBTVUo=;
	b=b8bZ5e5FZ8vLdml6NNqdwzpLXsNuoqRswYzpZD7E8bJG8usdyURq2ISzP6VwhkBwaP
	C4Yh2XQ1cwUWjylS5VaAQsVmgJik9G2BOKHafVGDVQf6kbp6uSPofFzlpxKZintBnfK7
	qG5X5rEx90gzk+a6RnmqDxwfQhpuPrqdyNzyHqAfDlk++4tePm6kJHNiMbgyub4Y/EJH
	IRKgzWzwZZqBLQw1IMtd3uoBQgTthFI1khURFx/MDHAHABgD7kBwi2v5BfrVVfGhR0mI
	fcCPKgesBSAztmnpDSuOl45gzNq2SeFycxKlvNw5aXi/0ivQZfyYO6GAGYlucvghEqa9
	PT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dKP/CWZc7w2m9XEFVKS0s+Qwh5TmDtYGF1ChSNBTVUo=;
	b=YNzm0yh8kyqvM2QtOhixY0hQfDjr7vclhZYb4YyXnFetn88LE5O5Cajxix+hmQzlYu
	yirNA4+JdjyNF5cCNaPyly+zWAt3Ft09kXOWD8VHVIW2eW3zf31AxFYhBdCm739LbdAc
	TprFaXcnqX7fXgsLlZYDqQJEDkxFQsiobm1/IDQG6s8aW12e8i7TuXvxBPnhoG0w0Lcc
	N2Nv37BxS3aqzwzyTT03UeOE3VdqrFvU484xW1ULE950V++mr9ctmTMqVDYlroqp5dga
	0y/Nq6KxHJvw2TJmtuoZHOYAtVks++H9BQbxqv6lTUj59tFjp/qn/cNe9YUCK5btTeSw
	bQiw==
X-Gm-Message-State: AJcUukdtS+kOtIgXGuiwqdqcYHLxVQ+WidsJ5eWaZNF5a6z9LhADfAcz
	0ab48tTdNnx1qV/O83z0O0FsBX4UREc=
X-Google-Smtp-Source: ALg8bN5Kbm1cyaab6wRjPsQ4HBxiTnvxFljaWK3JtSBqWo5VHjE2BKrOBr05atxBMdzxhaKjp87Fow==
X-Received: by 2002:adf:9ec8:: with SMTP id b8mr1755796wrf.164.1546958337141; 
	Tue, 08 Jan 2019 06:38:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m4sm11803498wmi.3.2019.01.08.06.38.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 06:38:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 14:38:51 +0000
Message-Id: <20190108143851.20544-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190108143851.20544-1-ross.burton@intel.com>
References: <20190108143851.20544-1-ross.burton@intel.com>
Subject: [PATCH 3/3] pulseaudio: switch configuration module from GConf to GSettings
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
X-List-Received-Date: Tue, 08 Jan 2019 14:38:57 -0000

The only user of the configuration module is paprefs, which as of 1.0 uses GSettings not GConf.

Also GConf is unmaintained, so one less recipe using it is good.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 7498185c5f2..1a23bd1ca1b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -102,7 +102,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x11', d)} \
-                   dbus gconf \
+                   dbus gsettings \
                    "
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-- 
2.11.0


