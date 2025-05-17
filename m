Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126B5C3ABDA
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 12:50:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11080.1747486241976403491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 05:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72320f9001=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HCg3l7021063
	for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 12:50:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46phe8rauc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 12:50:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn1Wt5lkXiY4qgoKrdQMeeSmPDdKzy5Akr6ErjcgAhP10sBYMNxQe7C/ZC4jpPxBjN92NOYlcNmrEtVySOJJQU5WV78topOnfGR3mf3vS2fovfxKagRqeiD3mEFjrko+y2DXFPSlW94jptG+VBnYtepBQ5uU8HSV2Jqz5pnZGdzWRjv0biVk1onXoO9IG4GQvq9uQtdU4gorRzt40SJxi/o3j+ViOTKGuBpOFdaQgIKO1C+sq+MkaqevcNdZ7HkPRYYLbiSPuSHTZug0ZHf8NKqdWrK0vWQByuZtvfgQGuEb5nQzSTgxcQN74x9IU1mWNswuJMkboHj+5/yBT4FKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlidnR5r4QOYgAyIizUts1NTnbQRCUN39dJ3YQoGXy8=;
 b=DtSg3AUz8vd/4CH+TkqdDk3sia+0uSD4xRyqStGRhh0/QhN1RJuzw8mMgQU+I3EQDBsyyT8XsgyS2pej8g+rxk0aAVnPSuuHOIg5YiCNGzStkLUqr1+ccT3CeMCQ5V8N6BWX+GEG2r8yGpS5uoigWhunn/L6DChH1FjsbLI726RC2zSpD0T6zt8fvGjustXr7sHlT2GT5TRn3qfGqQVZ3w7u4j24uh55QX+HeyyFtnrf2rtrhihQyDMdPrnOn5bwUrLskyS0sIvFVGP8HXew/q6dVeRi9CMyrY6rdI00O69bRH7FFZRAnBn3Vaxnbs82DEULMg1XQJEZ+eNCo9cA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY5PR11MB6341.namprd11.prod.outlook.com (2603:10b6:930:3e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Sat, 17 May 2025 12:50:38 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 12:50:38 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcap: upgrade 2.75 -> 2.76
Date: Sat, 17 May 2025 20:50:24 +0800
Message-Id: <20250517125024.38239-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY5PR11MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 886dc98b-4e63-4838-96b5-08dd95416c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h8HLq4DpodoO+TFDg+KbZnz7OxImW1kmqnYYzgfr0lVXLoOzZAG4xuQOF0Pe?=
 =?us-ascii?Q?KTWi7yy0sKs5RNhvmFYno6p/OI7KM2qn33agx8aTLbZzjJQSxiilsh8490my?=
 =?us-ascii?Q?mg3JZQQRoLtXSM/e33iY7LNQxmcrtIlOrRo0iUJdR/ZpMSCHanKSZRRGFwAB?=
 =?us-ascii?Q?jHA9trFr05zaMxtYkvmicBIvc8odrPiTtUVqnelR45Nk3/7fy7y+C/qyKQKI?=
 =?us-ascii?Q?oiWNCi2aEmmTb/jBgPGei1rtv655kc3KG9N+vf2wPyV8HSsNKcIxC7IRjHDt?=
 =?us-ascii?Q?X1o3kqfMxcUuhKNJFITPam0+yBA1is5GSWSrRJj/mh8fTMLeA74+/eqRF5C/?=
 =?us-ascii?Q?hEdqajtJo8r2zV8P3CaCQ4YWsiBEYzrmuYEu4KJbpb8eNZssHG898K/7Lt5Z?=
 =?us-ascii?Q?nXLl8u/0dHPMOeTsZYuafGG3RncSNm5c3qBCFUsWsYh2Gkb93GMA/1pZ99xj?=
 =?us-ascii?Q?aFBWhL/zGiYuHEfLFrG3Fu4t/3cmt8T+Me2s6dSNnaUr9ajXr+/0UlFFIihW?=
 =?us-ascii?Q?Cf1k/BXKCFc5R+ep5fomVNNGoOHoUKKV1KR/7ze3bKRulvi8iK8icTE+NcP4?=
 =?us-ascii?Q?7CJbobl0jhQpsTLMt44zdr21vfXy62eLdkufjowWe7hnwSk8J0qMs/OJ8VdY?=
 =?us-ascii?Q?aeMjLX3zIOLzS4+zxZjb6KxW/gyWuEH86mvh0GHAAPzxVMlQage8bWv3vyGu?=
 =?us-ascii?Q?S6wypCCR4TtSbpLQZoTCGy+RcUuW80ExmDePF39hI3uZdSB39I1PxwlWBgDr?=
 =?us-ascii?Q?Yn0EWQ7vAeWpEFBliPVvdyAIrh11u2cWe3AFgSQI5m+OE8o/lrpKbPmmxQ7H?=
 =?us-ascii?Q?Kjk0t+k+fNPEV2rbVJ4MyfICLDSfbfUo6UIvxNjM/zauuRSLjGWVMJh/vzNW?=
 =?us-ascii?Q?QpK9W/7yE8ccAjTfSHWb2Y45tn+O7Y/OLqSl0yjYuzpIIk/B29v3QM+lVZOx?=
 =?us-ascii?Q?kOBKE9s1SD3StkoFJHflia0WvmTsQk4eNkHlWB25lYGO2JWspVBuL12gG3zv?=
 =?us-ascii?Q?OcconRyUyXURInWekZ3NS+Hzq5DPTBT/P2s8O8ZiJEpW8YXdTngJkSzkR+N1?=
 =?us-ascii?Q?QQcl8nixJyf3P+8b9zNxAd9A2f60owGKSe7zdkfUr5CGfaUtLJxCzyImOjNv?=
 =?us-ascii?Q?E93iHCmn/pdKCk61idGlVgryEktz5UWzeDiYU6sQOjix4Ep5c3DiqLxcLNU2?=
 =?us-ascii?Q?qBFWSiWMWqzIrgrh7O47R5QyZaC+IBxT3u9QJinvgCaQbdEwuH1IjdB2K60l?=
 =?us-ascii?Q?4pJhJqT0T825/n6aJbVKrTJ4bPaMp3tqKkFmY3xNQhzSP5TUZjzljD/TG8WW?=
 =?us-ascii?Q?vjG9wLIJYXQTQc9Mv4LuqKfCiZNiFGu4NLk1/TMWclPYsMTu4psyOAqlvs1Y?=
 =?us-ascii?Q?V97a0soVdDdu48loOq4imJ2jJG5jLgIOkDvkU/DNwws/MwH37xou7kECElkD?=
 =?us-ascii?Q?vR9knhSwLfdu20hnVol/ExBDBf2ViLzb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NIYcHupUI6Bc9LJAeauyZ7y9zteDPrGgj6zWgb3PQrveHG+JL+g7eCfHiPgn?=
 =?us-ascii?Q?ZZI/Y4YH6ScLyMN8BU/QyHVaSGXyxy0vJSmyyf8kWHc7RjgPv2F4Dhz8pwMf?=
 =?us-ascii?Q?46zvkwy8K9YmT8NVSsnRFU9Er5zfkxZ/01cNMCBQv6AuLj5+e+im08xaX4GE?=
 =?us-ascii?Q?DQjL4T7Rau5R2IkVsmp5K9rHf8FH7JXtzC9FFz+dY7kd72avBQUERl6Mn9Hu?=
 =?us-ascii?Q?seh/+IBoaNezpB5Odbw3k5CQdR11E1pg5exP71HJqCBewjP6x8u9XOANub1z?=
 =?us-ascii?Q?RFsoYkVKV+wimthCEl13f8pph5aY6TaHRSfYYr+d/Mzm77iQKs9QXoQ0vQB/?=
 =?us-ascii?Q?8GkBXGmCpZGj8mOpAiBAHRAEvFVqvunSNoUM+WBEBVTyVT+Z6betT8xcCkl8?=
 =?us-ascii?Q?+dPQbfiKC3lvVPetTGKf69Cxg1dWQjJifFAAO84nVgwHkqBY+Gubhyn7ORmC?=
 =?us-ascii?Q?LrzmuJn3HJ7Y3eE9cZRD8usnuMjJGVhdfmOeAc9gcd0D1U6/boC1Gwum1Nu3?=
 =?us-ascii?Q?VzR6tBbpvONQQgTny2uhgUeuKlLvK8pIcBvrU7za5DG3qqINIgaX584XM1+W?=
 =?us-ascii?Q?1yLWlVEt+DCroU8GaUJGaqfa/Gh5IeQDpq7Pq6q9nk0MdGqz0+RjNx0GiZXy?=
 =?us-ascii?Q?/aC3PSKaI9XRMD02WiTNM0mQefgB+9FxaKAjTTqb1Vhfs/RAkKB0leqC/HWG?=
 =?us-ascii?Q?gv7Wa0M8heXqgBq0K65Rp51JeXKHXA2/m45YpoAGP6yDXOCBNUbxytLbIdon?=
 =?us-ascii?Q?hwJXW1ZyV0hHfYbs3jS/A7+Bnkc21z0NfUJiyIzmgROf6op76onTvJvZfqJO?=
 =?us-ascii?Q?ieRBZxhyjYJFWqLrM1SJxFXqL5SodMXAa89gUv+/rxKaocvQQRpZ4bsc/zdl?=
 =?us-ascii?Q?GrL5RXB3xCBJyjutOEPZq4cHf6sBStE2LkQnyhIGP6Ni8kEM2Fy9mjfVPEMQ?=
 =?us-ascii?Q?4i1/zAk8nMWFwPKLJpdXGL7HJmO6hhm65UJQUe6zMbw7yTZAa+IZm9h18ooS?=
 =?us-ascii?Q?MLa1IrjoxqkLPKGL1oD+zPGfjz7FZaLsih6xzMmKgZbJGEgXvLCdu5mTmWRA?=
 =?us-ascii?Q?qo0J1+Oozd05RLKWrCr4Veg96jrCwjUUI08c60CMWXHdVq7QhowAomDjpwvB?=
 =?us-ascii?Q?vOlPpdiDBd2XRGHyGZ+MGfNBPeAAvcHO01+xUjswuD8QnCVVJBzJ567i9YKH?=
 =?us-ascii?Q?IBNE1RRqLD9jqtR2CZYIsXqvXWAKe20sdKeSymMWguulbwG/3yUYApmvzJuF?=
 =?us-ascii?Q?QDTLSUXZ9NJ16EXtvC3XNRdetp5IMMvK2CivoffaLSNi4QxPHcuWg2QhB/Xb?=
 =?us-ascii?Q?vD6UV+l/kOLBqL9wIdsyDFr+92/5ONI14+6D4KIJWqmjHbcczTW/Uyy8CQ9I?=
 =?us-ascii?Q?UhcCSJDMl67cjawVlTzq/9kox7C7KAICwa6TEx9XN7lC875rmqZKLlPwO91D?=
 =?us-ascii?Q?4SQ0ls4hs71aps6nvYljl52OPyejXnJfi+MGFXi0GExPaiDfy0fJq6aGK+qc?=
 =?us-ascii?Q?9Q6sOwu2rpCVGZbunxeCAEMVidj187F42agHSr2Dm7Nedhy6L9sI+lb+jmkF?=
 =?us-ascii?Q?0VuHvIzSvnxbl2BxBse7nDQcv0v/R62gkobQ6Kfj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886dc98b-4e63-4838-96b5-08dd95416c79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 12:50:38.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bY8tyOghJnyJNFMcd18Yfne2QhEEVqMEmAUVohQTgOiYwoBS7I5jbFYwISBJwPHb52iiPPVEiA2TTY/UqfWocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6341
X-Proofpoint-GUID: aaH8SZwTE42m0p3PvWMZOaIouQqd1FT5
X-Proofpoint-ORIG-GUID: aaH8SZwTE42m0p3PvWMZOaIouQqd1FT5
X-Authority-Analysis: v=2.4 cv=arGyCTZV c=1 sm=1 tr=0 ts=68288620 cx=c_pps a=v3ez6FdVe4RSF1xj2bRqRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=gFgmyHasAAAA:20 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=N0ukx1Hkg3zIgR4DPLAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDEyNiBTYWx0ZWRfX4symAwK2kIQM 2P4JZe/eLOanFAGI88acqL3/qvw1pNRUFZMmTinxkiCvco5TyrFGsRyOjP2eRrLZlrMZhLehud/ 1tcH6lF79hpqbQdji7UpfKAlR4ybL6uhuIOlQ5jKsdJjLdb6ws8UvDWHKw4irg3mUK21nO229Zz
 2lz5BF5GMFsFZRGrX6gmlJ6x21JjHWQVdZ0ssR5SAlvczVMUiI5JQIBrMhkmjFqv4R8tw6cjzUk h5o0jrNXmN0cly8zW0TDChJ0WSvQwnmm/dfU0DlURrSmj62LOgMKixluznLBqlLCXMhWlHy+jYI HjS/oWKI8M6Hk7AdDIj00P+GOubVdOV5GofUvGez6b9KDWcXI0gIVAHgHsp1vTAu5CgVUudLZ8/
 7JSt0wIJUrYR0S0ZGP/0B6uCCyk09lOYP6Ue3mfnMG+rnuH0/6iXZzmKdNAyd1OsylBX7iOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=894 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505170126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 12:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216768

ChangeLog:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.wqnp1zp1o8bm

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libcap/{libcap_2.75.bb => libcap_2.76.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.75.bb => libcap_2.76.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.75.bb b/meta/recipes-support/libcap/libcap_2.76.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.75.bb
rename to meta/recipes-support/libcap/libcap_2.76.bb
index 8530f13295..c842246fc0 100644
--- a/meta/recipes-support/libcap/libcap_2.75.bb
+++ b/meta/recipes-support/libcap/libcap_2.76.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c445bc04f4742d83632"
+SRC_URI[sha256sum] = "629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.34.1


