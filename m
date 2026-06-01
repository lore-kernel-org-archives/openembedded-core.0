Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACE5CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 19:59:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8346.1780343979724723604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 12:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JHjnmmok;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Gx58T3929223
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 19:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=3pUSZFgQjtWhdm++GWCaEdOmHJ+YCLZX7JXIprDKbSA=; b=JHjnmmoku2f1
	NgsX8wagsYWdu6Yb6hSswhSDLn5sAbUz13/4wksXHqZWjdEaS2wSXodrBtMFe+vB
	ingybuW4REqug67wGitzXo1LnfyM8FdijI9Z/joclefI4qNZuN5J6mCtfvh6T9FF
	52Z9hDcv5uX+q+S+zURTDbz5/+Kyr3Fk/JY5UQCxbMIUHbGKDtO6DfGSUcv16gKB
	OxbZtACIaP9wS3Vgoueke4SDCLwo7llLU2I9yaQkGpCp1/0HoYWVxv0anrPQu4gf
	N95XdbWt0TJNXShGWeUqM+pFl4fonUVPwgfPBn0J7BdVK3av3GHdtwaB8F90dNk+
	ZK287Z0XQg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn403qtj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrLoOoUXNL1JIc3Pf1FVK7eB6xSCjX+uPG8NK5vF/ERr+UmrkYPBwSTMti4VYk8lO+rLwL/yHOU35jf5hZsAnO63G5aiBu+iqFFFzLqAyYB8kiBwBdwUrI4yqGi/J5iK7QmoimcmOIU/nAhkzAcgWsTelRlmmVtD57aaFN9RJDQzCXQS59TnD4GHlUZH8qO0Vf8M1nQuRBvJpJK21Obcxj7Hvq+A20HUeNjBo5MlQ9Tob4LlzjCmPBpB2ejcMmmqdVFZ1fQGI3u71qSboTQth+NBw8PVJaLEjhYqB1Y8+2J4h7Jbuvzp4qXyuUTPNnvI/nsnzFczUwUKSwNhPtfmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pUSZFgQjtWhdm++GWCaEdOmHJ+YCLZX7JXIprDKbSA=;
 b=iSl+1ZwMkRPzBk8uFTWk2R6LHv7MLLEPf9l/qHzbBP7fuNgO305A8eql0/hoc3IRcmo+XjZrKqMAcq2jHECzJ4DIefpU42lz0cD3k+uAa8ahXN+3Z696kqMG0uDlXmQ41mmsSDFXCqPJgxj0HHsigQ1AjFB604ST5Jel854uvrxZ+HN7z7VBIzYezi6XNsSqBdUD5dQPYxe/NlTf3Qb5QPkiehp9v73WqTwxHgrDttL4VZQwhP1fTNXkDpSIKXU1OUnMUewfTui8I2eonmKZCD5RDKhcGx31pjCHcp94cUeIBOXrUmU/esrZw8BIonGJWlqA6/IR7uxWidb/hBxFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:59:37 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 19:59:36 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6][wrynose] cups: fix CVE-2026-34978
Date: Tue,  2 Jun 2026 01:27:56 +0530
Message-Id: <20260601195801.4008899-2-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
References: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 513572e1-c69f-4882-3702-08dec0184e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	4eOm4FVVTlC6Gmc/UoCDtit+APYSO632SMMazCAQ0e7e0GXlw/AL93ntbICC3IGQR5fVdoNegn6h8nWyl0pmyHVn9metJpKkdMGHQyHNMPH8c5+AQuZ+Fdub5BCJGReQBHL+hGD6kLecHoNYf3d3x2yy+8YyXxESSJeMLLbtJTWCsRiI0bsGHeFkTaiJZJqo9qFG2EAeFzS/TfZJfFsiq6v3xryrCqoHc3D+0VO82raWVdTFUH/Evbx4BCHWp5FZN3OpsrNqEeF8y/PuHnwjKkKkM8DHGxxbq6x12zG+ENMoyWofDGSoWXGNNEY8amvlPxCNQ1XXVZLMOMIqtq4XbaeInkaXzfubYXrFxEJq9jKcmTJ+LL0NLGHFRoDZiJ9WIjW/45SBzkiefzIfswbCBWDQHrCKTKiO8fkzTViyKk1rLRSUSw8+Ms0PNgvrTEArpUSDN+XiG/iLPC8n+DHCLqVbzUkp13vQ5exP7QkBICnG4+1243cbCHp9usoHF10Xoqo0NMBvBJa9WiukVGqoArUDlQ03ONacQSsZOuEJSI9kvLwxKCSzsJV9Zxlq1rF2CWXZdqHQ+k4R3NqHcw/kh/ebSp/fp1KX4iCEEqFu+ICzMtSnRHniM/+1nYwtlzfat1d7jLyvPkgqDclnoDldiellEFCHYFrRwXUSE86GSmkYdo8BO0cIF/hUVTgTv/c9INFeUckQSBXJcQVL2IttMHECr2DaniUbhU9lnv3YMTRRfmdPMPEIltOgbTo6Y8GE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjVDTUVsOEFXc1htSU13Z1hWVldlUnFGLzJWamNyRDZDMkZwK2daK3F5dXNF?=
 =?utf-8?B?dmFlZ0dxUVJENWNBY3gvVXVKRjZPb0Z5L3U0RFBZdVRBb1d2VG9SSmZ4Q2tR?=
 =?utf-8?B?dko2eml3MnIwR1UrdmU1aVpxZkMvd2twRkVKVHpGSlhJa2w5Z3R0U2NaTndv?=
 =?utf-8?B?UlB0Y0hJaEpwZnJSS3l4cmZMQ3pEaWJEUzFwTTRIT2JoRzExTlhYTlViRFFR?=
 =?utf-8?B?M04wS2tHclZkZjQ1Y2V5SFBnR3ExR0V6Q3BWcXNQQ0h3TGNsVnp0VUpKQzQw?=
 =?utf-8?B?LzlycHJsRHVXV0V3SCttNkZreU02NExlVlZUQ0JyVjBvcWM2RGIyZDI1NXho?=
 =?utf-8?B?R0dXeGJscDVVVk9zYWtTeDBNaGtKY3MxZStoWG9yaStxRHZwQnlxT2VaaEZ2?=
 =?utf-8?B?ZEtZRTZSbUdnamJnWGFyRjA4NHR3YTlaOVVHYVRsWFc4b1BFZzdmYytqL2Fx?=
 =?utf-8?B?c3RrWG9vVzcyZ2RDQTFJQzlJOXgySEtzcU16RXVhczc5d205ZFlnVEs4WjFv?=
 =?utf-8?B?Tjl3a1V3M2VUemhOK1IrQStRWjI3NjRXeW16SFdoMm9kTGFjOTY3RHg2Ry9X?=
 =?utf-8?B?ZlZEWXlyZk90UWsvZHpOZGFlbFplWGxSTHFYWHNSdGNnSUhhbWFGRUNCcm96?=
 =?utf-8?B?WmlERU9PekgwdVNGeElOZGVpYjVCZ3hpbU5rSXp3WTR2ek11V1NNdVdIT3k4?=
 =?utf-8?B?UnpmY0hPRmw4TG1rd1h2TWl3ZzNJdUtTeURIbVFFZHEwZzVsVGh6VEtwMXhh?=
 =?utf-8?B?WFJYWTdFd3AxcEFxZlJGVm9YRWl3SERYOFVpMzRLWHQraUFWMHBpZG51YXZO?=
 =?utf-8?B?eGFEMnFNZ3pYSjFzOS9sdHN6UnFzd2pjb1U4L3kycG5DUzJ0ZTB5b1lyUXhl?=
 =?utf-8?B?NVdSNjRmejB3ZzRySDBERFNuN0JrMVZCNGMzaVdkNFk3eUlVUGRDbXBWbWc0?=
 =?utf-8?B?VXVoVFNBdlRIaVBwZDF3SWp4SUM1amNGOHZSRDNZN3pVNWpYZXpvdmZYRGtL?=
 =?utf-8?B?ZGtTaHAzdC9PMUV0Njh2NmRQZitrSTBjbXdiY2xkM1JUeDZNWjBlWXg4bjVQ?=
 =?utf-8?B?OXMrZGRESWxPaDk2TTRNSDM5ZVgra2trSW1oR3VidjEyZjMxUTR0TGhUNldz?=
 =?utf-8?B?UEordllaRGFmK20vUlZna3VFbU01N2thQlZmSVBIcFdNYUZMVGFGMWc3YkFu?=
 =?utf-8?B?czYzVmJBRHNxN3hCMXJIYTgvU2JURkJ2VGczdEMrSy9JVjg4YVNhREJrUDlE?=
 =?utf-8?B?YUxLY2ZSVVpEODZRVTV5RlBiSjV1dEs2K3lWbFFybisyRXhoeFRpWm5CQkQ1?=
 =?utf-8?B?MG5mWTJDdUpkUlRTNFhPUkZDVGVOd3k1djF1UzE2MkR3YUR4Q3FXNG1HOEc0?=
 =?utf-8?B?YlRySUdqUnFtMmtacmdEL09VMWFYb0xMZ29NUjBPc1diSlJRbkR2Q3N4YXg2?=
 =?utf-8?B?ZmNSYXZCSXJHa2ZMSVpkQWVSMVRMUDd2azRQSndvNWEyYkl2SmpwQ3VFdXho?=
 =?utf-8?B?VGtWVEZ4SUhiaWpvNlBCYysvWmJMR0dNT2liSHduaVdUMzh6QUpFNVFBUW9h?=
 =?utf-8?B?SjNYUG9HVEZWSDA0N3BibVJmanpZbGYzYVh5ZXlHR1pXb2x4YUZaWjFocHl6?=
 =?utf-8?B?K0VqbStNRm9RN0FUeTFiaGlnQ2lwb1NEdnpOZjhBZGJzckg0aHRicG5GZ3RL?=
 =?utf-8?B?TGViOWthQnVXQzBmQUdubmYzVVkyWGFGWmdzd2lWWEVjUUJoNUQ0Tzh2eE9V?=
 =?utf-8?B?RStleTV4VEV1M2RzaktlS1hlTlJXb0NxZVVJVk1EeUpKQVM2RG00WkJrbmY1?=
 =?utf-8?B?aklIakpyeUxza3FYdmh0TGFPeDhpRENwR1gxLy8wSURrU3diTzQvRFJCbE1G?=
 =?utf-8?B?elF5MTlvUS82aWVhcTV4eUFTZ3ExQXUyY2x5YzZOKzl4NjhMKzdZUCtPczJR?=
 =?utf-8?B?bCtQRWFMb2FEYnVRRHZGQ3M2cFM0S0FON0E3L1hDanFDcmNDQTBtVmRqdDNL?=
 =?utf-8?B?TDRRSkJDVlV5Y2gvdU04dDIzZlpFckZxaG1WVHo0cWtDNHYyb2M1TERUcjNo?=
 =?utf-8?B?SE5DbGEvMDFNWWl6RWticDdSTmxRRmwvUUM3TmRQSFJjNUsxcHQ1RnZyalJB?=
 =?utf-8?B?YUhtNFBsQjRQa212NDExTFZaZGg0SWJqMEQ2bFErS1N2cFloUnB4cEcyV0ZI?=
 =?utf-8?B?ZXhaWHRwK093N0Q2ZlpteDhKRkRWUjJQUUFjMG1zT1RQR3BiZ08rMExCQ2Zv?=
 =?utf-8?B?K1kxbnVUNWdIOVMxeDJRVEdjWi9RTldGa3ZpUXlRanErSW1pdW4rS25nVDRn?=
 =?utf-8?B?ekFHUnRHTzdtQ3R3KzVpVXVnOElRbnRwMVhDanZrdktGclVaaHFXQ2gwVm9M?=
 =?utf-8?Q?opWV2+BGf4pNxer88MzPwJWPPcgwP9XSojKGT?=
X-Exchange-RoutingPolicyChecked: 
	JP9/diFXQg4Yqt0iYi0ZGPNUmvTVayC60O5yEdlcDmALQtw8oy9Y7vASknc3lrsppionwOIuepUqmVO/tiZkTIb2zxQ0YywlaUB++yfmE17GQHzVijKDQt73fhF2FvWO91NdPFpmxyV1fmVtF8s4YZg+HTZw3PfNQSHh3iHKi/H6L2p1IU7tVtjkXmcx4798z9gGDpwz8EXpR8jqXk9IlebZyhIUVtQ7qTxpNuSjAL1j0FJmC5pBRSOSfUv1rOveLzjoVDrkduO9tg99MfDxtrMR7g8yAr/9BI2U10bAG6ICIZh0DPH2ISiGP0w/dY/1arym6spndQMqv6l4nYE7FQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513572e1-c69f-4882-3702-08dec0184e6a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:36.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbC0Kab6QifbEaHaAU6Vm36spD9klse2aGM0qfAcl3xmbL2khvCt5Y5FCapCUXuM1RtBpYN1FcbFfg3W67OKf7SjJ1JUhoFWKGh35Vw8nj3HuFheeCQlbT+1NmexDxck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
X-Proofpoint-ORIG-GUID: 2AjaTOWAM54qAhL_nOUL0kiwmbtRnHu3
X-Proofpoint-GUID: 2AjaTOWAM54qAhL_nOUL0kiwmbtRnHu3
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1de4aa cx=c_pps
 a=kRgXGWC4h8N5Zk8PQP6WEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PYnjg3YJAAAA:8 a=F_ubicZDAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=aTVoPYTGAAAA:8 a=6YbOQfm3m-G4HXovdcgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NCBTYWx0ZWRfX2fyfLVcgCgTW
 EHX6MtJpguwGDS9KDiHntrPUz7G0yNH9laDKerPbbhoUIurDvS/6xUit3OrHNtbCsdJQd6CR522
 pnDo7YR2LiUw8FJopego0ap7Gpf/LhOEqZ3ZnQ00aOpcZPjZ+TD9hnQGRUCIyoY0Ei5RNwMHzXD
 MdapuaO2JWuoSClwM5p1qY0jsQNfHjW93N0+69VlYL02qbG6XH/24lvBmFvHtcl0d+MucJfVcCa
 LzGBth6RY7RPyjRLbE60q24JcWvguimKvNdHZZVVIp6S0HN2jo1gJEd9T6mmkPexY1JR5/x2sVn
 d0UL37QKI79uDGsgNWQEfH4v/30KW3LORbDMZPaDH7CrhtoSftrvFgntt7RQH399JX43tPlHdzr
 eQs1MFDa+b0C18Qh/QCUabFRdhVJctf4Fdifr0dCSvPqTCO0sXwyss49AqWSEW6Aw5IPJ8admJg
 6Wjb2+kZpdh/xZ+iMDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010194
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 651Gx58T3929223
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 19:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237989

In CUPS versions 2.4.16 and prior, the RSS notifier allows
path traversal in notify-recipient-uri (e.g., rss:///../job.cache),
letting a remote IPP client write RSS XML bytes outside
CacheDir/rss. Because CacheDir is group-writable by default,
the notifier (running as lp) can overwrite root-managed state
files via temp-file + rename(), leading to job cache corruption
and loss of queued jobs after restart.

Apply upstream fix to prevent path traversal in RSS notifier.

Reference:
[ https://nvd.nist.gov/vuln/detail/CVE-2026-34978 ]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2026-34978.patch            | 120 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index 2724ce72fb..e739cfa579 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
+           file://CVE-2026-34978.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-34978.patch b/meta/=
recipes-extended/cups/cups/CVE-2026-34978.patch
new file mode 100644
index 0000000000..043cab86ea
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-34978.patch
@@ -0,0 +1,120 @@
+From 730347c5bbd5e1271149c6739aa858c0c83a7568 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Tue, 31 Mar 2026 14:18:26 -0400
+Subject: [PATCH] Fix RSS notifier.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, the RSS
+notifier allows .. path traversal in notify-recipient-uri (e.g.,
+rss:///../job.cache), letting a remote IPP client write RSS XML bytes
+outside CacheDir/rss (anywhere that is lp-writable). In particular,
+because CacheDir is group-writable by default (typically root:lp and
+mode 0770), the notifier (running as lp) can replace root-managed state
+files via temp-file + rename(). This PoC clobbers CacheDir/job.cache
+with RSS XML, and after restarting cupsd the scheduler fails to parse
+the job cache and previously queued jobs disappear.
+
+CVE: CVE-2026-34978
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/=
730347c5bbd5e1271149c6739aa858c0c83a7568 ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ notifier/rss.c  | 20 ++++++++++++++------
+ scheduler/ipp.c | 14 +++++++++++++-
+ 3 files changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/notifier/rss.c b/notifier/rss.c
+index f17e1494c6..250ad877e7 100644
+--- a/notifier/rss.c
++++ b/notifier/rss.c
+@@ -1,11 +1,12 @@
+ /*
+  * RSS notifier for CUPS.
+  *
+- * Copyright =C2=A9=C2=A02020-2024 by OpenPrinting.
+- * Copyright 2007-2015 by Apple Inc.
+- * Copyright 2007 by Easy Software Products.
++ * Copyright =C2=A9=C2=A02020-2026 by OpenPrinting.
++ * Copyright =C2=A9=C2=A02007-2015 by Apple Inc.
++ * Copyright =C2=A9=C2=A02007 by Easy Software Products.
+  *
+- * Licensed under Apache License v2.0.  See the file "LICENSE" for more=
 information.
++ * Licensed under Apache License v2.0.  See the file "LICENSE" for more
++ * information.
+  */
+=20
+ /*
+@@ -80,6 +81,7 @@ main(int  argc,				/* I - Number of command-line argum=
ents */
+   http_status_t	status;			/* HTTP GET/PUT status code */
+   char		filename[1024],		/* Local filename */
+ 		newname[1024];		/* filename.N */
++  struct stat	fileinfo;		/* Local file information */
+   cups_lang_t	*language;		/* Language information */
+   ipp_attribute_t *printer_up_time,	/* Timestamp on event */
+ 		*notify_sequence_number,/* Sequence number */
+@@ -111,9 +113,9 @@ main(int  argc,				/* I - Number of command-line arg=
uments */
+=20
+   if (httpSeparateURI(HTTP_URI_CODING_ALL, argv[1], scheme, sizeof(sche=
me),
+                       username, sizeof(username), host, sizeof(host), &=
port,
+-		      resource, sizeof(resource)) < HTTP_URI_OK)
++		      resource, sizeof(resource)) < HTTP_URI_OK || strstr(resource, "=
../") !=3D NULL)
+   {
+-    fprintf(stderr, "ERROR: Bad RSS URI \"%s\"!\n", argv[1]);
++    fprintf(stderr, "ERROR: Bad RSS URI \"%s\".\n", argv[1]);
+     return (1);
+   }
+=20
+@@ -209,6 +211,12 @@ main(int  argc,				/* I - Number of command-line ar=
guments */
+     snprintf(filename, sizeof(filename), "%s/rss%s", cachedir, resource=
);
+     snprintf(newname, sizeof(newname), "%s.N", filename);
+=20
++    if (!lstat(filename, &fileinfo) && !S_ISREG(fileinfo.st_mode))
++    {
++      fprintf(stderr, "ERROR: Local RSS path \"%s\" is not a file.\n", =
filename);
++      return (1);
++    }
++
+     httpAssembleURIf(HTTP_URI_CODING_ALL, baseurl, sizeof(baseurl), "ht=
tp",
+                      NULL, server_name, atoi(server_port), "/rss%s", re=
source);
+   }
+diff --git a/scheduler/ipp.c b/scheduler/ipp.c
+index 174871741b..cb228b87c8 100644
+--- a/scheduler/ipp.c
++++ b/scheduler/ipp.c
+@@ -1,7 +1,7 @@
+ /*
+  * IPP routines for the CUPS scheduler.
+  *
+- * Copyright =C2=A9 2020-2025 by OpenPrinting
++ * Copyright =C2=A9 2020-2026 by OpenPrinting
+  * Copyright =C2=A9=C2=A02007-2021 by Apple Inc.
+  * Copyright =C2=A9=C2=A01997-2007 by Easy Software Products, all right=
s reserved.
+  *
+@@ -1997,6 +1997,12 @@ add_job_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NULL)
++	{
++          send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad no=
tify-recipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "no=
tify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
+@@ -6067,6 +6073,12 @@ create_subscriptions(
+ 	                "notify-status-code", IPP_ATTRIBUTES);
+ 	  return;
+ 	}
++	else if (!strcmp(scheme, "rss") && strstr(resource, "../") !=3D NULL)
++	{
++	  send_ipp_status(con, IPP_STATUS_ERROR_NOT_POSSIBLE, _("Bad notify-re=
cipient-uri URI \"%s\"."), recipient);
++	  ippAddInteger(con->response, IPP_TAG_SUBSCRIPTION, IPP_TAG_ENUM, "no=
tify-status-code", IPP_STATUS_ERROR_ATTRIBUTES_OR_VALUES);
++	  return;
++	}
+       }
+       else if (!strcmp(attr->name, "notify-pull-method") &&
+                attr->value_tag =3D=3D IPP_TAG_KEYWORD)
--=20
2.40.0


