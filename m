Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B421C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 08:44:54 +0000 (UTC)
Received: from forward101p.mail.yandex.net (forward101p.mail.yandex.net
 [77.88.28.101])
 by mx.groups.io with SMTP id smtpd.web10.4965.1644569087877023191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 00:44:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=OWi84XRG;
 spf=pass (domain: zhukoff.net, ip: 77.88.28.101, mailfrom: pavel@zhukoff.net)
Received: from myt6-93965afc2133.qloud-c.yandex.net
 (myt6-93965afc2133.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:5525:0:640:9396:5afc])
	by forward101p.mail.yandex.net (Yandex) with ESMTP id C2AA359CEF23;
	Fri, 11 Feb 2022 11:44:43 +0300 (MSK)
Received: from myt6-016ca1315a73.qloud-c.yandex.net
 (myt6-016ca1315a73.qloud-c.yandex.net [2a02:6b8:c12:4e0e:0:640:16c:a131])
	by myt6-93965afc2133.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 fPGubgvnPc-ihdGHwbG;
	Fri, 11 Feb 2022 11:44:43 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1644569083;
	bh=oIBeRlUWmuSqFnN5mnc3Xm87NLbaJNT3WiiO9ZhUe2k=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=OWi84XRGfmgs+r5cIGaN/MNJlHMXQZMSOAmRCuIapM/9nAdO7Ho5hVIRbCzn5lV3P
	 kj34nAv5n3WS6kwfABDVWfxXbUDh6OduTnqtXEafTg514ZVQsbR76T6omTqmwboQsG
	 toNoSaNfJHMA+JWTYu7edDL5f6iVwRCHQRL+7hHw=
Authentication-Results: myt6-93965afc2133.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by myt6-016ca1315a73.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id xm0cXdqYTm-igI8sXsw;
	Fri, 11 Feb 2022 11:44:42 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] sanity.class: Add possibility to configure networking check
Date: Fri, 11 Feb 2022 09:44:34 +0100
Message-Id: <20220211084433.10614-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 08:44:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161637

Previously sanity checker required all uri listed in
CONNECTIVITY_CHECK_URIS to be available for networking check. It caused
selftests failures due to temprorary example.com unavailability.
Add CONNECTIVITY_CHECK_ALL variable to change this behaviour and check
for any host from the list to be available it allows to specify
"failover" uri and/or speed checker up if few uris have been specified.

Default value is set to "1" for backward compatibility.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/classes/sanity.bbclass                   | 44 ++++++++++++-------
 .../distro/include/default-distrovars.inc     |  5 ++-
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index f288b4c84c..695776bba3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -326,6 +326,7 @@ def check_connectivity(d):
     # using the same syntax as for SRC_URI. If the variable is not set
     # the check is skipped
     test_uris =3D (d.getVar('CONNECTIVITY_CHECK_URIS') or "").split()
+    check_all =3D (d.getVar('CONNECTIVITY_CHECK_ALL') or "1") =3D=3D "1"
     retval =3D ""
=20
     bbn =3D d.getVar('BB_NO_NETWORK')
@@ -341,22 +342,33 @@ def check_connectivity(d):
         data =3D bb.data.createCopy(d)
         data.delVar('PREMIRRORS')
         data.delVar('MIRRORS')
-        try:
-            fetcher =3D bb.fetch2.Fetch(test_uris, data)
-            fetcher.checkstatus()
-        except Exception as err:
-            # Allow the message to be configured so that users can be
-            # pointed to a support mechanism.
-            msg =3D data.getVar('CONNECTIVITY_CHECK_MSG') or ""
-            if len(msg) =3D=3D 0:
-                msg =3D "%s.\n" % err
-                msg +=3D "    Please ensure your host's network is confi=
gured correctly.\n"
-                msg +=3D "    If your ISP or network is blocking the abo=
ve URL,\n"
-                msg +=3D "    try with another domain name, for example =
by setting:\n"
-                msg +=3D "    CONNECTIVITY_CHECK_URIS =3D \"https://www.=
yoctoproject.org/\""
-                msg +=3D "    You could also set BB_NO_NETWORK =3D \"1\"=
 to disable network\n"
-                msg +=3D "    access if all required sources are on loca=
l disk.\n"
-            retval =3D msg
+        err =3D None
+        for uri in test_uris:
+            try:
+                if check_all:
+                    fetcher =3D bb.fetch2.Fetch(test_uris, data)
+                else:
+                    fetcher =3D bb.fetch2.Fetch([uri], data)
+                fetcher.checkstatus()
+                return retval
+            except Exception as e:
+                err =3D "{} \n {}".format(err, e)
+                if check_all:
+                    break
+
+
+        # Allow the message to be configured so that users can be
+        # pointed to a support mechanism.
+        msg =3D data.getVar('CONNECTIVITY_CHECK_MSG') or ""
+        if len(msg) =3D=3D 0:
+            msg =3D "%s.\n" % err
+            msg +=3D "    Please ensure your host's network is configure=
d correctly.\n"
+            msg +=3D "    If your ISP or network is blocking the above U=
RL,\n"
+            msg +=3D "    try with another domain name, for example by s=
etting:\n"
+            msg +=3D "    CONNECTIVITY_CHECK_URIS =3D \"https://www.yoct=
oproject.org/\""
+            msg +=3D "    You could also set BB_NO_NETWORK =3D \"1\" to =
disable network\n"
+            msg +=3D "    access if all required sources are on local di=
sk.\n"
+        retval =3D msg
=20
     return retval
=20
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
index fb0f1097da..867d694146 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -54,4 +54,7 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
 # fetch from the network (and warn you if not). To disable the test set
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protoc=
ol=3Dgit;rev=3Dmaster;branch=3Dmaster
-CONNECTIVITY_CHECK_URIS ?=3D "https://www.example.com/"
+CONNECTIVITY_CHECK_URIS ?=3D "https://www.example.com/ https://www.yocto=
project.org"
+# Define is all CONNECTIVITY_CHECK_URIS are required to be available or =
it's enough to have some
+# of them reachable for networking check
+CONNECTIVITY_CHECK_ALL ?=3D "0"
--=20
2.34.1


