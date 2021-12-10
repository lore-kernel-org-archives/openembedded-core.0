Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADECFC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:08:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5838.1639134500346126448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02F5812FC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1FBE3F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 2/4] packagedata.py: silence a DeprecationWarning
Date: Fri, 10 Dec 2021 11:08:12 +0000
Message-Id: <20211210110814.112954-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210110814.112954-1-ross.burton@arm.com>
References: <20211210110814.112954-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159496

From: Mingli Yu <mingli.yu@windriver.com>

Use regex strings (r=E2=80=99=E2=80=99) to silence below deprecation warn=
ing [1]:
 $ cat tmp/work/intel_x86_64-wrs-linux/linux-yocto/5.10.x+gitAUTOINC+917c=
420111_373c02c3ca-r0/temp/log.do_deploy
 [snip]
 /build/layers/oe-core/meta/lib/oe/packagedata.py:22: DeprecationWarning:=
 invalid escape sequence \s
 r =3D re.compile("(^.+?):\s+(.*)")
 [snip]

[1] https://docs.python.org/3/library/re.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/lib/oe/packagedata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 02c81e5a522..212f048bc60 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -19,7 +19,7 @@ def read_pkgdatafile(fn):
         import re
         with open(fn, 'r') as f:
             lines =3D f.readlines()
-        r =3D re.compile("(^.+?):\s+(.*)")
+        r =3D re.compile(r"(^.+?):\s+(.*)")
         for l in lines:
             m =3D r.match(l)
             if m:
--=20
2.25.1


