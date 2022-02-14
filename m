Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630D3C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 15:45:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.35436.1644853554743174786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 07:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=VrTZm8x7;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.51,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+HS8BP+QBdZMWzUMiJqsyal+zXMXtA2Ao7VXs8mddWnfB/iIHs28JbcSnLSaAMAtSJWfctv67XQKDkcsalwRwdoFDWDPQHSD797bYu4pM+rOqpuYL9VgxzMRm3JgXmvhk1M4NEWb6id7A3lh8OriqWbyNHCl5nK677jIGbPleuAD7JguGjUTRtt2QBGxfZJU89SRdUE2Z6yzZRMjebM3G2NIYrKmlsPHlaUMKRSWsbGdbUvmekMtnWxjwfF5//VHAm2ad4rxdLKWUjW2brRuxZ6f7KFVIrD94h7NcV/lZW7xjZIpIei44Rr4qZWDTeK7g/7urKie1mD+xQoMr5pLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9rxBzd+VfEGAbo6ymefkJZbUJY/YA3dLyrhDG2qqZg=;
 b=LPs+qvFn5AgJaUcaAe7evLJ0RHVAiUv0u4zRi6WiBaIwpnJAg2WjvgXyMriGGMPzKCVzLeH/xgf2aeyY8Ol4g6dXqps1Wr6WkZxlqqEi7kqB0KJ7w8hj3qvIGXp1k7sEgLNRQ7I4yzaVUsvc587aRKlhlER3fx2iVoCF6yN62Zp4QUvEv8VGpLLDJq82wPPpswWvDirHlc3rk+AvP8UcSqxDXEmn06Gp9lpZaXbW7Zz8VqxI/cPkmS9brdxfebNrO4S1QuhwdWz2Hyat198AKJawZycoE1MTRSBsaYbPCx5W26k3z43htj92M5NRXUQG8d8LJ5PQY7x+7iM4Yq703Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9rxBzd+VfEGAbo6ymefkJZbUJY/YA3dLyrhDG2qqZg=;
 b=VrTZm8x7Ukva8DMD6eFDGs2lJs3CA0PXFlS1mQN8XbwI4nRtyTCzUwk8J3J0OP05HH8cDteenio5A/Yx/jByqM7vdL9weoYrfwp0M+pTzOje+VFwa2IPltigSTw0oaOLPsMWI/Cw+tvVZjCEHFtKKOVFBDgaE9Puh+vjz04I4aQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB8PR08MB3929.eurprd08.prod.outlook.com (2603:10a6:10:ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Mon, 14 Feb
 2022 15:45:47 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 15:45:47 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 3/5] selftest: wic: Remove requirement of syslinux from
 test_rawcopy_plugin
Date: Mon, 14 Feb 2022 16:45:19 +0100
Message-ID: 
 <20220214154521.26905-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214154521.26905-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0257.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::11) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d6646a-8a0e-42ee-44a6-08d9efd110bb
X-MS-TrafficTypeDiagnostic: DB8PR08MB3929:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB3929E81BBA38E0642F846B69D7339@DB8PR08MB3929.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:211;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tGgKe0MX/aTKDIok2fqFCmr14y26SxFNIzlxRkPovbzcCRjFjfky5KaeOVekmr2olhu/JySZXihOvQtrTofSWaOSUYQxKY0F9Nqjtg8GNYEkA96FY78jKCCn5E0GapRDOAEt9uqBpWM+Iv773vzC7qeom25PF1LmuAJOJuKpL5PZfFjb4LVP5Dq0sps/DRHY6oeuowQ+ZYwwkwufBenVzjRJuIw0paVB/LDbacUGED8zg7YCbKkMyeec9MgOqbiOz/NfhQ+J/kUDZuVwPYYqRklwC64OISwvTImqfSiETI7rCAHSCRclpYZnaMuIOHjl8dfSQWItu48Pq6j5Oo25CO1QFzXwj5sM3zuXEyWqMUaUpxKz+vvmJ+DxuYX+0YRk6rrnnUMerO7w6chWxKySxdWLPR1FwipLVgNTqh3AsQWF5szzwHa5/3FyVY21yg/1yNWSn9cvt0ZiVq8aRM6Q5cWggwFunzfRllz049UaUxMfuklfpbl4D3ktpPZmYEmicohRzLupFb6/tDzBXT4YVxO+oIPdv656N4YSLayYGFMvbgf4k/uLtWix656vu1wjkSv/LRhjgiUYtPdF4XstjrkkWqhQm93pBViQUossmR88wwAYW/IBouJZtaFQYPSVvOvAU2a00XtGJ1Jg4vtMU/0oDssCrzmYRwtmSFZlC+uwUa6c36d0ExNcWKIFudfolPfb1T3xP2voWE+E7pa9bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38350700002)(36756003)(66946007)(316002)(38100700002)(2616005)(66556008)(66476007)(4326008)(6916009)(6486002)(107886003)(1076003)(186003)(26005)(6666004)(6512007)(2906002)(86362001)(508600001)(83380400001)(52116002)(5660300002)(8936002)(6506007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O8GFCV0ednKzd67Y8xnA88Y3rDIuQaTfZCyzOwuxrzwiua9RDEs8opQ0qMZu?=
 =?us-ascii?Q?fDO2KdIfqMSVPjqTHcwVAntbgioNYeFD0Nl0/8JocCTZKd5Sts438UC9qcbk?=
 =?us-ascii?Q?jTCUjimAILFYiGiYrY7KXhpRZQSAnz5IUhMGxRzks+1LEybDjXg0zz6mKkzE?=
 =?us-ascii?Q?Qpp/LuN8r5BV19AVayx97zCFckvHZeT9buqK8zi9aKCrKO1n493cUX40UGbQ?=
 =?us-ascii?Q?vJPJJIwGVz+BaCIelWz83vogGQg/m26EmpSgrYrXaUsGv1N9CD+aPeNZZ7Jp?=
 =?us-ascii?Q?9GDr6Yx6stKHzR4Enw5ROVkrYQFls28njgpsslEyybwRyLwsM2bYwuKqDvO2?=
 =?us-ascii?Q?67m1mL6rcKFM+t6BMcH1ADwPpbsqtpm31z56kfdCDdz1oSYUFVxmIaMlqroI?=
 =?us-ascii?Q?SGDRxetQi3RDYFcICFmtseY9XMEG4EZaAkifE53SNgkKjDXAF7Fsf45PDXOj?=
 =?us-ascii?Q?947wej8UKmQ7xS4caSwLe60gl5tx1aguuZqIONNe+CrMpoF9jstkdmfIBCGO?=
 =?us-ascii?Q?ANYXuBEp9Mmiln32Bipi4obzod/2DTz47smQrObso63zThQJzxRrxt32JuBm?=
 =?us-ascii?Q?lD7LIvFAfhq9DJvaF4R315z/g8UBn/7ZbOgPuSo4Hw/qkqOVissCIdO7eYtp?=
 =?us-ascii?Q?flgPqu+MOoWTWUFuGgcnDQu/cqQAA/nqzVPHpDj0+fi0RkI2h0iGW0qpI/US?=
 =?us-ascii?Q?y+VJFuXp6sDNhldKxFhPsWcEqCGtz942YDINq9f6U7f7SA8Cy7THE5+MgK+4?=
 =?us-ascii?Q?1CCgwsKk3wplKLCi782O9qBQrjWQfz2Eod8HFpmWkUabUv+Za65hdrz7h5Yv?=
 =?us-ascii?Q?BGbrs5iwfRXDMTwIfQRab+uPtifFvXx2olX3mwF7Ie8HF0kVNWZVdHfDw4ng?=
 =?us-ascii?Q?kkqlTg+cRZ20K7JUMYJxZQGQT+RXZvUgbJXgzm5fragvlnMMNTyAs4i24GsM?=
 =?us-ascii?Q?ZH/uL/WrSAIxlvIwmBkrN+xqz1+8uvjHeLj1SrnJsXRx16KgMQIim83FuaSN?=
 =?us-ascii?Q?lUpjJs8+N9k1xwqPHO7SG5zJC3rzQIw+5E34DzRLDehmyq3StbPC8CcN5Owl?=
 =?us-ascii?Q?yyxgFWExqBmQcdOYjQDsTDSmauHdGqJGve56vWvAijUeAUcli/QrwZaGCMt+?=
 =?us-ascii?Q?/VbJu+XjCCXd+La0qdq7lUQBX7tzWGQOD9aW6oQaWdEKcJOLnu9vgxj4meZE?=
 =?us-ascii?Q?vJXFfiCNVRtb7A97rxIZ2+ryjn47NlgiKS2K2x0r4KuZxkK3Mc+Srdt5jO6h?=
 =?us-ascii?Q?TsumaDlOqaHNL4xLxwicGeZl7ZBF2TfWSHvfkleDvqfKdjaok4i3bRZqp9ec?=
 =?us-ascii?Q?9QI4hI0SL/Xfdgf2GDw/SgLYJPIHiVXu4g9hBtW4vBm8ilesTblSMK353co1?=
 =?us-ascii?Q?RDfj3cGbGnU1Q23aTdVb4UTDgOc8QfvtzoxPWqrxDiNOaz4xmKKwnvHiZNwd?=
 =?us-ascii?Q?Un+PsyZ9tlcxMSbVejh3yFiKtUS2hez9pT3+vaSYHbofPoTYVE8N5TOcjlB1?=
 =?us-ascii?Q?urLPq7Q4CK3ayficgMHhg3DSmU3dXjU5WouuwIKbEPH/NoHY9hKgLmN044YP?=
 =?us-ascii?Q?MvXUhE4jTjVxXcFQh0YWgwBLf+TmxwVEdEgsi1hCIGm/8vLyVQOH1b2b0wkq?=
 =?us-ascii?Q?QhxAInNgQ6wRrlDOcc/nCLI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16d6646a-8a0e-42ee-44a6-08d9efd110bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:45:45.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KehtT34xyQukSzVTGfppMLZN51KI+FCZVLPL05xN1eWakYv2su+HuxdhGzDu0EKWZVPVpzP4AUeHuApRtfdehg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 15:45:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161716

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove bootimg-pcbios from wks to eliminate requirement of syslinux from
test_rawcopy_plugin to avoid the following error.

ERROR: Couldn't find correct bootimg_dir, exiting

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/wic.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 5fc8e65142..96b3e1b6a5 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1070,10 +1070,8 @@ class Wic2(WicTestCase):
         img =3D 'core-image-minimal'
         machine =3D get_bb_var('MACHINE', img)
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.writelines(['part /boot --active --source bootimg-pcbios\n=
',
-                            'part / --source rawcopy --sourceparams=3D"fil=
e=3D%s-%s.ext4" --use-uuid\n'\
-                             % (img, machine),
-                            'bootloader --timeout=3D0 --append=3D"console=
=3DttyS0,115200n8"\n'])
+            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.ext4"\n'\
+                      % (img, machine))
             wks.flush()
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
             runCmd(cmd)
--=20
2.30.2


