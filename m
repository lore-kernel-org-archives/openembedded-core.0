Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B1DC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:18:54 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.56])
 by mx.groups.io with SMTP id smtpd.web11.5449.1646212732544520007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=o7NUereJ;
 spf=pass (domain: outlook.com, ip: 40.92.90.56,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6kk750pTvKNDvYx8YWL/AfWi/EFQCr8B9lXAcFKzX6OgICyoDCu5hi0lMkQfLCCPgQWnGUlNoMblWVwKIRqVYc0uQaDboPErHGbfSxUyKj5PoKsm7/TDQK5paBHiHgoXOQuegIF/LmWnNnjAfLkUYF1iqB0zvsBSF3A1UYsJvAeJJ1aWp4ISmX5EH4GmTwpCMAPrCu7cYOwLN5ito2uQJdnLElLQtRv8zCuvMSn+5o7sOmbxVDT38yTK2n3wgQ2MJg7QG6GoJm378FR2Vt3X0ACLB3B89kQIincGML27la7DvjbnTObNVDkUuoeNfex4NRc8fJJ/6Sq2k97fPGPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH5VQhSuqA8Rsv4cxWoJeuPzYefJd/ZX5XveT5qOEeM=;
 b=bear9Rmwm2U9xMpr4uFbDkCNa37G+stLN1/NejdJ8hQ2t5IxmPp3IQyI4qHtya6DQpNz8SIkmjmv54OIrcG1dhThAZf4fzu64y8ke6cStLAGUwt+BcdTMCFlURFlNFVLFW5NmMnkyud0KMTKz5so0Q/G/D1a+HdDf7JK+6MJKISC6opXh4jLXVYyguB76AentTogp2nUWkX8t1Wf90CqO5iB4fG+mtlR3E3UJGKT/JOKr1PnZuSUC1NrAvlraoISePqrkP6Lu4zpnUUuxvu16pTRvO9oxB/I39CKLitLylOdVUWDFdGYSIfEROWzeTLnKyoMHNAxVaodOiDATeMVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH5VQhSuqA8Rsv4cxWoJeuPzYefJd/ZX5XveT5qOEeM=;
 b=o7NUereJm9VAGW/92arhq/6EbXDVChMC8Y0jRGt8+rgpayzmDtsNjD/ueHRuZxoFDez+EiEH6o0X7OLd0ZiQ0NG3VOL2I+IrPDMDGEdJP2vyjsszcWbkYKF0QT9p2Spd5nJLx+QNLmMs39WdCPvuhJymDF9GKTyv8i4FsbM+gz/GgYUxLHLJAEyuIUeBwsbIgVF5EFSOaR6MhB8chYeDcoWRMuIVJo/RnCCosy9HbuMr5wu/agOdh7SBHLc3eK+f2JC+hjEZLVYMoGgvIeSA/blphRJuIqN+oYJ9G89I6H2paI7y6ZUGjutFJmYegGfEuL4NIKb+IxNEO4aqwKp+gw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR0901MB1535.eurprd09.prod.outlook.com (2603:10a6:800:8b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 09:18:49 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 09:18:49 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v4] pip_install_wheel: improve wheel handling
Date: Wed,  2 Mar 2022 10:18:22 +0100
Message-ID: 
 <AM9PR09MB46429F487F1E17CE861F8F98A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [D3blWgJiXu/qUBp8mPKGWTsnEAjSyj+EL7S7c5jpMG5GRE1v86MXfqGCSnE7htAK]
X-ClientProxiedBy: AS9PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::30) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220302091822.144730-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fd16c9f-03bc-490b-d107-08d9fc2da888
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJOFqyZmdVbRX930AFGZ/bCl4YPHauwVfzjH2qbQFiPZqkb/H002VnXQjmTUM9YImd0aNP2r78wq+co6uHNchdTNoyHOoYK7uvkZPsr805dQowbn33MlhrFSSqS/d+t7XsdC+5z+4/bgkdn65gfGdJo3HK/eYF/+P71KCH5xPxNiokFF4IsedROP/TZe34y6jd8mGyqKELA5eznJc2E9zWI5e7fw/RnOluGzqJLpOtDoaZL8LuWwiUyPdzY+m6qYdnGA9ZVN7SyxxsXIdmX16W1DnwQ9MlYGWvlPBi1Hv19Ellk/R6/RWCQZx2VGunSIpzCS1SdQtIFE5kHL0k8S0pA5Z2Gzq9a22SCnsQC69YB9lLzIGz7QJnyFmTtETA5UC6ebvDT+W87Qmh6BtRlQsRiSGwlfHTKf3Qz9BnybOSObUpR3BJI0kJ2Af7r3vsnI7sK+1CTEMhSNptb6+uy2kFhHV0jQOpE80dH/ewD3j+WV7n3TDOHNnEAjppdA30H4Q9EXMDoh3H4F5R5JWKz0lmFZCqjw2kCoWXHuoTAd4ExwYY37sEv32qCNuB2zz8K1BSUAO1AFXDrJxKSA34NrtF7m+/SsLt6Fh2C2LgZhIW80adZkQBuLZlCiNEnpgDNYt/TV0224PbGY2nuBpnyDr+BUU+h708RuDmCpntYpZUFu2r9/QbJ9AIJ4n4s2b3AbXprMAOTI/Fjhvv7hbGEapHoJ0MAX+hv+ef8K/7lFf3WPKA==
X-MS-TrafficTypeDiagnostic: VI1PR0901MB1535:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9pZ0MG9m6WBXOUA5cPD+l77Iv9ojnUrx5Mxg5gqWhRY6IXh8TGSnVIBBUsTiEep2sVJSviHk2WYLz8hPdH3uQQWZhyhY2Nfeq0fcxyLKLq6KhkWmKWjypJoahXNVcSiKlqIXo773jRbKOOdROA3482MXbaeCWiM4kMYdx8ouDd0nI2suyhAJVOUcBqYol6AD3FfeixiJGaQZiBHdTfmia+M3a86qvi4aW6SpuVabDiEvlGbYflQLualNfESwwAcomFmmz93o4uVoEjeAcSY5uU6DKRffLEZw4pb8KLs9+0vjlSPHLi6VLSm9t/QQojSbyd/UX5+DUa5FtTJP8LINmPIlKnc0B3zgDysO12mWwstbDEWaWm2/+oaam5nQWrUKf8nRBGxlizIwSUzkSCcOsu9ahDx7bV41ZOKfFmhEHeCHIuJtRFOwpq+BfmKp6tDk3joA92KUmkKnkKI8FE3EN2X3UpqpEErVKt7SA1ZHHtvNdBSmlTTPx77FsJjm0+AcyG+8ALCWTFLsbJy6nX9punew/Tpt5+FPF5l5ftx6rZtw54OCjOjUVP5XCnWM6yChnSrK7sGyythilqojKfKwkmlQ5TnofcZpxTFTtzi+UFr3kK+AQ+wx18J3gVZIsVMI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LrO558/LeppqL0ISpgBQcq8QDAl9WRALvJUPGeU90bnzyDq/ncZ7ZnHtWqmh?=
 =?us-ascii?Q?e19MAgxejzrz4aFvD2VrmlTuToRGOKLSQXvHklqLkGGTvbvWw8Zlt/F5SsOc?=
 =?us-ascii?Q?rtel4b8ZRZy3bD3MiX9aenO0AE3xy9ceaiLBqKNzGwdtYbDbDPtRlfxhdAPx?=
 =?us-ascii?Q?IWcb3mPlxidCfXeVGt3yZdc5674HP79ETLdjQMY5gfDuLvJB3oZUa+DxqOvV?=
 =?us-ascii?Q?c2XPlPJ4P2JZZDuAslZ5LFDHcTui6vaBVF9BDrPWUh77lC6WoxZ3mhoZps1P?=
 =?us-ascii?Q?evhoY1jSRr4+eNAVd2LF+8Z5LayxwJICOXGKtef7cv5RdAL5TB3NXMir4qRB?=
 =?us-ascii?Q?1/vJCwof71mrOlPVAKDTf7LEIQPFdR+pMS+cJmid1kKpqkP2uqo0iDRDzRt1?=
 =?us-ascii?Q?VrdgFESPcH0X2ZYL3SyygBxKHp4+qYVWLB7dQrKAerdu139yCG9NonRXGyhD?=
 =?us-ascii?Q?fe61W9HWzBn2KivlAb8bFOCJ6YaPfWOdDrwam+QxKSxHZQFnebF6XbE2l51I?=
 =?us-ascii?Q?zle5so6G1a9UstLmg3BKaeAdmsJy3PrndLM57iGGt7dKVT3KIiBnIiUCmKvp?=
 =?us-ascii?Q?7AdhkC8hH72YY9uPHnk/eevP+OndQV9TivLqOYVpyJdGZnhMEuA+qAByjA4P?=
 =?us-ascii?Q?KcMCMyF8u8KIiAVd4mbVa7eq3vatqVI40ymoqCK99O5ov3FeOlBawOTzcV7/?=
 =?us-ascii?Q?p9sfyPR82axjDHxzM14KFPpuMLgIv8/MQwx+/zUWk3kpPCZ+kJd0P/Pml1Pt?=
 =?us-ascii?Q?v11yiwVqbLrtWFvcyLlWWYYLvFaxL4yo9LWcW8Vm+9tF281asAuzVmCnxkR/?=
 =?us-ascii?Q?lgjTwvji2YqRHxq9g52m8yHKvSINFjmpY1zr8VfDr3UTVyle2acs8XQjJFu/?=
 =?us-ascii?Q?b44oQrcLRq7SLaEGEd/s9NHIUX3ArSNyZxhb9vLrS5DNS/FfuSTQGaN1Z0Pt?=
 =?us-ascii?Q?QqYYcTRD9fQOPAwsmnbq5/x/We9oS199RfBo4KZsBRoXzKqudJj+LP+C5s4+?=
 =?us-ascii?Q?fU5qKEksXn0WLWjPsDBVVq7uKQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3fd16c9f-03bc-490b-d107-08d9fc2da888
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 09:18:49.2463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0901MB1535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 09:18:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162600

- replace python3 prefix when guessing the wheel name
  as there are still plenty of recipes out there that do use
  python3 prefixes
- remove all previously generated wheels matching the glob
  to avoid installing any outdated blob via cleandirs
  in setuptools3 class.
  Unfortunetaly proposed dist-dir or bdist-dir are not
  respected by setuptools, likely due because they
  are overridable by the setup script
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
v4: restructure name guessing to make wrongly placed brackets
    being spottable more easily.
    fix wrongly placed bracket to make name guessing work again
    with pypi_package settings.
    remove compile:prepend and use setuptools:do_compile cleandirs
    option (see commit message for further explanation)
v3: remove in prepend to compile, not in install for obvious reasons
v2: fix python3 prefix string

 meta/classes/pip_install_wheel.bbclass | 8 +++++---
 meta/classes/setuptools3.bbclass       | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass
index 5b7e5cd706..3beff685bb 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,12 +1,14 @@
 DEPENDS:append =3D " python3-pip-native"
=20
 def guess_pip_install_package_name(d):
+    import re
     '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
+    name =3D d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getVar=
('BPN'))
+    return name.replace('-', '_')
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
diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bb=
class
index 12561340b0..564996c556 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -28,6 +28,7 @@ setuptools3_do_compile() {
         bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUILD=
_ARGS}' execution failed."
 }
 setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
+do_compile[cleandirs] +=3D "${SETUPTOOLS_SETUP_PATH}/dist"
=20
 setuptools3_do_install() {
         cd ${SETUPTOOLS_SETUP_PATH}
--=20
2.25.1


