Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.591.1605890386075041312
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 08:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: vincent.stehle@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB3A811D4;
	Fri, 20 Nov 2020 08:39:45 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.61.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9133F70D;
	Fri, 20 Nov 2020 08:39:44 -0800 (PST)
From: vincent.stehle@arm.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Subject: [PATCH pseudo] Fix build with gcc 10
Date: Fri, 20 Nov 2020 17:38:53 +0100
Message-Id: <20201120163853.13737-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add a missing typedef in front of the pseudo_access_t definition. Otherwi=
se
pseudo_access_t ends up being a global enum, defined each time pseudo_ipc=
.h
is included.

This fixes the following link time error with gcc 10:

  multiple definition of `pseudo_access_t'

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@arm.com>
---
 pseudo_ipc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_ipc.h b/pseudo_ipc.h
index caeae5c..d945257 100644
--- a/pseudo_ipc.h
+++ b/pseudo_ipc.h
@@ -29,7 +29,7 @@ typedef struct {
 	char path[];
 } pseudo_msg_t;
=20
-enum {
+typedef enum {
 	PSA_EXEC =3D 1,
 	PSA_WRITE =3D (PSA_EXEC << 1),
 	PSA_READ =3D (PSA_WRITE << 1),
--=20
2.29.2

