Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5379BC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:42:43 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.88])
 by mx.groups.io with SMTP id smtpd.web09.6480.1646127761925726584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=ov18rAHp;
 spf=pass (domain: outlook.com, ip: 40.92.75.88,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnzC9ZGoSSo5EyqYXwblNI1J/mDxctUMv7XLQ69CjTpnGWa+jfCYxGrw+aydNkTaB3VQvn0tUjiC6dD5/uVcCTeiSZ/2EJY9W9rkY5+a8tGpFvNNCqtYzqiOS9kiPeq6d0ODG+3Ag9yfzqgzSOZpVy63I1dynHnrSyFa5oflkFoxUD8hexNkHL6JsIyc3YQqHTwJKXhOdyYbG0LrQTTyRgBxQMA02rpq6/Kjz8+eeYdqJE/yJ0l4kU9okHUfpd/ealO0mjt2+7RrlFZI/vfbDsisPvTKKzr1L2efMEerWNSduWKnl3cu6PxOXnONRGSN2epl35xVpdLhUM30mgq4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoB27XyFsF/lokB1VfmzDzKE95ydZANj7S1Bj/IfUjc=;
 b=ORV3MD/AOJRvQVTdA+OEIZDbnthBLs/lOrZkF5KqtbHoRB3DvzAPCwpFvbA0hmgUKPZ+Gz/FblazGMw41PSyXNP7rrBIcf6se1h8qTLa7oCy6hH+4b8U79FjghQmihLPldcqFtcqNDp+7OOsXeuTFeK8MIxGvVW+vB6E+80s6x9t1ZYKyg2SpFI+Brnn7T6ZXdLx83hzKHY8avWd2m/krniucrWOErw6G3cOJr1OQx9BipUcvXpKe71PwWSZg3SvwqdrymjNMxHOk9Pd5stIzAGThUux3GtTdIOr5kKytsT24a/zjiHeBCNS5DjheYEvUoPhp9bc0gdujxGyaBh2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoB27XyFsF/lokB1VfmzDzKE95ydZANj7S1Bj/IfUjc=;
 b=ov18rAHpKFolw/B4+OiubJzlJ5fGN/9GXVNSr1rT4GaRTd/ykPkeso4lrSinwyWfRUrFn1SsWtqEIgRKwdGtlvXAUas7Qmm1IjwRP3mQ1o1gyU4Z7gSHgQCFL8baPP8GdtxqTHtzSONM7vxeNQbepyiqTudU39kPte2OurbD8w8EFLrEmN0bVIqpopXV4Pw6xtUPnz40DqPjT3KlN2/Wc/lTPH5fUGNI/iECT4pbvcTFrwGlKJgGR0VCpEx/SyWWKfy7Bteb57urkRBp/Eu3M1FFxptbeoPQR0588+Qe5u/hf8APiUr/+ZwrgxIfH2jkLtiuMIw1B6O/l2MAbM3Aaw==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM6PR09MB3153.eurprd09.prod.outlook.com (2603:10a6:20b:c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 09:42:39 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 09:42:39 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v3] pip_install_wheel: improve wheel handling
Date: Tue,  1 Mar 2022 10:42:06 +0100
Message-ID: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [BiHhIGql0S9GEJRRRfCAT1WunyJGU5TnCUp8F2inhrv/EJ6a1oF58rDyBd924Wis]
X-ClientProxiedBy: AS9P194CA0020.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::20) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <20220301094206.48694-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 487fc21b-2e3f-4cf0-5f81-08d9fb67d2b1
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJNB+3Ye+fA/9bhtlfVachynRlPi7ZpYi4807VKfzi1KMT5C7QIqOBp9d1pqabO4hAIuMkl+YJO2fC5mYaXoNOBkrhITGUYpwbgD8NUr87B2hpLm/vDJZHzli3Tlhr/5URF3eKGg9RBk2uQuutNyjb/imDJRnBbNLN6iwBL9hP9yQ8AZ7y78qwJHNGCFyyOrBq3REXgR7yRpfM+P/HVCyNM9GNrOpYgPUF/fpGtKiwXYWMNMG37Bw2Mz1aSB/q7J2xqSIpoAexivuzkvHsXkTNSU0U7AOfLHK/thySKadvFZq+QVHO3LI8urEMIb7Iu3GYrFfMp0b8L/vgw/AspGXxIv3kBbwa9pwcWQ69xlVSYLBGRhl/Ngjn3EU7JrbSUfxLeS9uuzyeLpdl3981pbrOY0Juz75ipDV7hWxQCsTI+6EDKNiaJQBrN67vNQEIMq388NPZz+GalM3X8ynvC6yQf4NCbdhlCG78ps1yBSNJ+GptnxDY73gzRwmOLiBzrVkPg7UN0RDRDtgyokOR95VphelV2vRzMc5+FOd9yHpT4Gnsj62PluGwQxAbmU18Mg23zpoiTPL2Erp1BTmkUDoTs+zYcdjiJOnrtjfoiGM1A0ZtLD8KfMQxhPutDM9JVXj8ZuG0nf3AaLYGh6mUpr8afMpqUnDklhtLuzKAjmFbyGgSbWWpJ/JX/DKDOjpHBmfCZOGtPHVBkNy0nhBRQQkpQTXD5NFmJJvyQarpwITCSeoQ==
X-MS-TrafficTypeDiagnostic: AM6PR09MB3153:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	64WUW7xRfKYf6RDtrQJE66JqfBrq5DFLoeActccbYkM+ItJTJ0dpn9XPOaA9qN5jmf76QyG/UuXe4A2069ADHQfr4rXjRJ8o1OohrKvIKYEvn8RdvBr7GAHo3FqhSXwBHeKZMe7WJPR56urrikHPo5l/i4rCpV36D37VphI1ZQirO/5sGKwpRjLN12I5nr6q3gPFXS1RN8LejPMhDGRgIHg3S+vfJyURXNDZL+U0/xxN2X5PDkJjg2ENR1o6/Dsyq2tQe951h2LFWnn45SGRa1ENaE+R2/Ec6AP8gTjvgoBLstmIDmXUhwZjni9PAurhX1gFS+0LyzpNlNIJmQS66Mlu7ixmmBBT2eJ0BwRMBJHEqXUMt+qAMr+oAUqTdNYaRPnaatf5kVxzL3m8GA8JE733yGOSBsvIPjz3lNusFgFj0ol/oFIYbUqmJhvLBz/89ElpVq+jFlEzxDI7tRXbjNV5ZmA7SctC5As2gKCMhntqMU3ibqj3jkV3z3IiIHNPQsiHoqh5YCEgWQXhWegoPmbV8hzj4Nko7U0jwP+SDpIk/ORiW0aXMGwzYbaxCRAsWKEcOi99fSKDNMPqLv+g79J86vNMc5gJoHFaCIv4z403cvwuQ90pkWTJ7N7TlejE
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZMHfJ56k01NZzNKG1aalOoEH0vCpFbvD3RodokAoQjjhZkwTCK2+meGlm6fx?=
 =?us-ascii?Q?PcP6hhUQZSHm0Vn6x/NSNVyxZMHaF5WPSX8p5MJeh05gK0KkfQ/E7zPBNX08?=
 =?us-ascii?Q?katfJmBTeUs5XJfeMkf24TM6OsbHikSMo9N5dFFglkMn4mMsiZQ8Zl4y6PQq?=
 =?us-ascii?Q?VvVVMIZOTaOgdrK0D5LbRgWSIslm6tduWkHUECu1EAe5nZhGyr4WD9tMvrk2?=
 =?us-ascii?Q?Z99oAuqZAefg9EGvtVsmb90C2BpQf0fIm1Nf/cST6Ub60SAvDWKL4/SxIbF7?=
 =?us-ascii?Q?ytCQpYZ6u9yJuO2EPJYyVUqEch0N2yks7yg+vTB8zTvDzgkm1a6Jge5m4Znj?=
 =?us-ascii?Q?h3HlBUDSFfFtG47SsoxjxCvEhs0UOkqJH6BbcSaMykv3xWBcEvGV2Ki9QF1i?=
 =?us-ascii?Q?REjVeAtV+WgaO0ODkzgTk7ZR+f9Uzltc3pIlbuktf0zvOkAExhDDTnjMeMAw?=
 =?us-ascii?Q?BH5Zqk1+djYyUPFcSP9nJVXTmpN+WDyPYkcZKg4bArnckmCw5twfHW1uhKmy?=
 =?us-ascii?Q?vpCIdKkbjnKgj560QKZft7QxHiun9ysYKRQzDaf5J1DBShf+1AOxsjor+GhO?=
 =?us-ascii?Q?EDQyQHRC1ffwwB6vPSG2juM0DKf6pW3Bs+yNqoy5Qu41YEKn0+goCJareBpq?=
 =?us-ascii?Q?9OoL8qzZRqLDvynk6b0ZDwFVI3FqVxquYfHdg6F7gj8p+LNqlb2xkLG8z8aw?=
 =?us-ascii?Q?zbR0Uz98cA3rQNM040Ybs2DFKxxu5K29FLliYe+Bw74eO+FlJQzofa61DS8g?=
 =?us-ascii?Q?HADA7BVDwWRUR59AGwKN4cCMWiNTnYTiJ/KRCxO/NFtJhob1jEs7DEaLRqdE?=
 =?us-ascii?Q?FOzMcAgBLldO8VTd61r5j8FhWWSceLVDdhi28bvpHaFuilWlkxTJ7iJgrWfH?=
 =?us-ascii?Q?TG1JUIJAVFZMTZn06OIMYq/xJgigIjQ1YSwaiLvSWOQe2JeGezgEeFb9ABcO?=
 =?us-ascii?Q?TPq+KHCwJY0j6YeTzoVRkO8EC7L7dsuW3nc1leS+xUaOWYJqsAGPY45f2c+e?=
 =?us-ascii?Q?/4UloqpAl8aEjOuOKVSB8oamGA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 487fc21b-2e3f-4cf0-5f81-08d9fb67d2b1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 09:42:38.9817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB3153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 09:42:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162541

- replace python3 prefix when guessing the wheel name
  as there are still plenty of recipes out there that do use
  python3 prefixes
- remove all previously generated wheels matching the glob
  to avoid installing any outdated blob
- don't use PV in glob, as PV doesn't necessarily align with the
  version used inside of the setuptools configuration.
  this will avoid having the user set PYPA_WHEEL in a lot
  of recipes
- respect SETUPTOOLS_SETUP_PATH in PIP_INSTALL_DIST_PATH
  and use B as a fallback only (in case this class is inherited
  without setuptools3 class being there as well).
  recipes like python3-smbus run in a subfolder of the
  workspace and were failing in before this adjustment

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v3: remove in prepend to compile, not in install for obvious reasons
v2: fix python3 prefix string

 meta/classes/pip_install_wheel.bbclass | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass
index 5b7e5cd706..789c25b68c 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,12 +1,13 @@
 DEPENDS:append =3D " python3-pip-native"
=20
 def guess_pip_install_package_name(d):
+    import re
     '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
+    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar(=
'BPN')).replace('-', '_'))
=20
 PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_name(d)}"
-PIP_INSTALL_DIST_PATH ?=3D "${B}/dist"
-PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.=
whl"
+PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SETUP_PATH') or d.getV=
ar('B')}/dist"
+PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
=20
 PIP_INSTALL_ARGS ?=3D "\
     -vvvv \
@@ -45,4 +46,9 @@ pip_install_wheel_do_install () {
     done
 }
=20
+do_compile:prepend() {
+    # cleanup previously generated files
+    rm -f ${PYPA_WHEEL}
+}
+
 EXPORT_FUNCTIONS do_install
--=20
2.25.1


