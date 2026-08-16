Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75F5C5DF70
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:11:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19456.1786921892909135763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cy0Pfe/A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GMikgT722970
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WHsFlDnBtena1qCHH8eCi4Tx1XKYcbsYr7x+WiBIImw=; b=
	cy0Pfe/AhcbiYS4hWtKrXUHgUGOy9jytkMdKxVXbLAcfOelCrc1K3Fyj2lilhdlC
	JynyEoLtw6mopEDOAD0FwhkkhEHQcdVrqo7HdHy3h6RjuLD1XX1zDfAzq5ZMaUpR
	LhMVemVEclXEfTUMi56E3UPFWp+rb+WUbdsjaU3Ds7gM8aC/QiNPWGVEScX7WZ1V
	wSQ+Cq0SJ07I/8j+BMlNPMoJEBXWw27kixpA9P0RlarEGmIiZFo6ybd/VP6+cPIP
	En9+GEUHu2By+9ZYmVfTqXyvyF1qi2PLrFN6+bbkO24Ri2EtDmeSuQaM310r7nkm
	uM7VE+3x3HlkpjRCQbmw4w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023124.outbound.protection.outlook.com [40.107.201.124])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ss4x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 23:11:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzKEKqRVZCbEF1rTxcpmsyigjGNM0wz1pefKVVDn0I9d8wf4T7E8QH4FfnXgki0AVKczHJQSzH/dRSTLOz1CR0exTQ6c6DPlS2EIawMP5KA3EjHZ/8zlfnr6Hc+pie8qpF+mWZIY5gVltwjy24wDgZZJsdPrqhfHsGBrqZhua01OBT2xbcGzx5IJ79UmjSjnCVr2/ZaHGTNxfkKKHfT+2UyYk+pBDEyElWG9kZCzd/dDwUDDEyEsKns43w0Jp2hNCmPM4ZH59ChRWANgsI8N/PuzUDoDZ85ZGd3QeZv1G6iKD8rRP7BrLD/wKLGhyhnh6/v9kzp0N19uqAGayU2aqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHsFlDnBtena1qCHH8eCi4Tx1XKYcbsYr7x+WiBIImw=;
 b=y4FrmBJtIY20ps3ihPCFYiYkFGBdaSTmDkuue8JVL7mm+KxLd5dNfRFFhZdm+EQ3B0FRFAqqU20uyySgqOTvaug7E8SIQ0sf2z3VNEq4GtebsSkX9ENijt4C495lfBWVCL/0sb8zOU39h/QnzaO/98A+hgBGsdbI95zKA9aWTcyW9PGlqRm+n3ymi8U9YfBDdOGjjbGvOuBAPdjAtbAm8nIUlLfpv1Q+Mp8GmE5sHj+eONDVmy3+AclGF7F3aUxMZgrUT4aMfNEAeB2ynQCcRY6YPyZBQMPdcAfoDljHqWA7KyoFAv8PcTM4EP89CQ5aXZxThKZpn9canpW+eyntBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:11:29 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:11:29 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v15 10/12] libarchive: Disable RPM filter auto-bidding and update huge_rpm test
Date: Sun, 16 Aug 2026 16:11:02 -0700
Message-ID: <20260816231104.3871015-11-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e20ccd-b2bf-4654-4d37-08defbebb40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|11063799006|56012099006|22082099003|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	AXx41EBaBi7moVWD++J64yXTfYjPS+jfpBcUAm1ZFBHQKqkS4A9gKJf4DGDnSKBomRESDhYRqKc8QmOBClF5MGOjDdd5ualIX1tpuekTmZfP256oYfUz9ycXK6uwb5g2aGEs3hu8oU15nrbJSR/7l9tKNLk9amklLuR6T2o4WEIb2stlOdcd3iirt061ci5hu9RmYPYq4f7s24b5NwnV/xfISiNliUPLbBNE2z+Ky1B7ufn0r1iej19TkbPnrKcjr4GPLJAC6d4vtztyxibAQNAcxXP06t4l6L/ffKhuUO3g8l+3Sj8E0fw3PsO/vDO1nIyeJxGC9hihbeW69X6JZWtp4eNOH0NPTmAsT/soLX5ZXHasVKuJIwhgCGv5E0qFpLltb0XozdNprXp6BOlvycYEMlw3NXR5I9TTkFzaRqrGxHprAc6AeurHF/s9/mv++M+6bC2Sz4s6uHjXAG21hL9A34DHXGjp6lf2b42g0XyZ8pyAFncKi5vQsEBHKH7jCzkantyqOlrSLiHyl6PIBUxtdrC0AFvRnnKzYOT/wI5LU0C7Ts5T2Sw4rvF9KYPThhWt67nhD3zfaJsOBStMP/nSVHTUiePpIRXFIhkPzgbTFTjv2oSJQ9AvVQke+xLGeEH3kQ1OPU2p+ATwrltuFkUVX+04Vi5QVU6yB4KUQIU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(12006099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6idd9OXFhupS6rpX7LGH7LTu7svXBxOu7wsCsIwVwoCMU9OqoPmu2ET8mJpz?=
 =?us-ascii?Q?S/AAdDOXSgKjuNsQ8qKlGjF/ct4qQ2r8vuJLd1Q4dFGnmk9p0Md/8MLJHsdK?=
 =?us-ascii?Q?wJ/bRgpbdLjeucE+0VmENbF46te1PmduCGRak2iaz1YIwAw+9gEpIAr8YiJD?=
 =?us-ascii?Q?6p6nRoJP5N7WjxSegq+PSO9IpH48HuSmB5meEae9BwsuTK93MD07WsqwhGAE?=
 =?us-ascii?Q?M91130NoAe70OQXwm/mO/Lp51oRuYNWFhx7urg+Cv3y44QsQopvNWnWoergz?=
 =?us-ascii?Q?3I6U0jkpqYDLPTzMG0qWgq2rbnQgw3gfKBwCK7Tlq3VqgdgTxpdwaGiPDA2B?=
 =?us-ascii?Q?jUUWWSu94rjdNk0SY1Z9375zYpaGsyJTAx6foctU3CJY3YWO4bL8PNp4IAYI?=
 =?us-ascii?Q?nFCChG6/AJQyi7pkLZcErrQdzmyh/JzBDS0PSp5YxAhucscNCl2yd5f12OHR?=
 =?us-ascii?Q?ONqJvEBpq3hk/8dmiFFJcDTh2sMyGjaOEKePRcezeDUDnZTN57LWjsNQC2sf?=
 =?us-ascii?Q?d0Bo9ZpZUcGFX5QUHRkb9pZ6pDEmM+8TGwRdgQ64IDKRXN8qKhyPMWlFf7A0?=
 =?us-ascii?Q?wHW9VE+epG0X2KclvFO6APKsOKZWB9Du+RJFNCYHxzkX621aoX7M8fv48w2u?=
 =?us-ascii?Q?ZYCFzfyJPKqPorBtZlVdvTdHyHuMoC/YcjhdQ9lCfb+skXzXLRnrD0DLPEAI?=
 =?us-ascii?Q?Zu0y2EnLhxyP/91o6vcy/EPm/TSAEkZ+92275EYxnRlmF+iu+Dfl8y9LFB16?=
 =?us-ascii?Q?BiPeLQs0lHFQR8/jepyPrDtwBow4mgY4HhgyG9Q+eAVUMGdhuwIwEw90N1jq?=
 =?us-ascii?Q?plriuuV8tD3MMs1qDNPHH0QlVsMBs+X3WM7TQyLYyl/usWY1bnXyz4uyZm+z?=
 =?us-ascii?Q?DOmEX2TpYxw181/ssPMgwSeCdKneNI9JuoK1q2/m6qlSzYshrls0rYZmnttZ?=
 =?us-ascii?Q?OBs3qvDiAIgpyyGJd36RVGVOrpkkecxkX7t5FptIkrlfKMymAP7Ry+M12jHQ?=
 =?us-ascii?Q?hTUUq+YiiTojnNRyO61teZAavfW9aWgkDJgVhiUgrAC0Pmnn92caJVUmBzZk?=
 =?us-ascii?Q?polTI4o0inMwO2jPD5UQvUDEJGuEz9higxbevEhCRuwYUXAsESQ7P6s8fKm0?=
 =?us-ascii?Q?W7Tk3rHsDB7isXaDPM25LXod/YiC+eg+Mbr5+OUG1Yjys6n5/p7OHvhGmtDb?=
 =?us-ascii?Q?C2P6hO4n3OOXljCYfhhVMkbAb7a4vaxzPiEzKAXBdNtp3Bvk/i54MGCIzRyg?=
 =?us-ascii?Q?znK+rrqLKzHAQvhwGYnlbPSv0mHr+I5roujYCg9vRN4Sq/J6W6tg4A+yfx7C?=
 =?us-ascii?Q?XOR9tVW1QJ3AA1YsDY9dtJ213WuYYuXNjmL+R9FA8DeqwrWwR2sw70JySD0S?=
 =?us-ascii?Q?GnPYGEWbJ5xGIMn6eWKwlI4jhMzZJtMsKnrCtY7zsjcgNNMRnjvbQVaHIzAE?=
 =?us-ascii?Q?492pIOH2Q8hpBNJ6BqIu0gMkrVJyl25V54L+udagg7Ltdfe+aEFC/j9qOzH/?=
 =?us-ascii?Q?WsoVDrGrQB0re+YI9tAgVCCXpsxIHzEiR+ZG5YcKMv/wWi7SN6BjjQ4e6ceK?=
 =?us-ascii?Q?aSfD+ATRMKBwKhmRmOBWN3ge7oo0kDw7s003LYQJddn1r7yewUK3zZNJ4glY?=
 =?us-ascii?Q?KHEMVchdpOPdt7MjLIYZexD8bf3XKu8o1NX3EzXEKxPVvj4GbiLc1x5WPHjX?=
 =?us-ascii?Q?MvUEjNi6D2jt5cpmNiDKtaRoQKi5Oec8qV7/Gmc0ynXSWRYY5lr0lp5OlI1Y?=
 =?us-ascii?Q?VbBkXSMAEIApCbthvhj/aH0+4aCe3Dk=3D?=
X-Exchange-RoutingPolicyChecked: 
	QzzJNSZRzA9bz8mV38SzjCVxLy188IUDxbj7O6Kg/Bvz+EoHmYlutdX4T8SJHoppi2kTieBeEbHyRJLECQdwyecEhIuHxASd1YqMSD7V/DNawaaF6ouLC27QwY9ilvcmkJWq248jnzeEbxCx/tsRkWQtyXnU85JOF2F54sfibdXd4XFUzP4jsAUNV8tMZSxAXl3OCm5ONUPE77ZfbH/XiX/ucubu4B59W/KE/lIWix13Dptbw2MX8kZvXzii0wA6ewyXAbBVJ4fJqy+3DC1moSWXsW0Awon0VIE6ZrFhtqpNLAzjzmKDLDOF33z+aZl6Ms668IEgOuDF2vH9ne7AKA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e20ccd-b2bf-4654-4d37-08defbebb40b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 23:11:29.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zrJNvxPibgt+wOOFvDtOEd1m9ovZYKksEAPlQ4JrK3ntj0haCMLEaerb03l4/Xz/zrJkhGL8442zNvB82FZvJGbW8LU7eHdS98hws8AzxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfXxq8F9U+tYQc4
 4txfAvk6+o67CNCH5wGkaN4Qij4wusMc0kMBOGCuX+dLKbqZpYrYy6DKvt7y1kt0Tzb71vVspei
 3+UwUlcHL2VQRDTh/jLrtvf6F/g/3GXLnU6l3jytR14X9PC7yZuXN5XBRudmBVQN27hjG15gjiM
 qmrT/c8BmHB9UtKVmcNdEUb0Q64C7V50F5if4MOlxLY/CMpG3PHja050krU2lm834rCdyPL6NZh
 qXlc/15HwNacPHIBMvC77YtAj32xBras9Vs0xGzfbJYHMdWwbBtg8XO4vXOMVOHBJMyB5yS70s+
 I6Ug9F+71jAO3l6QYhMEm+NLTRYm2IhpYLSkwZXxK0vfoKv1PXu4jjLR0w6tz42hnyAo7sX9Qbp
 2UHPmzkCGnYu02gQeTY+BfW+yfQuYq4E9/zJXWe3qAtG4WhCuK18v8wGFE2KiIQTaKVP++WbQKy
 JdOmI01mZrHdjchm0Hg==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a8243a3 cx=c_pps
 a=6mrLUOsRrbGUgCFc9Veheg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NzkYBEk6AAAA:8
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=9_fcTNOi7W61J8-o3-UA:9
 a=DC3Xf0KLC0SIM7_k:21 a=zqED95DPWUTvcrp2mxve:22 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NWxEoNwbi_qcFnO0mSNQgah0wH4-dZLe
X-Proofpoint-GUID: Gu5m-GZoI6jWZlBk1r5gTEUfxfxQfDyn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE4OCBTYWx0ZWRfX4LttNlzCAK01
 rLMLMSEVRfYOMC0EWvvA2ePqfoNhyuALFUGHWn5foyArji4nfoq/gRThXO9pke8MWd+q10ZjcDh
 OoMhDp8WhgfHp31YlLaAMJ13kz5AsuPH8zGUUXP7p4YFmhQ2x8WI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243576

 * Add 0005-Disable-RPM-filter-auto-bidding.patch:
   - RPM is now handled by the format reader. Disable the filter's automatic
     bidding (return 0) so it never intercepts RPM files during normal
     archive opening. The filter remains functional when explicitly requested
     via archive_read_append_filter(ARCHIVE_FILTER_RPM).

     This ensures debuginfod and other tools that use
     archive_read_support_format_all() will use the new RPM format reader
     for RPM 6 packages, while maintaining API compatibility.

 * Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
   - Include the test_read_format_huge_rpm.c changes from upstream PR #2846.
     With the filter no longer auto-bidding, the format reader handles the
     truncated test RPM: opens successfully (ARCHIVE_OK), returns ARCHIVE_EOF
     on next_header, and identifies the format as ARCHIVE_FORMAT_RPM.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 -
 .../recipes-devtools/pkgconf/pkgconf_3.0.5.bb |  2 +-
 ...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
 ...0005-Disable-RPM-filter-auto-bidding.patch | 73 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 5 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 6075770bf0..37dad54409 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,7 +11,6 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
index 79ac3208d3..3343857867 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
-RPROVIDES:${PN} += "pkgconfig"
+RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 29d12bb539..03a207f33f 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -11,6 +11,14 @@ Without this patch, debuginfod cannot scan RPM 6 packages:
   libarchive error: cannot open archive from pipe: Unrecognized
   archive format
 
+The test_read_format_huge_rpm test is updated from upstream PR #2846
+to match the format reader behavior: the format reader opens the
+truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
+next_header (no valid entries in the crafted file), and correctly
+identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
+companion 0005 patch (which disables the filter's auto-bidding) so
+that the format reader handles the file instead of the filter.
+
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
 
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
@@ -29,7 +37,8 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
- 14 files changed, 1162 insertions(+), 15 deletions(-)
+ libarchive/test/test_read_format_huge_rpm.c   |   13 +-
+ 15 files changed, 1169 insertions(+), 20 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
@@ -1398,3 +1407,34 @@ index 6062c48..11dbbb4 100644
   
  	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
  	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 51208c7..10c7fb7 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -26,6 +26,7 @@
+ 
+ DEFINE_TEST(test_read_format_huge_rpm)
+ {
++	struct archive_entry *ae;
+ 	struct archive *a;
+ 	const char *name = "test_read_format_huge_rpm.rpm";
+ 
+@@ -33,11 +34,13 @@ DEFINE_TEST(test_read_format_huge_rpm)
+         assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+-	/* This archive is truncated -- if it has data, the bid has screwed up */
+-	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_open_filename(a, name, 2));
+-	assertEqualStringA(a, "Truncated input file "
+-	    "(needed 34359738384 bytes, only 10256 available)",
+-	    archive_error_string(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
++
++	/* This archive should have no entries -- if it has entries, the bid has screwed up */
++	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++	/* Verify that the format detection worked. */
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
new file mode 100644
index 0000000000..26a0159908
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -0,0 +1,73 @@
+From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 11 Aug 2026 12:02:31 -0700
+Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
+
+RPM is now handled by the format reader (archive_read_support_format_rpm).
+Disable the filter's automatic bidding so it never intercepts RPM files
+during normal archive opening. The filter remains functional when
+explicitly requested via archive_read_append_filter(ARCHIVE_FILTER_RPM).
+
+This ensures debuginfod and other tools that use archive_read_support_format_all()
+will use the new RPM format reader for RPM 6 packages, while maintaining
+API compatibility for code that explicitly appends the RPM filter.
+
+Upstream-Status: Inappropriate [OE specific - keep filter for API compat while format reader handles RPM 6]
+
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_support_filter_rpm.c | 37 ++++----------------
+ 1 file changed, 6 insertions(+), 31 deletions(-)
+
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf..8e90da3 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -79,39 +79,14 @@ static int
+ rpm_bidder_bid(struct archive_read_filter_bidder *b,
+     struct archive_read_filter *f)
+ {
+-	const unsigned char *p;
+-	int bits_checked;
+-
+ 	(void)b; /* UNUSED */
++	(void)f; /* UNUSED */
+ 
+-	p = __archive_read_filter_ahead(f, 8, NULL);
+-	if (p == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(p, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (p[4] != 3 && p[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (p[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (p[7] != 0 && p[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
++	/* RPM is now handled by the format reader
++	 * (archive_read_support_format_rpm). Return 0 so the filter never
++	 * wins automatic bidding. The filter still works when explicitly
++	 * appended via archive_read_append_filter(ARCHIVE_FILTER_RPM). */
++	return (0);
+ }
+ 
+ static const struct archive_read_filter_vtable
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 3b3824e778..2eefa28532 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
            file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
+           file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

