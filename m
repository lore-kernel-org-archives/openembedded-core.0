Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.28.1610114805887424253
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D4A3113E
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 393ED3F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:45 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 2/7] Silence switch block warnings
Date: Fri,  8 Jan 2021 14:06:35 +0000
Message-Id: <20210108140640.1069133-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Slightly alter a fallthrough comment so that GCC recognises it, and
add a default: case to a switch which explicitly only handles a few
values.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 pseudo.c        | 2 ++
 pseudo_client.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/pseudo.c b/pseudo.c
index ff8e1b9..55f0f18 100644
--- a/pseudo.c
+++ b/pseudo.c
@@ -1036,6 +1036,8 @@ pseudo_op(pseudo_msg_t *msg, const char *program, c=
onst char *tag, char **respon
 			pdb_may_unlink_file(msg, msg->client);
 		}
 		break;
+	default:
+		break;
 	}
=20
 op_exit:
diff --git a/pseudo_client.c b/pseudo_client.c
index 3c49644..eeb1fdc 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -1860,7 +1860,8 @@ pseudo_client_op(pseudo_op_t op, int access, int fd=
, int dirfd, const char *path
 		break;
 	case OP_OPEN:
 		pseudo_client_path(fd, path);
-	case OP_EXEC: /* fallthrough */
+		/* fallthrough */
+	case OP_EXEC:
 		do_request =3D pseudo_client_logging;
 		break;
 	case OP_CLOSE:
--=20
2.25.1

