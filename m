Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7250C7FF47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p9so2090036wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FJpf7DqKYuBUVbtDLsWuObyolkzHpNZnK0i7C5hcNQA=;
	b=mzihv1cxft1msCmVXUWKvGaWE5e0EwlXTuTU+4r55cjikubkOwAf3TXMQdIGY25UEA
	J8WvyrdKAYsyJ5z5oerdWvPGCS55r2liaDhmpJdq2kWtI3ogWX5y2sUAlE+UFQ5EkbfT
	mc+8Ldh8xo2Gpg+6laLIiuX+UO2YFlalDKcKSayPK9l6xTgQ9AM36Lg3qiCRkOniOr0y
	Tz+rzGGyN7dj5rl6Qnp4n+IChvu4HCHc9/R6UlhEjqDVO9I3y3+zy9NFq6fWpkQ244CD
	qFrconosGEYt4uIeb4Z8EofcWx6QRvP1x9z3cgjE9DI3WZMuJ7LfrtMxSv3j6sgFBAS2
	5DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FJpf7DqKYuBUVbtDLsWuObyolkzHpNZnK0i7C5hcNQA=;
	b=C2IXiQh9Vn+cTxbLQcqUpBWc7YYMvy6vmFCsqu7ZPh/z0G00XI1wg71JLL8KpLclpt
	QIqJjAn8lZOCCVx0ucXuoRxVbICyNro50BNNj5n/8ZU1LRON5/QENE0D9KQZ7LlsiRBn
	Y6V8U+5H+pDtMAXbzp6LwKdTGhTPZVTmpdGv7a0+twmC7iZ5W0/rU2VuM+myKsJKnryJ
	VIefFNoxFuPsnncgksIedfcZKuNvgsNxRLfM6n9lu3jFm6/Hd40mwe1OmFwvcXxi43Fr
	9BcFMsntUx13WqG8hOh46T8U1RQZQSjBELeDQfbu29m+6pmAx0WX2uee9Je4+bxJIcwA
	cRAw==
X-Gm-Message-State: APjAAAXJqtqgI7G1cJ2ZH3iTRXR26dtxWJGpDaYBsJhEnjEhl7G6JXCI
	f68krH7+TosWIVP7/4ClI0epgltYWbU=
X-Google-Smtp-Source: APXvYqzyYwgtdsvEUyPTTNIIMFDayEKwgNMXTiaAOoDLz2N+oaadZcBBVR1QOfYFNY8GQUoMO3nvPA==
X-Received: by 2002:a05:600c:2298:: with SMTP id
	24mr3803212wmf.65.1576679889057; 
	Wed, 18 Dec 2019 06:38:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:39 +0100
Message-Id: <20191218143758.129308-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/25] rpm: switch to openssl from nss
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:09 -0000

nss is a problematic library in many ways, but openssl
seems to work just fine.

rpm was the only user of nss in oe-core, which opens
the possibility of moving it out.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.15.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.15.1.bb b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
index 5896e78e734..0a6d412a1b8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.15.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.15.1.bb
@@ -45,7 +45,7 @@ SRCREV = "ab2179452c5be276a6b96c591afded485c7e58c3"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS = "openssl libarchive db file popt xz bzip2 dbus elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
 
 inherit autotools gettext pkgconfig python3native
@@ -54,7 +54,7 @@ export PYTHON_ABI
 # OE-core patches autoreconf to additionally run gnu-configize, which fails with this recipe
 EXTRA_AUTORECONF_append = " --exclude=gnu-configize"
 
-EXTRA_OECONF_append = " --without-lua --enable-python"
+EXTRA_OECONF_append = " --without-lua --enable-python --with-crypto=openssl"
 EXTRA_OECONF_append_libc-musl = " --disable-nls --disable-openmp"
 
 # --sysconfdir prevents rpm from attempting to access machine-specific configuration in sysroot/etc; we need to have it in rootfs
-- 
2.17.1


