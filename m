Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADDEC54F53
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43802.1785192983932794502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=inobVTHd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RMbGAJ1753026
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=; b=
	inobVTHdQdUk11L4ewyTZSzmYKzzLx2lLX8vkzlAbFKtB1VS4i/LaGqJgTbj+IfR
	WERzdnBECfnMGmJtWE36gTn+ak/VZNgBk76JTUlYIwc5UsvZonSfVvUhLzBN8J3N
	DYI+IYgrBZCVMw8AN3GUcdd7elwaIxGcInsxTz4BAPUz9UnGUoKaxu8Rt+yVDcVV
	FsoQSv+oJFk23+DvQcwVygc88iVOTrh4R2etfnNlRoEmVqWlX92LjW6D+U0u1QId
	Jy1AW6/PckMOoXX9el+kn2ipgQhwCX49Y43r/Wzjl61UwcC6IiSfy3APIX6W6dEe
	HngZlozV5QkcOBV73P7N7Q==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf2s9c-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 15:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYIZzGIB0wneFT5ATL5s9+ODQr4PV2d6CnBh/ogRdqK4iV/zzEbVxY/T9Tek0leFSkVcxHd99Jj6Q3Gu3js51aU54jaKHLw8S1BaKxVM1El5OcMcg/5TOqe0enUNDmcasFHP/Eb1No5Ia8D/AppMtCQX7V/L9HkkhKhLXNzoavC8TatLydvnoii6mBW0eqyDE8rZc7nNwfULdQxr7nBP9Yz3BkqXmxlDD14gWlpORpSuWkGXAj8W1zppE92HvUn97T1/tikonmYXXcnB+nAo+lh5px9XboE8NwyxPsRBOBtugXYO5iFXmdSFEQ2wHVTeE6DvzOoAIi+drp/iO4E1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+0dxCybc5ePyEfvH4ko8Y4mCaOMbfKRW4IO5xEUdAE=;
 b=wpFMAHM2QCEK6sE0eb0lfOSGkCheRVlmez0YGPQQO6uSlAi4Szgu3Edr8fDvNMOmDDO/NDK7KB2p2DU23tDhoLMKghSVwHFSsmdQKio576YY3A/7aPd21EQw2w3AaSrm+ORO1dHRrUQcbegdbLaA71/7q/Glcl21q+5SZm375iPGF5xrY3QrLp8k8M59E2/fb2BZ4q/YyKYzuklLXElUKecwgl9X0fcsPKDJtsPYID52MnDvYQ5OUY9ry18lMcpOpBs/K5SYsMEaX0URWSDBKbNGLUhcjb/snXxgz5FBbxRqzTcZFHxqK/nsY/nl87zYFv8G3N2NaLVDMmiT3LkRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:20 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:20 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 4/8] lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
Date: Mon, 27 Jul 2026 15:55:56 -0700
Message-ID: <20260727225602.342005-5-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc4e89d-7c26-4150-f473-08deec32460f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|10067099003|11063799006|56012099006|5023799004|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	2tH1UT4BnrUE3Gv3pEekC/PU397OovUmt9Ub0ae8AhMf7hPOb2a3pHJ7K3WwIwLx0R3x7QUHvLNfydJYUEZzjg2Sr1PTny8r5phEb/CwXoba6sZqSTD6tuAsm5gOWvyT6aL1P/v9AGpXNSqLbbBlCkEe91ey3Sv7xlEoBdklRjFBZMq3SnrUokocc5z0o0m/kqL7MmKq/SDdPDM6XsXjSWNt8EQg1TkishA7PxLaH/LDcGGy8BhSZ8K63VltHzLSDTMFMNP1POKAgpeEVEc1wz8yQA8eIZs/mQpEtONFccKiTJx6aqGJjH9LGiM29Fxwligl7+Y1D9YuGVEqFzzpsxv4GvFlk5WazIgQho/9ZRGWPJNquA7rZPiyeiJ/pYlDyI5mqbWdbYOXu50o5JuXxJf3jviX8VbRLN3aLHtq/OY1eUQAHCXP7RR7LPCp1tMoKbjdLpF3PrfmZ1GxSx2veYDAp4piSEJ6ZVM9liJvjqk9OrHdXMkm/575QgJXug00/UkfTtuQSDHSLUTog5XBX0I8oj2VdldBt/6QGkGYb42I6Uy6isAEl+VZ3WrqPAMSHdKq/MSZNcIKitA6y8vEcEOzcHUjbEQmn7mQf8f/s0Rdpdl5aRxxRWCeQ6iW+8V9lWybzZZGKNSszhZysPR/gsr6OF+y+TclDvvUV36haTTLfOjIuV9Cw66ymZ+zzWOcwAcgzRMfqQZS0rOwcTey8dxHnbsMcjTZyWWoL7ewUTg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TU4xcWxXSjcvcDN1MjljeUFsNldsdHRiV2Zvb2VEQ09tazdUSmdITkp3UFFS?=
 =?utf-8?B?dUFQSi9IUDBOTVdYVVEzTjA2TE1qa0szeE0zZ3V0RmVtL3A0TStuRnZ3TXdq?=
 =?utf-8?B?b2l3d2hDMWxVRnZ3d1YycFd3djRmV1liMUxYYmJ4RSs1WWVDTVpqWFFnTlZF?=
 =?utf-8?B?RExtK1JqbURuejAxbXliWTdjUE9yZnZ2ZGdjdi9pcUhvUDhsUU45VWR6YWJ6?=
 =?utf-8?B?b3Z2cjhmSnpWSzNWRmhDdnJnQmNhL3ZTQ0xpK00zeUdGMkcxNUxMUUxsSC96?=
 =?utf-8?B?cG45WTZBMHV0d1JwSWpwNVpEd2RwRVZZWUFFK2RkK0lIdGRnZG1pQ2xXRDhC?=
 =?utf-8?B?RlFuWU9HK2RFRVMxdzFxZmEvZ1hSSmZWY3N2Wi9ZeHR3bVJoRnpZTFBvU203?=
 =?utf-8?B?T1RuN0JnZm0xS0ptK1ZyRU90RWFlT3ZYeG5oOTd5dWFySERwWDZzb3gvRTMx?=
 =?utf-8?B?S1NieWI4N3dNWDRlZzlJRlNGQ29FTnBSMUs0cnpOV0RMLzgrbkVFQVhkREha?=
 =?utf-8?B?RkluK2FOd0hOLzJvOURHMjFXZWZYazZtVkIrblJGTzErMzZlSThaMm5za3Vq?=
 =?utf-8?B?b0xxYVYrSlFMTTJEaEJjMGxaOHRnbk5RQTdjSjBHcDNMQkpNN0k1OEdaMW02?=
 =?utf-8?B?NUM2MEt5Tm5IT0VmRkhpTXlTZXNmR1NzdmI4eDR0c2dvUjgxeTUwVkRXOERT?=
 =?utf-8?B?VU1EQ2NPZ1dXT3NQMEpyK3NBMmI5cis1MGFYZkZRQ1RQWVNUcTBHV1BBTVo0?=
 =?utf-8?B?WFFsTTNtQ00rUER1RGVIWk02YXZPZ3dTRzFlaVRkUnZyMGNhS0JPRnZ2dkZx?=
 =?utf-8?B?L2E1NHdpcjZ4TzFPVGhTRWxBenhod05oSHhuS25oMVY3czd2ZDdOVHNtdHVZ?=
 =?utf-8?B?NSs4NTE4SytycTVHNVRMQ1JUa09MZEpYN3owbklCUjlXNDUremdReXRzdzZi?=
 =?utf-8?B?OSs1MFBlNUJIUzdSMTNqdm9ZeWJQWFYzUURFVDcvVmx1TDBxWGxBR3Fwcm9H?=
 =?utf-8?B?OUczSG9QYjFuTjIvTUQ3UWdjeTJUS1lXNEUvTnRyemM4azdhVzNhRlhjTzhV?=
 =?utf-8?B?dHFoOTJDeEl2RVNvVEtzZTJ0MjNsdWpzNVZDeFJZUFpDR25LWENSYnRmb0tK?=
 =?utf-8?B?dC8zdHRjTnlMN3pZeWN2QlhkR0NoMkJTZi9HdFZEU3RPUU5tMERwa2U4Q3FT?=
 =?utf-8?B?QUN4Z2hKdkdTU2k0blBmUlVDdnR0WkNUSGRKQnl5S0grOUR0UnR4NXVzbEIr?=
 =?utf-8?B?WXgzckJkaDJrUTQwVS85S3JlcnVsWnF6N0tEdkZQeDVWaVJYZG90L0Y0T2Ji?=
 =?utf-8?B?UDRTUUZoU3Y0NEVWZXNEbS9UT2JYTERJMFF2YmZpb3pHZWcyZVFFNzMvaDNt?=
 =?utf-8?B?NERneVpZdTd0aDVqTHBFeTVwQmJEa1Z4aGpPTHdrN3E4WmJJcFU4alBUUjR5?=
 =?utf-8?B?QlRRYitLQ3ByRGlMSjUrL09razdvUHh1VjlUTDE5Ymd3N25CeEtaRkFoQnZ0?=
 =?utf-8?B?TlNGOThMSVhyNDM3enFXdHlrTWJNODFkWDZpZTNTZS9HRmRMZ1gvbHEzNWFr?=
 =?utf-8?B?ZTd1UDRlRXdhSlJwa0FLOWY2L1VnU2YzbjhoeGNVN01peVM3b2xNc3pNck9S?=
 =?utf-8?B?QkYxbkRoVVhKU25pUmpLK2lYT3pISnViOFFvR2JOaUR4ZXdGZjQ5Y2NLK1pQ?=
 =?utf-8?B?bDlvT2RUNVAxd0NUSHhYWVBPQkRFU3hQUmZkYTJOT2ZJVDhDWFZxclFwcWph?=
 =?utf-8?B?ZnBZdGVzR1ZDUDNOeVZ1NkpGWERyNjYxRFN4VlM0c2hKM0hwTDlUL3lJRkRX?=
 =?utf-8?B?Wi9pOGlWeGdGU09sSFNZQVBKM1lyenEzdytOY09lcWpjMmsxZXEwbGVrUldS?=
 =?utf-8?B?ZGdXL0dqUVVPYVJycndVV3l4QnM1dFl6NEhqdnBjOFkyWEtqVU1GdFNPY0Np?=
 =?utf-8?B?ZktqUUtnRWp5QjFoWERJZEFYSGNQd25XUHpiejN5VEh3RDdpZ0N1ZzRxMzJI?=
 =?utf-8?B?aDIyRUZXODUrNTVWeVJMWU8yN2tidDllYUk2c2gramxmQkhUdFByMDlwSEk3?=
 =?utf-8?B?OG9zUUtXYVA0eUtPZWxXazVPdkc5MDhJK2pqNWJ3dEMxd1VKTmdpWVp4WGFQ?=
 =?utf-8?B?VTlhVDMzM3RtTytxcUxPbjhqenU3YjU3eWNGNXZhY1VlVklmcFJSVkNwdW0r?=
 =?utf-8?B?M2lGTkRjQ1EyS1dyVTNtbkVHaW9OSnltektuZm5ibFpYNlQzaS8vc0JFUTNr?=
 =?utf-8?B?UkdxTW9YbzdoakVxTFZ6RUM0WGtDcUNPOXBiYXlLa2dRTUxYb1BJdXBPV3Jv?=
 =?utf-8?B?cTAvU1kya21wMVpUR1Q1OXk2K3k3bktJeUdaVC9xZHJvbUF5NWpJTCtZM2Zq?=
 =?utf-8?Q?i8+QhCeNO0NlGE8U=3D?=
X-Exchange-RoutingPolicyChecked: 
	RnzWD9iga5BRopSxOE8uk3d1cyJ2SM4bxkppd32xTZdFT/PrZg8DxMXpdRW6zgKtUwt3XXBPYW3aX1B0TrwFduL7EB6pt8TsZrqYKNvr3qIhu57aIiYe5bGVEjKws02RKhmowv4QIBrQOzI3K87vnXmdM3SKfZQi7xXwZK1GYgF4i7ahK+3z3taJiZIfqQjwJyygePFG2ScpADWU4qYy/MCZqM+qfyj2Sfgioe2q5sI0aAMZsr3K5itBJXznA8VBm7SFlzkFHZ3px8i6TauZg6ROsT0XgjHMQ3YCPbzGEpbXo8O8YpYaFlLmS0lBmQgM6ixXByQl7eu5+yfe5NLKpw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc4e89d-7c26-4150-f473-08deec32460f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:20.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XB2ZaS8Lh12wx/NLeKg02herK9vllh9+oRG4Uawqw+vKBO1L5V3JcF0tFRmAYtwgaLkKNNiwXTBEw7cLOyDTO2bBoUVxENWGTNJFh4kDH7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfXy2skx6kYkPC5
 FQ2l4FzJOXWjKNTtgorchemNuyy7kyeTxavqSzCEu3zj4Cc36Ay9LFmp/4glf9qjgIN8lCrCdSm
 BJZyY7z54UEO8cRVcbocTGMaMKqCKNZVJ0LaO6zKyN41sHyMZfX/
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX3xifafYwLgU+
 G3IETu2tODHEGdlmQjL/HB2mMbjGbMIuuF+YVd0C3nAJVahg++TdSzZCztMUIVmx/Epq4XNz1SN
 AZ78PB5NFDPFOLDE6PDjOcT9YeOnmCMJJhOt16OAsNwM58qeIAOR1es0ysuPBplPuUaxU44ol0V
 InT5g/OfpznRNIG2+DKj1Z3iNgFureMlLvVg/vCW6SUvVUpC5AGsL8k3Am/EAlxWreTCBSSsK4t
 hiqi9T1tIJF5dgrq/DhZTgetis+vpNvyJWkKUTE3hXKqiZNlONQSKx0BPuMX2yzMNf5rpL6kyom
 qzNE8JvNWZ3zzkEPC3e+8Y+UunU/OzHtmBuBgb7at8lk1GngTrM/ycpImjPg5Aq0V0qIUrbHfCK
 N6apkkQeHWwCVHwb5lx4YT8V+6ISY/DLlmyeRqB1rp/5GjaTm1o4By1Jm5nLT3mgePKSyuzJWh5
 i4EEShX/wpZ52km4wPw==
X-Proofpoint-GUID: JNN0Li1MI1TZHwaH1hUyazol--mVsOuA
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67e217 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=cXaodKgrPycq8dEL5jgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IeBiqFHA92zXJC4rHKRlYXRmpC98QKnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66RMbGAJ1753026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242129

RPM's pkgconfig.attr fileattr auto-detects /usr/bin/pkg-config as a
Requires dependency for any package that ships .pc files. This causes
every -dev package to have a hard runtime dependency on pkg-config.

pkg-config is a development/build tool used at compile time to locate
libraries and flags via .pc files. It is not required at runtime on the
target.

Without this filter, do_rootfs and do_populate_sdk fail with errors
like:

  Error: nothing provides /usr/bin/pkg-config needed by
  python3-dev-3.14.6-r0.x86_64_v3 from oe-repo

This is triggered when IMAGE_FEATURES includes "ptest-pkgs" or
"dev-pkgs", or when building SDKs, because -dev packages are pulled
in and dnf cannot resolve the /usr/bin/pkg-config file dependency.

The fix filters this dependency at package generation time in
filedeprunner(), consistent with the existing filtering of python()
and perl() auto-dependencies in the same function.

Note: pkgconfig(foo) symbolic dependencies (e.g., pkgconfig(glib-2.0))
are NOT affected by this filter  they continue to work correctly for
build-time dependency resolution.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 8ccd89a190..d210b4a73b 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -253,6 +253,20 @@ def filedeprunner(pkg, pkgfiles, rpmdeps, pkgdest):
             if dep.startswith("python("):
                 continue
=20
+            # Ignore the file dependency on /usr/bin/pkg-config. RPM's
+            # pkgconfig.attr fileattr auto-detects this as a Requires fo=
r
+            # any package that ships .pc files. However, pkg-config is a
+            # development/build tool used at compile time to locate
+            # libraries and their flags =E2=80=94 it is not needed at ru=
ntime.
+            # Without this filter, every -dev package would pull in
+            # pkg-config as a hard runtime dependency, causing do_rootfs
+            # and do_populate_sdk failures when pkg-config is not
+            # explicitly included in IMAGE_INSTALL or TOOLCHAIN_TARGET_T=
ASK.
+            # This is consistent with how we already filter python() and
+            # perl() auto-dependencies above.
+            if dep =3D=3D '/usr/bin/pkg-config':
+                continue
+
             # Ignore all perl(VMS::...) and perl(Mac::...) dependencies.=
 These
             # are typically used conditionally from the Perl code, but a=
re
             # generated as unconditional dependencies.

