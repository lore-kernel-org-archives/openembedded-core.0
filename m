Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A22106FD9A
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:59:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19257.1773417594354542416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NUqCe+q1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCWtB7795086
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 08:59:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/3Ae8GQFNLqvZIu9MraTgvOrh/pYafVv2bT/9TtZyGo=; b=
	NUqCe+q1YVnmT5Mrs7H50wpg0lvnUp7nBnjNPBRfnouXLdhKLqSSMhWLq1Ca62XC
	fjbfzZKwR87PGqehPpWWSrldn7uh5BAyI/xrwHyKbwHuFwrTRFjZrTI7cQMm6OzI
	ICBTO8ZAaD6dvdVFe1IJAeso+a5vo8mlHiXkskCOSFGv63uRKtvDJ3SLIZmEt4FB
	4zsVkPEPFw8y1G73QWVjKpitXbblxf3ql1HzpihSOoKmiB4J4sQki4gPBVRXwN8S
	mQ4P5DjacF04f0iAQKd6p5kEFnUfup+0G5zgMbkF7d8A99Pjz/n2+cWMzttl86GD
	P0qdgeLKdBitrxzC2VuiNg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012037.outbound.protection.outlook.com [52.101.43.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6taaaf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 08:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQI5fBpKbsh/+4SCnwIKhkk8jFJWqt4rJacz1pVhgQCCqwdkoFVG58Ou1rynBD0j60Jduvb3/zsMWS5mutN3i+At5kvV3LuW/F//eR9k1aWe6G+BdVDuf38GHsxAfSS5O1tJj06UH4hDWn8yQAvPOWgq4e7tizvflGPQt+F6C/bX7Mhyn0nKzDzdFvj2nIoMIUiPK+i6TZJuwW1q3wrD0C8/7zOYXmVs1QkCxhJ2/l9F1AsTsGNrg1SWfwku+rperE2Td/6lRNCv5I3t1guGgXsymRGuIPZkOGqL1JnRFi2XdMRogRG/n+PxfdUhxeu27YGuJT1irfJPNVhJBeKsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Ae8GQFNLqvZIu9MraTgvOrh/pYafVv2bT/9TtZyGo=;
 b=WTGbzFcUMdror9JpdW4b0ehZ2foi/JDR9F5getOuYYHgrcL+u6R78LpNFZ8koiFGea81EhdRxA/358PPgiVFNcesIwJmCNjzDy/6vz9FwqanqQghc5AIW+VOh9Jh860d6KRjfiVSISOVeTnNrtGKK8A0avF6FETwN1DOCygcdha+SKi4cR02F+FZOsAZHcJ0UNqPkNI9Utg125KdosMj47zza5KQJZqf548B/l794xa1c6HSlRwqNr7PZmqjFrKOXSIhc23NAkJmdmfHZ3VBaDqtJRpzU3myi9Nsi0SGBlAKz9QfsNfLiYN3JRpZzn+MXTXeyJzpQYATAcxGFFtzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:51 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 03/14] rust: install Rust library sources for 'make rustavailable' support
Date: Fri, 13 Mar 2026 08:59:09 -0700
Message-ID: <20260313155920.2347101-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b58369-9ee9-456d-e60b-08de81198f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	xQsG7ygljqIFZrbIegMK+eiymIz0lK10DndfttV4C8YFXL0EUE0puRA9GfwK7rlQ4eyE4LixNyyvgiVzxHaJSfDUxxgiHvkxGwQmjizf8AGDdrvr2yFGBWqTGlMvWsK7xXgPtby8E01xFaX6oOwdKSHY1jeWlnxD9FENwf/Q+vonijZSHB0ZmF+WZvfdWc40i/iTm1jNSVcrt0uc76H+8e2uM0MkGZm7kZ45iJsAIhzY6O0WaJVdcjYztJxNHcF7x76rHy80KLn/hzGRUZDmledKqre2feQchE1JfuNKmclcdgKSG2tCuZjULWTlH6FRSbtjWJosfT6zYDwalao7b1DTCGkCeJBIktPEWCtS5WdDh0DeoTe+OR3EV/iPb8AztjnYNcdTx8eyLs+A9El/jXNAWhf6y4aRbrjUBj5wRY0dYHAInJ9DwzedEQJAATqotUlFpblLbr9SmgsyE2Dr5e5Q5AFdQRmbGAyGMhSYj+0BOZ22gYl3SXpBsAsspfH/4NFSMCbWj7BTFgo+THtekixtFIBu+OV76LffgCdyTsJS260GkcHX8FmbJu3hgW00tTjHv0rGps3QOTumKcQXrkR3Effa7S6G7ZNSE+nPEcyirmt0IjPiHWN4GPIm5qcPsQX3UWayzhTZ+QpPiuwxdFeEpa70sTXyudE+LxyEyrvHAgbxS1I7ZR9JipAge3gIxFvAfRmto6v+klswhwcFc70qsQAJ8PWin1yDXEpRrjSEajMxj0M1NStCpx9/Xp6l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Nra0pFxnQc242ytYxzmoH6YcVbuBO0qncWIAC4hUCLQ2DI9ec5YVGa1bjS23?=
 =?us-ascii?Q?eDxKY2mgh0eY3uA0VUJVVATIw8n0G6iyTiI8K1XfGrl6/KRY3DsU0rmTypKM?=
 =?us-ascii?Q?8hptAPMRcIuYaV8VIdSK+ZD1SmnV3maTuAv3BC++TC8WWmbir4Tfo5sr/AfO?=
 =?us-ascii?Q?r+r/A83a6nAW/dpCnTztHwX2OWoRPA2H23OLCtIyBFtyWk8Z13v8qevXLpAn?=
 =?us-ascii?Q?5Kjy3o3NfoSdZvRfyQitw8UcwLFVhuFBqlWOiFQMu19RDKJOwx2IMSYQPvM5?=
 =?us-ascii?Q?jTRZ7qGmP6rj08HafoGC/A1qZIC2U5XdlAqGtqCd+viDSRIyFTDqQMkdQZlM?=
 =?us-ascii?Q?e0Xo2IIv3KbDuO3WI+juqzqiQgu2jrVvaRuz/HZW3l91yUNsdQ/k57aOjXXA?=
 =?us-ascii?Q?fusCiBTwLJ27TbWUgj7kfVW4s6sJb//M0Gf0OUiFRmq3zI+EVFQYGUl+eRUP?=
 =?us-ascii?Q?Hqo1bOpO7hEQ+o/D5jch4qlncYoFPtf+zfZQmE0ZRlct5JEO6DUZXBfFSScn?=
 =?us-ascii?Q?H3nMtFmbjmo9x23XzNmb8a2rHT6P4f6uvyc+y/nIScoGuPETjQTglDmwvwtT?=
 =?us-ascii?Q?WR4G8mlQ4fVqeBCpe1ebb+axZ2gu9/GZnHFLGrOpyRI7xO/xVM0QxVeX7cIf?=
 =?us-ascii?Q?+9edmqTl4hmJ+XPv+wF3vmcL6kgnMfho7JS/lBMATfYWJgJJfHK65whD/E3e?=
 =?us-ascii?Q?8FmhIeR0LRcKusSQ5Q9aUIL7txdVUW8Mf0iaSlbbCl0feu5hsysTWISIIqKj?=
 =?us-ascii?Q?HqtuaR+kXwtNK+9+sMIBAhW/y+YkLMo0sgjPBNZ+A/QzqVpfvWFR/K44ymkX?=
 =?us-ascii?Q?YDMxC5MUG/SlsjV6EeU2B1bVWG+PplMfh9yASmsAY2j1mOOc09zxEJUgiTAV?=
 =?us-ascii?Q?jCNa74Bk0BUUn1pbB73SNKE0LBODsBB3yQq27wXfnPME5nlYf5dgYllcgMjq?=
 =?us-ascii?Q?0P7aW7H3PKLauo7gkSO3OPtRnyfk6MD0eGJ6xcVJ7CZ5GDUkWMsnOrSfhim5?=
 =?us-ascii?Q?+ex6e+hGsDVYzsNoEKe+rM/zUskhP/awiQAmFQ0SvjUAZl1MDbwvKMnnLtm5?=
 =?us-ascii?Q?p1Ul1IpR+WjAQGeaUerJxounhkmI3uGAokkVMgFI6A7jl4TIsRaf/NNCam4o?=
 =?us-ascii?Q?Fo8Rc9KS9Q3+4g4ib8PfKOM/n9FuapUk1p1xnxYWTm9/2W0VpNgTuZpO7OI4?=
 =?us-ascii?Q?PGt/GDN6FkIgGJyXwzH7i0lt7jno6tRbehbb6HXjX4A1gQOB2E/3qDOdbqjP?=
 =?us-ascii?Q?MEFlhTo2fjAcd9D6o0bT7/OnpJUO5eD1sIvkP/3VfGVVUOy+VE6Kc7p2Ao/q?=
 =?us-ascii?Q?hhWiZJtrvVbAaUk1d5DJHQ5ICW25cZQnvtPZCVF6mB2RiiDbGV+BQJIHMJr7?=
 =?us-ascii?Q?1XHoSnZ1zR51OhboMpC5YzO84XR+wjONhkTMHg1vAgP4d3CTB8nh6gbhKoIy?=
 =?us-ascii?Q?qPI/CXykfiNTnmTAK8/zGjWFp2yysUcAwJp8pSD2qiCE+OLZr36f9hJZT1lA?=
 =?us-ascii?Q?zk0OOVOKn3zPnJP58a1BQR21rM+s279zWmNdHpp8VAQQxUn6dJx7+Y1D4WLF?=
 =?us-ascii?Q?D3GI05R8ajH7fMgME0292m/XF1SebdwEoGhoZy/NIMaeaGFNn9RvYiuh1/BO?=
 =?us-ascii?Q?wJS37zGdt2Pz9FUnFK087XwiM9UmVJQpAwYVDeasDNZDYI7uYlhijESOzdYa?=
 =?us-ascii?Q?weps+A4DxUFfBCkcG6SLbuNqFHbrdgvSAg7BJ6MVStpzJJ9aF2KC6omVDvOb?=
 =?us-ascii?Q?wd+i1GTGxJYY6yHEPEqI5i5O0suUTR0=3D?=
X-Exchange-RoutingPolicyChecked: 
	bBHnhJniQlwvOT6OjJSzydnAdhs5CNYIukwKsizL+eKf4X92m8daXz1AOIANDIuyusoClpKD22qseyXVBhesXyRtpqnCapbR6lLWm712KwojHt1RwiyAikGIRbqJ+hhSW8VRDzTl9fe7hj4s77LRwgr2IXvol0BBp4236zJWYVj0+0VT/zlfquHQOtWktSOEn0y4czNd4vmuT44BV8/7R8sj5QziHxSq8EYAmk42rMYHBbKCeARDpnaNKEUGqcvACTauv4fKCfUvheubwi0N+4rBC3bsj9lAVdjYo4Rl5xlsaq9jR4d4M+MN/ChJ47yjuZIdyk3NDEWuV/8PBYwesQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b58369-9ee9-456d-e60b-08de81198f9b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:51.7680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOXXWdqNvmwlvihQ8hL1WJKfbdmpD8oh2teRskm9fE0klRWKd7Ow7Hk+nLWq3YkVwQYBDrqOW5m7qD3GDqMBZulsebdCR5hMZJhg/S87Hb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: sQqmLXsAp8OOcFKca7f8k_v2ypoPp6Dz
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b43479 cx=c_pps
 a=ZegHLSctVnYqdC7w6owYpw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=nzq_CVlEzhOWP2AoRwgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HoHc4xgwO6SfV9mFN5Fdb_tAEckolnVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfXy3iaMqyoY6lg
 zfuZWWKrg8LNumKEJKro4o0cAyOqBjC1EajjSylVOKsdBz1yig77GVZEGR2pKkjFtldg5hx4z7j
 RLKykH9RtpFf3PRWInt/p79KzkbFe7oI0ZjE6eqqw99J4tp/hgrwbSocTDPUGK5AzhE6DxCExTv
 SCuuRCoMPunwcX0xYsTNd2AIrpzAI09+QCbo0imTjzBm63h/asx7+XdKn+1O2vrnlCWUv4xh00q
 IS2MUUdNr0+I75/9OkmDy9//8SJOPzsEbYCDCSHoatMtPC7T5B7EEN0OfSTZAJzJlsEvprUeWMl
 /zlkjMJUiUysCdtEuWswjhL24yXL8uDGjsCOXzBubbkpiKeJ5StSKiT0rVojKjTYe/shDNtZnDh
 1KTlqsEuLSyRxB2rExHm+KZMFyIZz0pBps52lyuqDIlukSdFgd/05lDBrU2imi3JHBKCpbpVpWx
 6jbbiFnGkYUVu38REog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233050

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)
to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Installing the `library/` directory (of size ~50MB) into `${D}${libdir}/rustlib/src/rust` for
  making them available during `make rustavailable` for native, target & sdk.
- packaging `${libdir}/rustlib/src/rust` sepearately with `${PN}-src-lib`.

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.94.0.bb | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
index 2be0bd8d89..faafc63c96 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -266,10 +266,11 @@ do_test_compile () {
 
 ALLOW_EMPTY:${PN} = "1"
 
-PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
+PACKAGES =+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${PN}-src-lib"
 FILES:${PN}-rustdoc = "${bindir}/rustdoc"
 FILES:${PN}-tools-clippy = "${bindir}/cargo-clippy ${bindir}/clippy-driver"
 FILES:${PN}-tools-rustfmt = "${bindir}/rustfmt"
+FILES:${PN}-src-lib = "${libdir}/rustlib/src/rust"
 
 RDEPENDS:${PN}-rustdoc = "${PN}"
 RDEPENDS:${PN}-tools-clippy = "${PN}"
@@ -286,6 +287,12 @@ rust_do_install() {
     rust_runx install
 }
 
+rust_do_install:append:class-native() {
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+}
+
 rust_do_install:class-nativesdk() {
     export PSEUDO_UNLOAD=1
     rust_runx install
@@ -316,6 +323,11 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
 	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
 	EOF
+
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust/ -name "*.sh" -type f -delete
+
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
@@ -336,6 +348,11 @@ rust_do_install:class-target() {
 
     install -d ${D}${libdir}/rustlib/${RUST_HOST_SYS}
     install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/target.json
+    install -d ${D}${libdir}/rustlib/src/rust
+    cp -r ${S}/library ${D}${libdir}/rustlib/src/rust
+    find ${D}${libdir}/rustlib/src/rust -name "*.sh" -type f -delete
+    install -m 0644 ${WORKDIR}/rust-targets/${RUST_HOST_SYS}.json ${D}${libdir}/rustlib/${RUST_HOST_SYS}/${RUST_HOST_SYS}.json
+
 
     chown root:root ${D}/ -R
     rm ${D}${libdir}/rustlib/uninstall.sh
-- 
2.49.0


