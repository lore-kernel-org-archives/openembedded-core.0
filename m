Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F69EC5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8368.1786578570165348209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NmsST1tB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNLMFJ3856504
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:49:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=; b=
	NmsST1tBsFMPw2RWHZcYfIywM0AEjJisreYFrXnluU7yhlKlZVE1GvrUq8ca6xCc
	Li8O06MkIIu1NV/pE98XgDVy3O1ZdnAYQggljVr3wPzeqgWEO+49wYfXag0Taggy
	jvIQC2CbqwkXyP8mOgU48H/aAi0tp4lNWhtuaj7L2bV75gEv4+C+Vj5KBuStbLJs
	DGSOph3mGI0K3mfn+XQkCXAgNEBF/pesHMsM6cxvbxWhJCjgX2ohxtf+4zKmy8E7
	4SBIw2w5nt/9JGYCfUXczu7CMgD0QYbHUGe4UtjD2edEUTEoei587YLIZun/zChW
	pdB+FqPSy3f2Y3BtxpmAUg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022094.outbound.protection.outlook.com [52.101.48.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggc4em-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9iv88VFcU/b1hE3vsatOem00065OBI788MbHDk9psVJPOGZaWSy5c9bgL0A33oMekxeCzKcZAbdGILL+eqLsebBEayiI0/Y96PEkfS58B6fY3FvsnjW9/ixZKlwGCGBJPNiHZCuSryyS8Mi5qggD3bivdt9zij49DZEdGhxU28GQoSg8X4TNBAhL6IHkviwrn9ldJtoscdZL3ociyd5dOBwBYi5wi2fFc7K3wi01TRuqt+WTZVrfGE+GLFp5qh4xijet+KrylzCB9uu0UU0HEz0u0jQHnEvQ8Hl9f8kifwPe/ogbluK00Z2eDWY8shqNCqnmAtSw5cy09zSy/LPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdMqEUZTMTUVZfQmnzmYhqouDJTd7RYT1b0MFw8peJg=;
 b=W06zss/8zo1/xgGjvoLi0RbeuNaU6zlT2hBnhi9orz3/OLNuwIMU6tzvzMhjll3AOROyGhKy/84UKLNMFImYwcNlJPxq9+FFNEZs08bGtsHi2DDM1ByPMdaSfLxWmJlKVj0WMXIgIr0jaQQ3Ic77AheihntF8YCAxPZN+qtlHipG2kKccGYRhTAM7MlhMb9JjA1U7kfrSVytB/G2CuzZMpKsIubikWvlQuxW55R4lCOuOr+RmSjZMFFlUYHn2/uvH30mlMZrGJkaj2H6ARrRZVzFBfvxxY4PCWypU+NCQuWxVJ8EQxeUdo4QeQtKE0QDbqxywHEm7G5xavNbcL2GuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:49:25 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:25 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 07/10] libarchive: Make it work with rpm 6.0.2
Date: Wed, 12 Aug 2026 16:48:57 -0700
Message-ID: <20260812234900.866436-8-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c2b5393-0a36-4ed8-985d-08def8cc5726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|38350700014|13003099007|6133799003|12006099003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	dBBT6w+MIwV4a2SkZ274i0JsuV3sYG8+qn2iEYSJuRiPrYayFG2CsccfOr6hJqVBtr+5NYblK+u4fyAwvx4DdLbX61fzhT0m/GsWT0tEnkUybfK923k4/2A66/i/MxdL2EJ7fI84kWWZRyO8NbEkMA2tXjvnvM4vjbbfdsdCET1Pl7U/Q6F4/jRblAkb0Kcj3TVfeHw4Waa0rt2xxbjXbM62uI8HsqfpBE5fzfKfQzgLEVQCBfptHn0YaqsTbd8BOi9CSTHUWUUaJSfD3g8V4YDPOV5fo+vZY0dQWh6iku99t+wgtGcCl5jzivVnaBZruTbSCHW2lKRxhVze938sHbhBQgU729b6mHjBxmVyJrbmc0vJCQxMBBcuLvJ66C6877ecGBCXdFgx9QmDZxChgWnYT0ezD9D7IkamAE1zjVq6iojF7uJWKoKkqMPRDZ6ovOz3U15vZwGUic6cbaemH9U0YpJcEC/JJuS+FihyEcAx+A3tCp5o0Rtic6o/pn6k5u3WLY0HGox4KOPpkF8P9lmNWoMXoVyIClsTRIKuqPiCZGBFNfAefIj7hSDRYMGh7nSnreUXpXkqNk3wva4IBPMZhNvmB1m9L2qCEappKlSJlLdjoVoSbOLsd3jggjmAla54/0mIk+qNE30NaAKUJFPok2fE+WUDo52oZ6AEU20=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007)(6133799003)(12006099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sjF+N+cvCmaGyLGdiIZJILLCXet+JNHcIcYywg3jWsXyJAwg7LvQkZ8xZ4aw?=
 =?us-ascii?Q?K1kEFXiqEq/LJTprYNpR7Wp9hxX1yYuG3sZX8UNN9LwDLmoG1Hrqfazz4I7G?=
 =?us-ascii?Q?j5FWPnpoYqC9m89S11fk8pUOhkuijQkEfWBHGW6YGoXjO5yaK+3ogZYomVXo?=
 =?us-ascii?Q?zK22fUs/jtXFo5OmWYzVS63fYbuc1dPWCK4B8cOiHmrTkEqqu8mT/QUe2xCQ?=
 =?us-ascii?Q?bMBQll+dnzaKWXfjfDjWmjcHSsBRWKn2l5CPHwKkFO8G0S2x9+KR37HrNuvY?=
 =?us-ascii?Q?Q22MjQXyRV1DybN0GPR7MDwa71kcVnzWBBCF138LwWSdVe8UULhYrDEtSYY+?=
 =?us-ascii?Q?T/jUpq3S7aCJVdVl7ddW/5snd89zx5VhIyRuOTZs0FHeJ3bKk8yJ95F/jvpu?=
 =?us-ascii?Q?YOjqw1voKs7hcmtg2+dn9m4O4lxZU/CXMpR0Xqb8QwtBt5jGBzOun+CtiXsC?=
 =?us-ascii?Q?Hnkc82jcWwVPJpVRVpuJWyRFiAFeIYCHpIvWoxHjxZn29wmj4gEkbKLfkzle?=
 =?us-ascii?Q?D069YBv8Ze9nhRS4EP9gBlxCM0XSnToKc6jxsFlq+I2exZUsrmSYFGHaruEr?=
 =?us-ascii?Q?HY++YG+hThdaKsoGgPGRUrTTYTsoXoDcVZtlOg5GwUBoVVJXoUcoJfUejR3A?=
 =?us-ascii?Q?U/fPr66RsNgBlG4HTGcLA/TKJQs9tR1M6q3ke+9zuBVy4cKZ+0G7HPDY8v3H?=
 =?us-ascii?Q?Dy8lTaBYLqwOl5KEW/pv3kq4qbzml1Gh+HFDFjWeaqPFn26LD9gRUsZnhFbI?=
 =?us-ascii?Q?qk7Nr/7ESDKA5f2V9R5ZI5QEOSytkU8ki1p7cVFbaDscEX3IyzYI+X7Rfh77?=
 =?us-ascii?Q?YO2qCrlXDPc7lSBMqLC7k1VXVECzUvEXh7aloAyx7zW4POPwGe0G6PTpcY9D?=
 =?us-ascii?Q?e3y8BmS2VIVFKZELpLqhNMx5xa8Ws9dxX1v3qWdk57fhqUSNw1nLIPPUGTZP?=
 =?us-ascii?Q?D3iJ8hEZWyBwMlxKBglJCJxN1bbXzQK1XF14Cy28YZk1fpuAxTiWrJBlTubp?=
 =?us-ascii?Q?pMmfQBV1p9+kFil6hg0qYI1LsBPAiS7WgOlnc/wT5uhufQ2aA2d3mjMZAvNt?=
 =?us-ascii?Q?gWRBQDSkiTF56rxajZYFSXZclUEV28zJ0fnWJJBr0M4a1DhgD+mLqakeoZzu?=
 =?us-ascii?Q?aHrohU1BhHZftJAYXybxPPDvEdzTQSYwD+2mTe/IofoRMXx+rYZvChI9GueE?=
 =?us-ascii?Q?ZT8uaBQ/U90Hb6Ae/Tue51l+6QuXgZIiWMkCphLHQcJurzSvAdfiXeN348sO?=
 =?us-ascii?Q?AocN0Xnq0P/YaQ17AYeBt7ft1YhP5V9UJcmthIewNT3Y+Agd6UV1vRdYYiw1?=
 =?us-ascii?Q?Us+3JujP/e+A8o/6MY8+K16f2NKxiytNaBt3LYrMyKQx+/B1SEyRBb2srUBg?=
 =?us-ascii?Q?FHe2dSX/Krz5T3o4H0oYrk9KsWhVB7krbqONcD8vH6n+ecAHc72fesnz0mFI?=
 =?us-ascii?Q?O//bf1KSAf50U95wuzNBq1oGum+8SWR4qv94CKgxE0iU8MRLvupj/xnGBx82?=
 =?us-ascii?Q?wJ/19JxdW0DqQ9I3gkDSiEM4DOAkYlE4TlUYw6LzMd+7pKNE3uuvfc9a0qSJ?=
 =?us-ascii?Q?H/duI8+Lfw8moqWcmeSa2xDFQ8SDzziNmTIF+k3QE6dPUiOSxKp8hUbRfsRB?=
 =?us-ascii?Q?xOw7SNUNl4AopBtP0plxf12/wDSxnOEq2/d1cF+1X1PbIhaoubPMn8JCjZu0?=
 =?us-ascii?Q?rGIL0CbTvc+Z2xmk9Bd0QXzF+BA65Z4ZeLBgyNhPp5FXFF2Pdd6JsN2rrLHu?=
 =?us-ascii?Q?luSOHZTJ7lXGNY5sAOfKA+l2qrIL8HQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	LKI/TGQoolE+0kK77E4Z1Vi3gidAD33rwr0G0r3QWI1WVKU2AS8y1tkr9D+9p2mruzveBwlNTVOn8nWAQ/zAMLlxiBfOXsprZrO/jidTpOif2/JCLPwKzjAAEo4L0kTImABnLxKwpXcXi1iNUEbmNqHQN4fSBr2P8Nfu4rzzkqKQgucxTm8YBsCXlK6JyKJMJMAkBQQbbaTGqMGkjBJ4Hn7oZBRNx0nSJOBE5vls7PD4ZTp4TXmslg69dKHbg8nnFbfW7etifJTuVlpxrr1BABd68EnHBLWeO1Oed7EJgASoEmpQe4XkUZSndYTPXbi+AMkkrp68PN0RWf9eCw5W0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2b5393-0a36-4ed8-985d-08def8cc5726
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:25.5054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTHsU9IvgmAHt6daEi/inWayQgDiJRYjD48cgXG3uKiJsKE3nSRijcbXXdl31tcEHVOeBChPVru2jI/W2cARuvCbtmcXu1NvNH0wpJgamCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: w7P6WMWR5BZa3d-eBeQlkv7xvhNhtnAw
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7d0689 cx=c_pps
 a=kWDUzu7Sg0boEHrzbzcNEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8 a=yC51jOswJ7eKArgWbMgA:9
 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX1CbQ8vcxpIMo
 EwWkoK6sL5+zl0Vzsesj1XPrJP9jhWXzPmXPCYgsmIUIdCHG9DmDfvmuV+TdnVBRWSoCJkQz7H5
 Th7aTvAunsv5mstsAsnD7gpEpUmdsPjbAJ+NPlmF6EY4cUnCxaOqt9z6FTj5+T8v1chgyffyrFF
 DqvuXLwy9f0a4WIXeNIrpVq/AnHADvcVUWa9Tbi6FWEI9X02s53QlLr0v1RjQczYjsxytbeVXYy
 DAg0zDdwU3zMMQrAh9SjodMOtMD1JBHUKBVsujCi0DwpVKkMVWJHEReRXWma8AihBfTsBBQX2Fq
 Ae0CnynaVfLaJ1QQqEcpyHxLfb+Ejrn73zlnfceYknkcl5W89LL3IYFytOVcy8DoUW+/KuFet34
 MT7c1/chhf6zpYmfWrSrK9mMzlwqSTZ6ENNWucqO2qU8sNA4EStCZ2ENvopdB9COLRFssqGOXXs
 /c5T7m0iJRCerMG+8yQ==
X-Proofpoint-ORIG-GUID: hgE_u3ie6tT4nLfhesB1recHcGRhNWo_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX1BOZBnvKL4uf
 vvGxOUazwAtO0f73moynJpB9quGlFrYacCWEAfLN9RBruyUBak6gzgRSaqerkrMkAfKFNiBNdD+
 U6XLr+eDCOC/SaQAc9letZQ5CLS7QfLsJ3dWxorj3V3qmsiWU1/V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243316

The patch is from:
https://github.com/libarchive/libarchive/pull/3346/

Fixed:
$ oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native

cannot open archive from pipe
/path/to/tmp-debuginfod/work/x86-64-v3-poky-linux/xz/5.8.2/localpkgfeed/x86_64_v3/bash-locale-vi-5.3-r0.x86_64_v3.rpm
libarchive error: cannot open archive from pipe: Unrecognized archive format
exceptions encountered during archive scan

Note: 0001-append_filter-Use-last-bidder-for-filter.patch was already
present from upstream, so only the remaining two PR #3346 patches are
added here.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...-Verify-that-bidder-and-filter-match.patch | 103 +++++++
 .../libarchive/0003-Remove-bidder-name.patch  | 258 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   2 +
 3 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
new file mode 100644
index 0000000000..a91f518207
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
@@ -0,0 +1,103 @@
+From db4fb440792278cd01e0829c93f6b62f567b704b Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:26:22 +0200
+Subject: [PATCH 1/3] append_filter: Verify that bidder and filter match
+
+Make sure that appending a filter always matches its supposed bidder.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/test/CMakeLists.txt                |  1 +
+ .../test/test_archive_read_append_filter.c    | 54 +++++++++++++++++++
+ 3 files changed, 56 insertions(+)
+ create mode 100644 libarchive/test/test_archive_read_append_filter.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 2fb4fdf4..c96b3bc6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -404,6 +404,7 @@ libarchive_test_SOURCES= \
+ 	libarchive/test/test_archive_pathmatch_oob.c \
+ 	libarchive/test/test_archive_read.c \
+ 	libarchive/test/test_archive_read_add_passphrase.c \
++	libarchive/test/test_archive_read_append_filter.c \
+ 	libarchive/test/test_archive_read_close_twice.c \
+ 	libarchive/test/test_archive_read_multiple_data_objects.c \
+ 	libarchive/test/test_archive_read_next_header_empty.c \
+diff --git a/libarchive/test/CMakeLists.txt b/libarchive/test/CMakeLists.txt
+index 44f839f8..c4102c3d 100644
+--- a/libarchive/test/CMakeLists.txt
++++ b/libarchive/test/CMakeLists.txt
+@@ -33,6 +33,7 @@ IF(ENABLE_TEST)
+     test_archive_pathmatch_oob.c
+     test_archive_read.c
+     test_archive_read_add_passphrase.c
++    test_archive_read_append_filter.c
+     test_archive_read_close_twice.c
+     test_archive_read_multiple_data_objects.c
+     test_archive_read_next_header_empty.c
+diff --git a/libarchive/test/test_archive_read_append_filter.c b/libarchive/test/test_archive_read_append_filter.c
+new file mode 100644
+index 00000000..5c301d52
+--- /dev/null
++++ b/libarchive/test/test_archive_read_append_filter.c
+@@ -0,0 +1,54 @@
++/*-
++ * Copyright (c) 2026 Tobias Stoeckmann
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR(S) ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR(S) BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "archive.h"
++#include "test.h"
++
++DEFINE_TEST(test_archive_read_append_filter)
++{
++	struct archive *a;
++	int r;
++
++	a = archive_read_new();
++	assert(a != NULL);
++
++	/* Append a program bidder (without filter). */
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_support_filter_program(a, "prog1"));
++
++	/* Append a filter program which comes with its own bidder. */
++	r = archive_read_append_filter_program(a, "prog2");
++
++	/* Verify that filter uses its own bidder. */
++	if (r == ARCHIVE_FATAL) {
++		assertEqualStringA(a, "Can't initialize filter; unable to run program \"prog2\"",
++			archive_error_string(a));
++	} else {
++		assertEqualIntA(a, ARCHIVE_OK, r);
++		assertEqualStringA(a, "Program: prog2", archive_filter_name(a, 0));
++	}
++
++	archive_read_free(a);
++}
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
new file mode 100644
index 0000000000..bbd2478577
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
@@ -0,0 +1,258 @@
+From 76c7142bd2595184826722063598fddf62031cca Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:31:33 +0200
+Subject: [PATCH 3/3] Remove bidder name
+
+The name was only needed to find the appropriate bidder for a filter.
+Since this has been resolved by accessing the last bidder, since in these
+situations the bidder is added first, then the filter, the name is not
+needed anymore.
+
+Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/3346]
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read.c                         | 2 --
+ libarchive/archive_read_append_filter.c           | 1 -
+ libarchive/archive_read_private.h                 | 3 ---
+ libarchive/archive_read_support_filter_bzip2.c    | 2 +-
+ libarchive/archive_read_support_filter_compress.c | 2 +-
+ libarchive/archive_read_support_filter_grzip.c    | 2 +-
+ libarchive/archive_read_support_filter_gzip.c     | 2 +-
+ libarchive/archive_read_support_filter_lrzip.c    | 2 +-
+ libarchive/archive_read_support_filter_lz4.c      | 2 +-
+ libarchive/archive_read_support_filter_lzop.c     | 2 +-
+ libarchive/archive_read_support_filter_program.c  | 2 +-
+ libarchive/archive_read_support_filter_rpm.c      | 2 +-
+ libarchive/archive_read_support_filter_uu.c       | 2 +-
+ libarchive/archive_read_support_filter_xz.c       | 6 +++---
+ libarchive/archive_read_support_filter_zstd.c     | 2 +-
+ 15 files changed, 14 insertions(+), 20 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index e844e42d..406d84de 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -1290,7 +1290,6 @@ __archive_read_register_format(struct archive_read *a,
+ int
+ __archive_read_register_bidder(struct archive_read *a,
+ 	void *bidder_data,
+-	const char *name,
+ 	const struct archive_read_filter_bidder_vtable *vtable)
+ {
+ 	struct archive_read_filter_bidder *bidder;
+@@ -1307,7 +1306,6 @@ __archive_read_register_bidder(struct archive_read *a,
+ 		memset(a->bidders + i, 0, sizeof(a->bidders[0]));
+ 		bidder = (a->bidders + i);
+ 		bidder->data = bidder_data;
+-		bidder->name = name;
+ 		bidder->vtable = vtable;
+ 		if (bidder->vtable->bid == NULL || bidder->vtable->init == NULL) {
+ 			archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 9dd9f536..5cc8ff55 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -174,7 +174,6 @@ archive_read_append_filter_program_signature(struct archive *_a,
+     __archive_read_free_filters(a);
+     return (ARCHIVE_FATAL);
+   }
+-  b->name = a->filter->name;
+ 
+   a->bypass_filter_bidding = 1;
+   return r;
+diff --git a/libarchive/archive_read_private.h b/libarchive/archive_read_private.h
+index 3bd8de2d..e30b6c2b 100644
+--- a/libarchive/archive_read_private.h
++++ b/libarchive/archive_read_private.h
+@@ -68,8 +68,6 @@ struct archive_read_filter_bidder_vtable {
+ struct archive_read_filter_bidder {
+ 	/* Configuration data for the bidder. */
+ 	void *data;
+-	/* Name of the filter */
+-	const char *name;
+ 	const struct archive_read_filter_bidder_vtable *vtable;
+ };
+ 
+@@ -250,7 +248,6 @@ int	__archive_read_register_format(struct archive_read *a,
+ 
+ int __archive_read_register_bidder(struct archive_read *a,
+ 		void *bidder_data,
+-		const char *name,
+ 		const struct archive_read_filter_bidder_vtable *vtable);
+ 
+ const void *__archive_read_ahead(struct archive_read *, size_t, ssize_t *);
+diff --git a/libarchive/archive_read_support_filter_bzip2.c b/libarchive/archive_read_support_filter_bzip2.c
+index 588953f2..1cfc55dc 100644
+--- a/libarchive/archive_read_support_filter_bzip2.c
++++ b/libarchive/archive_read_support_filter_bzip2.c
+@@ -91,7 +91,7 @@ archive_read_support_filter_bzip2(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "bzip2",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&bzip2_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_compress.c b/libarchive/archive_read_support_filter_compress.c
+index 4e1f1dc5..4763995e 100644
+--- a/libarchive/archive_read_support_filter_compress.c
++++ b/libarchive/archive_read_support_filter_compress.c
+@@ -160,7 +160,7 @@ archive_read_support_filter_compress(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "compress (.Z)",
++	return __archive_read_register_bidder(a, NULL,
+ 			&compress_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_grzip.c b/libarchive/archive_read_support_filter_grzip.c
+index 9d9ad46e..8457ec7c 100644
+--- a/libarchive/archive_read_support_filter_grzip.c
++++ b/libarchive/archive_read_support_filter_grzip.c
+@@ -62,7 +62,7 @@ archive_read_support_filter_grzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "grzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&grzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_gzip.c b/libarchive/archive_read_support_filter_gzip.c
+index 89ae0f37..34b174b7 100644
+--- a/libarchive/archive_read_support_filter_gzip.c
++++ b/libarchive/archive_read_support_filter_gzip.c
+@@ -96,7 +96,7 @@ archive_read_support_filter_gzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "gzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&gzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lrzip.c b/libarchive/archive_read_support_filter_lrzip.c
+index 33910fe1..a1d45d77 100644
+--- a/libarchive/archive_read_support_filter_lrzip.c
++++ b/libarchive/archive_read_support_filter_lrzip.c
+@@ -61,7 +61,7 @@ archive_read_support_filter_lrzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lrzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lrzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lz4.c b/libarchive/archive_read_support_filter_lz4.c
+index 19086a1f..28189a07 100644
+--- a/libarchive/archive_read_support_filter_lz4.c
++++ b/libarchive/archive_read_support_filter_lz4.c
+@@ -118,7 +118,7 @@ archive_read_support_filter_lz4(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lz4",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lz4_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_lzop.c b/libarchive/archive_read_support_filter_lzop.c
+index ebfaf01e..5a552fce 100644
+--- a/libarchive/archive_read_support_filter_lzop.c
++++ b/libarchive/archive_read_support_filter_lzop.c
+@@ -109,7 +109,7 @@ archive_read_support_filter_lzop(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzop",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzop_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_program.c b/libarchive/archive_read_support_filter_program.c
+index cf7c3613..a9e02a32 100644
+--- a/libarchive/archive_read_support_filter_program.c
++++ b/libarchive/archive_read_support_filter_program.c
+@@ -156,7 +156,7 @@ archive_read_support_filter_program_signature(struct archive *_a,
+ 		memcpy(state->signature, signature, signature_len);
+ 	}
+ 
+-	if (__archive_read_register_bidder(a, state, NULL,
++	if (__archive_read_register_bidder(a, state,
+ 				&program_bidder_vtable) != ARCHIVE_OK) {
+ 		free_state(state);
+ 		return (ARCHIVE_FATAL);
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf7..1cfddf75 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -71,7 +71,7 @@ archive_read_support_filter_rpm(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "rpm",
++	return __archive_read_register_bidder(a, NULL,
+ 			&rpm_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_uu.c b/libarchive/archive_read_support_filter_uu.c
+index c0f6f48e..10d49648 100644
+--- a/libarchive/archive_read_support_filter_uu.c
++++ b/libarchive/archive_read_support_filter_uu.c
+@@ -92,7 +92,7 @@ archive_read_support_filter_uu(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	return __archive_read_register_bidder(a, NULL, "uu",
++	return __archive_read_register_bidder(a, NULL,
+ 			&uudecode_bidder_vtable);
+ }
+ 
+diff --git a/libarchive/archive_read_support_filter_xz.c b/libarchive/archive_read_support_filter_xz.c
+index 7c8e0cb5..b00ba543 100644
+--- a/libarchive/archive_read_support_filter_xz.c
++++ b/libarchive/archive_read_support_filter_xz.c
+@@ -115,7 +115,7 @@ archive_read_support_filter_xz(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "xz",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&xz_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -147,7 +147,7 @@ archive_read_support_filter_lzma(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzma",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzma_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+@@ -180,7 +180,7 @@ archive_read_support_filter_lzip(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "lzip",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&lzip_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
+diff --git a/libarchive/archive_read_support_filter_zstd.c b/libarchive/archive_read_support_filter_zstd.c
+index 12eac04c..163f54b5 100644
+--- a/libarchive/archive_read_support_filter_zstd.c
++++ b/libarchive/archive_read_support_filter_zstd.c
+@@ -87,7 +87,7 @@ archive_read_support_filter_zstd(struct archive *_a)
+ {
+ 	struct archive_read *a = (struct archive_read *)_a;
+ 
+-	if (__archive_read_register_bidder(a, NULL, "zstd",
++	if (__archive_read_register_bidder(a, NULL,
+ 				&zstd_bidder_vtable) != ARCHIVE_OK)
+ 		return (ARCHIVE_FATAL);
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 868086e319..01a5249a88 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -33,6 +33,8 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
            file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
+           file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
+           file://0003-Remove-bidder-name.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

