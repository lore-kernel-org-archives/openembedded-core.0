Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F181CC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 11:54:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38752.1738842842130838966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 03:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41326f0d9a=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5166P0Rm021555
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:54:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:54:01 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 516BoJWT009530
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 11:54:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8dbjq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:54:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXRKVMzxvNKKbVN2cbwaOMY/5rP+NKnfsdHIg1pqyKuEn97fxlM8tHmzFW51LoTJqun/x0KpjxVIZaDtbA7ubj+JBO+lJI+Uev35F6H6kkOAN2L3nk3pOAY9HGzuB7hY+qza3+8o3T4ucTK/xCjG5kmCi7/t7feYefDvK4BSPwo9ocXF07MWlOBuDJfuHxdrWTe4hIHFNuzwX+ornU3PLsZ4qSWYJS0+xUPpb+Z1fFnfoAHhHxbZWF+DoCy+7mNNDS81JWb97C7hxYkArAJXY4TeRo1c0h2jzvZzVosTvceJ+BxPimNxwoBWNqqXQbNm11RFmgqJMMMrVmOL+sht/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Voq7+Lt8WPoCq1EgKy7Uqc3doP9dY68x6pY1RM2vDsI=;
 b=Ph0RaRKsCIq/CqTrCbqdrKaVeSsxycqN1nZ31/YMl4PAEuF6gP/s117CCdsPMPdNj243C7P40s8Pvs6YqschHSTplz8KKWJwGcTBXAjeGizfTJMT8ciWtZwq//nSFPPjGAvxMpVUUAr9994vmJvIGmA+e/SBAK0GGIOulrw1zeziQQzTp1XkUWh0VJ1YB/8G3IDynr+Wjek4qME6UUUI4jFhHm/YTDZyKyuf2o9M52mk0q1bDD4NAXc8MY9qceWlEQnu5i289pO8HT43fs4AAGX3fdK7RzLbtCCOxb+R/ckWbRyivXkSvQfKJFwOgoJByxHgMtDNUX4hH/W69VXRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 11:53:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 11:53:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [scarthgap][PATCH 2/3] rust: remove redundant cargo config file
Date: Thu,  6 Feb 2025 03:53:18 -0800
Message-ID: <20250206115319.2604977-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206115319.2604977-1-Harish.Sadineni@windriver.com>
References: <20250206115319.2604977-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6833cbfd-2454-4055-a539-08dd46a4ef80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L7eyRRJ2gutLBCnQ/VVhx3Fe9YoUinTceDbdIkAn2Y5obRb5Jewk5bnM23Ji?=
 =?us-ascii?Q?PnNZuz1hZPzz4vUJZNGujKuCPRADRx3GmguafYD8EtklLlLx9VJw16CCusgo?=
 =?us-ascii?Q?rDZjwVmJsBI9U+mHbYXSnfb/+w3FnEzG+BXFakcZ/sQR738bx1AvN303zRke?=
 =?us-ascii?Q?vs1NO8NKch85J1e/ruE2M0MWRLgmnN+Hq5U/EGUZePmXTW/ngKsdSCTPlFoP?=
 =?us-ascii?Q?N4v9EknF4LDuqdwfIGfR3T6IWtBqPLMqzwb/BSZOH+fHtpuNl6DQoy9iMiLZ?=
 =?us-ascii?Q?ObMVjwi3n1R6dDmotjjDMc+RVld9WYqZkne1D7ghS1geJIfTw/7PoWA+6BRM?=
 =?us-ascii?Q?TdxBIswSEEbARCQsILlbBJrOXMCfBIyoPB18PjNfXuMQ6/Sxu8E1IjSbaPz5?=
 =?us-ascii?Q?gB/66n5wsXdOw7vJ9YadSD8NCjEooKRVYJX2lidftVT80x0cUXjs2WPrFEdN?=
 =?us-ascii?Q?Uxkyj9U63DCJXipBfLB+F40cMaUGBAQWtD2CQTfdcjBxXebIUoyw8yAhYvmn?=
 =?us-ascii?Q?H5Uo0uRSg0GwolSN1NsY2aQ+xBSntz8cuUUPtQWdj5Y7JtW4TPhiShdzuB+R?=
 =?us-ascii?Q?MveOQcB02O2KA1uwsuFxLqTxrvE2XFyY+HvlgPWihuG21oNQEw0+7Ieq+zPn?=
 =?us-ascii?Q?S+srbGf+5R//Hzoe0dqRCO09lcGesrsBUvQfHHuJrhBiDgvdfdtpkODsZQv6?=
 =?us-ascii?Q?VNiJSSsC9QDHGqJW2bV7SpWAb96PkkcNRDzeERycPIklSn8rrDp1mNh8xOca?=
 =?us-ascii?Q?G3gW7CY38jmM9JldFtxAmfUKdB5NpZiHRsiH93ehvHadyYukUvHJxdlgjuGx?=
 =?us-ascii?Q?0El0N61KHEjiEhI9n9saXRIvpOtJQMly//rABjHflwe2+UWWvjlvsbhfJjuO?=
 =?us-ascii?Q?rJw2M1X0yXTZ+sz8EWPW/Y1RGL+mR25CcJYJ4l74uBnkek+QcD7PrKF0M/sI?=
 =?us-ascii?Q?do1m2sGC5FWmIBm7v5yA5fZZQvzF4M3pFn9Bzlh0p6iBPRA63BJhX1q8/435?=
 =?us-ascii?Q?Ww+HtkJdDQailecRiSfI9Fp217bhvz/4FatRbNOs2g031INyCbuLBfVUE5Xt?=
 =?us-ascii?Q?uBLNAssz/dDYwruSzzOXV/Jds+1vEUsV9Q9IG0PGeXXbKfNwnhztAcbs6MzU?=
 =?us-ascii?Q?q7DDMxT3hvM2br2z+z7sFd45D1hJbssop9XA/eVgq7TAVjX2a7SMylvdwVdU?=
 =?us-ascii?Q?9lpRPUIiQTmNrHEUUqxLC1y5f147tPVCnwN/AzKermOG4i3Y09FS1dKfnj/D?=
 =?us-ascii?Q?zmf0jgGUdKas1QNnr+ZgMvltM2i7KKl+zCc8wC+DT4YKpwxwgZMiKORtIMvv?=
 =?us-ascii?Q?4mZSWSb8I7QQr+oORf6Xnkulx06LQFd9rAHWlRj9XLgS3ten3BMsY/FsX9EM?=
 =?us-ascii?Q?NJHV9J/XWuQc9927GhJL5/n9fRSB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uxQiLXfflt6ylTqLOgw7nXh69l15/eDYfe0BwRpk7yAqxPRk6Q+o+Uy/jthJ?=
 =?us-ascii?Q?Tufvh6GJVTTwwJtgou/2pZNOh/KOSayTJ/1MMuowSlmpTB9iO5h3AW/us8rq?=
 =?us-ascii?Q?xt55QzxQ5PNVbsjwfkKP+G2WvgxdkbUE+vgWZhvsMx9mq4GWx4xJoLCeg/vh?=
 =?us-ascii?Q?HX8wfET2zopg3qToLGWCevFX/EQy5iq4nTnA6AUbk/liHX/bOUtRK6eiITZp?=
 =?us-ascii?Q?39HT729Rauu/xgiZ2NR+tWomkgJyTy4Op5MnrWHHq6e2Ly95ghHktBh+4/Jn?=
 =?us-ascii?Q?MdSa1g2VMktN8XHASrbaRkvkSc19q3DNwcWu6wRgJanfJBb2BPru1Ge4g5BK?=
 =?us-ascii?Q?2XOlYqmSgDBkkfeoUzQuYm9TVsachM4WQjHG5w6rQ1OPGUJE65OnBjyL9rtk?=
 =?us-ascii?Q?JoRcKqJh5+ZqzyNKN0AURXKV+wmkvKMOZHt3Cpn8c6Y4rsl4G02goLS8KHYC?=
 =?us-ascii?Q?Jt9M/1+I8HA5E0pibxgiFbJP73+bRR3BR5YxtF8CLiFmICFDO/cbkuUSKngf?=
 =?us-ascii?Q?Q+NAeQ4zBmZAN9Aqv7xhm0YjphmbpqI1xNuTJFeicG+VQxGIcx9e5tS+VwSO?=
 =?us-ascii?Q?sq87lPLnPmpdEzs9bTQuMR1i2XUBLQBGn9W0+eNDUMwqom1qqmcax/QdQ3bb?=
 =?us-ascii?Q?e9QhcxK+2NO9OmzwnQloqE8KXSj20nqKCI+V5DvT+wdr1wMm0xPLnDUOXEQi?=
 =?us-ascii?Q?LehXKkfrFaoIWAm1j1riUSG1oQ5prL/ks//np/4OZWIgh9XKmrQwOLC6c4Z1?=
 =?us-ascii?Q?IqWvV9hqHOZ0RzSqep9pNgRDsvWY8aCWIWWv8VJxd/FmCNB46xZiqcGIxt4s?=
 =?us-ascii?Q?kgE27DUNT7FGwkqIillvrKu9vcxyIxbnvPWyzss/cBmKFLGPZinCq4QV24Xe?=
 =?us-ascii?Q?XGP9IX+oWs3Szg4DptHM6Jsc59Xep5kj5Tjc6MIjgNPSDb34kcW/MySs/8EM?=
 =?us-ascii?Q?ag0oCdZMCRqmDUAy55+hjtCaoFHrN7NO9dcPEP7LEmL0WaLRp2iyFXpw7eDE?=
 =?us-ascii?Q?eJXU7/hLBrjP31duWHLB6Or5cnXE5bZiLCtg7sjWroh7LnMr7+KXUJUxP7/B?=
 =?us-ascii?Q?EFwFsDCiNIOetJmZrPVVA8Ta2Bjy2aNZ83qJd5RJN1xlOyQi+nIaC8WNr/4U?=
 =?us-ascii?Q?kjGHs33axU1MMbBQOvDc1DpMCl1xqj9TSp6RK9WBSrwrdP+r6FjrERzLp4sS?=
 =?us-ascii?Q?VoNjgK+tmAizAQ/uMHXX7osT9ot6Pl2zVC5y5MEwEvUCdJazwrsOwvbuge5X?=
 =?us-ascii?Q?r9jVnAC9Z+FCbtXbAg4KW2v34RhPHswg4adxgzwpPur9b4hzzDa65b+VdvbF?=
 =?us-ascii?Q?Sdr/VrR3VQpD2rQmsG1idAMts3806MVFuRSDuRozRPci3we2nXM5BGB2eS37?=
 =?us-ascii?Q?EjdMMfbeesWzXouVf+lcmbOKzIyUj6og4prXjpnylG03jprn1shAjNpyiJIZ?=
 =?us-ascii?Q?KKtCvC9OduHU2iJ/AbdrrAsYkKk6oqDvFBTUkMrZXldeyhRyvx1sgJUZ0Fcx?=
 =?us-ascii?Q?cLNCS4wJ3BzWc4YuVglqX4FnyfY89PzQaRrbMCpF9mFxHxNL7wy3MbysjsXr?=
 =?us-ascii?Q?aEjXWCGPyfg4MV/sn/vLNwZyc4HLspS2Cmt7+KmjtFygHR+bb1HjPfB4wIKo?=
 =?us-ascii?Q?P/7y9s1kPsb4NpKQICSx/IE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6833cbfd-2454-4055-a539-08dd46a4ef80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:53:56.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++ldfGXuc0kwvMFHuDPXhoFTMIUqrvTsoP8uMxXvcZUMEyr5A7SiaJimfL0sfWRCiDho9CpT8kGKivU2pT/6fdtZIWknuJkibia65UlTd+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8665
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a4a2d9 cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=jCXEwfVgUjATtFLOCtYA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -J64rWxJL5RlBgk_e_uHBLkZNF4pigZZ
X-Proofpoint-GUID: lrRP64DbEhaZfzXRJ94HuHjn0lTneCaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502060098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 11:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210927

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust target and linker are getting setting from the sdk environment and
so the config file is not needed. The redundant config file geneartion is removed.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=d5f78816d2ad0f3e43ce883eef199d1683cfcbb4

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 4e2e051f1d..dbf997560b 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -64,20 +64,6 @@ do_install () {
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.43.0


