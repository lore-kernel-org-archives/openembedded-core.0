Received: from nebuchadnezzar.corp.vecima.com (nebuchadnezzar.corp.vecima.com [204.83.204.143])
 by mx.groups.io with SMTP id smtpd.web12.3567.1621375784281580085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 15:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: nebuchadnezzar.corp.vecima.com, ip: 204.83.204.143, mailfrom: dan@nebuchadnezzar.corp.vecima.com)
Received: by nebuchadnezzar.corp.vecima.com (Postfix, from userid 1001)
	id 9A8EB5C0753; Tue, 18 May 2021 16:09:43 -0600 (CST)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 2/2] sstate: Ignore sstate signing key
Date: Tue, 18 May 2021 16:09:30 -0600
Message-Id: <20210518220930.172832-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518220930.172832-1-danismostlikely@gmail.com>
References: <20210518220930.172832-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Daniel McGregor <daniel.mcgregor@vecima.com>

What key is used to sign sstate artefacts should not affect the hash of
the object, otherwise everyone would need to use the same signing key.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 1a6e9962f9..3a3f7cc24b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -706,6 +706,8 @@ def sstate_package(ss, d):
=20
     return
=20
+sstate_package[vardepsexclude] +=3D "SSTATE_SIG_KEY"
+
 def pstaging_fetch(sstatefetch, d):
     import bb.fetch2
=20
--=20
2.31.1

