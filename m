Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B1EE75457
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 13:12:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119813.1766581950705434923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 05:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KS26MSCA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4453be3734=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOCRfLf663579
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=oPu8ktWeb
	L3sC8XGmBuY9yyD0itLKAdJYyIk4x1Op34=; b=KS26MSCAZHZXWfOXrS3CKvmm+
	aSe2zxK1XUS+e+JGSds0DIa5+ZeDFeuyxSiY907B3ttQJVAGRYcK146j/FfnZBtL
	Um8woHe6sN7d9esa8sd5tTCvyV77s6pGH4gVikZUcdt1l7t/aaLAaIGAWEY+ke1I
	RGAclAG1M3nRRe+6YCI2F2uoAd8rbCtnVFwu3XgrrwA36DuHOQ2oIGy6N4aFf/fF
	GcfOHkFKWE859PAUQWMe3xUUQ7FLwcVhKvL2pce3Fy9CrCx1w0ATTLBcpNKpZISW
	Otn4kHoW29XF+meY7kf49eOEjIGwHuPOnL+bQHwr7S+5/SsAkhOvCGDL2vbbw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vm9m5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 13:12:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGSQ7SQN+iE0IHnfg+w9pkefXZXQ5PMjSdgzZwLT563v5i38/rTgkY3L41MBv+z2xVfpjpYPTywza33G4EeNJHJUynA8HedVK91692CptxPDHkcPiFMmW+8GV6Wbm88t+TUNcM43lm6aV5Hw94Hs4xQZWrvWjHwIQ3kRDDD1BQDI5aqJCfglHZYFutmhePZYj1LvDtlQHJ/6RKnMNFS/cOcjLgYCoJetbqxev/NasGbMvC4utR76A8+eInq0qbfM9HQ3lVuTWfyS9QQdPZcSxUkcZ6ZvMI+h4Mox1PXZ19P10Zs2/LPUsHSf5DHL7+zGdrz8IfXazTP41Ionfhr0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPu8ktWebL3sC8XGmBuY9yyD0itLKAdJYyIk4x1Op34=;
 b=Zn1NyRCGUM1ZS5e24qxIM0Rk8H0bcLzcMYMJ8KZpu8djh/ReEqVASG1leOfq9S9PSzBPZTVdUQ93WuEKnYonLy4Q3p/OwdfH/IGke8oOkSfy8hYatBhwKeyQ6HBxWM6Y2Cbhn0Q2HgArY5F1nZftu8QylpvYGLky+wzCZoWjrVUvQBUw5+vdu3GuvkyavFXZpZb4u1vah27cLNrrsm3MHRkI4KxmnffQpq2t37abXxvRKGZ/7McQTRgzfcJTmuzJYHAG9pSpCmE6ZL1+3+t4i/dYOhQYpnjMbh8WuLC0sILzB0aVXBvixckJ2GW4vl8VSCJ8t7hIM8ImDs7h+0CRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 13:12:27 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 13:12:27 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com,
        hemanth.250302@gmail.com
Subject: [PATCH v2] llvm/clang: Upgrade to 21.1.8 release
Date: Wed, 24 Dec 2025 05:12:03 -0800
Message-ID: <20251224131203.2579892-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:40::43) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA3PR11MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b737372-3aca-4031-5c55-08de42ee1635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GEsyWQ0TEGCS6m6NOo1RHflmzbONI/Wus1XP2boKDivLxHomkTHUzNsFvJVb?=
 =?us-ascii?Q?2XljEgEKdHLKTNwauOLOCnbuHI5bDRhqoJJszshuuzKl1GmXDt57Ewmdq1sF?=
 =?us-ascii?Q?HG+/g1kPJn0sWAZiQ4pMuHxFrn4VLAXNRHp+zm63klfmhkUUJJmVqtBC4Qrq?=
 =?us-ascii?Q?Zp6kJx8Ldnk5lXRuWLC1XLbXEeMg7rXks7V99XMyPQGzeDs1zq5C7NBLWipv?=
 =?us-ascii?Q?QoyvmjAmWX+Mj9wlASP7Wyhkxca7XzyJ9C5DIaq3Te6hQ90MzYGdwr9HrT1J?=
 =?us-ascii?Q?Pm/bGvYgWuWRhBhjRDGZgl4aL1Aq4XBStUQPj7dqoOoVAdIPZMxeMZAh+ksK?=
 =?us-ascii?Q?AhA1p8dHcHEWdphaIPLeUHEIp9APwag2olwiej9AcguIq4U8BYwwonIGbsNG?=
 =?us-ascii?Q?bjEOEmlScjl3fEcwVWMO7ozHRM++GY/A3cgQEAoxxJOTIprjy0NJHBaeBdMl?=
 =?us-ascii?Q?WsNOXdJPeExjR2QjKwoysH4BmgcbVgPdInc9b3yj35iczFaG2956SypVGEkW?=
 =?us-ascii?Q?20FqGMkmA26J5aZRJb3l7ZakXQteEI8vu2dT6pjXjIHyvcEUtpks5p20W4D3?=
 =?us-ascii?Q?S498n/WlVDz317HXuidaCTRq+/yKKFmMfQA4v0470apaM9B6qZx+6pNoBSN0?=
 =?us-ascii?Q?qHoMZHXoEXIOqYlj7Xm/X34l3k3mu3P+5BbsrZGWSgoBnsHXwrImqnpSYl8r?=
 =?us-ascii?Q?smXf2SFMMaxdlKo3Omj100P8TgFW+kSob4lhEl/vOPWnWePxskXiyw62h+zw?=
 =?us-ascii?Q?tU8axsNOASZJso5tai8yH6obdThNAABvFjMolefNzCxLreRJUddloNu7TcJQ?=
 =?us-ascii?Q?kV8ssrtvL46Q12r76uhtkk1e3nd8rnMvWf6JJJxMgmz+aGN5DRRPgFUv65fP?=
 =?us-ascii?Q?dtw9V6u6oEA7fwOoHi2Q/muf36ADeRGy9xMKZC7Q/okNg8tGCBTLeh8vrP5a?=
 =?us-ascii?Q?h2MBpZnws+INbi+Ruj1zZfUrZobycOr9URWlibakxZ+DZAu+BmjkWVf3svZ+?=
 =?us-ascii?Q?kltreufsKb6x6XXUDW+fQfZsGdHbAbKNu19+fZWMirrdiSppsICFZE0QxlnN?=
 =?us-ascii?Q?ueXiU4vKoIAOYaiBSYn6KEOTC8M4rEvIAUvSMedb5BKYr5h1qwu7cTabhlgd?=
 =?us-ascii?Q?s9Y7OkQghV23Gdfu8eHh4JwQ7hPGevuYUOUrF1ednj1RyMM1i7wG1i+9+rdC?=
 =?us-ascii?Q?VWB0SiMUksS349bdQMFdMyU3WWpDrwrhzYCAvgw5sL0+2ow2olZn1qh1hOGa?=
 =?us-ascii?Q?7W0+6X8gi+bzx6zweY/ZE37f7/I6STE7xDTKxYkgFy9KQ9nd1uRwDk3++9OP?=
 =?us-ascii?Q?lNqROfzBSoER+StMXVepo72qUpjuFx2u7dG8Gr0RYMGIAwUKW/QbV3PhYyr6?=
 =?us-ascii?Q?rJll/hzC4igGbMolxdL3VPL3A3OQprmJYkUZDIleHKRUn7y3+Wc8RYGirSdb?=
 =?us-ascii?Q?XLzqSmois85cOxc5K9pvTPEvwcSozoS3VLn7oooqZEdyq1a47DDSm6AluAyk?=
 =?us-ascii?Q?V2ay7hGXOPigLWdULKZ4I65JwpZEQrVkK9Pf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H6JAZuSdJ+udBzysUPycLhiX3xu5gBNaGXhoN950P1Ts0r89tSv9P6zF+lyA?=
 =?us-ascii?Q?Qgq+C7KFcTh5iAo6+iti5Kq5i7M+dSF14hpGNGTQvr7y1/7BRXDsLRFJhPkY?=
 =?us-ascii?Q?SmYke7T+4col8Qdu4J59izvjWyf4Td9sgBvEzJKglyfgt4MyM8fDukjjz632?=
 =?us-ascii?Q?TSK3lKUooweYbt3qWbZdzR/UUie5Ksam8narHhhmZ2NYo2uGHxUq4PI3h4h5?=
 =?us-ascii?Q?n1+WKQ9fdlPsnhqm7nPNWK06BMo1MaqbjG5i6wqJKDPA2pmnLhzH8HmsQWHe?=
 =?us-ascii?Q?YPRiUBUz5+Qk+aup6K3O12to7K8E5CNOVV6RDiz1UK8G63A+/WBwTXmVj/JZ?=
 =?us-ascii?Q?3qM5Ca5jFFL35SoFYnPJ8/EN+3vmfYPmr99vXDqHbtlyawRsZFjUMZOMhNWT?=
 =?us-ascii?Q?aciVFyq3RFxtmNklR7VLffTLTzRrz+ci6cr1wDHbklZtDifOmrkA7QqY7WpF?=
 =?us-ascii?Q?608j0IBOdkWSA9eoitiwz62HIM/m1oAespfHvpLCkrvX535NvElzgMN1Y7df?=
 =?us-ascii?Q?ZMg91ssIp4zwRZtgsWlHmOyvwLWjumXUfSOEE1tyl78oQBKMy48fwIarg1lS?=
 =?us-ascii?Q?Wy70H/UN91n7ynQQKgLLmEEWJtW/v5tf8jABQONTOiR/uQRxokVUUwCCLm9s?=
 =?us-ascii?Q?WWTPtgVm2I806rFyZc/N2yUt4WJYJFq0LseY1nE1Jifdt7Le4Lhu/ECEkdQ5?=
 =?us-ascii?Q?mIP7uiUA81A1Xl2SsPNft7APpx0zeVxpNpFIvDoB8vwJB6XZ+Llo31DS3ciC?=
 =?us-ascii?Q?TaO9fE490ZPXiK5za1UTs6f+wIgiYrNnMcHih4yUObuLKRScl4+RYv/wCA3G?=
 =?us-ascii?Q?AjttgDAAgyVlOQwn/HCiMW7K21TbYu1jXIulcGKEFOwgwk2gnlZHFzrsDay6?=
 =?us-ascii?Q?wl5DQODUe4lM1SGIKHppzikHKgp0cyQKYSiNuSjzJCyCq0jfR8HoVEiehGAg?=
 =?us-ascii?Q?E6+F85ts9Icc/S+OpjIP7xPzpdcNQvDvwrC61Zwex42WhBWvEOmkGdHP8t04?=
 =?us-ascii?Q?ctvV7CnC2gkB1ofMxU8mnz+IjHlMa1Z9S3uT84x7msBGP3bqrOV5KbMJRAq+?=
 =?us-ascii?Q?gRi3t/WaX0roPaocwiAWSBZYSu40hOcUgK9GMy74EK/G+fN7bPvMWf10TxBf?=
 =?us-ascii?Q?725x9zGKCi/Jj5PEbcdtSEMtYVIT0rydrXPV1NEGUitXw4GbvPjn8S/4wBHW?=
 =?us-ascii?Q?coCuaDFm2S+bDuOLeI5koOSMl96MhMWEq6ibnL4YQ6TDmeS11KoHtlk/Dnd1?=
 =?us-ascii?Q?1IfNgDBFwHLI/8mHAOqAi+k7f97u1pkMJCt59zV8qcd+xwGVaxYCionSbeXT?=
 =?us-ascii?Q?k5Vzu74M/P7822Lf6Ty079pKNYVmP6wqnOCPS7HwVb5yya//Mde++bOy/Y2X?=
 =?us-ascii?Q?lvTK1zDaCBAm0AQFEmoczn9HHrXj1dJzWbyZLxDAI1OBS/HLVFul282dwtET?=
 =?us-ascii?Q?fVFPTCY5daOCKf3vbjRRYzb5tXNV1BXCge4h9nWTJ/Q9GBxhInqSdsPae+EU?=
 =?us-ascii?Q?qfiAdslVC48AWUHl+mzIIaq8xhKsLQromgyTBuLk/CDEccTWhZd8GDgA3vep?=
 =?us-ascii?Q?DVRqjp0Rj+hfNJRZ2t/ex90a8P4y50hRXytDPgdw5+YCw9F/Q8h4QWkCgrcp?=
 =?us-ascii?Q?1chQhJd9w7uBqj7+D3HyRv2bdCaWW+gAD9jUcek44chxK9YTXMw1f+g08jLp?=
 =?us-ascii?Q?9pKj1DnP3SLDjy99nmCybDR1c+t/hdBOE8cuosoLdeXhu1ai3vuD4GpiFs6H?=
 =?us-ascii?Q?kSWZhmJG/Lp9US3A5LdcevooFBta5Ls=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b737372-3aca-4031-5c55-08de42ee1635
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 13:12:27.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihJD2I/VfNOZE2XneZxkxWqV7mOSPGYspmg3lnjPwFX62pusj/qUOPGdZyer/IQKqzqG2gxZt0UhYhis+27sBJ0PmwcucPI3nq94/rdvx54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: K1Z-QhxQeW0BMU-TQyFvn1j9DULpXonS
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694be6bd cx=c_pps
 a=EtrKi/+kAVY73poqiPL3VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=iaXroG8gysCYRiqWtmUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: B-Xf2jM4lRPrf74NeHcv3eeofGeT3xZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExNSBTYWx0ZWRfX2g6CmodGXTzR
 hKeC0e9qOw1ELfCo5uUbCx/N13TB4CSkYvsldSzzV8NjPXI0ewqStumk6IJXyAN8bwAGqW3/vi0
 ZX9xvKbW4Co6MY6emTZ2VvMBS+4n1eIkz82JmtQta57eVrN+rEyvRJGaLQx8uvwDV0Ai9DND8Ha
 LpDJneipbe2bqOF3dJKPO6UJttkqEAZwDnXzkzFdE8ozaWbd7rBqYU0NwxKwf9LGbjqoT4Gqsiu
 JrJQ4BdLI2pqTZtmn6Ua0g48JNOuvPgmGav1I+61FcsTOOcI+rNDXvBSPw0I+xNEcUdRY1nxq7S
 hIxMdrS49iVdi+kjtZ/yST81vgw02V4X1u2N+Nc50Gove1B6djGsDcuqG8RnHmkCVYBvXU3/14H
 2JhWogt4KuY4UxmWPd11t5YuuAS0zBXCNqykrz5J3R5Yxq5RC7munwl8PsGfwyD1gKdyxDSi22f
 0nxekUq0s4htRuY3EpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 13:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228532

From: HemanthKumar M D <hemanth.250302@gmail.com>

Brings following bugfixes on top of 21.1.7

2078da43e25a (HEAD, tag: llvmorg-21.1.8, origin/release/21.x) [Github] Remove use of setup-windows and install-ninja in llvm tests
b6360d3bc7a9 [Github] Remove install-ninja/setup-windows
7eb4bfe053d6 [ExtractAPI] Format typedef params correctly (#171516)
51e5074676d4 [compiler-rt][sanitizer] fix i386 build for Haiku (#171075)
d2e835bd4638 [SelectOptimize] Fix incorrect -1 immediate for large integers (#170860)
4b24e73d34ca [WebAssembly] Remove FAKE_USEs before ExplicitLocals (#160768)
4582a800c588 release/21.x: [clang-format] Fix a regression in annotating star before lambda (#170969)
a5658809ac4a [clang-format] Fix a crash in AlignArrayOfStructures (#167099)
94c40c61c1ce [clang-format] Don't swap `(const override)` with QAS_Right (#167191)
b845b4cd771e [rtsan] Handle attributed IR function declarations (#169577)
f68f64eb8130 Bump version to 21.1.8

Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b531cd1063..8b25772942 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.7 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.8 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index ae0caa6f01..1f77400dd4 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "7"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index e852f03c1e..1e70e9c64b 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "e5b65fd79c95c343bb584127114cb2d252306c1ada1e057899b6aacdd445899e"
+SRC_URI[sha256sum] = "4633a23617fa31a3ea51242586ea7fb1da7140e426bd62fc164261fe036aa142"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


