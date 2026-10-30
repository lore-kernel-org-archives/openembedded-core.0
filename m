Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8962.1793358299674727874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CQCF4PIz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B631BD0;
	Fri, 30 Oct 2026 04:04:55 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 473A73F7B4;
	Fri, 30 Oct 2026 04:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793358298; bh=lk7/jk7qQysVP6JmIz2dvvpZ3R9pK2tmRN1Psms74Ok=;
	h=From:To:Cc:Subject:Date:From;
	b=CQCF4PIzSKWN+QaGqnm1VEi0raJ0pdYpFEZc3GIRhC5n6rLjMuKCHsrmCizySZgcD
	 LsYNc0MCP6HgVgqNaUTKL7HDusjbBv3wEoMGLuMb5xMwLwXdOPglA5XIUgOVlH+fAT
	 C24zzvlK+KbjxGuhpfjoRUq2AIwGatPugwCvbDvE=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH v2] systemd: Improve detection of executables and libraries
Date: Fri, 30 Oct 2026 11:04:17 +0000
Message-ID: <20261030110417.3320489-1-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249029
Content-Type: text/plain; charset="utf-8"

Use cached mode bits to detect executables independently of
host access permissions. Check shared-library basenames to
avoid matching directory names.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
Changes in v2:
- Replace the regex with basename string checks, as suggested.

 meta/recipes-core/systemd/dlopen-deps.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
index 37074a9682..18c5595d14 100644
--- a/meta/recipes-core/systemd/dlopen-deps.inc
+++ b/meta/recipes-core/systemd/dlopen-deps.inc
@@ -61,7 +61,8 @@ python package_generate_dlopen_deps() {
             if cpath.islink(f):
                 continue
=20
-            if os.access(f, os.X_OK) or ".so." in f or f.endswith(".so")=
:
+            # Scan shared libraries and executable files for dlopen note=
s.
+            if cpath.is_executable(f) or ".so." in os.path.basename(f) o=
r f.endswith(".so"):
                 try:
                     elf =3D oe.qa.ELFFile(f)
                     elf.open()
