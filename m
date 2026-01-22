Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3024ED3EE63
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 13:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36523.1769085846075890868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 04:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=To7vNbYP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54820274cf=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M1xjoE1473798
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=mpzG9a5mv
	SXtDEV2fXfrC3T5KUc1IcLftvJ+vJjHe/k=; b=To7vNbYPYWcoffdRp7LO1WmM6
	XOWs+uUD+x6yRcrG5rjYolGxk7j1TkyzWlkl1RZoR3AHAplyn7+a/n3tHYwPiT8S
	rqtcxKGJLQeoT8RMKVfA1zQcX7IvvTuoJeV2sP2MdwiUJHFDMp5Q58vqxtnRf4wx
	iLG9xDAzELC2RPIqGvhqiRKU3INj5OAo8Nf0Ki13mWLJVQFzGr52gQhd2pVMT4y8
	qIAhYIMwSOH6/k5ntqLW/zvfdLMLfOueI1o1NIZ1oY3HeMi/At9OjujOUQjPx/Cm
	wDoF7UhyM4EbBMSVqfwSypfKc4TZXFivAr2AYgB2Lmlgw0cfhT2ev2rJdXSSA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn74tb6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 12:15:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agSAU5XNAtA8bYOsdl9cuwVJum7PHEXDClIM4rxC0pUvgRge+CA/hNfPoKXE1BK7J9jlZKucz2jVNBs8G9YjBzySyvEV5ZXH7kxvZZiUlLiwcxi5JqY9Q+5DhSCAoULHJHMGNIqDW/fD31U4LCeoRkeh0mDZGLtMzBbutQvJs9Eow/jMFToC33EFh+pRbYS8dn3ADGn+8c8r89geFKLrOgHPhM86eba34UhpUE+RR5GpnCAqTEyXDpOxK11LAUEH5gqAJDLQR7PsUPNlcBCpQSqzUo46GDaoooRxxAmBZl/vC4shQO+HAoF84BQe3FM3TQdx/UxzZNqYhO58ItswPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpzG9a5mvSXtDEV2fXfrC3T5KUc1IcLftvJ+vJjHe/k=;
 b=VGKCdW3Wz+LNfUUiYF0wadBhnDk2ZiUY+QQeCKYLWDYxYfImlJcmwUirokhjTg/9jTpzjkS945F62Jkk9BZ8R7jtAD45/UBblu2hIMFz5MoGNMNnOOeFh8EHR4OqT/7HEwEG76hvUKYfJgT2ptEpJi/SP5wyHBS6T34mOEPNLsHVxabPYIncFBCtIVhSyY150D/LSDnvl82DLCayBx1yznFxNt54BMouD+n7aIcpp1V+gcpVYVYnb2e7euJ7P5Cz9RW1rnkQboKD4ATqmPkDC4EL83Se2yvcZ4R5lSFklX4vSgbkG8sRnWkoMNx82zUceJzQSJxMDLTAWQHo+sb+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3228.namprd11.prod.outlook.com (2603:10b6:5:5a::29) by
 IA4PR11MB9036.namprd11.prod.outlook.com (2603:10b6:208:565::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 22 Jan
 2026 12:15:27 +0000
Received: from DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::43e1:1ae:b5f9:e6ab]) by DM6PR11MB3228.namprd11.prod.outlook.com
 ([fe80::43e1:1ae:b5f9:e6ab%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:15:27 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] glibc: stable 2.42 branch updates
Date: Thu, 22 Jan 2026 04:14:37 -0800
Message-ID: <20260122121437.113134-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
X-ClientProxiedBy: BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::7) To DM6PR11MB3228.namprd11.prod.outlook.com
 (2603:10b6:5:5a::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3228:EE_|IA4PR11MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: 59560d2a-e44b-4441-1ed1-08de59afed2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kGDJMC/QC9c3/DBAa3lMQJANjLcVTXg3nK/N0cHXE0WHFqrmM77atcqsorsQ?=
 =?us-ascii?Q?vuNjNcEeMDW7v/52vAWC0ulGnpuGmlyWXS0gIO5OAk75vdvaxv4F0jNLs7jz?=
 =?us-ascii?Q?JMPt41Ucjlnbi1/qkvKLm3pkaZQ4zLXVxLSMwT5BDaL9SsiYoeqnF2mFpUrS?=
 =?us-ascii?Q?bcnnCURnEx+FR56fQnmmldFPmfpUslLCWRN3nTwGvEV8RjienUf7yALUClJd?=
 =?us-ascii?Q?uBvy3LSFhF8OhGnjplnUvW02b283OazNNMz6pTHSBOLkxBa7uS6EEEmUfvZC?=
 =?us-ascii?Q?i0D/sLb3fk5RafYW+tpq0DQ0EmTL3XK5aA/XXG3TOzz7484DCe4kqP4i3NAr?=
 =?us-ascii?Q?dEbqc47vybJFmZsAmWylWgd9tDi8yEQzN9S4Ax4J4SWjLYj/FUMx3QVuUQQx?=
 =?us-ascii?Q?0rtHud2u1XFLTPCaDjF7j5g2R+xbeHLVTvfyEykZXIG1PkcZOiG8A4IQrGIt?=
 =?us-ascii?Q?eGR5DRgdS+MRFke8oVuapPmeDCAUH0ojwKpTEQKoUXTizjhEPDH44OkaYdlO?=
 =?us-ascii?Q?IpEtZycexL7IjFcgpWxVxy/otsploZWU9wHgg7KAc7G5ZdJQiyinapY+LJcF?=
 =?us-ascii?Q?P6OiHzk37Wl4HG1qOcTgv4h3duEd2EpjJ7UWa8O14AEgE5QWu6jwWLn5OErf?=
 =?us-ascii?Q?hWLhjKzDhM0B8eNUHp5sdwq7o/fiG6yv2+ACmQoaL2ASMhnah/eQxgkPzI0g?=
 =?us-ascii?Q?9z3gwiJuwsBI6SCixFTJ0cFXU0N42I4NvD+JiOkt3THZ+soJkV8pc0NlPRY7?=
 =?us-ascii?Q?sL9nKFC7WIr2tNgrBg11C6Lt8hoENQqLRFE1vNpL5/xRlZmzxuICz3MSDvdi?=
 =?us-ascii?Q?MvsUEbYICABVCnVgQBZ3MQbV9JQnxPLXg2BU+EYJP2bXT3LQESquSzUWhifL?=
 =?us-ascii?Q?foHureRW04OY2b/EnZT3FKbdnz0awUwwPC+X78s/CbuWWTdEaF3yCcO9dtT9?=
 =?us-ascii?Q?+IgIWko8SSfb/NjDKSlxBzfDHUA7wGoCJK59Dk69jIHi5knExi2nlcnCuhtX?=
 =?us-ascii?Q?zw1q6PTaQD73v2BxSMSuWRwhct1QM57VegqE3c3DCcuIPGZiyv6rXZ/3Y+W+?=
 =?us-ascii?Q?ylkZdC47QOuqoVN1vMAScAiasFuxuBCon0uI37RAq9sQyWGt0PY/XQIy2SOQ?=
 =?us-ascii?Q?vI28UXgG0M2hL3gFLroabjVGvxylA02CQ2gwt2mDjQnT7ZCaQK4Q2sVE5Shk?=
 =?us-ascii?Q?rueScWyua55YYtHVGgO+bQlhvivDYJcwz47XBAdgyhJp/kR6kxJcmZL0BH7d?=
 =?us-ascii?Q?m8kr5uswstOvBRi90xW+ExyHLR/DwIPDIxlQZVS25Yvmtbvp113DL/SHKKGx?=
 =?us-ascii?Q?xOJLBcmZr3XTf5huBgceKhCrLGtPURrZCtid6ULzLVlv6bwumfin5YER6D4O?=
 =?us-ascii?Q?22Il/YT4A7Lss7hx61IhG1L56xWqc33fZzRKepvyTOK2WlSD8u17saELiUWk?=
 =?us-ascii?Q?p0f6mIu/uJZSgJiUj7A7qG1uKco46lV/wDYS3AOBNy4KYo4DRCBBGfRhQ7Ig?=
 =?us-ascii?Q?F9AqRpm9A8GoFbwaRwruN8mrGnYMqzZXfEXDilIrajGAsU4mgTOGdZD4LTVL?=
 =?us-ascii?Q?oPfHKIUlimhOmk9uuwXiazxrqU2Co9bVPOsgI9XOD1v6hH7OXLWEbyeYmeBp?=
 =?us-ascii?Q?w0ip8pDJPvzBXEbgE6Dy0kQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3228.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4DqQniAVocLgPSHgr4A9waHbqXGTxUJNEtGmqghVbtGF0wm1aWQ7FNgBs5Ow?=
 =?us-ascii?Q?kl3HCPSStqNnvosq760qipzOAS4vhcF/2OqcnCf4H1A5OfUtGHTgB1E4Pp0f?=
 =?us-ascii?Q?64qURHlqAbm6xDKgdFq+IRjFMCjAxJghHtcTIoGxayBJrY1faZzjLDt/dc/l?=
 =?us-ascii?Q?L8WwvpF83iqbheX8BiocG0XjGAp1KlpppXJWi+Pb6CpQrEUWyTtTVRWx59HP?=
 =?us-ascii?Q?cnU6YKAJ73uN6koc9my+VtGcla3xmQkIO075WjhGt6+D26eD+WAahuAdVSU6?=
 =?us-ascii?Q?Bk8ngWFtA+gZerrie14k95/2e2srE+AG98nFHiAehUlzPK0zC1nly6a7cMwi?=
 =?us-ascii?Q?2zt6H7ty06e87p+WharBaLzaz8bihq8BC6BUWaXGjz/BJPgT5zMSByz0XtMs?=
 =?us-ascii?Q?HqlGQ4QS+maZFzCx/dxFG2Ou8K2Dsjca2MW6mtaSppP2ZOAv/Hkh9p7mqfDr?=
 =?us-ascii?Q?45cBe8KB3dj1UT1TQafygQTz9EFai6a+0Nrf7mN/17Qt+95WHm1NeX1kDeB0?=
 =?us-ascii?Q?6hrDAU0zO9Ny2aH+L+9lQvikNtlepFXQ/FNw3lcazFPB9SxAV0ikZeJgNb2q?=
 =?us-ascii?Q?NHZ6JO1rmQC1nax37Yv9weScd0NWjJ1NU0rsB696rDWo0pkKO5Wpm0hflYCj?=
 =?us-ascii?Q?JyEGJdb3fboYClobP9mkOGLVOmuynLfH70gk1dCpCd3QSBH7pZXmjMsnofLU?=
 =?us-ascii?Q?KH+B6FVMGyM6e5Kce9NVWIyXs+u6b9Szd7+JxOWroFmCSX3TL6URclpnHMQ/?=
 =?us-ascii?Q?QQ0iV/XXJNtHyGWEZbgk4TxTsUC2sMIbOYAwJTNqHuS/mhQ1mgmyR97DiY82?=
 =?us-ascii?Q?Xz/qQVNIdDouRwvzO6BI9pZWq/9L+Rxuu1IXa5PHqkMDXr6CgMr5+iD+8tGU?=
 =?us-ascii?Q?RYZgRRarQtlB3UDb+lhVafmQqIcick7pxbXnluGrow1wAMQs32kcA+zjsglz?=
 =?us-ascii?Q?cN1NKXKsXOB1JWosE863bUYvQIuClew8Z/EcYFzbn/Qrx1prGYssVoFwyDG4?=
 =?us-ascii?Q?VedJ9j36Agq7z/ZFLzu7yYvsJ+jA7bjXGmIfk+4FxWWmECj416IulrouUrtL?=
 =?us-ascii?Q?OyI5+/gjJdUMNAoOzYEZ6x2mBPuegiL/UjVf2SXj6XWVMVrqyH+wL/UFQy6j?=
 =?us-ascii?Q?Wg593rr8PTOy2iu6d46UDXszDiglM7oFVZLx98jxx5Gn1f4vlt8uQh8m6/x1?=
 =?us-ascii?Q?Y21AAGbajHdgT8eupkkrZ0u5F/5UX2JjRrz5fPocBe0FYiG7EhF1+jl6102t?=
 =?us-ascii?Q?GLjyD9NW9zlTi5UwTpLDhT6KrjESiYuqVhxxZ/MUYMWJPjb4O6dclL8/+Ck6?=
 =?us-ascii?Q?OWO7ts+m4U5C9zBgp1ZnAzhGg+T+APGbFKoATofyk4V6JQ3zaEKBxNPmvH91?=
 =?us-ascii?Q?Y9laUrtiOVBKb3MCpNCSM8jUglIDxm+kKsWVjL5M6f941WYwQvonPpkbS/dM?=
 =?us-ascii?Q?+Y1+tJIoFnm9sF5Dt72hv7sOisAjy/GbwDCqYPdGmaLrElpuprPY534K11NE?=
 =?us-ascii?Q?iv7RAQkTrebsj3UXJVXgxYOabinf+EHK5AMsZkRWBVm3tSnFLQHc5DlEV5UW?=
 =?us-ascii?Q?v6YB1X6Eq2ZS+4f7FQRA6xtuE8Hxw+wDFr7+NDld2ePKQ7ckqhEwWKwoXEUt?=
 =?us-ascii?Q?zEB0hVBowO/Vis1BifHci5n5JMOGZnptuR/DMreMh86nN+qVUle6MF1pdIu2?=
 =?us-ascii?Q?eha0Rtu+ZQIY4ebnxoD9FYC05kCPHl5625ulgnLfvpPzfQjfLB/FRl6J+u5d?=
 =?us-ascii?Q?BFh5GjQ8fHG4CEU7g3k1nOwff8AvFnw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59560d2a-e44b-4441-1ed1-08de59afed2d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3228.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:15:27.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZHVPYtqeY6/3/7PWY6Y7DeFfNOgIHz84hdeLuSv+ahlAPseNXJUpLNL+4WIRmNddgKFsR5Yrfa8GLd/P+Af1i+8wFYzIWn2aBWCo8iMyyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9036
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA5MCBTYWx0ZWRfX5UD7ZDCMSN1H
 a0P6Jkp0FpAvRIjDbapVJC5/pmS+BKZZBlZccVaUEDoUK1yNr95sUgpgP6dNxafBLkJlTYfMG1b
 gaIZ61kKpgyn7y8hm48P2Id/N+okSvdl3TR6UMHfTPxYc1+BnFsC1wwhYfVPKVpHKZ8Dv1V0KXN
 IXLKPGbNLUYIacQPK+QrYNIclk99aDWOOuYq3Pyn01s5QwRuPu9/UT312E7cuAW32oj4gd0pFn4
 1iUQe/Hi42/BdjrxLzdKMTuxAC19ZcKpoebB5MSIpBH08f69iExsmt0R1zzzbbrIVjaio+1rbAq
 +MFZgW9ThoSbgguNf8QZl7dpMgRNAY1mM+JVeZzvRV5VqPL5nIwp4XadUoY3dcihr7696NiS0yb
 tEN2XU6n9DfYfNd7+0mDLH0XHNIzNyH/tHTbAbW3tENOhI8GDzXm8U2sIJ6spFRAyBwkZbHJbfo
 jftMCT76uQK5u/dkjVg==
X-Proofpoint-GUID: hF0-z6mad0YYgu4c6I4J8CMOQNpfBx-o
X-Authority-Analysis: v=2.4 cv=C6rkCAP+ c=1 sm=1 tr=0 ts=697214e3 cx=c_pps
 a=yvofFnGdSAaTKL5iNkS0vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=yebFatjNpwKrB4bp7EcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: hF0-z6mad0YYgu4c6I4J8CMOQNpfBx-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220090
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 13:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229843

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

git log --oneline e34453cd6a8c592c325756ff3c7ac0afd3975cb4..453e6b8dbab935257eb0802b0c97bca6b67ba30e

453e6b8dba (HEAD, origin/release/2.42/master) resolv: Fix NSS DNS backend for getnetbyaddr (CVE-2026-0915)
b0ec8fb689 memalign: reinstate alignment overflow check (CVE-2026-0861)
f122d0b4d1 nptl: Optimize trylock for high cache contention workloads (BZ #33704)
a1d3294a5b support: Exit on consistency check failure in resolv_response_add_name
8dfb84ad4e support: Fix FILE * leak in check_for_unshare_hints in test-container
2a0873aa81 sprof: fix -Wformat warnings on 32-bit hosts
efdf4c0c87 sprof: check pread size and offset for overflow
b11411fe2e posix: Fix invalid flags test for p{write,read}v2
8aaf4b732d ppc64le: Power 10 rawmemchr clobbers v20 (bug #33091)
2dbf973fe0 ppc64le: Restore optimized strncmp for power10
6b2957cfe8 ppc64le: Restore optimized strcmp for power10
828b8d23f3 AArch64: Fix and improve SVE pow(f) special cases
710d7a2e83 AArch64: fix SVE tanpi(f) [BZ #33642]
0c9430ed97 AArch64: Fix instability in AdvSIMD sinh
ec041b1f53 AArch64: Fix instability in AdvSIMD tan
97297120ce AArch64: Optimise SVE scalar callbacks
17c3eab387 aarch64: fix includes in SME tests
de1fe81f47 aarch64: fix cfi directives around __libc_arm_za_disable
bf499c2a49 x86: fix wmemset ifunc stray '!' (bug 33542)
71874f167a aarch64: tests for SME
256030b984 aarch64: clear ZA state of SME before clone and clone3 syscalls
6de12fc9ad aarch64: define macro for calling __libc_arm_za_disable
ab8c1b5d62 x86: Detect Intel Nova Lake Processor
bf48b17a28 x86: Detect Intel Wildcat Lake Processor
18fd689cdc nptl: Fix MADV_GUARD_INSTALL logic for thread without guard page (BZ 33356)
46b4e37c9e nss: Group merge does not react to ERANGE during merge (bug 33361)
1166170d95 libio: Define AT_RENAME_* with the same tokens as Linux

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6890   | 6890   | 0    |
| XPASS        | 4      | 4      | 0    |
| FAIL         | 123    | 123    | 0    |
| XFAIL        | 16     | 16     | 0    |
| UNSUPPORTED  | 104    | 104    | 0    |
+--------------+--------+--------+------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a3ce970c29..89596a0527 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.42/master"
 PV = "2.42+git"
-SRCREV_glibc ?= "e34453cd6a8c592c325756ff3c7ac0afd3975cb4"
+SRCREV_glibc ?= "453e6b8dbab935257eb0802b0c97bca6b67ba30e"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


