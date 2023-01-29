Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5357AC61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 09:36:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web10.13257.1674984978459891416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 01:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=jXbj3xZn;
 spf=pass (domain: vaisala.com, ip: 40.107.21.59, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLgu4o2uotPEwSXIS0ZHJUIQ2jGVsZYamBS+vW44D+/YKWfOISszAUYvzi+1Alr/hnKCFr5nO1U1RfuD6CToxdcJtglTxxL2vBhOxpdTm6bNi2/GlpTauz85iznxcsEI8DEtTDKgUYFrLz/+aSc0XzGk2etOI1/AhY0GGxEZ+JihbVAo/srfvDHRZ59anIg3inpLxYf4woC9/IdSzVFoZXb+cze0+hArGVb93+OK4GzZl+5bFyqzmaeky9msrG5DCaA6Tc1lm0dgjkzxi1Kw5Tkzdv7Dgydmsuzf0AMSgCCk0z9mz81zAj5WapiP/N6I2xF5R4A1Jb0GHeiRPrmm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tg3Gs/GyxV+8rGrwk+wge3j+AaalVt/v7lnepxx9wXA=;
 b=YscHVwoQzVl8ukdkun7ZthPPYM2tLnyyphyyy4r9Oz2JS/2xVZ3xbevWAWPfAkttCMhfTAiG41qBTkAEVY4ECC9LPvTUIG1a6xxCXZEhV1lnHpxusz+OOG77VIsEqIY06Tvga6nJcQdabBQdETOf2VPqtJP51ujzwwkT6yBXMa1UsHjxFzIHz1Q/Toi3g3afuVTAFC4IEGisLjR9Z3E7qmltpkuG3IIZeadwRtWPYVG2p+I8SFAawwJWpgZKqjvXzijYyxLObjupi29L+7mFTn2iLKUuA2ib+K3ar2upPj7embjZpo2HsJxgQuapnG800mqdScqsR8yNXHLyK4BBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg3Gs/GyxV+8rGrwk+wge3j+AaalVt/v7lnepxx9wXA=;
 b=jXbj3xZnX4j1b/dEtxa7sE3uKfW6T/J/cwhCyRFzMw8bVlKwNwvEeV2kU21K+j0H7w7rX7HbPz9E/x+FcgEV7HiS9v/IrqgjCVUBRQ0A+WAtY3sjYc3iqPEjVO1ecLDwgmARDLgF7vVG8yedmwagewJIR45E45tDCNR7S4p1WIlHVi+PU+b6fUYx/5Kncmjphs+kKE0fvf/zi54y6TuxCwl6JcQVV54T02ks9imBSPe8rEPVpiqYfFcZPr2AwPbLJKgK+LlVBVrO9roaYlEGYeAgvB5eP8r8jIUMvw1/+i5KhDlBPUaqNq0h8nQycfW6MrL6RpFKt4hOruyzQ0ZliQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by VE1PR06MB6240.eurprd06.prod.outlook.com (2603:10a6:803:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 09:36:15 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%4]) with mapi id 15.20.6043.028; Sun, 29 Jan 2023
 09:36:15 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 09:36:04 +0000
Message-ID: <20230129093604.167962-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::35) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|VE1PR06MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 7514e0e6-d472-41ee-8cee-08db01dc440e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZSLvrSsFlZ6K8Fl57x9tzyNwKgl8CEx9M1c10p/0uWgZzhZEoelCJv7lgAJ+QEuKKP+b5gr0wTTL8dOGxBCmUSXXei4Lmvj2gJXk/b/DNHEEietXPFw7Uh75nOm0xwtpGNgTfBye8m3Idm14jF8o2+G0/kjJQgnW0kxw4pV1E0zvRyxsvfZ3FGlBP3yI+zjZVqRvkptK7cXNhPof857E3ZhZAtaI2xFlPzB/eLReAlymULaoihQqmjT2IQRykJwgUW4lERY3v2EFnfv1ShPrnn4hJsWycasbAEessz+yDgLQxDJ0IdxZyMVlmai3rkgngIL0UZnsKF1B2mZqZDubkfjsybdNbH4MP0L6vHzhv6KajUa7zX1tBbeNpAOqz28p4QPSW4jJcEIQtlKW5ALROVnRqQKgWMs3BvpXdkoPq6aaZrAqVQOOuXq99+Db4mIeXUuOYn6TesxmyonjX5J2S7pOIW+bmFmmXi640qlM3czpWgSHHFF43U0lAQ9B6pZuqw4GsHlAyynoN0gxQ6VKbS/OELiFKRjjTxPjM+vw9hbu3tjcMxK5rxahm3mBmUP4nstGPi9yDsCkrYzdehvFGaImnWeP5L/zVHK0baVKXidYZQ9nRSuID1pJbR8La4s0Q6KRmLGwlUhonlzAxPG+KgPBNBwFTT65qDJ8FUVRHNezOSe8ow8IgMeACzAGtvaKyD689f8TTXQroCF8z6ZcNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(366004)(346002)(376002)(39840400004)(451199018)(5660300002)(44832011)(36756003)(86362001)(38100700002)(38350700002)(2906002)(2616005)(52116002)(6486002)(6512007)(478600001)(186003)(6506007)(26005)(1076003)(83380400001)(54906003)(66476007)(66556008)(8676002)(66946007)(6666004)(6916009)(316002)(41300700001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUUS4sq/WJzofNXGbi8KV1FCQVtNEJ/BURr2xsCBmtiMFVzKtGZkpkUHYtSI?=
 =?us-ascii?Q?WYOtmWfQHIFIYnmGHFW23do101AiV6FJ9hhJcI/s/SWYiCRyZhf2ntHSxw1D?=
 =?us-ascii?Q?nhgar9F2RwzrVbgxZMMF/NvoXRcHzF/EirzieYPGTG+nKQIuWsv2ziQLe5rk?=
 =?us-ascii?Q?TUoWk+yxqENdOO+AQ5zKaQmXm1qCjTKwGntQi+FVqVMHOGytg8TS5UWPpRzv?=
 =?us-ascii?Q?QKie8h+N9Ce/Wm4+dPYspGS8l8lXkjjINsQD3KoZ9/MdwuM1ELZUUSGxGkAp?=
 =?us-ascii?Q?Bq6GWooOlVFEkBn0GZdQ7m20RLx2+EiM7r+qISYoLwY5OEHdOIrbCJNXoOUa?=
 =?us-ascii?Q?xLosuXjEcO44kT8lJ+4Gs8pyqSmD2KfHzxZl0EO0iT6IPTnwN/r20+9Bkdvk?=
 =?us-ascii?Q?alOow2+Opi4asTJep7/1ao96f43w3CcTT8xvQnno/I+9A/IkYWJWKpvS5DB4?=
 =?us-ascii?Q?LYg1Ye9/+H8T1IhyQdmT5N0pr7Ih4osIDenCEg+JPCT9b5dkIctNsBB20D9c?=
 =?us-ascii?Q?hQDiDrP5bJdbU0Yfp2zswfXW8viWUR69UzwW3LSB5M0BC4dIpnXCqUgA/1wa?=
 =?us-ascii?Q?z9WMPzTj/BmGN0hXhurKlKv2/8TL6sFiQ/2zC4gTzCs/9crr7u6uQ0NudTwI?=
 =?us-ascii?Q?fgosyvAmBwqVO2d7EvrdBAzYrbLWQ2ANlk4sXgHbzDk4Ynk3WHvp+kJsCW4J?=
 =?us-ascii?Q?gRUZ/2Bun7D9SRHg2kANE4RIQoU+yvVsfrGHGkRqHqlYsV7SjgHV8G7jlefZ?=
 =?us-ascii?Q?iAZajCzKBs03LdZxi09/Faqlb4hqEcnlB96x9osPqFQ+c7fUmq63feks1Mub?=
 =?us-ascii?Q?ueMZWoH2/khplpm3HYOVPhJDFdwpsIyEFU0Lkzf937GCoLNIG7eFtGx8anXD?=
 =?us-ascii?Q?TRcxaz/QCKzv0DicLG9KP3EDqYsPpjUZC68/BwKHJenASJurMd0gkk+LSVLE?=
 =?us-ascii?Q?xt/CTM1QMwcL5XILXk0Kjy7nco6e5PIB0XawvhRaEcdfn9+pWJMNFOAmPQkX?=
 =?us-ascii?Q?s5AkT3BMN6+Yy7b7C/qC2JdoDvla+Klk2RnxDSRsEx98XjbPR19ODYI27Hc2?=
 =?us-ascii?Q?yOf9IX4j6e1zeCmuHTxeMHE++mqmK2x6MQGmCIDtaoE2Z5FRBnsdc+oxj+0Z?=
 =?us-ascii?Q?etsW4Xbz20wiH1wVegnPFYt7egwfj4Y4sObUmp0DGZYfqYnmMfaVzLM0ze0X?=
 =?us-ascii?Q?Pb20e2s4rCrCUfmeWc8eQq94h8WiIg/UEEYRDfahs2ZfIeoap7poliKX7Rrg?=
 =?us-ascii?Q?DJbjT5M5ghLv/P/BaCAdPB1FwtzTANiEAnKTHLr6IuK4Uxn1PRXJ3biN8j9s?=
 =?us-ascii?Q?P/gBksUYILYQS4IuF6t9om/xbVjsBo46FAUxHB1WyxnauIFok23ma/oiPVhn?=
 =?us-ascii?Q?RWiMEV67BLaXDmYsOzzvsY9bxz7PHwHO4xi2chBlVI8aw7zJiqgSZ7sAYlur?=
 =?us-ascii?Q?Uh/cjRI/rrbUEvW36bfn+O7aCQXyU32zywNP3RCSRAKsi3oOXLFLP03IEW0W?=
 =?us-ascii?Q?IQhzqMvCR3lcGoR00rTpXlN/5Pp7DTvYJaoyUmdSiUc75H3D1ExmCAuRYuZ8?=
 =?us-ascii?Q?EBqkGqpKtkQgCqCLxFNzHoq+/UUONCtBJj/NbuOUXBX9gZlGtkk+DCGIWk0f?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7514e0e6-d472-41ee-8cee-08db01dc440e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 09:36:15.1168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPO9l5nqxiymreOhhcwA/mO1Msl5QdzOBKYQGQZbvAiDxgUKRIITAPSGPAKSfFfdsimo4fcLKwgTdY29uDvR3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6240
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 09:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176471

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

(From OE-Core rev: fcd340ec53ff8352b8cae0eb351810072b025a08)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index aa00d5397c..b24f8d99d5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -117,7 +117,7 @@ python write_host_sdk_ext_manifest () {
                 f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
-SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext =3D "write_target_sdk=
_ext_manifest; write_host_sdk_ext_manifest; "   =20
+SDK_POSTPROCESS_COMMAND_append_task-populate-sdk-ext =3D " write_target_sd=
k_ext_manifest; write_host_sdk_ext_manifest; "   =20
=20
 SDK_TITLE_task-populate-sdk-ext =3D "${@d.getVar('DISTRO_NAME') or d.getVa=
r('DISTRO')} Extensible SDK"
=20
--=20
2.35.1


