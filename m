Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42310C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:34:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.10])
 by mx.groups.io with SMTP id smtpd.web11.28027.1639499686626908998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=p7/ABedG;
 spf=pass (domain: outlook.com, ip: 40.92.75.10,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsG5W9CvcwL2oK86ceYoWNYfTsxbZRYlt7ya65Wf1go9ACbFefnJc5qp/7RNQDVRf0zRtlusr/s1n0GD7dFpydMJem9OTOIEjsUASTg0Yb+oH39xZUu9Zm3nphx2yDJmRR88B1pawqU4d+cfwHOvhgw/6PMsimgmhhqLazYHH05DnF4t3/Bd7ZcInq+Pbep1bA72lzLWT2o1tLbZhnYtUl/uwBkjFOXWHhWaWA5u9sI6Qd6U9xuFXyOI+TaEACbWa1Ux0DoXcZBFJkRQ3srQrJqIEAB+IQaqVzK86/NBwiTj4tAhHG97bnuS+yoFG+Mez3xU+pxRLWpkBuy8fVsOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEglb8W9OQ1yqwkygWOWKyFs2MB4wMaNBCyZ/nMpauk=;
 b=URdCebdrxa07PyBxzHkhzZ8Zwgppxq7Gtq5bGce/+cZRy57ZInZ9LNS8yaw60AlpntgAZmEVVudquWS+skFyH/XsyZhIK6s/jrVOflhdRSxdvreo7leEIEWCJkZ2lYZrRd2a7EpudXhxMzUXq/S86q2keKl71ryjO3LkDUdDb8a6Y6dIplOvNUtoMKLo1uL7BMinv4IFft2dkI8zay4NiCWfnosPRLQARWLddgSqjG5dGfpc+RKiw95pu+JXVutemyP0PU0PCEWDmLCuevb56hBTQugAGNB6BLrFFb8WD1PqhDXGc7Lv0zIF5O2B6xBmDpI3f8XQELa64D47O9lZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEglb8W9OQ1yqwkygWOWKyFs2MB4wMaNBCyZ/nMpauk=;
 b=p7/ABedG7ZAjwb63QIfcXITGMe/X1APjcZmjG6bnLdtOTExjUmXnTiIz7GXeNEdfJ6xjdWBotUnP512QTjdxAgnRgRM9i6sgQLAirAYmfC9pTjCFQrov/SjCRm+a1ENOFyuqiPYnPkXv1fMUfeW6ZvISD3rbTzc4yG5WGhl1lS4AcT8pzjpGcuhSmvDe5/Qblnv8U2hSoNJ5RWyqq2J7g7cu43cQRz7ssnmHQMdSzAQ1nYGg0OeElJFHGdHkLg2wX/OOnKocbmvryJPny3UED+DG+AnT5fAz5s94AbVqzRadMGSRIHU+m2YuhkrQ82PKSL+unWldA2pHZeYL2XMoDQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1891.eurprd09.prod.outlook.com (2603:10a6:200:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 16:34:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 16:34:44 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/2] insane: move src-uri-bad checks to unpack stage
Date: Tue, 14 Dec 2021 17:34:17 +0100
Message-ID: 
 <AM9PR09MB464295C33A65F39EB9EEB955A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [YBNdPPHK1WIPjA2qnZNC8HtbMLPxWruz77yvA2P9g1SeaqvPArkqjYkCcmh0Yo4L]
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211214163418.1839126-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d412126-c334-4083-5cbf-08d9bf1fa20f
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclxISl++lM8ZOjhKIfmIxnlLWnvD/OS6FrTIOcxdMQJw2sEg35NMb/J6EJ/wIcrwQVgiRNIk2ePOpN+9xOccG1zH0c3hOKTzYjlCTl9jGq/1uyMFm21sOFQu6RlrERQJNGsHZQcdaGS2+BvkvHuI+oxMX5hwpotJoOX+DlSbaICpbdOrpuN6V6LFF1eAymnHAUNrrbzaEkX5DD6q5kBiE3Jq179iETP1edl6TPTpnCa4O90r9RTbG5KzkfzU1n44p2+ZRmm+bn02KIFwBYy1HwnPbKS04kSFvVpYmRvZfX7i2/fMbiAYrglhipwzKUYgAizdTm+28f1qGpoyDlCY0fVnTn//YNIiNSikaoSUhBXVcmSXfNdEGdeqAJvxYhz/oblpJdN+y4OgGsWhZGBQQmnkrDUiTF3VSspXPWdpeTILlQUT6fguaSydjDJ5+5UClutWleRHdw3IMpcAiB4/qJ0K3juQVMC1PVfLeZ8Kqc1CvDa9wMVXrkvyt16GHRKkKe6KFv1TT6HdwBMrTVe+eeBjnFYQ51cnmxZlPuu27URkCIlpzcXshxE8XC0PKyUSCbjDetzbEN0xmRA5VbYRt0m2Pt60I6abLt1TKvE9BQtFuDcbXX0v4ajLhmcXrihNshgmy3Vz9jAyIRXCxaCKnKpt7wWd7hu+8CLRGWF+3m3iiuNMRjm6mvQFv/+tX0KfcrtC6r8AdfEldisp1qAd69ZpfpB9qgKZFPjEa3n28P6OMPTwumdx3Lmaf/oBHfi+ac=
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1891:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	upJJMYmbh+h/4aYwc4NENWaoJZIsqObdGRSeVq088JhD16fOxIXkxAlC8wAGi8zC1yA4ipT98hbxPQkMLM/8J3hWB/gjon7h0qEjnGBpeun4b4qw/eoKrVwQnXCAh2GeMPbmV0tec/JdS3X5JGftG+Yj6LS+pciAl8935JDlZS37KdJI/nBfF00wRq55pa9XINN/fiBR/p7ZmmJQ5dNtTjjNOkluM9fGZ9Yc9AVBnJWeM8wC6V9JNvi5hRrYTBSlJVJb20fF92aNDStHRDXqjsGOogiN+I9/khIOfkVccHN2ogGlA71CXYgF7U1Bfj4+5GVX/xHjxeM1VH8qmkXDV4gFHXawFgd6RwZ+nZT7nitzJsx7oF5olCQhOO6o/+X7SAtaId0FbbmOfqvHpU0bJG4A1zKJAnPjcy8SbOjIiuihKJs5KNjjh995yiacEmomLpc8jf9klMvTLlD+RLYT45tVG1hL42eFvRYdDiKunwarSczXZOjAjD6ioJyJ+MPfdoEleXPXHVOaWqAFneV7JgJGk38KJBndLLwu3f/g5kXZkE1NjEM7kkawMMeQOdYEwcNprP8tteT6gfk9ecZJ8Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oDduyb46uwcrZIe4khqT3UhW7YHG4o0dKrAFQJU/uHBXL0JjPaZMX7PkR0iM?=
 =?us-ascii?Q?CgYCQCiZSta3+F8fXX+jHbjKQXKabajaOXTO9VRF1K4n5cvR/gxscS7C91XL?=
 =?us-ascii?Q?SOWZxcs2NF+wJDZrRX+lLmpAe4z7as2aHp1rEbw5+Ww+UeiNYmQMhcadb28M?=
 =?us-ascii?Q?6HZuoPqGlkC3ybLQVflwM5lbRFdn6M/yBwki81OhlxxU37cG06Smeht9Wuip?=
 =?us-ascii?Q?qX9cvSud7e3RDI4ZbuYKzdb49PR0fywvUsUwa/InvtOtXkLRbd6RxLkpDjY9?=
 =?us-ascii?Q?rqgH3GApouzkeEnRX552h6rh9WGXPrAUJzxBrBpi0DrkhzC8UUziVHmz/frn?=
 =?us-ascii?Q?G7y4niHFDjWRxZ/3C85a3VtmQkVfdC2mOMhhYys2ZyOjo2wdux08gM5dKZwN?=
 =?us-ascii?Q?Fu6g1lgGWZYglLRYvUhSbI7OTDF9vo64Ex7GBFojDSzIleI4+dEkjXet0PPH?=
 =?us-ascii?Q?2novC0QKEXAGrHO55azyQD00GHpyzNN4jrptLXdyB7uqwCkTMg0oac8wfQqS?=
 =?us-ascii?Q?IAK7Ev0tUekPqZzh3o1CJ387ISq9LW9w5b7PY8lgEzm7xpuXW5vAjWOf9kdX?=
 =?us-ascii?Q?grhBGad3BS+6dKwvAABgfMa+lKQTuGN9uKMsgWMilH4VweQtgQhU+06lUgZ0?=
 =?us-ascii?Q?ILoo8hPM0GQuBBmnMFWfxboHb6oB/hJz3cZHkNFm9xFVUlxBroN86icM3ZpA?=
 =?us-ascii?Q?Ggu8ZLCQcINEbZZCAPJfBBj5uWE68uIBBAWfcAZvuGcWj/wlZh0AmCns/ZPb?=
 =?us-ascii?Q?+KWSniEaLvk87IgXLMG1K8NVEFNvdAcB4ZQwaTwSLpR9zTRf4cuByzLqZb/C?=
 =?us-ascii?Q?Exw5298HqoVc+t1gLU4ljf3xtCi4aa8Gdov4bJHNIkV9Ii9IFLuBXxKimA34?=
 =?us-ascii?Q?eT+jJxoBgPZ6OayOf3gWfWXdHzB67h6JNlfTUFuW2OQ8X3e+u1qXS+YRibCv?=
 =?us-ascii?Q?+bYjiOPzTeSXXhpJPlgaFdMCvT9K+gjVi1jus456mEH3rYFFWaMaE3NjCmv+?=
 =?us-ascii?Q?ehsLQGu9Of7Dq/UtoBtv1SJ2eQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d412126-c334-4083-5cbf-08d9bf1fa20f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 16:34:44.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159695

previously used package_qa_check_src_uri was triggered during
package_qa stage, which implies having packages.
This isn't the case for native-only recipes or recipe that inherit
nopackages.

Still the checks performed (src-uri-bad) apply to those as well.
Therefore move the check from package_qa stage to unpack stage.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/insane.bbclass | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..70c2d97df1 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -968,17 +968,6 @@ def package_qa_check_host_user(path, name, d, elf, mes=
sages):
             return False
     return True
=20
-QARECIPETEST[src-uri-bad] =3D "package_qa_check_src_uri"
-def package_qa_check_src_uri(pn, d, messages):
-    import re
-
-    if "${PN}" in d.getVar("SRC_URI", False):
-        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % =
pn, d)
-
-    for url in d.getVar("SRC_URI").split():
-        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
-            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable G=
itHub/GitLab archives, convert recipe to use git protocol" % pn, d)
-
 QARECIPETEST[unhandled-features-check] =3D "package_qa_check_unhandled_fea=
tures_check"
 def package_qa_check_unhandled_features_check(pn, d, messages):
     if not bb.data.inherits_class('features_check', d):
@@ -1285,11 +1274,28 @@ Rerun configure task after fixing this."""
     oe.qa.exit_if_errors(d)
 }
=20
+def unpack_check_src_uri(pn, d):
+    import re
+
+    skip =3D (d.getVar('INSANE_SKIP') or "").split()
+    if 'src-uri-bad' in skip:
+        bb.note("Recipe %s skipping qa checking: configure-unsafe" % d.get=
Var('PN'))
+        return
+
+    if "${PN}" in d.getVar("SRC_URI", False):
+        oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % =
pn, d)
+
+    for url in d.getVar("SRC_URI").split():
+        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
+            oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable G=
itHub/GitLab archives, convert recipe to use git protocol" % pn, d)
+
 python do_qa_unpack() {
     src_uri =3D d.getVar('SRC_URI')
     s_dir =3D d.getVar('S')
     if src_uri and not os.path.exists(s_dir):
         bb.warn('%s: the directory %s (%s) pointed to by the S variable do=
esn\'t exist - please set S within the recipe to point to where the source =
has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))
+
+    unpack_check_src_uri(d.getVar('PN'), d)
 }
=20
 # The Staging Func, to check all staging
--=20
2.25.1


