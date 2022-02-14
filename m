Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BF9C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 18:13:15 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web10.37911.1644862385167473379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 10:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=uBIQh4H6;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTxLxgDJJs7Xt3nN69i+eOLELHRAHCHzB5QTRAvFOeDDQ11SgLjh+wUfBTyDaaxpUazlKJwybp6jC7xLehlsmatNwwgcczRt6UepONJlhf8LsgGcDn7CUg9I7FTiM4TaXeA46Pm5mwXQPCRTRo9hLUfwZfWWGrYKRbjniFIpz3GbQSyJLfD0XcChsGFZiyIWb/r3cprH1OWzG4aAnIVNpdlMTCpTD8J3PYfcU+iQzso4ZYYep+Ri81HW3M2ZNz0kfV2AKJJ7aDgtsfAM5bwXG7BwUaT628MU9hJAlkddFHFGLljK2z6TwAMzAyrcOhjpYOprZpV93s1WefR2QMD+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H015rxYuTwdZuoUN7PPaClfU3RIT009aqZj3G6N0ba8=;
 b=icDVSfUElIQku43xBn34D03e7+ryLYT2dqa5xErRFwdpI7s87PZVfIPI/TflITAf0xR9kkn+Q31hRHSIhUIA+MVEB1RS6eVWFvgWkSyhWb4EClR5ik2zWhP/wLP8Aa2Lx+qecwWO8dcmRoA84loI2WsHdImnTPcjnDBSR/A82jHlJvKFgNkoE/zsJXmn8th21EwRtHdJn/lfwMSfzXjFucQhu63Wop+saX4zEWMyqFfqOOjQi93LUytAyFIOzSasOrxTnIf78t6fhxgeKzxlkjc8DI49VRFJVIY5F1qoIld9AfKNMriyv2GpU4ur1qWb3OURC+1VO8AQjoztlxeOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H015rxYuTwdZuoUN7PPaClfU3RIT009aqZj3G6N0ba8=;
 b=uBIQh4H6MtsjV+iUREO94SxC3VChdUbe5NPlnxxLi9tkS8aa+i9xD60z3eFSftk08pKAj0l4gPqNs3yIcL/vEtwO4BZjW27Jb0Zk9egquApsbjW5Rn2cCt1loTXE7zKENJqVyNgONwU+E5d415xYz8lsJatp3Co1WfXbDv7VP80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0802MB2181.eurprd08.prod.outlook.com (2603:10a6:4:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:13:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 18:13:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 4/4] selftest: wic: Add rawcopy plugin unpack test
Date: Mon, 14 Feb 2022 19:12:37 +0100
Message-ID: 
 <20220214181237.10308-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0256.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f42642-46ca-436b-086e-08d9efe5a33a
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2181:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB218176969725EFAF371C78CBD7339@DB6PR0802MB2181.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OHU7w4pNUSnBAVZKea7XRb6MS0FFSKPt2hej+4SdOdQD9HwlIaGwljOQ4shCzaKz70pgZWY9POV2bH/cQOefBVKrlDeTgK4cYNqIdatX/01+x5J3oQzg7hsD7+Wba8FFuO5o68tPE6G0wWImflQZhzfshawV0G0dK26XpZsK6CGtgVGNzfSD50pkozOnnkvIj0xliBqtWdeGSnHMPKz+F1w92Zr41lsANNxEmtEfK26pUNHOtjNf20s/TDClbPdOrIV0wFhkqbGFVnpD/Ek1tH+/xAjHKOGtFPlYxhsivT/NmIObyTowtyyKB410E0KODek2Ve9ZSm4oks8DyrjVYJI+zuywHLJGWQwS5Q/kwzZjWizBBUtCNO0a9Gsgmp5PAkMFng5bKppBArjVmo+3xAANa4jtchOo+W8Vu3KPxN8GdjAFEahqGoz9k6KBA2Bpj4fDzZzI++xXvxGQ84KJgCVMht+ZG3UCIFXMECjuRCW9OLnUMXKPk3momuxQ9F9bFbDRw+fCrBAgaA9DnIvY2dZVjllrA35XdFN+JewFEGhnqhTXHq/qFKQN9lUexFkIqcOexQITTuuC1wj7nZ+3M/tfYl+3frNfhqEklJq4x1B9pCDLok95MGYZ4LzQg+M7s1pkdQd3i29y/ffZK9iIjvZ7hIl7Qee4OTZ6ByJ3QEmQQTjT2QYFOESwAM8VuZJWmIyHxOqbiBB8tcqUjESBWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(8936002)(6506007)(4326008)(66946007)(107886003)(52116002)(66476007)(508600001)(6666004)(66556008)(6512007)(8676002)(6916009)(86362001)(316002)(2906002)(38100700002)(186003)(5660300002)(2616005)(83380400001)(26005)(1076003)(36756003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M4XZqBwseI5vrBgSLsv8QEtUvo3k+6KRwMU37YSBUJ/uSeMRxdN+F1/OtkL8?=
 =?us-ascii?Q?Xu7mfdFRG/2sPt0HuFG39GxiNFghhVvcAsZSf4ukCLCEevlFOstEMafSDm5k?=
 =?us-ascii?Q?0sEZjDCiJbX7FHi2c9uCHbYy7N3wMjUHLik2JGoldx5KVK6CUQkg14AnTdc2?=
 =?us-ascii?Q?w66tbOJx/ptCZ6lRf9uMOfpjkTuX/7vXH10tDeDNqgfrMy0X6b4SiSEsLIfL?=
 =?us-ascii?Q?c5ssbQAHSq4ATEQPWnZmvMIouymk+n0E0DAqkDhs7yqE1uWEMraLID4yxVga?=
 =?us-ascii?Q?TOcm8ij0u4IxO4YfmD6wjFPA9TwYcNCj9fQIF5F3s+Q6yKAg0PT7/yLw9Mdj?=
 =?us-ascii?Q?M92/TnNi41c9/ubdBNyhkdonrNgOAxpwRpAFqybB/yBXtaQoRxDKE2+fj3M8?=
 =?us-ascii?Q?7B1H8wuYfEb3cr1mLhCdSRJiSsomr97gKvAoo+BtiEZNzceAoTls/oojMtBx?=
 =?us-ascii?Q?mKepv2TDvOHBQto0CbINZyRsFJtA/UCkVx9D/AMyYfBgZHyoiWFxz7Gb8l3l?=
 =?us-ascii?Q?CoMr3uc63ELpejavrzS0x//hWrrKjvDR6in2I4+Glqz9zSuCTEAjuDYE/uCg?=
 =?us-ascii?Q?jBM4DeK2RzUWwdMDNE+01Senj74RPkLLq/eAPhAc0Kd5KA1TE0Z5Iwf12H6h?=
 =?us-ascii?Q?SuElFlqKgh8xdUTmzkUWA4DngQxHgIZ+lXPlivBfUgluJaoj3OXcRwmas7sO?=
 =?us-ascii?Q?PcSveRdOa001dqO6SqHQOFaV9k+oy+V75kCimPVY19MQEorYIoofU7LJkJfV?=
 =?us-ascii?Q?DNCEutbgtwzERLGPkoVxY1aqFy99rlJ9VSdOC7eEECYjIYYkXf+EKsWeZZZC?=
 =?us-ascii?Q?ZOLOU/QtgIrqvBdHK4GVM6eRgSUJlMoUgOqjwQ6mw+kZ5hYEdBvbNqJKR6MX?=
 =?us-ascii?Q?F2Frh7IuumxmN3+8J4sToswXWlY5sVIFyn1b+DCO2bCiYpNmKiFGG8EJKsJZ?=
 =?us-ascii?Q?HLMvSLxv95IK37E+BUsaT0sEqTwf7nuaElmv49W2w3V0X7mVHC1PM3qthMGE?=
 =?us-ascii?Q?E9YrFA1lUurAUROxdbXTfvFtsoB9DvKIaff90wMlBdqwpgeVLoaDScehX25U?=
 =?us-ascii?Q?3usTTK9IZzj/ahDl8/3Oa8cyf2ewepI9LdmcsUODanPfoMKKMUo5IfKKIJw5?=
 =?us-ascii?Q?uI1t0OLh8yu1py52KpaxxKJChUR+JOZ8fGE6L6NemIgfYjGsoS9KCcAak8eQ?=
 =?us-ascii?Q?NyAH5CViUtmu7DnQGPeTJremk36/1OrJuxQZqGH6qWT/AExRPnJDu/5nYP0T?=
 =?us-ascii?Q?xf+Zb68MuhINIXv3TwHsu6/AaTCHbLqWgEmxS1q8LBKeIPwwX+UHzGqHBSkJ?=
 =?us-ascii?Q?F+dafKan7tsZuO04h/+Q0xn4aED8GzTADmiky58OQzJKuf44dKr19A/m3bFk?=
 =?us-ascii?Q?y/MyI3lGhUhMWF2yRvzn8kBtyYrrh6LZq5NmiLhGXCfwPu/SK/u0uKdwRVDF?=
 =?us-ascii?Q?vYxdvIa7yIb1rMHmRomRi1Sjl2ycFbYUs6Ne0Ww+NZK2VFtSmtmaKCQdub56?=
 =?us-ascii?Q?+As4EFixaH8a4w+I2SaHSDcPfU067+Y6iuwzN69YMyg6uEwp5QzhFvhSB0ur?=
 =?us-ascii?Q?Il7VnCAcHrvOXXPEOI0Q6+EaQlflND9Cy9c8NEXxJqokb7ISJbgfw1EEu3SR?=
 =?us-ascii?Q?gKrsgM4oIGVMxErC1fBQom4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5f42642-46ca-436b-086e-08d9efe5a33a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 18:13:01.6080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GH+avPtX08lY4nG9/fB+5REaXBa+b3y/WSODezCVqFwrQEMf/yCkt+elNmMaAq6ISBOooKbo3b6QUnz76jq9Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 18:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161732

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

(no changes since v1)

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


