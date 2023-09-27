Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E8EE80A9C
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 07:14:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12216.1695798893410388439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 00:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rUgZkqHt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76349c5ec6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R60YYs032274
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=9TZkxVJMmKUufCEncn
	9KivNNvSMtTrscNIf/2loNm3o=; b=rUgZkqHtK2zbfA0z2gMYtVYWMXg4WLgeuZ
	jFROEvY7FnzB+tXPv7YO2LG22dscTFuPJqopsZtGqKaCXb4r+vqzx7SuP1ZnTaSB
	GZjnmgURI6QXERoY1DbovIJYuUdVKe+ZAXyqw8sI+OzLNNstcksJlwH00WtHVQoY
	KmDCZaZ6ZywVPAj4+hv6FnHYgcFIP1saVOEfZ//aU7hlWycX1MxAZHcExd2Kbz+d
	SHmIA4xmLE+1rJhZW9pH4zqyb3+F/sv5t2xUFk7md5q0OCGsr9n5S8qoNzGLfCjh
	e15NuICOw0gcHJF1wV8lV9i1jDW8HqqKZ4nm97VbnP3SZp4yBwOw==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3ntc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:14:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD9rFLJGI/ai9F+JvrbT0rHRYD4RKJuAxBH2Q+FLbXgCWQYhfca8wJpRKXxdZe71ivIDgvbDIA2j/y1jLjttWNxzovXwhZj9gqDQm18aIqLhFvfgXayYekXYaqGvp/fvyBfGAL0+8tZO0jFj7glrZvkWUjL7qDP96Kqfx2YCedeFOQresr71gW41iMgo0F9e3hKzmIn1iPjEwJ0gtYKRC6gkmg6rxh/Qe6wlo+LunUoTMTQaV1ow5tByMUU17+Gc8PfH3Z5YQ++Yf/J6q6VVj6UntIgR0Fs6OdYYMz7bNwvXtuUdkZCHe+7HosFpjbFMz8wP7FDvEcXWFKiT3AWL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TZkxVJMmKUufCEncn9KivNNvSMtTrscNIf/2loNm3o=;
 b=jU6O/h/aIVKNyhYe1+08izmiep/YIX4v2EA5cdNEuC2tK2w0vyrBmRvcRnvpVzJwB0asRsenoTb6YnheyeEa52bl/MiF/sFRm91wtu9YNbUYEBscwviPrIkJsKfLiORBCOsgl06Hf3JG0jPFib7w5FfXBJxhxVBJOnMpffITEuTqXC7UfzbJHIfToVWSaiKpiuVtVwwnSHZETZWsxeJQLr7+W1YcdJ9PW9u198gtlaPF/H7vgpmrCf/3Q40FoUW/L37Iewik5KQg41uDLBU6X2e04JsUjV3EOOlfg3MiGh+6tguzjbmngxasAY1ZavGt3m70HMRfiwsduB0IT3p3XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 07:14:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 07:14:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: add cpython to CVE_PRODUCT
Date: Wed, 27 Sep 2023 00:14:38 -0700
Message-Id: <20230927071438.2365283-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:510:174::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5947f91c-c33a-499d-c953-08dbbf296f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USVR6eVmBiAfqYCnAWnPd7EuyfTtPhoee74og+aTSctdky3XX10okmyMn7j/4j/8D4sSzxsecU+gWDVM0Kg6o/EIhyzV8IL60yv2it8YxfIYXOMsZ1WxHG+WExuW24wGxbA/CyFRJcUs6dDElt+M6Kv4ueUNkFn+8C0fWd0+oQy/Jeo2IljckD3MPkl+4xK/pg/6MEQj5iw+VzGwX5UvKmQaRVq6oN58A0JFmogLrIqwYX1Pwb1BERiiWqsV9pM3b9NCx4gUWwGz07yyySIp4F0/JR+fTuzb7c+5TNxbYZDSMQ0dE7V0CbsXHBupMtYmqtgBRc2qYhj1lv+PKmlAZqMbr7zNfBDbM1rYR57RP2UO/wR4C2ifwD6tNqe9lq8mjE0/yk9AZaFq2PjN738VuF76fDRlsLN+1n+JCRJc1dttHDM5+Gr1V+XStWxbgSFT3hJSJlnfJPBUaXAIs6+v82cpey4oyiRqus+6iCopM5Ykmd6Ey4bcLWq0V6SFHo2XVYA1Pv8XLVz13V/x+hiRdtuu3f1C9W5lU/PnE2ovNOxDIZ8RieM/7NrfO6eyLbogXQC3T9q1i8nL5KwYtKpr8AU9mD7+pKTDnxXGAHORMkyQgW8/fvEmGOrThrRAoJlpr4Y8LEucMux4TLUP2nW2oA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39840400004)(136003)(230922051799003)(451199024)(186009)(1800799009)(966005)(478600001)(41300700001)(5660300002)(8936002)(86362001)(38350700002)(38100700002)(8676002)(2906002)(66556008)(6916009)(83380400001)(316002)(52116002)(66946007)(2616005)(26005)(36756003)(66476007)(6512007)(1076003)(6506007)(9686003)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ht9b7iZFtiLr1Qpfnm8P4hksIBuuMiD0PmTJQh9Mw6KQSjtvvltItPhK8C6?=
 =?us-ascii?Q?b00qYaspjdpd1pxDid9vDvzQJUjMAVfvwNf13bMsbaniuTiGEG1ZyceBy9oD?=
 =?us-ascii?Q?yF6XFtFJiYC2jDAVbVHofFYKQ99ymYPsjmOpOmQ2GKAGX9Rk16iCMsFeP8Ia?=
 =?us-ascii?Q?TzQ0xD1gt2W6LLj3Xiu0jzG3ih5iIut0YPVvTMUVMyokC8aW9P7ujQ72McY0?=
 =?us-ascii?Q?1g1b9SoqfMJjourrB8sP6LN4X5nKQ1HWQkENyor6aljIDdp6VLqZ7mijuRmh?=
 =?us-ascii?Q?tuIN7cVXWKNkeTt9OlGdbTwMHYJ0IGmJaF8JS5Ba4BMq4143Iff0Kt59GpIF?=
 =?us-ascii?Q?c4dEmWKjz34voPBTgw/ERcMNSqCNjH42xViv3o8/jzhyXl4Lhw1h1xVanDXn?=
 =?us-ascii?Q?DhNKbJUuB7gcbyZhsyeeoMIwaBOi2CDEf3Lf2k40LxzZjSZ2LAwwuJROV5ur?=
 =?us-ascii?Q?b7jPHEzMi0wDRPTQUfAhqEn1HC+U1J3OU7dRnjDDnGV1HrLdXd5+tFeRgVST?=
 =?us-ascii?Q?DIiCMNZw4EwNamljitE5e94bWBtnxmgTzBrE+m1vlc5qSwCtWIcVfpfViCJP?=
 =?us-ascii?Q?Reg3IscuEVmJiazzJFqenzvJO5+ZfPAuX6Z51up30yZBoKCOGW016Dkw1YJh?=
 =?us-ascii?Q?8uTgGU2I2dFewnbvdsvC8e7qOS5PU/mkMzJxmSsQ+Hpnm98QMVPzM+4nYgYR?=
 =?us-ascii?Q?l0Mi5g5v4CdVQvNv5q6zfyWGU+x1YkS2jDe765WWdZw5DP+RvDBKd6OP9f+v?=
 =?us-ascii?Q?ObsSQ7NB5ZYmf24SJKDntV5D0/+zMvIkk8nOxqZNsfyqA4dlI2Map5wlzDec?=
 =?us-ascii?Q?rNwR4yUA/FEYR38leGK3koRMZ6Zd1GgLqeZMCWA7DJxLjx0In9tGkABMVhtB?=
 =?us-ascii?Q?KggzmYKYsul6qLGQBiyiQiPyhGzZXO+0BIctkSZxn6pY3ZfDx2WI1/8WqHAh?=
 =?us-ascii?Q?ChHthuCisglBDMBL+lFtkuFIND9iLogA+Y55dkc/HrPJWbtHiUUTEqlzsTX1?=
 =?us-ascii?Q?+JG3d/fzljwI17VFhg66dFgLwGfoFSvOV1Rp0mGFJRBmhQQogihy/L5SkoeA?=
 =?us-ascii?Q?XyB1g8qRBi1Vcc3oXfMhd2JS2pRyaz2udeQJGZL2KB0sDJckWa5Xk75oDlq0?=
 =?us-ascii?Q?I5xsCQmw2bmmRyXCk+iQFZyswyLltMQaBIIxTkLuXguXEDze4Umz2PqctYoK?=
 =?us-ascii?Q?96HzRfwlTUaqvrlmPD01dQPY1aBoZ5tMqwKNnyehZi82DdP2ALLqUg3PtZQG?=
 =?us-ascii?Q?HeQhOACsChjpkj0rsjlvr/aMnJeNG37vsBGko/KRZikGOo1EjTnbycGogDhJ?=
 =?us-ascii?Q?QMthk5cE3sN+4SskYW+zQRsVwoe/uEeirEVrX0NdJNk2C7RjmoNBByNsiBxs?=
 =?us-ascii?Q?ojeX/MT8lWiMDZDO4fGvXOC7AHV1K+8pV7RPvREUSp9xqf3MZdxQwjN9WGnG?=
 =?us-ascii?Q?AHGjobrNEz3hIQmiaTJ/v7O1KVQ5MDWwhCoBo5DKcN1Lo1sxKYPkiZ8vVcuE?=
 =?us-ascii?Q?2whbxSBusxcxOr2a7lBlrcWw97jwY+p0MucAfbvziZUGpPgV3fmVtbDdys2d?=
 =?us-ascii?Q?vVz48D8uEMAbCc004qPkkAAmztnY3dAB0JoGkw0t5MoFeEnEAjyQl/OdMpmk?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5947f91c-c33a-499d-c953-08dbbf296f2f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 07:14:48.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZWCf/GhxkOK1efnSoSayVc4eYdY/WjhsE4XsjgbJcgMAkgdunC77l2SeoOhTiD1Y6QMcQ4VTedCx+D6moIzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
X-Proofpoint-ORIG-GUID: SuaTZ34MPQVm2pnMgKQZrdCquQ_EYwab
X-Proofpoint-GUID: SuaTZ34MPQVm2pnMgKQZrdCquQ_EYwab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=712 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 07:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188292

From: Chen Qi <Qi.Chen@windriver.com>

https://nvd.nist.gov/vuln/detail/CVE-2023-33595 uses 'cpython'.
Although it's currently the only one that uses cpython, let's add
cpython to CVE_PRODUCT, just in case.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3_3.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 6c624c9d3d..8e023c7dfb 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -46,7 +46,7 @@ SRC_URI[sha256sum] = "85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
 
-CVE_PRODUCT = "python"
+CVE_PRODUCT = "python cpython"
 
 CVE_STATUS[CVE-2007-4559] = "disputed: Upstream consider this expected behaviour"
 CVE_STATUS[CVE-2019-18348] = "not-applicable-config: This is not exploitable when glibc has CVE-2016-10739 fixed"
-- 
2.40.0


