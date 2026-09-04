Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6573AC79F88
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 13:06:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13425.1788527183866136482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 06:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qg3VIQe7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3707938b91=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AJNDF678426
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Sep 2026 06:06:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yQCVggwp7
	kFpVQowEnlaV3BxfGEA8JDAOdATFrhSscA=; b=qg3VIQe7txZm+ZvTg3VUEZcLn
	ih1o3NvxT2IFBvTn9ANjFt7BEDmn6S5ZDnUOBIU0Pt7XaKtRtHjcZeIevGM27jtF
	A4AMRkjUU90BCMPY7BLTcQKVwGUYkyvghw7j/Grxh61hYuSapZiYQd7AQwHxG+sf
	FBmZBiAoljSWem3qNJ22f5/2O7Hzg9udw6SPUI86ewkx2RtabiR6pzWb5GA9sMAg
	/wNI+Zy4SbSLa4b605Ql1jQpq20Zw8kWPs6dqNP695s6iiaUxfvH4iYqFKOAkZqB
	bHQNkXMvYr1tJ3c0azuykZb3nbdqooL+viNuc9gfy/obgE+rDz9BL46RsDtkg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022075.outbound.protection.outlook.com [40.93.195.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gfc8p1pkv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 06:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrRYVu+K6T0smvj3l0ODOA0BoogCSanVAT0wG6wxcbZqGVzru7dWvGf9QYKTZ8doN+xleGEMWIMO3odSpL5HWUOrkSwL8X30VGkHY2QW7A7NpjVKObIZpihx+ZfOemjQ5FjwBy25oXmvzbhYJC6okVJFT4qzK1os8jzGx9mbNcCilHpx7l9A+c3BVE1GBm+ClZdMHljcAivgu6h4xRKR+tU55iB2tX+GLC+10I03v6Hjm7phx1AsrXoXJXDb2yNPSRiPQyV2Dr2O+E1HZLdnQFsdebKajHEpVN5MGKtV4/u/A16NkbqJHYQKnlnuRRdv9uyMD1WLjBwoDfBPXneZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQCVggwp7kFpVQowEnlaV3BxfGEA8JDAOdATFrhSscA=;
 b=HBkzgS7dFZomMYU9QWhi4+u4IMCn2bKPiaVUzl6axDOzi4IjhD6r0tjV3jouH7XZ5rQrt3R8U2GFjxi+151MGWawTRDDOtHUeS1BXkgNLGDVModYG5Gds1rTH7PwRKuQzE8aDbWWtilvtIKPyNO+dxCDJ6JvIfcSUrnJwZr9944FZICklo4DqLx9ITUE7jOBNUForJVgP08WEuze0jlF852x+sE/59JAVxsrGr2zqWKx2gAMEnTW6Az6U/2vMecuDzlgZJSC1+llcfX6ojYvDm99bpX+zz9lgRAuYL1J9euX+BQqyyUewpLbahJxnrW600vtYpmoysCBXEEPjkbjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS4PPF8ECAFAD61.namprd11.prod.outlook.com (2603:10b6:f:fc02::3a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:06:17 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:06:17 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] glibc: Fix CVE-2026-6238
Date: Fri,  4 Sep 2026 06:04:47 -0700
Message-ID: <20260904130447.1762441-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS4PPF8ECAFAD61:EE_
X-MS-Office365-Filtering-Correlation-Id: 4671af5b-b07e-485e-f02b-08df0a854e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|13003099007|38350700014|6133799003|5023799004|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	bzHY9K1SZzEos4i5xnR57+OIVDdvAHtzcteKzlS2sN8WQh6mOaMbyaTwWc7XV8jRJvrGUMiwDiz0EsJ8tlnHyqlKuYnua0DFP3xgIp1QsjS44WnLO+lp5e2BzXvgtQld7kG7C5ZafNNB/GIgwKCHyS1FMy1V8tEVJd43Qdoke/ICc4sPh46pPktcMz7nh3ZNy6vHMZfTnBRToJJ/pjBlaUaLL3gbnv891P1HG1WEFjAv/zmpiqDIoot6ZIpRsj/+z60mvqPrNVA5hzgyB1kmT0jPdM4O4L5hGBZb+yCXu6klgXzqquEN0PVEFONDj6ltzOwI68P8fTHSmjOdr5Y7qulva7TScDgakP1aynev0Ap6zx9W7pwIDfcgpaksjYLjymG00bPck0nHH09lZp51HQ18g+PeQ9yYKY9nPAcmR2hImREX/+Ev3MC7vIcPaWyzQtuMj2JPEMkKk4yqhWXC7dugl8gkvmSOydBJl/Q6Eal5wvXlC9Js6TYZHVIFlF5XHyGplRPmLzEJGbbKf5iJfIT6IRIM580+WFaK6UzZW6jvepg7Lpk3BXS9WEVq1pMohd8Fx8i7AB80P8ADJ7sTJQfjXX4yX++T6s+O5hMNnjH7PBK/d3tUYp1yleJmcnHDeT7xJyAQi2HDNdCOEFTLU1UyMKYSKtJT4Ji6CvB7GKE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(13003099007)(38350700014)(6133799003)(5023799004)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/J3PgZa32qmE/yoE+EYHc3TG+nNEZLymXwEQiT3JvnbwMJ2aQAnWpdzfm9+V?=
 =?us-ascii?Q?CkwF2DbRar00nGEnijVSluB48+zbTgv3mAStGGb2rlWP0JrSjh5Yb923It0x?=
 =?us-ascii?Q?3ylWoQyu+P4GWCFS189UuFanEeVYp9GDC3CIt/KYHypcO9FFZGa4R6c+KCaI?=
 =?us-ascii?Q?AInlpIp2ToCIVUz/TBje3dtkitz46xhWZbpF7JuFteoixmByf3cbUuSOaajF?=
 =?us-ascii?Q?WpDIKc0iTerNl3FaMJfG00JrQv9t05pZmXuNPNCsRA+zvMj3OmhtZah0LF0r?=
 =?us-ascii?Q?uisJ3weoUvWw2QvhA51hhzugu7m/0IUVhqMK/0tk1jRyC83sZvye6iK/G9j1?=
 =?us-ascii?Q?FAdDHj/8zuu7NcOZwKVEMi1rSi4v4hRm3PKI141lmWx/u5AEZJignF+PtK60?=
 =?us-ascii?Q?sFgslZWR0GxjZF2SWGzRZXruWx+F2Qq3zCSxdO842JSlmlAqHyNwlsb9Zj92?=
 =?us-ascii?Q?zn5ZS6yLDbzq9kghnYq/j5i9fDrHZkiCx1dcqdv1eNHU6ZuhNPciSSBKZJ6s?=
 =?us-ascii?Q?W5tvw1cwdYpPdf+thn1Y/7qFlpJMCFTXr6FhbPSVmIm9OOXe3WV4pmL3CKym?=
 =?us-ascii?Q?rEaGTvu2klHAoclizPaNv6k6SQQ+FoLpsQXFG00GTZnmVv7a9/Jttdu0AQHB?=
 =?us-ascii?Q?2K75ZqIsV4YrkvUzqfLYm4nWwXaIJSijpukKtH6wYTErapS7J4TnEgjK25GH?=
 =?us-ascii?Q?sPR8/bYTBsWSe0iAoqhhBni1ImHGIqDinGGCO6ZXSS43Z8SeHQCGSsjZgnhF?=
 =?us-ascii?Q?ofo+ed3CNyBxrxY9iuXiM4G0aaLdBwglhUyfA7h18Viiw8ax7BSpcoMClzoK?=
 =?us-ascii?Q?05D4hmFqY+SdinvtewTqipxInZyBs4cL1I6XSHRhjt6gwq6Bua1zgwvxyupU?=
 =?us-ascii?Q?SjjbJdwOBSyOvQi2VgreoQOdZHAkpRyC6Qco37FIHDTgDsyVEfmrl0NBNSwa?=
 =?us-ascii?Q?toEUpNwNm5sBjLeQlmKo5C3ZgjN0SSOeEC8kybwvUlGvj7KaEk2bo63bho9N?=
 =?us-ascii?Q?TJRahznYtfYKolCSdF0DbyQ2vbqAY3QR6O1SiY6KXuc1Zc3672e/tgIIwavo?=
 =?us-ascii?Q?12u66d8gcNAta6dvYRk9Hd1GKqNkQ4eIEKKmaTLCVKcizdLSRELU8Y1Rf2Fk?=
 =?us-ascii?Q?AZTgyVhC45QxTXE9hEEc2dJMSU/M51HCrkId7wa+Y8hJ3S/Yhui3lDQMFmDP?=
 =?us-ascii?Q?AQrFTASfntFL2g7rzDoXtBvLqqnXlBkZqveQIt4Ni2U/H0wH8P4FJAoIpHED?=
 =?us-ascii?Q?ansoE8Mq5oIzKvCH0KAczyWR9dE7DejeMBDUKzFukjbL17m8oKsVrs3ghAZr?=
 =?us-ascii?Q?Ck1I9slKKcZHWMo7TO4FZsGv2Y5DFTuDo7BRI9mORS4CEq2udwi9Eygehw+9?=
 =?us-ascii?Q?/tyL0qFL9hkemh6hoRoHkBB154tkrw5fUcGU1+CYZZemdtVNmsBMESen0FLj?=
 =?us-ascii?Q?NwEpauyPBOL4Jozw1xi4mN9MLPGiagCLVQOEbOVJ4lmOijqG8/J/JN/FU6zx?=
 =?us-ascii?Q?O+OrEw2zmA4KNDElmosXOj9q7Upz+l1sDdaPHSVZCnxqo7cSY9lVnikjmK66?=
 =?us-ascii?Q?0e9l7TUF+cwwLDtBfs19SiH8gt0lvYIizkV+KC9btfgPDNyTQaSnK8trN5Tk?=
 =?us-ascii?Q?dZIaakFZ61q59ibgiqM1llf+plHYfdJTDSug6ytn3Dpi/E1y1UH+qX3wZLQW?=
 =?us-ascii?Q?KB+UYyusY/cStR0EbashYwrOIg0H2idvEFPBey/MKKewKgRhMc7SEyMQc8pB?=
 =?us-ascii?Q?Sw7E31By9pOD9nOI5a5xBCqS7PYGTqPxu43Sj8cpxq7ngBc3sST4?=
X-Exchange-RoutingPolicyChecked: 
	TVHFOhzb1vrsHrqPDy3wo8ZlDYNQLXluCF4Jocb9I+bk2/SfB9tV2KduQYw+PSu3rn9qQnVAOA3DH4FSFcHqT1/etRxTjchkIDQaAbZohC6XMA97GoPORlSpWoKBLXxndo9kj1tAFjNHB9RgCmT/H7H9HpZNRWYwjnQyGQzALeJ78kXOvTQDCnSE6QEBbvn5u8rrLSqjO44PefPgb+2h61Rgr1pKpIUQ6z25ugOojGfkUt5byaD8vebRD36KUGP+8ENERQrrLkgWSCY2wSd8K5aZNed3Mc57HhCP9d0RxWnpOKh8VPyHklIeLpI8i159hcVJWXAFhfKoIUjWiScvPg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4671af5b-b07e-485e-f02b-08df0a854e63
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:06:17.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wJtXNte9rXKsMQ0noSoZb0pw7whzDgIsobxfWNc+SEApfRoPcxJIdiWe8De4BMvdFQPktKoWqjs/WTQ4/thgOqrNFHXXGDJwOWCLPSE653Xl+UoyULhtLhdN9wdapf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF8ECAFAD61
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExOCBTYWx0ZWRfXzo0WZBvRFpHC
 2fM7auB8WvlaQNKSrfOcbFwxO6tiQ5ItdhKcrP7+snPS/Wdi+hsNGP6t2Q5PG7GyFBYA/Cu9s+1
 a3Lwkn2CddQM1R0ZUJsTAttBgvCpCY/XQN6U9WlPBo8dJUBJOX1q
X-Authority-Analysis: v=2.4 cv=GZcnWwXL c=1 sm=1 tr=0 ts=6a9ac24f cx=c_pps
 a=8SWL1/N8tKvLZ3FAzYkmZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=20KFwNOVAAAA:8 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8
 a=KKAkSRfTAAAA:8 a=QIhr-27iAAAA:8 a=0BshGWkSgqq-oHRSD1AA:9
 a=A6A4XJsNDs4oZvV8:21 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-GUID: gT6-Od1Uc5LJ_f2RrE0llewqcIrd6loj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExOCBTYWx0ZWRfX4tvIqXLyo/LH
 P9i7aAw++3DE4aSIPBwR5K0mWuzUEqBPz8oy2v2mJSc0CCeQeprAryRCtiG3r/oIHiop5IAkuFd
 9HZOt5r+jhqgSShKqKQoLr4olf8WhElSZpOZQPoRuo+QYwysFxSOPXFQDvQHsHHOwOYH/VQIcyE
 H83e3e8yh8GjKLQjQFA5q14R+2/+V26G/dG8cLFA7xdScTKNd38FkZ1Svl1JseLE5dVOtXm+neL
 lV2exrGNI3Ovki26U0qJ1IMwyf44Sb+NzzRLRq4A/ySiqkN0nbUJ8VmM+PfqVC802q23ywCt68T
 urslPU/6Y3AHaxgOWoEnYv/EruGdhia3EELKSxH1YtIeuFz81kUcCHwOVN9YtRa6zUTN3pMvTD6
 STOVoJB1UF/Z7R6KhTTJNyiPCKWc97HTLvfEitx5LcBrlHgNCIBJrUzkURl9PeOFWUPYL24sWrs
 lk9Jy3yn6NizQ/PlrXA==
X-Proofpoint-ORIG-GUID: gT6-Od1Uc5LJ_f2RrE0llewqcIrd6loj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 13:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245103

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Backport six commits from upstream glibc to fix CVE-2026-6238.

4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
a7b60d23bb resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
cd0db208d5 resolv: Check for inet_ntop failure in ns_sprintrrf
d58415eb17 resolv: Improve formatting of unknown records in ns_sprintrrf
f69b7f95e3 resolv: Fix ns_sprintrrf formatting of class, type values (bug 34289)
360f352c9a resolv: Declare __p_class_syms, __p_type_syms for internal use

The upstream patch series [PATCH 0/5] contains five commits:
  1/5: Update GLIBC-SA-2026-0012 to mention A6 records (doc only)
  2/5: resolv: Check for inet_ntop failure in ns_sprintrrf
  3/5: resolv: Remove incorrect parts of TSIG handling from ns_sprintrrf
       (CVE-2026-5435)
  4/5: resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
  5/5: resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)

For this backport:
- Patch 1/5 is skipped (documentation-only change to advisories,
  upstream glibc itself does not backport this to older releases)
- Patch 3/5 (CVE-2026-5435) is already patched in scarthgap sources
- Patches 2/5, 4/5, and 5/5 are backported as:
  0028-CVE-2026-6238-0004.patch (inet_ntop failure check)
  0029-CVE-2026-6238-0005.patch (buffer overread fix - CVE-2026-6238)
  0030-CVE-2026-6238-0006.patch (test case for bug 34033, bug 34069)

However, the test case (tst-ns_sprintrr) from patch 5/5 failed on
scarthgap's glibc 2.39 due to missing prerequisite commits. Three
additional patches were backported to resolve the test failure:
  0025-CVE-2026-6238-0001.patch (Declare __p_class_syms, __p_type_syms for internal)
  0026-CVE-2026-6238-0002.patch (Fix ns_sprintrrf formatting of class, type values)
  0027-CVE-2026-6238-0003.patch (Improve formatting of unknown records in ns_sprintrrf)

CVE-2026-6238 fixes buffer overreads in ns_sprintrrf affecting A6 and
LOC record handling. The vulnerable LOC record handling was introduced
before glibc 2.0, while A6 record handling was added in glibc 2.7.

Reference:
https://inbox.sourceware.org/libc-alpha/cover.1777546194.git.fweimer@redhat.com/
https://nvd.nist.gov/vuln/detail/CVE-2026-6238
https://sourceware.org/bugzilla/show_bug.cgi?id=34069

Testing Results:
             Before    After    Diff
PASS         4896      4897     +1
XPASS        4         4         0
FAIL         372       372       0
XFAIL        16        16        0
UNSUPPORTED  224       224       0

Changes in testcases:

testcase-name                                before  after
resolv/tst-ns_sprintrr(new)                    -     PASS

commit - 4ba0b79b95 resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
+PASS: resolv/tst-ns_sprintrr
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../glibc/glibc/0025-CVE-2026-6238-0001.patch |  56 +++
 .../glibc/glibc/0026-CVE-2026-6238-0002.patch |  80 ++++
 .../glibc/glibc/0027-CVE-2026-6238-0003.patch |  55 +++
 .../glibc/glibc/0028-CVE-2026-6238-0004.patch |  70 ++++
 .../glibc/glibc/0029-CVE-2026-6238-0005.patch |  66 +++
 .../glibc/glibc/0030-CVE-2026-6238-0006.patch | 379 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   6 +
 7 files changed, 712 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
new file mode 100644
index 0000000000..9d14164909
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2026-6238-0001.patch
@@ -0,0 +1,56 @@
+From 360f352c9a6da545d798ef3015e73ca114f0d230 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Declare __p_class_syms, __p_type_syms for internal
+ use
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=360f352c9a6da545d798ef3015e73ca114f0d230]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ include/resolv.h   | 5 +++++
+ resolv/res_debug.c | 4 ----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/include/resolv.h b/include/resolv.h
+index 4dbbac38..d5ad9994 100644
+--- a/include/resolv.h
++++ b/include/resolv.h
+@@ -70,6 +70,11 @@ libc_hidden_proto (__libc_res_nameinquery)
+ extern __typeof (__res_queriesmatch) __libc_res_queriesmatch;
+ libc_hidden_proto (__libc_res_queriesmatch)
+
++extern const struct res_sym __p_class_syms[];
++libresolv_hidden_proto (__p_class_syms)
++extern const struct res_sym __p_type_syms[];
++libresolv_hidden_proto (__p_type_syms)
++
+ /* Variant of res_hnok which operates on binary (but uncompressed) names.  */
+ bool __res_binary_hnok (const unsigned char *dn) attribute_hidden;
+
+diff --git a/resolv/res_debug.c b/resolv/res_debug.c
+index dab5283b..6f03e414 100644
+--- a/resolv/res_debug.c
++++ b/resolv/res_debug.c
+@@ -389,8 +389,6 @@ p_fqname(const u_char *cp, const u_char *msg, FILE *file) {
+  * that C_ANY is a qclass but not a class.  (You can ask for records of class
+  * C_ANY, but you can't have any records of that class in the database.)
+  */
+-extern const struct res_sym __p_class_syms[];
+-libresolv_hidden_proto (__p_class_syms)
+ const struct res_sym __p_class_syms[] = {
+   {C_IN,    (char *) "IN"},
+   {C_CHAOS, (char *) "CHAOS"},
+@@ -425,8 +423,6 @@ const struct res_sym __p_update_section_syms[] attribute_hidden = {
+  * Names of RR types and qtypes.  The list is incomplete because its
+  * size is part of the ABI.
+  */
+-extern const struct res_sym __p_type_syms[];
+-libresolv_hidden_proto (__p_type_syms)
+ const struct res_sym __p_type_syms[] = {
+   {ns_t_a,      (char *) "A",     (char *) "address"},
+   {ns_t_ns,     (char *) "NS",    (char *) "name server"},
diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
new file mode 100644
index 0000000000..837a603eb6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-CVE-2026-6238-0002.patch
@@ -0,0 +1,80 @@
+From f69b7f95e3694177546faec25d88bb266885c3b8 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Fix ns_sprintrrf formatting of class, type values
+ (bug 34289)
+
+The p_class and p_type results could overwrite each other if both
+were unknown.  Format unknown values with CLASS and TYPE prefixes,
+as in RFC 3597.  Handle A6 separately because it cannot be added
+to __p_type_syms for ABI reasons.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=f69b7f95e3694177546faec25d88bb266885c3b8]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 38 +++++++++++++++++++++++++++++++++-----
+ 1 file changed, 33 insertions(+), 5 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index fffed4b3..59c34553 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -78,6 +78,24 @@ ns_sprintrr(const ns_msg *handle, const ns_rr *rr,
+ }
+ libresolv_hidden_def (ns_sprintrr)
+ 
++/* Writes the class/type symbol NUMBER to *BUF, using the name from
++   *SYMS if possible.  If NUMBER is not found in *SYMS, print the
++   number with PREFIX.  */
++static int
++addsym (const struct res_sym *syms, int number, const char *prefix,
++       char **buf, size_t *buflen)
++{
++  for (; syms->name != NULL; syms++)
++    if (number == syms->number)
++      {
++       T (addstr (" ", 1, buf, buflen));
++       return addstr (syms->name, strlen (syms->name), buf, buflen);
++      }
++  char tmp[20];
++  int len = snprintf (tmp, sizeof (tmp), " %s%d", prefix, number);
++  return addstr (tmp, len, buf, buflen);
++}
++
+ /*%
+  *	Convert the fields of an RR into presentation format.
+  *
+@@ -128,11 +146,21 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	/*
+ 	 * TTL, Class, Type.
+ 	 */
+-	T(x = ns_format_ttl(ttl, buf, buflen));
+-	addlen(x, &buf, &buflen);
+-	len = SPRINTF((tmp, " %s %s", p_class(class), p_type(type)));
+-	T(addstr(tmp, len, &buf, &buflen));
+-	T(spaced = addtab(x + len, 16, spaced, &buf, &buflen));
++       {
++         char *start = buf;
++
++         T (x = ns_format_ttl (ttl, buf, buflen));
++         addlen (x, &buf, &buflen);
++         T (addsym (__p_class_syms, class, "CLASS", &buf, &buflen));
++         if (type == ns_t_a6)
++           /* A6 is not part of __p_type_syms, which is exported.
++              Adding A6 there would change its size.  Handle it here.  */
++           T (addstr (" A6", 3, &buf, &buflen));
++         else
++           T (addsym (__p_type_syms, type, "TYPE", &buf, &buflen));
++
++         T (spaced = addtab(buf - start, 16, spaced, &buf, &buflen));
++       }
+ 
+ 	/*
+ 	 * RData.
+-- 
+2.34.1
diff --git a/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch b/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
new file mode 100644
index 0000000000..8e057eea1a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-CVE-2026-6238-0003.patch
@@ -0,0 +1,55 @@
+From d58415eb17d457a160af99f9e8ab164404ca151b Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Improve formatting of unknown records in ns_sprintrrf
+
+Do not add the "unknown RR type" comment.  After adding the TYPE
+prefix, the number is largely redundant.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=d58415eb17d457a160af99f9e8ab164404ca151b]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 59c34553..4f4f06b6 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -115,7 +115,6 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 
+ 	const char *comment;
+ 	char tmp[100];
+-	char errbuf[40];
+ 	int len, x;
+ 
+ 	/*
+@@ -500,20 +499,18 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 
+ 		break;
+ 	    }
+-
+ 	default:
+-		snprintf (errbuf, sizeof (errbuf), "unknown RR type %d", type);
+-		comment = errbuf;
++		comment = "";
+ 		goto hexify;
+ 	}
+ 	return (buf - obuf);
+  formerr:
+-	comment = "RR format error";
++	comment = " ; RR format error";
+  hexify: {
+ 	int n, m;
+ 	char *p;
+ 
+-	len = SPRINTF((tmp, "\\# %u%s\t; %s", (unsigned)(edata - rdata),
++	len = SPRINTF((tmp, "\\# %u%s%s", (unsigned)(edata - rdata),
+ 		       rdlen != 0U ? " (" : "", comment));
+ 	T(addstr(tmp, len, &buf, &buflen));
+ 	while (rdata < edata) {
diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch b/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
new file mode 100644
index 0000000000..ee029684e2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-CVE-2026-6238-0004.patch
@@ -0,0 +1,70 @@
+From cd0db208d56a2cecd528b8ae96df752ba5344d9a Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Check for inet_ntop failure in ns_sprintrrf
+
+This makes the output more consistent (either failure or complete
+output) and helps with systematic testing with varying buffer
+sizes.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=cd0db208d56a2cecd528b8ae96df752ba5344d9a ]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 882a86e5..19082bf2 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -140,8 +140,9 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	switch (type) {
+ 	case ns_t_a:
+ 	  if (rdlen != (size_t)NS_INADDRSZ)
+-			goto formerr;
+-		(void) inet_ntop(AF_INET, rdata, buf, buflen);
++                 goto formerr;
++               if (inet_ntop (AF_INET, rdata, buf, buflen) == NULL)
++                 return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		break;
+ 
+@@ -307,9 +308,10 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	    }
+ 
+ 	case ns_t_aaaa:
+-	  if (rdlen != (size_t)NS_IN6ADDRSZ)
+-			goto formerr;
+-		(void) inet_ntop(AF_INET6, rdata, buf, buflen);
++               if (rdlen != (size_t)NS_IN6ADDRSZ)
++                 goto formerr;
++               if (inet_ntop (AF_INET6, rdata, buf, buflen) == NULL)
++                 return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		break;
+ 
+@@ -400,7 +402,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 			goto formerr;
+ 
+ 		/* Address. */
+-		(void) inet_ntop(AF_INET, rdata, buf, buflen);
++               if (inet_ntop (AF_INET, rdata, buf, buflen) == NULL)
++                 return -1;
+ 		addlen(strlen(buf), &buf, &buflen);
+ 		rdata += NS_INADDRSZ;
+ 
+@@ -452,7 +455,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 			if (rdata + pbyte >= edata) goto formerr;
+ 			memset(&a, 0, sizeof(a));
+ 			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
+-			(void) inet_ntop(AF_INET6, &a, buf, buflen);
++                       if (inet_ntop (AF_INET6, &a, buf, buflen) == NULL)
++                         return -1;
+ 			addlen(strlen(buf), &buf, &buflen);
+ 			rdata += sizeof(a) - pbyte;
+ 		}
diff --git a/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch b/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
new file mode 100644
index 0000000000..6f2abbdd8d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0029-CVE-2026-6238-0005.patch
@@ -0,0 +1,66 @@
+From a7b60d23bbb56eaef59f4962e4140062e552600a Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
+
+Check that the RDATA payload does not require more than RDATALEN
+bytes while processing it.  The fixes cover A6, LOC records.
+(CERT, TKEY, TSIG were fixed before, by switching to the generic
+formatter.)
+
+The vulnerable LOC record handling was first introduced before
+glibc 2.0, in commit ee188d555b8c32ad9704a7440cab400af967292f.
+
+CERT, TSIG, TKEY handling came with commit
+b43b13ac2544b11f35be301d1589b51a8473e32b, released with glibc 2.2.
+
+A6 record handling was introduced in commit
+91633816430e7ec5a19fe3ff510a7c4822a9557e ("* resolv/ns_print.c
+(ns_sprintrrf): Handle ns_t_a6 and ns_t_opt."), which went into glibc
+2.7.
+
+This fixes bug 34069.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=a7b60d23bbb56eaef59f4962e4140062e552600a]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/ns_print.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/resolv/ns_print.c b/resolv/ns_print.c
+index 882a86e5..d5da99d6 100644
+--- a/resolv/ns_print.c
++++ b/resolv/ns_print.c
+@@ -316,7 +316,8 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 	case ns_t_loc: {
+ 		char t[255];
+ 
+-		/* XXX protocol format checking? */
++               if (rdlen != 16)
++                 goto formerr;
+ 		(void) loc_ntoa(rdata, t);
+ 		T(addstr(t, strlen(t), &buf, &buflen));
+ 		break;
+@@ -449,13 +450,14 @@ ns_sprintrrf(const u_char *msg, size_t msglen,
+ 
+ 		/* address suffix: provided only when prefix len != 128 */
+ 		if (pbit < 128) {
+-			if (rdata + pbyte >= edata) goto formerr;
++                       unsigned int bytelen = sizeof(a) - pbyte;
++                       if (edata - rdata < bytelen) goto formerr;
+ 			memset(&a, 0, sizeof(a));
+-			memcpy(&a.s6_addr[pbyte], rdata, sizeof(a) - pbyte);
++                       memcpy(&a.s6_addr[pbyte], rdata, bytelen);
+                        if (inet_ntop (AF_INET6, &a, buf, buflen) == NULL)
+                          return -1;
+ 			addlen(strlen(buf), &buf, &buflen);
+-			rdata += sizeof(a) - pbyte;
++			rdata += bytelen;
+ 		}
+ 
+ 		/* prefix name: provided only when prefix len > 0 */
diff --git a/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch b/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
new file mode 100644
index 0000000000..bddd091704
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-CVE-2026-6238-0006.patch
@@ -0,0 +1,379 @@
+From 4ba0b79b9596e5a4951cc9eaa1546a55e543e083 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jun 2026 18:22:20 +0200
+Subject: [PATCH] resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
+
+This test case covers both input buffer overreads and output buffer
+overflows.  It should systematically cover these issues.
+
+I used code auto-generation for updating the test expectations for
+truncated RDATA in TXT, ISDN records, after writing the rest
+of the test by hand.
+
+Assisted-by: LLM
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+
+CVE: CVE-2026-6238
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=4ba0b79b9596e5a4951cc9eaa1546a55e543e083]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ resolv/Makefile          |   2 +
+ resolv/tst-ns_sprintrr.c | 329 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 331 insertions(+)
+ create mode 100644 resolv/tst-ns_sprintrr.c
+diff --git a/resolv/Makefile b/resolv/Makefile
+index 79a1b9647f..130d8b51e0 100644
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -92,6 +92,7 @@ tests += \
+   tst-ns_name \
+   tst-ns_name_compress \
+   tst-ns_name_pton \
++  tst-ns_sprintrr \
+   tst-res_hconf_reorder \
+   tst-res_hnok \
+   tst-resolv-aliases \
+@@ -323,5 +324,6 @@ $(objpfx)tst-ns_name: $(objpfx)libresolv.so
+ $(objpfx)tst-ns_name.out: tst-ns_name.data
+ $(objpfx)tst-ns_name_compress: $(objpfx)libresolv.so
+ $(objpfx)tst-ns_name_pton: $(objpfx)libresolv.so
++$(objpfx)tst-ns_sprintrr: $(objpfx)libresolv.so
+ $(objpfx)tst-res_hnok: $(objpfx)libresolv.so
+ $(objpfx)tst-p_secstodate: $(objpfx)libresolv.so
+diff --git a/resolv/tst-ns_sprintrr.c b/resolv/tst-ns_sprintrr.c
+new file mode 100644
+index 0000000000..34739b5924
+--- /dev/null
++++ b/resolv/tst-ns_sprintrr.c
+@@ -0,0 +1,329 @@
++/* Tests for the ns_sprintrr function.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <arpa/nameser.h>
++
++#include <alloc_buffer.h>
++#include <arpa/inet.h>
++#include <libc-diag.h>
++#include <stdbool.h>
++#include <string.h>
++#include <support/check.h>
++#include <support/next_to_fault.h>
++
++#include <stdio.h>
++
++/* Regions that test_one_record uses for input and output.  */
++static struct support_next_to_fault ntf_in;
++static struct support_next_to_fault ntf_out;
++
++/* This is used by test_one_record to construct the packet.   */
++static const char packet_prefix[] =
++  /* DNS response with one question, one answer record.  */
++  "AA\x81\x80\0\1\0\1\0\0\0\0"
++  /* Question: www.example.org/IN/ANY.  */
++  "\3www\7example\3org\0\0\xff\0\1"
++  /* Response: compression reference.  */
++  "\xc0\x0c";
++
++/* Use ns_sprintrr to format a DNS record (starting with
++   packet_prefix) of type RTYPE, with a record payload of RDATALEN
++   bytes starting at RDATA.  Check successful formatting against
++   EXPECTED.  Try various truncated input and output buffers to catch
++   overreads and buffer overflows, using ntf_in and ntf_out above.  */
++static void
++test_one_record (uint16_t rtype, const char *rdata, size_t rdatalen,
++                 const char *expected)
++{
++  struct rr_header
++  {
++    uint16_t typ;
++    uint16_t cls;
++    uint32_t ttl;
++    uint16_t rdatalen;
++    uint16_t pad;
++  } hdr =
++    {
++      .typ = htons (rtype),
++      .cls = htons (ns_c_in),
++      .ttl = htonl (86400),     /* One day.  */
++      .rdatalen = htons (rdatalen),
++    };
++  enum { hdrlen = offsetof (struct rr_header, pad) };
++  TEST_COMPARE (hdrlen, 10);
++
++  /* Construct the packet from packet_prefix, hdr, and rdata.  */
++  unsigned char packet[512];
++  size_t packetlen;
++  {
++    struct alloc_buffer buf = alloc_buffer_create (packet, sizeof (packet));
++    alloc_buffer_copy_bytes (&buf, packet_prefix, sizeof (packet_prefix) - 1);
++    alloc_buffer_copy_bytes (&buf, &hdr, hdrlen);
++    alloc_buffer_copy_bytes (&buf, rdata, rdatalen);
++    packetlen = sizeof (packet) - alloc_buffer_size (&buf);
++  }
++
++  /* Parse the record.   */
++  ns_msg msg;
++  TEST_COMPARE (ns_initparse (packet, packetlen, &msg), 0);
++  ns_rr rr;
++  TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
++
++  /* Try sizes up to this limit.  Go a bit beyond the expected size to
++     check for errors.  */
++  size_t max_result_size = strlen (expected) + 16;
++
++  bool success = false;
++  for (size_t result_size = 1; result_size <= max_result_size; ++result_size)
++    {
++      char *result_start = ntf_out.buffer + ntf_out.length - result_size;
++      memset (result_start, 'X', result_size);
++
++      /* ns_sprintrr was deprecated in 2.34.  */
++      DIAG_PUSH_NEEDS_COMMENT;
++      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
++      int ret = ns_sprintrr (&msg, &rr, NULL, NULL, result_start, result_size);
++      DIAG_POP_NEEDS_COMMENT;
++
++      if (ret > 0)
++        {
++          TEST_COMPARE_STRING (result_start, expected);
++          TEST_COMPARE (ret, strlen (expected));
++          success = true;
++        }
++      else
++        {
++          TEST_VERIFY (!success);
++          TEST_COMPARE (ret, -1);
++        }
++    }
++  TEST_VERIFY (success);
++
++  /* Test with truncated RDATA.   */
++  for (size_t rdata_size = 0; rdata_size <= rdatalen; ++rdata_size)
++    {
++      size_t truncated_packet_size = packetlen - rdatalen + rdata_size;
++      unsigned char *packet_start
++        = ((unsigned char *) ntf_in.buffer + ntf_in.length
++           - truncated_packet_size);
++      memcpy (packet_start, packet, truncated_packet_size);
++      /* Patch in the updated RDATA length field.  */
++      uint16_t new_rdatalen = htons (rdata_size);
++      memcpy (packet_start + truncated_packet_size - rdata_size - 2,
++              &new_rdatalen, 2);
++
++      ns_msg msg;
++      TEST_COMPARE (ns_initparse (packet_start, truncated_packet_size, &msg),
++                    0);
++      ns_rr rr;
++      TEST_COMPARE (ns_parserr (&msg, ns_s_an, 0, &rr), 0);
++
++      size_t result_size = strlen (expected) + 1;
++      char *result_start = ntf_out.buffer + ntf_out.length - result_size;
++      memset (result_start, 'X', result_size);
++
++      /* ns_sprintrr was deprecated in 2.34.  */
++      DIAG_PUSH_NEEDS_COMMENT;
++      DIAG_IGNORE_NEEDS_COMMENT (4.9, "-Wdeprecated-declarations");
++      int ret = ns_sprintrr (&msg, &rr, NULL, NULL, result_start, result_size);
++      DIAG_POP_NEEDS_COMMENT;
++
++      /* This flag indicates whether the output is syntactically
++         correct.  In some cases, truncation may still yield a valid
++         payload.  */
++      bool broken = rdata_size < rdatalen;
++      switch (rtype)
++        {
++        case ns_t_wks:
++          /* WKS records use all trailing bytes for the port bitmap.  */
++          broken = rdata_size < 5;
++          break;
++        case ns_t_nsap:
++          /* Uses all bytes that are available.  */
++          broken = false;
++          break;
++        case ns_t_txt:
++          /* Truncation produces a valid payload if it occurs right
++             after a complete string in the TXT payload.  */
++          broken = false;
++          for (size_t pos = 0; pos < rdata_size; )
++            {
++              unsigned int slen = rdata[pos] & 0xff;
++              if (pos + 1 + slen > rdata_size)
++                {
++                  broken = true;
++                  break;
++                }
++              pos += 1 + slen;
++            }
++          break;
++        case ns_t_isdn:
++          /* The second field is optional.  If it is present, it must
++             not be truncated.  */
++          broken = rdata_size < 6 || (rdata_size > 6 && rdata_size < rdatalen);
++          break;
++        case ns_t_a6:
++          /* The first A6 subtest contains a trailing domain name,
++             which is ignored and not formatted.  */
++          if (rdata_size > 0 && rdata[0] == 0)
++            broken = rdata_size < 17;
++          break;
++        case ns_t_cert:
++        case ns_t_tkey:
++        case ns_t_tsig:
++          /* Only generic printing, which does not validate anything.  */
++          broken = false;
++          break;
++        }
++
++      if (broken)
++        {
++          if (strstr (result_start, "RR format error") != NULL)
++            /* No further checks if an error indicator has been added
++               to the output.  */
++            ;
++          else
++            TEST_COMPARE (ret, -1);
++        }
++      else
++        TEST_VERIFY (ret > 0);
++    }
++}
++
++static int
++do_test (void)
++{
++  ntf_in = support_next_to_fault_allocate (512);
++  ntf_out = support_next_to_fault_allocate (256);
++
++#define T(rtype, rdata, expected) \
++  test_one_record (rtype, rdata, sizeof (rdata) - 1, expected)
++  T (ns_t_a, "\xc0\0\2\1", "www.example.org.\t1D IN A\t\t192.0.2.1");
++  T (ns_t_cname, "\4www1\4prod\xc0\x10",
++     "www.example.org.\t1D IN CNAME\twww1.prod.example.org.");
++  T (ns_t_hinfo, "\5first\6second",
++     "www.example.org.\t1D IN HINFO\t\"first\" \"second\"");
++  T (ns_t_isdn, "\5first\6second",
++     "www.example.org.\t1D IN ISDN\t\"first\" \"second\"");
++  /* Bug: Extra space at the end in the text representation of ISDN RRs.  */
++  T (ns_t_isdn, "\5first", "www.example.org.\t1D IN ISDN\t\"first\" ");
++  T (ns_t_soa,
++     "\2ns\xc0\x10\12hostmaster\xc0\x10"
++     "\0\0\0\1\0\0\0\2\0\0\0\3\0\0\0\4\0\0\0\5",
++     "www.example.org.\t1D IN SOA\tns.example.org. hostmaster.example.org. (\n"
++     "\t\t\t\t\t1\t\t; serial\n"
++     "\t\t\t\t\t2S\t\t; refresh\n"
++     "\t\t\t\t\t3S\t\t; retry\n"
++     "\t\t\t\t\t4S\t\t; expiry\n"
++     "\t\t\t\t\t5S )\t\t; minimum\n");
++  T (ns_t_mx, "\0\xa\2mx\xc0\x10",
++     "www.example.org.\t1D IN MX\t10 mx.example.org.");
++  T (ns_t_px, "\0\xa\3px1\xc0\x10\3px2\xc0\x10",
++     "www.example.org.\t1D IN PX\t10 px1.example.org. px2.example.org.");
++  T (ns_t_x25, "\4X.25",
++     "www.example.org.\t1D IN X25\t\"X.25\"");
++  T (ns_t_txt, "\1A\2BC\3DEF",
++     "www.example.org.\t1D IN TXT\t\"A\" \"BC\" \"DEF\"");
++  T (ns_t_nsap, "",
++     "www.example.org.\t1D IN NSAP\t");
++  T (ns_t_nsap, "\1",
++     "www.example.org.\t1D IN NSAP\t01");
++  T (ns_t_nsap, "\1\2",
++     "www.example.org.\t1D IN NSAP\t01.02");
++  T (ns_t_nsap, "\1\2\3",
++     "www.example.org.\t1D IN NSAP\t01.0203");
++  T (ns_t_nsap, "\1\2\3\4",
++     "www.example.org.\t1D IN NSAP\t01.0203.04");
++  T (ns_t_nsap,
++     "\1\2\3\4\5\6\7\10\11\12\13\14\15\16\17\20\21\22\23\24\25\26\27\30\31\32"
++     "\33\34\35\36\37\40\41\42\43\44\45\46\47\50\51\52\53\54\55\56\57\60\61"
++     "\62\63\64\65\66\67\70\71\72\73\74\75\76\77\100\101\102\103\104\105\106"
++     "\107\110\111\112\113\114\115\116\117\120\121\122\123\124\125\126\127"
++     "\130\131\132\133\134\135\136\137\140\141\142\143\144\145\146\147\150"
++     "\151\152\153\154\155\156\157\160\161\162\163\164\165\166\167\170\171"
++     "\172\173\174\175\176\177\200\201\202\203\204\205\206\207\210\211\212"
++     "\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232\233"
++     "\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254"
++     "\255\256\257\260\261\262\263\264\265\266\267\270\271\272\273\274\275"
++     "\276\277\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316"
++     "\317\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337"
++     "\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\360"
++     "\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377",
++     "www.example.org.\t1D IN NSAP\t"
++     "01.0203.0405.0607.0809.0A0B.0C0D.0E0F.1011.1213.1415.1617.1819.1A1B"
++     ".1C1D.1E1F.2021.2223.2425.2627.2829.2A2B.2C2D.2E2F.3031.3233.3435.3637"
++     ".3839.3A3B.3C3D.3E3F.4041.4243.4445.4647.4849.4A4B.4C4D.4E4F.5051.5253"
++     ".5455.5657.5859.5A5B.5C5D.5E5F.6061.6263.6465.6667.6869.6A6B.6C6D.6E6F"
++     ".7071.7273.7475.7677.7879.7A7B.7C7D.7E7F.8081.8283.8485.8687.8889.8A8B"
++     ".8C8D.8E8F.9091.9293.9495.9697.9899.9A9B.9C9D.9E9F.A0A1.A2A3.A4A5.A6A7"
++     ".A8A9.AAAB.ACAD.AEAF.B0B1.B2B3.B4B5.B6B7.B8B9.BABB.BCBD.BEBF.C0C1.C2C3"
++     ".C4C5.C6C7.C8C9.CACB.CCCD.CECF.D0D1.D2D3.D4D5.D6D7.D8D9.DADB.DCDD.DEDF"
++     ".E0E1.E2E3.E4E5.E6E7.E8E9.EAEB.ECED.EEEF.F0F1.F2F3.F4F5.F6F7.F8F9.FAFB"
++     ".FCFD.FEFF");
++  T (ns_t_aaaa, "\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34",
++     "www.example.org.\t1D IN AAAA\t2001:db8::1234");
++  /* Example from RFC 1876.  The loc_ntoa format is different from the
++     official text representation.  */
++  T (ns_t_loc,
++     "\000\063\026\023\211\027\055\320\160\276\025\360\000\230\215\040",
++     "www.example.org.\t1D IN LOC"
++     "\t42 21 54.000 N 71 06 18.000 W -24.00m 30.00m 10000.00m 10.00m");
++  T (ns_t_naptr,
++     "\0\1\0\2\5flags\7service\2.*\5naptr\xc0\x10",
++     "www.example.org.\t1D IN NAPTR\t1 2 \"flags\" \"service\" \".*\""
++     " naptr.example.org.");
++  T (ns_t_srv,
++     "\0\1\0\2\0\x50\4www1\xc0\x10",
++     "www.example.org.\t1D IN SRV\t1 2 80 www1.example.org.");
++  T (ns_t_rp, "\3rp1\xc0\x10\3rp2\xc0\x10",
++     "www.example.org.\t1D IN RP\trp1.example.org. rp2.example.org.");
++  T (ns_t_wks, "\xc0\0\2\1\6\0\0\0\0\0\0\0\0\0\0\200",
++     "www.example.org.\t1D IN WKS\t192.0.2.1 6 ( \n\t\t\t\t80 )");
++  T (ns_t_cert, "\0\1\x04\xd2\0blob",
++     "www.example.org.\t1D IN CERT\t\\# 9 (\n"
++     "\t00 01 04 d2 00 62 6c 6f 62 )\t\t\t; .....blob");
++  T (ns_t_tkey, "\4algo\0\0\0\0\1\0\0\0\2\0\3\0\4"
++     "\0\5\xa1\xa2\xa3\xa4\xa5\0\3\xb1\xb2\xb3",
++     "www.example.org.\t1D IN TYPE249\t\\# 30 (\n"
++     "\t04 61 6c 67 6f 00 00 00 00 01 00 00 00 02 00 03 ; .algo...........\n"
++     "\t00 04 00 05 a1 a2 a3 a4 a5 00 03 b1 b2 b3 )\t; ..............");
++  T (ns_t_tsig, "\4algo\0"
++     "\0\20\xdd\xcd\x64\x10\xe9\x21\x34\x1a\x8e\xe0\xa1\x9a\x30\xfc\x3b\xd1"
++     "\0\2\0\3\0\5other",
++     "www.example.org.\t1D IN TSIG\t\\# 35 (\n"
++     "\t04 61 6c 67 6f 00 00 10 dd cd 64 10 e9 21 34 1a ; .algo.....d..!4.\n"
++     "\t8e e0 a1 9a 30 fc 3b d1 00 02 00 03 00 05 6f 74 ; ....0.;.......ot\n"
++     "\t68 65 72 )\t\t\t\t\t; her");
++  T (ns_t_a6,
++     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x34\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t0 2001:db8::1234");
++  T (ns_t_a6,
++     "\0\x20\x01\x0d\xb8\0\0\0\0\0\0\0\0\0\0\x12\x35",
++     "www.example.org.\t1D IN A6\t0 2001:db8::1235");
++  T (ns_t_a6, "\200\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t128  prefix.example.org.");
++  T (ns_t_a6, "\x20\0\0\0\0\0\0\0\0\0\0\x12\x36\6prefix\xc0\x10",
++     "www.example.org.\t1D IN A6\t32 ::1236 prefix.example.org.");
++#undef T
++
++  support_next_to_fault_free (&ntf_in);
++  support_next_to_fault_free (&ntf_out);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 88ad5e44e8..d31c865641 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -57,6 +57,12 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-qemu-stale-process.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
            file://0024-CVE-2026-5435.patch \
+           file://0025-CVE-2026-6238-0001.patch \
+           file://0026-CVE-2026-6238-0002.patch \
+           file://0027-CVE-2026-6238-0003.patch \
+           file://0028-CVE-2026-6238-0004.patch \
+           file://0029-CVE-2026-6238-0005.patch \
+           file://0030-CVE-2026-6238-0006.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.49.0


