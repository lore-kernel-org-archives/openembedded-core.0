Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72193D68BE6
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:19:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36407.1766042342180042934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 23:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rmUi3ckt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44479b5b93=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI6udQl3997628
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 23:19:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=X8NomQvR54gCo3WeQyDn
	UxkjviSIY8+tbvezlPc98yc=; b=rmUi3cktt2uJVExkJcshDOk+7Tizt78X74DD
	KJwPbWqq52GyN/3Kqbc/BdddMZAnIeqUW7Nk5yJmacbpzEnlqhZ7rkpouZaYTOCq
	rSDoFyGjtNEuGj0SE5GpGJFTyMtfymSxW4ZhqNyGnWnujQGEDrWDbByySevE7BCw
	7jk1MwFTYDVDz7H3861tSRJrONurLLSRF6nIt2D6T+N8pUkETot+iQwypK1o3hml
	9vIRb0NvBPjypEf9MaP2WRRegZY1KwZ3yEnrjZ4G+g4nTg6DmXf667TkWPN0YnqT
	C4u/0CsCXf6/CdZrV81fQjGXr1yEuISFlaX088Z0RF1ZJYt/7g==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010037.outbound.protection.outlook.com [52.101.193.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k6j1m8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 23:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMHLWOwMexZwyA8YzqJfJA70p2eskPu2/Q1GJyKHD++jVvMW1xaoWWT06wD/1slmK9tZOPv7NudGiWuFNimRPBCrLIFcQ9jlE4O0cJeMauWE1ebQNM3Pf7UF68j5oDyt/cx4N8K5u0y9UOBXPNI5uWipok+mPvuf+nbOXlGWf9lKyrGR5kg/JSsPGUdXFOQFNtwQyxG4wWdF8Wa9+PriP1haftM7Jq4K5Rya+D+4PL2plZwTrLcZ9IbNAHkSyvVWGs2Eac0khBzSS4GzsibHNlCu1/DKn8fAHtjofcK6C1Dy/vFtTZnXC4KzMXzXkC5ojquD+kNk1Hsvvs0ZLNWtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8NomQvR54gCo3WeQyDnUxkjviSIY8+tbvezlPc98yc=;
 b=L8N+kOdGca3R+EAtnv2nUW+aIr5fwTTQoOAwZ4AQtE1DNu5B8IsJZgDVkTVoGFmJ2J+vJC5Up29qNlRaQqSbOME74m8LGLRkS6hvE7mq0OK/RLH74vmniTTOSK5VrGn6qQq1oFk6zjbm2Zopph57stiK7vNb1iNoW96ktTrsfpmeQt+S7oKAQMt3Fdw9MlVlNMFZIJqhskbhjyUCCeZMpFUHkFp/A+EZJkUqFMaoi5v/cZHSPV9U05+f0r/k1JPsyp7DkEhriit/UP+sZgfl808tpf9esWKdC3gqsK4gM1VKlNrQtD3IkA8fOdZxnZGgCa1f02c9GXxD23EuiHT3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:18:59 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:18:59 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 0/1] go: Fix CVE-2023-39323
Date: Thu, 18 Dec 2025 15:18:17 +0800
Message-Id: <20251218071818.4106098-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0231.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::9) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b59e52d-9f61-408f-802b-08de3e05b64f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Ue8xYn0ivDhXVRjTJEDFzIJmosJX97a2vu0Q2Kc5t55ptCkpbs1idbuDwui?=
 =?us-ascii?Q?P/4Riy4vCZtU1n1OJmQRyjq/vo74ydmq3aDMEDy4E18Gx3aomtDw83qkwPN6?=
 =?us-ascii?Q?t4Hc04mNuZRmkdopZxWCACeRI6Lj+QuPsl3TYuty99UXNgpAplTA0nShqKZ5?=
 =?us-ascii?Q?gUJ0Gqvm9hZaAauY7FoB6Ubip6H6EZ+v11tlZpgjeRHhG5FNTC6j7T7Hpg50?=
 =?us-ascii?Q?e/Rq1a9a+aZ54LNqFMO7c5YDyV0utSQrMeacDOQ2F+vvLq5n5UWAZ8QUqlvL?=
 =?us-ascii?Q?+CsL4LDJa5jaxgk2jllO7Iy4PjAN+rWGtzOcL3bMarfZTvLRCGudwG7HEQe8?=
 =?us-ascii?Q?1Nz1JVzFN0JYHraPNrWLEtTmjE305nMY5ARe4REyj0jomL6oGQFIBL/oQY+b?=
 =?us-ascii?Q?HKxk+KrnpKdcLDuDPF1Jt02C6fupgmt1RS29fiS4v6upUQ+BtHkIz6U4D5zu?=
 =?us-ascii?Q?F1J3aSArXVY3cIHVWlz08ujTAkae3mgYLlSo6ERqv0IGSRUOQzwuJq1CK5fh?=
 =?us-ascii?Q?lYm6pg4Uic5v/pz+/W7a1OTQ4sx7UY2N96iS8R8sezPt9LL2qhJf/bw71ldU?=
 =?us-ascii?Q?ds8qB+obBua+vuLMFJbLxomNStr/o3IRhWdsyOOERp2FhyyDvhVd8B2oxgwN?=
 =?us-ascii?Q?xvS8N2dVQEK+49IyzylHMzHuIppxuWpAZxWpseGMZexHKkT1DjJFd8k5/aPR?=
 =?us-ascii?Q?+hXcKv7T92/1qy64EXDamIiqIsGjkzJNqQC56bZAkfdSnoW5H/t4qA1tFSU4?=
 =?us-ascii?Q?ibfYeHiSzAe93wHVB6hJMMNecWI++3aUiITkbZYQeIktEdagheTCu/kdSLRk?=
 =?us-ascii?Q?OBZArIq67SbGZOlNJGpnJd4rmyAR9LMICEjhDeSFS2vg9NclrG6dgzDfzWUx?=
 =?us-ascii?Q?L1OGr6IF9K8aB7pez4ao14YGQEDKzf2IpoRv62kLeMz+Ks3r2yhzNh+PmErg?=
 =?us-ascii?Q?TfFggXDp0VQyrJCOmI0eVGRyVeLvWBsi0LFab7stEefQ8ygpW16xz2S4iY++?=
 =?us-ascii?Q?3fR1xP8HU3ftpaN+dV4e8r2Rsy0qXkuCBT7ReZwfCr8i+TrpWBTkjLfQK9Vs?=
 =?us-ascii?Q?ukbl+cwqoEfg6XBbAvB35VDDLTSb4gG1Oc0kKm7GIwrh9LbARU8bNq1RnatI?=
 =?us-ascii?Q?s498XRIJ0L26sqo+sJDBfPcY44QGs4wsmYPtrxM/qeC4CSD8ZGP5h4EnPDYx?=
 =?us-ascii?Q?BahBDUnt2Ccu5NjE3WLk3JGFdic+CGnn3jB5q8dM8S5s/Xkn6xU6nUllQNJ2?=
 =?us-ascii?Q?7ywWmBM1+o+li159gS2KuUAhVD13rcvLr/ZHcog1IasOhZtbCVE0PPMyodxo?=
 =?us-ascii?Q?2YSPN9dfutlYJniqcUd4a3Cb3Q9humkah3WYzSOTajaasW8RUhjp9Xink8+l?=
 =?us-ascii?Q?3uWl2J+LofXCm4V76gSsxM3D8Kc8A75SKN6RJaP6AiNoj/ANT6XQI9BNOH+T?=
 =?us-ascii?Q?oUKisj3CeYKw+es9XzzYfYRIM6swABL4hbVruLi1ZzfcM2S4xcTzERnZgh80?=
 =?us-ascii?Q?5b72BMJ1Pn0oOiB8s84OS6Mydt9/LRV00+bZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jKiSO9D/2Toq0UhTpt0qVphYhdUOAzo1KJKyPThGpQ6WhP5SUlC+vfJEPg5y?=
 =?us-ascii?Q?2tatQs2JsHSijRxY615ACRdVXP8PbrJxyCsja/q/P/AOFl2av7qolY1Uv1o2?=
 =?us-ascii?Q?69MKnFlfxRugouTIKe4+SZ0BjTMfOx7DlBfJuaSyqKOYwyzB8NHZsCpwbS1/?=
 =?us-ascii?Q?XFYsWJ5QdwkjgrxmgnYHjIGTo/eaJFwmIBLSYHpOjvchG8jhCkUVYZ114zX7?=
 =?us-ascii?Q?yOBrx6drLjaAcndT+YS7F3oXmhx4xd0ON6ZTvUgiC2vvNJHh5zKdpgx948Rn?=
 =?us-ascii?Q?Jc3t3Hq4tGnzBR8+XCewAep3nkQp0wfl2Rl6Ot2zznVgMStNvhaQg4PLaYzr?=
 =?us-ascii?Q?KvuFQsQg4Gjmpuhayl6CuL9GKAip11OwkMEDC+fW7XXHBxkCBsFqINxoFltV?=
 =?us-ascii?Q?kghFtowmf8UrD45JVUed2o0RCc8v87ayb17VADzb0e3T2/4UAccjFKgDdFVG?=
 =?us-ascii?Q?KeeexclaGS/Enpm4i2oYgvM7Z7sfT/cCOj6Fu6b0w7nb6a3GPfGeVXkf1S9I?=
 =?us-ascii?Q?QVpSu1jTdyBm14JbrpmaJnPxk50R67HsZqOiXh0PREx5lSDdOeET/GJZfnHi?=
 =?us-ascii?Q?QniFtQMm0AdMCeH/ttY+3da/Mb7QVbLrnci+2PjyQWlK2WnyuCo1wVnKKd3O?=
 =?us-ascii?Q?wXxEBBD8ukCecsbZJmZM3ewO4tc2RyrODPaP35daLox0mLAVuzP/G+nPotnr?=
 =?us-ascii?Q?mI4xciSDv/kGQAAbyQ93YCwzncziObAll/Ldc+bIE391JGfI2YDjQKJ8rKEs?=
 =?us-ascii?Q?atnUgkMrgXjplaSc2W7ekHpeDNfF+nyTSKvbErKNIr6Ni93xtIeLN/48P7sV?=
 =?us-ascii?Q?5bbmJz45ln/tfJiUlzOfCta4nKIOFotMONh11BQrbOB1YSLahCey78xR0bCe?=
 =?us-ascii?Q?qWE7UDsUaH9kDoGJ/YzMBEweQDFHmOyvr8Hy9eYHMGphtGI0MU9dUZ7tKcLg?=
 =?us-ascii?Q?Gr0bnYRuKQdl4qqOwvOpDWpCbPTO/7VGMt1c4kfkkU5KMHzooH2qNx8F53aT?=
 =?us-ascii?Q?LdL/fCp77A6WOM6p8KtnWUrKawiG/ZkamADWjHpCLvgu9ALYDjeKJem7v4+5?=
 =?us-ascii?Q?Tc9P+E4jkTFAUZ+gOMxalVtFmiOw3Y1VYdFr4GX7NZmyZXwHIe70FJwQUR6a?=
 =?us-ascii?Q?y5gUKn/9qvHi+2uqXL1ZR7M7Ay3jFh2lwQ64jmb6tF7AGsobRMukPc7iZMSR?=
 =?us-ascii?Q?JNDkysciYtaMwI47GYe6DqaLj6QkGuMa20ot2YTMuAxP4DZGU3DykCcxjQKo?=
 =?us-ascii?Q?kRSB8qP8UmV870OPwgrr0NAs15d3Zics9+BxU6oBf50JgTvLKV5/tLCuFCUq?=
 =?us-ascii?Q?DXgcN+niJ1AGaUlPaCCBocifUNJhVlRmcWXxlIiF6BFDd0r2hgsJEEZq1Ax2?=
 =?us-ascii?Q?Qy+ySPE9QZ/aNxhgZ5wnMAmkVUl8xPsWkWT788hr6AitFKZC+Nhs/vKYfnYH?=
 =?us-ascii?Q?QwP4bvlY1xaXXj0CWjw9mOX6F5EQKykOFFEpxg8H0z5fVfiTuqVh7su9GOOo?=
 =?us-ascii?Q?iQFiIkD1EqYYctA+Pi1QnN1akTQAi21+A9SjSiZgMuXUspN2QAPVDBjdJBxz?=
 =?us-ascii?Q?HVViDe+8Loxu/d7Mf5Kv+vV/OoflRIKjujdtl0o2RO+m6HAHZ/73Ooqak+s7?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b59e52d-9f61-408f-802b-08de3e05b64f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:18:59.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWpa7MKZXOhDQa/vwwyVUSN4ZkCCJDGTLvafRVHs9TTKFQsfH+R5GDzcWmlTtKDi1pOOJGJgU5pRn+WNBb/oGDoc3g+TalZqiy0RsqW4EaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
X-Authority-Analysis: v=2.4 cv=ErvfbCcA c=1 sm=1 tr=0 ts=6943aae5 cx=c_pps
 a=BZqtFTcsvC7LidonbSP6GA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=ZgYacfYeLsUf0t0JWCcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: w3kku-dRr9jk90HJYZ3gY-CYJZ52F2LO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1OCBTYWx0ZWRfX81dk1zULJkQf
 nYVtOTki7I0p8mlV2gHG+q5T8ZfiKLvZI0gj5CLahQsCNuRY/nK8ZORKlE6LdGmyeUdR6pjAqWm
 3oko6V8a8oJiAx3IRSS6UGIQ1ejgD+IjYHQBi6on+HQg2/+H7LxhiRMuutltmcj5SUH+bO/PlkW
 3Qaa7zHhkU+2q2t/wEwx39JczfKo5SccNqNx9aX3MkVukIvMJVOMwPiVuHUX/0NGvlrBrNj2miv
 QBdVI7MdMiApQQJd330MyIku+nh6Yfc51yu4tau/qlM8lfFQ2VWqFCLesvvHS2v2YNPS78VES5N
 Jo7hvkk+i8z6IzE//TqZ4aaQ6yEXcdcTuWVsdtHU7tooeqJxyvo+oiUV+GSF0yC4J7NjgtKDlql
 IwG5pG0VhQMyfBHDYQEyYo7E2l6dmw==
X-Proofpoint-ORIG-GUID: w3kku-dRr9jk90HJYZ3gY-CYJZ52F2LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 07:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228090

From: Libo Chen <libo.chen.cn@windriver.com>

Test steps:
1. git clone https://git.yoctoproject.org/poky

2. go to kirkstone branch and set up environment
cd poky
git checkout kirkstone
source oe-init-build-env

3. backport the patch

4. add the followings to conf/local.conf:
IMAGE_INSTALL:append = " go"
IMAGE_FEATURES += "dev-pkgs tools-sdk"

5. bitbake core-image-full-cmdline

6. start Qemu target
runqemu qemux86-64 kvm nographic qemuparams="-m 8196"

7. at Qemu target
7.1 go build test_cgo_error.go
7.2 go build test_cgo.go 

Expected behaviors:
7.1 command shall fail due to "only allowed in cgo-generated code"
7.2 command shall pass

Test logs:

Poky (Yocto Project Reference Distro) 4.0.32 qemux86-64 ttyS0

qemux86-64 login: root
root@qemux86-64:~# which go
/usr/bin/go
root@qemux86-64:~# ls -l
total 8
-rw-r--r-- 1 root root 106 Dec 18 06:14 test_cgo.go
-rw-r--r-- 1 root root 304 Dec 18 06:14 test_cgo_error.go
root@qemux86-64:~# cat test_go_error.go
cat: test_go_error.go: No such file or directory
root@qemux86-64:~# cat test_cgo_error.go
// Copyright 2023 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

//line /tmp/_cgo_.go:1
//go:cgo_dynamic_linker "/elf/interp"
// ERROR MESSAGE: only allowed in cgo-generated code

func main() {}
root@qemux86-64:~# cat test_cgo.go
package main

import "fmt"

//this is main entry
func main() {
    fmt.Println("Hello from custom Go!")
}
root@qemux86-64:~# go build test_cgo_error.go
# command-line-arguments
/tmp/_cgo_.go:1: //go:cgo_dynamic_linker "/elf/interp" only allowed in cgo-generated code
root@qemux86-64:~# echo $?
2
root@qemux86-64:~# go build test_cgo.go
root@qemux86-64:~# ls -l test_cgo
-rwxr-xr-x 1 root root 1772006 Dec 18 06:15 test_cgo
root@qemux86-64:~# ./test_cgo
Hello from custom Go!
root@qemux86-64:~# 

Libo Chen (1):
  go: Fix CVE-2023-39323

 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2023-39323.patch           | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39323.patch

-- 
2.34.1


