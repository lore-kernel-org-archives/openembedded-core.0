Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E51EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:20:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.4837.1689160823457464085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=EXo+o/Mt;
 spf=pass (domain: welotec.com, ip: 40.107.6.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwRYhD1zT9wkVqo5G+yuBuDTGYrwB5YVU4sUPRNbO1ZuUqtH7JgJ3O2wkmol7CwsH0bratfnRW1ekdhhe6Y4psd9Q6Xl1MASmIxMrk4GUkRy9sE1EIdSh6AoNSymYTlW9KuGCbugIH+HDVOZlKoi1uYfMJYztHwJP62xvz/rhnT+9wiBE+RI+XtzjzOStTrlK1LNDxcHkiIKh1OcTCXJVobO4SuaZxBmP/oXNCG09qvqcW9EXlkbxvaCFDMoNwyMqA7fnLpPQK17xdxVHzELmf9xB67i9kXcQaONgkFOp1lBHD7fKhi2s/EjQ5BRU5tkSHJ8CMS3oGd7XFDkVgoixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=fUcYw8aLc0R465bdb9rkPWsP3nrhLAiUHNTX4H/w8ZNjOvEgVL3MKhKdamOc4e+n43t7T7FAYSMMr9DTxH147HRhTTXYnQimsw4xvYIe9IgB+Ltp4NuFFuad+/OItCuBui5BMDJ2e3R55lb7H4w9iJkyNdLcAptvTKiA5oHp0El5o1HOHokkmVruJ4d5078MQ5GJzw0J2IHCoMmWatId+OdQLRjqGuBwBnc55BF8ON//csFxara3fS3Xs+WFsCF3Y2fB1UxcPy/AfvQAyweVN2+0DszTcfBk0iGTYcyywtHLqawC2O8Ccoq49SH1rKakSkz7SJTBLSG7414eMhfR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXxu/2pjjRRNs521006T8xJQ4bJFYbgWLBuU2rs5ewg=;
 b=EXo+o/Mt/2pTB05XhO5lCKRDvDr/aJCKKNSTgTzk2Ulmg1MkQCvzuftwK3dF6oc+a2UUjARW4zAoe0Dc7aphbHFtF68cxBF0b7XgfAa0T69BQcxkUCQej/1+Ca88JNRF8tTvW5XEN4YRHLZjPKOqiBXlVGm5HfCv4o07VOazdVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 11:20:19 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:20:19 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v3 2/5] package_ipk.bbclass: add support for ACLs and xattr
Date: Wed, 12 Jul 2023 13:20:04 +0200
Message-ID: <20230712112007.705867-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712112007.705867-1-p.lobacz@welotec.com>
References: <20230712112007.705867-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::8) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4144cd-e588-4f4b-1b55-08db82c9f9f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lo0NBTVRgBWOdu8C5NGlSRVYutCxlr6Lu4SG+QM9cpcaYJufq9zArnZYLXBzjnDuD5P0mUM+BlHBc8yB8haOYAOZOh1bjWdGbZvvaF0Jc3KTugbTlbPELZlfSAKgd6fsM7Vw1FPjXPcQTMS1lfY0DqnqdVxFEJWC2aaPKbhQabfsmCnTtVG9ECVwAonAtmfi3+a86mm5yZhxjjMGXmFPkQL+Zd57OGVL205AEvPXPNBIP5NottxG7vNOCAhKm3cjXUGSACa/KIC7YMINJcx+64t0iihd4/fQoBJDDczwV2t1rjpG0bf95jko9C6jjFeclVnuvRc2vXdrt27TBCGYti/hiLeW+EzROsfgeiLrgZv+vmUwiapjNzyxMIX4Z7Sfoh6gr45I1J3O6NN4rgq8kjLd5xcH1gnrkvyztruvKC9Ob0dTqOQSYLkVRjFRByeXGb6/djYnB1kmsKfuI6/t9W/rp16oqCTQR1ohQrhiw5drbt1+ESpZpcdVKHRaNxcyhCCeX9di0mOk8tcMq4pM/oNQLuFkF89g/YFTPefSGHORSfw1cmwPAqVyC6TKwqQs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39840400004)(376002)(366004)(451199021)(107886003)(316002)(41300700001)(52116002)(6512007)(6486002)(966005)(83380400001)(66574015)(186003)(26005)(2616005)(6506007)(1076003)(38350700002)(478600001)(6666004)(6916009)(38100700002)(66556008)(4326008)(66476007)(66946007)(36756003)(8936002)(8676002)(5660300002)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lfa5xXFmAgytl2K+pFcoj4wfbiGCv4PBFMFeeSeOFw4ExX2RLIS1gH9QEwm6?=
 =?us-ascii?Q?R2tWHq9xaIfUCExyGiEvWL/jBZ9YTTCz8EZ281yXLoPdhyT6Ue/gHqi7dgpn?=
 =?us-ascii?Q?hXod5dBLlanb0w2BCLzmUqU9GFmDDXfULnA1MinsyGtn9wAb7+jYjaGrES90?=
 =?us-ascii?Q?x5RRzwem+VZL6G0gmtWk3veXKFhUogfVUEIuN2TG5QL4mr7UNHfFqjvIhZZM?=
 =?us-ascii?Q?97ZYoDjYbaEgVRWMsjcKxeebg1DfzAdWndJrkteGpetsw4B2lQxclznPUCiM?=
 =?us-ascii?Q?oFNxTtaEnzXcNjMhSr8YnVgZ4u/EgVMTsCGpABduKfV5Z3bvWIP6IkKG9juo?=
 =?us-ascii?Q?Dng//+TSbRVE8KUKmubrTNRRq3k7GwunwdMbHhULDMPhnByzbXlq47vnNd6R?=
 =?us-ascii?Q?nc6qt0Qak2E08EMEoav0KElh8r0jvQJ2Rad6gmPuc4SMVe70ycM6XOU4Kqj+?=
 =?us-ascii?Q?zpXZoSuZp85ICT7oKztGNWGAxfeaceHarpa4jIB4pwXwi9meQw1YoPo2WKCC?=
 =?us-ascii?Q?LWHHXIHPC7UoKIbcX2vgTGBnkz9V19b8zRpuY5YW9zHajex6rvo/Q+Rah4yH?=
 =?us-ascii?Q?mLB0iGsmSqMS5XkOtyPRLx9JMTBute0GUGLoso6pxRSkDBPEEfkYaUT++Hwr?=
 =?us-ascii?Q?ka82bkIyGyReACrxrsczGpnTLHPWLJnBsLLbKsnDVYqtSHOfAT7VZdm4W5wX?=
 =?us-ascii?Q?AE7ZiOZvZ5FN5SfGRkefUbNbEiyNaP7k7ut04F7SV56qLokZBdpmlb8muVSB?=
 =?us-ascii?Q?Bjxwfs3mwEWhI3uCawFAvRtjqCScweBXiCRa8BnwlmfNQwb3wbY6EZ9ZLrFE?=
 =?us-ascii?Q?d8yxTGrQlIfdm74PkZC2pnRCd7hTaCV6583pwnzPmn5O6XOIOV6TpKNR6TpF?=
 =?us-ascii?Q?PGZUYfJMsy9OaSQcEPBkAwCqwWfRHs3BsYS+pZz4YDGqdWGVbwNkTkX8yUNp?=
 =?us-ascii?Q?QfaA3ZOs51q3UaM3hrsP9iMLJUCyYZ4fgrC0htpEOak0Vl5N1Fd+gjKB1Mq9?=
 =?us-ascii?Q?iwqzE5wCki5Q+nzcKBFs9kEjW/R0fIjdqR3f2Xog/ouk1zmLxxTWpPpluJxG?=
 =?us-ascii?Q?Wlz1OccQKNEv0UdoCqcqveLqmLF75gItyVWGYIheAe/Zz4Y3eRiRZXJDE4fd?=
 =?us-ascii?Q?S6rEmp3VFZbCk2GxgFssVYV6gQ9RbQL2aM2T3etAxZCpjV4+9mzLzlYkcsLW?=
 =?us-ascii?Q?9VUirHBz4CiWvpAXteQSq21MNCt/t08SHrghsU3T7TkZ/8zIJTKHlBfu7pHw?=
 =?us-ascii?Q?ZsL4DSxahTS7ggH4XE+EcvhI7LAIXavYxomVzkEdkrD+dyQQAHdii63OAPwq?=
 =?us-ascii?Q?Opxc0hHD69rTiHztqi49Ibz76LAdlBYWZCQglaM6MdwjVxeiYIYSAaVr555g?=
 =?us-ascii?Q?yNLpIpmL+H4yJffv6kcnDA+wBgffjIlrp8ixaVGfSW5Q3eDAxOF/33fLSsUn?=
 =?us-ascii?Q?H3BGTCvS4Oi+TRS48lCJnFGvkew4trjIx+fEaJUkLCebd8bG5gLNNnnP464X?=
 =?us-ascii?Q?JU0YeobALnoYvkN2U01ikgTNT1KToYDqHE9nyKgpbRk5tpN61oKf3oAjwOCS?=
 =?us-ascii?Q?IhMFKDaPFMfWvABZsCY+HFU2Oo2Qe+RcEQe4dZsh?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4144cd-e588-4f4b-1b55-08db82c9f9f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 11:20:19.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shysJXGcEy3Jha/9DKkTle4TQfGluLf0lXPvdJ0XnRf2U/vWXW6cf4NizhaoBhwbtYTZItiaZa6dzQd7HXrctQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184178

Extend OPKGBUILDCMD variable, with additional parameters, depending
on target distro features, in order to support ACLs and xattr.

With fix pushed to the opkg-devel:
https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
opkg-build is able to create tar archives with ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package_ipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/=
package_ipk.bbclass
index b4b7bc9ac2..5e151be3cd 100644
--- a/meta/classes-global/package_ipk.bbclass
+++ b/meta/classes-global/package_ipk.bbclass
@@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.conf"
 PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
=20
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
+OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.cont=
ains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO=
_FEATURES', 'xattr', '-X', '', d)}"'
=20
 OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDA=
TIONS") =3D=3D "1"]}"
--=20
2.34.1


