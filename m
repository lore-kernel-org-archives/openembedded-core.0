Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390DC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:04:56 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47340.1782918292693970145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 08:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=lLqxZMBh;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.87, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782918290;
 b=LP5Efw4hWOKbhkxcUzcNZoA5pFkj7ECmBRFh9SamZjeSw/fIN3GXKtYM64Zz7gkFEy6L6NrC
 PDO2q9p1MqrVb7SJ3N8MAMx9uEk4qC2M48Lowmy0ZOtf+r6lp072QtHAXXMxuxcjcBuxJVyJ1yL
 iPDkfalfdnnS2bcgZjev8U1Sgh6iwtDfFUCe8WvTqKknspK7Q/OCAhT5/R+FAf4K2HNzD1iwzOH
 YAyJbFgpgMsZpevhuvhZGVu8qAMhn1p889WWbFHNHXGU8m0+PGM0xNCo6PNIiCiVafBpZHrWfp4
 PHuG8wuhqS7QWugE0NIddaSyLI3Mn5ZFOn+Vl6g1LAF5g==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782918290;
 b=sj6SdakRmXiE4wiKiiICPb/Y/AFn+lzD6KwCTf1JogH3HN6yBpxtOGpE6DfzjnWiFJZO0uf9
 wJLdgL3e/j7zh6l34Cw/AUkxfSf3PRO30w+L0uGjBDNyO0WNUVwMrMixgSF684DpI4s7lupOUgT
 ZmaXaC6NRCuVHKYwd3B0r2bqg/JaFMcZaWIa0i2j6B4dfmbcf+p2W3z4hNe9t6FvIL0xAGCSGeQ
 ovXSpQifzzKOiHg7B/KuuiGc76IHfuafbqPJZmPYBU/nK9a1LxWfvPWrkulQx7JFbEeKWQFkuFK
 b5y8Yhznq4R+tw/liUjXEhAG9OGIZ7wvpslYqOQnXsWgg==
Received: from mail-norwayeastazon11023087.outbound.protection.outlook.com ([40.107.159.87]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 17:04:50 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtyW9+kX8/AGN2Jpie79SrcovJV97ryKhUQE9kW4hU8AGjTVDH6gfHh0UUacy+0pjsvyfKQbJSbDxWSO/J+SdFK67fgx+3cDT7ignUBaqjS6p6bG29MXi36LJlM4DUi6f/SyVHRsx0ADIGNL9UA4QnhzrFGtIQSS6HVOg2GA50pYeWmlN4xaO2JwVjacx0H/wzEowk+dXMP+z1YC6NuO8TvHsgo2OzfGbP0756J5OueIDVLPNbDDKyNVRD9zhi/ZuCWZy4PO2YRKAaqMreQYYQ0XlnjI9zajVUjXBR7qFreI/gLFY6a6zQngyV0TkNWDYDG3ek0seAXnQW8GA4S/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=;
 b=juXhWkeFMjl/Pphu8nMbX+DQGg77yu8Tz58BZ1yFZU47EjWeFpRIZ+ADDEhqaNQOwTYGGeFjcd0JHzX1R05aGr87OYvt5IkJqfPL8CVFK5I6DQlS1nRW5tW5KOjsiZMpinRTdkcgO6GBZwWKTb4K9+p2sLFU96Hu9Bl4VUHbMWLCLr5un84r+6MO2UwFg9mjGCnIV4i8ENBxM+yliTh4hb0mKr8zkwvP1phSyilfx4W9/IQQ4687pUDwMrO6UUYTtQlw+F6QmqHsERv1eiDtRI0VFUs/Vr6mSpYv4fTX4yRsRsEURp1fXmQOSHoTqWlqmJ76Ak9CIT90EL2gL1fMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsDWWIjyGljet+d4855tH1CyhONoe0T+VTozQTJ8ZkA=;
 b=lLqxZMBh52ea6CXibJNVFnOzo6MklpCdsJ4g35AjXRD0zmM0d8QR1D55HR2OIobwb5i6WUzXZvGu0AHy6MDlrkJEXO8NDRKrwY33T2AspOhzRSug7oHD0QKmyFOonV2RM/GA6KIF6RSK3WB9Az9x8sRt4EGjE0N4WI4HFEaOOBkF4j+cH3MZPWcl9MA6+yynVIlbOU+YgE7uSWbLVaGGw88K54jEalR0MsIo5XJ/t1IEp1X2nBXGJZadkmkSJAFXDZuW5Fb3+RaF1A0tbFjBj0V9LM9nyk9mlXhrDz0otucKe9P3s6cAATkD7tpqJNHVXu+adBDLMGaNV87PVdOcfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by GVXP192MB3339.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 1 Jul
 2026 15:04:43 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 15:04:42 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH v2 1/3] dhcpcd: patch CVE-2026-56113
Date: Wed,  1 Jul 2026 17:04:31 +0200
Message-ID: <20260701150433.3889478-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701150433.3889478-1-tgaige.opensource@witekio.com>
References: <239971>
 <20260701150433.3889478-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|GVXP192MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ee7830-0132-4a61-26f1-08ded78214cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10070799003|18002099003|22082099003|13003099007|56012099006|3023799007|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	/30IkgCfWrgzuDBPYAK9qTHXK4W4Gy3R2w8DBAd6KCcUSrLhKmvCS9NPrHQFhLn/4He+tYbtIXBuaRDzkf0Bk5UAOF/g0EZSzUGyZSjJ3q35EUnYjzv4X1pk3x+wZMV5R5Syjmw7XNLBVrDPpS7EO2iECikyCtFp2pV2IwgMFCMOg3Qf2WfS0ogBR3J1zNVwjKh+56ir+8JhnqLWthrTROUvb3MFpMN101gNv5LA1TtoWr2AWmBy7h1OYcUMk74jm+GRdWjcldFZMZyMHhX2iK7qu2KFWhGkJY1ilzqudRerg3xUdOhoYxdFg5brtBltT5ndKWYnwi3Bm1mgzxsq7pwbuqiiK4Q0YurOJKUCjPBSkkXC6YIJDVIt1wdZSq7cG/GQLLd0DA1cc3JLrjm1aCf8xQBiEyQKfVttvIUV6cvInMqy9mxQq9KM4/uPGVr6XDDF315Znq0j9qkamrSsWpj/Qp7akR9RjOJaGhRhGqrqOaXRNk7MRTq1Mw3iLjOMNP9c1QL6Yshiwu5clVWLfBPBICPixF0jXtdFo4u+aoLNrc9r2HuBE6fRK0AKz0JF2MjPf9xfsy4yVtACpkvGiH0mmvZszU6icp3nUe4XzfXtbsagi5xaNZLGzJ9H1kgBN9A1d8jppNxkPU1M/ltigeUTxvh/57rzTwOOggtJikE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10070799003)(18002099003)(22082099003)(13003099007)(56012099006)(3023799007)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9YnYV3YfY6svuUE++SgoqyXft5jYVxrgv25kRObbDHU1wKTut+NvOd+YqpHd?=
 =?us-ascii?Q?fnk+6KNiRUeejsHPL8nrcWaCOBx7p289xBIxKoUQU/UIW41xLS82yZiOkqsp?=
 =?us-ascii?Q?j+YeMX4bs9BfOq++vcgJuedXaValSzjzz5P19XQj9+vwUHp9bgFnUjBIvaj5?=
 =?us-ascii?Q?5AxzXXHGVKqYZlLZ41yBLAjuPPcU+wual1jatoa7m+SSkbTJ8AAjkQRW1+u+?=
 =?us-ascii?Q?C9nDeRz57Wjemb7jqaTLw9n+Y0MOFuedhrgjp1a5atmiFHGXiA0ryGRSIRXo?=
 =?us-ascii?Q?iEfRsxaxJcgMlqblCWaGms14K5c/9CCXP5yrk0N0b6zaMZg72xq7dZU2k4QY?=
 =?us-ascii?Q?pFCcUyTeh31JS0RKJncK5YcDWcOw/qjbKdvtjMybKeIGMMqEGr9YvqOCgj7A?=
 =?us-ascii?Q?OCrgsYzNDsA/NEVUqFU9OGqFfwuVIULm//0S+xfRi0CE4vcxmHZXtj8eP6gv?=
 =?us-ascii?Q?H1/NPXoKDSHaMz02Vv0iQzq2qIVJNpE/hMsaw1ae8YaLI/66yYSElkvQHx3v?=
 =?us-ascii?Q?CtuhXUHR9ESZNt53IAHtObeW1bdiCFuYzMzfRue/Tx1jvNKxEQP/kcvPqKS1?=
 =?us-ascii?Q?96y3werf4k8nWvs6Yt5dmeg0ZwEke8q0IZKVuEIRvdzzltmeERK5feWY+aDW?=
 =?us-ascii?Q?YhpdPyCb3kylvd25jj6Rzc+dy5eo5S5U9U2j8RsJnLag2G5PIUXuaSh+iAgd?=
 =?us-ascii?Q?EG6PW16TiU82rv6oZxIjJi5o6HgPhYqzhNQFz9UyAEW0E8znFcsYVO1l5sIh?=
 =?us-ascii?Q?zVBPIVVKQKNRHuZtAMj9M7bDeBg12JePe4GI/fUqiBF1NDXDYlBhqgmc+GNo?=
 =?us-ascii?Q?V0o93Ks1A9zGhv19h0CFopL4+qH2JqkOxCmGh530kUELViylU3bJJpYrXKMR?=
 =?us-ascii?Q?uXWISGZSDVamJCX78bklDTk/vfr5NRrhX79ePwAJahXBBFKcyX+acn4y71bM?=
 =?us-ascii?Q?FPJT78T6swLQy7nx99hD6aDX7EKYd2fEifLZX7uvhBtnpLkbij1q0Itp1YLf?=
 =?us-ascii?Q?wUDBdwDhTwV63vychFIvz0yVz3K25GYcl/9X9Ko3kOnOiZ877mv8+V78xeoJ?=
 =?us-ascii?Q?WPXAMpxkn6L7uK/mYuG48W0MAM13TbxPTlVKj8c4rlIyHt1qtZdNc9/qNj9W?=
 =?us-ascii?Q?3HAoRe8WhGVictHdnYPeIG9mbHVZLmb5sQA9NuWVvoOuzKCZYXvxRhacFG8+?=
 =?us-ascii?Q?51SFw0vt9TCdITc15xR2h9hc0NDEtKxJXnK9i5dXxaXXOq5EN4kUsYYgXMlb?=
 =?us-ascii?Q?PHzxEmiyG3LJB07PMXex2/Vwec/OZIY9DJz7jx7DIENyxPCzAAsgfTUty3rL?=
 =?us-ascii?Q?PfvdSuYnKpc/iaqHcFDuQTxFho8GT+vBJ8JSW+m1hlAIOU5YMxkNQ5HfRktZ?=
 =?us-ascii?Q?fBJCr7s5ORgXgr/6vGgC3vMx37yUezK7EGge738zeLEmDJEjJloxWb2LDNXm?=
 =?us-ascii?Q?hIs2LTSzG4993zBb8nLDM13r/yDMjDyb94UXdEgG7ZXxdx0D6mal7hM/kQLi?=
 =?us-ascii?Q?7b44IlhgoeK6YCYEpyNbxtKGRnbgV3BrwYm4lJRADhtf1QA4AFymQm+tmc7G?=
 =?us-ascii?Q?s1UcKhvHLkuaHCe0AKF77COWcmrKWR2DJsGr+/RvLnsXzib7bN7xngLJJNvo?=
 =?us-ascii?Q?kC3tg2mSYCSB/12kM3511iouasl+oqd1TmzB3X+NdAJAQdGcUZiz+uAp2DXn?=
 =?us-ascii?Q?HZtkSN7dLjgemDEPju8Y2q7AmHh2QDhzcpg47Q5v1UwDl48lAXcDUHYKktXu?=
 =?us-ascii?Q?Gl4qXkprp4RFe5Ru93bSrDT+66eAtdBS1Z/DBXzjXvDUH2GzD3q19qbWTRkj?=
X-MS-Exchange-AntiSpam-MessageData-1: RcTlKfmnkLa+nQ==
X-Exchange-RoutingPolicyChecked: 
	pelQWlKGTAP88DhF4cevJE9mPM2rz6rIOWatSUmZx+G6/av2yvcJFf+sVixD+l6xojnOyM8ongagabpYtIgcCpgZ6P/FOcwqosqlY4TlRDd3UBzlwjm6iHVoRUUfXkshbCD/gYjXJawl4lBKsP19r47FKxCeG00CizKuO/LKNo8fOkI6sklqaiJzUGqpmedblxfGUU8DDfdVV3uD9Dx5U4Y4RDmysB9V1rkO69amCqKf61pyuk6tS2NP6QGBIdbVYO00VIBPK6PbfsK1kYlyB9i7XcGqiK3YC7uQ9YjArXexTiBbfV4NsEjoOkCkVOheYHyo8CjmjoBzBxOpXRwSqQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eFTHBCw5TQpEuj9qKW5kMOreEL53UMxhNHqaiOmmnAn95JYn0CdX53i5gEaMWF7RMCI/892lMmye20grVmY15sjXXngoyXGRCayC+6k8KqKuTYUnXHEnkBN3Oc7qnk+zxmGRTubjCWhRa+aAQwFne8b6Bhgkc4ltBGGb8mfQJwcc32R2ANYvl0OtxkuY5jL/YDP6gVpHHNY7+1Jda2AmT/BwtRG14OTnVb3pB2BavyoizRhnsgeI1wAp6NQ59SY8qCknUOD13Shkip/G2JWQ565U6bOJ4ZXyYiJ9eZsPv7BHnNdIkC3ObKS/IVl6rZ0Hknu4Dz6lJQMacmyydEOyr7pr0o8XR072dcA7CbJz5UO42xUe71iDZrJn74jRQ0M2b55NKmvAvPWJ0Z1kcMlzD1gmYDJ5Ll9CJHz/Jr7mjeQsQKgh++FilbiMih4kzMAcFRmjdzCVN2Z2LmouB2HH9OIxM6ORUKjuUokBuwAqg2S30pHHFtbYHLtwE3nhakBJco/Or1KwFi1SOHu6oJvvI3VZrzQPnc6rW2EHRKcyLUxnNFfft2ze1xT64oY4l9FEFdRn45woVv/IQk7XqJ/yl7kFXsNlRRrG/lGCOPnkLsQqUzWFdoF0OMA8hBVjSFtn
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ee7830-0132-4a61-26f1-08ded78214cb
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:04:42.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+dQF4TAJxDVQE+anNC8Y4l72KB59nkfhqb9lAhWfvtnKcb/IXn6SA36tCRoL1qECWJZRxxRi9pAaF5RX9o12Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3339
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gr3G72L8Fz1PKdp
X-cloud-security-connect: mail-norwayeastazon11023087.outbound.protection.outlook.com[40.107.159.87], TLS=1, IP=40.107.159.87
X-cloud-security-Digest: 538134fd91f3767a137b8642f2cff062
X-cloud-security: scantime:1.064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 15:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239985

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25

[2] https://security-tracker.debian.org/tracker/CVE-2026-56113

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56113.patch         | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 6bde9b1f51..65dcbe52ec 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://CVE-2026-56113.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
new file mode 100644
index 0000000000..6727bc1a69
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
@@ -0,0 +1,92 @@
+From 9f953ada0df6e7a568f006f3ae0ff10a77a95924 Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:17:10 +0100
+Subject: [PATCH] DHCPv6: When deprecating addresses, restart on prefix
+ deletions
+
+As that might invalidate the next address to iterate on.
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 5733d3c59a5651f64357ac11c98b4f39895c8d25)
+
+CVE: CVE-2026-56113
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/5733d3c59a5651f64357ac11c98b4f39895c8d25]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index bdc3664e..5154bf41 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -2480,12 +2480,13 @@ dhcp6_findia(struct interface *ifp, struct dhcp6_message *m, size_t l,
+ }
+ 
+ #ifndef SMALL
+-static void
++static bool
+ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ {
+ 	struct ipv6_addr *da, *dan, *dda;
+ 	struct timespec now;
+ 	struct dhcp6_state *state;
++	bool freed = false;
+ 
+ 	timespecclear(&now);
+ 	TAILQ_FOREACH_SAFE(da, &ia->pd_pfxs, pd_next, dan) {
+@@ -2511,11 +2512,14 @@ dhcp6_deprecatedele(struct ipv6_addr *ia)
+ 			if (IN6_ARE_ADDR_EQUAL(&dda->addr, &da->addr))
+ 				break;
+ 		}
+-		if (dda != NULL) {
++		if (dda != ia && dda != NULL) {
+ 			TAILQ_REMOVE(&state->addrs, dda, next);
+ 			ipv6_freeaddr(dda);
++			freed = true;
+ 		}
+ 	}
++
++	return freed;
+ }
+ #endif
+ 
+@@ -2523,7 +2527,11 @@ static void
+ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ {
+ 	struct ipv6_addr *ia, *ian;
++#ifndef SMALL
++	bool again;
++#endif
+ 
++again:
+ 	TAILQ_FOREACH_SAFE(ia, addrs, next, ian) {
+ 		if (ia->flags & IPV6_AF_EXTENDED)
+ 			;
+@@ -2545,7 +2553,9 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		/* If we delegated from this prefix, deprecate or remove
+ 		 * the delegations. */
+ 		if (ia->flags & IPV6_AF_DELEGATEDPFX)
+-			dhcp6_deprecatedele(ia);
++			again = dhcp6_deprecatedele(ia);
++		else
++			again = false;
+ #endif
+ 
+ 		if (ia->flags & IPV6_AF_REQUEST) {
+@@ -2558,6 +2568,11 @@ dhcp6_deprecateaddrs(struct ipv6_addrhead *addrs)
+ 		if (ia->flags & IPV6_AF_EXTENDED)
+ 			ipv6_deleteaddr(ia);
+ 		ipv6_freeaddr(ia);
++#ifndef SMALL
++		/* Deletion may invalidate the next pointer so restart */
++		if (again)
++			goto again;
++#endif
+ 	}
+ }
+ 
+-- 
+2.43.0
+
-- 
2.43.0


