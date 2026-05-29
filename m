Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B09CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 13:07:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9809.1780060058271568709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 06:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pYAlk/jh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0609e296f0=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TA0c6Q4120113
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 06:07:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aqCY+IGzap6TM0HKSTZYbAtObmQayE5u0hEmrwkAQp4=; b=
	pYAlk/jh0D3c5I/BIa1rYEO+vgZJjYx/3jtDRTWvnkCJBM0LWHhRgJi5VpC0VOsp
	8sQFoViaZ4krKeClEYoV4iMd4tJyot/lY0wgMVt5qMa1fSvU7CHW6uSbjttPyH9E
	x35LCfiI/fBTkVpmPGzkkujSwxlI76ag9cW1LjuKo2k5n5OOxXf/FjOoCFhbOFGq
	1Xx3TSTVKShqW35xIhHiw1kJWaHWKmVz01CyoMNy3uuiVvvxlz0TZ8E+aXQlFfWZ
	GI+cFHdkVJBUTFvsDrBthc7imeaCnBTx/Z4mPOMuyi7oUZxW+TVP4YeqWFh3Dq8Z
	1wO/ElwDP6zU02MymGcTsw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6tfwx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 06:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nl4CT/uQ9wJkNMnz1fvJt1IsnpPQO8IGgj/o4l97HdL/5OWnEmZI5k/88hjTU0WxvLXUwP9RpVvcJd1uVrzVY1d2Zn3Y/bdkEBhQ+qZ9QP7FluAimj72yga2rg5a7y35EXJd2CagkbsQh0OG1zsfaUT7/9+Oo3aMsStOH5LIZyfyXqSguX5YWxG2HWYxjwVJmXITROOoXpv/OSH+UVe+PQzwph9hR+nGcRR7pvFhuWwp/D9TP+bhl8Bjo+O1EbcMcY3tU8kGFKCvhQT9nAwFpfGhsYBzvzRvHCb3Hy63x2ozMhauxJ4wutZmckzWo5AZZwdDJUff53JddgPhJFtd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqCY+IGzap6TM0HKSTZYbAtObmQayE5u0hEmrwkAQp4=;
 b=uDtWCZWKr2x4b2H2CBNVtXW1K+CfujFZxZ0TGzmID+JJ/TStftUAHlP99XAyIikgeSxyEoJyBDgdLFaAajGkWI4CWEm0v5JBssypkW0hDI0IF/17zPkne+lQnhHcQY7XWCrNHRrtZT/vc/dNNvguBeacKJvAZ9h4KrAPlCUvVqNdPyfePbo5zXwdQiRBlcR+ev+d/DhD16nQDe6g8jyR3RsO5SmDczBkEH4nuzi3qC1Y5ig2xfxqfZk+An9B3kPSY6uCMP+qxiqVUWHjpiz0LSPjovu4g1ewmpvSofE3c1zrrKKAiY1wFa2B4gZjKfrQdoR9wX9Vim3kh3HGhUYS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB9745.namprd11.prod.outlook.com (2603:10b6:510:3a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 13:07:35 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:07:35 +0000
Message-ID: <7bd72949-ee2c-4b68-a12f-7616ad6438d8@windriver.com>
Date: Fri, 29 May 2026 18:37:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] packagegroup-core-buildessential: Add
 Rust-in-kernel dependency packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260528172211.2652140-1-Harish.Sadineni@windriver.com>
 <b4918234123fc36e2c7947d58a29791268d8ac76.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <b4918234123fc36e2c7947d58a29791268d8ac76.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB9745:EE_
X-MS-Office365-Filtering-Correlation-Id: f19b0627-2302-4d9a-964d-08debd834044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|52116014|376014|22082099003|6133799003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	ikWrLcJqn356toiUdGulUEx0zJU5J+5eGHd4A3EUKqr8dBzZokexwroP+etMKo7ewOjdBS/yFdeWwlCRusvbBUQ9lhg9R+3s0E+D1VACcSBSe0mmEvHOwtUqi35OQF7LaLpLNmKtQB5iDRDMAQR2lWNadpqiqaXCbC8EatkSiX5Mh7N7JhVjjyO+NwcK3goBGgQSjKZWP1fieVRq2zBY1iw+ZPzsB9G4+gFgqUQHpnhx6Iu8hqz3VqN10rAweIgerOxk9NS4QOtxpDv6ajby/rJZIAlBCyu58GGU1Jt1/x8fl9BEYmD5If7iMAtyhidJmPc4Ho0DJGXhBQqxr+Ya2bqEmNp2vs+5e8NZjt31+BA0+y+Zg5FGJWZ0OsDHN8AS9zPcYwgPAiAyf3DEILfPV/Ch4hKITun89ZiwryBYqugZWC8IjxPkfU1Xb6BA1tJ8OePYziAlqDFnS3Hb+m27Qshk7n8i+o7sYXzRzFR0+UkCFrF6VgVaxZl8KCuEi2saf+yaNCZMbdsETlOWvDrOigWultHu62S8jZFP+td2lwAPZN7ixgN9O+VPboJBoLSEPK5QXTPHTjeOV0IHi5v4Mv6DUVEB8ER1oXumRtnAl7rcv91HFAHjJlWHOuyMicC2sxOrK3vs3Yd6WXvxwkE5M0oZ8wZyL5QgVOYZWdPq/ICztX09HdNq7m/xFCJBXxql
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(52116014)(376014)(22082099003)(6133799003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFp3VXd2ZU1Mb0lwd1dxMCtvSWNnWS9IcUhDZjAycXk2U1pXZ0xpYmliUXh1?=
 =?utf-8?B?U0lkcERuL085bDZOLzRGMDZBbEFBSVY1VDFNNkYvSExXaENidnFxNS8vQWRV?=
 =?utf-8?B?UVVnMGxKQjlwaFhuSXVtNHNHNTZaTXMwRHJ0amlkb3p4d3Y4Y2ZSMzNEYjI0?=
 =?utf-8?B?MHZjRlMwRU5xYkJBZ0p4SXZyNWtKS1JtSjBNTEJhYnIzM1lVUS96Y1ZwQUEw?=
 =?utf-8?B?cHpJeXFDSzFKeGdRVGE3REVmT2xGSDZabHRHWEpucUZFYnpMV0R1S21XVXJ5?=
 =?utf-8?B?eFZVYlBMMVZBWFhCQUwxdjd3OHJua28yemVxZDFmUENaMFJIMWF5R3B3N2N4?=
 =?utf-8?B?WVE0eHR6d3ZWbEtZV3FKb1VmVS80SVNlNWZhZm45d2MvUTJTOUxSMDl5WmxK?=
 =?utf-8?B?VEQ5dVllbFJWWlJLeHRUQi9pZmtUQmRsSnY4WUlJeXVmeVVlWlZvNnpGQk9t?=
 =?utf-8?B?L0I2YmJzRmUvekhUVkVoUmsvSFFyY0NNTFB6MzlvQTZMZVVEbjNFbndaWTJj?=
 =?utf-8?B?ZVpRVjJGNVh4dW1WWWNwSGdabm5BWitTc3IyZ2M2UWYwczVSalFmUDNiNWM1?=
 =?utf-8?B?N1JKdjZMQXRGYU5wMHNPWC9LMVpIQ0J0UVFWU0FnUkdBa2lhVkExbVczTlpF?=
 =?utf-8?B?aDFFdFdzMEN0cXFlQldqYXl3Ym9Wb3R3b1FaVjUzcExmVEZ5NjMrVlV6aEI4?=
 =?utf-8?B?K04xdTJCYTluaU01SnZqbitaZ1R3YmtqdENHdjFwaDFpVmpwbWFTejl2KzU1?=
 =?utf-8?B?ZFIxdjhwZmpCYTdNQ3MzQ3VDMEUyNytseGtkbFRkSWt3Y0N1dXpGaEVDZ0F6?=
 =?utf-8?B?QW9NUVNKZVlnaWlYUHhOUVBUei9kN1lCZ0xkUm1vOURLNDNybk9KRTJSNTBp?=
 =?utf-8?B?a3pielNRelIyNDVCakNySUVuY1R6NUdCSTR5aUhIblpzNlFVaTV1L2duRUN0?=
 =?utf-8?B?K1Zaemt4NmFMajRYVUEwdG9PNTZRMnpNVFNQN2JBNk8raWZoR0NjUFZlckox?=
 =?utf-8?B?NW01ai9CUWNjNWJTOHdGVHc3aXkzdWZqOW5RVmpuYXFkUTBaeDl5TnVwRDZs?=
 =?utf-8?B?NEJTQ0c5aTZFTnB1RUtwSEF6Rm1VazZRY2FNZ2prR3ZvSDk1Sm91cHpFVXVw?=
 =?utf-8?B?S3IzeUp6MmlzSm1xUHhncFRMMEFDRmFlQnpnZmdycWt3ZHlXcXR1QjlCTlF4?=
 =?utf-8?B?MlRQclJVUWdWb2hTMVB0K0Y5NmRKZm9qYUJpT2VXY3VLR0FPZ0U3MVNzazJV?=
 =?utf-8?B?LzF4Nm1aQ0tVZ09BSUFxZjVqMzJmOTh1VHZNMVNHRzhVQTEwT2Q5Z3lNb1RZ?=
 =?utf-8?B?M3RoQlRWSFJBT2VCUVI0enV0ZWo4ZnpIRE9FUnNZU1BIVDd6QWliVnREeSs0?=
 =?utf-8?B?UzdiREVGb1VnSkNHS1pmcThUaG1RWkpjSmZQbnlwemFBcDBaRGtDbDRvZjJQ?=
 =?utf-8?B?d1ZsLy9RbUM2ZFR5QkZuK2V3eXZ2QVdTUUY5TXJFeldIbFhodkNTQjhONys3?=
 =?utf-8?B?WXRnT2EzZmV3V0RIS3NrYTJ0NVhHQVkzSW1EMEg3M0FwbEtQRnU0ckpGNFY1?=
 =?utf-8?B?MzRtZWFWbm1qOTBEcG1KdkxpcTN3SFlRRldKaUhXMEpLTFViNTErWTZCaFo4?=
 =?utf-8?B?WEpiWitKQzhCeE1wcEdpV09XVFh3bTF3aEtENDk0djhvbWg5N3VzdFhObEl6?=
 =?utf-8?B?bUZqc09vaTBtMWRDMWREREJJWHk3VTJDZ3o5S29HdnNEZ29NVHNzUHlTMmEv?=
 =?utf-8?B?VndnWEtranZkTWtKMU1vR0ZVZWVRU0tvcXJ6VE5qak50UjhPN0ZaV1BQcjRx?=
 =?utf-8?B?TlFIK2lZMnFzU0NqcDIra2lMWWh6R2FnbU01c21lSEhOcVNoNUswa2FEMnkz?=
 =?utf-8?B?Y2kwMFZqbElFTkhkV1pqUGhWSlRyWHRuM2phZ2k5Q3NTakpKZ0hERmVmSXdy?=
 =?utf-8?B?WlliZGp2TndobGhXWXRQVzdvMXlaNFBoTi9oWGk5UTF2RW02aXBrSnJiMFM4?=
 =?utf-8?B?eTM3ejlBOEtkWDhiSUxTcFRCaVlNR3NDeDJoOHJpM2xkTHdMTHNFSXU4UzBT?=
 =?utf-8?B?b1NDTzR0OTEzSy8wTlBSUXRtZFo2TTBPb2JrQU5JVXQ5Um05NmFZcTUrS2dH?=
 =?utf-8?B?MGFzQkxaWkJ1djVGQlVHWkVFUTBOSVNnYVpPaUhPbGZCQ3EyNEJFNENmRGJo?=
 =?utf-8?B?MDNFMXU1QldMaXZXRGptdGZyd2w1Z0hhQ0Zka2h1cnkrUlFRK1EyelBWVU1x?=
 =?utf-8?B?RUNiQkpwY0xMbnQ1NW05RUZOSTQ3Qnluck9wUG9qUFRDUnBoeWRZM3dSdlpJ?=
 =?utf-8?B?WmhNVmpjRWh3endPVEphakxxNTRTUGtBMGFvZ3I3VTNJL0gvc01NQUQyMmVi?=
 =?utf-8?Q?dRHYHr/T97lvbQni+G3qED0Cnfo4Y4v211VtL5cBOC8GM?=
X-MS-Exchange-AntiSpam-MessageData-1: 6VBwZxd7MixV2LHmCCCYetWlqgFpFLxJDjU=
X-Exchange-RoutingPolicyChecked: 
	J2uRGTCY748DShbxMu2U479S+XIiGUqBerNmv84B8QHbni652TWzYw8Hoyd5pKTzkrCG3pXpGIdI1faI4ot9Kvw/Y3FX3VT+JoNQUtAkPKNu4DzTjdCqWSvp1Aez70UcM8n12oF1jHPN/6SZCMivgm1JHuA2/XrySl7Wkqyd3+/MLEJPVue/sL2J9bD+QQf7rb+EhOaTbWagxTvuuRQDNchhnuc4aud/1I/PY4QgGbSQiG/9F1qpfo0tBVg3niY2x24tgE+gbnoeYw0MxfiyS4A1o5kkcAbJDHhX/+yTKRjGTiG8+A9G3NYKnZcziZXCIarJ/gH2NVEXB8oigcdaVw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19b0627-2302-4d9a-964d-08debd834044
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:07:35.4489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+Dlo2o4HVd4vCnid61kpcxDk2qLvoRFFVaT1hANHNWCMOUMxibisMV46aP/+FFam7OleL81S0AQzb4ODpfATVx80lK78lsRuLwooDm4qww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9745
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: qA2NxQKfKtqAMDlJT4Zm9yq-Ff1N3L8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzMCBTYWx0ZWRfX9fRhISZ2RFGk
 gzBxVPwMOejuk484pdL3qcGuBkABWZNneZyRZeV0i4htecfH3LpNR3TKjk1r2l3pv0SCOe44UKT
 /4XdxYZQqoWUDkmiUFgaUtOZWrNzLTIixtEe/H4eptYKhZDremEEQ7EC9nW7PRxWtc0Hwc5SCUy
 m3YTxajpTDqtfuydBhq/sfHoiITlB2qaK2LraE1uVexslPRKuU7yiWXAdULT07sM7TyHLgffO/K
 WfrLRi8v3u/x05I62y5eYkgt7XiiplJ6VS2bIcYgCs//fR+H0Z1PXAk/baOgzlGzHBBjMcu0DRb
 XiwmoIlQNhy+CqSanjsQSLD01SiyGSeDzGKdk1CnmMrlhaGJk6kqmwP7K2trGzURl2wSVh74+iR
 0hO54XVrYfOWZLqk59eRgfXBOl8CPcPh1cKYOmPbFWD+NvFycQ7Q/0e+T7lE0maI9ODH0dTb15R
 2KcWmNZil5FXz3hVmzQ==
X-Proofpoint-ORIG-GUID: TjoTDgR6Wwe8a_0o0Gqgq3sCVzq52-Nt
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a198f99 cx=c_pps
 a=ugQZG2M6WJJQC2vHgpB33g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=5cKHBeEvxx1kOD_D8fgA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 13:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237753


On 5/29/2026 3:48 AM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, 2026-05-28 at 10:22 -0700, Sadineni, Harish via lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Add Rust-in-kernel depedency packages to the target image when Rust kernel
>> support is enabled (KERNEL_FEATURES includes 'rust'). These packages are
>> needed for self-hosted development of Rust kernel modules.
>>
>> The following packages are conditionally added when Rust-in-kernel
>> support is enabled:
>>    - bindgen-cli
>>    - libclang
>>    - rust
>>    - rust-src-lib
>>    - rust-tools-rustfmt
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   .../packagegroups/packagegroup-core-buildessential.bb            | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> index 2cd67ad05f..cdfe07a584 100644
>> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
>> @@ -27,5 +27,6 @@ RDEPENDS:packagegroup-core-buildessential = "\
>>       libstdc++-dev \
>>       libtool \
>>       pkgconfig \
>> +    ${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'bindgen-cli libclang rust rust-src-lib rust-tools-rustfmt', '', d)} \
>>       "
> I think we should define a new packagegroup-core-buildessetial-rust to
> put these in?
Hi Richard,

The reason we added rust in kernel dependencies to 
packagegroup-core-buildessential with KERNEL_FEATURES rust condition
rather than creating a separate packagegroup is :

packagegroup-core-buildessential is already used in 
core-image-kernel-dev, which is exactly the image used for kernel 
development.
So we thought it might be right place to add rust in kernel development 
dependencies.
>
> These aren't really specific to kernel development so KERNEL_FEATURES
> doesn't seem quite the right way to enable this?
KERNEL_FEATURES rust condition is intentional, these packages 
(bindgen-cli, libclang, rust, rust-src-lib, rust-tools-rustfmt)
are only needed when building kernel with Rust support enabled. These 
are specifically required for Rust kernel module development.
So tying them to KERNEL_FEATURES containing 'rust' might be the correct 
condition.
>
> Perhaps targets could just pull in packagegroup-core-buildessetial-rust
> when wanted instead?
So, we think separate packagegroup is not required.
>
> Cheers,
>
> Richard

