Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD24FCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:32:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64298.1790616726684181207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NYq1XJrv;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B70441655
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BAF813F763
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790616726; bh=C4J9dOOBqqpdhUL/fHZOQlqeQgx9bHC4U6GnBGCPtWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NYq1XJrvLcnLPg/bkqwaAuQpEQsP+Ge85cWzARf7GWc1LUuWwUn0MY4u7nm3BTJj/
	 fSaAlYZgcwKq5jVhkXKTyw1eiSulveCXAg5BHQMwI8x0QZd0XhtculHEYK8bHhBIzV
	 9N20wbB3nCFvM+goCotXh0ekPONQToc7OmC2nHUQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 4/4] recipetool: normalise python packages when constructing PN
Date: Mon, 28 Sep 2026 18:31:58 +0100
Message-ID: <20260928173158.781301-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928173158.781301-1-ross.burton@arm.com>
References: <20260928173158.781301-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 17:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246781

When constructing PN for python recipes, normalise the package name.

For example, the package boolean.py uses python3-boolean-py.bb instead of
python3-boolean.py.bb.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
index 1d8a3b8dfda..0c5f44b9663 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -238,7 +238,7 @@ class PythonRecipeHandler(RecipeHandler):
             if bbvar =3D=3D "PN":
                 # by convention python recipes start with "python3-"
                 if not value.startswith('python'):
-                    value =3D 'python3-' + value
+                    value =3D 'python3-' + self.pypi_normalise(value)
=20
             if bbvar not in extravalues and value:
                 extravalues[bbvar] =3D value
--=20
2.43.0


