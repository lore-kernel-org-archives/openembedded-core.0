Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475BFEB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 03:50:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3778.1686714621501505734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 20:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AEMe5JdY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=55294c811d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35E3gwXE025012
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=NaaL5XU3/SlXLoi71fz0BtqL4qCaUPBmp+my9idGpKs=;
 b=AEMe5JdYsfg0idghsKHuWXtT+hOtWaeLCF3OAVbzlhNCvHShmmoETc93ytDYSyXWURXq
 MebeFN5zXNQgND+lryk3s5X2lHT48zUFc/TQWy+2wgFYYD32hNkNBHp65FZXoF99U2nb
 YeHRLZAUWcYN0G3cNt4jl97vBRcJBlXc6IVQLVK3CmNIAs49akOWFbS1R3ljrqR+eZsi
 bVG6agT1IGvHKGFsLT34+HG2eE4deMXVW3EfXWvmuzWbZtvzj4oXhq0o7VFZHX4GEDCL
 wJvoHHiLn15CRXt1f+n0zWjIPaMsugPkEbqg6kFcyZhVw6a7XiUELIM+R4aatMlE8FEq BA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4ed03ebx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eiuoo2rbwbuz20QpyMx9WWpnoX/EIqiYtbm7//FVObm4KjN2KXh8LjCc+An5WOTvSHSNWn8oeMuhqNWaDhlpzCoEBp0Q7spnTwbKGitwptEWuPMP45z7s7WH9sHLEc7sBZO1gU5M7LXQ343jk/GOJAIsPktrM8CqRiIOhJ898hU5ky1uR9TILzCunNG0WuB71dYreiy8URWwiomT+3EuOMGIQ7FPNCIMhogaRzM3/SkqoBkfLsM1I2s70frOua0+o8q+gM4/Ks/T/mTflVvYr5kr1TBoMIf6+8Jj6r4Ue547EX0wJwvF0j7EcO6lcS2rNRJHFInLzdfnjsTMOt9PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaaL5XU3/SlXLoi71fz0BtqL4qCaUPBmp+my9idGpKs=;
 b=G77GdukQvC5fBf/in6HWyu3ZSti9eLt2v2eKVCmPAe2GJdYEv19aWkNWKlR2OsTPQVxNg0bQTmxQ9ZDag0ZyNbq4M9khIgSnda9OFPcfNg4KgocnkTi1oU+NZrQbHn97kZ/fX/4Rp9xalZ726legUnhAOoWFIo8KiTZO3pplDcRDtAYh9rogRarGe1TqZ+krHKJsnwdk/wZmMcJoQWqF2ExCPjeEzav60rPI0zMHh8dm6534Sw1Q0nT0CbluWX819ms+8/y+sMVtfPuzUtbviHwqMfVjomyjgXMmfxOMpLV4P9YH7cCq+kFKtqFX6WJ9K3vKmbyVx3RKZ6SItO07cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CY5PR11MB6212.namprd11.prod.outlook.com (2603:10b6:930:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Wed, 14 Jun
 2023 03:50:18 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Wed, 14 Jun 2023
 03:50:18 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-29007
Thread-Topic: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-29007
Thread-Index: AQHZgnhDiehixiSlY0yZt1U/r2SmCK+J4axX
Date: Wed, 14 Jun 2023 03:50:18 +0000
Message-ID: 
 <MW4PR11MB582219EC9D52722C1F7B062B845AA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <175D7BEC9E108A2E.31428@lists.openembedded.org>
In-Reply-To: <175D7BEC9E108A2E.31428@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CY5PR11MB6212:EE_
x-ms-office365-filtering-correlation-id: 2865677d-09f0-4bae-43b2-08db6c8a7830
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jQiTXpjQ/U76gQ2FN3GAevARb6oVagqhtzlrp1DmVDhvyBKUU18qrIOvoin112wT0P9W5SGqi7PAEMimeRo/b1mDL1jCR+tMeuSArmkKO7sLzN2CVgsVbjSWHbrDhOJjTdViu1b6yf/KKN7o/8gBuplwHiQaPnt6xFHLSfR3bUnx9CV6E5MXqQBDppJY7UrQSMYpyF6ZPHsQMZ9+xTSLVu+r/bU6WbBQ2mdwrcncuykAF7CniKdTlepgKKkydPRFDY4IzMFJ72uKcY3cQ0gaUwJY4sqgLPYC0aQdjteEoFf5dK9tsFMX4hfW1wRukn/Sk5Vl8MxmXQmuhYMxecXnmYH8bVRG9xZcWs8xsvLCnxz9TWyA/idslGb4wi/EmmRzVpbU23wNRvYF+SzosRFdy8Y3Fqzzu9E878URwcjS6V0lh3LdlQCfRIzVE/k89zI5cHA+IvUsyG+3/3tde/8BFoBCOw2mn6rt4GUPbhXcFtB/kXO+vGc6mzU/cAT1PKBa08QTJmpxwkFz5tEGk53z8U3B8EsQO2BXm4o2RNfvRozl/kYfYq+gcVqVyxpDQzFXud8pGGH7dsapbBSi5iFEwpW2HfHBfnTt/Klbq+zrOZ+8sJe25YK1dlXAOqKar3IL4DUoAyuEIv/OaP8LcqPHNA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39850400004)(396003)(366004)(451199021)(83380400001)(966005)(478600001)(55016003)(8676002)(33656002)(66556008)(76116006)(52536014)(66946007)(91956017)(64756008)(66446008)(66476007)(166002)(316002)(41300700001)(4326008)(38070700005)(5660300002)(122000001)(8936002)(86362001)(38100700002)(7696005)(2906002)(71200400001)(110136005)(107886003)(19627405001)(9686003)(186003)(26005)(55236004)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ayDwcii+C1wh3H4CEJZXNVNfk8pFw/HXEUN9EPPfFpW/3GP7KqkUAmLrbG8i?=
 =?us-ascii?Q?ZfeuNp1a/6H49nf7DU03KPGp/jQCUWnHethS06M+xykAoS9DyE0jYiW8CU94?=
 =?us-ascii?Q?28j0n+MITea8RhIn3MA6czhAnRKBK4bBPYDohdYc1tWsMgP6DsKfhyUMQdwg?=
 =?us-ascii?Q?NV4K81Dpx8z7p9ToOe/MTtADQ7VR662aIMYDGoBHco1695FS/R8ioXiun4bD?=
 =?us-ascii?Q?/wsFIwq0O9ZXm1a4gZyHIP+VyihKEEqzQjRfI9ILxvwXLYJkE0vkDU5AGR40?=
 =?us-ascii?Q?BoR3do5UzoX9SwGm7gHZ/5/lukMFV7WSjKTTnqUl7cnMHSAsApZgr3sirYYe?=
 =?us-ascii?Q?pkKY/M75UOdSLKdBgCFrOzk24iLvD2R9bKejwDTLkehMB0SF0QRerCv0pdPH?=
 =?us-ascii?Q?s1erODgqQRIALkj4uRPSkhYXqW/sZVvlQXfmPMU1kteuhXnBZWIYjzc45lEM?=
 =?us-ascii?Q?DJBGSW3piA0aWnkoYtBeB+nX/JqtIJ4miu+MJ7v9CUQ0Wnv5E1aNPXhNc3fK?=
 =?us-ascii?Q?pr6iXye8BeP+WpAJdJYP8uNyP6NMG+owsJW3fs8sHrpqXatgNhAGwSUVcsAC?=
 =?us-ascii?Q?CyYh7gcuvDvlk8lEciWIQpfCnc5u7FbZIcfL2Sod8lNGIvOiLhj7buqZM3w5?=
 =?us-ascii?Q?uK4TR8oT3GhM1o+CiKrBomPeQSrn19sc23VIT0vAQrW019vtigFIVrNhM1Vi?=
 =?us-ascii?Q?FaEL5ByQYwm1PaP+GfLrYNsmPKMToMYzd84UhsUqXAjiKNbQBo6st8xBsdzD?=
 =?us-ascii?Q?WsePmcMo9xYCYvw+YUHBfnhK+YQbSAV+NxNh+EZf6iCqi/ARB+HBxvALfBSX?=
 =?us-ascii?Q?91zNhqqpm9kfcXX/3r7XkvOZ7if0WHUQAeJRVEHHnETF9OYWYMQG8lAAwCl5?=
 =?us-ascii?Q?lcdZFtJWqEtSSZLRJBJJdpWBsgDnG1a8HyjfjWLwjyJ7HKiTj4BsnqewV6pD?=
 =?us-ascii?Q?ctalBVUDbe+3KwA6HSBZbTZHFu9ypw8dcQ67aadR64GSOIn85fxfijcEtmsB?=
 =?us-ascii?Q?g8TXJboRkg+WxpTILPubJn8lBnyOjdxZqyH5UNsIZeSa3zZqv92vDhW1xoZ7?=
 =?us-ascii?Q?Y+804XdCEZF3Z++2R2hRaU/+c6r6klFNO6cGvkROIEU4d9uiq1O+kCusGUVc?=
 =?us-ascii?Q?ehQeRjpEYrxUuJlBBth93WMDo7Q50xQdtoR389Ppd9MTODY9K2AxC06TJOV5?=
 =?us-ascii?Q?cP4Qb4Yjr0n7guE7mn2Md1JfrVs88N1Lyq2Dy0QD9NENVLJ3DTRQ7y+1JalP?=
 =?us-ascii?Q?bz63/shzGGII3Z3dksmYYvXc4s+2o0cWm8mLP+s1hn4Fm/dVq8Fro9NBgZbZ?=
 =?us-ascii?Q?6kmZv/Wj+23yGML5ZGBgV6KmuZHrH+9hcMbmqtv3BIBUds5GieUH7/XUGQ3p?=
 =?us-ascii?Q?R5T6fxZLNkcANaEcO6hawODD18qjyj9yECctSIScZ2KFabsbaLD7CkKz2H8G?=
 =?us-ascii?Q?g9MiPld2gPVA21k5LaQs4KXLcIAxEC6TBY4Y9LWGPVu2okPJ2aA2CzuvqML/?=
 =?us-ascii?Q?rWHqvVaj/4pThjE9lVdePRuM0PVrTqJgSFbH+U0qcXlfFoF1qHbKYvmbteYl?=
 =?us-ascii?Q?FxOzpoQluq6FCXYjY+hUApg3cku5zfnPJxRyK0r/DdJyqJ5ad+0MpRczjuqf?=
 =?us-ascii?Q?FQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB582219EC9D52722C1F7B062B845AAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2865677d-09f0-4bae-43b2-08db6c8a7830
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 03:50:18.0439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVTwJaB1ExI8pyz9xk3Kwkxy+vf0Vz7zAz7s2xlCPGQznSq6PpHPYmDtdz4A2so5X3jKUC4vPtqZ8CIj/UBaLPdrup7h5AgSAfM7Z9jsXoQkWJY6l07kJfSxDgVAtma8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6212
X-Proofpoint-GUID: mTXVc7dCKtwKsWdYTPjxgTmAn8BnYU-I
X-Proofpoint-ORIG-GUID: mTXVc7dCKtwKsWdYTPjxgTmAn8BnYU-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_01,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 03:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182731

--_000_MW4PR11MB582219EC9D52722C1F7B062B845AAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder,

Regards,
archana
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, May 9, 2023 6:44 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Polampalli, Archana <Archa=
na.Polampalli@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-29007

Git is a revision control system. Prior to versions 2.30.9, 2.31.8, 2.32.7,=
 2.33.8,
2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, a specially cra=
fted
`.gitmodules` file with submodule URLs that are longer than 1024 characters=
 can used
to exploit a bug in `config.c::git_config_copy_or_rename_section_in_file()`=
. This bug
can be used to inject arbitrary configuration into a user's `$GIT_DIR/confi=
g` when
attempting to remove the configuration section associated with that submodu=
le. When the
attacker injects configuration values which specify executables to run (suc=
h as
`core.pager`, `core.editor`, `core.sshCommand`, etc.) this can lead to a re=
mote code
execution. A fix A fix is available in versions 2.30.9, 2.31.8, 2.32.7, 2.3=
3.8, 2.34.8,
2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1. As a workaround, avoid =
running
`git submodule deinit` on untrusted repositories or without prior inspectio=
n of any
submodule sections in `$GIT_DIR/config`.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29007

Upstream patches:
https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfffa8438432b4
https://github.com/git/git/commit/29198213c9163c1d552ee2bdbf78d2b09ccc98b8
https://github.com/git/git/commit/a5bb10fd5e74101e7c07da93e7c32bbe60f6173a
https://github.com/git/git/commit/e91cfe6085c4a61372d1f800b473b73b8d225d0d
https://github.com/git/git/commit/3bb3d6bac5f2b496dfa2862dc1a84cbfa9b4449a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../git/git/CVE-2023-29007.patch              | 158 ++++++++++++++++++
 meta/recipes-devtools/git/git_2.39.2.bb       |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2023-29007.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2023-29007.patch b/meta/reci=
pes-devtools/git/git/CVE-2023-29007.patch
new file mode 100644
index 0000000000..14b6933e96
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2023-29007.patch
@@ -0,0 +1,158 @@
+From 057c07a7b1fae22fdeef26c243f4cfbe3afc90ce Mon Sep 17 00:00:00 2001
+From: Taylor Blau <me@ttaylorr.com>
+Date: Fri, 14 Apr 2023 11:46:59 -0400
+Subject: [PATCH] Merge branch 'tb/config-copy-or-rename-in-file-injection'
+
+Avoids issues with renaming or deleting sections with long lines, where
+configuration values may be interpreted as sections, leading to
+configuration injection. Addresses CVE-2023-29007.
+
+* tb/config-copy-or-rename-in-file-injection:
+  config.c: disallow overly-long lines in `copy_or_rename_section_in_file(=
)`
+  config.c: avoid integer truncation in `copy_or_rename_section_in_file()`
+  config: avoid fixed-sized buffer when renaming/deleting a section
+  t1300: demonstrate failure when renaming sections with long lines
+
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+CVE: CVE-2023-29007
+Upstream-Status: Backport [https://github.com/git/git/commit/528290f8c6122=
2433a8cf02fb7cfffa8438432b4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ config.c          | 34 +++++++++++++++++++++++-----------
+ t/t1300-config.sh | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 54 insertions(+), 11 deletions(-)
+
+diff --git a/config.c b/config.c
+index 27f3828..3c674a6 100644
+--- a/config.c
++++ b/config.c
+@@ -3487,9 +3487,10 @@ void git_config_set_multivar(const char *key, const=
 char *value,
+                                       flags);
+ }
+
+-static int section_name_match (const char *buf, const char *name)
++static size_t section_name_match (const char *buf, const char *name)
+ {
+-      int i =3D 0, j =3D 0, dot =3D 0;
++      size_t i =3D 0, j =3D 0;
++      int dot =3D 0;
+       if (buf[i] !=3D '[')
+               return 0;
+       for (i =3D 1; buf[i] && buf[i] !=3D ']'; i++) {
+@@ -3542,6 +3543,7 @@ static int section_name_is_ok(const char *name)
+       return 1;
+ }
+
++#define GIT_CONFIG_MAX_LINE_LEN (512 * 1024)
+ /* if new_name =3D=3D NULL, the section is removed instead */
+ static int git_config_copy_or_rename_section_in_file(const char *config_f=
ilename,
+                                     const char *old_name,
+@@ -3551,11 +3553,12 @@ static int git_config_copy_or_rename_section_in_fi=
le(const char *config_filename
+       char *filename_buf =3D NULL;
+       struct lock_file lock =3D LOCK_INIT;
+       int out_fd;
+-      char buf[1024];
++      struct strbuf buf =3D STRBUF_INIT;
+       FILE *config_file =3D NULL;
+       struct stat st;
+       struct strbuf copystr =3D STRBUF_INIT;
+       struct config_store_data store;
++      uint32_t line_nr =3D 0;
+
+       memset(&store, 0, sizeof(store));
+
+@@ -3592,16 +3595,24 @@ static int git_config_copy_or_rename_section_in_fi=
le(const char *config_filename
+               goto out;
+       }
+
+-      while (fgets(buf, sizeof(buf), config_file)) {
+-              unsigned i;
+-              int length;
++      while (!strbuf_getwholeline(&buf, config_file, '\n')) {
++              size_t i, length;
+               int is_section =3D 0;
+-              char *output =3D buf;
+-              for (i =3D 0; buf[i] && isspace(buf[i]); i++)
++              char *output =3D buf.buf;
++              line_nr++;
++
++              if (buf.len >=3D GIT_CONFIG_MAX_LINE_LEN) {
++                      ret =3D error(_("refusing to work with overly long =
line "
++                                    "in '%s' on line %"PRIuMAX),
++                                  config_filename, (uintmax_t)line_nr);
++                      goto out;
++              }
++
++              for (i =3D 0; buf.buf[i] && isspace(buf.buf[i]); i++)
+                       ; /* do nothing */
+-              if (buf[i] =3D=3D '[') {
++              if (buf.buf[i] =3D=3D '[') {
+                       /* it's a section */
+-                      int offset;
++                      size_t offset;
+                       is_section =3D 1;
+
+                       /*
+@@ -3618,7 +3629,7 @@ static int git_config_copy_or_rename_section_in_file=
(const char *config_filename
+                               strbuf_reset(&copystr);
+                       }
+
+-                      offset =3D section_name_match(&buf[i], old_name);
++                      offset =3D section_name_match(&buf.buf[i], old_name=
);
+                       if (offset > 0) {
+                               ret++;
+                               if (!new_name) {
+@@ -3693,6 +3704,7 @@ static int git_config_copy_or_rename_section_in_file=
(const char *config_filename
+ out_no_rollback:
+       free(filename_buf);
+       config_store_data_clear(&store);
++      strbuf_release(&buf);
+       return ret;
+ }
+
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index 2575279..ae97dc5 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -617,6 +617,37 @@ test_expect_success 'renaming to bogus section is rej=
ected' '
+       test_must_fail git config --rename-section branch.zwei "bogus name"
+ '
+
++test_expect_success 'renaming a section with a long line' '
++      {
++              printf "[b]\\n" &&
++              printf "  c =3D d %1024s [a] e =3D f\\n" " " &&
++              printf "[a] g =3D h\\n"
++      } >y &&
++      git config -f y --rename-section a xyz &&
++      test_must_fail git config -f y b.e
++'
++
++test_expect_success 'renaming an embedded section with a long line' '
++      {
++              printf "[b]\\n" &&
++              printf "  c =3D d %1024s [a] [foo] e =3D f\\n" " " &&
++              printf "[a] g =3D h\\n"
++      } >y &&
++      git config -f y --rename-section a xyz &&
++      test_must_fail git config -f y foo.e
++'
++test_expect_success 'renaming a section with an overly-long line' '
++       {
++             printf "[b]\\n" &&
++             printf "  c =3D d %525000s e" " " &&
++             printf "[a] g =3D h\\n"
++       } >y &&
++       test_must_fail git config -f y --rename-section a xyz 2>err &&
++       test_i18ngrep "refusing to work with overly long line in .y. on li=
ne 2" err
++'
++
++
++
+ cat >> .git/config << EOF
+   [branch "zwei"] a =3D 1 [branch "vier"]
+ EOF
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb
index 222e545f60..b994fbc66b 100644
--- a/meta/recipes-devtools/git/git_2.39.2.bb
+++ b/meta/recipes-devtools/git/git_2.39.2.bb
@@ -10,6 +10,7 @@ PROVIDES:append:class-native =3D " git-replacement-native=
"
 SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=3D=
tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build=
-.patch \
+           file://CVE-2023-29007.patch \
            "

 S =3D "${WORKDIR}/git-${PV}"
--
2.40.0


--_000_MW4PR11MB582219EC9D52722C1F7B062B845AAMW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Reminder,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, May 9, 2023 6:44 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Polampalli, A=
rchana &lt;Archana.Polampalli@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][mickledore][PATCH 1/1] git: fix CVE-2023-29007</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Git is a revision control system. Prior to version=
s 2.30.9, 2.31.8, 2.32.7, 2.33.8,<br>
2.34.8, 2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1, a specially cra=
fted<br>
`.gitmodules` file with submodule URLs that are longer than 1024 characters=
 can used<br>
to exploit a bug in `config.c::git_config_copy_or_rename_section_in_file()`=
. This bug<br>
can be used to inject arbitrary configuration into a user's `$GIT_DIR/confi=
g` when<br>
attempting to remove the configuration section associated with that submodu=
le. When the<br>
attacker injects configuration values which specify executables to run (suc=
h as<br>
`core.pager`, `core.editor`, `core.sshCommand`, etc.) this can lead to a re=
mote code<br>
execution. A fix A fix is available in versions 2.30.9, 2.31.8, 2.32.7, 2.3=
3.8, 2.34.8,<br>
2.35.8, 2.36.6, 2.37.7, 2.38.5, 2.39.3, and 2.40.1. As a workaround, avoid =
running<br>
`git submodule deinit` on untrusted repositories or without prior inspectio=
n of any<br>
submodule sections in `$GIT_DIR/config`.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-29007">https://nvd.nis=
t.gov/vuln/detail/CVE-2023-29007</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cfff=
a8438432b4">https://github.com/git/git/commit/528290f8c61222433a8cf02fb7cff=
fa8438432b4</a><br>
<a href=3D"https://github.com/git/git/commit/29198213c9163c1d552ee2bdbf78d2=
b09ccc98b8">https://github.com/git/git/commit/29198213c9163c1d552ee2bdbf78d=
2b09ccc98b8</a><br>
<a href=3D"https://github.com/git/git/commit/a5bb10fd5e74101e7c07da93e7c32b=
be60f6173a">https://github.com/git/git/commit/a5bb10fd5e74101e7c07da93e7c32=
bbe60f6173a</a><br>
<a href=3D"https://github.com/git/git/commit/e91cfe6085c4a61372d1f800b473b7=
3b8d225d0d">https://github.com/git/git/commit/e91cfe6085c4a61372d1f800b473b=
73b8d225d0d</a><br>
<a href=3D"https://github.com/git/git/commit/3bb3d6bac5f2b496dfa2862dc1a84c=
bfa9b4449a">https://github.com/git/git/commit/3bb3d6bac5f2b496dfa2862dc1a84=
cbfa9b4449a</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../git/git/CVE-2023-29007.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 158 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/git/git_2.39.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 159 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/git/git/CVE-2023-29007.patch=
<br>
<br>
diff --git a/meta/recipes-devtools/git/git/CVE-2023-29007.patch b/meta/reci=
pes-devtools/git/git/CVE-2023-29007.patch<br>
new file mode 100644<br>
index 0000000000..14b6933e96<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/git/CVE-2023-29007.patch<br>
@@ -0,0 +1,158 @@<br>
+From 057c07a7b1fae22fdeef26c243f4cfbe3afc90ce Mon Sep 17 00:00:00 2001<br>
+From: Taylor Blau &lt;me@ttaylorr.com&gt;<br>
+Date: Fri, 14 Apr 2023 11:46:59 -0400<br>
+Subject: [PATCH] Merge branch 'tb/config-copy-or-rename-in-file-injection'=
<br>
+<br>
+Avoids issues with renaming or deleting sections with long lines, where<br=
>
+configuration values may be interpreted as sections, leading to<br>
+configuration injection. Addresses CVE-2023-29007.<br>
+<br>
+* tb/config-copy-or-rename-in-file-injection:<br>
+&nbsp; config.c: disallow overly-long lines in `copy_or_rename_section_in_=
file()`<br>
+&nbsp; config.c: avoid integer truncation in `copy_or_rename_section_in_fi=
le()`<br>
+&nbsp; config: avoid fixed-sized buffer when renaming/deleting a section<b=
r>
+&nbsp; t1300: demonstrate failure when renaming sections with long lines<b=
r>
+<br>
+Signed-off-by: Taylor Blau &lt;me@ttaylorr.com&gt;<br>
+<br>
+CVE: CVE-2023-29007<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/git/git/commit/52=
8290f8c61222433a8cf02fb7cfffa8438432b4">https://github.com/git/git/commit/5=
28290f8c61222433a8cf02fb7cfffa8438432b4</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ config.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 34 +++++=
++++++++++++++++++-----------<br>
+ t/t1300-config.sh | 31 +++++++++++++++++++++++++++++++<br>
+ 2 files changed, 54 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/config.c b/config.c<br>
+index 27f3828..3c674a6 100644<br>
+--- a/config.c<br>
++++ b/config.c<br>
+@@ -3487,9 +3487,10 @@ void git_config_set_multivar(const char *key, const=
 char *value,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; flags);<br>
+ }<br>
+<br>
+-static int section_name_match (const char *buf, const char *name)<br>
++static size_t section_name_match (const char *buf, const char *name)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 0, j =3D 0, dot =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t i =3D 0, j =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int dot =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (buf[i] !=3D '[')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 1; buf[i] &amp;&amp; buf[i=
] !=3D ']'; i++) {<br>
+@@ -3542,6 +3543,7 @@ static int section_name_is_ok(const char *name)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+ }<br>
+<br>
++#define GIT_CONFIG_MAX_LINE_LEN (512 * 1024)<br>
+ /* if new_name =3D=3D NULL, the section is removed instead */<br>
+ static int git_config_copy_or_rename_section_in_file(const char *config_f=
ilename,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const c=
har *old_name,<br>
+@@ -3551,11 +3553,12 @@ static int git_config_copy_or_rename_section_in_fi=
le(const char *config_filename<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *filename_buf =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct lock_file lock =3D LOCK_INIT;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int out_fd;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char buf[1024];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct strbuf buf =3D STRBUF_INIT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FILE *config_file =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct strbuf copystr =3D STRBUF_INIT=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct config_store_data store;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t line_nr =3D 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;store, 0, sizeof(store));=
<br>
+<br>
+@@ -3592,16 +3595,24 @@ static int git_config_copy_or_rename_section_in_fi=
le(const char *config_filename<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (fgets(buf, sizeof(buf), config_file=
)) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; unsigned i;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int length;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (!strbuf_getwholeline(&amp;buf, conf=
ig_file, '\n')) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; size_t i, length;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int is_section =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; char *output =3D buf;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (i =3D 0; buf[i] &amp;&amp; isspace(buf[i]); i++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; char *output =3D buf.buf;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; line_nr++;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (buf.len &gt;=3D GIT_CONFIG_MAX_LINE_LEN) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D error(_(&quot=
;refusing to work with overly long line &quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;in '%s=
' on line %&quot;PRIuMAX),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config_filename, (uintma=
x_t)line_nr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; for (i =3D 0; buf.buf[i] &amp;&amp; isspace(buf.buf[i]); i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ; /* do nothing =
*/<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (buf[i] =3D=3D '[') {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (buf.buf[i] =3D=3D '[') {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* it's a sectio=
n */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int offset;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t offset;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_section =3D 1=
;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+@@ -3618,7 +3629,7 @@ static int git_config_copy_or_rename_section_in_file=
(const char *config_filename<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strbuf_reset(&amp;copystr);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D section_na=
me_match(&amp;buf[i], old_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D section_na=
me_match(&amp;buf.buf[i], old_name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (offset &gt; =
0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!new_name) {<br>
+@@ -3693,6 +3704,7 @@ static int git_config_copy_or_rename_section_in_file=
(const char *config_filename<br>
+ out_no_rollback:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(filename_buf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config_store_data_clear(&amp;store);<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strbuf_release(&amp;buf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
+ }<br>
+<br>
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh<br>
+index 2575279..ae97dc5 100755<br>
+--- a/t/t1300-config.sh<br>
++++ b/t/t1300-config.sh<br>
+@@ -617,6 +617,37 @@ test_expect_success 'renaming to bogus section is rej=
ected' '<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_must_fail git config --rename-se=
ction branch.zwei &quot;bogus name&quot;<br>
+ '<br>
+<br>
++test_expect_success 'renaming a section with a long line' '<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;[b]\\n&quot; &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;&nbsp; c =3D d %1024s [a] e =3D f\\n&quot; &quot; &quot;=
 &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;[a] g =3D h\\n&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &gt;y &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config -f y --rename-section a xyz &am=
p;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_must_fail git config -f y b.e<br>
++'<br>
++<br>
++test_expect_success 'renaming an embedded section with a long line' '<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;[b]\\n&quot; &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;&nbsp; c =3D d %1024s [a] [foo] e =3D f\\n&quot; &quot; =
&quot; &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; printf &quot;[a] g =3D h\\n&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &gt;y &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git config -f y --rename-section a xyz &am=
p;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_must_fail git config -f y foo.e<br>
++'<br>
++test_expect_success 'renaming a section with an overly-long line' '<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
printf &quot;[b]\\n&quot; &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
printf &quot;&nbsp; c =3D d %525000s e&quot; &quot; &quot; &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
printf &quot;[a] g =3D h\\n&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } &gt;y &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_must_fail git config -f y --ren=
ame-section a xyz 2&gt;err &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_i18ngrep &quot;refusing to work=
 with overly long line in .y. on line 2&quot; err<br>
++'<br>
++<br>
++<br>
++<br>
+ cat &gt;&gt; .git/config &lt;&lt; EOF<br>
+&nbsp;&nbsp; [branch &quot;zwei&quot;] a =3D 1 [branch &quot;vier&quot;]<b=
r>
+ EOF<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-devtools/git/git_2.39.2.bb b/meta/recipes-devtool=
s/git/git_2.39.2.bb<br>
index 222e545f60..b994fbc66b 100644<br>
--- a/meta/recipes-devtools/git/git_2.39.2.bb<br>
+++ b/meta/recipes-devtools/git/git_2.39.2.bb<br>
@@ -10,6 +10,7 @@ PROVIDES:append:class-native =3D &quot; git-replacement-n=
ative&quot;<br>
&nbsp;SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.=
gz;name=3Dtarball \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://fixsort.patch">file://fixsort.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"=
>
file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-29007.patch">file://CVE-2023-29007.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git-${PV}&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB582219EC9D52722C1F7B062B845AAMW4PR11MB5822namp_--

