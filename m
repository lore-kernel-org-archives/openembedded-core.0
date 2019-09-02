Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B32DE6BCA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 18:54:18 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j16so14940600wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2019 11:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ieV5V3S8+fTbxXUc4WqEMqfn0YumQ8xkLQDO+8QiAmY=;
	b=WtNDQIxMGLFIIat4dn0V5IGfKnd70UFsz1+lyRlL67R2dJfCFeBMiyPUXJ89tPSwQd
	pWsuCddVWmfDxDtvRqvqAYqHdZctl//R6hz4mc6ZAw2Jy7YPgex0VLsiFf1ogwu4JKjU
	cGsSUIdJlF4zDG638oWeaDWOZuJfXKpxgkQuk+EvGgRkHWK7sPt5Q815wr1pMx9yPuMb
	FJxA9P3VBOEkWnPpgFELgovoO5I3idwMbrS6JrXMaYHRkWSejc3IP4SpInkZ0Q83AUIJ
	EhUT0id+5wy7tN5hN58Q/WDXewYunULrGVRy/9fFxcIF862dlx0zbvaUCQRyv5ZG7IKf
	zgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ieV5V3S8+fTbxXUc4WqEMqfn0YumQ8xkLQDO+8QiAmY=;
	b=MGgRiTrwx4SufSOcej5QkXy3MOunKwr3CNUowukGnG9/j/B1NUZseLPHwyVAYGQ47U
	bf21qV82O0vuw6xhUF7SucaO0VF3PD7QPKgoUzOaRw2IZeMsn4ncKwVt80QF9T0A5EGe
	zFb1n4yy9TLEaiOsKdhtJnHAXFW03T68eByPBIcvZ1CB9Gx6j9z5mv0GwedzE4lHaKH6
	GZb1FQDssbBx7OlsBptVf1NsP/hwN3zrO6AA7V4g0+lT7EqkfYfzXS4NfML59g6mMxnR
	E+AkegaH4xQyAjwPE4LKfTn+JDuriA02bojj3Zo/ijWrEHg9Kt/0MaaA071C/QPsPMr9
	9Xzg==
X-Gm-Message-State: APjAAAWw6XDPIaSykTjONqitbIRbZDTmRUoELEUGmL6CjU54ZFmmjJJI
	+h4UMY6XSeiVng+R/rTUve7qDKi49WA=
X-Google-Smtp-Source: APXvYqwBUE06bI1dYHYrKne88Lu4BvKFeoE1ynOLY/xSfpJWluygnXNVrCIUibKQjoo9HqzgRbHPPw==
X-Received: by 2002:a5d:62ce:: with SMTP id o14mr6372311wrv.279.1567450458892; 
	Mon, 02 Sep 2019 11:54:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a16sm8713579wmg.5.2019.09.02.11.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 11:54:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2019 19:54:15 +0100
Message-Id: <20190902185415.12267-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] systemd: explicitly set the path to nologin
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
X-List-Received-Date: Mon, 02 Sep 2019 18:54:19 -0000
Content-Transfer-Encoding: 8bit

Set the path to nologin as with sulogin etc so we don't try to execute binaries
from the build path on the target (as the build finds a nologin in the sysroot
at build time).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 6fbb8548868..759d6af6022 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -206,6 +206,7 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
                   -Dquotacheck-path=${sbindir}/quotacheck \
                   -Dquotaon-path=${sbindir}/quotaon \
                   -Dsulogin-path=${base_sbindir}/sulogin \
+                  -Dnologin-path=${base_sbindir}/nologin \
                   -Dumount-path=${base_bindir}/umount"
 
 do_install() {
-- 
2.20.1


