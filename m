Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A758C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:18:13 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.88])
 by mx.groups.io with SMTP id smtpd.web12.12556.1644509887047822028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=O44+kSLp;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGNRh660ABMdQqVWFKyGqcJWgXd1xrtK5Em3hrxq7YBWukRa07O81lbW6EVFivN4YKCy8tvLUVaYCe/poVLeZcE0HtV25g03xERH3FcUNZoo/uW+MU55MAWysVn/YMhYWd4U30HPCstrljIzRjdJ8/+CJseGD5BbBvjfOrJanLuPFX8wgTDnCj+5u/8P9l6lDZZUp9DPUPYk/N/0iEQJPNcbZ8ltVljEA7vJeLIseJzelojvyVgvSZyjL+XAB9TqgNxPJFjs85w81aseIkC8QTCdbGAqNUwdL10aws3b2HnGUjYskX8lkYFfDV/MyKAZAA5ZTihro9iqMXo9lwDJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DGXJpVQ97uM+resQBPpm+1cwS9/xBxAwnxEGjR++G0=;
 b=Y/ExtDxKc4JkM1MGGuOKlshaa9BKEJt8Me+KnpFW238moAJUervFO0wmXcLywDMVoIRWu382DUTBAoVRbcWl5ek92b1HsE2NFHsRMBS+XUPHBS3TrvbWdVMlxSm9deY1T2oYa1fHzl7aOHT8/iDW6vFPNKHWTJyzWl0/p9GPALU3jcPH8bmvrCXxKBdF0HxffUNLxYnVCWTAWkuO2vwcjN2vZt3p9ZIbGGY4zXQUJ861gwKCcUkUBN9+2Z3eotLY0sil0mIa5ztqqgw/Se94h6WHD9v31mO9Rm/mTdAuO9YhGvkNUrnyg7suz/cvt3GbEPeaCEt79Ewns70Rq+ZgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DGXJpVQ97uM+resQBPpm+1cwS9/xBxAwnxEGjR++G0=;
 b=O44+kSLpIEwhx4aKObh7u2IwzvOFccTOf5m1RCpb8LFZujQC3E5MTMUp+5+PUu8t7cZj/T5mt4ejHbsx+F/Okicvm+AKZAm1VOSswI9AfQKXm+amn/9UkL+A4ZTgv+7aLVBSpV/7f7QqMM7UcwnvMQvWaPT1LGDcvMQtgAhEUhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB5501.eurprd08.prod.outlook.com (2603:10a6:803:138::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 16:18:04 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.018; Thu, 10 Feb 2022
 16:18:04 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 4/4] selftest: wic: Add rawcopy plugin unpack test
Date: Thu, 10 Feb 2022 17:17:38 +0100
Message-ID: 
 <20220210161738.17989-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220210161738.17989-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::15) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd5c86b-7c83-4925-4446-08d9ecb0eac6
X-MS-TrafficTypeDiagnostic: VI1PR08MB5501:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5501226D5352CDB0DCD89D60D72F9@VI1PR08MB5501.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a+vjwHHV4847DQMITabPgHcia0XyMkelTOuP/otIjZq4fax5xFdLFBldQ0AhD1diEZUIn0PLi6mX6X5ptr+vzU4nOmUJWOjUpYPVe/CR8IKNuXVgdEEMtkpRaVWBcIIrYT5bd110cmg4FFkEqybACa5kEpXWMFUsiZyiVtDZFDg1+qI9jIm+bwkdhzWkdaYEQUND3tdvjLHkerssFR2JMHjTbas8viKXaCjvydnRJ0sCpN8EwFqH8d9LIe1AgaOM8SCT/ER7Qd8Zbnivlsji8elKFsMyJl1mPFeInPKnomdI6DncIhd6u4fdyVs4RT9Azl/uXG1rEJNvISnOezw8l1DoU96cC2OE+8CHIZ8toBNMoupAqZRib9h4fQVD7iT+nN8NYdMx9eb5HQIdrRVxP8XQy/ejdD7FozTvCdgwO8feFViSS0iRTmzgSZoF9Ds8Ri/2XL5Ub68qgf4p7/91Yf6c0aWfTAhr+vYUfa9Bl/Wf67HZZfhCP836BCpBpniRvyIz4sBJ6V8rf8/Nb8gi5wyn0t/jDNav+Qjb4/ezdQozl3/Z4GUNrKZF+s6IrEdFiuBmid+4cFabgIH6ELoU1Enz/bxVt7x5bB3g2/uQpeeUzOH6ChF+Ad5gD2yQUJfbieMHGKabNGWzRXUWnCXerDy3W2NdQxwFwGpYzs6th8caxxfjNCdFIuDJASe4EBpTw1WQ7b19VVtNYhfVUqanxg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(5660300002)(38100700002)(6666004)(1076003)(316002)(38350700002)(6916009)(2906002)(4326008)(508600001)(8936002)(107886003)(86362001)(66476007)(66556008)(66946007)(36756003)(83380400001)(6512007)(26005)(6486002)(8676002)(52116002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bzBemSKIb7smTyf9NeIPCVHQoBbSZujfcB98sJWNNfnlzBtTBftIV5r4AsED?=
 =?us-ascii?Q?p6RbGZq+Y4p64vF5on2eY+u7uaKei84F/PP/V6VS0v5TnX/11dTC+a9T/w1w?=
 =?us-ascii?Q?IwyjeDEGFyFCn3HqV3MmYeol2rBGKyCodXmVOXDZJKg58GO/pDlo0c1oRWIf?=
 =?us-ascii?Q?Qhakqi1rmL61nQ5q6mgwyMxZdYm2irprg+XvW0P3/5WoSGk2rzA9C563wcAM?=
 =?us-ascii?Q?S2/J1RUP6tqLt1bU6tGblLazZyYbTfNPLOGz64zW8fcDdUDAHevp+HX6yF+J?=
 =?us-ascii?Q?GxzAjjxQ1SFgEmPgHlmfA3KyaxwN006bcbmQFsmfFele5Wdn1eTunOl5LNF3?=
 =?us-ascii?Q?//axxd4oKeJHIawMMSPZ3eyMgGfYRsaeJDecLMuDXcutBXJBOHLwxyw7WsP9?=
 =?us-ascii?Q?Nl0DJjV9Iiq2dHDv789zUy4Nr8ruQ5ld66yi5m97oie+qVziDfMWPCIZakRZ?=
 =?us-ascii?Q?uFl4mZxU6ewtZuukp5T2Ox+3xBi85LPF2phjAcsF0T4/4v9imf7cV8E/uAmT?=
 =?us-ascii?Q?qin36HBHB/Ra8L7imnpnoyLVCOEgN3h/mEGC7AzFWD9woZdakjearVUEHYux?=
 =?us-ascii?Q?wUUi9wyD9zrV7Mi6EbIHRL7XOx2cnba5Jb1ehj6CSipJZky8SnV52/R2TGWH?=
 =?us-ascii?Q?WF8dOB5+lNXNRrJ2Tl1QeHelVXLLQe5mGCGI0kkmclqUIMK20qENxDGQmz8c?=
 =?us-ascii?Q?Xpw1ahaPnl46k+MwOE+Kr9iB+eOUbcoFPlbNW2HZ6QtYUqSDt1GOBGeD2JNr?=
 =?us-ascii?Q?mW9eZp+JhvpFXJQnHQClJ7nKxiJ6EOYWwnuaIPWcyGFYbMD54OnMs98qzi2R?=
 =?us-ascii?Q?1khbfAdhiUEtuJR6R1wQmfVqI5udfoFD4y8NnZS0EBlK9g52sCBdPZzWZ2pC?=
 =?us-ascii?Q?dMQJoe9N/fJJey1WvJIn3nS0AYR7ioG+LRZxQ8qzKDv0URG6/ZKtZ5Z4lN6N?=
 =?us-ascii?Q?Eo2V9MzVlF1a+WRnyND+U2EN4cvhbUciJK6+hAxV+Fi/J5a9lcfVKtg/063K?=
 =?us-ascii?Q?k3YbEPIxHwThBVFwdG15wIhC52OoIp/j4SMfIOwwdSD2duVIBmaStzRxCMcs?=
 =?us-ascii?Q?RbbpgjDhpMajotUIlSUKtKI+GDFZZFBINF/dHAF7on8sILY7JmaWIIWK4dAw?=
 =?us-ascii?Q?8KAcJbUvrvD+/GbqR7qvFD9hvAHGsiwdUcuX6B/XLT2ZgUX7Y7DcaKc8vf+W?=
 =?us-ascii?Q?5rsBwehhN5qABOIlCwpw8CGnhF0nlP04VdREY9YD+FAzuU+UWUJIK3vVuwxd?=
 =?us-ascii?Q?NU4Bw9Lg+JXpFpzcctkvYEA2qNoszJoJhBL78UqkkPZLSS1KQO3GtTWMZanD?=
 =?us-ascii?Q?WvMQVHzima2ycPSUuRs7s3t9SYb6gF9ceaZX2HnPzTPbpajBtz1eAZURKbwq?=
 =?us-ascii?Q?YR0fEvDeDc+awV6jWMcSeZjP8evys28gluXx3wvnWc0qP+1B3wnrBlg5fh+W?=
 =?us-ascii?Q?8fqJwuBO22fSRp3jvQpl0Fw1+clAVss1RSkjQ+YsHFI6QCPW1UXy8FsWNHBA?=
 =?us-ascii?Q?2gB+Pzhw568F6doq1SwXfRTGg2+xiOicaHpCtOIeVvMFulXmcOaXspUBmn1v?=
 =?us-ascii?Q?e8DP2ldKsiGBoQ0d3H72siXX8iFvPBhN92LpLZUywYB2XMmKuATy/mERwkbX?=
 =?us-ascii?Q?LkTfsrYIeILI6qwyU+rARXs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4dd5c86b-7c83-4925-4446-08d9ecb0eac6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 16:18:04.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m38umg3UvXBdwVwFkMzxL0e9YdCDlPvCtevrKSRYZuC/LMKvK7PeVcDVEO4ikTbToC6Rqo7MUs4Jg09yiaMj3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:18:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161620

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/lib/oeqa/selftest/cases/wic.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 96b3e1b6a5..a021f8d84b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1065,13 +1065,14 @@ class Wic2(WicTestCase):
             self.assertEqual(1, status, 'Failed to run command "%s": %s' %=
 (cmd, output))
             self.assertEqual(output, '2')
=20
-    def test_rawcopy_plugin(self):
+    def _rawcopy_plugin(self, fstype):
         """Test rawcopy plugin"""
         img =3D 'core-image-minimal'
         machine =3D get_bb_var('MACHINE', img)
+        params =3D ',unpack' if fstype.endswith('.gz') else ''
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.ext4"\n'\
-                      % (img, machine))
+            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.%s%s"\n'\
+                      % (img, machine, fstype, params))
             wks.flush()
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
             runCmd(cmd)
@@ -1079,6 +1080,17 @@ class Wic2(WicTestCase):
             out =3D glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
=20
+    def test_rawcopy_plugin(self):
+        self._rawcopy_plugin('ext4')
+
+    def test_rawcopy_plugin_unpack(self):
+        fstype =3D 'ext4.gz'
+        config =3D 'IMAGE_FSTYPES =3D "%s"\n' % fstype
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
+        self._rawcopy_plugin(fstype)
+
     def test_empty_plugin(self):
         """Test empty plugin"""
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "test_empty_plug=
in.wks"\n'
--=20
2.30.2


