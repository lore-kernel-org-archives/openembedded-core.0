Received: from p3plsmtpa11-10.prod.phx3.secureserver.net (p3plsmtpa11-10.prod.phx3.secureserver.net [68.178.252.111])
 by mx.groups.io with SMTP id smtpd.web10.9172.1601117620383929068
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 03:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pabigot.com, ip: 68.178.252.111, mailfrom: pab@pabigot.com)
Received: from tirzah.pab ([73.65.46.39])
	by :SMTPAUTH: with ESMTPSA
	id M7pikCXpi39zVM7pjkpZt9; Sat, 26 Sep 2020 03:53:39 -0700
X-CMAE-Analysis: v=2.3 cv=AfHP4EfG c=1 sm=1 tr=0
 a=G5fDw918NYv3KufUwDvNPg==:117 a=G5fDw918NYv3KufUwDvNPg==:17 a=tR03Z30jAAAA:8
 a=w8xWLukNAOQrsqd2yfAA:9 a=KfdqL2KK0gLj6ZZCE6RX:22
X-SECURESERVER-ACCT: pab@pabigot.com
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Cc: otavio@ossystems.com.br,
	"Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH] go-mod.bbclass: use append to add `modcacherw`
Date: Sat, 26 Sep 2020 05:53:09 -0500
Message-Id: <20200926105309.2288615-1-pab@pabigot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfILczbs9eb/KMqIlt3GixfuQ3XfKdwk4zlt8ltbNK8YX265x6RDm7Ezg5IwKrqJC55UwTIRUbKu+oLUl/8tKC92GKqnSpjv4MG1u4OwwSd6ff4xSRKqE
 MEJOu6e9db4MgckA1midZCgS+xM7ooe4Wy9pYL7+t+ZJR/9NDzuY/GCAIOx0NqbJrZ8NpbOOQShKXOIboLxRQUfY2Pq++rnGcga7RjajmiUXJAamR9XwoHMW
 yhVkaygkhaBw1bZPFcFDKg==
Content-Transfer-Encoding: 8bit

This class provided default build flags but includes the base go class
which also provides default flags.  Use a different mechanism to
extend the default flags without discarding `-trimpath` from the base
class.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/go-mod.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
index 5871d025067..cabb04d0ec0 100644
--- a/meta/classes/go-mod.bbclass
+++ b/meta/classes/go-mod.bbclass
@@ -12,7 +12,7 @@
 
 # The '-modcacherw' option ensures we have write access to the cached objects so
 # we avoid errors during clean task as well as when removing the TMPDIR.
-export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -modcacherw"
+GOBUILDFLAGS_append = " -modcacherw"
 
 inherit go
 
-- 
2.25.1

