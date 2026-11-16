Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3365.1794863082437311543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YX2ggLfX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 075011682
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:39 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9CD213F632
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 13:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794863082; bh=aA03/aOXa02TzkNQjRZRbvMBmTwXYHX9QrsBbSnorYY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YX2ggLfXG3wAVTXggnIsIQBOige2rbXdmUw6QcCyTvSf4Ro7mO0DcQyzBb6j/O4t+
	 6o28mOm6gn9Rb6ob4fqRF00Rv3oDmIsI7UtJR+awLH6RhI7igOfLzs6ZbAhzmNacJU
	 KOsFbLp9iCAF7ivlEbxd5wpirHsuqZ612jKH5H3I=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] python3targetconfig: don't manipulate PYTHONPATH
Date: Mon, 16 Nov 2026 21:04:35 +0000
Message-ID: <20261116210435.4161338-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116210435.4161338-1-ross.burton@arm.com>
References: <20261116210435.4161338-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 21:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250380
Content-Type: text/plain; charset="utf-8"

Since Python 3.14[1] there is no need to manipulate PYTHONPATH, we can
set _PYTHON_SYSCONFIGDATA_PATH to the correct path.

[1] cpython aecbc2e6f40 ("gh-115382: Fix cross compiles when host and
    target use same SOABI")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python3targetconfig.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/class=
es-recipe/python3targetconfig.bbclass
index 08be22ae654..76cd675782e 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -13,8 +13,8 @@ DEPENDS:append =3D " ${EXTRA_PYTHON_DEPENDS}"
=20
 setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
+        export _PYTHON_SYSCONFIGDATA_PATH=3D"${STAGING_LIBDIR}/python-sy=
sconfigdata"
         export _PYTHON_PROJECT_BASE=3D"${B}"
-        export PYTHONPATH=3D${STAGING_LIBDIR}/python-sysconfigdata${PYTH=
ONPATH:+:$PYTHONPATH}
         export PATH=3D${STAGING_EXECPREFIXDIR}/python-target-config/:$PA=
TH
 }
=20
--=20
2.43.0

