Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB851C001E0
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 07:58:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9402.1691049533469236703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 00:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a1uz7Ov/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7579963e98=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3737Jm1S020828
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Aug 2023 07:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Sm8UtA+MhuVSp9JmAl
	ftavCUdMQcQVKW6cfbbj44VsQ=; b=a1uz7Ov//P9RGRenDs5TQNEAqDnLWRbWn5
	erpjko8gQ/9P3obdAcjNNEYnwJYHAoSVp5/FKNgGnjX8xiaTfRXPd6/TTwZJknqN
	gQg/x44mMBHrOggBoPaLIiN3BdOSLwexTICV7WU2poi1hQIUgYaVRcPtXvpOLf3a
	uT51gFbVV6duJMcsqCBEM9lKs/Hzn0OCi9Z1shbfVgDrMI6qokaieOr+xba+1Xz9
	1xrTtzDVFNNIGTjrAN3JIi5a8MmhQteTLbNSmQbmwviYW1xE5FrKzqGXhGzAgMlN
	7NJaY1gFf1Cp3L0kfzdg5UztQQ0UnJTpIl6v80m5xkOMysBGHRZg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s4qyx4msp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:58:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSziW/OM0GGH3QaVQpCAAUO9+ZlbefqQWByhGBPrdlpXh88wOrRX9hYBJiZ98bXnVp6Hmptro360f/EoAnI1kC2h5y9DPttzxFg7kJzrJ+yl12U9OgPot2IDEodiSJTTqv9h3fzxzeNYALuYwMIBM0ZbCy04EaXWYXX9jzhHZT76Etb7bpnnsaQZn0vtXH/GK2ihGfiYlAsGFC9dOsQW2XUUm9HDx4v//WgXra/pSVQrxOl5Z3hX4g8WBPs4ktcEsmeR/VLnFAAphsgslVOFFCKYI4AZPq9oQUjwNi+7UUz+GheuAMN/fym9GwcCoUsDSRAlPs6mMlPuevohT+CeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm8UtA+MhuVSp9JmAlftavCUdMQcQVKW6cfbbj44VsQ=;
 b=JNQpoXst645iBy6RjmJJ8ovqCDBL7OEOm4qCIZOHwyXQCtopC18k2VGtmyR4kVjuKVR+W78qn39bAltTd0b9C/9cIb3AO520X+lhxiUUn312WUfffTAy0hy4IIlV1lVgcFKATEIO6ztjQIPHmOQuhmcVC77qfkQGkRmEC0R130ZcVw5ZldhRJilCzzVvRiaVf3dkJRAntBuO8JbzmlPdvOllAP5fGZXiE41DgY3eH1Ke+qePQVkn+/shv2Ky329QcDPXE0aR/ygsZlG9wFysVD/hoIbgD7yfA56MJ+a4HdCPlVwUxrpQyTnSh8zSCry8xrC8ZZGFM63ajEv2jC1C+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:58:47 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 07:58:47 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: mark.asselstine@windriver.com
Subject: [OE-core][PATCH] openssh: sync with upstream's default
Date: Thu,  3 Aug 2023 00:58:37 -0700
Message-Id: <20230803075837.1728947-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: cb75eb99-ceb3-436b-83ee-08db93f777aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rCCNvMr+9Wgibxv6SuwgbyUWSG2hczOnz7RvapUd2j6+4ild7/0rVjv/5FGQbGImW/+VDWsiFgaL5iLh3z0xwRYNbmts6UupQZXaOmOwn+VEvwXb7IBthYUfEVodWaJozUPfEqXlULC+AEK/ACehLsXqtOX+3OysReWHk0xi/6N3RiH46iMxqjaqga5+iCF2Z7SAZUuz8h/eiNun/lp5hivTcyZjBGS56bf6LyOhMeM8FJifF9acjPVKQZinYAzyYQes92Sy0yRPYXp6QMrKKCN3B/Ce8fRxx/PCv8SOWpBkNWO+daZ54RlNGPak50c+Saw5Z+lQSC8+oLSL3nwijiwFrgg/R4CP4SZuFfBIeWMFARXP0ZC1KiRdXOReWF6tJjyYUkbr+4utS71RrGw4Edmq1TUNGiKoM6PuSqItAh9elNlwPpB2u+je2c7oT1rkZiwRI4+5hEC9ElhvcLk8Si2pi6mCUKZiDmVEqjrPjob8k8uksqD6nqKYXgP+UZSQrZ8ihnxiJiDrrntTx7vf1zeXQvXVVjY0N/6ARJ3wmkQOI+x8i+H46Vro32BZJoh8jep7f4hccWYS1SiXxwkd7u8ZSwNk97MDVH+etwy67k0xN1SeoUkiSGtiHadsQ2NB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(451199021)(66556008)(66476007)(41300700001)(316002)(2906002)(6916009)(66946007)(4326008)(8676002)(8936002)(5660300002)(38350700002)(6506007)(38100700002)(26005)(1076003)(36756003)(186003)(2616005)(83380400001)(86362001)(9686003)(6512007)(478600001)(52116002)(6486002)(6666004)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jfj+88zAbjFxtYT7HAYFkiktqDJkXuVvVYdEN4wZt/f0GETp5luEhZYRCk6e?=
 =?us-ascii?Q?axsTgg6Loc9Bmm80ExAu1VnPZ0IpYMQW9mb0CfrBA1YrHxUW2hZ+iOyL1xj0?=
 =?us-ascii?Q?l2vCk1dJ4A2fYhX/FcROdFnJMWw1hJaNrxwGdUm8jgKurgM4MiVPdh6tG52Y?=
 =?us-ascii?Q?Tdz0rQ3rx+TxJ4f1+WYrcBc92UNopK9ouo7LlX7vRuirYMjY4LSbsDwxap3d?=
 =?us-ascii?Q?dHkGtmemD7EBOGp4YyctYx3ZB95ToYO3E5jLvVvF1qvvH4G8aV1iAkTCWP4b?=
 =?us-ascii?Q?a5nahcfeIfiGyIt0OErmCdiGSH53NA6ZRhy8resAGozBisU/MRk6KdwOFX4g?=
 =?us-ascii?Q?Fw6Pb0nOj3y3n4hkr3/vYEdm/hPGeKUv8zRkpeWFFjSJUQF2/Qd4ERZejLye?=
 =?us-ascii?Q?ryz1tM4lwtrRias42ncQLH+mWQQA4Eg+fHkIBUBwXW5e1VjR1EcOVkvewKn5?=
 =?us-ascii?Q?kN5dUBrPKsAIC+4udQuh1YMbSa0iaVfvuL6zYkPlXSbeJTnl5xahfm6c2X2q?=
 =?us-ascii?Q?L3TbR6VXDHXCnJa0+gf1n83Ux0+eDrsBX+w3bnCriLmHjFw8ouj07WG9X4j6?=
 =?us-ascii?Q?ZYBGn3VLAx9+YuiXRRyOpaEUjeeBpWSwicF0dzMFwPeIJYUELLWrc7hr/5uP?=
 =?us-ascii?Q?VNPf3BtSCO4V1BMg70KF574IhJ2dLVa0MUf5FL+25WtDPPndpfDId6S1LSJ1?=
 =?us-ascii?Q?cy1xVIq1trEKFEEg9XC0ogI9Kf/zbxDw47ITg8L+ZOg/7UtItRaJKthc1znm?=
 =?us-ascii?Q?YUxvLezacbosPF9P+PdN33MFkzDBvcS44Dk9n6I0nsArihVEd15gkkw7qfXw?=
 =?us-ascii?Q?yAi1nxZts8jCv+gO2OnfiVsMWW/6hC6Usb7Mlsg0jZaMBSTvrMuto5Budanh?=
 =?us-ascii?Q?NIP1vuj+UvoopcP8oloRAohXVym60pgYRXZ7nrTP4/aF0Gscw5g2r0JbV4oX?=
 =?us-ascii?Q?wzS/xwz4zQ4/Nksk8B8dPTpkZsIOGa59qzX+m5Jxek/o4YAGgMACILp0gFug?=
 =?us-ascii?Q?u4aCYgiNSSmkAXI68gulDo2q6kwNQ4nW+VP1iXB8H6og+vD5rosN6JwnPoW+?=
 =?us-ascii?Q?ldpvQBhKNFbP5lZY+4QVIHjDkxc/KgiTxa09GoQjavCH338oSnAC3H278biC?=
 =?us-ascii?Q?p9gX6wDabCA8trzyLO4VEzq7Cadom2woS3L7ur4wisBPSeEICajcTGavOOzM?=
 =?us-ascii?Q?hDwZizDw4Borb1imaKUCd9Tt/PUGMkkk4sGQOAJ6JGVX6fSiyhespEqEOiDw?=
 =?us-ascii?Q?mo1ma22xSFJFzdDE2Vxr1S4fjnUI6oVUUZYp5E36KreqNciSt34rP2o5hNdP?=
 =?us-ascii?Q?CRFEJE8uOMOe0RogACbgDnQHXQ6NneX1bSavvw8YAGyC9353Tic0n3GoLNYy?=
 =?us-ascii?Q?oMCUGMWlrBCt7LxBUTB2lt4tBNqG96Fvc9OCCmlhcsARawmaJpFsrrmL+KWP?=
 =?us-ascii?Q?ZmTk4L5ot9uU+SPCgkus3w7xJ1Uva9PUrOhX8Xt0jCIyKGnk5xd2LR7HdEt6?=
 =?us-ascii?Q?0r9GeosJp6yyedCL4CC566/D7bnKA9HBO+3Imq8vgEtxzicNhek8ZZeJarh1?=
 =?us-ascii?Q?SQtdF5GUagRx5rKrjYdLlUgbNWltHDMxIy6vkSbOPyW0bpCWUctrGGnDp06G?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb75eb99-ceb3-436b-83ee-08db93f777aa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:58:47.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y47zDpKHpdEAyQ6IJvsYaLgWoUPbOT2u6IQsmyjpvdHje8a+JrGLv7G+THpKi+uP8cf5eaF1LyPi97DxalaetQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-Proofpoint-GUID: HwvXRDp2NNjj6CumlJYEs-WahaJnpHTh
X-Proofpoint-ORIG-GUID: HwvXRDp2NNjj6CumlJYEs-WahaJnpHTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_06,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185463

From: Chen Qi <Qi.Chen@windriver.com>

This change sync the contents of this file with upstream's
ssh_config except for the locally added line
'Include /etc/ssh/ssh_config.d/*.conf'.

More specifically the ForwardXXX options are disabled by default,
this sync with what ssh_config(5) says about these two items.

In addition, the RSAAuthentication items are removed as they are v1 protocol.
See the contents of Changelog file in openssh project as below:
"""
commit bfe19197a92b7916f64a121fbd3c179abf15e218
Author: Darren Tucker <dtucker@dtucker.net>
Date:   Fri Jul 2 15:43:28 2021 +1000

    Remove now-unused SSHv1 enums.

    sRhostsRSAAuthentication and sRSAAuthentication are protocol 1 options
    and are no longer used.
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh/ssh_config | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
index ca70f37375..cb2774a163 100644
--- a/meta/recipes-connectivity/openssh/openssh/ssh_config
+++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
@@ -19,11 +19,9 @@
 
 Include /etc/ssh/ssh_config.d/*.conf
 
-Host *
-  ForwardAgent yes
-  ForwardX11 yes
-#   RhostsRSAAuthentication no
-#   RSAAuthentication yes
+# Host *
+#   ForwardAgent no
+#   ForwardX11 no
 #   PasswordAuthentication yes
 #   HostbasedAuthentication no
 #   GSSAPIAuthentication no
-- 
2.40.0


