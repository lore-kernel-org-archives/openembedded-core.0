Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id A02DF7FD4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:45:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d16so7538381wre.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZlTky0TFDv7Znp3in5tzPJAhzNic4DHeVnB0RyQvDy4=;
	b=Xrkk3Eh47vsqsT9wbgPHkDFrzjSQkHD7klgBYquu3aKoBA/7VtG3HhD6/6aJ/8dvBp
	oeHt7tgODweXumZKOAWLL7R3tsi3noWCaKfibAYAZIverEwd8wUhdgE1tcphAAmlAkZz
	MgA8ZvJ1bsbOlMI8rOX2vuDPcQeswY4dm/OqYDkMhYXbfQc0la7zhCwn5v5ueMoCNyaO
	pGMfDjcxfkiWx6ePctcY34BMllPopwNOcCAjZq76n2IpUOWgPFP5SLoJyXmBruMwPgrP
	oJseMfxnVWoD7YnUm5Y/XoTjhUhxBqLEKt8oaU+i02UNazVUXi5xAQmvw0ztWjyFtBxs
	qI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZlTky0TFDv7Znp3in5tzPJAhzNic4DHeVnB0RyQvDy4=;
	b=qy1ffO5hNeWLOZ/2Cl5m+FzHQOe81PU34k5gJQcQaFi8wY43CSF0mfdSH+uPUiS6c5
	VUk7j5cJkQHSBP77kYrtf+EVtSuN52Qa+ddftA+mWIzMoEcG4gKOAMmSpPD2jgXC7sCz
	5dsQBpEOAI/YfNYogEFsLAKPU2IsU8RE4HwNic+qR57ms4T/FjAMflMJCj/Mf900eZsc
	vzmDHSAZa7C3eUs+eaoOylhuiX9vREe8xqerKvooIYKg95/CFHaAFLoz5uNYOFTHpOJ8
	l3bEq6sZMHX7y9W+po9yqoUorvs9EHP+P+LAy5jFvojHQ92Pid6TVWCPcUg8YWMpmq6G
	N3GA==
X-Gm-Message-State: APjAAAU8cgzKuyNbVBd0J5f4cU6RGCU3trw3AAVw05UyDOY4kruPwpNO
	IRLuMJ76vq+2dtOqxV2UFwmoGeDxhHw=
X-Google-Smtp-Source: APXvYqySb71dPhL3C0Lf1S3Ngcq4mV3n/uqK72+gDH9TwQQEGpJFB8YocpLkfdoFObtMleqRPhgPxw==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr11438094wrp.355.1579704352783;
	Wed, 22 Jan 2020 06:45:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	60sm58552442wrn.86.2020.01.22.06.45.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 06:45:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 14:45:46 +0000
Message-Id: <20200122144548.5723-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] packagegroup-base: only pull in dosfstools if licensing allows
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
X-List-Received-Date: Wed, 22 Jan 2020 14:45:52 -0000
Content-Transfer-Encoding: 8bit

packagegroup-base-vfat RRECOMMENDS on dosfstools, but this is GPLv3 so
may be blacklisted.  Respect INCOMPATIBLE_LICENSE and don't recommend if
GPL-3.0 has been blacklisted.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 1f802da09b7..3476db09c35 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -168,7 +168,7 @@ RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437 \
-    dosfstools"
+    ${@bb.utils.contains("INCOMPATIBLE_LICENSE", "GPL-3.0", "", "dosfstools", d)}"
 
 SUMMARY_packagegroup-base-alsa = "ALSA sound support"
 RDEPENDS_packagegroup-base-alsa = "\
-- 
2.20.1


