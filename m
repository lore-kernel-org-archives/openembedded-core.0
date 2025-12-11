Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F376CD41C3E
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:08:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9998.1765462125697841845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jn47L3ao;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB4dHJ8886193
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2KReVMt+Mt2mbtn1qA24zSqKYXe6/BsS00mp0h44pc0=; b=
	Jn47L3aokP2exEoSWEvec01u/B2W1XMlegFKCMwVMQ4g2DoBlFUmZKdO6qov663v
	H1QCuC9UsChVzFtyEMeHbcrRqEPOl0DjkyJMGsirBqXCcm3HFmt7sxQaIQl5GMIU
	Gzde1tTvtaI/gkUayRxlhCI/G1a6EGS35C/oT5KDRDgkJvshph6i36jbcts9bAtv
	OX2/fLOXX+lnbsUg8utL9dDi/AE27IVsq6timLyUv+df1yreOMaAqkjilT52u5U5
	nNUT4rj/JbMgxdu1wCeTE5HyBJI4F2qZzXyPaqOi5eUvd+jluj+AhboK0pPYZuJv
	eDZomT5MIfMfAg/Hd94/dQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nj2a5-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 14:08:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd7dRfqx0f417Rvg6Z5gm0BsVlQ7uLj7bQoJJYabYnYSFVIgw53JSoohwclwo6v91od0YYJUY1t28yfSwo6JiiaVmz5lgrxubWtCgIF1BBJUlTZL42hIyAXjB7uzBupsjh1RtBQ/+hLCzPwVzVpy8v4vMYO7DtVm0871iah8RZqsJCgGOyW5uTlzmw7nXD7BqpsGl9L2eWO8sWgbTTU+r2ngRn0oKs6MYWryh4cSCyL3rQas/kTEo/TxVBK/DNFVw7Pzrv75G01y5GCru1vQp0l9BGafMew4IR++ELDg6iNn18+lceS6q/dIciXvvopCtKcc3icfPKYqXwZX2Q/a+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KReVMt+Mt2mbtn1qA24zSqKYXe6/BsS00mp0h44pc0=;
 b=LQt2Yk/r4jKBrDEgz49rJzCVIP2sgwVEDe8WJPyNnIXhQy+psDx9X83Apkrd0/sNpxucx8eB0pOH8zcz7w7ePKZ0OqKakd2dj4JLbzurWkqPmJWJthDgQJtqYJmxx0Y/aTXrvbMskNdmhii4/vljCnvOV0G3OXbOq7hEU9VW0+GE1vqKVvb3h/5Gm4KhQZqFFhyqi9VuikWEq5eNexD9k8p/eBTjPQA5w8uCW5vKHpWYgj4UNy6kkWKxmG6hu5BMPYWStIcVraZ1yZ1/PUZ0Iegx2BeCoNn3yPOqdWXlFe34H1Z5/I6rUxyh0xbDPBH9k6/6T+LsIXO3nlJmIs9oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:08:41 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:08:41 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, peter.tatrai.ext@siemens.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 4/5] rust: remove passing tests from excluded and ignored list.
Date: Thu, 11 Dec 2025 06:08:16 -0800
Message-ID: <20251211140817.1250831-4-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
References: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0004.prod.exchangelabs.com
 (2603:10b6:207:18::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 445753f2-a92f-417d-a415-08de38bec9f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Se5KvpSpH2fexvUvTAu1MMeActJOBu/wh64vlRhFC1RIQSrq3TWiDxI0jLHB?=
 =?us-ascii?Q?r96f7s9ZFdZxSXEFOkR0MoDUofBnwCI57aVl0OvrwXbf9/774qO7y61Pznsg?=
 =?us-ascii?Q?4OqpJcVawVH/ofJFUj+A2DctAXzhXhrfN+jEy5RaLFZ6NTS4624QJga6WO1n?=
 =?us-ascii?Q?9C+dIaPbtJnZzVW2BnwYe/xtmdCKDshOHhjrcbygHqojUKv8qEWnTxAo/Hcm?=
 =?us-ascii?Q?hMWNzbcMFXy5kOj8FpZbcooxdx4k5euPjIJdKV1coDHvpohDyNVqsT/RWkyR?=
 =?us-ascii?Q?ry3l0WeZmFELAOggmy46TPpu1YlZIS1aHzlZIIpEiJINXBAjJqNMfDTYJT+g?=
 =?us-ascii?Q?Glejdt6gwieplsWl16nAK2Zz1WRNYtMOW0JolZjs/VaB07Wzjs4vEqIa70WB?=
 =?us-ascii?Q?e44DVT3zOD/vxLcAtmbgsWSX22eVlZtcNPwc0NqCrDpY1efXHqU6zH01kT0N?=
 =?us-ascii?Q?sdz1/hg8tUQipocI/1y5uaNrOKDIMMXcQwb3uX8YK6u5Ed1p06AgA912pycK?=
 =?us-ascii?Q?CLQQlB7nP3Dl4t18RKbYcaO+bwiFCfLF5rQ/cvPGpY1f7Vk3Gs+Y4OBm90Hy?=
 =?us-ascii?Q?1CQYhDnNk7KIph+6SnVf2Gk+/7UTFRyv0JF3Yd0CGC1QcEWrB0IbBYnRbVFn?=
 =?us-ascii?Q?VQ+jEFGh5L6c7ZgfdYB83dyQeU3BMyxYYfsDb0EispfNVXmYFVvyk0Xzbt97?=
 =?us-ascii?Q?5chb0feSt7dP29JrjPlReiM2XvR1oi+3sgtBz7iNmViPY1bfpBJtgeOuWBT6?=
 =?us-ascii?Q?p0HMcHgJlLPtX9qRqHCo1zAgZmkMc6Z1BiwZJZFF+06Z2Zuc6f2zlAFHC/Qo?=
 =?us-ascii?Q?z6em+OtwDr9ZSMrTXL0goFTsU+tpdYqXyIhobWsYLxRpcSOFrtfYIDRxOZ3I?=
 =?us-ascii?Q?c50CnLdihkc4bjZNoOHPZQACn3j+5JY7XjBCNRjZgb1mWvoQYiTM4WFgvClM?=
 =?us-ascii?Q?hcLziH1R92EnZsTwsjTCsCwqVWpd5hUL7QaBIV5fDcuCpxTTUQNQsO99cue+?=
 =?us-ascii?Q?4ApUWIvxbNWv0Jy6fxb/U3bi7eWKT/i6AZCL66812CN5mUn2D7jsE4h6VFxc?=
 =?us-ascii?Q?Y6PqEm2Z7BUvG/PanAAAvaYMGchXxctRtj7Bo0jfoOWFQ10ftNVu/cYTE0OM?=
 =?us-ascii?Q?Th/pApMijHuabD1iC3c6JZPUnlJi6TZsXoWn4b8C7Vx5q/pv9bjkiCTe2/dR?=
 =?us-ascii?Q?Lcwi5BrV8jg2pNIyCo2QMNkTw7lDbSFU3qqO9UmtYHTNVWTPhvyJyksiyEU3?=
 =?us-ascii?Q?ekaIuQIjCT5qvgRr+8jhsIUXiHL7zyoQSN1dsXD08jWKJJLmmQpK8IhTMCWd?=
 =?us-ascii?Q?4tarmolNerf5wlbhRBbiqgr7KNE6pWAH4Vcr8sNUjLjTEGMw+sbBuPRRiwAI?=
 =?us-ascii?Q?Oxnr0gkn8jBDYxyifKQvm+EAUvrLD9kEK/R07QoPcCN2FGPqPu6vrjUPlnUP?=
 =?us-ascii?Q?oPFvui3dLkcQKjLIP4o8DDmN+6kl8Bk7jCqtqbaz3azaYC6GcCWPGw4HnqUj?=
 =?us-ascii?Q?eiv3gKo2tIHj5Wt3xIQ/rthqx6y4dLzhbEbiC5SSIFj1hStsfQPv6OPCQQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UcIer1rvAT9QqxLtutid88qbA87vpy0mbT1CQhul5Wz/FaFLY5cwIYmpdhdW?=
 =?us-ascii?Q?9+G3h4IgkfeDjrIXVbwMldXOFn2xOcKIw2cHmiaHd0kPqui3Pt0GCQ0fBk6b?=
 =?us-ascii?Q?f98LMO/G5uwtmMY4xHm6jAYXppCL1aJd5m2Fn88KJZh+8jEf6jltKKt6IXFm?=
 =?us-ascii?Q?FyggiI246rKHGCFWhP/k0uM0QbtPGwuT9BXFzc2yoSJVYrcgWv+2/hwQ8YAu?=
 =?us-ascii?Q?BpTcecRCJuc7bcPVlhxIcoF5cOjqJknOOJ6CpZ+w28ibKKx7aQHfpt07md5j?=
 =?us-ascii?Q?uiQgq0SY5CQrWUECy8i2ZyJzZw56fbVtZNlRZbcJa6qYBxEnRu4J6WQkoJAE?=
 =?us-ascii?Q?GsuvIlZc3I25eec3ykKfjvaHEtxe+bIrj5AD8GzWFToCLO5Y0Id5PaC1mp+D?=
 =?us-ascii?Q?2u0NFUutIBp7l3Czyum95JA/sUrRdH27PnowcmABbITzv9ecYmeljuFwogJa?=
 =?us-ascii?Q?QLJR8dkpStrA+AhiZc4TwFaIuItZ02h94DCmbrQvzyQq0we+MFop5Q56uamU?=
 =?us-ascii?Q?UVc2Gl9CsZC39ZUuGIkdEGkmb0/4kNpVRdd3MXfAi6MkXHmvx+LvuH0r26+y?=
 =?us-ascii?Q?movX1ifhmm7MISPiXwnsNXxbhNVT/ArEOFy46zHEn7Omsl6DANoMPJkRm0TG?=
 =?us-ascii?Q?Rtb1etWK4jIRaMT3LaT5nRy6kSgEXP26Laj6F5+NxjJbQzWY6jg0lzioSlBT?=
 =?us-ascii?Q?7qxak6opbYqqiMgQ+qkkm50VizXh2fowga9o/mVlw5wi3UZVYO4bSKDRUSet?=
 =?us-ascii?Q?gH54E4STbghsH3LDWcwMdOrBJubQNwv73LvS4K07TXBxF+RrFnjp1yg/7Lgl?=
 =?us-ascii?Q?n91/CEyFQrFS5ifLuJpXSkdaVRdIYOPf1kfg3XdnaMvdZ1+izl3H8aMUwujN?=
 =?us-ascii?Q?OI2ZdSSXakcsNyIAXWfHIo+Ilfi27vchZbgmdwGL2n3qvu7ua1A14pMFGv7o?=
 =?us-ascii?Q?pAthN0UTvopXqXN7UTfmv3HeudDuRbk88gQy5uRKPMuNjLYT5Kt+ULzPkB6u?=
 =?us-ascii?Q?eDNo2AUEt1FUtktBw9oUTIPu0jxpxt+yHnv29NeRKMXCKA4WYZ76mQHvDNB+?=
 =?us-ascii?Q?rRln2R8U+HCBZmVeYVLYlddpVuttjaGwmUs04fZvEvO8n8VggYbmAUV3Yfg1?=
 =?us-ascii?Q?a4t+4Z5Dull54VDlLqP+LmvTM4F/2umM8N9DRAYIyMPySS+8F3TiyRmOzrrh?=
 =?us-ascii?Q?FtnE/FoBWBn3GFVmXANdx3N+jdxrVbXXjqO6/pfM/12KdnxZlDZZ1b+85j9s?=
 =?us-ascii?Q?xO9X3J0OWzBE/vx7ZEw77iQ+z3uSglzg+JdnWJsJnq3C7s/NpAgKfqIdxegN?=
 =?us-ascii?Q?UfKqrL8o4Sx8txYCLmYRRPXZzbvhU/SM46RXSrBQEnLdOaiu8FuvECcOCpx+?=
 =?us-ascii?Q?9PTinGN4R/zFncTdGXRgT2Duah/+QP+4xViF7O4nYBfWSaDBhmGMd0sYSrbQ?=
 =?us-ascii?Q?T8f0czKbR4JxGqFAgFScMwe/AGeCvPCTnMQfsjdRmRHkuvkgODXTM9cquyw1?=
 =?us-ascii?Q?gShV2S/m//Fdll8/S7dV8xWDQIMq79EhiRPMeaeNtXFhSofqAd+3U7eFA+5i?=
 =?us-ascii?Q?UHqDluuftnFM5hsyhh1cToQdYbk5S4EVxKWzdyUazpfnPawFNwG72tIPejDJ?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445753f2-a92f-417d-a415-08de38bec9f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:08:41.7925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mOoLeCunpR5zgwYXpsDrBkY6/Bqnj2qbv6OupA1/7bXoWrJIODr8l4LlGNVPNal7vDB4S2QXzYYFh4pgx7zZIweeR+tAPLkMHsisZtYoGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693ad06c cx=c_pps
 a=HD3DV6xNHsutM5VcLnEsTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Fi9ycsKON-C4BOGCTiEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o7iWKFDWFakZfGcc4tqjI9rllVDPZhIZ
X-Proofpoint-ORIG-GUID: ioqSV2gNB6Q0JRE8-6nuG6_M175q5AyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMSBTYWx0ZWRfX51UqnaFLWE1G
 uzlQ9+LBEnNijrAyDIIeY/1LenfAMVXKSXhnGx+vjvtmUj3oHwiGOWT7TnlP23HG2Q85B3iAHLG
 1jXB5lh02wh7086bp36UPXsb/d4OYKmrlq2yPpz0VRb3wueEFiiwgXO5DUsU70CXqLqNrFrsFLW
 gMHgp6PEs4WhB+jEfMMM23PavCtNbISPjkfO5DovyoPekLyxd2yi6JppMaeLYxYbH5EtbdLjehr
 Iqq3wHcnJZY+rCpsDOIP5E3ZLcr3EtgTXxIzIHdSmURQ4wg+zuzTa2UdtIWwJzV22f4cvx+QCCe
 Q6z0a5SguhqpA3Z+YtLSfimAPlEVcdC4fdcwg2GuXuTWukMEEJaGABhsgiENbPrTOG+Im4h4gnc
 Gc7Vrt8JNJh8vPFBE3QRHvgLDsd6eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227533

From: Yash Shinde <Yash.Shinde@windriver.com>

Remove the ignore tags for passing riscv64 tests and
drop obsolete "tests/codegen-llvm/issues/issue-122805.rs"
from exclude test list.

The test was renamed to "dont-shuffle-bswaps.rs" and passes now:
https://github.com/rust-lang/rust/commit/3580698996f6da6f006477809d7959bffcfd3bf0

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |   1 -
 .../rust/files/rust-oe-selftest.patch         | 100 ------------------
 2 files changed, 101 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ebc9204420..3a41391101 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -80,7 +80,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
                             'tests/assembly-llvm/c-variadic-arm.rs',
-                            'tests/codegen-llvm/issues/issue-122805.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
                             'tests/run-make',
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 7d26d75820..b39b326455 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
  fn sparse_inserts() {
      let cache: VecCache<u32, u8, u32> = VecCache::default();
      let end = if cfg!(target_pointer_width = "64") && cfg!(target_os = "linux") {
-diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-index 828328df843..30753c56c76 100644
---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
-@@ -8,6 +8,7 @@
- //@ compile-flags: -C lto -g -Cdwarf-version=5
- //@ assembly-output: emit-asm
- //@ no-prefer-dynamic
-+//@ ignore-riscv64
- 
- extern crate dwarf_mixed_versions_lto_aux;
- 
-diff --git a/tests/codegen-llvm/const-vector.rs b/tests/codegen-llvm/const-vector.rs
-index f4307492341..617e31140e9 100644
---- a/tests/codegen-llvm/const-vector.rs
-+++ b/tests/codegen-llvm/const-vector.rs
-@@ -3,6 +3,7 @@
- //@ [OPT0_S390X] only-s390x
- //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=0
- //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes -Copt-level=0 -C target-cpu=z13
-+//@ ignore-riscv64
- 
- // This test checks that constants of SIMD type are passed as immediate vectors.
- // We ensure that both vector representations (struct with fields and struct wrapping array) work.
-diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs b/tests/codegen-llvm/enum/enum-aggregate.rs
-index 0161e5f3fa1..773a06fabb4 100644
---- a/tests/codegen-llvm/enum/enum-aggregate.rs
-+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
-@@ -1,6 +1,7 @@
- //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
- //@ min-llvm-version: 19
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- 
-diff --git a/tests/codegen-llvm/enum/enum-match.rs b/tests/codegen-llvm/enum/enum-match.rs
-index 57db44ec74e..1e2507f7c90 100644
---- a/tests/codegen-llvm/enum/enum-match.rs
-+++ b/tests/codegen-llvm/enum/enum-match.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=1
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- #![feature(core_intrinsics)]
-diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-index c5efb8d472b..e79b8916fc1 100644
---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
-+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
-@@ -1,5 +1,6 @@
- //@ compile-flags: -Copt-level=0
- //@ only-64bit
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- 
-diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs b/tests/codegen-llvm/repeat-operand-zero-len.rs
-index b4cec42a07c..d450fead9a4 100644
---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
-+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
-+//@ ignore-riscv64
- 
- // This test is here to hit the `Rvalue::Repeat` case in `codegen_rvalue_operand`.
- // It only applies when the resulting array is a ZST, so the test is written in
-diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-index 729f0145314..2b1d1beb86a 100644
---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
-+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
-@@ -1,4 +1,5 @@
- //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
-+//@ ignore-riscv64
- 
- #![feature(
-     core_intrinsics,
-diff --git a/tests/codegen-llvm/transmute-scalar.rs b/tests/codegen-llvm/transmute-scalar.rs
-index ce1b0558b2e..e8fda2cd566 100644
---- a/tests/codegen-llvm/transmute-scalar.rs
-+++ b/tests/codegen-llvm/transmute-scalar.rs
-@@ -1,6 +1,7 @@
- //@ add-core-stubs
- //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes --target=x86_64-unknown-linux-gnu
- //@ needs-llvm-components: x86
-+//@ ignore-riscv64
- 
- #![crate_type = "lib"]
- #![feature(no_core, repr_simd)]
-diff --git a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-index face1577c3f..09e0846bad0 100644
---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
-@@ -1,4 +1,5 @@
- //@ compile-flags: -Copt-level=3
-+//@ ignore-riscv64
- 
- // See https://github.com/rust-lang/rust/issues/135802
- 
 diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 index 551485469d3..575db924968 100644
 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
-- 
2.49.0


