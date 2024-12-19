Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A91E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:23:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.126126.1734600218486846798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=20834194c1=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ7ntJE014774
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:23:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h1095jy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:23:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qo5FmfdS9Tq2CUS0g5MEFAG2MaWatXTKZxLTTkxRLVJ0LFgqsSCktsAhiPo9V70KCaLinX6WtHD3Sef/hwG1NMUX4a+0haGS9aRkxcSvaUmGS2hUQ5UsCOfoIEjyJZDZRs+54EC7S3QLiTs+23HZHBKPfb0ZvKlKBnNOAbhgqtdgXpisotcFk78FrkZwYEFWR2y1jzJFS9H9/xFwlTbIeto15BwIxvuSddzQFBCmmsvzjmkGOLiW94E2wIIK7kHcaZlatUmNmyGdo4arSPPKxawYeuNoodZIVB6UzmRp3xLoifMTAy+hEGZXDHU/Q0UYbkXLPWc7RvMbIh9LnCF0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twwAwLqwaJLgf3Tum3qjL6QAewX9bqBEJl1jeA8+tXo=;
 b=zAVxrLqd3Q1EC9T4Mpk33JHgiJv/n/BNBjYP2F9yTWkWCRAVDoK49niS3F3uyfmTlSgj6oRgqoG63OoH+U4S+VzuWl+sjBQpiEcpCBBqo+KrRgu3I9vetucfunh9uvAUo5dqkfa1s3jraDVoDHpg+uqZWamuNmwDzgtEEfP/AOoPu/YJoyZaijvhkd2nspV2YqXwJ093W0rZ8QqmRrgOKsS1MIIyCvsEnNIM8UhrmOZbootu7mdZOYRHogeMI4Yfvc8GGriu5GflGZBNvgfuGLhk97SG5co9RfajyrAoSSqLgO+rEnNnv6GquQIM7AbwITIRcuN6TRvQ3fSRRX/d8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6871.namprd11.prod.outlook.com (2603:10b6:806:2b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 09:23:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 09:23:32 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oe-pkgdata-util: avoid glibc-locale being mapped out by glibc packages
Date: Thu, 19 Dec 2024 01:23:19 -0800
Message-Id: <20241219092319.3800319-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:510:23c::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa12338-4bea-4b38-548f-08dd200ecdda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YLDAE/v4oldP9cGKwrrVbwhREwk4WSyvfjywJxjwQzFT0Pkcc4S5/p3Vkn83?=
 =?us-ascii?Q?HoqYHdye+NVSwTmu35rvrYPnu7DeF125tzgIjUplRMY99+b27CwDgl0kD5d/?=
 =?us-ascii?Q?W1+u4GLm7u5qwPGUx1EWXcLQ4+54srBdG0UwBgxA/vXBnZ+6blAYTus7yCHE?=
 =?us-ascii?Q?J7iOPEZEPF3kzJ/oAz4KTNzztHRmmq8BTrNxTT9BEDi2JYaxaUVglHUpj3CP?=
 =?us-ascii?Q?wl2TV2wTqD90M+zRwLUlerqQAVPVqNVuhsOZeOk37cIA6nZ/0CrIj/uB5TlN?=
 =?us-ascii?Q?UTbqRYJqfFKqrITg9BvuSzCuw7HfV0q9bafBxGsncQ48WBYynuFsf+Xlh9vI?=
 =?us-ascii?Q?c20ASiwCBjnSijCLWVMIuIRuvhg3utlr755Ka2/apLnAdibWyEOvy6wlX8LA?=
 =?us-ascii?Q?vdxopixrpYPbEx2KOZviN9G8xZ6vToE3e81V9Y6BmX1CHneNROI2pugdiMzo?=
 =?us-ascii?Q?gZHG6ye0d7t0VosZjwFbYapL3WbJ20uJsI+Y1QSnvUkjWnOuGRGZcBIzv9aU?=
 =?us-ascii?Q?saQRjnwxqQfGCtQ//KXvmV7FxZXwZtiyHEdPkUOJn99H5uEcntOri/7XkBMC?=
 =?us-ascii?Q?+c5MpGjuxkPlY/vEuaqA2GwK5D3/OWyLpdVxMANedOzzsSijdK0oWhtBXRJv?=
 =?us-ascii?Q?a8IQ8Op1aqWRVnlb4aQlw9IfHSpkZzLKMZPRAJmMVvBSo5pn5IZz5dc82AHO?=
 =?us-ascii?Q?XwwxdgnPdvjDxqcAuf58P0FnO2Q7uRNYi1KNEjrGJaI+gS2GvGJIpjGUxmVj?=
 =?us-ascii?Q?uHMo+3yg7zZdWE5fp30riGkCU0zEnJCV13fe4ZyWgO4p/6UfD1RGV1e86RWa?=
 =?us-ascii?Q?B7PJFPGSA4BCVGXuu3hSX1ZLrGHYZ1TGu8XNIGuOFHDQZIK8YUPdft7E6iu+?=
 =?us-ascii?Q?LPQtmBlFU9HsRxFVfjZd80lSlvjdQPf2K7jvR+QWaQJ1vcUD9OeB9NziAoBA?=
 =?us-ascii?Q?v5wJpr4rQEElroaCqI9IjqQ2IcSdfEGv2V29doGWojWE5abzuXU5ZETnr7+e?=
 =?us-ascii?Q?SEDCT7wLyAleh6EJ5aewhgkxRtamNza3YmhmrEuHrBx7tT9sjRsax02Ey7Ep?=
 =?us-ascii?Q?w31g+r05420qe2OYuNfm3+MwLR2Q7sFlqTB9VrzV40gVpkD93SIx65TGoNd/?=
 =?us-ascii?Q?5EJnY06Zj4wSyw66uyDbH2k4cg32jgWWNFDq2Kf8l18XjKwON/AI5OL3UDQV?=
 =?us-ascii?Q?SRo1iRwFNUwzCUfeZIwh2GZVKx6ypELV7BfDa37i9IymscMFPGahY1+VKBsm?=
 =?us-ascii?Q?9xwMvn7hw5ohOZW52jPXGvo2jC8eelGNc9r9ZVZfMuAyvM2UkFCw0xAhw6DX?=
 =?us-ascii?Q?s0dHur1SszHjlj2cnGfGzzkGv0PqjD5AxSreXa3TI8ICNeWz9GSJo3v9PbDT?=
 =?us-ascii?Q?w+8HRCsHPexXB85sgZWs6RcOl2MmYbP7P3GiLGkR9YIZDn+COALkvgSRwS/p?=
 =?us-ascii?Q?AHPElJXbNW/3a4ONDOKvzyMXwo6rpXa8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cUfurVYAFJgs4c/TqFg7z/x+6bpmgxPCSmDlCCBZ1vNQUjU7AFVMjmvAB/gm?=
 =?us-ascii?Q?MVtkZXtKdjf5CEjT+SEPy2/nlw2iPwxUerZSyqMqjEqLfn5kUOZ/1TvQTRKf?=
 =?us-ascii?Q?Y/pTsV0/E0afSwVYnWfuLlyNJZKgLgpPXV7KbIDYUSFfWnssaUBz5KGC8s8C?=
 =?us-ascii?Q?ixCMWE07AjWc161m0nA2lwxMLMPztfJvU4NcZaqkiHYV4EMmi/uvhD6n6+nD?=
 =?us-ascii?Q?n/uCb5y+U+6q+LkAkAka+RIEORkKhrmwQevSXd7/N1ohQ4HTXiF/Kf0kOYpi?=
 =?us-ascii?Q?6GnUFF/nmWYmhSxzzvEc5rjOoe0nPgv92iMHqXC4jUuItgjZeLoTU3KX9CNn?=
 =?us-ascii?Q?5I1YQfEo1upKmDxI+McMZiS+7O9Bv8Lyb5/ImLbw2Q8VVLZmMsKR4/fG0d8+?=
 =?us-ascii?Q?GC9Y/JUIxOhUcAl2A3gp2eR3OzvH9oqFGybf0g2K4AZKf7rCDPs6o8roBb7Z?=
 =?us-ascii?Q?Q1vSoQADJbud4NmEfc8tliP0Reh7AbzJTbhysxPU1XD0QUBuMfqZaF+qoJx1?=
 =?us-ascii?Q?ffhy3zQDlEVMV7GZL+4t0lcJIFck9H2V/nRnimwk3vUWWHtIL49YA5xVJHs8?=
 =?us-ascii?Q?A7jaY24O5FIjUAhA8potAC3aqOay7N0pQ9XGxF00q1khoSjBepQTWT7VY7S/?=
 =?us-ascii?Q?/FX8E0k1Zw8C+thKUonv7w1CWNc/8UXq46htkZbvosi/lX5TyBgQc1DeTE5N?=
 =?us-ascii?Q?ISJRNrPIICi3M8rpsBVVB9XIn721MOugzM8VtFiSlo/ehFP4BGJ77Pq/ctf5?=
 =?us-ascii?Q?gv3vqeWlARx9oKbZWIPqdfbT9MolH6K3gK2O3cvdQ6y+FmGHGL6hHZ73nQmQ?=
 =?us-ascii?Q?kDpQKuIyIqvbptNshpCByjGDsEwjatOxUbj39vJxvJzmqEHCJZwzF6gE/5/F?=
 =?us-ascii?Q?blArkEltbaNm+BpDxqWByrjkS21ItB/Be1SNmEZmPIf3QknmEPeEHUY/3hYl?=
 =?us-ascii?Q?HmbCCxYmgyVWLBBitN2Hh/UhbbRmsKTHDHyXNodw6zh0hRXz4O1ggQ17qwLU?=
 =?us-ascii?Q?jEozWcYm9HoAjs6oReU7q3FfrTOeHLRqlT9CB7/yI5eQtxluiaeIzAL1aRL6?=
 =?us-ascii?Q?9AE+TJ+jA5oqtF1y+YL2mQPu5u1qprcJ8omy8lJ9zFJ1V8M+D9VE3eRDq0nu?=
 =?us-ascii?Q?b1HLKtWHHB8c6+TmglQYo30aPkIKuD81VkRFxefTnjcsn1UIlLPKClmb9AVP?=
 =?us-ascii?Q?6hNuCIehDMkS9AvGWAf41BBwT6/uOap/tgUyb+2nFhIUnn67MtOSQbeDt9G2?=
 =?us-ascii?Q?NoLDTLFtzeWFMyQZ9wdQ3lRdHTE9fBpw2OUNTGG4SUF8Ww8XcI8r2V8rsBW+?=
 =?us-ascii?Q?EDSSRGlkgRdY18B9etj5oX7GXfZhdutw0ACfzYFS9YFI0N+vC98oI5H1MMbc?=
 =?us-ascii?Q?LUsemckjaFfgMrubaW3LyZY8ZCNu6X42VHEbotf/fYMNEbVPJNyktvaXXoUg?=
 =?us-ascii?Q?HQ8HPG2nCBvHCX2EFFqXd9G4Z2wWyx7n9Tw0jFVQ7drU8QeKgm0j0FjAwcYK?=
 =?us-ascii?Q?Xosx1GJrPUy8navlDOHXyKLmzrTHWQhl8jf1UhpIUFcfjU5i2IfpKz0Sl2Xf?=
 =?us-ascii?Q?LlcdFAm7KDQAt3JlKxa9EdkWnoGaHO6qE/fIlQvD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa12338-4bea-4b38-548f-08dd200ecdda
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 09:23:31.3050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WbFdiYskpHNYYaevAghFlbB1UuOcZIRu3rOpstxSJhuklOipDlO/dtPvW+Dup0m3zWArY8TZJJdCsxiXAOkvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6871
X-Authority-Analysis: v=2.4 cv=bp62BFai c=1 sm=1 tr=0 ts=6763e619 cx=c_pps a=OxY2RB2sa7x8oI2LU21LDQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=D82hjbkxm0GsMeQaPhgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ojzMXiwFcPdqoz_3jHxD3eATk7ee9H8O
X-Proofpoint-GUID: ojzMXiwFcPdqoz_3jHxD3eATk7ee9H8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_04,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208902

From: Chen Qi <Qi.Chen@windriver.com>

oe-pkgdata-util's glob command will output different results depending
on whether glibc-locale is built or not. This in turn results in do_rootfs
error when multilib is enabled.

The error message is like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Enable multilib and install a lib32 application by adding the following
   lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?= "multilib:lib32"
   DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
   IMAGE_INSTALL:append = " lib32-sysstat"
2. bitbake lib32-glibc-locale
   Note that people usually don't deliberately build lib32-glibc-locale,
   but they will do world build. And when so do so, the following step fails.
3. bitbake core-image-full-cmdline

The problem happened because do_rootfs will first form its own repo by finding
dependencies. glibc-locale will be brought in because of IMAGE_LINGUAS. But
lib32-glibc-locale will not be brought in. And in install_complementary,
oe-pkgdata-util will use its glob command to find all complememtary packages
for IMAGE_LINGUAS, such as "*-locale-en-gb". Then we get the above error.

glibc-locale has its own recipe and which to install into an image is
determined by IMAGE_LINGUAS. So let's not map any glibc packages out
to glibc-locale in oe-pkgdata-util.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-pkgdata-util | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..9fb7952c58 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -136,6 +136,10 @@ def glob(args):
                         logger.debug("%s is not a valid package!" % (pkg))
                         break
 
+                # we don't want glibc-locale to be mapped out by any glibc package, filter it out
+                if "glibc-locale" in mappedpkg:
+                    mappedpkg = ""
+
                 if mappedpkg:
                     logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
-- 
2.25.1


