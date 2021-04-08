Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.1815.1617844517880152010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 18:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.182.87])
	by smtp0.taitradio.net (Postfix) with ESMTP id 9413CE29B2;
	Thu,  8 Apr 2021 13:09:13 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH 2/2] externalsrc: Detect code changes in submodules
Date: Thu,  8 Apr 2021 13:08:55 +1200
Message-Id: <20210408010855.345237-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408010855.345237-1-douglas.royds@taitradio.com>
References: <20210408010855.345237-1-douglas.royds@taitradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

The (undocumented) git submodule--helper returns a path
for each submodule relative to the top of the repo.
Don't add submodules that are not within our source subtree.

[YOCTO #14333]

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/externalsrc.bbclass | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index c7b2bf2f49a..3d6b80bee2b 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -220,11 +220,12 @@ def srctree_hash_files(d, srcdir=3DNone):
             submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=3D=
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
+                if os.path.isdir(module_dir):
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

