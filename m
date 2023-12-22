Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E92EC41535
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 07:32:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.18788.1703230320381288940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 23:32:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V1ysy8pE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0720462997=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BM5vOXi011092
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:32:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=aEti9KxmydR71w5V8G
	IPeXpbGPcZSY+8kmHAw6Mk9oc=; b=V1ysy8pEgb801wvH8lEx0iv2lqcMsmjszm
	f9aavZbfSZ0ul5k7uY1D36jbirtPpbuszYAmBx8AbnseBdB0lN6bi/CZgduM4CIn
	4U3YHCrQXYnYwYqaN3p+FGcf5A/VqTM9FmPCTnp8VEHEs/pDZcvYBmeWFeTM0KMl
	1rUVBs1q1ApCeLuBnn1EYjCY2GmijsL776HPLDFjOrV8T8oK3mDMDn5+1gfWrncR
	WwlEKvD3BR2cPVJaLltlCs5715jDSRea8TNaBm0Avhs6P64nWFGihIRA6PINr8FA
	bjoEcIN79OQZRbCfkdZC79m0T1oDiPipp/bxJa6oLOmZbLTO51JQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kq7kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 23:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnIVRL6iA5vRF18EKSU9oyunyJjfiqEVR1f5SlNEIncdROg4k5Up3R0ZSyxnTZT4yySvgJq+AqQj6avcSTs7a0K83r1588BJblz0Z0d5ZWnkUcXS8fL+hkjrI+ZvX1ObVfqOptsvYh1QEIxjsBbg/CP3nGtonCvkFT7Xx4k6RQAzlD6K4P/zv0zjMzZdO8/b28nj9YjY/0K7r+U+4jb/ocuNnFSJ5m7enDbNL5upC2PlYNE29Q8Zz3xd90KFEzpSHyhc/azLmgbSaW94UvNU1wKut9OUXafX9xDbsysclhzg8kSMnoAzklSVOvQoC/Y2ru8k2hcUClMkNA9D10FvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEti9KxmydR71w5V8GIPeXpbGPcZSY+8kmHAw6Mk9oc=;
 b=djOvunOf/d12WlJRbey8pGT00o6IjjzDyU4gj/ijRMvXBcVflUgX5CMsvTTV8D9iZDOEpgnIUhtgr+qW7dcnqcfXwlBYFT0c1pXAWMnC0WBDvj0AOwWTgIzkBHQSJRHdiWkHfhVa9LRp3B0NRXcrjypyHf8rNXdbt7eVx0OubpvoTRQb/tHP50w7faDV4HGlyQAG8PeM0W6LTKDsVS4nlmQxP+Wj7CSEdJ8n+SQGYrJ4o80B9nfBF85KLPVURsBAQcu4E4BxV7u+9hER2KJEwgRZqaKu63pLO/gw2K7vAIYgyUZKdzQzQMoC2qGxpRU3DF8MBHoyJuFInWWsRf0RHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH3PR11MB8212.namprd11.prod.outlook.com (2603:10b6:610:164::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 07:31:58 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5d43:ce18:14be:b2f7%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 07:31:57 +0000
From: liezhi.yang@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] archiver.bbclass: Drop tarfile module to improve performance
Date: Thu, 21 Dec 2023 23:31:48 -0800
Message-ID: <cover.1703230207.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2789:EE_|CH3PR11MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: cc30c026-e7dd-41a9-94b0-08dc02c01359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DRX1inWown0Wk3peauKrpXjPNgBUDNWC0tseTG6uVwOH0PjOemE5tec5gFh9aJ0HtepGH/ETKi8+KfIfgBcdvBlO5tJT0IN8jzWFisn/gidMOUHPsX9qFMzA43zW6Rqh1kmdBi8km5dkvcx2ohhfgzB6MOa0XIWqHJYu+u/0ZnXHPRZ7YNqQZ6hq0i8GsLDOioZIglLYcoZN6iup5+Kfrh3p1pDC0fwu81KD4C9sN/uZsrx6wTtXr7hxjkkYSzA7SmPIgWxYJeoKZ9YsDa0oWZCTzy+o00jwyAQNtd0czmZHzoqC5ooWTHN0JF0PJxIBu4mSXeW2XCth0ZXyoRddt/VZBGl7wNCA+W5zGpPCClYvpdNNk/UO98GJ1Bm1oeM02wPc4iCg5PEJG653XDxJinmAXPpc270KNo3ZudaOS3FBvNblcijEmB5RMPRf1sy6fk8VdfBqyNrvIANyshghNvA4/LvS7wMnBbywUytTqbcWlJeRXvx5eowDw1zvnmIZwlRqV/eZBhIViEE3e8pfcwSUdRerV8+qzQBD/9KgFb+nQ9DgYCkop/pVFNs00FieZ8KZhq+2cJ86zWEgbcmfLBAX/OI7qmJANKa00/IXXiQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(346002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(83380400001)(38350700005)(41300700001)(86362001)(2616005)(26005)(36756003)(6512007)(9686003)(6666004)(6506007)(478600001)(52116002)(316002)(6486002)(66556008)(6916009)(66946007)(66476007)(8676002)(8936002)(4001150100001)(4744005)(2906002)(5660300002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hLdiiH4jmPtDeqdMslWMkrnz2+Wpkj40lfHR3u3+AOUjThOOtKcjzu2ijfs0?=
 =?us-ascii?Q?TOCYQcxxt3+j4dK1Fz3xVaowU2Z4jnW2hIzXMvwiy8YYw13+NSzCDlR+SQko?=
 =?us-ascii?Q?9NaeMLeLzxcnLd51Dux93EJmBuQolXx44TjcGDAuRFyDa8kC/NCDaV4LiWRC?=
 =?us-ascii?Q?CK6XtZxr+LHY6EtawdEMcPGp1em8zXqz+m5NQAnHyO6fdnoIyQTgvhp0xeK4?=
 =?us-ascii?Q?pfxh4Q522PrJjtmeip4uAvwgZtY/RlhnuvzNkXyDY/rfwNfxcXZZkBYDUCtf?=
 =?us-ascii?Q?44XBGVTOfNNL7xdoEvw+b//Q5DmOcT9aHRKvLselkaj9YIel7W4N75BlBzEH?=
 =?us-ascii?Q?n4DZBousxxvjBkBjDSDNoIPT29t/vZ4LgwMcmbDGTe5u3bOPWCPQqYlgLLi4?=
 =?us-ascii?Q?P/Ce88QE6kGEJufB8Pw9zApcViG08lNjXa66Xw/tLKQRWqxaxMqfeVRj4E58?=
 =?us-ascii?Q?noyMkKC1qMmhetKSF1bkrvo+voc1G6WT6slS3MWY/Cm30JcjmzO+pJN7xvYe?=
 =?us-ascii?Q?NKKGAI7Y0+znMyv71DRO3nGsfNGDk+vku1wnxQrC9RRdrD37+SKDLq4Wi/wq?=
 =?us-ascii?Q?XILOtAQdagkRWheegBQnyWoonVkO9afvwsvkpxfN7Z9WHAn8uUQYsmkIzQaa?=
 =?us-ascii?Q?iTkdAkg8Vg83Aoq/6MN9yzaGJIexmbRUFrwxqp7dLfGCJDjo01S7QZeeKHF2?=
 =?us-ascii?Q?fLyBrvgHVQZWyFauJ0bT9zq9hSh9O4F1zqbXvS9VrX3rqnQ4Hz+Hw7KDvpQs?=
 =?us-ascii?Q?cmCin5Me5TYCt0BOUKQ+ILMyF5lnBk0r55On7b+H/OZq3l2nOElx9X6PcFzP?=
 =?us-ascii?Q?Kc54+yongAsH+7Iti2VCQVn9kOwUbsNn0Axv9CQHzSSf8crBXbm0VoJISLFf?=
 =?us-ascii?Q?ai6QGGTfNnfC2W80kHTRF/ncHuz34/mm9lzEPv8rbzkg+qRoaw7Rjq2B6p/l?=
 =?us-ascii?Q?KJpDGq9FOi3foDIJspXuuk6KJavKgRXSbIsbfxUljAJsv105VjwRwoxZToI7?=
 =?us-ascii?Q?EmMHCSH5hE9rdLApc8BVCuoiGsSJgCTduclTIV7B6L8mhKtIjKUGt06XSQaC?=
 =?us-ascii?Q?6WTFzLbsVtkBt/w607SNmNjuPRRlW52gKjKjVyf0huKAvVsdhtA94KFNWveI?=
 =?us-ascii?Q?jqx7ewpIEGKXOZxza40IYRlcnjdPEUpqaM63JMTcVkk3xSb/QQo7SThXzg15?=
 =?us-ascii?Q?XybuxTWAv1gksi0e8Q33VVqMvp2Zf8iLWvxWD9IOtnvOwlPTBOOsdQLOeGRe?=
 =?us-ascii?Q?Gkk9zPWfBCHUitdWgrZqEchwut6yWzz2iQZ9zCzdEBiAGEaX3gD01kLIeUEg?=
 =?us-ascii?Q?4lqY5NuqLBoRA0fD4xzFGd17+l9pW6+p/GSc8g3q8gx5rkK3ZsfsPKje7gKI?=
 =?us-ascii?Q?NmCMEWOLExbBrhGrIwm28egvkXHHNuB3axKNTmbqC5625+8/vCLWy+5ur1LF?=
 =?us-ascii?Q?AJVHAYZZCCPdFzoD8bzT0TpsggmZJFcCkVOE0jgcFuC2XJQrYAXr7vtLnrCB?=
 =?us-ascii?Q?6c1ERs/jVMtsJFOEgYqZKg/iWEeYFCSZ0h7PFw21wM5e5MtRFw67gQFQaihO?=
 =?us-ascii?Q?zsFQHjo+s5KLqft77K4k5AuJaQr4FsyzSAf3kgWtVppUvYZrTYbEdFkf6kxF?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc30c026-e7dd-41a9-94b0-08dc02c01359
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 07:31:56.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3lcrCnr2Q/+uQpEgLQeH1U4JHHJ/qujg6ttGU8yYuuHzYal1+kn9xExH8Ga89yaRUlcXjmEtKrueV80D4+cOvOCbqBGs5vQ6VSQdnsM0ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8212
X-Proofpoint-GUID: _xzUkGXNA3nUa7DXcKwbVe7S7ToUbWtB
X-Proofpoint-ORIG-GUID: _xzUkGXNA3nUa7DXcKwbVe7S7ToUbWtB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=763 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312220052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 07:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192863

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
  - Fix for layerindex error:
    TypeError: argument of type 'NoneType' is not iterable

The following changes since commit 1bfa564f1aa8b865f6c3ae3501e6d5f6cc0542eb:

  curl: Disable two intermittently failing tests (2023-12-21 13:49:45 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/archiver
  https://github.com/robertlinux/yocto/tree/rbt/archiver

Robert Yang (1):
  archiver.bbclass: Drop tarfile module to improve performance

 meta/classes/archiver.bbclass | 28 ++++++++++++++++------------
 meta/conf/bitbake.conf        |  3 +++
 2 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.42.0


