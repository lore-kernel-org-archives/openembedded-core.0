Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA5CC43217
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 10:04:13 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.13])
 by mx.groups.io with SMTP id smtpd.web10.38541.1639562652048623452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 02:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=QgPHpT0c;
 spf=pass (domain: outlook.com, ip: 40.92.69.13,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8n3qrH0vGYZTkog+pwKMcrXL1YX7owQf5ceY1RUivHH4hNxEQeaB/AsgYPyHMt9/P9Ha9DoIhq4zZdsZTtzQvrDz0bcGWk/xGVJl6w4UBlhqWbHSyGzye5OLmW0MFlgL1FYCrmFXIs9mzWEOMK0DTDG1I2BLpOMMnz5fvEcKrf7srmQUrzjso1vCpkUCUEyftbbhU5bZwsAqEQ3m/eJiFyu3ERvknyF+iBECzYhjfFAjXDkGInDTWE13mq6xt8zXEf0tRGJZqwuzNqw/ncvUIWjli8L/5rP+HkqhkB1Bbq0+ouLQzqqOlAxkVJman7nEZTn+f5AakFmDhKg1zVb0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0GGBaTyTchTdSiHfErT8pTf652cU/VmyoAhOV2TE+0=;
 b=WiPtrIsdk4GF+LFnURdZFZx+YBQByLSLI1+O0aoP8N/dGq2NKOa0FECybLqvacrNIIcxv2ce+u3Fpjvm8zrLjG/SWH56QmNQXmUpezbzudz5FjQrvraLj9R3G87Ytr6S1VtmpIWfPbwTjEhEnVQgHvBo+GD/AJuEjRkE98CgzaDrs5TZG4n3qd9WOZj73s+4FfnFZy0PYo8cJ9M4TgwclxN4S4Tp5BDIVDQ36/p9P4G3U8GfnrZAtKX0tmKV9IL1fLLi4q14z5o9IuZfy7kaJNp6eHEpOPxMlCYGFar/JedQd3goaRv774iUfbYiySx5ddq35obVVoFdKWopwWiLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0GGBaTyTchTdSiHfErT8pTf652cU/VmyoAhOV2TE+0=;
 b=QgPHpT0c94FrH7Kn9peixphO+7bSLAWvhxkES4IXNwajFVHtQU7/ngbYeygybRY5mMr5Qhfjvno2fJDrOgG6JlIsv7zWTl2rPoEOa5oHONYJJE6Bko0rEInZ9ToNuY5HrN4naRcsZdxCm/Q26Mc4IdqcN6WyQ5G5qi045kgGCN3vE/8xw6pAL59+tS4jbUFA//VpBUvBXg6cf74LM2ud61HNwyPGs5M1qYBgnK1bxOvFfx77oRZNL8WtbVqmAdebx1hUvUDlobz5vCINk28HYwikvKDaO2U3AaqpS1ZlfY9Lk41NWneo19CXE7Brftcawpm7w1yC8JqbXJqAcd0QuA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4068.eurprd09.prod.outlook.com (2603:10a6:208:191::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 10:04:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 10:04:09 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][RFC PATCH 1/2] oe.lib.recipeutils: add get_layer_name
 method
Date: Wed, 15 Dec 2021 11:03:43 +0100
Message-ID: 
 <AM9PR09MB4642028BF93F66BFD3BD68D6A8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [pZ+0P5Rp1hUsF6yJWQyaWzJNNVdpWLgKF8pYxwuG4RlUrS+xL485jrU11U/1FUYs]
X-ClientProxiedBy: AM8P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211215100344.3266900-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d273fd1c-d85b-4e34-c030-08d9bfb23c50
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclxISl++lM8ZOjhKIfmIxnlsQJipVrfYqxrB/YR+UuHZGDv4XcgTpkwJz6enfpEVqEUxuU79L+i+d98lRE94Lh0NjPFEMkSgrrHj0+bLaSz9xmk3s/rz5A9c4L8XJLenfX9MLFO216Kv1fqfPOXWDH5M5CvfeGoJgdr+8Po1wm7kfxbbObcf/9+IM7hS3TKLJ+XNNVTjxLQSuvSkH1DFmGQF9OUDBNezSO6jZezuWyxxAHSoA8ns2PpPqAiSJGDfh4e+mQgsrQTuSN3Ebul3gOoqGdsu4BEsRHgGdYKQNmcNbuemOv2iYGtq8/deoXp8nqcVBGCB75ZjEqM8cAig760DX0Ub9uPys16vk5ymCCqALAJ1cXteaS4sIYIWdYxuT6hMpWamMnE8ZemegUY12e9PDLLwYCn+TMjN7fKLi4bEbOPz0qBEDavz2VA2NWAVGM4aK5Z+xA7aA0ukgKo8/qz/0ep5Zz8XT1UacKEaqs+UuavDWvDMczLlQXCjVvFAtJw0l6oigZ57LdWKR5HXluiwm7V+K7vw8dyJJnsoX6o/m8eR+4MzuHs3jVd9S3ycMVilrA9jf39EVE8U06mw7/clFFpcRawylvmCue0PbzxqT3c1tQQixdkBgcnzh/a9sWTruGRN/4wQb1DfPkuSFRa8b2OF8ozOtCcF0Jdr8ojiDTILTahtrFCv4AkwZy0H7RhXGtDgSB5L/lkmShw7PJVmv3C38umHSa0iXHC3gxdpcI4tZLPd/zukX+Ut6XLxsU=
X-MS-TrafficTypeDiagnostic: AM0PR09MB4068:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hmlBQWk8ACtvgBMoq9bE0gAlk0MdQLc/z5/aVZfUfaEo3f3cJNtixzgXcRM89xF+aAXqEPs2OBJkijDwz6PutVWjKZ09Of4dQA7q9cHcM8vJJSzoeVZSsRQiR2ZIgsTccOIXQ0kgfoNu9fZ1fcKYwEyMkv5MdbBqGwlnSQ6OaqCWBcWpTGOTQmPpL740I0u8/fF83jQpxyfC6g8QF/laAYRo/1DT3GG7enH1NtWlNOv4EwtimHnSGbc1tZDuG/DQX/Mw9kNCC7FikZ9MtMuSC8QgnVBS7GDuM8uevW2QNpDTi+70rRVKd3VrHnWfOkY98RxXvkbkCHup+TRKOKbVSEpxjI8PNmeRVMqtJcvscoyJi/0e6GwIKkf13RycZDBC6rSBkKUR8TtZP8IMcIXOOlA1LHzuKo289PmrRDfwdHfZCZro7npGf8u04yv8zVlVZwjjVXAwGNP+nFdyYgReVdSOVA2JMB5Zv0QCnRGsd4BTTqZD55hFccvcmJ7QfTaz9FPyBj8qCEG9veiHDwxvABpkKXaXyUT2dDGQwYY1Jym5sIeriklbGL2Y2Aadq48TwZSbbfXBwAIFQlwhQ2EqHA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S/2p+X2+7uc3Ecr0r9h7mWRf+TLOEfGzvbh8E2fTSMWVJ84n5AreEPJKCZ2p?=
 =?us-ascii?Q?rCpDldtC8wOXLe91l5Ojr3OoMoD10hj6TFhAnHLd2pwjvCPFI1uVWCg4sDWE?=
 =?us-ascii?Q?DWoKPPmrQQAPRnAU2BSxboZXa15cEGCssRMTCB1cKJnzfO2Hq9aw5sm8+w9p?=
 =?us-ascii?Q?OTlfI+ljghCHWiXnLoc68FgmPf84XKmJjvohmYM8mjSPhUK4mhBZAK1ZeBOO?=
 =?us-ascii?Q?sj+rhtzrNA/rGnoBjxgBI2eUQt3b/bBij0EmFPCaACaa0gYX+JsB7vyzR4VZ?=
 =?us-ascii?Q?PG5l5CAB6eAouW6zuRgXoeMjYiZTpTXuZUshaFgtz1xlXZPwcade4K7Jidw2?=
 =?us-ascii?Q?EQqw7dSAGV+1kYzITlKBNPrboW8nKV6+E2WfNfD7H3uVo/OM/Jt3spOoZUdv?=
 =?us-ascii?Q?ULIQOHN0gMfzwnJ/A2fnjLAzbtwQ4NMtob4Lt5DHn7BBSo7FgtUpwNcdkwy0?=
 =?us-ascii?Q?cxaK5d+t53FRS/Ux6uHXF6rzl2/R8L+Y0Ca77LgqOrGXG4B9MycJNuhsvAWZ?=
 =?us-ascii?Q?wUkYaEt1C12rV9sq8mqZDTp+YAZDg+NdhhrBOtUc2yDjppnoKeKUNFqwrumB?=
 =?us-ascii?Q?/S3gww801iC5vX4H5O39bzYWDR2X7OwTR1t9SOIDNm8zr+hQTKLY1lDrpThH?=
 =?us-ascii?Q?NHaMRjOQlcLgZ4QMulyfHxJudOMuieC76pyGsHYm3jIir5XlPBBl9taMjR97?=
 =?us-ascii?Q?XW7m5JZGYdTy46rpn6EqyhYAmOoi9RCW17wAB7CLu6mPvVt6dy0KGxq+nJWv?=
 =?us-ascii?Q?EJmIEG3X93WfWLodxQQ95dKfgZ+VNMVzHc8G/GhTBTFEX97KfcTlbNHsyvPa?=
 =?us-ascii?Q?R44CYBwBwCHkUOgeSiWNDdIZHziYOQ4eFclWb38M9zOQA5VgDFVD/z9v3pBX?=
 =?us-ascii?Q?TlYjnZelXpILIHttzgW958aYEKZ07z3Lhd8b1ZInokwp4aEjxMgxoQt869v+?=
 =?us-ascii?Q?PHPX1kOSfdjpSzeD60pm3Q4s+bMQ/Nykw4xhA9LopSxgUr7DQBMksRueMd/1?=
 =?us-ascii?Q?HZaywUlZsGiYFcmCUd9Te6SJfg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d273fd1c-d85b-4e34-c030-08d9bfb23c50
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 10:04:09.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 10:04:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159717

so one can get the layer name from a filepath

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oe/recipeutils.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a0c6974f04..a0e8840c8f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -21,7 +21,7 @@ import glob
 import bb.tinfoil
=20
 from collections import OrderedDict, defaultdict
-from bb.utils import vercmp_string
+from bb.utils import vercmp_string, get_collection_res
=20
 # Help us to find places to insert values
 recipe_progression =3D ['SUMMARY', 'DESCRIPTION', 'AUTHOR', 'HOMEPAGE', 'B=
UGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PRO=
VIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch=
()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_O=
ESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', =
'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', '=
FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', '=
RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_depl=
oy()', 'BBCLASSEXTEND']
@@ -928,6 +928,14 @@ def find_layerdir(fn):
             return None
     return layerdir
=20
+def get_layer_name(fn, d):
+    """ Get the layer name from a filename """
+    pth =3D os.path.abspath(fn)
+    collection =3D get_collection_res(d)
+    for k, v in dict(sorted(collection.items(), key=3Dlambda item: item[1]=
, reverse=3DTrue)).items():
+        if re.match(v, pth):
+            return k
+    return ""
=20
 def replace_dir_vars(path, d):
     """Replace common directory paths with appropriate variable references=
 (e.g. /etc becomes ${sysconfdir})"""
--=20
2.25.1


