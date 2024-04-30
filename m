Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77525C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 13:57:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16122.1714485440367773493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 06:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1EEC2F4;
	Tue, 30 Apr 2024 06:57:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DD83F793;
	Tue, 30 Apr 2024 06:57:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] insane: handle dangling symlinks in the libdir QA check
Date: Tue, 30 Apr 2024 13:57:16 +0000
Message-Id: <20240430135716.2582253-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 13:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198760

The "libdir" QA check tries to open every file it finds as an ELF.  If
it finds a dangling symlink that looks like a library by the filename it
will try to open it and fail with FileNotFoundError error.  As this
dangling symlink probably points to a real file, silently absorb the
error.

[ YOCTO #13949 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index e963001d09a..c32dfffd836 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -298,7 +298,7 @@ def package_qa_check_libdir(d):
                         try:
                             elf.open()
                             messages.append("%s: found library in wrong =
location: %s" % (package, rel_path))
-                        except (oe.qa.NotELFFileError):
+                        except (oe.qa.NotELFFileError, FileNotFoundError=
):
                             pass
                 if exec_re.match(rel_path):
                     if libdir not in rel_path and libexecdir not in rel_=
path:
@@ -307,7 +307,7 @@ def package_qa_check_libdir(d):
                         try:
                             elf.open()
                             messages.append("%s: found library in wrong =
location: %s" % (package, rel_path))
-                        except (oe.qa.NotELFFileError):
+                        except (oe.qa.NotELFFileError, FileNotFoundError=
):
                             pass
=20
     if messages:
--=20
2.34.1


