Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.3146.1619120584390251373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 12:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=hpCBKi7g;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id F338920B8001;
	Thu, 22 Apr 2021 12:43:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F338920B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1619120583;
	bh=ZSlqw0w0YrRgnY8E6pE8KaBdmlSAKq7jmfOzJ+YoDTo=;
	h=From:To:Cc:Subject:Date:From;
	b=hpCBKi7gRI1yqn5Y2Fja3ObvqAI3CMjYS5IKFuf/AG2XIqbF+e8zmP3MEA4xwuubM
	 vH5MFAc+FC9fypjDCPPjdtHfPHvK7aNnKqN49hLZivUR+/Ldz70VuoVZjYuapFEn3D
	 BhAXlYmbzwhf3WwYCVph9b5ST3kskH0duQ/0KhSc=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Konrad Weihmann <kweihmann@outlook.com>
Subject: [oe-core][dunfell][PATCH] cve-update-db-native: skip on empty cpe23Uri
Date: Thu, 22 Apr 2021 13:42:49 -0600
Message-Id: <20210422194249.796105-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Konrad Weihmann <kweihmann@outlook.com>

Recently an entry in the NVD DB appeared that looks like that
{'vulnerable': True, 'cpe_name': []}.
As besides all the vulnerable flag no data is present we would get
a KeyError exception on acccess.
Use get method on dictionary and return if no meta data is present
Also quit if the length of the array after splitting is less than 6

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index 0cd3a1c153..f37a0f69cd 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -132,7 +132,12 @@ def parse_node_and_insert(c, node, cveId):
         for cpe in node.get('cpe_match', ()):
             if not cpe['vulnerable']:
                 return
-            cpe23 =3D cpe['cpe23Uri'].split(':')
+            cpe23 =3D cpe.get('cpe23Uri')
+            if not cpe23:
+                return
+            cpe23 =3D cpe23.split(':')
+            if len(cpe23) < 6:
+                return
             vendor =3D cpe23[3]
             product =3D cpe23[4]
             version =3D cpe23[5]
--=20
2.25.1

