Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9160DC87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 09:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18087.1754643632346523530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 02:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=031568e1bd=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5785VHEp3366523
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Aug 2025 09:00:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyetwju-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 09:00:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQjZEsDPmoPHwmJfRt1M2stxYXtonbXIO8zqhlCQSub4KDRSLgVfOIYVHmL4z6X534zW+8X2GterGVILjgi1OKwV5MQ7HP+KBnw8FtyrJnooc3fHc8dMWcupGlKTkQ6kkvYmuG9tJGOySB0LhQ/J7CIM8SpyG0JE817J++nfK0wNNuvnV3vpXouBY3iBqoEvCU1RrpwXSiBjfxdF1KUdoQVFg9B0+sgPQmxMaJ3DpawPD2usM6Z19/ua+1dT1V1qetZaLMcz7yzHTTnrzS6XlDQDgphhC26ZnD4C5yf74rxfcLnUwPehaR6ceLCIvBV9BqY31NCSMYWRO/cPpQXjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xEVGXPjbjqBnrNDWCbX8cPt3xtZAoog3lw406D21gY=;
 b=h/vBi7UImxbVeKdw8cEKrF9iu+TjxvRE4PmjKjNDOynB84JcMV953BgFz4z8w5X44bmJYjn+m1BzXst1cchLFNy5KP0uZuxzQoiOIrQlxddCrnnnWTM/ZjAqpaEqQeuNBJimD2Z8Z7HpZj6Ezebo0hNcXgLTCNR/YBRw9hBKiFkB2b5dQchVLGX6BT3QPlamIAr7c7n9pYiEUgPw4Tnm7jc+7NUMiMIiir3moUMHNJDDsx6SUsT0HigCMrhJ9uvXK+IC44kRco8DCe38BKsL53zpQSUg3ybdRU0uP1MrbGALGdOTUhMF9thvN66gOZhXU/1GvTsr2hCboSIRtjvxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SA1PR11MB6784.namprd11.prod.outlook.com (2603:10b6:806:24c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.27; Fri, 8 Aug
 2025 09:00:29 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 09:00:29 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/1] gnupg: disable tests to avoid running target binaries at build time
Date: Fri,  8 Aug 2025 17:00:09 +0800
Message-Id: <20250808090009.2931898-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SA1PR11MB6784:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa9bebb-f51c-40b3-e3ca-08ddd65a05e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HVjc74+sxou1zyuZCycgSbgvGXys9Izhw7HAxKxDZXUnLHfmfL4LYRWFmGgz?=
 =?us-ascii?Q?X6y2QLjhjHEVXtTZhpCFqxCMahkGPO1YcVVhRbqrRtboS1cnMQ5o29acPTJk?=
 =?us-ascii?Q?C3NEM50ycqDpEcjedjW0CVtsMExF25WCHdcI/nycROy0Vk2mIMHukkG+b+cl?=
 =?us-ascii?Q?xoaGeBgxjQRCJzlGjJ4csSuqkklOfcTvwTOFBIlH/DN7+urGII4PoCGAngmD?=
 =?us-ascii?Q?04dSRccBYCcWA9s45795WhcZDhbbhbkNYmZw6IEL8mMhgiQwQ3wlFdsWW7PC?=
 =?us-ascii?Q?FpGC/sHIKQOhxnmxQxaDbydwCZQdcY/x1AnY4KYZEVzQE0atwTL0emhecKY+?=
 =?us-ascii?Q?cZPDyI2+QoRrtu6IYKkCAMHjNnWcEC18e5ieSBVF/spD2KnLi2r+Ex3SmdvE?=
 =?us-ascii?Q?WP3Gu5lGa+i55H6UULwWgRlH1aN4ouShMUAVK1d3PYmbHYCEOz2dIee/XCw5?=
 =?us-ascii?Q?T/cgOHsj6jEj/SD4b2ltkHRynxQWV5dap9ZHLH7Fx/3t5tycRgpMp2H/41Pb?=
 =?us-ascii?Q?TcggwmKeumAbkrI5rzoSW9wQWjPr4o0jLBtmxMzytvWkvE6AcMV7mC/OfM3B?=
 =?us-ascii?Q?FUA+hU8CvxpPI7nARhgwbYX6lzSwr8NkMaktW/NrtHEGX0MqmAokVT0BYJab?=
 =?us-ascii?Q?wDLQFonX6w4HAYjsHrck9j/fAK5XO3gZh7OyWakW8rAgf1scPJX7Llp8FTR1?=
 =?us-ascii?Q?2WvBNSmj405Ov5hoRBZ438QLWsam76jAKdGy9OIllqEgwQnDutfXaRPKnBl4?=
 =?us-ascii?Q?lh7CkVYWk26yDeTnVRdKwkCNq01U7ciXonappuwkWaR//GfvfX9cKL6Rk001?=
 =?us-ascii?Q?w/OprxYE0oJ3eF3TAPa/DPrusDnqW7hlullp2f1Lm8RVrYupDaICszlttxcQ?=
 =?us-ascii?Q?TSFqweLkXTvnI+9fz9pAdXkJ/REaY5xQNZY4jqPY8cEya6HiXqx2mP+me47D?=
 =?us-ascii?Q?y9M2rSolPC0NEzguXP5GVyl9+guWmcD3oRxrce+jXGdH1dLSVHpXoDEU9fpu?=
 =?us-ascii?Q?VDVbuxQj3MgL2rC5hb4CdzkX6gzSqkd0PT5ka4ywvYwBNqY8SMt159BO/Aw1?=
 =?us-ascii?Q?t/XADfAW5i3UcYiM8BESMMIVgAgeJT3RhifpuSh5S04Lb0FX2cNdN/9gpuC0?=
 =?us-ascii?Q?LXQaEBwPV+UHqbSW8OwRbULehV3DeeO5AHQbLw7ud6UGTvZGlkYPwfGeaNRM?=
 =?us-ascii?Q?4d67ZZk1q4GaplUkf/CXqjC/iBKVl5aBD2ifZ+/AmgTPA/zvBKM1A83lVraM?=
 =?us-ascii?Q?5Zo6FeHPw+WxsA6HKvW2Kino+pu2m4V3ViirDg1o7J2q8vhEQWZ4i3Fz4xwb?=
 =?us-ascii?Q?papPBx9B1FuleXD6M8taGDZ8Na/dPmnbJyYylPM2MJDdP8peFR5mrIo0VCEA?=
 =?us-ascii?Q?5c0ZCQ3HO04sVwkSYm0hwkQWj8HLI1hmr1s9fDj21fuHDUW5ur1+w38ODJs6?=
 =?us-ascii?Q?iRekWVj+RLgyktFNMWwkjkeeTCrE4xCkWx3iBlb5Wu3wGnYyNom35A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wMQsXA24xJ/ZPAC8L/FvAvcng2l9JH18r8RzKmsPObFGjV04oN3D4aFO770w?=
 =?us-ascii?Q?NN5/5TVP6nupP6AobxgRArvQb8bCbn35twkU8v1pEU+WVIsJftYpd2g1QYiu?=
 =?us-ascii?Q?DrrQvkJ7iwB7Bb7dSkXkZLOxLCZfOMywfcws32cn7EHok6jpFo8KSd9QB9Vy?=
 =?us-ascii?Q?kxCHwE7PD3yFP5kQR1hJCK4R5f2k8VsB6qtFXpXJG+rSC3WgYjIdcX6POpUc?=
 =?us-ascii?Q?cHx9DrzrfDv4Yj1AjtYfQzwEx2qgZdva9Ju3RpChtrlwEbfZcTCAARRFyBpO?=
 =?us-ascii?Q?OMyMtcTiN5rW4qzcYSv7GXob+xfRj6SCNidrX0/kR7YfRXRUQtgf8o3pYttV?=
 =?us-ascii?Q?WmNJW+X6uIzPED6z1cVi5aSIvSXnDymFt0eZ8ia2pDb9wwjssaD9i09izQg5?=
 =?us-ascii?Q?y2OAqt7MjFpsxanZByDNy4aJtR5deDGoz4pWEB39lQM0okIe/fzGFy/4E+M1?=
 =?us-ascii?Q?6w6i7Uk6LY+ZyFGsx/8km5qtH3eY2YmpMvzZJpypyViyq2CoeTSJ8OPx5FlB?=
 =?us-ascii?Q?30eLKXGvECJ5tw0xOgWowZvvznMyiFlE6rTspeZ+At/0+mHNcVxns8QegZLR?=
 =?us-ascii?Q?Y00pySNGR339hmXJlxrenn4IvUrihvtToh0b4jJ0T7Xq04g2udyfv2+b1Xo7?=
 =?us-ascii?Q?nQDTahkP77/CHsPK1eoWdTIS4+57O8Rbjr13Eghdfb7SCmxbcvqSxDZHijrd?=
 =?us-ascii?Q?+7EHEcCByKT7A0gyYjirYOvfa34UP0VgJ0xxb6VSHQkmyVvxcMO0QfPlrzn2?=
 =?us-ascii?Q?NakzGP7LsYfnkU5O2P3CG9FIw05yB0dVFrW+vK0oanbDKh09AdiUC2a5NuH8?=
 =?us-ascii?Q?anX3JBctGamgtkREgWf72a+8BM+QWghYqMhhMvlXtBHPoIXj50yz3GMAKzAX?=
 =?us-ascii?Q?szLKnAGp3KLYE3KAPTG7WYbdudcxrKPBPLhkDDT9WQwCzgrcmy2qOlRDH4S1?=
 =?us-ascii?Q?ANyqneoHEsfT61QG5pO2q9qIxq6krY0yecmkc8BBGB5KKTXJxD2cwaq/q0ND?=
 =?us-ascii?Q?AIfpFhEUqhQNWEvXt/9rHlCpuuwYatyMBvppV10dww1mnfM2tpQ0u91UuCus?=
 =?us-ascii?Q?UFIxKIEnOi0C8J3Ixxp6F//alz+0T5cO2UEGJNOmr59wKzau6JdFgnSTpWlS?=
 =?us-ascii?Q?dbNmE1rHCBzOlnQ6kOSD8et0YTyUXaZL3NQ0YT9i7ZxYhCPxhlVnUIJ4J/Qt?=
 =?us-ascii?Q?rjgR3kkbVVnxfnDFKl1npm+1T4HNi5EahtGxJFmZ2AQCFDI6n4VUWVF/Q6Oa?=
 =?us-ascii?Q?RZfwD1YKHzKhESW9QbW6scj72U1ftDI1nGJYifJ2UOqjVYTQhfBA4TNLIyM0?=
 =?us-ascii?Q?9SQPIq/S2sosEmj5L5uXTUdXCi2yfQBX3igYxmdgnPgrNWgSf2+ThPnmdFP1?=
 =?us-ascii?Q?5AuC7aq+qnfHs4be57LhmCXxATiyZ2iZ5f8sT7uvVZOWK6e3Zt6VvR94J6G1?=
 =?us-ascii?Q?Frk/EWrtaZEO2MyDHSECqujSVjsNgLpQaXzOBOLLZYlEhnXVDIYUwlpG6zea?=
 =?us-ascii?Q?ySg6t2XvARXgvA75d2W/xm/t4xSWL39B1kLrkcEbZ9Z4LqnrBmiRDXhjO2N9?=
 =?us-ascii?Q?tZ3eoRuZmRMqMkYEZUfMjTnLhGOalbS4hL2Zk2Ck3l6WAoAuQc6CsMF58Hsd?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa9bebb-f51c-40b3-e3ca-08ddd65a05e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 09:00:29.3788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lvqN8RlAevxFdjvGvV1ScvO32fs/jmMp3HzA1b+DdHTRyxMgv7kT9CqzVn8AZEWrAjtYKHoSIbneO4cap+p3Kx5nsux+Urn0icRdaPwkYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6784
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA3MyBTYWx0ZWRfX/8MtMN0Qj9LO
 ap2hTax75YLK60KzsaCum9u08/XGtYzyMzmXYDxetnMBrUjZrMe/YuYUd72zU31VNhAaWhVfnts
 d+YVCSTmGwWw2rEc/tJIDhUnVhyVZmQVVYvNs01RHkEGcylKEb75Unt79VnIvCB+L2cdzJ6LIaM
 9SCdeJde7y8eFka4P78+PL1I2iSyNouyG9YMxyyQEKKYgSxS8pfWFNSS9TLOIMcDcr3lSbY+o8v
 NMg6zXRA1+BqU+ic7S5cA1GCAe0+L8Oa2H6jFe5UhMq3oJjpcEQBGZRaBYilnw7F8nZJxkFuxuE
 S4I8QW8swryXCIg9FpvSINZ0P9D4AaXuaH44k/gG50htH1ZyV7NODQn3E2mF/E=
X-Proofpoint-GUID: VjuqViryQph7AnpI4xt1avRgQ_2gegQg
X-Proofpoint-ORIG-GUID: VjuqViryQph7AnpI4xt1avRgQ_2gegQg
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=6895bcaf cx=c_pps
 a=w03VZMKSO2wUmkC+UK+mIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8
 a=3vwvMTfDWcZzvwDieroA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 09:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221621

From: Guocai He <guocai.he.cn@windriver.com>

By default, the tests are built and run at do_compile and we can see
errors like below in log.do_compile:

gnupg-2.3.7/tests/cms/inittests: line 99: ../../sm/gpgsm: cannot execute binary file: Exec format error

Note that the do_compile process still succeeds. However, we'd better avoid
executing these target binaries at build time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: 74d48497470ce209bc6bdf49c2e2cfda67dce6ae)

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_2.3.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.7.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
index 7075a61898..238d1dfa0f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF = "--disable-ldap \
 		--with-readline=${STAGING_LIBDIR}/.. \
 		--with-mailprog=${sbindir}/sendmail \
 		--enable-gpg-is-gpg2 \
+		--disable-tests \
                "
 
 # A minimal package containing just enough to run gpg+gpgagent (E.g. use gpgme in opkg)
-- 
2.34.1


