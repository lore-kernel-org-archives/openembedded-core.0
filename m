Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AF6C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 07:17:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5604.1748935066220137987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 00:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82493cba5f=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536FWYt009705
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 07:17:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t0kj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 07:17:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQB1cmmRUAl6UYaVUMnHDv68SHy/bFNzwPVJ7A8C4GGBLj82jkxE8StRT8FTqBm18fGifUg3E758ZeC7u5gKXKh2ozc5lJPUy19Ywr4RnDEcvvOwm4Dzfw+BrZqyxCkvzQyZYsDIK50wj/nHM4olyZxr5eMGxN1oYXQDSCDlkGxVXG2GPfg9Q/MTX69dWI5DAhSYwgCMQG6UAchA/Pzo6FkV8hLoU5gNqOtrwRESoBLtH9Fx8ft8A9rhpKSMea5+C66x0LOWYWi8RLsB/PzuGrbb1wtj4onIP7tq7gdWc5bC+9/SoZ4rBZfXHoy9RAODuxhrJIH1VyrwLsBhvR63Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHIqUYyVBlToIVLpTJknnF23eK81sLIofNX+tkEi7Sw=;
 b=WkLoPGI2XHPFpI/7GgEOis+oQnFDBnvd77DzytP+ozv+3xd4Kexj56+Y6Q98MMOsOIr6E34Y7fbWpch2immdt047LvddKPEEMkjFMLxN+HGOlfuGCWlRTSeGebr0XPE+hgNgYHuof8gdVFPWzD+LOjv9VkL8o9tV0pl6NXaesqw9NLcEXWTIozg1rqfNu8TV9f2c9I+1kjcG+rRJkf9V6FG8Y60rqZpQqigvtc0eP471MoI/KbFekcLHEH+hDhAPilqL2ch7KZagtExDMEFebN7rKOJztXo95yfpyawL3aeOyrDVA6EgcB05eic+hkG2rUkL49VOQ3xYsnSB9Y3H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 07:17:40 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 07:17:40 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] util-linux: fix ptest failure for musl
Date: Tue,  3 Jun 2025 15:17:20 +0800
Message-Id: <20250603071720.2055740-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::20) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 193d1145-1386-46a7-2344-08dda26eb996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3N1ankza3NXQnVnSHBMTXBUZE9YZDRicTFYSWpqRXp2cEJFNEJyQTN3Qkps?=
 =?utf-8?B?USt6aGFEMERibVpZTG4yUjJKdGtjWTBWUTVlTkVUNmx4bkNEcUYvaUtON09L?=
 =?utf-8?B?N2tmelkrYU4xVVByeTV3UStmUGlOOUNEL2N4ekRvTkloOU91MlEvZm1vd1h2?=
 =?utf-8?B?OEM5b2pmNC9BNDRSVlVXc01tTkNTdUxndVpqQisvY3hUQ1MzYUNaS2kwMlF4?=
 =?utf-8?B?eVQ5MzBnTHVUUlpTaVU5dW1HWGd6ajNKMDFrOXFTU0lIWnovVXV2UXBlVC9S?=
 =?utf-8?B?Uk1vRzg3VTVEQkFBcDA1OXN6bjdncFExdk4wRnNneDF3dC9HZGxWYWp6czJ0?=
 =?utf-8?B?N1lFMldtSko3d1ozTzVVSVlhSkJKaVo0ZEdyckViK2JqSFpjanA3ZFpSeGhU?=
 =?utf-8?B?VTlMRG93dkVMZzhlZC90SXlSZHc0OFExaFQ1QjV4ME5lK1YxRFg1Ymc5cUdh?=
 =?utf-8?B?UkVONDNHVEV5WHRVMDZRa1JpQ2xwcVk1ckVzS04xdkkxMnlyMXhHWnByRGRM?=
 =?utf-8?B?RDYxSDUzZ0NvdGlVUkM5czZRaVhHa2M0TUZBSUNHd0VCTzdnNzdIS09yandi?=
 =?utf-8?B?QUxUaE0yVXdzeGYrSUg3bzQvUlpoaGk1NHN6S2xwcGdxRFZMWTlBdlpBc28x?=
 =?utf-8?B?aGQzYXhJSUlVQXNjdW03ZWR5bGQ5RHdETXN4NlRzN2hVQlVESURYTExxcW5r?=
 =?utf-8?B?TlBIelhjZlJQUy9lQnVoU2szeG1hL2ZrRjlUdkxpeGZleVphNGhQMVgvNGdL?=
 =?utf-8?B?N2V0MXNQeEQvcEtPVjhwcWNGUzBFemxpZm0ydGdzRTRqc2paaEhJWkZQNGJ5?=
 =?utf-8?B?ZDY4TVNwY3ZBQzdUUDY1NE5STllnZ3RZN1dkY2ljVDBtbElranFaMkpJUlpi?=
 =?utf-8?B?RGdJeVQxdW4zV0tMaFp4RHY2cUtoTkZ1cVRGN2JVRjNlOWo5Y1c1UFlhQXow?=
 =?utf-8?B?VHBpdnhtaE5wdHVueGdocEZDd0s3bkx3a0FDWHJ1Sm1WVWtWQmRZT2JPditR?=
 =?utf-8?B?K3pLRVFFZ3dhQk5lTmxvbGk0KzNVdVpuNTNlQnB6OHphNUdBZlREbDhsU1lX?=
 =?utf-8?B?YmpWWUtBMFRRWmRLYXdOL1NKZEcvcCt1MlI1U2x6OTdSK0lkZnRIV2pPdEJB?=
 =?utf-8?B?eHFmSUo2WWVKUVFMZHN4cG9VeUo4MmgxeFh1cHRPZWNrV0NlNWtFYWxOVnE0?=
 =?utf-8?B?MUUrN2FOcnBHRU1sSlRJZk9ZMUltdFY5dEpSL2l3aEdVVzdEOXR6MWlHeUFr?=
 =?utf-8?B?czNpTUdOc29Xcnh5SHQySUo0ZlNpZi9lMDkvditiNkdYcGFMbkh5c1EvMStL?=
 =?utf-8?B?YXFUVGdCR3FZbEVHMGNURVBPUUg0d0tpQXQ2UmNDaWtCVkxPUGhYUEZNbGpM?=
 =?utf-8?B?NHEzT0Npd0RQUTE2NEtmNjVVYW50dlN5MHQ1QWw3emxYZTlJKzdUWFQ4YVR3?=
 =?utf-8?B?U0FZVjlRQkk0dW1oOGlyRlU5U1docGxpOXlJUkQvSkVmME83YmROQ2R4Ny8y?=
 =?utf-8?B?V0pmZDYzOXd6bFY1cjRPd2VCemFnaUs0eE1FUDhpaC82R2VXWjF6SWFMTGRO?=
 =?utf-8?B?WXIyTHVtNFhkbzkyUXI5MFRzZVpvaTNzSWRYK1N6T1RYSVNtakR0aU9DRFBI?=
 =?utf-8?B?TmI1eEMrY3NnQi9xVXh0RzF6K3JrMDR2QUE3SzNWYWpLMEF1SGxianAyaDdI?=
 =?utf-8?B?NzdiQWJRTm9lWGl3aWJYTDR0RkhYVlNINUFIclJORGxwWmxiYk4yMVk1UTZM?=
 =?utf-8?B?MWJnU1o3enRrcG8zT283RlhheHBKZ3REekw5QzhoM1V1RlpPWnlSVWNSbWdw?=
 =?utf-8?B?U2t5Q3NOanVnS1lkZXk5eGJXb1gvT1lrWDc2R2VhTDd5dnIrb21UbUlkbHgy?=
 =?utf-8?B?dGp1OUhRRmVQRitGT1RlSmJZcTZrZU8zRFlMaDJ6NzMrMkI5aFhmTG4wd3M2?=
 =?utf-8?Q?N0RvgymL7As=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1VFbTNJQlJESXZnd3I4YTI5OEExTWRsS3JtdXZ4YjFBdFYrUmRUd3VESjB5?=
 =?utf-8?B?M2IvaDh2eC9NalpMT0JVTFRWeXo0NC9sMUlZVUVRd2krTnFCMnlzTUlROUpY?=
 =?utf-8?B?UmVoL1hZQ3BXRjJMUVBaMklrYkZPSERlbm5pczFldHNXSGhTOE41RXZldnJQ?=
 =?utf-8?B?ZDRIOWFKMFRQUE0weUk5aUNFL0lyZGIxSXFFQkVJNDZsYTU3aWJKTnJ6VWZL?=
 =?utf-8?B?dmRaZDhDMW4xMGNVck96VkNyK0NTeXI3R0V4em4xMVhxeTcrN2JFZ2dWaUR5?=
 =?utf-8?B?d0lkbjR6ODdRU0tGM1creGlueGZxVDU5Ylhuc1drVnJtVHE5WWFYTlFsR0VY?=
 =?utf-8?B?MWo2NGQzTWkwa0lFbnJHazZqWmFMc21GTWRtSFR1ckRtT0ZNbk1DZTVnVTdC?=
 =?utf-8?B?MHVaeEJJZzg0ZTJSaEtKRWZzZHZmRnBpWDhvWkwwM2hlZmNDd3BWVDZFbGdo?=
 =?utf-8?B?Tyt4NkNNRG1tWFBmZm5UN2dhVnpsN1dIRkhGT1hNYkJMNE9Ga3VEYnF0MmJ5?=
 =?utf-8?B?blRYUjE3c3h3OWkvR2JkRGEzdmxNZkJpclUxMXhkTGtZQ0VXMkk2ZWt2N2Zv?=
 =?utf-8?B?VUpVS1llMXJ6L3FYTUp0YUFFbGc2QU1LcnYxVkN4dXFxaFhSWkVId0hMTTd2?=
 =?utf-8?B?UE5OaldqK3c5NnZwTHU4YUNITWJIcGYrZmc5bGFUSnB6UjFZRjBWbWJ4N0FN?=
 =?utf-8?B?WHFqbGh2OFcwUTRESnVwdHlEcHJWVm5nT0M2eG1GMS9vOG93eFp4Nit2b21h?=
 =?utf-8?B?R2JISzh4U2RPaERzK3k3TktpdUVod3M0VVk4M3hFNVBLcUN3YmFWSG9WS0Fo?=
 =?utf-8?B?SUJsdG0xS05Vd3J4dzI3YjBabXEzaEF5ZUZNdmFEd1RocXp3T1drcUZ5Q3FO?=
 =?utf-8?B?TDY1QjM1Qi9LSzhjRG9sUEI0QzZxKzNxUzI5eFVlTEo1cnZhdUd1YW5KNU5r?=
 =?utf-8?B?bllRQk5uc2Y2aUJ4a3QxeG9vcTBocXR5VWRCeExNSDVBYldrZTJ2SVpiSTQw?=
 =?utf-8?B?YWdFS2FPbFN4V2YzWUZVNFpBQVVOMW0rUEdqWFZ1dkVHc2lQQVNpL3I0MnFm?=
 =?utf-8?B?RWhjUDFqc3pNcjdkbFpoNkJ2Nk5GOGJ2L25DZm8yVjBmeXVvYUpIZmdETzBK?=
 =?utf-8?B?ak5SRHMrVmwyeFdPSXl0RkE2OEJlL2gwbVhwaVJRNzFUM0pGQmttNGFJREY2?=
 =?utf-8?B?VFlnRHBKdUZvek5hT2E5clJQUWFkQUo0aEwrVG1rZmFhVFcxNnU1K2tWUVU0?=
 =?utf-8?B?Rll4L0NMS01rOXR5SE9YY2hEN3B6V1FJL3ZSaTM3VEdqVXlrY0p3UDVlL05B?=
 =?utf-8?B?VWc5eDhJNDBLUUlrUnE3b1VjUmlmdHBtQjZFMVlYN2FTdGpEYm9jbVRPajRt?=
 =?utf-8?B?K1ZCQzhnMEx2WGV2VjEwK1BJMDJKZDQ4OHRMelplV1R5TGFnK0lVVjFqcTVl?=
 =?utf-8?B?L2dDNDhkUlpXTXNlRThYZVpsdWxrazRSV0ErZ0FLVmtNS0NrTVpLbWZZR0RL?=
 =?utf-8?B?Q3BETVRSNkltUEFlakZzVVZ2RjI4QUtJRUxoZzZkM3RDSVgzcFVXSHpVWUhZ?=
 =?utf-8?B?RktZYlcwL2tEMUVIMDBFVTVUYTZxWHlRRkh1SEZRNUdLaTFOQkZZMHhwOWVy?=
 =?utf-8?B?QXlya0lXekh0S0ZhUFVvc2k3T3Z2T2cyTzlqeFRGM3Jjc01raHBDbGRhY0FL?=
 =?utf-8?B?ZVpDbytnZ0JZOTA1Mkx4QkZ6Y0dibXBOc2hBZ2toSjdVN1daaE5DQnBEVUgv?=
 =?utf-8?B?T3g3RHJwZEw4a1NFa1FmUXVtUnA4a2tmd0hsVlJlSWdHaDdKWm9PQVdJdjNP?=
 =?utf-8?B?dVpPWmUrTU9nelVrbDlEREp2N0tNMGlvczk1UWV5N1E0Z2t1TGk0S2o2M3Bs?=
 =?utf-8?B?QVlaL0V5MmZlbDFjc3dCMEVPS254aXh1ZTg4M1dIMkIzNzBDTGVMVnRvWlVp?=
 =?utf-8?B?YVV0R0tLT09VN2ozQTZlbEQ0aUR2eHN0cVJ3V1R6enBVOU1Md3dzd3htYzNn?=
 =?utf-8?B?QWxBc0svQU9ScEE3ZFUxbmhxN203QkFWR1JZdXI2YWlRb3QrZ3Z6bFQxSWFz?=
 =?utf-8?B?VnFyVks3M2VZdHV5MnF5bEhMZGRRcHQ0SW8wRnFEVS8wKzJnZ1E0bFE3d2Iw?=
 =?utf-8?Q?cb1tZLPZeLv3vvTC/8ulDR40W?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193d1145-1386-46a7-2344-08dda26eb996
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:17:40.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPZ6NBP4t/Wl9GlGnjhbVE44WiUYiSMFCtZegU12rAhvRdCZXgiH9HOpeI0j667kJNZ1xfPvQTxjt6WhAsxfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
X-Proofpoint-ORIG-GUID: y1IVrHuprp8AH9PmtWoE7POTFFOTJGvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2MiBTYWx0ZWRfX8bQPcJROU766 0JES4RmZul0PtXbzJPiRlLGLV8i2PP9hO3p+WBJ/FVN1P6iQTX1RXDjJFnNwo6Soc/cQ9ZeqwwY xH5OQu+bKQwnYZ9kS2NCZDckLjOuM68909HYzeVYVp/QVS8oC/qRXaRUKlsQK4gLxU5wKtWdj5h
 E008Ovl5dOl2AKs+pCyNw1lxruJWT+rcAgjbCx/aYRbp8GujqxajGTYqDhOmbiIPC1fzVuxHm2K Hiwok2NL87ebWq4HBdVn3q7sIbNDUOM/bzaDv4QD5mcMBiO8vmgyewjdUUGBl+lzfm2fl037tre awNZuKnIQRLAntLHX9R4GNK9oktmWm+62sZSgBcQOevb0xDdLwb7OUvdcnLyEFAblX/HdNq6hNq
 +R0RYsY2f6AuyVfqm+3GmDK6zI2xFd4AMQA3lnjmHiLHwEmerQw/2bi5yGyVgyqsq+wpooYv
X-Proofpoint-GUID: y1IVrHuprp8AH9PmtWoE7POTFFOTJGvF
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=683ea199 cx=c_pps a=7j0Ltmo+QGRCGvpdpD29zg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=5KEJ3k9QAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=u6EciMzsgI6BLnmZaZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=olg2BfGzmf2haRflzj8J:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5536FWYt009705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 07:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217761

From: Chen Qi <Qi.Chen@windriver.com>

The kill/decode test case fails for musl. The root cause is the test
case only considers glibc and uses 34 as SIGRTMIN while musl uses 35.
Add a patch to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../0001-ts-kill-decode-fix-for-musl.patch    | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-ts-kill-=
decode-fix-for-musl.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
index b0f2a9d497..2d003c28b2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,6 +42,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-k=
ill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock=
_di.patch \
+           file://0001-ts-kill-decode-fix-for-musl.patch \
            "
=20
 SRC_URI[sha256sum] =3D "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b6=
86b3fe475ddca4c6"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-=
fix-for-musl.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill=
-decode-fix-for-musl.patch
new file mode 100644
index 0000000000..efdd019cda
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-fix-for=
-musl.patch
@@ -0,0 +1,43 @@
+From e6b6e401b0046a524e2e3e3db66f1b85b06fa2d4 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 3 Jun 2025 13:18:36 +0800
+Subject: [PATCH] ts/kill/decode: fix for musl
+
+glibc uses 34 as the value of SIGRTMIN:
+https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsignal/allocrtsig=
.c;h=3D8ed8e37dd6c41f94be6eef042ce9db1af1153228;hb=3DHEAD#l27
+"""
+static int current_rtmin =3D __SIGRTMIN + RESERVED_SIGRT;
+"""
+
+musl uses 35 as the value of SIGRTMIN:
+https://git.musl-libc.org/cgit/musl/tree/src/signal/sigrtmin.c
+
+Adjust the test case to cope with musl. Otherwise, it fails with
+the following difference:
+
+  -Ignored: HUP QUIT TRAP PIPE ALRM
+  +Ignored: HUP QUIT TRAP PIPE ALRM 34
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/3605]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tests/ts/kill/decode | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
+index 57149899e..f17ea36e2 100755
+--- a/tests/ts/kill/decode
++++ b/tests/ts/kill/decode
+@@ -53,7 +53,7 @@ ACK=3D
+ 	    # Sending one more USR1 is for making the signal pending state.
+ 	    "$TS_CMD_KILL" -USR1 "$PID"
+ 	    "$TS_CMD_KILL" -d "$PID" | {
+-		if [[ $("$TS_CMD_KILL" --list=3D34) =3D=3D RT0 ]]; then
++		if [[ $("$TS_CMD_KILL" --list=3D34) =3D=3D RT0 || $("$TS_CMD_KILL" --=
list=3D35) =3D=3D RT0 ]]; then
+ 		    # See man signal(7).
+ 		    #   The  Linux  kernel  supports a range of 33 different real-tim=
e signals,
+ 		    #   numbered 32 to 64.  However, the glibc POSIX threads implemen=
tation in=E2=80=90
+--=20
+2.34.1
+
--=20
2.34.1


