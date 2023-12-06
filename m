Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB66C10DC1
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web10.42353.1701890559460755660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=JeDtYWRm;
 spf=pass (domain: axis.com, ip: 40.107.22.83, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRJOIofXMU/Zz20YPKYw7zCu6MUUTndw3h5GCpzyPh4gp3RuJlDLr1kuFfWtEwfPKrzlaPGv5f3V27yJuWWOQhq0TpNs3jxRVlbB/i5HdNIr4WjNMsuu4APVnM6009GvnowmK1kX8RL0ofah2E1uBDJkWS0p6EMd/8lwyC+R18YS2aNlTNMRls75UaSCmnFlP2WzofX4q3AQkCbO8gkePBeYiSUbOPKkSK4LjzjK/8M8YhjWgtzpGor6mJvlVpPHLbzQ0LAGb6E3AQj/aMgd1Y8TxT+7YoQDtvHApNdYq4OmcBT08ITpn5Oru0AJTqFH5pmXjkNmTE8T2bonc9I1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YM3IA+Zl5JdvaVprgEwXLBJQIbWQjCC9PIJMpuutdM=;
 b=fnhdt1kGxfV/TrO5jyRnYxxmYdFn6x87+JeT4sZ0W4QVOa0i2d6YIJBUyDKEznzoSvNYyXZGnqOyU/67uHrBjaKp4HsKsVSeDy88C2ewbFuTGNxW8CRMjW84qzc8Z0RguNmkOB/lkTnTFpWExCyt9TC0e4SjsrN3ciAZmFDwDrlukpytMw8/4ishO/ofgwqhHDWe1YVQQe4RB/CigZC0F0TY8NdwfPtENUdQIlRA2eBoJ80nJixXltUa0w/zMS6liNLRinDgcuHz5qVd65bYkVb49UEata4tHG3ahM3Gc38JqOkgx2jrQ0s8LHyq4nalJVCz8a7soT+GmLl7piSlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YM3IA+Zl5JdvaVprgEwXLBJQIbWQjCC9PIJMpuutdM=;
 b=JeDtYWRmGCpffHRAH5vai647qckwLWoyy8to3EFDMb/jvL9G9/w9DBX9tvcySQwzTztERqOUlWlmWSqO4csqMGudejeEvOJcamMJShzImQ/Og0B6KASEemtQHzXnuXJ2btsTGncDfYspFY2m4UtPJ5QWBWvHj2HTi5qyPk3eufY=
Received: from DB7PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:10:52::44)
 by DU0PR02MB8412.eurprd02.prod.outlook.com (2603:10a6:10:3b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 19:22:35 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::ef) by DB7PR02CA0031.outlook.office365.com
 (2603:10a6:10:52::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:35 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:33 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:33 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3C456F5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:33 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMXir2838197
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:33 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMXFl2838196
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:33 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 7/9] recipetool: create: Only include the expected SRC_URI checksums
Date: Wed, 6 Dec 2023 20:22:05 +0100
Message-ID: <20231206192207.2838077-8-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|DU0PR02MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 064c75af-e8f8-4157-3832-08dbf690b3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rStA3AMFO7k34iPehmHV8AzC1Z5tsOwZHdLExI6UHxkdM4WWrNqBhdsTOAsE0OhYKCkTpaoK6q83tLvRLp/hTioiutsvN4d11JZGXa7GnjbDVoUpc6C7/EmI9Wz6TR7PV5v9WjkFaYpf3w6Bj7he42dZmrSgdO4Hyyw+xI42QBLwbbQtVh3jrTylqitfHGPvCp9W7HI5Jc8jPrwe2P40fEq06SvqYW5CgBfLfPkJADR4VlZ00npahUqaEV14V8VlG0m4uantfcYspkPBIEKynfWCR4ujlAR0Y7Gt+6Zj9p/evwXZajjSsvCAw0olR8bmgb3krpEbfh1mOmxY2Xa9igFm8hHcIrGijn7zYktBE6BdeMULpOmQq52tD7wN5pF7WsANHpQzAMioQLTE2h7B8l8LolBJxfHko6J7jzf1CxQ+qRhCwUDPw7rYEGftoYQyiAq3s6xijQTNpO7HjgQMnGDUFfbLr9Ypwps4pKRAlZMt2h5B8NsFFTlfDRHeSbHe3CY6uwqP8yuHladxymdQqCfQXVoHhzU4hK2mOORjqtyUIfUdDHXb8Clb9jeP/2wdKrLcXHkLXfbfYUDmAl3fv//dSrqU2ITsKn6HQvPwhDVW1LjK4+vbh0OkgdJumfAxSCoz9B4SqYkRmtIY5grzqd0/+svXBwYgN0DP2I5i9TxC5c+cB4rWgwZ0hA/5bcTLS8sax5DyvreiMTmLKsSnRJE45EfE5vJ3IyhkG0oLEtPQ448xdphgnKGy3x8/7QhgqUKDdVrr93qwUP783A6VU+dTXIQLCiKcbjhPkg3ieYs=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230273577357003)(230922051799003)(230173577357003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(46966006)(40470700004)(36840700001)(6916009)(70586007)(70206006)(8936002)(42186006)(316002)(8676002)(478600001)(40460700003)(6666004)(5660300002)(36756003)(41300700001)(2906002)(426003)(356005)(40480700001)(83380400001)(81166007)(336012)(26005)(1076003)(2616005)(47076005)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:35.7191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 064c75af-e8f8-4157-3832-08dbf690b3f5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191916

Rather than including all SRC_URI checksums, include the ones that are
expected. These are the same as are output if no checksums are included
when building the recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 19 -------------------
 scripts/lib/recipetool/create.py           |  4 +++-
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 3a05343210..910bf0b4f6 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -349,7 +349,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263'
         checkvars['SRC_URI'] =3D 'https://github.com/logrotate/logrotate/r=
eleases/download/${PV}/logrotate-${PV}.tar.xz'
-        checkvars['SRC_URI[md5sum]'] =3D 'a560c57fac87c45b2fc17406cdf79288=
'
         checkvars['SRC_URI[sha256sum]'] =3D '2e6a401cac9024db2288297e3be1a=
8ab60e7401ba8e91225218aaf4a27e82a07'
         self._test_recipe_contents(recipefile, checkvars, [])
=20
@@ -407,7 +406,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars =3D {}
         checkvars['LICENSE'] =3D set(['LGPL-2.1-only', 'MPL-1.1-only'])
         checkvars['SRC_URI'] =3D 'http://taglib.github.io/releases/taglib-=
${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D 'cee7be0ccfc892fa433d6c837df9522a=
'
         checkvars['SRC_URI[sha256sum]'] =3D 'b6d1a5a610aae6ff39d93de5efd0f=
dc787aa9e9dc1e7026fa4c961b26563526b'
         checkvars['DEPENDS'] =3D set(['boost', 'zlib'])
         inherits =3D ['cmake']
@@ -470,7 +468,6 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3D16a934f165=
e8c3245f241e77d401bb88'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-m=
agic-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D 'e384c95a47218f66c6501cd6dd45ff59=
'
         checkvars['SRC_URI[sha256sum]'] =3D 'f3765c0f582d2dfc72c15f3b5a82a=
ecfae9498bd29ca840d72f37d7bd38bfcd5'
         inherits =3D ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -500,11 +497,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D set(['BSD-3-Clause'])
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3D702b1ef12c=
f66832a88f24c8f2ee9c19'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
a1/fb/f95560c6a5d4469d9c49e24cf1b5d4d21ffab5608251c6020a965fb7791c/webcolor=
s-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D 'c9be30c5b0cf1cad32e4cbacbb2229e9=
'
-        checkvars['SRC_URI[sha1sum]'] =3D 'c90b84fb65eed9b4c9dea7f08c657bf=
ac0e820a5'
         checkvars['SRC_URI[sha256sum]'] =3D 'c225b674c83fa923be93d235330ce=
0300373d02885cef23238813b0d5668304a'
-        checkvars['SRC_URI[sha384sum]'] =3D '45652af349660f19f68d01361dd5b=
da287789e5ea63608f52a8cea526ac04465614db2ea236103fb8456b1fcaea96ed7'
-        checkvars['SRC_URI[sha512sum]'] =3D '074aaf135ac6b0025b88b731d1d6d=
fa4c539b4fff7195658cc58a4326bb9f0449a231685d312b4a1ec48ca535a838bfa5c680787=
fe0e61473a2a092c448937d0'
         inherits =3D ['python_setuptools_build_meta']
=20
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -534,11 +527,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3Daab31f2ef7=
ba214a5a341eaa47a7f367'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15/iso8601-=
${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D '6e33910eba87066b3be7fcf3d59d16b5=
'
-        checkvars['SRC_URI[sha1sum]'] =3D 'efd225b2c9fa7d9e4a1ec6ad94f3295=
cee982e61'
         checkvars['SRC_URI[sha256sum]'] =3D '6b1d3829ee8921c4301998c909f78=
29fa9ed3cbdac0d3b16af2d743aed1ba8df'
-        checkvars['SRC_URI[sha384sum]'] =3D '255002433fe65c19adfd6b9149427=
1b613cb25ef6a35ac77436de1e03d60cc07bf89fd716451b917f1435e4384860ef6'
-        checkvars['SRC_URI[sha512sum]'] =3D 'db57ab2a25ef91e3bc479c8539d27=
e853cf1fbf60986820b8999ae15d7e566425a1e0cfba47d0f3b23aa703db0576db368e6c110=
ba2a2f46c9a34e8ee3611fb7'
         inherits =3D ['python_poetry_core']
=20
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -568,11 +557,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D set(['PSF-2.0'])
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://LICENSE;md5=3Dfcf6b249c2=
641540219a727f35d8d2c2'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
1f/7a/8b94bb016069caa12fc9f587b28080ac33b4fbb8ca369b98bc0a4828543e/typing_e=
xtensions-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D '74bafe841fbd1c27324afdeb099babdf=
'
-        checkvars['SRC_URI[sha1sum]'] =3D 'f8bed69cbad4a57a1a67bf8a31b62b6=
57b47f7a3'
         checkvars['SRC_URI[sha256sum]'] =3D 'df8e4339e9cb77357558cbdbceca3=
3c303714cf861d1eef15e1070055ae8b7ef'
-        checkvars['SRC_URI[sha384sum]'] =3D '0bd0112234134d965c6884f3c1f95=
d27b6ae49cfb08108101158e31dff33c2dce729331628b69818850f1acb68f6c8d0'
-        checkvars['SRC_URI[sha512sum]'] =3D '5fbff10e085fbf3ac2e35d08d9136=
08d8c8bca66903435ede91cdc7776d775689a53d64f5f0615fe687c6c228ac854c8651d99eb=
1cb96ec61c56b7ca01fdd440'
         inherits =3D ['python_flit_core']
=20
         self._test_recipe_contents(recipefile, checkvars, inherits)
@@ -603,11 +588,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         checkvars['LICENSE'] =3D set(['MIT'])
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING;md5=3D7a60a81c14=
6ec25599a3e1dabb8610a8 file://json/LICENSE;md5=3D9d4de43111d33570c8fe49b4cb=
0e01af'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/packages/=
e4/43/087b24516db11722c8687e0caf0f66c7785c0b1c51b0ab951dfde924e3f5/jsonsche=
ma-${PV}.tar.gz'
-        checkvars['SRC_URI[md5sum]'] =3D '4d6667ce76f820c35082c2d60a4896ab=
'
-        checkvars['SRC_URI[sha1sum]'] =3D '9173714cb88964d07f3a3f4fcaaef63=
8b8ceac0c'
         checkvars['SRC_URI[sha256sum]'] =3D 'ec84cc37cfa703ef7cd4928db24f9=
cb31428a5d0fa77747b8b51a847458e0bbf'
-        checkvars['SRC_URI[sha384sum]'] =3D '7a53181f0e679aa3dc3eb4d05a420=
877b7b9bff2d02e81f5c289a37ed1127d6c0cca1f5a5f9e4e166f089ab36bcc2be9'
-        checkvars['SRC_URI[sha512sum]'] =3D '60fa769faf6e3fc2c14eb9acd189c=
86e9d366b157230a5681d36552af0c159cb1ad33fd920668a36afdab98bc97253f91501704c=
5c07b5009fdaf9d29b52060d'
         inherits =3D ['python_hatchling']
=20
         self._test_recipe_contents(recipefile, checkvars, inherits)
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 66b985487a..84a092ddb3 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -677,8 +677,10 @@ def create_recipe(args):
     if not srcuri:
         lines_before.append('# No information for SRC_URI yet (only an ext=
ernal source tree was specified)')
     lines_before.append('SRC_URI =3D "%s"' % srcuri)
+    shown_checksums =3D ["%ssum" % s for s in bb.fetch2.SHOWN_CHECKSUM_LIS=
T]
     for key, value in sorted(checksums.items()):
-        lines_before.append('SRC_URI[%s] =3D "%s"' % (key, value))
+        if key in shown_checksums:
+            lines_before.append('SRC_URI[%s] =3D "%s"' % (key, value))
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')

