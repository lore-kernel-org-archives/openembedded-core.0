Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF3CC55176
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:49 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=mmoY/gIq;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UONLLqlf8RoikVqQMB1IoUiSRJEEvgZBz/wwLxbywaMWBFYbyKDPNUDY5HqqKRrQPicNxvRui1KWmAfwH6aVa0JOy3tK0fiH3rOpftaRp7pc/H6mJEskFSpuCFKsQt+bX7AssZavqg4olCImTqEoC3jD7hMjBe9r2JwZFY/1MuAyP+MnyU7IS8y9YL/P2Pa/2ttd0HG0m7L5lZ4qvz/PJUay0H4C9i9MGgeT4e9mnMAj7++kVxBNQy3ncqegKMEjvnWl0iGpi+jd0PPItADkd9J3aNtDEog1o0liwGJYR3Ss8b1gOJpsRfg+kZPlMQspDSU8KzqInsseq79i2V6fKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7z0qXDCsUGyEP/IWYdMXb9lglf+2KPW7OLDoE0YIFo=;
 b=p0N52K+TDQ/WjElBcRDXilAZV+4fIoQrlkM5kBBRtbnN5pcuLGX5/glgU97QcCjVeMm2w/JhHESrntbWVuQZWd6nwsNGMpc0TflHRha8sA0e8CHXkjQYRAfAKjepGisMBYBwvCRq+TJ6+lUWsWC1ACdEJswOVjiMSFMg98JN7sp7/mKF8PmewkRcl37zD5Ln7Mg8AW5Yw28GgC0Fr86KpaicquDPZub2gDEhEZM9VIKC/WLTSTqMMPnXLFdmlJ9g0xaB7X8rtBOv2UfU0i1TVTTjJw0PWx3qsRnDXf7XQi1xywvQ+ksENQEVukWYsY7FUfcCZecIbXIS20PQD+EqUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7z0qXDCsUGyEP/IWYdMXb9lglf+2KPW7OLDoE0YIFo=;
 b=mmoY/gIq7z5M+cwiBEzxuMaCI48ijY3oFiUFl+YXLB+Eqjb6sOe38inkFpd+ABLTyc/d8CbrLA5H/sFYA9uNEoJygl/djui1X8WY2bOgWS1SYC6K2ghp/SvM7EOs6PImRV9Dy1U2sutOcv6mjtoMfQ5G2YTyN+4osrjt0qfQ2EFe0IVw8baVvIRJ4kA9GUgm87WvB/31miPAhU6TQ56pUjhoc1POPxkCTRTnIQWp5RV8rgKSixuMtf2at/YSr2ukbMiWc+P+vLiKosoof0OpPNYA0Mm/6Lc1lIckpG7l+F7WuQeSH8TLYX9+HOZMRGtETtF1t1+DoBGZpXQa19bCyg==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:39 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:39 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 4/5] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Topic: [PATCH v4 4/5] meta-selftest: Add devtool-test-multi-destsuffix
 recipe
Thread-Index: AQHdIM6wOtmFNgfU6EuI6ndU5iz6LA==
Date: Fri, 31 Jul 2026 09:26:39 +0000
Message-ID: <20260731092634.1127862-5-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5295:EE_
x-ms-office365-filtering-correlation-id: 4d972861-9beb-4157-3b46-08deeee5d36c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|10067099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 N6cDi1ORl3so1w2titz1eaNMESFADekvdD/r1U1BsLeMOFTNbbIk+ns/SyIBQBuWS8T9bwexks3erWqVh5iRVaH8k7lfBQm7j8GOnNonNH/dvizVrS7h2Dx9cR6d56Yv1qCQlBplf+5tfZDZoLgLTGvQmwNeaykMJ47Xb4uw/GDKgFhEJ07iceNuwZdWkU/2CCpLMQvUj8szWqkN9ykQQSfTmIjTKYdKouobYdYfxoxGT+AFul+q74NhwloWvPtT0MJM2C1aA0yFBpFU8UqsFddEDdToYyf/snz5JD4bMM8R5qn8HMFz27MLYkqlBaKUirgeeZWVgG17aJuExHCP5ZoyB3tHqjVETdBNVCqXDbtUvwEY72FO9XqCNh4jCbucX7cNquDT2kidfrUvN0ryGyVo75QDSEwRiq44VwFnjjTu2Yq1B0cBtrin4ce8jB4P22tXizywbufGrqmSDnemhD2XuB0eq63+CXUkze5CtnYVV1NHb2QfyZbno862OXz0FoYAE1vdBedp98LVZzQpQeLIkpZDQGr+2+PpSPi63EUK83NBz7r8aU0vmUGRrCJpWXr/Z6XtDBMl27Uq5F5edA5EY65PD4MnjTKvovk1Gh9yRuRVTNxT1rk8Y6yutZjTgIktCc/F/NDY+15W4eXlvKgukkbY/y0zkFaxT5D7+R8qpW8MlG04JXFXQeoEqdTQQMx4ga/9OlhxcgKknirRDA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?urVpdZfwtHt7VbnhzQylESoouBbW9Q8njXsmUFfMCrkvQt27drp1p9z//KPi?=
 =?us-ascii?Q?cTuTrnkWBBFtWpvOmwLPak3OGCePrtf3CTdge1uAt+754qATIdO5R5QG2Arm?=
 =?us-ascii?Q?89TAelKcgapHVBjEBY2yc8XhUdeC6ldw5YHF0M5mBnBkB01JKoNVykYzPuti?=
 =?us-ascii?Q?nQNKoS65SPCa45rgjOUW7Vt141zH6v1SbjriwOqA7LArw5oy6SB6BjfBsR6B?=
 =?us-ascii?Q?22eBe/LHFSOhYTDcDGgXlTIMblj9/7LNpa9so2bKY5F0GVh5Tq6b4b4JFqH3?=
 =?us-ascii?Q?BSzv0al/m4CZ8jYlFTb4BNbEx9/N/CAuqSc3l0EavLQSsvSbFDAYp1wuviqe?=
 =?us-ascii?Q?CMlkJv4bnjQrVaUdA9SkHkRIHUeNV+Haa7/U1unRg4y0vR+8chzZjDJAi2wB?=
 =?us-ascii?Q?5xMNCapchgWAJgHJfBpbtcp8j4lNprRqKu2kxB+phNkSUJI86E/8jfbiAtHl?=
 =?us-ascii?Q?sg2glO51bJIJO42jiJ3djrQfIMGMG0eYs7l5tZ5V/TtU9N5KTPAwqRE6WenP?=
 =?us-ascii?Q?opkEKpRwyrmW4HYH5HmcxfTkbXFao2wKd/t7LpezXFMggCyR24GEMyad+cQB?=
 =?us-ascii?Q?btKkeD5MKuyaSp8qJaH5WOSx7BW5+2trjgr4po5oYznnJzWeCNapLBRw5krD?=
 =?us-ascii?Q?sGrVeazbNR1C5/ahy38YbTl5qsL5dHbsq+Trm5/y5hbx2KXYcjegLZN75Dui?=
 =?us-ascii?Q?pk1FgoxxYhTrEge1t2nyrbWXNB34d1m/DIcOzBsw0mCRabtiEPTxxxXrwZ6q?=
 =?us-ascii?Q?Q5YkosO4P6yiO6Dyu1fLncf5KaT9h1pYdWrTZf7arfRZe/0ylraMFgKumYOd?=
 =?us-ascii?Q?54UVaFLwcdm/SThvRs1Ezl1w5zqy1fcDZzBBSuB0CYZSIWPGGGvPPnPOzWVY?=
 =?us-ascii?Q?tT4v7isx8Ub0JFxx6qyySXodHuVOmei+7hQjMJjqHAweQ8Za4sriP5AYVmho?=
 =?us-ascii?Q?1Z7FO07bP9q8/sVdPlD+IQF8Yy7rMpy5VsNAxVgKBHkbcb3kVSGeXBXLlSS+?=
 =?us-ascii?Q?JZ/UitjJX4OdAx85yA8hZEZYSFbTqlu00I3STwrSBgq4cXdSg4I6ijV5ypRa?=
 =?us-ascii?Q?KMcjvd/SbY1fuKB5bGnY9D41FLQ8jm9h5RfRWwHLqFRi5MIKuVwSXpXeytWO?=
 =?us-ascii?Q?k8GNqrhGcVo4Qn3dZFhC3SAgONAIEkERwZhuxuPIVQQ8/LEJ2/augIshLps9?=
 =?us-ascii?Q?/S/otbaIJa09ZHRd/8nHmO4kXiFREzMELXAF0L+Z5QasI89fUoXmYjnwW1hb?=
 =?us-ascii?Q?oj0CdtL03L7IudPQPCmLQgZgqXHMi5a6v3D/STInSU1k3nzBlfaDjLURtKjy?=
 =?us-ascii?Q?kUZ0NR5nbcN9ohc6nnalceirD7v40qy2EXzEQNNOBzHO2BWJDAtns8DbpTVC?=
 =?us-ascii?Q?tzpdVdMQkm3Grf5yOLdQHuNh2XNs1M8BdLnLT02dqYTfi2Ny1IyiRMkOk0aU?=
 =?us-ascii?Q?PdPFuSiIzPm+Uzn3Q3OLSIvVtGa86phiykTG/3KAGPfnYowufuItc+T+0THO?=
 =?us-ascii?Q?/TTzJcbdMMGK6N+SDntw9h4Mt9DONCw0J7bZ8wTjltjif27leI8922ax8RF3?=
 =?us-ascii?Q?CR6srdp0lT+h1YB+J7U66MYO0rM2ZnmMu/vBiiKn64jXazHsv/VFP+YvJhLZ?=
 =?us-ascii?Q?wAF/S72hkUQPQ4USv+dNTEogenYd54rxxn2I8WWwkCVRencN2DXhU9aI64ot?=
 =?us-ascii?Q?7hzsYsI5UrW9OttiBqEIqPAZnKB4oatkrt/EpZW5orMvpNURvCYirbq6g3vd?=
 =?us-ascii?Q?wzamCZyPYw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	qY/LHYA0cbNt1vISmtaknMMJMnJKQyK058qBnl83OUXpreOofXOqvSKxQj27+GJXyGiScXUy0P8YHz9nCupHbNvVsaDk5r+/B4yBP4lyhtdqIpiecBI8xWyf37+Bubc7bo3g9VTAvKFs1/ubEYNhLGQ94ql0mMydaRilxWnJ1Oea8vuIQUPDAQ3I+n2SOlaUQUZeGoBhE4MbVe8Vs6SqgcFf3Sff2Q45E+VBL1GNTX5scSNf5P5OiTYvr4xOdO/qoj1woruUniYaddMDvw/K2HLqxBFlXiH5N5Tnx75glFXKx4uDOm8iifhZ7iPcrvY7WPmiqed41QOmF4rqY8Sf+A==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d972861-9beb-4157-3b46-08deeee5d36c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:39.4497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erLvGmIG47yjx36EChvsh+OAfkDuIBQ8ghKfWKlLS3YWvUn8saTzgdz3r9p8vQ434ax/7KHL/yyHV+TGHwvDZBxXWSB1RoXt3volOM3Fkuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242416

Add a test recipe with three git SRC_URI entries using nested destsuffix=0A=
values, where each repo's checkout lives inside the working tree of the=0A=
previous one (level1, then level1/level2, then level1/level2/level3).=0A=
This recipe is used by the devtool selftest to verify that devtool modify=
=0A=
correctly converts all nested git repos to standalone clones, including=0A=
the case where a repo is nested inside another repo's own working tree=0A=
rather than merely under a shared plain directory.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 .../devtool-test-multi-destsuffix_git.bb      | 27 +++++++++++++++++++=0A=
 1 file changed, 27 insertions(+)=0A=
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-multi-d=
estsuffix_git.bb=0A=
=0A=
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuff=
ix_git.bb b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffi=
x_git.bb=0A=
new file mode 100644=0A=
index 0000000000..880f0f0bb4=0A=
--- /dev/null=0A=
+++ b/meta-selftest/recipes-test/devtool/devtool-test-multi-destsuffix_git.=
bb=0A=
@@ -0,0 +1,27 @@=0A=
+SUMMARY =3D "Test recipe for multiple git SRC_URI entries with nested dest=
suffix values"=0A=
+LICENSE =3D "MIT"=0A=
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"=0A=
+=0A=
+# Three git entries genuinely nested inside each other's working tree (not=
 just=0A=
+# nested by path under a shared plain directory): level2's destsuffix plac=
es it=0A=
+# inside level1's checkout, and level3's destsuffix places it inside level=
2's.=0A=
+# This exercises the devtool code path that must convert every nested git =
repo=0A=
+# to a standalone clone even when one repo's checkout lives inside another=
=0A=
+# repo's working tree: the initial fetch uses a shared clone whose alterna=
tes=0A=
+# point into downloads/git2/; git repack copies those objects locally so t=
he=0A=
+# workspace survives 'bitbake -c cleanall'.=0A=
+SRC_URI =3D "git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3D=
https;name=3Dlevel1;destsuffix=3Dlevel1 \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel2;destsuffix=3Dlevel1/level2 \=0A=
+    git://git.yoctoproject.org/dbus-wait;nobranch=3D1;protocol=3Dhttps;nam=
e=3Dlevel3;destsuffix=3Dlevel1/level2/level3 \=0A=
+"=0A=
+=0A=
+SRCREV_level1 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level2 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_level3 =3D "64bc7c8fae61ded0c4e555aa775911f84c56e438"=0A=
+SRCREV_FORMAT =3D "level1_level2_level3"=0A=
+=0A=
+S =3D "${UNPACKDIR}"=0A=
+=0A=
+do_configure[noexec] =3D "1"=0A=
+do_compile[noexec] =3D "1"=0A=
+do_install[noexec] =3D "1"=0A=
-- =0A=
2.43.0=0A=

