Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B1FCA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:59:38 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10892.1791802776622534089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 03:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nokia.com header.s=selector1 header.b=LxEFUJMD;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: nokia.com, ip: 52.101.69.36, mailfrom: jakub.szczudlo@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aaceS2Tg7G6CFaWjefF7o5yT5pdexD6lLKOkevFw93QrqTFoQdZ2lBFXnkXEezQYF8S5kHpmXkzcvXYPf4Sp/AUkrxWR2uSJkWD20/DmWFVoBVQ6I4ZNf2Rs8g2hjDdGEjVvqK+weyBu5Ng8jomuVZ3Le0vTT1B59+DI1o8QepWqmLMycI1E2mI879l9j0UfUoZJ8VkdvdV0BHitu5H896STOFT/Oyqg7xtWDER3nIGSORpKNlWQNfF0As3F0lrpih5YNmyvRxfFUBbt/ifCp3lE38ASWbMe1EAb3H0CyB2ob9AA/z3U23taU0gD0z5GPIM7c53HkWzB+xVOsifVMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgjqhY/y9KcMolxcdf9TxpwNWBFngWfAPqj8+TLyJWw=;
 b=oUZ96slHD+gMaaV3hAXqhHhy4CJxj6etSSnErimd9THEfHCxV+gCbK9FLPkzbOi/plrpj7q247/3dpP86D4PbrUKhQkyX8wUP2b24KqgdkI0BITG3EL9qkbgz4qttvZbAogHSgS5i88eBgxf+Y9pucRnabhFT+YuBNB90lDwoloU9Rj7KBHs1B/+8O5E7IJDN9SdWChl28jeIRjRv6PBPeizS+qLRFqkWeSXl4/C45A7E7E+gFMazzdA4S89O5de9NOsPML+vFWIH0l7dKMLbwshQ3UcgmgQefFOkz6thCVDpzYfu+zMsFgKLO/P7Fu0D+XFXmUwIy6wjwAkLe8qyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgjqhY/y9KcMolxcdf9TxpwNWBFngWfAPqj8+TLyJWw=;
 b=LxEFUJMDZHs3YVXuXqwFmg9jWpervNDMuF7WwdKwm3287polq60L7yebwIJcHCXZI0R7qbueInkraUhRsaMPUT5YfUZO3AK8M1d1q/BrkASzsV1MFlm7vTdFcsDPKoi72+YoKOn+yRxmAhf9nGyjm0HmnAMAXXIR1DxLLvDxOTA/GNDY2V/LTHN96yUJGXgoeGCHBF8J26KoIpEg4bPUmnb/ckjIVYZFr06FHPfQGtkV9NUCyEFho3AM0ziogWEHKAkh6tTulDuSdpisA+aKLTWkVy8aoivDvydJ/ePNZxYaz3+51BAaVD0/P9KuQlDumUxgtSoC2SXSY2NOhfiO+w==
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 (2603:10a6:150:357::20) by MI9PR07MB375903.eurprd07.prod.outlook.com
 (2603:10a6:290:ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 10:59:32 +0000
Received: from GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680]) by GV2PR07MB11919.eurprd07.prod.outlook.com
 ([fe80::159a:9a82:1362:e680%3]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:59:32 +0000
From: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "Jakub Szczudlo (Nokia)"
	<jakub.szczudlo@nokia.com>
Subject: [wrynose][PATCH] libarchive: fix CVE-2026-15028
Thread-Topic: [wrynose][PATCH] libarchive: fix CVE-2026-15028
Thread-Index: AQHdWjjCgVCxfsKR902Xwafj1Qlebg==
Date: Mon, 12 Oct 2026 10:59:31 +0000
Message-ID: <20261012105920.11004-1-jakub.szczudlo@nokia.com>
Accept-Language: en-US, en-150
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR07MB11919:EE_|MI9PR07MB375903:EE_
x-ms-office365-filtering-correlation-id: c63dae43-4315-4a5f-e938-08df284fe509
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|260925022911599003|260925021911599003|260925021311599003|10067099003|13003099007|261009223027099003|38070700021|11063799006|6133799003|12006099003|18002099003|56012099006;
x-microsoft-antispam-message-info: 
 c7B9b685KIJdiZR/ZHY7OKj97w2Jqxaqsm4OY9+APpibGUadB8ute8gjh3GAWGqZ+dVdAP5NMwQHSlknZoqrKveLpJLfu6cuBvO7f1YsPzHkeDiqMQPGVqwrSxlS4MfgGOhG1WQHtpHjUlnFviF3gz/5OKiwl/TmmNRkirMkEsfjfGwgfSvMMNJyBwKO7mIADuGDGR9pTF1hsXPf1uO4OKucPBplQi+TDiaojy8xUYxJnMnBlcjR7JvE3bzNpLPHPyTeJ8pFXRnT2y5TpIpd5D1qnQHiulvTpUfKtGfcIXtqRkJ18OjipPmMZG1dK+wI3cJdDNa6m9Q9O4ZU7MdbjSnl0p/K0yyR2poePVGjhLYfgXduas3uTUyh1jqm5rJVTn3BR5KpXo/EBYAo4qPdWWOQpd1A3a7wwsu21r/pE4nfAEODMd3FFFUHmG9DOF7Z1JIw+yixu3BxIJXhzvEeMyyVrXU9KXG2x0NEmikdcOK2zEQ7+VPiDSZmIFwLQ1FCt7w+xNYjZ8lO1QubYUwOcXr49pEcr+VUZSE3osHBlkzsqyriuLyqAK6i6AMWcbEJbyrdGgHQ7n4NlS6/AyAU/kNcALTGoJ47LzyAfY6mNogl52TRvtsA9sarclz0X6S1QeXjrswg1cvYz5YoE3WAoGe1BqzVJGnoGAsJ7Dv9t2Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR07MB11919.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(13003099007)(261009223027099003)(38070700021)(11063799006)(6133799003)(12006099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?A1XJfr1T+FWkDz/LNOcloMwOBw/v3b3l5S8z9XX/2wf/gnSrFEOT4768V+?=
 =?iso-8859-1?Q?3j6sc4vr1qGr1FAJzM704MfXqZV+qn01RR1hROUMh3iYeLbjiyZCH7wo+r?=
 =?iso-8859-1?Q?UpwaR5g0rtpldN/Xd+W5Li1kkEUkgsdeH6RTVADN7VqwTcD8WBeNKEAdnH?=
 =?iso-8859-1?Q?wlon13ce0OvFDT6mJVT/qRsgbz1fOWidDlw6zrLoI1SvtCjmoWo14VTCy9?=
 =?iso-8859-1?Q?LaVwq0U4hOPlQwi8CF+CK73eYVOpUMbk5d2PwScn0w/IHa/M1P2is885vt?=
 =?iso-8859-1?Q?5ceDxc23XsTwOsIpeXB9W4Tkb2Y3a/PbO9z4hsymLROxU803vP/mlIP+0e?=
 =?iso-8859-1?Q?Ns6KQnTsijh5asqDbBqD7C2G5/2XGyHyLKLGmXev4Zy+KcwT4UB4nP0L3+?=
 =?iso-8859-1?Q?qi7a6ORzP7ILgUd7zFfHkRsLSs3HXNd6K4QnfxSVheRt0UCK4sxP8FF39o?=
 =?iso-8859-1?Q?yWm16+UkZ8SserXUPb+hMwVi2MIa/OR9tsrGwxvNjc/Hg4PVQI88sTt6ax?=
 =?iso-8859-1?Q?+dS2724o5sqWsc4ozopHpzH52KMMkGF9ScJGWvUZ3OV1HiTqgPqHsUR5Ka?=
 =?iso-8859-1?Q?jP7lJJt6xHYnFUX+xCc3FwVV4prrjUX73XMdDR4cX3sR93iag+eA9LgOyJ?=
 =?iso-8859-1?Q?qCwQfGDzaOb3egdIuf7efMdBhIP419Sc0c3Ugvqhw8FtdZM6tMLptwMyVJ?=
 =?iso-8859-1?Q?NUzVZ4iGDB8e3jKJCDnJsrJev2BzLeJT5DjBdONwVNJMGphs/MC2mKPD8B?=
 =?iso-8859-1?Q?pc78cod4p6DNzDqn/sDrypBqkOnpG1C/cscoDsidNOCh/K0A3s0+NCJkj9?=
 =?iso-8859-1?Q?R8xlZDbgOau5PPZKaJXuhPGqrZ4eddzB2F6/u2PSW+/KWHd3GujJiVJ2Im?=
 =?iso-8859-1?Q?jFKLlEJ0aHoLduBe0TgYZ+UjtV/j5epgqnDJj9EbQpv8T4ltwxRvV+7kwo?=
 =?iso-8859-1?Q?RwQsj8AoWRLMU/7L6dUdnCJothb/vkCDvnIjlYdD6q8Out0U6oEmBay5Dg?=
 =?iso-8859-1?Q?XE/1wdCKbczPijd1AfMiblIdz/xQ8k+e4I/bAHEc/5I+1Fy2WU53VSFNAO?=
 =?iso-8859-1?Q?1p49i8rGAbLw1kv5jncRi9HBC2GxDJjb6WHboFr4nuYfuBXNJJfCHAow6X?=
 =?iso-8859-1?Q?NIVcmIp2atK22HKl2eQey+rHA4EOyBQ/9fROlfYyvx+D8y64+M27yEeDg7?=
 =?iso-8859-1?Q?MBxA6hR0HO4Okj4vFuViOpS1fJDcPmjCLXIhqlgEXLZD0FnlCzTotGrTBz?=
 =?iso-8859-1?Q?1OzuMPSxOZE2vGz/weVoTHvoUcnQoDd7cIJHX7J2NYX68WJtWNKKChg+Uk?=
 =?iso-8859-1?Q?mMzHK412uNC6OIO27HBTIY5z84tAoaz4NtH7hStle35E/MsdU6nolR7SGB?=
 =?iso-8859-1?Q?9xFvbzjKqT/lxCcGS3kBEpbAE0vHZLiTzZBXoef6AuF2TOiNMAaXiPa3RF?=
 =?iso-8859-1?Q?d/pBI+aw+uXOmHKkvohY8yGlfarqBoJYFT96W9P05fCLhAHajg6QweaIDI?=
 =?iso-8859-1?Q?dVACIdPQHJny4NzPPL+RaHyD+2A+2q4vamdRoX9SYx3KArXi2zEFxFB9sY?=
 =?iso-8859-1?Q?wxe8AWrTWjhAyggXIDtEYDckiyQrqTaqd1uTt1xQl+iilutd6PiQzr2IwD?=
 =?iso-8859-1?Q?pvgHD/ixvFD1M6XvU9zCze0ZpXNHN5/ECioIgefw7bwx+G2hRCjANjIVt2?=
 =?iso-8859-1?Q?KOh3gvKvu9pkMR1lf1abOeDFFx4tG6rfR5Ejjq0M61dpEDuv8qdSEVYSED?=
 =?iso-8859-1?Q?g46TCVEtR8OZGiY//29o4S0WjvfnKPAEW7KRnLBAgxly6JeyRN8rDxFYvz?=
 =?iso-8859-1?Q?UQpOwxqDcQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR07MB11919.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c63dae43-4315-4a5f-e938-08df284fe509
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 10:59:31.9814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0ZoI63cr0xCTQcI+OZ5hI3Vj39t+/44YjXSfq0d2i3cN2P0CvpotCN+vdDBG3n3lmGQnLsdECYTjpKHJRDWhS4S8zvkZrIcDWeUh6lQSEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR07MB375903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247632

Backport patch to fix CVE-2026-15028.=0A=
=0A=
References:=0A=
  https://nvd.nist.gov/vuln/detail/CVE-2026-15028=0A=
=0A=
The link in NVD is wrong. Based on project own pull request:=0A=
  https://github.com/libarchive/libarchive/pull/3252=0A=
=0A=
Fixing commit is the below one:=0A=
  https://github.com/libarchive/libarchive/commit/40b92de1def08e4fc319d5570=
2785f82cedb7ef2=0A=
=0A=
Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
---=0A=
 .../libarchive/CVE-2026-15028.patch           | 41 +++++++++++++++++++=0A=
 .../libarchive/libarchive_3.8.7.bb            |  1 +=0A=
 2 files changed, 42 insertions(+)=0A=
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-15=
028.patch=0A=
=0A=
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch=0A=
new file mode 100644=0A=
index 0000000000..c63fcf22f2=0A=
--- /dev/null=0A=
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-15028.patch=0A=
@@ -0,0 +1,41 @@=0A=
+From 40b92de1def08e4fc319d55702785f82cedb7ef2 Mon Sep 17 00:00:00 2001=0A=
+From: datauwu <datauwu@users.noreply.github.com>=0A=
+Date: Mon, 6 Jul 2026 21:51:15 +0800=0A=
+Subject: [PATCH] tar: fix 1-byte OOB read in SUN.holesdata parsing=0A=
+=0A=
+header_pax_extension() passes PAX attribute values without the trailing=0A=
+newline to pax_attribute(). The SUN.holesdata parser read one byte past=0A=
+the supplied value when the last numeric field ended at the value=0A=
+boundary.=0A=
+=0A=
+Handle length =3D=3D 0 before checking *e.=0A=
+=0A=
+CVE: CVE-2026-15028=0A=
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/40b92de1def08e4fc319d55702785f82cedb7ef2]=0A=
+Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>=0A=
+---=0A=
+ libarchive/archive_read_support_format_tar.c | 11 ++++-------=0A=
+ 1 file changed, 4 insertions(+), 7 deletions(-)=0A=
+=0A=
+diff --git a/libarchive/archive_read_support_format_tar.c b/libarchive/arc=
hive_read_support_format_tar.c=0A=
+index e07cfdb63b..1c0441db6c 100644=0A=
+--- a/libarchive/archive_read_support_format_tar.c=0A=
++++ b/libarchive/archive_read_support_format_tar.c=0A=
+@@ -3448,13 +3448,10 @@ pax_attribute_SUN_holesdata(struct archive_read *a=
, struct tar *tar,=0A=
+ 				return (ARCHIVE_FATAL);=0A=
+ 			tar->sparse_last->hole =3D hole;=0A=
+ 		}=0A=
+-		if (length =3D=3D 0 || *e =3D=3D '\n') {=0A=
+-			if (length =3D=3D 0 && *e =3D=3D '\n') {=0A=
+-				return (ARCHIVE_OK);=0A=
+-			} else {=0A=
+-				return (ARCHIVE_WARN);=0A=
+-			}=0A=
+-		}=0A=
++		if (length =3D=3D 0)=0A=
++			return (ARCHIVE_OK);=0A=
++		if (*e =3D=3D '\n')=0A=
++			return (ARCHIVE_WARN);=0A=
+ 		p =3D e + 1;=0A=
+ 		length--;=0A=
+ 		hole =3D hole =3D=3D 0;=0A=
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.7.bb=0A=
index afc06f85d4..d4cd0b5b01 100644=0A=
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb=0A=
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb=0A=
@@ -31,6 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"=0A=
 =0A=
 SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \=0A=
            file://run-ptest \=0A=
+           file://CVE-2026-15028.patch \=0A=
           "=0A=
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"=0A=
 =0A=
-- =0A=
2.34.1=0A=
=0A=

