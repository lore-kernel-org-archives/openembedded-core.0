Return-Path: <hayama@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC7C83F3E
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 07:30:50 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (JPN01-TYC-obe.outbound.protection.outlook.com [40.107.114.100])
 by mx.groups.io with SMTP id smtpd.web10.16208.1693899048933780163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 00:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@lineouser.onmicrosoft.com header.s=selector1-lineouser-onmicrosoft-com header.b=lCJlgxhf;
 spf=pass (domain: lineo.co.jp, ip: 40.107.114.100, mailfrom: hayama@lineo.co.jp)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQF5lXwgTyO+EGCifPoKokO4UiurLTEckdnpc9GfFeiv/A92G4uJFQOWKUVoY3TRpe9HDjcIrSPjXB5cXpD35yxIHrZyyqgwdKINIiKPpqIVRSVJYn0cUfx5bEZHYZ8VvlSfaOuBo2eAop+vtDy90JApTqx/F+iJOObFCJjVaaGHx2kkh0/dCneAS2nswip5I+2tEN5d2BhPpZiMLEQLnbm/f+iXpvFNGC5nUjy8o738Wezv5F0IZLQ7z517wxTuxz4MRIGxZtW+icFPhuhN7R9YgMEk4a0jVyq/8/fulD1rpHEjU2fXH/MdHIDATr1xt7DvPFr21mwqu1c/7oNTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9hastd4GFuqgUVACzO0YWeh7wE3P6t0SSEBkphuUEQ=;
 b=Zqw52AlbNklLW53cD1iELT48sFKvNKDHmqMLAMHRjg3WQokmgOYSZQuZsY8fgw7WgCNhrktMjDqavqgTVhy70evA60Ky7cZxY8ooBz2HzpjJMms0TwhOhZK6EdHkjUJGWiE17HiO0jqI6CKQORlD0XZGnNGHQCuNBO6AHoNdkmqVQWMWdVYjcl/NEB2scEMG78LrcoLUA7zeMFqYXtVbg5DvH8CWPFIDwlASYZKMSmIiV4ma6CqVVjlNYOd0Tc0Yv3VTRIzZK7JWV+meJ4C6BP1B0O983V7gccoZqHPzgQmslSJGqjnGiBtHsLyoyw/RyqUmaGEaxgAK2PXE+Le2OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lineouser.onmicrosoft.com; s=selector1-lineouser-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9hastd4GFuqgUVACzO0YWeh7wE3P6t0SSEBkphuUEQ=;
 b=lCJlgxhfDVvZp8/tMdOzCqEdmDvVGYSs6UEBPlgzRbXJrxTaKB7O8S2ClSZDLFHF8TvOtSuQt92dai6cXWRzph4IGVTrN5fzntMvSKI2jv31c/LJP/sYvf/ks7VXCGifLkSvUvp1q6jY40+U9oXgHUTXK7JtlueLfcmqxiUpGs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com (2603:1096:404:dd::23)
 by OS3PR01MB5575.jpnprd01.prod.outlook.com (2603:1096:604:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 07:30:45 +0000
Received: from TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6]) by TY2PR01MB3769.jpnprd01.prod.outlook.com
 ([fe80::f6d7:dd5e:bdf5:abb6%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 07:30:45 +0000
From: Yuta Hayama <hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Yuta Hayama <hayama@lineo.co.jp>
Subject: [PATCH 2/3] linux/generate-cve-exclusions: print the generated time in UTC
Date: Tue,  5 Sep 2023 16:29:07 +0900
Message-ID: <20230905072920.615-2-hayama@lineo.co.jp>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20230905072920.615-1-hayama@lineo.co.jp>
References: <20230905072920.615-1-hayama@lineo.co.jp>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: OSAPR01CA0316.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::16) To TY2PR01MB3769.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR01MB3769:EE_|OS3PR01MB5575:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1028f8-478c-4956-d765-08dbade204cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8sienPhT5BAGcwfMkmG0HM2JBjXCoyOyjylagyZyjisezOfADLtdLNTFQLOVrc8kauu9Bq5Y2hPFzpDtMliVpe/egu9nW00LPtr8pdkx16ipdkq8C0VKrP6OklxoAbQ9oadubvma0wO72gzDnMH8ltWMAzBflKzdAqsxnITVam4Q98Af4lm3WvNWFWK5NUDCAR9zEElKX9+9Plho1RU5V1naZ6ncfetcM9Rlfjr3MrDaHH3v+vL18tbCfOJU134TK1HxBeo5aEwXbgi2PAp8E7taCedHH8FvQ0pCLxdYFHkJguoQJxiIo9nJgFPuQn0LEEzP+l4uNko34271m+k8FMKZ18vr25JpFnNcbwrpyQwtPsgobFLPX4JyhFXjxQjgGiB1FWPqw3TaJGHuqd5SpclEc1VAcjDJxLss9X4glqma/o+QiT7/WsDpJTkl8OAaRW1YUM5+cvRWbBtCL9yXR/sMSZ87Q9VReMYthMRpcb9EmieqPjy3RdfJknHjI0aS/vQkOVJiJ8tmkTPU1AoGFopLbqhKlh/f/mQwLTx6m3XOvSye8nVBUCgX8MbKXsbDBbQF1J7oMOpOkfo6FvhG8K0SgzhccOUS+Jr8k+usiKM95UNPIgrTWINXMWvq5tOe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3769.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39840400004)(346002)(376002)(136003)(366004)(451199024)(1800799009)(186009)(66946007)(66556008)(66476007)(6916009)(478600001)(38100700002)(38350700002)(316002)(4744005)(2906002)(41300700001)(86362001)(8936002)(8676002)(4326008)(5660300002)(6506007)(83380400001)(6512007)(6666004)(6486002)(52116002)(2616005)(107886003)(26005)(1076003)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oV3/dE8grBVZEaKZswG2L7VDUn18xD7fxkCdxRFEesuC5GnELUNoZ3XT1BhN?=
 =?us-ascii?Q?csA3yV61WAPY+7Uqj3jqq6v1vOt0r0E7S3rlqhYYPVFVSi5JAX81j7ZLUbu0?=
 =?us-ascii?Q?xPCNlL9vyxKTqrzfeNT8GpnScrn4UF6xSt+cVUqwW6ioMK6XeI0pVcGgnIOP?=
 =?us-ascii?Q?X5t5YNPjTEXvvs+L9naXB0qpmif66DryK7SiCCjAGUnDoz3+zX/5IIGSGgPr?=
 =?us-ascii?Q?OcmqNF/0MPve1Yw+GjzwZSDXwkqVSJYXsINYJVG/JWXFmYl41nTOjb2wyVG6?=
 =?us-ascii?Q?++Mq69qUTXnhkt1+GnmVOFfLIIsn8ERg2CruJEFHkY73gGgPRc5AzlmG2EId?=
 =?us-ascii?Q?Kz4qYP1bzVkVhPYTsN01XezNo8q680QnqsQPwDSBZjEr9Cv0q00s7vSW25bG?=
 =?us-ascii?Q?DGgauLKV9oDNi1S8WnM0HzbOoSsZ8WiOog2TMyAf+7eOCDTJKBCZxrh6wb0Y?=
 =?us-ascii?Q?vch1xxgysrNS4+BcU+wZT7wCVBXHN9mAG2mBfomn46mALjTlnmXCYb6MEJ0D?=
 =?us-ascii?Q?3zNKakT6aJl6xxWMwcjf5AsCsnuXho/P5r56VU+N+25KDOYUKik+vQgzzJ8J?=
 =?us-ascii?Q?q3HaG0B03au+8XXai6ZKev2h1dWxDtI01PlAZDThvwldv2776w5MPZXkohVZ?=
 =?us-ascii?Q?/blE1Y/FjrtXetBgLdQn+PokfGxZPS2WLPduTh027/GeuNNNHnkzN5zoBnTz?=
 =?us-ascii?Q?KAEeNG3cIJ9XBBN5Aoi04dLIUCOTwzVk4Hn8hYkEUP4hSZXRJAptER0+3lHC?=
 =?us-ascii?Q?txui/2Phb9ehdDjty37mt2F0UyIlRNZAUkf4k8m8VPArHSMlSv+/oSH+Gb6o?=
 =?us-ascii?Q?+AUkgWsbEGPsfQjMuv/8RpuDXsI3/ybQvrtFIO+AAcmEl+lGI4QEzmvNn36I?=
 =?us-ascii?Q?219J2avh4ia6jFSUjIbZJpLe5xuPxWcvrH9yTYkTYxz+ilVSTfFo6gFYqBTt?=
 =?us-ascii?Q?hB0o5y6dnNocfwHr/KycfY82Q7RNL7COX+nCqJaZFZTq3adyhhch14HXwb0i?=
 =?us-ascii?Q?rCNHsItj8LYn76bKsZ7csNMatAtGv5eNVh71eEOTwiBwb+L2CVEoJ6lp5ITE?=
 =?us-ascii?Q?84QlEbSoaz1yeW7cQ2kPfXgg1nLEl+mf9oWzltKIx/yyjFjpy0NVNwXY+PcC?=
 =?us-ascii?Q?0VZj9NBVQOKB9TgX2ZB6uiHAPzE87ezqifxkJB3oAQB7eYWUNzlFfBgFl/XI?=
 =?us-ascii?Q?wGyCB/gdIxP4K3z989iR2ULGfVbAGkeNUiCkSvlo6wroQ6MjONzlP29yi5L4?=
 =?us-ascii?Q?gp1V/cTIkEd38WW+D+ZMbUhktQPxIo8lUh2MEZ5QQhfld4PvXuRMZ6T89Pky?=
 =?us-ascii?Q?9oKLuAmDgWXt2CoIU/oMZDP9hlNcMNFgaixY8ge5cXt9OMD0F41FYoQlB1Xl?=
 =?us-ascii?Q?j83AzX+U81cd0WaUJwAiUXDjpHdjwgr92Ol+PoxWsppdMrtXndOYnr35DIIb?=
 =?us-ascii?Q?QHDfmZ1MOdwqH+s0aJAsUJoVLyO1ZSJL+r6QYOYTc1v08VJWtaKWESXjK8Tb?=
 =?us-ascii?Q?klN5/A2MNknX4Mmt1X5/985w6/003TYdjcY0Ack1fXHzFHLLqJtK1l+BkvTT?=
 =?us-ascii?Q?a7aOwUrvR4UoYhJZ594y7MnDEhyh/fXDxtaVSRXZ?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1028f8-478c-4956-d765-08dbade204cd
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3769.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 07:30:45.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SYPol98O+xPMCHQ2PJxBUWwDFS9lU5smQVEiuDt2+hyiJZ/hhgnnpaPOHVpNlZe5UBqPsyE4w/oHVEPdH4Yzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5575
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187201

Allow time comparisons to be made regardless of where the script was run.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/re=
cipes-kernel/linux/generate-cve-exclusions.py
index b936f843e2..aa9195aab4 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -44,7 +44,7 @@ def main(argp=3DNone):
=20
     print(f"""
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at {datetime.datetime.now()} for version {version}
+# Generated at {datetime.datetime.now(datetime.timezone.utc)} for version =
{version}
=20
 python check_kernel_cve_status_version() {{
     this_version =3D "{version}"
--=20
2.25.1


