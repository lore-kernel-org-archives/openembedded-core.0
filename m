Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40594.1601309950147017200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 09:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1035113E
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CB2E3F6CF
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 09:19:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] utils: respect scheduler affinity in cpu_count()
Date: Mon, 28 Sep 2020 17:18:55 +0100
Message-Id: <20200928161900.452970-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161900.452970-1-ross.burton@arm.com>
References: <20200928161900.452970-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

cpu_count() returns multiprocessing.cpu_count() but that is simply return=
s
os.cpu_count() so we could use that directly.

However this returns the number of CPUs on the host, not the number of
usable CPUs on the host. If the user is using scheduler affinity then
the number of usable CPUs may be less, so when determining how many cores
we can use check the affinity instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/utils.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 13f4271da0..468c76f30f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -249,8 +249,7 @@ def trim_version(version, num_parts=3D2):
     return trimmed
=20
 def cpu_count(at_least=3D1):
-    import multiprocessing
-    cpus =3D multiprocessing.cpu_count()
+    cpus =3D len(os.sched_getaffinity(0))
     return max(cpus, at_least)
=20
 def execute_pre_post_process(d, cmds):
--=20
2.25.1

