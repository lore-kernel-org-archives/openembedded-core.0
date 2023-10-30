Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0662C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.146805.1698666526879978831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 04:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D31BFEC;
	Mon, 30 Oct 2023 04:49:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4345A3F738;
	Mon, 30 Oct 2023 04:48:40 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] scripts/contrib/patchreview: fix commit identification
Date: Mon, 30 Oct 2023 11:48:38 +0000
Message-Id: <20231030114839.421272-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189792

From: Ross Burton <ross.burton@arm.com>

git show-ref looks at the _remote_ ref called HEAD, which is fine when it
matches the local HEAD but problematic when you're iterating a series of
commits.

Use rev-parse to resolve the local name to a proper hash.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/contrib/patchreview.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview=
.py
index f95cadab0c6..bceae06561c 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -257,7 +257,7 @@ if __name__ =3D=3D "__main__":
         row =3D collections.Counter()
         row["total"] =3D len(results)
         row["date"] =3D subprocess.check_output(["git", "-C", args.direc=
tory, "show", "-s", "--pretty=3Dformat:%cd", "--date=3Dformat:%s"], unive=
rsal_newlines=3DTrue).strip()
-        row["commit"] =3D subprocess.check_output(["git", "-C", args.dir=
ectory, "show-ref", "--hash", "HEAD"], universal_newlines=3DTrue).strip()
+        row["commit"] =3D subprocess.check_output(["git", "-C", args.dir=
ectory, "rev-parse", "HEAD"], universal_newlines=3DTrue).strip()
         row['commit_count'] =3D subprocess.check_output(["git", "-C", ar=
gs.directory, "rev-list", "--count", "HEAD"], universal_newlines=3DTrue).=
strip()
         row['recipe_count'] =3D count_recipes(layers)
=20
--=20
2.34.1


