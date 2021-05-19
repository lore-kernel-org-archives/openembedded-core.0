Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.13674.1621440003615941466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 09:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 79CB120B7178;
	Wed, 19 May 2021 09:00:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 79CB120B7178
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] baremetal-image: Fix post process command rootfs_update_timestamp
Date: Wed, 19 May 2021 09:59:53 -0600
Message-Id: <20210519155953.1347336-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

When running:

execute_pre_post_process(d, d.getVar(ROOTFS_POSTPROCESS_COMMAND))

rootfs_update_timestamp is run, which assumes that rootfs/${sysconfdir}
is already created (usually done through the do_rootfs task on linux).

This causes the build to fail if ${sysconfdir} does not exist.

This may be overlooked if debug-tweaks is enabled since some other
commands are added, one of which creates the required path
(see postinst_enable_logging).

See [1] for more info:

[1] https://github.com/aehs29/meta-freertos/issues/4

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 meta/classes/baremetal-image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremeta=
l-image.bbclass
index 319b61c7cd..8708a54301 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -50,6 +50,10 @@ python do_rootfs(){
         if os.path.lexists(manifest_link):
             os.remove(manifest_link)
         os.symlink(os.path.basename(manifest_name), manifest_link)
+    # A lot of postprocess commands assume the existence of rootfs/etc
+    sysconfdir =3D d.getVar("IMAGE_ROOTFS") + d.getVar('sysconfdir')
+    bb.utils.mkdirhier(sysconfdir)
+
     execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
 }
=20
--=20
2.25.1

