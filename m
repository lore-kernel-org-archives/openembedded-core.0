Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.1714.1616024279100411133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 16:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.182.87])
	by smtp0.taitradio.net (Postfix) with ESMTP id 65C8F2203EE;
	Thu, 18 Mar 2021 12:37:57 +1300 (NZDT)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH v2] externalsrc: Detect code changes in submodules
Date: Thu, 18 Mar 2021 12:37:55 +1300
Message-Id: <20210317233755.255634-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

git submodule status returns a path relative to the cwd for each submodul=
e.
We don't add submodules that are not within our source subtree.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/externalsrc.bbclass | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index 64e94e3301..3c067fbc37 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -216,14 +216,16 @@ def srctree_hash_files(d, srcdir=3DNone):
             env['GIT_INDEX_FILE'] =3D tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_d=
ir, env=3Denv)
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], =
cwd=3Ds_dir, env=3Denv).decode("utf-8")
-            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
+            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule', 'status'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
             for line in submodule_helper.splitlines():
-                module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=3D=
1)[1])
-                proc =3D subprocess.Popen(['git', 'add', '-A', '.'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubproces=
s.DEVNULL)
-                proc.communicate()
-                proc =3D subprocess.Popen(['git', 'write-tree'], cwd=3Dm=
odule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.DEVNU=
LL)
-                stdout, _ =3D proc.communicate()
-                git_sha1 +=3D stdout.decode("utf-8")
+                module_relpath =3D line.split()[1]
+                if not module_relpath.split('/')[0] =3D=3D '..':
+                    module_dir =3D os.path.join(s_dir, module_relpath)
+                    proc =3D subprocess.Popen(['git', 'add', '-A', '.'],=
 cwd=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubpr=
ocess.DEVNULL)
+                    proc.communicate()
+                    proc =3D subprocess.Popen(['git', 'write-tree'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.D=
EVNULL)
+                    stdout, _ =3D proc.communicate()
+                    git_sha1 +=3D stdout.decode("utf-8")
             sha1 =3D hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
--=20
2.25.1

