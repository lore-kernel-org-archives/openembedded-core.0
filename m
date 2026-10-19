Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125.1792429855611720863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 10:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tt4WnwYa;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2DA022BE
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B7A53F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 10:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792429854; bh=UGJon0GqXB/56toErNXmMRhD8X0kfRqRBeofVJFKrw8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tt4WnwYaEvfJuvBnkMaRF786kyIRDqZmy11sHiIRnXYJqBs2kONLxcDJDKIxb3B2n
	 Ibv36WbcSvyGGBP83jXqbqEfSF+DXOOvrhGJFvmf+iiROq9BeCswK6K3FldTzh5pR5
	 svvPh5yWx9oGnWioGFMgzmAbh1C2/gPbxAHVUZdA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-tomlkit: upgrade 0.15.1 -> 0.15.2
Date: Mon, 19 Oct 2026 18:10:49 +0100
Message-ID: <20261019171050.634776-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019171050.634776-1-ross.burton@arm.com>
References: <20261019171050.634776-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 17:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248200
Content-Type: text/plain; charset="utf-8"

- Write the ESC control character as \u001b instead of \e, which is only
  valid in TOML 1.1, so the output stays readable by TOML 1.0 parsers suc=
h as
  tomllib.
- key_value() now raises UnexpectedCharError on anything other than
  whitespace or a comment after the pair, instead of silently discarding =
it
  (e.g. key_value("a =3D 1 b =3D 2")), matching parse().
- integer() given a string now validates it against the TOML integer gram=
mar
  and keeps the original text, so grouping underscores (e.g. integer("1_0=
00"))
  survive dumps(); strings that are not valid TOML integers (e.g. "010") =
now
  raise ValueError.
- Add a fold argument to DateTime and Time, mirroring the stdlib, and
  carry fold through item(), arithmetic (including datetime subtraction) =
and
  unwrap(), so a folded local time no longer converts an hour off.
- Declare the project metadata in the PEP 621 [project] table; building f=
rom
  source now requires poetry-core>=3D2.2.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-tomlkit_0.15.1.bb =3D> python3-tomlkit_0.15.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-tomlkit_0.15.1.bb =3D> pyth=
on3-tomlkit_0.15.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb b/met=
a/recipes-devtools/python/python3-tomlkit_0.15.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb
rename to meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
index b0c51f21c51..cf67cea5529 100644
--- a/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb
+++ b/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://pypi.org/project/tomlkit/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D31aac0dbc1babd278d5386dadb7f8=
e82"
=20
-SRC_URI[sha256sum] =3D "e25bbf38843005246210a12982776f27f99cb9be67160e14=
434d0c0d21ee1e97"
+SRC_URI[sha256sum] =3D "83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcb=
a425de01f7e327a6"
=20
 inherit pypi python_poetry_core ptest-python-pytest
=20
--=20
2.43.0

