Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F47CD4F3D
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:59:43 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12593.1779436772187511780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=mwM9MZ6g;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.72, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptBBzPpufzwDpmrWnc2lFXT35PejvTY80cKC5+pj0UHTjuz8SkZUpSv0kj7oIWJWLWl+QTGLm9IMQYm9DZZy42CA2KasDkLlE2VBtvo5/El/+IqfesIzu6UZ5dFfSi5SGtqbaGdtxoftqG3KBu8HzzoGI3yZqNgm8iZZJzbg2LO+2Mq/0eZL5GlzFYuuFYM90F4qPzq6stMoCapjTyIpt+bY0wgqif2U7Am8k4UGIpZQ/RgBOtNWUmFFSc0pezUeLxwMremni7IzcBIgGOST/y0tzPaqxvbh2ucmx2KP5GRIsNePM9b2jRcZccSdGo4YkdXszphJjl73zQzDibfp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvdgtATvB7gSTL6MFIh/e5TsWd4GGlhJ6rbdqOWTNL0=;
 b=I1TrtLLVxW/e1qSi+eUGihA6K6TkKjla0qOvkqSOfuRZM+yslrykVwiBoJtPJqgFg1QilrXv7pqXoKEMFjm5XFdb35F2JOVyIB4Y9QKp6g06ZX4ChZYGyeVtPwcVs/NNZwhGzf25Am8MLEuOkrhB1LsZfqpjkVvtlp57a03aDSa31j4q3KZXzIcTCwcte3VuWuWJKmE0xCBCGwjQZV8NOtVZKh3ZyNn4dIdr2zJpd22kOY69f8+iXe0fMDqhVrS4PW+034xXuruH6ndxW/vFoj7UrskSrfIQYg82lajxKCzr/2HAqXFMfCaBcg+ZvpUn6iGN8to6m7IfZqtEFFsUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvdgtATvB7gSTL6MFIh/e5TsWd4GGlhJ6rbdqOWTNL0=;
 b=mwM9MZ6gYox0keCnU/aKcAYPHIav8dhfgqGCFcC1SWcfBLmhDMEWB1W1+wf6VACkGn8J6rxsgfic4QVopHe7x0Qo0GRZc0tmi+JAh5ikBbwTQZQNYNILThEz79ZgpoDRBTKy3QfxfUvWf9faFhn6T2NDpj1ckidbs2V/CGb7VLARPn5Rsm/eY7A2w2vtU1apCkaXifDMpqHeVlzIJIZYf/biYX97/6yL8cCPB9dlbN/+uaKrCDRFhMi+LbR//2+tSR0nsdPXhYsx68/Ql4i2162WVyxzuWFtjb/fETPeoIacm+zBji67qdwyEvgKZ6vE2o1nuPLP4DmD/7Tbf3LXKA==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB6118.apcprd06.prod.outlook.com (2603:1096:101:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 07:59:28 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 07:59:28 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v2 2/3] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Topic: [PATCH v2 2/3] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Index: AQHc6cDqIND07FRUsU+doLsKY1Ec8Q==
Date: Fri, 22 May 2026 07:59:28 +0000
Message-ID: <20260522075925.2381158-3-jamin_lin@aspeedtech.com>
References: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB6118:EE_
x-ms-office365-filtering-correlation-id: 5740002e-1132-47d6-10d4-08deb7d80cd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 
 NQmKa9WvO+tXEsiS3ti7wM/c4NVzgHqdTzuYGsAzJZ5kCFaINCZ+kiRgK3BUUXPMmmaJPa2+TDXSX4uNH4o/dqBDPioTiCJivUM24xRnr4FgcfVnLT1lJViD77/vFlIzzmptzRkJKxm3xuS6UGBcFtYGyvuB0LJmsl3xcykZu+c6OKXTC8an4vblpVFXZDCMoaqdf92z4YKsbuj5mzs6bzZkUr09XvPTpBFFmiKk298Em17fCGhD37NTaPiGUiY6DQnNGCav3xc2SGheUQNCWm2uOILl9+98iAMG1icaiDcTQold0V4CLCn9FjlyuFFHbATOYUfpyAnR2C4rrc2VdBVh6Y6k8nD2/yjhqubHLNcpobDiTTAzZMe4NzmGwVS1c+vGvHx/aQIy1v6jRljSMb69cLmZ2maA//P/l2/Uc+LAT26sTkFPnwylPODmn75E78AWZxl8Ft9YGZTTlEt0QHiefD+9GbsIhH+2ixvJ46AKcZ1G5/hI2nBmOtFlyxPf64XkOgXE//aI2EyWkOr2YH3G/51CEuiJRRuXtaFqkq1YN0Q63ZCNZsTkMM+NwiUvwkI7mDPUHmUyavWSiP7meXqHOq0fkqcr+8PsFGfBopOy6l8MmGHjYQP0qwy0qenSUjJsa1hc9jVtg+O0CrArZ0wZ11McIUoAJabjSHyDLSX0FqYUc6xIKynW7mbp8yOG2FaDgqhhHveDjXVdGbVx5ngaap2zwTFG4FHhZp6dYyMD0O1xU0SdaAKn+FS4588i
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?CmZgJywWLUxv9ayPQ+KUkvA/q//NI1JhulxUqka70bcROk8e/AakuEnhUshv?=
 =?us-ascii?Q?cjzOm5ZpQVvriIIJAYJtTCt6Mddimn3SAmws6Z6QCi8Vx79ncCVwEqg177jw?=
 =?us-ascii?Q?vXpjQDYawUzEwGl02gb5ss9yr42eaeO3QSCqBqBIPMMsFCNRSBiN2x6gNtRl?=
 =?us-ascii?Q?vJq+ZZJVfVLP6gdqbBm8sEBfSCi6dJmRdvVpVs268UGR2ULLPh4Q8EkPikml?=
 =?us-ascii?Q?4UPVHA0Ov5O8EkBZ3TpAw/FFd+E7CsVoJwdJqFO9iq8jhYVVOY8gJvifj/JH?=
 =?us-ascii?Q?INI2Wed47b4eRmSOe2TnNfOim17bCsI9UPDQlY6G4EWjYTDwGO2NeVyXibbX?=
 =?us-ascii?Q?hWdtNvbpk5lg8576GePNLTASlE+zvs1csg+BJUwQZ/DkHUSkv777+Cod1U+s?=
 =?us-ascii?Q?HYNw7vpXnKS804tanG4g7ZE6FoEOhRKOCP3FJLtCsEZy0WzWpJ2yEpXJNnMT?=
 =?us-ascii?Q?AfeRxvfTKX4zo/7SbO5jllVK2g+Bh+d41BeGO06biaQiJGsZcOv66q/g7w17?=
 =?us-ascii?Q?7IJvZXGJU6Seaqzbi6sP86cz6vC5o+F0sT/gRV/+OGPwwh91Tsf8mnLgV9eR?=
 =?us-ascii?Q?8U/tGY/IINFFJcP00bq/jRL5moOAXaEgwBtY1ANWVP5SUUKSh7stLSxcs1ya?=
 =?us-ascii?Q?NcPRF4dRChZRPEyHkXdgC4llpL4qBCCX+xH/8lLRCXJp2z4FTSp/M6lB8l4e?=
 =?us-ascii?Q?xmA5bXoIWE0QJJSMlgEnyT9ZcoNaQbZT7qIO7jS0Hm4+yxKbWQBiIxwr39t8?=
 =?us-ascii?Q?O1C5BRgpofU9NZm2jpqdRha1l3rQnISA866Uv1ume8XTWU4Jq4Gij55OUFcr?=
 =?us-ascii?Q?CE0NxbPsMKlSw//1OGA5H+8yQ03+X0GJ6dEo2ZqWR2eEGDJ/gRBLQe3RNt1I?=
 =?us-ascii?Q?n9C1eKQYfijtn/7l0yfdyDiPg1rEif9ebhy8SeL8z73ndIceEz3r6pql2vxw?=
 =?us-ascii?Q?peclWHtP6/XMrlMcsbC/vnJhitAlmZPgz1vbRez9BwIwRatdGquAnS+/I/XW?=
 =?us-ascii?Q?PRRxmTXs2/bVnv4IIZr27G1rbNmxVbq6Ei0s1+L0br2fOn6/0rTPo9tlhTXB?=
 =?us-ascii?Q?hF+/MIS6QxvZjatnWJ9cVX1P9JhrTN0F8Q+5MP8i3/L0708b4BRDSQoEh+lo?=
 =?us-ascii?Q?7aDFhtUhUjiAvmZbuPajaJih48KdWA1OYBYFEo3zaBeHzeElG98wTZA1RiL4?=
 =?us-ascii?Q?j1Tfc74P+ZEFakY3XgAS6+NCEZwNXsrvhSVXolKROCKJ/QevPmrKrGsHdggY?=
 =?us-ascii?Q?cuRYjqvvbaEsLvMfpOFGPAxdNwBkQSEhbCXMZJjy2feDUVQNUraFR/mzY84P?=
 =?us-ascii?Q?0qc/W95bVCNmP1rOJ9kuehEd0r3F1ybeqg5wxvIML0X20WSC1ThYchutCpgH?=
 =?us-ascii?Q?VdYUiv08mjvBjJVZYgwyrKIkPsggiBKS9LEFf4mqqqJaXDZBH8fZywADc2hJ?=
 =?us-ascii?Q?cm1medvtsfF9flfsNC2kuBXCtKU68dWmzYfTAtLkwKUTs4xmvAerl9OTjof3?=
 =?us-ascii?Q?HXJExGMHKNmjsQlnOgxuCaGpYMO0AzcaAfjOh83eB22GDZxzokGdCDn3mV3X?=
 =?us-ascii?Q?vFza3jgqv6yqVtnsU7aPSx0PNAgFbEqfPykjCQ2kr59A/5LgZrHexy+d8Zxa?=
 =?us-ascii?Q?M+MX/WtA2tJw0tPO7WjWoc9atqXwiGhgTTg7JUahlIywLAxoOTQPDwmGEx4Z?=
 =?us-ascii?Q?WWMq7+yPy+uRXGOkqpRHh2HvX+DQs9qS6XB+H0WreEWMr6iAxUuoZicRfn0M?=
 =?us-ascii?Q?bYnlG2kvPQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	WZtcJS3olR22xTfCfxcOXmVUpy9U63jItezQFIinOqVsq1EUl6VPfu5oyNw0LjeZygF9wnGNhdCQwESRxeacZjVl3330ToHBC5dVxp+RiR0mz7VEruBBpFhA6n0/1fZy9+Rivy1V1moaUBHygN1drlTf2tAmircpaYqXBors9/CX/kPrPkr+IqG18b5qnH9OB5WkIJ+wHUmm3pUGcy4Qdzf1NVjTfDIXYKtpuwTkF0I6qdeNgtAubSPqBjscUfRNXTCSshF0EX9R+7Y1EbDU9iFrUbjr/WhQJoOl82xGKd/26Ij7mOWdB/mdB8CXSYI4L/VTdl5c4//rbAoitdpbyA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5740002e-1132-47d6-10d4-08deb7d80cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 07:59:28.8699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wg/nJDvlKIu2S8XgQqLrblHbUezAsRnpHo+/0oCmY2QbDqSKqZQK4Yw5G+Kpixzw+uHNl5dZF5mHrjvEPxxMQpjaCSlmqLxn6VWAvX/hcj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237531

Add a test recipe with six git SRC_URI entries using nested destsuffix=0A=
values. This recipe is used by the devtool selftest=0A=
to verify that devtool modify correctly converts all nested git repos to=0A=
standalone clones.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 29 +++++++++++++++++++=0A=
 1 file changed, 29 insertions(+)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuff=
ix_git.bb b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffi=
x_git.bb=0A=
new file mode 100644=0A=
index 0000000000..0702b13f3a=0A=
--- /dev/null=0A=
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffix_git.=
bb=0A=
@@ -0,0 +1,29 @@=0A=
+SUMMARY =3D "Test recipe for multiple git SRC_URI entries with nested dest=
suffix values"=0A=
+LICENSE =3D "CLOSED"=0A=
+=0A=
+# Six git entries all nested inside S (${UNPACKDIR}). This exercises the=
=0A=
+# devtool code path that must convert every nested git repo to a standalon=
e=0A=
+# clone: the initial fetch uses a shared clone whose alternates point into=
=0A=
+# downloads/git2/; git repack copies those objects locally so the workspac=
e=0A=
+# survives 'bitbake -c cleanall'.=0A=
+SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3D=
https;name=3Dlevel1_a;destsuffix=3Dlevel1_a \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel1_b;destsuffix=3Dlevel1_b \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel2_a;destsuffix=3Dlevel1/level2_a \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel2_b;destsuffix=3Dlevel1/level2_b \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel3_a;destsuffix=3Dlevel1/level2/level3_a \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel3_b;destsuffix=3Dlevel1/level2/level3_b \=0A=
+"=0A=
+=0A=
+SRCREV_level1_a =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level1_b =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level2_a =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level2_b =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level3_a =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level3_b =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_FORMAT =3D "level1_a_level1_b_level2_a_level2_b_level3_a_level3_b"=
=0A=
+=0A=
+S =3D "${UNPACKDIR}"=0A=
+=0A=
+do_configure[noexec] =3D "1"=0A=
+do_compile[noexec] =3D "1"=0A=
+do_install[noexec] =3D "1"=0A=
-- =0A=
2.43.0=0A=

