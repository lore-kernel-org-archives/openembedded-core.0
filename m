Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44D3C54F54
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 06:03:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32935.1771567393320731365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 22:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ifPOQJPV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fe63f5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5i7Ci2041798
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=t97o7PhSp3gBbPzgdNHxYfJo1okVk6xgrQ9iSu8WcXY=; b=
	ifPOQJPVL257JUC9ERWziy3Q/+AFAugLWC1kyNLumoWk766Z2K+AyqexbJuVE/AF
	nOG2h1UW4vGSuB3R304Y6BdetC7IJWOGOYOedKxhhedlHNhHhD2QVonrf0dlzaPn
	783WaTdyhgtiKkzgCuDCKYM7oTwEti0gAEhbkUF10NTDZnnURWxA4XHAEaas3BNz
	Gt4PRqiamUmIW8flS3eSR9Kc6pi05OnmsGJHPGioUJd6IYz51AmEEDXAy1a6UVFh
	af4ra8Zpn4MQ7FaIQguCECkvPe9Qv4ZqCLB7a9VAU798KdScppyiwuNSdNtwNcCQ
	8fIkOUtsuHFpoS5eTJGSbg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdu159bc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZUaNsHNQAEfrXR/jckYMPx4UUgef/FMAZ3qUmbffNHlntB16mPHl8hoMgfHbrBMPbMEegszxTKulpw5Nfc8GW4uIASKKR47SwePQ1ZdT/8Nktg228+HXqiLtUP+0GVh/gTKpk5kIGY7KkCPC4u2tDxVtT0KJd0YTFzL9zxkN7BpXNOAWAqZYYCCR/QQx+6Xh+RLqyczECMfaRXSUO4B8x35PsMgjPLZgqg2NXMl/QIQMhh1tzI9gV+Jc95IY8Ht8SZjumqBkI5P9qqn+Vn3q0weL1LSEcKT3KTD//1zYgLDuNlwBt/FIms+qu0ohefpdg8sO9PutuXtJeUtrmGL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t97o7PhSp3gBbPzgdNHxYfJo1okVk6xgrQ9iSu8WcXY=;
 b=fNn5ypiZaoxtK5nn3u6EdPviavYzm/KFyQVpavRwFArIu5vNBPTLsJFv92biiMhVkfOssnqGWbdmUuXc+BXdH+KL3phuKdH71ONde6OacBpbyE8Q11iucvRywrta/UClwu4ulEjC8cdaKqkftHgeyrXxiMUI21RsTA8+5rHqp0MhreZpcUJh4r7u/Y+a0ODRVlDQ7tTSywARDtPirZqt+rrXJHs2zGFC1C99J1jcI4zqyi9Cx5pnw/i8HSstVWTC0pX4i0MGWwIY0rMQd8NFt3jNgc1tY2WJZXfvul0g63D5kl6G80TufpQuHUK8+yyHUrtddpsDhEL30J9O3MKNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SJ5PPF8622363CD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::83c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 06:03:10 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:03:10 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH 3/4] oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
Date: Thu, 19 Feb 2026 22:02:51 -0800
Message-ID: <20260220060252.77248-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SJ5PPF8622363CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a8a7a6-2085-486c-3915-08de7045b9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tDzgKQ/XacGanUeNNOgOYNN6H3eMbYHrUXMWz7sEVFqcQuN0QCE00TnCIg+E?=
 =?us-ascii?Q?+e9ldX1TsqBa2C+cYPrhjcvRjyoKEkHnbyUk68Mmmv7f26052eZJFTBR4r4C?=
 =?us-ascii?Q?3DPqaf0Kb6pyI4+KxmQlPrEJ5Y5YJepeWUP5AlSLJ4j4WBnqCV2hhG4f6kNG?=
 =?us-ascii?Q?nxw9rXikmYkzcpTNrzPXmJVlERyot2Z01YVQ1PQU2kKljD/WsHjM81yvMUmy?=
 =?us-ascii?Q?UnG9qZKLASQMOD+fafBUV0d6SUZbUD2UQNL2/Ns2JLtblCJBEHXlcfBXx0oX?=
 =?us-ascii?Q?RsBniCSaTsYIFJ/qCFgqW2JrjyltYfZD/cC08mDmtGcUMn2UBpySmuLq3nku?=
 =?us-ascii?Q?M0BBwbdSq2Hl989s6Iu7HtIm4fkiPZnpjlVFibYo6kc89muUB1SljtXnSNQ8?=
 =?us-ascii?Q?CWSnRW7XvKa5EgSZ2dgsgGYwc+fdxXLG9vZLt2/P6Ht7xer8vQkWtJhDjXgF?=
 =?us-ascii?Q?iOu/2FsOVYpZRizUg8IWF6d+Ke0hEd5FUk5ej4wa7L0wUk+pbeXd/FCo03mr?=
 =?us-ascii?Q?kTj7OrnQJm7XEnEZML/Ce7U7XrVRWJW79PoxUC7Wgp0ANCO5uNLlEXGgUcAn?=
 =?us-ascii?Q?QLxVCEIsbnCAjpw2ljbkdNuW+OoiWnYHo5CwkIxI+cz5cdtfSvrWhwobAIXQ?=
 =?us-ascii?Q?yd6768VaRr0Za4YhPvusWyC7PZJzppfi4lWY16G2tSLsh+AyaPlfMstuHlcj?=
 =?us-ascii?Q?DD8ViQSzyJY012kqC04hVjL7h0OpXtT1T+f+aQ/iYH9y5OqcJVM2weygNv/5?=
 =?us-ascii?Q?oQv+mP+ssYKTV0NbIPxdmAuWeSpcX85gdjA6XoRcUvDAqP4RTdujDcKXe8LJ?=
 =?us-ascii?Q?4iBXCE5nFek3iv8SU06kLP0IT5PM36+qDKMlEFIiR+brZftlYCAy6UAz+s9F?=
 =?us-ascii?Q?SOAHsD0kHf824dzH+yuEX5XM3foTyyQ8NBqejcz7IBdfPbeTQU3vUC0S1kJJ?=
 =?us-ascii?Q?PdlrYTkfM6vGHrrYW1xsGn4PnKTIZ1niFlKuODTvIW1sXaql49oABi5Wtufd?=
 =?us-ascii?Q?Ldkz+ig33GhgbDy0LmEupgE3C8MJ4UzXYJPMgQkqrxk5ftib11/Xq27ofESK?=
 =?us-ascii?Q?+YpoptIO3EFQPN2UlvmKd2jebs12kGzxBtpiC2IWVaqJY75VttWvrF4M4in4?=
 =?us-ascii?Q?6B/WI1TT904rTrfLZ/BhaAkTXJX/UtkrSH3zshDtfjVF0qmTp5Mq+JOdqqfz?=
 =?us-ascii?Q?1jKt8VLAA6XfsQprHWl8UqCNiYJy8JDioAB9WBQOzHEWL9ooECVV+E2Lco17?=
 =?us-ascii?Q?fQT505ec0FLvExQLYhArbCueHj8L5lr1OR5QccqnB5ZnUBD1c++Qa9kFJhNS?=
 =?us-ascii?Q?HcswaAG+SviMVE6/UPqcMG1+HsbO5Jo14+GgqftP1Zi2SLmFXAQKNhMZjvMj?=
 =?us-ascii?Q?iseNidbgFcZqBUEnjGrzn8aX+lrYgeef+8wEZmdx2qZ3vJIxM4S4n02sGA1z?=
 =?us-ascii?Q?uDZt+b4q1V1lClYVjyAy7PI6jF/K9GxHU5Nx1LUUlpAibsu32Ka2WkCOCqSX?=
 =?us-ascii?Q?Gzcd0biLR6UPF2QJG+vVFDdT/f8c3IeJ6uZqGDm77NigMt+wIxuPneH5JSBL?=
 =?us-ascii?Q?3h/SC/7VHKmwACsGM9mzbzPKCzBZst36+LtbgWNw7J6lFaVObS8IOaMV4bp8?=
 =?us-ascii?Q?QG4xMkuOnPOwAyXYM3YSjR0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?apBijEefAF6MlnpZxva27wFZzqtec2J6MTAoQvtNfMp7ghBoF9b37Y9vI4dS?=
 =?us-ascii?Q?eUT+yXxE5E7Qj8hv00lm5bcwPKKl0JgvENfcatLk46UkgHC/ZNCC/EpK8Qyl?=
 =?us-ascii?Q?iJQOet3URACUsRHDOQmPvnzgALRE9REW1eqBub80ZjkG2+U+eyFZCRsoj64h?=
 =?us-ascii?Q?sBmJyPW8C2Lt0flbBuLYqm4ur860txMO3L1vJ9FyHZcxzOHwoZkUVQVTFu/I?=
 =?us-ascii?Q?AMlYSw0q9BvjP5729dJhAGxYhd/Mk6riQGLmygi8LkYK8T4u+guX6XT9a1SQ?=
 =?us-ascii?Q?skl1kt/snMCGuQg5x33hem1Gj2qY2A0uIMQ79Qviq3GAX/Z6ylZU20BqryYK?=
 =?us-ascii?Q?/YD15Ne78HKlPw8CCKDq74Kyf5yuBmPHwqgN4wMS86wnB9fsGRFcUiT/vWJ5?=
 =?us-ascii?Q?9wAkZLRhM/DsNkwL4MbDWg4YCzJETkEfEO+qnodLyYvVtE5ifWfTLfVHg+KK?=
 =?us-ascii?Q?++t+nYrONGtjjqRlng1PGchbl1Cva9UWusuncrKrKjWCxK0aBjTJo8hCWtdV?=
 =?us-ascii?Q?rSUAaFKPQsbQk6b5OncRbwZRUs1C1Zd96bOM4Nfz9qqoiJrhPG/KzmQmajnX?=
 =?us-ascii?Q?D0kKqzESOKS4gkErGi8xV+hxvAKTqUFPu/lvWSSr4fujPl+DCgey+d2lED1Y?=
 =?us-ascii?Q?ul1bj6DpEAWjex7R5rfOdH67Oj1BK721VIYmAos37sNxovQZLNCbZHM2pMgg?=
 =?us-ascii?Q?zZ/m6axLOfW+yqvRQx5vZg+rQPgpCzWpVuOjPsgj4OLZiPblfYTF9Ohyo2HX?=
 =?us-ascii?Q?+pkBIdpO2f7tZXXiOWL1lfZzD2dHBRffwUc4ZEUTB6TTqsxe0FH3Mb+pe/zq?=
 =?us-ascii?Q?ABHcMA2zv9FMHhuXKFWRa7D8nsTw5D05c2e+FUo6dSypJ636b+SPl6AeD43x?=
 =?us-ascii?Q?ji8xemnT7TCioNePuHPdmGm+6VD5mx4DckFesCpoFeEveH1f9WfNXRWIRqKx?=
 =?us-ascii?Q?AUOcWuxAUFqtD+yk8ZGHe/z62QUZf1bq3cRLPT/jpHRFGIPwYznfGZA+Mi/9?=
 =?us-ascii?Q?hwjLzBzPiVx0GCxLnZQ28q0n2JsZ1P7ys3lcRxFH95XWLuykb9wbD8zHkmL9?=
 =?us-ascii?Q?KYyt6TPWjpad2JsOq4Gh3rYa6aVwKhx5BbxBcFLn4norn0CJkQBGS0ytJv6S?=
 =?us-ascii?Q?iT1SmkJ56bBT1Q3aQUQGodxPiNCyIQJyOhzs9+BlhxoJQxGeKVeckLFgd5fS?=
 =?us-ascii?Q?OdqhC2zID8/zSzVbtwK2tWwiiTr5MzzqdLgkJVHKop7d+2BILGotGi/JjBZO?=
 =?us-ascii?Q?i/MzHlWxx/GFcwQ7IMm7yxjNH8OWbogVQfqpYTcAY7I7Ap7Rz8Xy03SC12LV?=
 =?us-ascii?Q?OL9N+JnKD4davFLcU9AD539GBCf1UjQkwF68flKFhi2dkedX/y5hPVXmVvPq?=
 =?us-ascii?Q?3m8Kpa8tKXOMb0ShzR2e9t8zS0zVWWj6IYYr5kr89dEWfm1GjRgQgfBro8jf?=
 =?us-ascii?Q?EiMeQHpK6H+mwtVVY6FWCFKf1bvKjjw+YlSHEYszQlOAemGc5u+w3UUgsg/r?=
 =?us-ascii?Q?oIjF7rnjLE53mRDK2ykCYxN5jxiH+oPeu703NJmNrNs9VVGrsr40GUyyTVRI?=
 =?us-ascii?Q?DBri/buKzZz6C4Z0gTyv5YqieK/YwoHE3jywiQIKFbuoi66zZR6usasSzZAP?=
 =?us-ascii?Q?62P0Qss6pPFh+VwQDeHOF7PlzZ+EjQoniwCiwaD/y0Ig7arBV18ExpdGk6lF?=
 =?us-ascii?Q?QMUI7UEYNeG/t2cxY4cEABnoAdCxTkHRPlbuSfdi4khS+oHE3nf2jvGYD4g8?=
 =?us-ascii?Q?uK+FDAjidENo2B/h0mmE1HjJlxcIW49h1qrxyXTVwQRdA2fzAQSW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a8a7a6-2085-486c-3915-08de7045b9e1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:03:10.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voa8pkWg2yhuEmKrA5cJ1PbPq+0X/fp6jb2X95mnN1QCnCl9MDktXhh+zrmEfBsX6zhJjGWdh1Up/7Gq0lE/A5klo+pTO3uatqPghKAWtqB9JNpLQsTXJan4Uc6/qvT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8622363CD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1MSBTYWx0ZWRfX6anpeH3NAJbZ
 1oNmiB3rzTEKZsjaGbIAQKzdDJxLXpeNGFgMCJkPFTpwtxkbVluMGcRCIBW2eiBDEtPNx+w6kWG
 gAwLgTTQZfI8R173wDDst3nGyo+SLTdMdmgONxswqIjZyOSf2B5xNYNOCcLXZEsUmgOWbPUkLLK
 9EiJzgXTMlwqlbmD8tzCsRcoPVHJSYBVM21Y+BnzIwlWy/mFsGaC9g8dkukqhCzDOhKGkY1wBnm
 Yl81yBwnSbOTfZGGg7+JILaTHXM9hjWTI0pd+rDmvN4OsTBjJv7mqHkKhI7KGNknm0WRX9U95Ri
 UXIGin3lO3B04QU2JqYOq70pzaLIvr31Z70KGiacAtr1PajJQH6ftVMDblUDFCTarIVQkTRJRX4
 85gI/dY0PWlU8sFXLNhAUWHUpos680Rh92AJysFSmQVi6QT1+p27cDeZ1YnAzAjfTxChk19+w9T
 ifEkG7Bt6W9EYOTlVrQ==
X-Proofpoint-GUID: S8gGHyWCgv-YpLJVhUkLWK_ZKfcfeRDB
X-Proofpoint-ORIG-GUID: S8gGHyWCgv-YpLJVhUkLWK_ZKfcfeRDB
X-Authority-Analysis: v=2.4 cv=e78LiKp/ c=1 sm=1 tr=0 ts=6997f920 cx=c_pps
 a=7JMGdgN8pDCDbqlksaqmUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=SQQGA60Wx8lJcxWaSqYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 06:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231491

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Introduce selftests to validate LLVM, Clang, and LLD test
suites using llvm-lit for target builds.

The tests cover:
    - Target tests execution under QEMU via NFS using llvm-lit
    - Architecture and OS-specific test filtering
    - Known failing test exclusions
    - LLVM testing is skipped for x86

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 298 ++++++++++++++++++++++++++
 1 file changed, 298 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
new file mode 100644
index 0000000000..c307c324b9
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,298 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import time
+import contextlib
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfArch
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS = [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS = [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+    DEFAULT_PACKAGES = [
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.target_arch = get_bb_var("TARGET_ARCH")
+        self.tmpdir = get_bb_var("TMPDIR")
+        arches = [a for a in self.ALL_ARCHS if a != self.target_arch]
+        self.filter_out = "|".join(arches + self.EXCLUDE_OS)
+
+    def build_core_image(self):
+        features = [
+            'IMAGE_FEATURES += "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL += "{}"'.format(" ".join(self.DEFAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx = contextlib.ExitStack()
+        s = ctx.__enter__()
+        nfsport, mountport = s.enter_context(unfs_server(self.tmpdir, udp=False))
+        qemu = s.enter_context(
+            runqemu("core-image-minimal", runqemuparams="nographic", qemuparams="-m 3072")
+        )
+
+        status, _ = qemu.run("uname")
+        if status != 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ = qemu.run(f"mkdir -p {self.tmpdir}")
+        if status != 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd = (
+            f"mount -o noac,nfsvers=3,port={nfsport},mountport={mountport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output = qemu.run(mountcmd)
+        if status != 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=None, timeout=None):
+        build_dir = get_bb_var("B", recipe)
+        workdir = get_bb_var("WORKDIR", recipe)
+        lit_bin = f"{build_dir}/bin/llvm-lit"
+        test_dir = f"{build_dir}/test"
+        guest_result = f"/tmp/{recipe}-target-results.json"
+        host_result = f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex = self.filter_out
+        if extra_filter:
+            filter_regex += "|" + "|".join(extra_filter)
+
+        cmd = (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit --filter-out '{filter_regex}' ../test -o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLVM_EXTRA_EXCLUDE = [
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "ExecutionEngine/MCJIT/.*",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/llvm-reduce/temporary-files-as-bitcode-split\\.ll$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    #Fixme LLVM module testing is broken for x86
+    @skipIfArch(['i686'])
+    def test_llvm(self):
+        bitbake("llvm")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "llvm", extra_filter=self.LLVM_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=7200)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLVM lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyBase):
+
+    CLANG_EXTRA_EXCLUDE = [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "AST/ByteCode/builtin-bit-cast-long-double\\.cpp$",
+        "AST/ByteCode/builtin-bit-cast\\.cpp$",
+        "AST/ByteCode/builtin-functions\\.cpp$",
+        "AST/ByteCode/c\\.c$",
+        "AST/ByteCode/codegen\\.cpp$",
+        "AST/ByteCode/complex\\.c$",
+        "AST/ByteCode/complex\\.cpp$",
+        "AST/ByteCode/const-fpfeatures\\.cpp$",
+        "AST/ByteCode/constexpr\\.c$",
+        "AST/ByteCode/fixed-point\\.cpp$",
+        "AST/ByteCode/floats\\.cpp$",
+        "AST/ByteCode/functions\\.cpp$",
+        "AST/ByteCode/intap\\.cpp$",
+        "AST/ByteCode/invalid\\.cpp$",
+        "AST/ByteCode/lambda\\.cpp$",
+        "AST/ByteCode/literals\\.cpp$",
+        "AST/ByteCode/placement-new\\.cpp$",
+        "AST/ByteCode/records\\.cpp$",
+        "AST/ByteCode/spaceship\\.cpp$",
+        "AST/ByteCode/unions\\.cpp$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "C/C23/n3018\\.c$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "CodeGen/compound-literal\\.c$",
+        "CodeGenOpenCLCXX/constexpr\\.clcpp$",
+        "Format/docs_updated\\.test$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+        "Sema/arithmetic-fence-builtin\\.c$",
+        "Sema/atomic-expr\\.c$",
+        "Sema/builtin-expect-with-probability\\.cpp$",
+        "Sema/constant-builtins-fmax\\.cpp$",
+        "Sema/constant-builtins-fmaximum-num\\.cpp$",
+        "Sema/constant-builtins-fmin\\.cpp$",
+        "Sema/constant-builtins-fminimum-num\\.cpp$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "clang", extra_filter=self.CLANG_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy Clang lit results back to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyBase):
+
+    LLD_EXTRA_EXCLUDE = [
+        "ELF/fill-trap\\.s$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld")
+        self.build_core_image()
+        ctx, qemu = self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result = self.run_llvm_lit(
+                "lld", extra_filter=self.LLD_EXTRA_EXCLUDE
+            )
+            status, output = qemu.run(cmd, timeout=3600)
+            if status != 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}")
+            status, _ = qemu.run(f"cp {guest_result} {host_result}")
+            if status != 0:
+                raise AssertionError("Failed to copy LLD lit results back to host")
-- 
2.49.0


