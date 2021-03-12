Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.8.1615570935578801356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=aCslcIzk;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id AA1C020B3754;
	Fri, 12 Mar 2021 09:42:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AA1C020B3754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1615570935;
	bh=I+NkEeqJla+Uv7QqoBvDtwvq84Zs+pLQ8gmibE3fyzI=;
	h=From:To:Cc:Subject:Date:From;
	b=aCslcIzkLCcVf7PeoB+m4sN7u23XsmcQnciE3eii41RY4ZcXwK1w32O0hvZASBaAF
	 wesB6yFK1Q6lM0TLFRRdN6m45X8yyx2iKAyFL9BlMCTqS91puXKuA/JwG7twJ9Qww7
	 uNquT3zCh35p5N0DHvbT205lqs3Qe4WxSD9SOc3M=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH] devtool: Fix do_kernel_configme task
Date: Fri, 12 Mar 2021 10:41:15 -0700
Message-Id: <20210312174115.3028275-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The do_kernel_configme task is no longer part of SRCTREECOVEREDTASKS,
its been removed from the kernel-yocto.bbclass since b72dbb2e4, but
there wasnt a matching patch for devtool for those changes.

This patch enables us to invoke the do_kernel_configme task when
using a devtool workspace, it also prepends a check for an existing
.config file in the source directory and moves it if thats the case,
since when using devtool modify a .config is created and
do_kernel_configme complains about it, this is not the case when
using bitbake since the .config file would be on B instead.

Alowing do_kernel_configme to run also fixes the flow where testing a
new config fragment from devtool workspace isnt added properly
(config queue shows it as ///frg.cfg) and as a side effect it never
gets merged into the final config.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 scripts/lib/devtool/standard.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 7b62b7e7b8..f364a45283 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -953,12 +953,17 @@ def modify(args, config, basepath, workspace):
=20
             if bb.data.inherits_class('kernel', rd):
                 f.write('SRCTREECOVEREDTASKS =3D "do_validate_branches d=
o_kernel_checkout '
-                        'do_fetch do_unpack do_kernel_configme do_kernel=
_configcheck"\n')
+                        'do_fetch do_unpack do_kernel_configcheck"\n')
                 f.write('\ndo_patch[noexec] =3D "1"\n')
                 f.write('\ndo_configure_append() {\n'
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
                         '}\n')
+                f.write('\ndo_kernel_configme_prepend() {\n'
+                        '    if [ -e ${S}/.config ]; then\n'
+                        '        mv ${S}/.config ${S}/.config.old\n'
+                        '    fi\n'
+                        '}\n')
             if rd.getVarFlag('do_menuconfig','task'):
                 f.write('\ndo_configure_append() {\n'
                 '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
--=20
2.25.1

