Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FEFCDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:31:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11369.1782394303204283788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=u+ykNovI;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28363165C
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:38 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.2.203.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BC833F62B
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782394302; bh=k2xWKI2JblREIKFu+Yh5pZgVLUXq5Yz7Il7Ds1Pca0A=;
	h=From:To:Subject:Date:From;
	b=u+ykNovISSsAJIvTBWO1DaKqFuBpShqXn1Sn1+mEtqCNa6bBI57OhL4xyQrzEpXa3
	 5pFSqOz19qXeaO7a3qgKG9j0ksXexPvDtOwmTzjwDqlxCDgNTwsaZHbs9aD6UNwSXj
	 i5GZ8HNNWLAkc+e1JjoBg59EKu1wegfEnbwGpIME=
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/oe-check-sstate: Handle multiconfig task IDs
Date: Thu, 25 Jun 2026 14:31:35 +0100
Message-Id: <20260625133135.2118442-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239566

When oe-check-sstate parses setscene tasks from a bitbake dry run,
multiconfig task IDs are reported as mc:<mc>:<fn>:<task>.
split_tid() returns the multiconfig name and unprefixed filename,
but the matching multiconfig recipe cache can store pkg_fn keys with
the mc:<mc>: prefix.

This makes translate_virtualfns raise a KeyError while the eSDK task
list is generated for builds that include multiconfig dependencies.

Try the multiconfig-prefixed filename when the unprefixed filename is
not in the selected recipe cache.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 scripts/oe-check-sstate | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 0d171c44632f..435ddaa0c687 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -35,7 +35,12 @@ def translate_virtualfns(tasks):
             (mc, fn, taskname) =3D bb.runqueue.split_tid(task)
             if taskname.endswith('_setscene'):
                 taskname =3D taskname[:-9]
-            outtasks.append('%s:%s' % (recipecaches[mc].pkg_fn[fn], task=
name))
+            recipecache =3D recipecaches[mc]
+            if fn not in recipecache.pkg_fn and mc:
+                mcfn =3D 'mc:%s:%s' % (mc, fn)
+                if mcfn in recipecache.pkg_fn:
+                    fn =3D mcfn
+            outtasks.append('%s:%s' % (recipecache.pkg_fn[fn], taskname)=
)
     finally:
         tinfoil.shutdown()
     return outtasks
--=20
2.34.1


