Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0ADC56205
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 17:28:30 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24763.1786037307675557657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 10:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=c5W2TQ+i;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6B5F520B710C
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2026 10:28:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6B5F520B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1786037285;
	bh=X+rIUhXjSFPMef1cdCmYxrriFVtfDE6eUGN8Ouegkm4=;
	h=From:To:Subject:Date:From;
	b=c5W2TQ+ihSl/0Ui8HDwXKYurbZfVefHZzo/R/VohiQUVyLi7tIUMEPkXTMqGdkjBe
	 p/U/UPNJosGvfkQMuJN2TTXiBU68h4BmPagsZfzdSs8iixlVdaKxIdNuaZEbLpbHR4
	 6D6fH+AB6ojHURZkshoVvGXEwjJzfFVFEbU4U30M=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python_pep517.bbclass: export _PYTHON_HOST_PLATFORM to match our cross-compile target
Date: Thu,  6 Aug 2026 17:28:21 +0000
Message-ID: <20260806172821.4087020-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242964

When the _PYTHON_HOST_PLATFORM environment variable is unset, the value f=
alls
back to the build host architecture, therefore, python wheels get an inco=
rrect
platform tag, setting it as an empty value is also not allowed on python =
> 3.14.

Set _PYTHON_HOST_PLATFORM as HOST_ARCH dependent so bitbake correctly tag=
s wheels
depending on our cross-compile target, fixing reproducibility issues.

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/classes-recipe/python_pep517.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index d6246af5c2..a3c7d704d6 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -30,6 +30,10 @@ PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
 # pypa/installer option to control the bytecode compilation
 INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=20
+# Python wheels are tagged with the HOST platform when built, use HOST_A=
RCH
+# since we are cross-compiling, avoiding incorrect host or an empty tag
+export _PYTHON_HOST_PLATFORM =3D "linux-${HOST_ARCH}"
+
 # PEP517 doesn't have a specific configure step, so set an empty do_conf=
igure to avoid
 # running base_do_configure.
 python_pep517_do_configure () {
--=20
2.43.0


