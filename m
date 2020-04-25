Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 by mx.groups.io with SMTP id smtpd.web10.8142.1587827973613815415
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 08:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nifty.com header.s=dec2015msa header.b=stgePOUQ;
 spf=softfail (domain: kernel.org, ip: 210.131.2.79, mailfrom: masahiroy@kernel.org)
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
	by conuserg-12.nifty.com with ESMTP id 03PFJANF009822;
	Sun, 26 Apr 2020 00:19:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 03PFJANF009822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1587827951;
	bh=F4Im6HWwK4GqrhbV3qgwE9XmIBpF4eygRIfzmpgmSn4=;
	h=From:To:Cc:Subject:Date:From;
	b=stgePOUQ/DO31xycANm4bOw/b2gLusZUTNz6wBIJxCVkWS+F+AynJv7xNV6sVgyBQ
	 Scd2tkdXQ01qtvQ3K17e7jx7MX+J7rCulYjvmeAyoipFw7G/WdJt9JMlyITzg0nDoO
	 8i2X/PIJ/URNdHOqGssf0SG5yY3kKly06TrgL+EQAxKcAn5BnEgaRye6mQkJMFlXmM
	 yS0ZGdTqdHDSRb3Put+vg+zU+T6aDvZAYU2/zygIPC4uJNiHeGPthIzOh9H3G7hjeB
	 uFiZTsiiRF8Bb1Ik5jdBP6L150RhvhGl1aSh84RukJgQeVVGp71Lx/b4IYs5WsSLax
	 znF2MDzD5Bn1w==
X-Nifty-SrcIP: [126.90.202.47]
From: "Masahiro Yamada" <masahiroy@kernel.org>
To: openembedded-core@lists.openembedded.org,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH RESEND] bitbake.conf: do not let DISTROOVERRIDES fall back to empty string
Date: Sun, 26 Apr 2020 00:19:08 +0900
Message-Id: <20200425151908.1020349-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit abacd7243a2e ("bitbake.conf: fix distro-less failure expanding
FILESPATH") mended the littered DISROOVERRIDES when DISTRO is unset.

Some time later, commit b7279f996397 ("bitbake.conf: Default DISTRO to
nodistro") added a weak default to 'DISTRO'.

So, this line can go back to the original simple definition.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b544a22cd..eb3dd0007e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -739,7 +739,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
-DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
+DISTROOVERRIDES ?= "${DISTRO}"
 MACHINEOVERRIDES ?= "${MACHINE}"
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
-- 
2.25.1

