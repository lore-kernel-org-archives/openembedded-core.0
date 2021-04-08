Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web08.1755.1617844517878977701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 18:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.182.87])
	by smtp0.taitradio.net (Postfix) with ESMTP id 3078DE29A9;
	Thu,  8 Apr 2021 13:09:12 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 1/2] Revert "externalsrc: Detect code changes in submodules"
Date: Thu,  8 Apr 2021 13:08:54 +1200
Message-Id: <20210408010855.345237-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408010855.345237-1-douglas.royds@taitradio.com>
References: <20210408010855.345237-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This reverts commit 4525310d49d115a37705f04ac5c03d639e5e8f8c.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/externalsrc.bbclass | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index 54cc7edbae0..c7b2bf2f49a 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -217,16 +217,14 @@ def srctree_hash_files(d, srcdir=3DNone):
             env['GIT_INDEX_FILE'] =3D tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_d=
ir, env=3Denv)
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], =
cwd=3Ds_dir, env=3Denv).decode("utf-8")
-            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule', 'status'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
+            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
             for line in submodule_helper.splitlines():
-                module_relpath =3D line.split()[1]
-                if not module_relpath.split('/')[0] =3D=3D '..':
-                    module_dir =3D os.path.join(s_dir, module_relpath)
-                    proc =3D subprocess.Popen(['git', 'add', '-A', '.'],=
 cwd=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubpr=
ocess.DEVNULL)
-                    proc.communicate()
-                    proc =3D subprocess.Popen(['git', 'write-tree'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.D=
EVNULL)
-                    stdout, _ =3D proc.communicate()
-                    git_sha1 +=3D stdout.decode("utf-8")
+                module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=3D=
1)[1])
+                proc =3D subprocess.Popen(['git', 'add', '-A', '.'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubproces=
s.DEVNULL)
+                proc.communicate()
+                proc =3D subprocess.Popen(['git', 'write-tree'], cwd=3Dm=
odule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNU=
LL)
+                stdout, _ =3D proc.communicate()
+                git_sha1 +=3D stdout.decode("utf-8")
             sha1 =3D hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
--=20
2.25.1

