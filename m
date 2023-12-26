Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2615C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 04:45:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.74735.1703565918468323657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Dec 2023 20:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=strIp/ks;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=072462814e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BQ4e15e001640
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 20:45:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=r9ZpWLd/7FseMc+EKt
	qJu7pv2Kv5CmEvPiuf2Rjng8o=; b=strIp/ksbCblksiI671EdMJzBAq0o4n6Dr
	Qqkpq94gyFCu//tj//+Fv46+/dfjWjKARes2tmOx2hvWbVqyg45qkvOZv0ASKTdZ
	GYSbPljO7kwh+i9goUkQdoaeDJM4DhI8izJN/QB0kE/cc4dOfQS5lZ1j/gldfg6i
	bIPdAixJmEz9+fkLPgwZKua+5eodXJwYwR9CW+yd65uMReQ2hmFnz9bj7esjX3Cy
	N+UgW7BnCYZlGYYy4BRaBko9JSGQ6ahL2vPEyMnfWpfP0r/jY05H+OHOZokEKEo/
	0jdzl4sxX0vjXbdptTfvBM9mmXR4aP0OTgJNWlngJmAi281qxurA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4hvdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Dec 2023 20:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWE4NdiJWDg/bnzned67YM5n/PGn8dLSq2iI/UtzwqmJ8uy40rtF1HqshoUhu//UR0NAMyHndbKmB9jgk35vXriKtaPAvI2kG2Nzzv2aaErce+0vz9GeV7wjtkuna3gNSXHTMo/APTMNEwUPZI3l6VmvpdoeYbxOFdm7LHxyO5bapCTQMuPq9kF0Y5Bo6AP/iyTMGHIlpCDaVHzDJEXR44bJKTmLn9agbaCO2AjLFYz9qiiJR3bnU0IesQRcJvhC8lO78XlE2Uy7lTQXpKU88nMgx/qDFMI3QULW6muo7hK1vGJsqu7lF8cpou3zM2IaAi0QFZfQ/+dQG6Ao7S2s9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9ZpWLd/7FseMc+EKtqJu7pv2Kv5CmEvPiuf2Rjng8o=;
 b=d6aNKxfLuF8bhhO7Lb973WrVKY5v3/bOq1eBUHIykldtYFEoq0B6aSnIgi/LzZfAkNOlf/kMcvKTX0MHNPY2rcEMTBxBmbqjqeBPDEt6iYAYqLVyEI25XGGOMahZ5QBovNG0c8n+I8jAniSEIdq9hIUGEP219REvu9N3kxf0b/c64GUjd7uUm2FzzDGyOp7bkSByufryAU/H/Z9qhJDf4QbKUU9fm2DGjAJHj++yLhVcQ2eKG15TJGirvg8gtRHmS3kmWBuYbI0Xyb/4WYdlJg4J+wmN+N+SZ15uzsFUvoygjWT6KYzrOzE7q7JTsi7VeyQqdvO4W64NjGPVkYhyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Tue, 26 Dec
 2023 04:45:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.7113.027; Tue, 26 Dec 2023
 04:45:13 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] devtool/standard: avoid KeyError
Date: Tue, 26 Dec 2023 12:44:57 +0800
Message-Id: <20231226044457.3699093-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7b95cf-0745-4179-39ee-08dc05cd72a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lKy6zNEbn9AkXYn7bGFywRxz1mHvStZ6ilToKbLrL5gCT5GctjkIJEdjNQiwG00NMPbXtcSWBGa8KEry+tSKyYvg4Jc6J0YkfbHaauDjZn1gPqpiipkz72ZaFe7JyH5mhQkBYHKmqq+jJ8jszPNXu9KPa7LF6i/M+A9L1Tv3H3CH7VF291TDuJj6/lcKAypBCB6RG4EJvShsXxjrCYEWiMEnPfdqQ/zGa7U9Tc4Ok6PM8DEmgFbSdUPEC/ydC0bdOPWq0dZP3wpdqDlH3/gQdV2NQCkaMY5xdH3L7JE1aXQM3CJgc/sdQbrTb9c6eGbg7UMeTKwnyP5Uu+fiMt3ILLkSzjbGN1fZ8+yuM/IovK/+FbhzmML4Dr2O20LgcYarDKwCci05tvnuCDvkZfzN1IPzU8TfHGjr/1lSTtMvkv3fXNMv9teMh1vqP+0BT/THaVAmfVDHMU7sI+RBNzFyXykoUssR+rcEg8U6DdNDYsAIb11xPtOlRPGLhvOsZYp2abxavf8g4q7C88wsAbhBERs8i2AipLAon8MYA365kwYijua+HecR0z8OKU6K2JqNvyovE59B/eg/IZUbSxi/UNCw9rzJ+OxGfta6bMmAevT+dOxlJhgUkuEu73eeC1kE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39850400004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8676002)(8936002)(5660300002)(2906002)(4744005)(478600001)(52116002)(9686003)(66556008)(6666004)(66946007)(6506007)(6512007)(66476007)(316002)(6916009)(6486002)(41300700001)(38350700005)(38100700002)(36756003)(2616005)(26005)(1076003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uU2hGECKF1Vaewn2PQYetHplgHbZkaoQ52iVCRlScT0Z0TYdsZGrwbbgM8WV?=
 =?us-ascii?Q?zs49y9YADAq9KJ6KOuPcO/7rh6drortZe8qUYBd6QBRTAW6Ks1o+PTM/o2V7?=
 =?us-ascii?Q?PFaQgY1/YZ9/mUMqfe2+kFEtlNnzK85J9BpNc95LaRAlegs9WgkYWC9ju1QS?=
 =?us-ascii?Q?V5lviH3aMYidiNGZs8zQWCLiAdaqCqROPb9NCMcvOe/auxXKkuKD59A3Scei?=
 =?us-ascii?Q?x89dFgzwnvcu7J/Jo93WSOxuS3T9hwgtDVRtA0FCrDvUbNlFNaLgx/YYnUfy?=
 =?us-ascii?Q?CieXEbTcHX85iFyw3uVVyv0IZ7S15Gv4SOvR/4sMLD7bYAsJm0vH4YDBUcKg?=
 =?us-ascii?Q?R4OkhXAb63LF6v51PzyJUWHcieHKofcJR8A2hOAVamSl22G2JYc5AbOHbK/X?=
 =?us-ascii?Q?ax6zRgLX62xtiBKGfFOw6Ofr81PWmlVR+U3dHG50OVfgMcWqzInZkOZR1DGv?=
 =?us-ascii?Q?amse6aYFxdEq2MkMqsrzAJyhZw1sawCZcRFkqBe8tCOzb39VYNuJ/YW4JYNr?=
 =?us-ascii?Q?n6eBnIL6XPrrSV9rV8wGKaXPtN//RTnChlQvciRvLJ6Mv0DKxa2DIGN0Kvbf?=
 =?us-ascii?Q?Mj6BKRN5Vbt98Hb8+ClS+HW4xLzULs3BJQdwcjdAZJriLGDEsdMABf2URGOj?=
 =?us-ascii?Q?zTK0V84HQD7b6uDC3X87+9nLD9k3TudHfFsoMOdhGIYupFukFJ21cJERsgA6?=
 =?us-ascii?Q?hkLPA2zb3JTnwmWhNyektzRgUAqZgUgaVIyQvbVjyTZyewRmZpmzigpU9A+w?=
 =?us-ascii?Q?QDiSF9Lmeb1WOkvPyfbTCibaiOiafzFcm/Du9qqaoL72nurb5FtD2j7qYs2E?=
 =?us-ascii?Q?6n1ph0fIq784FhdwuMmy9zHhJrSw1+SWiOazpcIC9Uckn/KCWPYV34k/sxgH?=
 =?us-ascii?Q?4FxLvx0PCY4z0lTF11pNx3SaJfMQa/Oy6kQ4Jk/Uby8sVcDfIaojVoikjSVF?=
 =?us-ascii?Q?zHIeGxly4IP5eogvJgjAsodxgEHixxyjJ3TUstxPSj/76TD7blas4Rs/2p85?=
 =?us-ascii?Q?wyuwZ5aW2Ts3I0NWj0OhujTgiAPm7Zn4VKCG4gcQtEIVoZFijz7a5a3EIG9w?=
 =?us-ascii?Q?wi1pVm7kxV77L38wasj10DhPVLv6hOLntZdoQcFQrEmOjJdiQPReNW/TsEgb?=
 =?us-ascii?Q?yKvcb6zxPv9vbgN+MyQBQol3hnwXYhr53ook+qXgAfp0KZf2g1TiawsYJQDi?=
 =?us-ascii?Q?MxLftgzsrqU/2/buJWVhm5foWaCTUgkvpCoIy/8qFegwKNXD8XRxU9ztOzkL?=
 =?us-ascii?Q?e9BBolH7uSgaWD5KlWerAYczZyS+fc1W9V/mQm9RyGmDQwxYzc3HCtwY+DJS?=
 =?us-ascii?Q?LmgKUWzX/StyBpKtitzLLRadmXF7cq3pV29pVT29499cJohcePhrru/8vmuC?=
 =?us-ascii?Q?U4hGYMpsV8+sbkU8IbMZjvbjbWepELTEUCUwnv2eJ3pSXEbx6PTdcbkNl4xY?=
 =?us-ascii?Q?PKy40L0aeH9SCZzpu+4XstPfuRDn1dqzAMF1jNy9QhucN9ydyrlJFel+HQyd?=
 =?us-ascii?Q?ZALXjdlbqo5SwiswfbFuBFM+TDQLzTC8XCYR0xlgI5WUDab/7BZWjAXhJbu9?=
 =?us-ascii?Q?TH42AwRQ3wJMO/ktS8EaTsWu8oO/G8AOjvIl7ZDb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7b95cf-0745-4179-39ee-08dc05cd72a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 04:45:13.2705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfS9t136eR3Fi/oPjNPFjkwJ/d7O9THJnyykj4ozF4XzhuPm9bgwqnbxEkxR8Xfh9GmXQsEg6786uFtPJdtgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
X-Proofpoint-GUID: jQegsYZiXCWmn3Zz31kqKu_dIn4soTB8
X-Proofpoint-ORIG-GUID: jQegsYZiXCWmn3Zz31kqKu_dIn4soTB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=740 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 04:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192906

From: Chen Qi <Qi.Chen@windriver.com>

The initial_revs["."] does not have an initial value, resulting
in the following error:

  KeyError: '.'

The problem could be reproduced by running:

  devtool modify -n systemd </path/to/my/local/systemd/repo>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 559fd45676..5d9b86ed6a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -905,6 +905,7 @@ def modify(args, config, basepath, workspace):
                     (stdout, _) = bb.process.run('git rev-list --reverse devtool-base..HEAD', cwd=submodule_path)
                     commits[submodule] = stdout.split()
         else:
+            initial_revs["."] = None
             if os.path.exists(os.path.join(srctree, '.git')):
                 # Check if it's a tree previously extracted by us. This is done
                 # by ensuring that devtool-base and args.branch (devtool) exist.
-- 
2.34.1


