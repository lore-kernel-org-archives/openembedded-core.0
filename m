Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web12.3572.1612496584740726247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 19:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.188.50])
	by smtp0.taitradio.net (Postfix) with ESMTP id E6345220656;
	Fri,  5 Feb 2021 16:43:00 +1300 (NZDT)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] externalsrc: Detect code changes in submodules
Date: Fri,  5 Feb 2021 16:42:58 +1300
Message-Id: <20210205034258.340392-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Further to 50ff9afb39, only detect code changes in submodules that are
subdirectories of the EXTERNALSRC directory.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
index 64e94e3301..27496bb2db 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -216,7 +216,7 @@ def srctree_hash_files(d, srcdir=3DNone):
             env['GIT_INDEX_FILE'] =3D tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=3Ds_d=
ir, env=3Denv)
             git_sha1 =3D subprocess.check_output(['git', 'write-tree'], =
cwd=3Ds_dir, env=3Denv).decode("utf-8")
-            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list'], cwd=3Ds_dir, env=3Denv).decode("utf-8")
+            submodule_helper =3D subprocess.check_output(['git', 'submod=
ule--helper', 'list', s_dir], cwd=3Ds_dir, env=3Denv).decode("utf-8")
             for line in submodule_helper.splitlines():
                 module_dir =3D os.path.join(s_dir, line.rsplit(maxsplit=3D=
1)[1])
                 proc =3D subprocess.Popen(['git', 'add', '-A', '.'], cwd=
=3Dmodule_dir, env=3Denv, stdout=3Dsubprocess.DEVNULL, stderr=3Dsubproces=
s.DEVNULL)
--=20
2.25.1

