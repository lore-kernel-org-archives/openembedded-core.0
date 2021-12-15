Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04511C433F5
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 12:12:26 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.60])
 by mx.groups.io with SMTP id smtpd.web10.39464.1639570344553088285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 04:12:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=igiLeC2w;
 spf=pass (domain: outlook.com, ip: 40.92.74.60,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFmdkQJ1sptBXNiXOyfkvjE6UQuGvYmFAu661SlcyEopN23Stj0qcTntIAGiEcRvsCOyZLkDNB9MtCSEPLAIpfjcWDS2E42CCdz4dcCJI2dxcS2YCBzt6sk7gFUDQTirBJFHTJC9JLQhYNdCn2o9/hzfQe6C42Rj3rIE0u5c6/6ggJnUoN+KyrHLfhTkN0tC9tuQNp9lMHQ2w95zGdoJLZgSAF1ImBgr9WR/AlZba6qODC56T18DtJQM/5Mz+aZdljWKhBIolhhNPvQA9nTSvBcbXMP4fJWSowo2S8Nb3u8i62EHdKit3L/qQ7jry9S15ATaZlOKxpTO7zhpAoBINA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pt+iFyIPt30K9zJO9D2xtDeHCNCR6ty6REgVlGv+0iw=;
 b=YRZKDZWd88B6dvK8EU8+mkN1zBp0CJl8Q/Rs/yIdKvS4JTsYsy+brAQHg1al7YEIb6rJxs3kln+C13YYL4Ep64XSkfiHQl3HkoEFHeYRZoHFYJiIuXjV3DOVP1rggNCZdQd4uxMER5vUBKAdfXDUaG3gPcjsHnRN4C/ds0BJPC+/PnLk/CE9LzXdMoqWgo+TXpcKDZvg3wLaahXdGTUpQ/q2nIp0cdCavHZqcQFVDxDl7LmGBFpSchX7yDhxDEnuemdCcNTEG9v2qDpDPhzkxWs0q6rQIkRTCHx7tn6NBYrfTUUhlFC4pAAvxAhafS9D2YVkhLZvh2p7XNXXQ3HzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt+iFyIPt30K9zJO9D2xtDeHCNCR6ty6REgVlGv+0iw=;
 b=igiLeC2wSzF+Z01tUdhXSzP2ZazvN5eQZ92e70iqp6ChqGG7/VZplMP0ZrZKGKA4NNkgaI/E7MvhBa4YcdEiaDWDMyNnBOjz0l7WGV6eG7nboO2SWyIraczlKnxhyhx7v6M/iacXPaA2BSLvp8XFu/9efT9odY1hJiVWh3/3yNgpIRvYJoITzMVtJO4oetOpqkqVArutlryFMcJmg9jedj2gS7W7aRm70qf17DfhnTZTT0WWTkc+Jd/1tOrCMG8kq7EaqrFOFkEYhD1mM/svmPCObDNc53+XBetjVjG8S+mJg4xccuemkw/qWHA6E5V1P6DA8GdF3u8943vgU5xpuQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3281.eurprd09.prod.outlook.com (2603:10a6:208:173::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 12:12:22 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 12:12:22 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][RFC PATCH v2 1/2] oe.lib.recipeutils: add get_layer_name
 method
Date: Wed, 15 Dec 2021 13:12:05 +0100
Message-ID: 
 <AM9PR09MB4642AFAD1E3DA5F9022D3C1EA8769@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [tpeZ3S2d37WONDsdICg+M1BgwXlCKWoyd25QWs/UuG2tYX2pqrmujfOdqdcnEOaX]
X-ClientProxiedBy: PR3P189CA0080.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::25) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211215121205.3283672-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d4c04f-3932-4ec0-89c9-08d9bfc425f4
X-MS-Exchange-SLBlob-MailProps: 
	tBYDyRQCPclxISl++lM8ZOjhKIfmIxnlLTUHl4CtRo5EtV48gMXpXjMwbo7I1F+hQxzQjN8TXoIaTge8MR2PG5AaOofPvRZl2NrVYc3KiwkJflL8TJqyvOHuYGYd1KP+95DTO5ClWpTVVrjeb2QXINUQjXzWu+6sFyeEXkS90lNoViGsgC7TeVbBD7re9YX8EHlf5wNqWMqpmuk2wfYH2Hwi8kHS+axWrdf68CTifgn+VzKdvXxWe1C3hqlthCiK8xf1XplY8f5nrU2D8ZNtZ6wm96fPMv6CJcCzGAXKrhZ8XWF8JDu2mNJslDhTDn0JA6aYXH+c8AbwqXURHTUT+JSlxTHZoBGg/PUXzx9UsF4E5NPGDUWqnhcc36LMlwZ/35D5/PgutoRV562x+S7xmzoUtw0i0xpmH68BsGn52VsssTXKucy2GEQWjknOjuMSOzftVRpbTyAw5jAg3NBviX4eKL+fykmU6PaEt9ZGy/Ho7ytCCIQzJLy6RDUj5u6rgoZtiX7EJTxx0MGOBi2BLaoURVd7c9hRiB03K+Gxj2OTGylHcjl/mQ9Hff596F0yo3jG+WvRgJ+BH5DXJ2e73/13O9UnHv7ty4Ze5G48sM5p93848gmxXJReFvfktaQrEN7ph6+yiFVNXJq1bcPyURxBvVoWAY8c6vMnbvKxZ4LBqtiSIBkKf49csnzigSfM4D/qG3icFT7W92DgkJ1KAFHlV7Z9mfGGsrWOhJzqwNfIChjc22i6M1K45w+wueY/aicgoRwo2y0=
X-MS-TrafficTypeDiagnostic: AM0PR09MB3281:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AeD/ngzQ/mZfMQTtf2gWA6VJheED63G0IkmEvizB9BWdNGe6abSJG+mbwP1glZyetsM6xZKsGYE1iGSL+rxukVdhn7dO8+uSuHIxb2y48tUFXi+sRBHN4iSSMU8cW1xK72jSLq2aBQrKlFx/AT77hpnZ53WFEfk5RBOwuCNUs+X44GlT93MQsp7jzBrZMykM3jj4cuKy7Ud4ybEPfUIn7qdNhKqHP+l0Epo7mlg8nPsQa561ACbgzra2W1kZdc7uIrNMcO3v4rsDzTCueMkXe5KyW7QFG+elPzNgI9fhiXOw5fJ8VWFFjP1V3lv//NCv1wJg4y6gykxFR09crtJTxSy9Tr97x5HhRcqTvVBjXo4NfFKW+xQULhHjjlNUvp1+TLQLtlJNLXepgxiw02IUTBvgxbGieIo0rEMb6rMXZcXHtPuEtFnzQIbyeedjBZtcWwWtKKswmAogQhQ+btz5Kn0Avhm4N6oh/FbJFThEDrXXdpTQfRAkojifrThVeokEVYjwnfRsvZKgUiU99h82k6qGsuek1XfLaNsNtvL52zd6OZ61ANN+Vu5jUasRXUzmSgdvC1vaFroyWfixyVdRLw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?so4JUovwfhaboSbuf9pLh63L/qiRLnFMlab84yTD8rUnyDVVrOI7OVQ5t2Tk?=
 =?us-ascii?Q?5aCJR+Wda2BzekiPrGNjRE52UvDPrOeY3WZcZSXTFKmPIvNZjyZARMWiWLqT?=
 =?us-ascii?Q?n0pJCkZETlM5YhyU42rSUZ72/etpzQXkEgxPyrki+2ip7T5j2yrSuN02IcqH?=
 =?us-ascii?Q?KHNMlUrwlpgl9oD5D2XECX3F6lxD9vj+TvTSy7ws25/kfvjwdZRgnkLhHyJq?=
 =?us-ascii?Q?doGX7e/lAnMZlNDZGKiwoZcLt+1A5dniy2bL+IJxbE9NhcLrlQLwZZ1tVCyk?=
 =?us-ascii?Q?eboW3qqTinSg1gQ0AprhusNrZavFlyNFPLdkP4JdiuDh/hVuWznMLTI9hrwQ?=
 =?us-ascii?Q?ebK3k5sKaZjz6FAlqeelrzjHBt6GCUB0heX6/HIWcn0sQu8D1dA149E5rssL?=
 =?us-ascii?Q?3VUvgm9PTX4HCTO1rmMRwqRlS2GHO6aoNC18EKSP/3EXXUn6EgctaPqTkme3?=
 =?us-ascii?Q?Vvly9bsIXq8WuhunfocKzdUngjQQ4O8f1mDJrNXNSPCSenEmYzOhT6txgLL8?=
 =?us-ascii?Q?UaAi7anjxPn7imlRW6abtg51BDVmbw8dP5E9HK9aWzclabiIocqC2cV0WjkT?=
 =?us-ascii?Q?8FOjkVOdepf0SNd+UTjCs6tIfvFMcW+qp90DlTprqfmgTM5JUDdhwAeThE2C?=
 =?us-ascii?Q?InAsJVWeW6qeTZua1rjTL+jyoj8XIr6NMhmYF+0/cgtbIF1Oo9XWP2YwqDmQ?=
 =?us-ascii?Q?D0RGNmK9mI9GPwyvzImZ4OxuAoxpvWLYyIUOT2XGC9ozkbGygdjsCsljwfMC?=
 =?us-ascii?Q?qXVmhcpv2sclO+0ETlR2ednDQ+9o/5nl4UNcdutNeN8VLwjZOJi+ZpfjlHV5?=
 =?us-ascii?Q?VsvHN1P96PW3nXVFSANy0WuBvV8z4oWT5bRy5eIVKIQNzkJjnHOszixSnIkF?=
 =?us-ascii?Q?oaHmculFlb+S2MPgJXTzWOEHzZqoxbOY6Ue3Z2b5FRGxbSO97eGSr9XVHL3S?=
 =?us-ascii?Q?k7ml+ogp/X0qkAmbhfkJcK6VmAvWNiQQid+MAfEYlACChBLTGacCG/Z62V1d?=
 =?us-ascii?Q?FcWRERXR6QZSIaMuiY2BYGeUVA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04d4c04f-3932-4ec0-89c9-08d9bfc425f4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 12:12:22.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3281
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 12:12:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159723

so one can get the layer name from a filepath

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2: order by path length to correctly map nested layer

 meta/lib/oe/recipeutils.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a0c6974f04..557e0f9bd5 100644
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
@@ -928,6 +928,15 @@ def find_layerdir(fn):
             return None
     return layerdir
=20
+def get_layer_name(fn, d):
+    """ Get the layer name from a filename """
+    pth =3D os.path.abspath(fn)
+    collection =3D get_collection_res(d)
+    # reverse ordering by length to catch nested layers
+    for k, v in dict(sorted(collection.items(), key=3Dlambda item: len(ite=
m[1]), reverse=3DTrue)).items():
+        if re.match(v, pth):
+            return k
+    return ""
=20
 def replace_dir_vars(path, d):
     """Replace common directory paths with appropriate variable references=
 (e.g. /etc becomes ${sysconfdir})"""
--=20
2.25.1


