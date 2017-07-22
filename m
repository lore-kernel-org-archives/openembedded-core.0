Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBBE177BF4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 13:30:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m4so9812164wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 06:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2IOdejvqhqJkugg4uGMUIpvPe+9oS1tKl1GkenZ+CsM=;
	b=Kck12OxC8qMMPSwS/py0Z8wGA3eandTdKDeu3utUbqVwlbYubNShlQp993VKxn+oiZ
	GcXVIzQ5oKpC+njE0wf+CbcTacqNBz7zVQspNSsOqtZC4PE/gmjKVOzZU66scfI9PPbr
	tD53HjDAfFEMTlLY67RgE3v23mmHm0hzJhg/s5ziOcUWPk4Jdj3sewHzEyD5jzGc7H/H
	/WHE3LtPq3T+d8wQrg6o/mLUdn6kqivyFjFB2YFUfNPJtcHVYDVWbD9AKPMLQTe8Q2hg
	d29rLlrRSwihNBkXEA58Uct3s43FOVNbCwiGnf+gDHlfI4dWfX9WNtY+LMcTnkK/yRG/
	e2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2IOdejvqhqJkugg4uGMUIpvPe+9oS1tKl1GkenZ+CsM=;
	b=Hh6FIvuQm+JIKvkm/zYD9J+5CM71i5fNzQih1pk4fhyFz6T+rKiQGrYf6pYxOMnKy7
	50qeQ/S6Tni4huT4TzOozaIOrCvwPdYrymtiIW8iTB7S0S8wpF626bIAure8yZzt4HCF
	eTonGDHwB7nQQPheWVFQ4bNxVbfyaFfy3j4MANlpLOPmf0tfM3YX0JL4AJxRjFYkDO6G
	WsvoXad/xJ8jV9prUbmTjRDTnK2T86oKO+e/qgxpa2tl1QUIDyR5qxM/J9iqOa1d1kJJ
	WyuGFC7xtH/POkfmEgxU4UUtIxbyluLN8/DqIzOSCn4gWN1WAiJfcnxyFcmGUI8s9QiB
	bEYQ==
X-Gm-Message-State: AIVw113RMT52ClVmTrSQoDm+IpwrCFHNZw5bIZGIux7d8Xbro1u6MS+F
	EvByOSG5wucLb9Ze
X-Received: by 10.80.170.137 with SMTP id q9mr3809201edc.208.1500730257222;
	Sat, 22 Jul 2017 06:30:57 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124])
	by smtp.gmail.com with ESMTPSA id v5sm3858535ede.75.2017.07.22.06.30.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Jul 2017 06:30:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Jul 2017 15:30:46 +0200
Message-Id: <1500730246-25592-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] tclibc-musl.inc: fix bfd "cannot make copy relocation for protected symbol" issues
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
X-List-Received-Date: Sat, 22 Jul 2017 13:30:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Quite a few such compiling issues were found when I was building with
following configs:
...
MACHINE = "beaglebone"
TCLIBC = "musl"
DISTRO_FEATURES_append = " ld-is-gold"
...

fixed by adding bfd binding now ldflags.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 3d3f6ac..99d52a1 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -18,6 +18,10 @@ PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
+# Workaround for musl libc does not support bfd lazy binding well
+# Refer to: https://bugzilla.yoctoproject.org/show_bug.cgi?id=11679
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-Wl,-z,relro,-z,now -fuse-ld=bfd', '', d)}"
+
 IMAGE_LINGUAS = ""
 
 LIBC_DEPENDENCIES = "\
-- 
2.7.4


