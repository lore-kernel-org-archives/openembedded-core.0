Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5DFC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:54:04 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.54])
 by mx.groups.io with SMTP id smtpd.web11.5875.1646121242688743708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=lrkSqWv1;
 spf=pass (domain: outlook.com, ip: 40.92.64.54,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAWS+U/qcwlanIVvte1GPcVAsqkd0+QSMyvklMYbFpOSOx6LizsdA8wrK1OgePH4s8IIHTofISDT//JOxsC8OSml2G3ruNFhtlULNeK2OgE8wtnzJ0uBcqUbQclwCBUrnCD2tuuJwY/sjF8wxfZe9xM/zPZAza2deNLSGirH2zOooXb+UtPrz2ELDZ8rKjTZUJCbso0FxJ8TxBrRY4nNDXkYR1j2MdQ8MxekLBtuqkFAqrrUBZvf+YiWcgJE/pSKBsGwcW7tQHm3xBo4NFuvXfOmNYZp+ja+bnLj+81dqzDwUCCmrXxUioRSqjVlyBIKFC8DRmaMMYpAKhEvLQg8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v98o/gFnyyB0nNSvmYSjelnjChPJa5qFGDC2W1qNEYU=;
 b=EXXDioijfbC1kJa5EDLN42kCGXvwLo402CJCNqoXPdRs7fYPz1YSti1FnHPCTwaXS3X959jJCQsEfvoelC9k3gZx1fdwWN0cmypIEU1zuF97A8UsqmkwYId+48tHWmJu4y/hK/P0wIej64FClUzTLHA0bHVMOL5QGWpIiVLlUjTI1uN3gH+34WBk6eqkg8D/eixN2r1OB6ZsMj5/Bv+IoxPz/dC8VPblrC7skpKtVnbo4eXiS2zcKBl1D4AV35IebFfR52mJivTTec7nINJMZo6VEWEBMRmnMM5t8Od4teyD6uqfsC7t2p3FN7sWR5ppNJM0HK9RQKqmSDt3etfsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v98o/gFnyyB0nNSvmYSjelnjChPJa5qFGDC2W1qNEYU=;
 b=lrkSqWv1MI5TCznHQEDSO68T3YFWdwtbw7RjvR7cxw5E4UHrX0h87gXEls96UrrOP9xm7U8Di9bl+nrmCmjNkEV2JtQp+fi7N5i6wwoA2gnU7ECWv/CbtUpK+LyHQtC7jG5ohhC5d2r1ZYeIOdpz/6Q2WsF3zuX7XKtY2bVtviQT3Mi8IgQjM1tTOG+cJQJxQ+SXaXeW6kF15UB1SQAoGVim3WCjHSwjUyRBgqifyF7+7uozrj7K40FNAmI/w//AXH9VxIBcHM4Nq8m0feJQ9ftTHbvrUeQQKsfhaDBqvJgE2O3JIVjOu9+N1TbrTOrLBMKjzNxhgHZTnU79pLxwbQ==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM0PR09MB4435.eurprd09.prod.outlook.com (2603:10a6:20b:168::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 07:54:00 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:54:00 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] pip_install_wheel: improve wheel handling
Date: Tue,  1 Mar 2022 08:53:38 +0100
Message-ID: 
 <AS8PR09MB4645B9D742E68820D384DA6DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [IMea2ykx2ZN621HsdNh1aWKtC8TrYoav30kR9uokPrEjJrM561byRjeBmHKnENhi]
X-ClientProxiedBy: AS9PR06CA0326.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::34) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <20220301075338.18163-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db17785a-3aea-4477-3947-08d9fb58a573
X-MS-Exchange-SLBlob-MailProps: 
	3UeWkQkuiJNB+3Ye+fA/9bhtlfVachyn+2xhRfb2Pa6YfXm/kkzkeRqFJgYCIZrtBU0xXUPckL6zo2ab7ucGTh6mQ1kidOxVhzFCE+33+BQKzM5EFbMxW8kyEft5kN3bKH98j7QYU1mhKG6pZKqiVh60ePX73kBVcwJ7Ja6G56D/oG5TATrNnw4z1DgLM0+5vqewFzFOs5Vma15+cvV+W9zu0ZDMsCltEpiOUm8S+iqRoHaDN8R3NLQm8XqVWjegmu84hraysCbOe/R35qOwcit2QyIsZ50H5RBQp6xvWu33tTdiMzm3p4JGOfgzs5pbMyymNYF0TUAXA1p52WDxOxr50qUC0W1pWpHtZ9Q3Dm6SrpWm1QRl9G2aWjArWiuRTSefyxCNyY6mOJJVQOd2eUJKobz4lYZil11CnmdqmM0zr+OW83fQvRIfhoXukUlkC1Ko/TqISF0Mtqf81S97U5Xpzr/OYQeGMc9e171MoSucZSjTTkQ+TKsS5qaRtARFf9Z7KXLjqx29zpvFIz9psj8yyJUwouHttNsF1E46mhgSvP0NHEStYRk5ftVXL1BUqAgNGKa5zoGZYFxJVL+gnizJ7WUUW/4j6jszPPP6Ke1BkA1vIYbYcEYZMYkuz1zS2vEFLNJ7864Ppc/K0F3YIPL6II2iIoRs3B2uHYqSm9iy9K2ese2q/nXvbxM9mqmmd52nIBhMwAs0HkZqZ5B6i6ib75iTWCTdA4i2DvGUXpiuQD384rrxjg==
X-MS-TrafficTypeDiagnostic: AM0PR09MB4435:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oCVpZa+Gi2cpKCsLyOUMjZY+BPU1kWf1lFDMCj4NnYLaIt8vJ/AD7abixWA0S+d5b2ZrzXQqpUGHI90FT8rc1KconNI/8zaSgoYhZrtUbAfuUt6IQZz7rCfHk8al3Lx0jx/Ndt/r45c9QfhKM5Y1iqG+1uvGs/Ftw1QxPxcaTyLbrDN6DQ3iQ0xi9lo2lJzotlZ+9Hq+gTKiQCoYYQ2l2s+JMBsmNJSMv1iYxWdZpwYwTYdU78ZEVcj6pO1twTp+KpKKAtnK8xi9ECxbXYnM8Pihw1BC2xJiShVxbEizXPl0eD5bGl5kbS8FPQDVgZ530LuGsJdOwe5Hn5O1IDdNimWv2seFNwditeFZG3Ny7S5QFcE5ue+RWKYf4BFD2G0IORXuR9DXXpinw2FDv+5ZRAwlJ5JFht5N/z5aS2C101SiZbXYqyiJEkQWHnN9tOG70abfMy2neSKSZVzquaAab8Y8rBdlnmDjH1khA2j2ofCIyVxz1OvUgEpXYn4BCcQ4H/m/Ylg1bE9+8U0+Fm9r0tP8Up6CjEF9GjRS/A4h4wF1vSfUk9MY2FQle+ePieWManVWgKfgHM+8t4hH5uEHa64d0YS4Yj8PzydeBFmSlFihpfH8ETn4CSvQC4DE8EnT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zgaup5BJcTBxp5t2Ekoo+OazwveZFf2lupoI+4oCHO7i5dJHYEKkgK9dSIus?=
 =?us-ascii?Q?9eQ6uCxLoh5GshBgT7xIYEl1ew2TT8nJ47TszqNlRcN+VhIzxBukG67AERih?=
 =?us-ascii?Q?MwX8IaFaeyGV9wjtoBOJO+voj4xa29de1exnZAFCphmDcgbl9uDR36AFgXUl?=
 =?us-ascii?Q?2hiKZcjgz60rSqPIHPUd32oghrgHruQkHmMLj3PUEb7gn74e67i1ORQWNw+Z?=
 =?us-ascii?Q?tTJFkMNnyYdYUZcBXdORjpi1xh05uRawsDAuB4Q4zBB/DbiJuDfyKiiHQ0lA?=
 =?us-ascii?Q?m4TsJZax1JXrlg8+jOAkcVevE+4DZcWNrZvz61T4wSlAlU6Kp0NTipMUt6uJ?=
 =?us-ascii?Q?055XW+fK0ZXwXACvB/9gyFefwfMzxNvpYnupZZzG3zmXZLgG2pyB5MoVoHHA?=
 =?us-ascii?Q?dvlY3XEN8NF5GX/yD2SxmXtWwvotYg5oxYxF8bxsvwTIvRTONEO+MpnyhzEp?=
 =?us-ascii?Q?AEhHbBThTvylmW4FO46eKyf9L2HljPswAtTFbY7rE81HgrPJYkGaJjHnS83c?=
 =?us-ascii?Q?TVLNJiU2OHKHEqbqis/+y+4REAzfP2BMhGsJkiIkETS/KkTXtBsL9+TvRIRI?=
 =?us-ascii?Q?vNMe8CZV9OuMKpi8sTzoA8+N9YzChwgVbqOcADwUwYsyq5764nHo/mTwS8LB?=
 =?us-ascii?Q?yEtre+GYpdLaysMWGpm5SUsOSEVFy5s1XhXK+ckATCAVJgqF6zNKCmKBncCL?=
 =?us-ascii?Q?trh0siO62v2BSBBR9sKaXBVav3IRImAFN1WMPxLxL4zdXRDc8ur46WJcS9zP?=
 =?us-ascii?Q?OtGknMt0cg7cfGlX7TV1UFjoj4Aw3IYuV+MB70FezIV8GOitfDkOqSkXic+g?=
 =?us-ascii?Q?6bblUjHhMiu9/EJZSSX/W3qQlYBXLnsIOeO2P7qtP8B8Gpl/UUHmGG6oweqP?=
 =?us-ascii?Q?31cKQdhR2HimkFSHTaK1CN72fgdRIXzVdpE9RvyddR0slmDhXVx7JiFG6rCc?=
 =?us-ascii?Q?0kjfSPWB5Yru9GBqexKCt7dvqklc8TqBCc7W8EoIAyMcIzR5J+HS9nP2leOg?=
 =?us-ascii?Q?tL0tL8UbwcjHFuUeO23R0aidgg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db17785a-3aea-4477-3947-08d9fb58a573
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:54:00.3464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 07:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162528

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
 meta/classes/pip_install_wheel.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_inst=
all_wheel.bbclass
index 5b7e5cd706..e1fc25cbeb 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,12 +1,13 @@
 DEPENDS:append =3D " python3-pip-native"
=20
 def guess_pip_install_package_name(d):
+    import re
     '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    return (d.getVar('PYPI_PACKAGE') or d.getVar('BPN')).replace('-', '_')
+    return (d.getVar('PYPI_PACKAGE') or re.sub(r"^python-3", "", d.getVar(=
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
@@ -28,6 +29,8 @@ PIP_INSTALL_PYTHON =3D "python3"
 PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
 pip_install_wheel_do_install () {
+    # cleanup previously generated files
+    rm -f ${PYPA_WHEEL}
     nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
     bbfatal_log "Failed to pip install wheel. Check the logs."
=20
--=20
2.25.1


