Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FBFC3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 01:27:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5461.1746667678203007758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 18:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7223724531=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481JvXU031976
	for <openembedded-core@lists.openembedded.org>; Wed, 7 May 2025 18:27:57 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46dee3d6gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 18:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miMzeCPFUvmGbP3SSuh+QurpwRZ2IXmocYt0LZ9RbmSnBzoIcPMsZnnwEhPr4f4kvDwaVpHcfkULrNI2Nj1gIoIquFLcutKng5/8T47xqrOvsElqxmOENNd9zxZZf6lkz4J+nmmftNHl/i+onTT2+XVfz9XL9k9OTBQ/ANYR1jDVVXbiQl8b7S26+K5U2HKWmoNkv7zyn4BeVdbI17FJArVO5teApZ/vmU1S9L8NTnwbXyK1sSeTzhF8Wtgtul6v2/jauqbBnzDsI03Vt7elt4hClTV28vYRSHWn/mY2uX/oAkzTtclgeXL350wPft4w0/vCTsg8Wbbdqjr72DSCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=852A7oI05eYdJMfdhq9iSIXqlwyWtcQNSbdmR+o1EkQ=;
 b=LTBfR9cBZaNOdk+pnKDRuuosQKlHaO4vg7AupcQykBu5/3Yw1fQUdW9SqPF6Z5/FU/rMXEooNKeCmdVv0KqZ2fBprmukLe1lKwP02p8iyV2J64K7rnp7k287zd3q3aJgsJildyR6uOXyF8YTlELkXL/VvP5QzwWYXOtC37vB8okfHKAcr7o8eYophmPT/OtAvT1L4x0BpDE6+3samwPDNOG2FO4x5PC77qTbfbDYIs4gBfET58lPKxLhg/1Vmd2OQSDq41AezzwPRnDxPGoop7wjSVyR80ZMU1i4H4zCTU+h9SmwQhoZBlvO9pEQA9NZRZvBtZwYfhW4m46Quf9Q6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Thu, 8 May 2025 01:27:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 01:27:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pygobject: RDEPENDS on gobject-introspection
Date: Thu,  8 May 2025 09:27:35 +0800
Message-ID: <20250508012735.3789965-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::26) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 325a9ded-cfd3-4ef4-d1ea-08dd8dcf8bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IVDH0Fbruv3yvj0mFHEoC3wqapjAXlm5TWt4t9pramW7l3ssUlTwegJhkHsv?=
 =?us-ascii?Q?canH76rvtl8VQ5c1533RrfP0o8r98kB0n29LGjn0ZwjrxCccbO34619b9Awg?=
 =?us-ascii?Q?zpLZFAGDBuz519tiS4HYJKpABOUqfMrjscQUwIrW5AaYuNqvghcqnRrct0fI?=
 =?us-ascii?Q?cN3j8pNdLatkYQIai3NAQBcpTQRlML5RMEKv4C0+Mh2EQA7WB5Q58jytKQ0a?=
 =?us-ascii?Q?qxcRMznaoSjaydQTPhr5UWftDqJZT5yJgDJ+yb9oPkZHB8jO71605581ZXO1?=
 =?us-ascii?Q?MZgxW+Mw7TlwaKkc5N2xA18/+0zamC6txQXfHMS5Ku6XT761FpJ3mpjz/IoQ?=
 =?us-ascii?Q?7PJCcHj5Ln19yQ741rxj7WnlLhhhfXA4eOCzDRjELi20/8N++8N05UpqgC2x?=
 =?us-ascii?Q?KphyyV/BJ3ucGYtt437QjaEclWJpkhzlafwS49Mm9KgA4ohdEjI9uE9zVUue?=
 =?us-ascii?Q?rUMxO+1rFJIS6JrIpqR+VBo226QrSUyNlR0Kiy5rtRfEgujygUmHP50DB33k?=
 =?us-ascii?Q?g18+VN6PZs3UB64x9dsVNW18eEAYJO/0I72h74uEnHNCb3s2YtIjl8zet8A7?=
 =?us-ascii?Q?Y0cCHAIFbwoPt+O6WiESSlOd5Z4lzpNGwKdMLChgi7eHRVuxi4sEkRsYbQYU?=
 =?us-ascii?Q?qWIGMfrL13Rk3MCkppRrBNsIP20YCCGfpu9VImEuifImi+16WWN1OisG4Weg?=
 =?us-ascii?Q?tj29SZGE1gxajqkamuMlsOqQyUN5vH+ntV7lPXsU79BStR4QG4MP4vXFriiW?=
 =?us-ascii?Q?eZ2fYCeIqMl2i8Cze2s81cILuS9WiTuPfofj23l6TuYZBo6eJ+gXd14v78wW?=
 =?us-ascii?Q?rt+GUDqFHXf+cMnxnDtBV/eFTf+fHgrcToM9jDPqLyBzRjt2XaGyD1U9TSi5?=
 =?us-ascii?Q?+0v636Cg3WpUkPOKmMuDE5tYQKfh6xaOLJOCHg1FJ+qMLB1EYlJ/IfsXXG2G?=
 =?us-ascii?Q?jYEX48CQ70mX+/UMWhhWatyGkiMTUn1eOVr/ePE6jzb+/CiYBBei95q1AFQy?=
 =?us-ascii?Q?U2hXI3mANEps7udtpvamop+oAoyA7fpYYBFqRYrokCKNEMSBhJ1CC7WOrSWf?=
 =?us-ascii?Q?voZB8isLImRTBfM8mBqxA2Rg9+gC60W3oaljG30Eqxr1q3Fxhy6BRs0C12Cx?=
 =?us-ascii?Q?f0SzH+q1rijIYAXFapw3pdFrwL0m81pftXhZRbLxzCu8ZJpDX5TkDYmE2j+b?=
 =?us-ascii?Q?ETQAVsLDtA7ZeGA3Z2QF/v+e4LEgQ+00oin3fxTII37qCyel6sYgDsgUar+o?=
 =?us-ascii?Q?7Vcv4Id/1e49/ZXC9J/lu+bz4PeVqd43QIha/ycsSwDxlieM77KqQsSuD4//?=
 =?us-ascii?Q?7ZJdPEiCrLvT1lQubY/E3fj26Nm3+GIG/B8I/S5Nx6gGX/cLzB27QeediODs?=
 =?us-ascii?Q?w678cahtCe/ujvyTqTpAehqoDII+ueLgZH6G5Kz5ZmQGem+TfAlch5hilE7W?=
 =?us-ascii?Q?D/rTCm7trHRFGHoQFph/arQgXS6APuypSfEwGDk3jpUFZ5d5iOOLOa8TvoEN?=
 =?us-ascii?Q?gW3npOiHtrD9trI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fPUJHWKxmO7gyt5MMBrkGaFSQbT0Hl946JmnZ+0zWJbqV/FC+fYHFDlLck/g?=
 =?us-ascii?Q?DI0sA1tFdwO0J7IFyXfBa4F0R9o1ZtHU9VVa7DSqEWQePVS8J8a+vy3m509H?=
 =?us-ascii?Q?GlaMpGRv9ObdXCNF/sIvpFpBoUWkvQcqzAnIMKXpkBKbdXgKaD3DeTHFuD6n?=
 =?us-ascii?Q?B/sehkcUnBjCZ8RXhVQ/dHY3GcnEWMZF36yR3TDu2iv2oXR+e9CbaJ+mA/c/?=
 =?us-ascii?Q?ZJt+LdJSp9G5A/m1f4q3iKEko1Du5M065U/57rW9VQDsQYqL/+7PVwbhk1O0?=
 =?us-ascii?Q?k6n9hYqmBB6yn4S0l6SfJJ+xMfFFGpiVr11CgAEiWVR/0xcNhjrwNHHJsCZv?=
 =?us-ascii?Q?Ux1u/51v36+cjhrlDFG+RbkOev+yPHew+0YZ89NZM0EfI81VrOn97cOuaqPH?=
 =?us-ascii?Q?qxkP2brSfRAqqNydHWfZ//raYPSN7o4OKwZXTXCxqzVKicetl2moj5TYiJeV?=
 =?us-ascii?Q?CgjXoH8R/kgw7NnwbaBjLh5Z0M697BHhfmVJeWMOWsDWdjVOpfKDAqzaAcmq?=
 =?us-ascii?Q?jH9RnjduyQMyQElfNjK8SOwGBTsvpWhGypKNbuzdHyM8gGpDAMKbSUrojKi+?=
 =?us-ascii?Q?uaDcrgFX6rNzuuFy8XWNmIUO+nPcPqoi9VuBfMTt2FDPfIrmZnknINYu4x1c?=
 =?us-ascii?Q?Nqr/ysamPAKD/gus/uDYvi1T2NebbUPmt7mvDAzlLd6lSC0U/aRmYjHkvMr2?=
 =?us-ascii?Q?N+HEjNxc4zuLnw36JB6CduqNn6W79Kvi0sD4b9rULUmmSbECYi1or0Arp7DD?=
 =?us-ascii?Q?Kl8R92x9dBOobFgxGJDOfkqr2XKkfHEPYZp0QqRUaoFe5N8G0TYcmZdgfBEM?=
 =?us-ascii?Q?wLAgNpNJaM/3hLVEc+SFmBDa05VIcXbd9Lv6QDng/r/lyyo7kYHjlrWr+j38?=
 =?us-ascii?Q?BTmcNPoJZ++rbFwcBUI0sBLPnL1fUbS+UzAsJgzLLvYipCL2mGd6pmad+NNF?=
 =?us-ascii?Q?oIf528/GRjOu8HuluSrDY/AkaBsf3aMIjkzQfl3qqirJ59G/BdJMOEaj/e43?=
 =?us-ascii?Q?ucnYh8nb1fNeqJWdIbRkSt3galmC04b744lRwMntYRJ+K6nx/XyfhS4UzA79?=
 =?us-ascii?Q?s9sh8SEaD26qfPt+wMRkgBaepALVp0F2ZhVwFYOyNJwasKOBj7lJJb707zDK?=
 =?us-ascii?Q?XRxcozQ2UEr0IKTseMk9260LCclidRn+0nrwSEB4f3mbgYLQkR1/bhdHEUim?=
 =?us-ascii?Q?keOpXzMqnaYZIXPSoI4/HVS4HisSbSqEY0sa192RbgttM9UFcUIE0MaK1xqC?=
 =?us-ascii?Q?FDCFAXrWFdnv33ecqrdsoEa8Rkf5RnmhIRapTdnZdSZ5K7GAw5hyWCkYhOFw?=
 =?us-ascii?Q?KYwfbYzjS/uOkDQY40Y1fCXyLItMSLbItgNCYRrgbwKOu5ikY1VjdF+3JJzJ?=
 =?us-ascii?Q?TILfheeh5xQrCm4iVP8EfjoUF86UqAQKModpJzyazjVp7SONciB1IGCv1skF?=
 =?us-ascii?Q?G1UveCHlZo287v6pDW95K4gg7KheUYNGq5wgJUN+KgGG6uWzSEbVSGgXlTim?=
 =?us-ascii?Q?PQ8P6JX3B/25t9M21PUKf9TSkc5cQUh3UBfJFX73gbty7eL0WfJCz/3jEe5o?=
 =?us-ascii?Q?eBxf9Y1qfqnHyvZDYpSCr4sqKZdQhSPPr3hG8JgB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325a9ded-cfd3-4ef4-d1ea-08dd8dcf8bf7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 01:27:50.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPx1p7sWjZzTdHsy7/Bn/1yKI+M5o1GwmR5rpml0m86V0+piPIYQrZc6Nev3BTwe4pByQIFkGP22P+3Xc0ayuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-Proofpoint-ORIG-GUID: 4vrCqgdJVzbfd97F_96HrYpMsiWLFhDY
X-Authority-Analysis: v=2.4 cv=Pd3/hjhd c=1 sm=1 tr=0 ts=681c089d cx=c_pps a=uuboLt+qr3MZZMeqEnD08g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=Soj_o3jokgfLLE3Yt4MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4vrCqgdJVzbfd97F_96HrYpMsiWLFhDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAxMSBTYWx0ZWRfXzggX6FYePvT2 j3q/tE5istHSo+C2/kLv7ggfgUh+K3/URs7h1g5YU4ZH8UyjqmJTxhpYu7Lg2GTgsvm+RjyVN7g 7u/7dV0pe/OKSgOAPeE/HF2GLO3UxXOBvJw8fNDKeosT3BH4Cr13SvupNSEimCe07vxK1pn52I4
 dKvjfyv+bLFqHHYie3j3ewrhXkQCBjzL17fy84qClf7nbh4HAqGvIqGRJAoXbj16vGbYuS/X6JL BWW9BQrjKSfrZPMFndFj1r2AcHTPLjQxYrHqTiiB3I/2hwpvOG2rOy9vAqqXBeDnJQD1MMEw01L mwTBABIaauG0iwqpk9s07H1k4O55+JegCG8AJ8gFZkx1kr4LguJD96ZkX2d5Zjdco6UETnSVyx+
 d/AS04KLW4rFhAlbvnfGdi5XExbr3LtvylxW1F4o14slTqGlqOqhFOLrUWdju/LMuFwWWgCz
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 mlxlogscore=795 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 01:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216138

Since 3.51.0, python3-pygobject depends on libgirepository 2.0 provided
by glib-2.0 instead of libgirepository 1.0 provided by
gobject-introspection[1]. It still needs the typelib files from
libgirepository-1.0 package. Add gobject-introspection as a runtime
dependency.

Fixes:
$ python3
Python 3.13.2 (main, Feb  4 2025, 14:51:09) [GCC 14.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gi
>>> from gi.repository import Gtk
Traceback (most recent call last):
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 139, in create_module
    introspection_module = get_introspection_module(namespace)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 243, in get_introspection_module
    module = IntrospectionModule(namespace, version)
  File "/usr/lib64/python3.13/site-packages/gi/module.py", line 111, in __init__
    repository.require(namespace, version)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
gi.RepositoryError: Typelib file for namespace 'xlib', version '2.0' not found

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<python-input-1>", line 1, in <module>
    from gi.repository import Gtk
  File "/usr/lib64/python3.13/site-packages/gi/importer.py", line 141, in create_module
    raise ImportError(e) from e
ImportError: Typelib file for namespace 'xlib', version '2.0' not found

[1] https://gitlab.gnome.org/GNOME/pygobject/-/merge_requests/320

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.52.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
index 221de7783d..d0384fcce1 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-io \
     python3-pkgutil \
+    gobject-introspection \
 "
 
 # python3-pycairo is checked on configuration -> DEPENDS
-- 
2.48.1


