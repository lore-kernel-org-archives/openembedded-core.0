Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4131EC02188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:38:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.102])
 by mx.groups.io with SMTP id smtpd.web10.48044.1736869106533705878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=B0CRy4Iv;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ippobShELnt/UHOVY6eVhENMIi/GmWomvajtfa/AQKeXelbxejrdamlsTJvCx5+zgJ4FY2zKdGHEseGgH/CkdNhXYxIrcDonAHUgBieumZrZexhbNeCy2Ucyvtlg1sa2a1TfEG1a9N7AJmcn4TKKXC+8wnlsRZTXeTFbzG98axzZnq8iwg4o0qmQMOWhaYALQyEdOgcVKf8Qm3bxnA/bncUnLx2mPhtAyYxif+TpXWzvL/EqbUMpK9oWXiCV/ZHzClsiFFVd2pW2YSp99PLBJo/L0MQ96YlmvJYLi9y84s6FWStZE8Swo4KO03mTWx6f9mkS5LRgMzzcs9yjtLuJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKx2DUdG54iIWZk9QEQ2ViDFZ6Fnmfs0xC3fS0nnVW8=;
 b=pOICy5X76T47sRzw6QGcrgqr4Tvfea+DSga+tWbFUyt2bGG+n5a5hmBPnGRu+gQ6GuVgOxOIq5CGU3QSK6s0NKy+Rjk5WcUIAcI8D9Tzw0WkZPJhXCkshx5qvdDweT+a1G14hKzeZkLY3MvVHoqig8pScR/5HPVMg+tCGivOXBDLgm1VdULV4qd4ruWF4W5QRXfOV3O+vTzZDfS4dA6ohrQGUrY8gfyF30U6djM2LPwJyGujV18G57+w/Z6osLRLlzPGRjpEkVhHbYj/MmKfBMU53lvgzx8IcE8jijDYlRGZPQRTUl9Cd7HKUB6G07Zyzo8K95IN6zubL+f6Pf105Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKx2DUdG54iIWZk9QEQ2ViDFZ6Fnmfs0xC3fS0nnVW8=;
 b=B0CRy4IvKUA+cvNA/IHSxR6uByWVJXVwR7cJtkygOCa/FUMF1hxm03JBiBXHDsZTNTmSzikamhn3Zw7u1oqfPu0LEYjNLhLJccShPj/D1L7rb4zLjqHHM3jyb4diESH0D6ewcanBiTk1YSiR2mzQzCyPiOm/QEKHMffzkxmNRzDRqSVycLw2oFMghna8m+n8Y96KeRbh9ys/R1wYIRszCCSS17tOZRQ7WE2BIrbkkgImQ45Zw/mdvnX8waNjCZ09Ji/YnigMdHdIOxDxWI1MFE9y/fCF8weDkv5LI/6U3D3Ok5sMSWKQpaYG6QLMKyEazoh27UWvynT2JEHaIBa+rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:38:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:38:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/5] vex.bbclass: Cease forced symlink creation
Date: Tue, 14 Jan 2025 15:37:45 +0000
Message-ID: <20250114153748.2358116-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114153748.2358116-1-niko.mauno@vaisala.com>
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2b6d1d-b7de-4f1a-9d80-08dd34b17952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A4qAChGFDwD9pdZ3GUfgzVtMcIldYC1nP+VMSPTWxmtLfChEPtwu/yWFKFRr?=
 =?us-ascii?Q?5ZIK3GW7aR352V+sXTGupckbvOvFH/RmAsr1st/WNyaG17yXow9fLd/wNvOY?=
 =?us-ascii?Q?EJBlmHHqdA2Kmw+/q3vSvljLXMxd1mVb15DA5TIA73KdRGfOgE2MKOggLj7U?=
 =?us-ascii?Q?Nu91FuUTTT9pAeSoxYcrzTWQwpUNgyrd38ZwN6tdB3gLGR4OIV41U52FwQdR?=
 =?us-ascii?Q?rkwe3v8oXy0Di5CmE1DP6JseU0rWXFujJke8PzWuxo579K9aG/ILeud42PIN?=
 =?us-ascii?Q?1JUemg1bP9pO+osXRC8ghvSxtOQXChXvOaOVcb4bef/8u74+7+VL60uCHXRd?=
 =?us-ascii?Q?jUUj1RkK20+4o+1I/rFDeQX/QPdFsyOSiBb1obwvFLUnXCnseGuVcM0OsJQt?=
 =?us-ascii?Q?yv6mFzFDmjTDeB124OoCM3VgJADbrP72kVM48kXoAT30pQLgSLKVjR7xg9VF?=
 =?us-ascii?Q?gFdm832cVyhb37VYqOHbHvKIJRxsKYK4uYGjWkClSeeocvSLIHEtBdofZcy2?=
 =?us-ascii?Q?Hh8apT21b64G7OXYSCqgAW9J11Yo3rIRzv+NzQtc1yjImISoM44rS9FytilE?=
 =?us-ascii?Q?WZMm7MOYpt0OEUgUb5YZa0tff6/eG3++RLb50gXIeQaLEyxewTNuGVxe/Dir?=
 =?us-ascii?Q?CWLdjwEy61q/SFwClfutWG1qffrW2YFKwR5MGYG09toC8+kBqE2pRvs1ZXBM?=
 =?us-ascii?Q?Q+ycXRV+RcvKjhMZKOaR1wleMwKKR0Gqv95c3S84JReaggupMhfwzvKfbger?=
 =?us-ascii?Q?J7ntpcbsWu/uMgoC+rQGVY2Owt9B7P2GwvvQ3SS2yHBRTVqbF1tQKXjdxlnD?=
 =?us-ascii?Q?XCxrMKRP+dmibijWZKrbuTojPq4cthhsz5ykN2ZSbfNeSFreVyB9L1eBFN3y?=
 =?us-ascii?Q?oPCSxLdVdbViPAQSvDbir8TeMUlGAk5AAhiR8vCu057e7vUCya/TC4VXF23G?=
 =?us-ascii?Q?HZMlhoFTtXDJACvnynO4H7Jz1kI1LLtOZm+XZvt1vPqwMH4QSY7gucpYyjqy?=
 =?us-ascii?Q?ULyUABYJWH7el7TmckpMIzhfOIrm3poCCzV7NJwu2ALyxVK3cWq12qWsL0ag?=
 =?us-ascii?Q?+iMgOZxDkTxwJMlEirY7pIHONIl0FPXgSCmUadv20Y1S6WJ2j1F5e+SXdIr5?=
 =?us-ascii?Q?/1UvysWUsnroQha+LBJxdhgAq8Agx3YvHiCAGDYf6ddE38GwhxTGK8HBIZhv?=
 =?us-ascii?Q?Gi64lpW9okVV4AmPDRA/V1LI1JkqwkfqSrbCH7ujIdNCDkLQnEpyjpHShMii?=
 =?us-ascii?Q?iKZuY4ffSFlOQj08QCFMW8c2Pnqi4NpLhtVhbMgJGyycfMsGL0uKoWEl5AkG?=
 =?us-ascii?Q?YP/glGH/LaLAxt7AbcF9MPaVmfPbtZ0rreqgmiaKDzXla75knvGh1ycn8q/F?=
 =?us-ascii?Q?t0CNLXbBc9S+IwuPACHQT5aialhBgFRUReVgVs0HcDED9ZVRU1nrb39Ezvx3?=
 =?us-ascii?Q?fXRfSnhfPPmuyf1Do+Z8XLqpbv2T/gab?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O6DOeMLHPF1xxuMqd0uSliLEgyPlwFyISuoMoloMaZh25xae5eEMFuLGR3Uq?=
 =?us-ascii?Q?BMo+qJ2mI7+pM51FU5wTXhZL2BggWlYaP7m3aM5eKiWtCeMna8+S0rXqDB7z?=
 =?us-ascii?Q?EEkKdxsxRhJ2HiOxQqtyj5hAMdjyPDyEpO56+zvqD2q+Dn3jD9qz054VjxpC?=
 =?us-ascii?Q?Z+T5LnAQRGqgnV+qi39tQkWXM5dHFZwR45rdo5IBSV1nm/RqxQ4tt6HwqH/e?=
 =?us-ascii?Q?v8RPXK5uK6UIrE5mgn5+WZR7V83mT/5f64uB9IF38SnkGSP5MPyGep1Ftrc3?=
 =?us-ascii?Q?62a5BaO0kEsR0A//pK1IQhj1zO1NbKp5IeKq8nI+7L/t+gpD37xXzZvDL00I?=
 =?us-ascii?Q?gu/mS6D+Pt6/yi6pHmQOjVg1ThDyhtndHueuj8GdTyNwFnuCYoiRQxzxzdnl?=
 =?us-ascii?Q?rw1spIQiDiqLpiIRU6pj9EGzQWhZeskJUKeRVENGP9gf4xXSLIsZQLcRXoRR?=
 =?us-ascii?Q?IwKMmNPfqt5bNh9RL0xERrCRgf9ImS6bJzG+k9Uq13aSIKYXZJ0/ofFB62+7?=
 =?us-ascii?Q?GVZRn1oRP/K8T3o1wdVjVqlEtSMJoqk2jubjXlEoZITLVjPiDR0I+IXbL5qv?=
 =?us-ascii?Q?NihIfPArPN99yW4krm+ia7K9I4mTI9xo5P8cX84OwHFE8RJLpt5cFNpDc7ii?=
 =?us-ascii?Q?/YYE5fxRIJW3Mz/4hOKeTZP78inZV5+fX34YZD0n50XxO8JIFKahuEor8SVY?=
 =?us-ascii?Q?A/e2y5ohK5WYASix9hqqB6dvmEyRspULqUQEszdt86SasRPyKR7tnQk+36hg?=
 =?us-ascii?Q?8HFfCJ5KHpdqyd+FXzCnCPqes51HwdCVoMTDPV8t9Zkd9BLQ1a/KRb+Y3LBs?=
 =?us-ascii?Q?9ylL/fq5ujHUjmA7QwMye6G3nl7KNOH6tpUoSMZiQMbY2NOCTxICqbhtTnUL?=
 =?us-ascii?Q?nVVcIoobhb+Qi5SUtGptvHtkIgNX8qtt/f+hyXHI4KWSH3U2PXtOH40+KrxC?=
 =?us-ascii?Q?4X8LVJWSs7cu29GcmmsEG3lKtJ3kbS7WNlcwc70paq6H6OjFqjPh/bIJc3o6?=
 =?us-ascii?Q?Ov3yyfrbzpAA2C8Fbq6LQUa7LVLWDtuY/0vKzX/EorbSy7rEhEGr3X9/EYkZ?=
 =?us-ascii?Q?TOhmUdk/WbRMgE908U3sNbeaAkDag67Sfq+LGW5+kBviLS4cyziMG3YFshC7?=
 =?us-ascii?Q?haikxb7BUBrHRnRP0T/U8ots31oj+bukQvBJc1+Gxg2mc6RcuSj8GnaIfM98?=
 =?us-ascii?Q?pzlvcs8tmm07HIA2aQxHI7ptO3QKAyBZh7pD2hmpeVkRNKLEw41abaavn+9m?=
 =?us-ascii?Q?560ILIbx3tJtHfi0ebd7T+fDBH6vwf7atDHmgPAvIHRsAP841CEAACoObn43?=
 =?us-ascii?Q?9UU3e6KjL+e5gaKivVPEyAOiSMQBQrMdLQFsQ3BA3/enk3kn/HkSX/fQlosQ?=
 =?us-ascii?Q?ScMu9TlKYR7Pk8qLeSZA7oHHm9Mx8BlavFTaBoRXSmdtTIiSyKm5mhjaUEvV?=
 =?us-ascii?Q?F3k3Sbe4xVHJ/XmcXRP7TS1Nq2ZJAKjSyx0ODOhNGCXoGV51xttTZ52IoaYM?=
 =?us-ascii?Q?p87rU96NI2/omieGtHVXOHg0fE54Q0UgDfmgdoooYu+fAUgJkirP3A3beza+?=
 =?us-ascii?Q?Hbq3wrBJjnJjyYFj4VbLp9YXPBEvrHF6CM39wj4FL0H1g/9x8wfJwbtcCS/f?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2b6d1d-b7de-4f1a-9d80-08dd34b17952
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:38:20.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCPcNvTqfEUS70rL9oZEZtWvdgG3qC5qiOnUZMeB/4yUJdcX2HQGLpAg+VWoi0ALZUNozhWvI0udmCJOqw9orw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209805

Allow the method to work also when the user has overridden
IMAGE_LINK_NAME value as empty string.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/vex.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index c9749d4ceb..3719e5c222 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,13 +211,15 @@ python vex_write_rootfs_manifest () {
=20
     d.setVar("PN", save_pn)
=20
-    link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
     manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
=20
     with open(manifest_name, "w") as f:
         json.dump(json_data, f, indent=3D2)
=20
-    update_symlinks(manifest_name, link_path)
+    if link_name:
+        link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
+        update_symlinks(manifest_name, link_path)
+
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
=20
--=20
2.39.5


