Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C534C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:19:08 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.42])
 by mx.groups.io with SMTP id smtpd.web11.10317.1638958743676272816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 02:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=FvgMuc8k;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.42,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOjuJ3mukCGedj0QPNqKpVSi7dLZDyqu6fh14ZOgRRNthfM4fzpUcFoi+OharF1mu5SLVeZF4W/zGVXWsjL9EyuIQ/HKr1eAvkXabgMQIDg7AV5Q8BmLZXDF4XARfKZBD8fMcQxkAwIcxMh39EnDwi1ZEErJrpOl2n7KoRbJNgtalbM2XIzvOkiq+Rl93v5wmU/NzFsNkfcvQyVb1nvC0R6bPHNbTSvMIs3IBJL0ykkmdSu7jfoFaZl0K/EpYFf3VLxddv9dwHUXMmEERA0yMkLn2Cnj2M2Nb8O3GdOjjL/EAlbx0Hym2bQ7PcQtK1DgqKN5jBQ/BhhbbmYefuiJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNaI6tmxpVPpxYRr8Fx+BZ9nEZxnXxq24JawW4xAgTQ=;
 b=NjaxAeuKP5o2TKXzkLSPpfsuChIA2mkUD8hK4bVmyEX/ulzTkMS/rqBsZ4WgVx6CSzLMtwS9nfpmGgweZJ+r2G9KJ2aoymheOg+poGoJiKvzhHAR9/WeA3M88WbRksttCbrI+443dhsU72Q/faGG4iSyvEK3F3mUWlQUZ/0JGp8jIGlRMx+JJH/XXmktgdrwsGnq3L4adkA5rNGLs5g9077Yd6yv984KhUn2FE9RUlyUlVzd7dO7TB8i85KJmLuo/9biq04GzGmf77Y4Tfr+AXD9PahXYoIetero+xgD7Lloxz9/KdLCodNUyZGoo36CyFQLo4R5zdRJ7RNeOYaTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNaI6tmxpVPpxYRr8Fx+BZ9nEZxnXxq24JawW4xAgTQ=;
 b=FvgMuc8kGoiIvQVHbPUBB42A6YJdu30IvZAzjPIEEJWlE0H7ObK9LhKcnzpT8Ib8r83bOWUX+cR5oK3V5L+NHqzMVRnRbt2EXdaKYq7nwgn1pG6lbCREIbmaD5XDKk9AKny7rvN5oEoVW/T6+vl5hS9oBtxTtypxhTF+Jpu4IdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 10:19:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 10:19:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 2/5] selftest/devtool: Check branch in git fetch
Date: Wed,  8 Dec 2021 11:18:36 +0100
Message-ID: 
 <20211208101839.16224-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.94) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 10:19:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 825d6300-74e1-4386-01c5-08d9ba342752
X-MS-TrafficTypeDiagnostic: PAXPR08MB6526:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB652600DD7157A6F7AF352C60D76F9@PAXPR08MB6526.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JAWmTd8rfVkaFq/nsrbpg5mRwnu0WoB2ZZa87/thJFlhuPYdWMf8xZFK81gpg7+rgxm3Qc3hA4oqmiFP0H4IKXjcrrK7YJcqtc569CoZcpCXKtraaTIXnkngPYV5J1TI6aJBxn62ls5ItEMzrPHl+p8HQ/ETZRB3/e2cWX3q//5wlcMxtwpMyNZ7SHq0ck5SmSnmGtJ374T81Sm+eXjA4azzaaQa8JQnWfU/OxYjK5VE6xDfA1OStPuri/ZxGZ/+UlifmScNZB7y2t+B4pVflQn6JnrIhpLEwr3oAB8pywTylrt7VJSAoDXSsiNo1WsEb9RDlvz26FWW3Gd4mmfujoBLOANxn0M2riKm3ljKtsmRIb8vWN8CShVhic3uxoIkxbHLylmBesoZ/VJ6M8dWWvn33kpnYD/Ga6WNTotoyQuXty9lMdMbLoV6DAWqsCg7CbeacFAtEZQFfmlUBrGy/fmiCidlG+4kFMSUnWUDRV3ZWM/kZofzhqwxXKxt9aJgUXm1guAJT1AcTOpqwN4z7Y0WXLj6Ho4miBklTZogIadBqn8B0Ip2SVmBm2OGeaqzhiBh7A8E4MEB4oab7WUU7XuiRBGJkMySPELNAh3L+mNsz4AgNkefIMxvQMsH3CKS30xC09TYWjuOgU4rOMXOOwPWfiW7I2/HKnLTsr9AMYpcAVTZnGW5wkSFp2VN+0ZnSOw9pUZlcqimYaakUMJcWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(5660300002)(6666004)(86362001)(66556008)(7696005)(52116002)(66946007)(1076003)(316002)(2906002)(8936002)(38100700002)(8676002)(186003)(36756003)(4326008)(6486002)(956004)(2616005)(83380400001)(38350700002)(26005)(6916009)(107886003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MG4yozEHPVd2XlY7onG2lAbPHQak6eoUcz69JrzbAQGqcJb9eBQxCQlcOoGL?=
 =?us-ascii?Q?BeIPfR+sYgbbycozGQdIIY0VMk+zVTrD7dRnwnA0vz6TMxnWeJ8qiEqb1Rqu?=
 =?us-ascii?Q?ywIeY29VoeOMOQCdce2RJb06mYaXLKBrNd5P76LdpPv/nDqVGr6FbipVHtq8?=
 =?us-ascii?Q?nEX+5Tb6rhFYVKlhzEv97gnwUTOnHegTQ5kFhM6gwEu9bA4+y9UyLVoXv1e+?=
 =?us-ascii?Q?fVjg+QNrz0NTsIbFQu62U1xRIfQzgknGLDLGe7K4il7ze/RLHqxm/EiR1i/q?=
 =?us-ascii?Q?8le/SVanYiGRxFMAnN4uj5TTTckQl+8ml4zhHg3xJZuQFc6v8y89zSpmsWgR?=
 =?us-ascii?Q?uxa0+YogNSeSMSmO6RZM/tyT76w3WCL4rjMsz+SHjlfLrlxNSC7VVl1L5H7t?=
 =?us-ascii?Q?vgi0gu3zAnzG4AlLv4VFCz9kGumjQ7XJNaLskukUnskbPFoxJU/g4kQPbNZ7?=
 =?us-ascii?Q?OplqXRPGVVHy7FNMKXAPxY0qK/gCVlluwXLei/d9c1CFaV74hDL94igPst8L?=
 =?us-ascii?Q?kHw50G8xTnV4P9yW8894TdlyPRTc5ibSZB/WpUZOLO2y7qO8vjTIvgwn7bf1?=
 =?us-ascii?Q?tiS6EWMfUnxQWNdJdD2MVNX4WcsNTN3Ic7EOl8X3Mv7uJPnveLdH2oTVkCc+?=
 =?us-ascii?Q?ZtT4ELevq2GcxpCXrDpeD+5uKbU2kYKkHbFGSpbEb0GtNb+4cBHGKemtgRIu?=
 =?us-ascii?Q?7pwAK/1zDSkPL8BVb8iE3Wd8t9eAgkCzJpCLQwlomGl/HKpXkeJ7MsLSLd+n?=
 =?us-ascii?Q?BHDgzQp+nU35EETVHTXTPDtT0Oik8qPqvzNDC+6ONo68s6W5pKKf3OUU7Cha?=
 =?us-ascii?Q?i000gNyeeMzjDEYd0Wj5bIbVp+khzY9RFsTIY/I0cgHeEWDw6xw0bYclk1OH?=
 =?us-ascii?Q?PHwUs13NiiNLYXi2NMzAvrGa0D/7GUXUn60gDjFxVvM2I8Z4YtRZ1o3bFU2N?=
 =?us-ascii?Q?2TTjrYty5uU4mmN0S+QQas8XWvgwh1n/i2lOpiEe2r0VttCpJVEPSsVCfBIn?=
 =?us-ascii?Q?4DQ2TAFK5muRnKMX9mGLoULF4+vn8j+BiZTC/39/tsiMDCj3pFB1JD7KZG3A?=
 =?us-ascii?Q?x5WKlztMtwKimN0WoXh1oW6xZsEWmDEvUItC4zKKT3yDH254a+c6uy8CHF2v?=
 =?us-ascii?Q?0SNSgAIGy0ug9s2wSgbl/A/NTRc4qSNprZgiDfi5UU8Y0lEvDLO5CMYB8R1D?=
 =?us-ascii?Q?HAw+k+gUN570gLw8XXyUL+BSSx5tQTOr73uFpjTKo9WeKV0EZNVe/UNlfeNr?=
 =?us-ascii?Q?91Y94OL3GfFOneRPcX1jIitjZITkKS4OQOygchkE9wsMP9ul5nWspm+C87UM?=
 =?us-ascii?Q?QVPJL2iDmjqdROiIlTl1dY2gvxfRN84yOx4/dmcwLn66M6/BQhBdiYIzJQEY?=
 =?us-ascii?Q?Cj2E7xqBBvGrRk2AK2zcCkjjuk+ZKWd2iWudTYO5HUD/QhzbYhSpzWiyADww?=
 =?us-ascii?Q?0Hf1hrcpsBe4RdcX2plSKWv0bHH8hbYiCWjijxtMGUo1z3gH+DIhHt48MkXW?=
 =?us-ascii?Q?HV3YhaNPUy9RraHuMSfWrsXGk6Wn9TtzD0rG4l8oEFIY/N7BPwTfHSe4ZkdX?=
 =?us-ascii?Q?l+s5qTHOSfrEfQM+DkuNuEyW1xkGd8+WC4lD0KeYHN1cUvzLL6NNv+9P7HFz?=
 =?us-ascii?Q?eZg/WOuTUL3LuZj4TeSRtYI=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 825d6300-74e1-4386-01c5-08d9ba342752
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:19:01.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kQwwlTqvCwPiWN+cr0QcKq3JiJiBAmtTrdn5iAnTYDgFEte+KPUQRdDJt4boncQWdGtwbDLNoJZS5cpYYqPYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 10:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159356

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
forget the url branch=3D parameter in the devtool git fetch test.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

Changes in v2:
- Add commit to check branch in selftest/devtool

 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index d2b31af80e..a2b4d7f7d1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -442,6 +442,7 @@ class DevtoolAddTests(DevtoolBase):
         tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
         self.track_for_cleanup(tempdir)
         url =3D 'gitsm://git.yoctoproject.org/mraa'
+        url_branch =3D '%s;branch=3Dmaster' % url
         checkrev =3D 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe =3D 'mraa'
         srcdir =3D os.path.join(tempdir, testrecipe)
@@ -462,7 +463,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars =3D {}
         checkvars['S'] =3D '${WORKDIR}/git'
         checkvars['PV'] =3D '1.0+git${SRCPV}'
-        checkvars['SRC_URI'] =3D url
+        checkvars['SRC_URI'] =3D url_branch
         checkvars['SRCREV'] =3D '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with revision and version specified
@@ -481,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars =3D {}
         checkvars['S'] =3D '${WORKDIR}/git'
         checkvars['PV'] =3D '1.5+git${SRCPV}'
-        checkvars['SRC_URI'] =3D url
+        checkvars['SRC_URI'] =3D url_branch
         checkvars['SRCREV'] =3D checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
=20
--=20
2.20.1


