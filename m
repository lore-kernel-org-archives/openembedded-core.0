Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F266AC5518E
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 10:03:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35505.1771581830028510018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 02:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bkTB/XJ6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6511fbdeb3=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K9pGeW2445370
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:03:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=D8MBlChNSzQLqedg6d5O
	4350Ilpxut9pB7rousZLmFE=; b=bkTB/XJ6N+PsoPodvJeLWPL4j96b4MuCpjqg
	iO3NOlKw28T5bp61itO8ccRDi2ovc71eSvkPYm18QN/PCHy3ppXU9Ir2bfhjGNPZ
	TIxyiG0yAZSthca8kcrJ4/V2HjYy2w3oijN5nxsfzedbtaRZ4Wpo7DeO5CNWoAdR
	kNQZSZ0upkZ9Zq4REBXc5L/lyjJF/Y15maqSb7JQ6i+0tzbQkRr74gAEWDykyj4U
	612sV2DsRgN4jR7PUPzUCDlb+Jg15Ui7gVy7OVhxqqGLSdXxCX/po5yb9QcLgMFP
	iuZelV9DmkhkBa87nLoDdwrEfGdX/mzVafkG9d5xsqB/RfYKpQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuahjsc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:03:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX+jZaMf0sVkOyQqYecTaVZXxglAmmKxCY+eUazlbjFpb8KYFsuCdcaqow6mOUadNM9fWAsYDvsQ/RtZ2XLPAs4qqu2u6nEvLme+KS6Zk4Bk1Q/KBb1o73h85iJ72t371gHqudMwFb7OaPF05zbvoTKWRqzjOMe142e9ggksK8GMINw4Wl4/PfA12HZNW7Cm5sZwLAV/PzESn52npvDRtgOBvw7Tb/Z5o8o2ZSe2zXyNG/YcvEVfM2mQAo0F0eMVjeteizkq2lDIU43/RJV8DRCpH+NLQt0hXcuuDR30WotAp77C7KwYqjgkSE27r6Cyj2niP8jUrvPv3zi/CWIcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8MBlChNSzQLqedg6d5O4350Ilpxut9pB7rousZLmFE=;
 b=gjet74pEgsyB+Z/0tNZcDBv6cI+9ef9oKXyprm5EZYQKK0xUwVjUy1UYc34e4X1c4yGMIGeeEyQ2l1Ek64UBtvOTi78jLJg8S3dbJuebNiSfNlNE/SIET3AUJkVvb5FaYrldBI+MvHALv4KoijvKGhNFc/9ZBO5Qef6vMDRm2nZUtcsbI9SmYzQDof4FpFNC26BJd8Gbj3Dd9uG9Dy8CpatMN4YRJWsoTIimjaPBrXzL4M479w+faOH2VYC7JVaEwa/CNIBksdWiiKiuU4lQBfWA1a2GjIebq/EzjSLFn6RozlatVA+rHEyYjCCMG+DgUVK/WH74Mp0llay8SqFsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 10:03:47 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 10:03:47 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] wic/engine: error on old host debugfs for standalone directory copy
Date: Fri, 20 Feb 2026 12:03:30 +0200
Message-Id: <20260220100331.211130-1-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0070.eurprd02.prod.outlook.com
 (2603:10a6:802:14::41) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|SA2PR11MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fa5490-3df6-4d23-776e-08de706756bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BWddhVtePYyuns4dPuLaG8Tppqin5Wz4/EM4+8EBQxfd2gf69FlJI9+tkmHg?=
 =?us-ascii?Q?EB6wkVgfA9zJO91qSgvjJc4paTTTkrLG6ttskzAoSMbVDUGpJ2S7jOqsWEnw?=
 =?us-ascii?Q?V3h88lYzC9gP40NJYW/qf8ASZE3VVc/8fUd0h9R3EJJ1GiiENDverpeUFlFf?=
 =?us-ascii?Q?kolBP9w0OUJ2OJrGDqeKJrzWYdb2njkyUxEy5lOjgTUqGSqIFUyqWmwfzLMh?=
 =?us-ascii?Q?kx8uSZ8576qL7V/Ay9TbsVawH+1b0m7NyT4d56qBJm08Ubutnl85Y/eoWRgY?=
 =?us-ascii?Q?doG3B/v/lKYeLtp7GDABcglor/JCFsOu5npn+FF5DLPc/pASa9LqzdSD9BNn?=
 =?us-ascii?Q?ZMrtYHwrPpQJjHmIyRZYrRKzjQZd27kJTjDemCFi1TsIB4BNq6elFt5YiEVg?=
 =?us-ascii?Q?h8YoItmkuR0XFTn2mKhU0uY99Bd+tJa6MSjdzfdAlMuTP5PIiHD64ozu8JUh?=
 =?us-ascii?Q?+9ccdfNBcg7djMPBBbf1xtXS6khIi1av+E0Q9jtzSTe8LFsQq2mccVp3jS6E?=
 =?us-ascii?Q?2j44kH9RV7sgH/4r5wIHaHbZHZDsDwp1nIVfuTzhTXfy2MVIH6U8uhayLFJT?=
 =?us-ascii?Q?ozIFXv4PrbGgOieMocM8ADNc9s2FQoO20qC+bDWh+4QstVjSkwWGVwr3hxDI?=
 =?us-ascii?Q?qYCum26olUW8rLcf9/m2kHa9s1dBnfucNNvHN+6OzdRkMUkKG2dCTyR0B9UG?=
 =?us-ascii?Q?fMK65exra2vntZYUTnP4y+bss4oOMsHD68P5tOvILEV712gC2sUjvp1H64vJ?=
 =?us-ascii?Q?4bMVEzOkacynzzWUPOa47m9lqM83e5dMhtVhDgWdZN6f+UXadFdVJMslJHK9?=
 =?us-ascii?Q?9uvptj13g3seHuqAa+Ky0HcS245x3quVKsQNF510x4nTNdwQgikC718mXXFj?=
 =?us-ascii?Q?MDTmcOshGWm3ZUxtCFzsDskV6IPfbRmsaCxJF1TAuYLl5bI0qogDcKqpW6mO?=
 =?us-ascii?Q?8LKzZlF6cyS+GzSV+TEFYBOxuZk6CE6PuzPDLrxKT2gCWNBb2rkTV5F3UV/+?=
 =?us-ascii?Q?otDZmCWm/Sb/l6Ga0OATmeb38MN/akOxsatjs8T4UZUlg058f5EGO++4qRPC?=
 =?us-ascii?Q?uNLIhTRUcgKJSjG/JYKXARCEC0ag6sJZRenJx5wbwi22AZLiU8WBtMRrlR3n?=
 =?us-ascii?Q?r4PrGX0sD+12FvDElCdbL3736dhfoSt4kAoF8akyNIo6MDSwL+ALVs78VHtw?=
 =?us-ascii?Q?ZOdIDklEenXlwe9+3vI6Yj0GXrofjylZ1EDIZXfHKRScOqXC0TF4R9tKtOcp?=
 =?us-ascii?Q?MZAOEovDq5O+oSVq+skXIY5LISHPiJ+0BCsMBctEfN0uW24ebyLYD9zYPQ34?=
 =?us-ascii?Q?TsKiMLR80pZE8nGccHZtmUjV53hLot4pTTiKZsrvxjeG41+PpoA193G3er58?=
 =?us-ascii?Q?kxGJ5X0JpsI0PEyn3ErIOiky+IXbab6eHaGGyjq1k77LUIgX4OxzuiU7zOqn?=
 =?us-ascii?Q?oeJnj4/YzngUHipax/i+jzEW9MLc6rCe7ka6ROgJiXHA1uTqSwOI1zcFwMaX?=
 =?us-ascii?Q?ACGgUM1VLwdNv6MGOqsBNh+nlS3W/A3g0Jcra6UlCWHCMg4IW03Ry+6pnpIN?=
 =?us-ascii?Q?YKqU0emr6rGd5wLq+zKqw2ILhicnGjH0AqF7tj8bsXaAycHzUaiswYv0PsEn?=
 =?us-ascii?Q?QdU9i1aewvGE6JM7D0sgHgY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uVRebR+cA3goMjeONVpvaBghBM3mf1D8Z42qXIRPDafUMj2FNHkpP73Yxi0n?=
 =?us-ascii?Q?JpyPwpyUNckSAhqRd6ZjMavxvilt2lrKva6DVWP4FeYsvYXFEZOdNV/pdnLK?=
 =?us-ascii?Q?7AYmTMbRjQia3F7I90n8LpmGYxcxun3mXhOA683gh0/QOI8BlVlOEaWQ0wzi?=
 =?us-ascii?Q?8WeiUkPDXwzvbX0FFu5oz24lXL7PBtPkNZwKFfQq1XCuUy2dn6DS9osbQlmu?=
 =?us-ascii?Q?uWcnrZDsV/ASVCNJ3itbB0x67NvtOehlZ3FO5WPiN6/BMDZf9PLxD+dOuXRx?=
 =?us-ascii?Q?cJofpvoUEjxP8ch7xTVDLDcc06L1YEHqpkkxBJeMf4OfFi5/M2WSBBWnBg99?=
 =?us-ascii?Q?3MsUZGcb3fv3BTMiTwDlmiAuhLM8+g5eksb7HYVq5Z3n//CLnalHl552V+lU?=
 =?us-ascii?Q?Rmez1dusktAF7heVBUIMxNcTH9mUCkVGQEzzrdCe7CIcRflFAZ1FAUobwZkt?=
 =?us-ascii?Q?A3tjgdwm7I9LzLxzHZKFIui1kXwvppneLc9OUDqpMoNSOZG1LUBaROByPpCE?=
 =?us-ascii?Q?tGtUAwGNlN9M3oHM1QpZcvk4Vp28hSFbyRQedWT/B41zTCGs64sD45HQ3ZZo?=
 =?us-ascii?Q?cGdUzafwLl6OhIqdW+83TCzKUrk2xGDRlP+6oCn5qQaZBRt4+9BgKuWKaYLa?=
 =?us-ascii?Q?DEvxm6vlXbVM7N+jtfttZ2r5wEIiJ51TNG3h8xrikf5eXcms4j3Yh3Rk5QT4?=
 =?us-ascii?Q?olPv7SMEVabnPqPiVF8SD9DAUjEZ6vrK7K4deEu31Vbrs3GGp0zaqdkcH6lv?=
 =?us-ascii?Q?KLd0A3hBLBMZUeUrxdg6ZE2VUva5zTAeLKwKdvjvUo50AWtRPTVtfDHL0ST+?=
 =?us-ascii?Q?bSTHOU/CwBEEw0qi6af1IsGVjEZEAVQmpuVFVs+lSDXkwdFmGFKqU26sX+U2?=
 =?us-ascii?Q?TgzcKgvslu1njOOjNTul0IEY7mJ1q6NWa+bnR/6M3WNaR9UAAuQfcM3QExeL?=
 =?us-ascii?Q?0OgKE7hxt7SPwPQ8np39dYyLLV/7Vk++BJVu5fB4Vs3YnrQAVVV6Oix6iMud?=
 =?us-ascii?Q?C+KjNdBhMtIJTHiBC4TIbjNtsudehsa1pEI++NO/nCICWKHCY1zr+i2s9lQ8?=
 =?us-ascii?Q?sZUXdlQmlldIzzLZWhl80erdP6pvTkYSy9zfXl1l+YXj462oX2Jw37+2QudE?=
 =?us-ascii?Q?c4c5F54Lond5/onlAsDTJ9hTELgBoD6kcnbuJPQ+VKgnQNT8ru9WWQ7ADMyi?=
 =?us-ascii?Q?gjrI/gSzcduklP8Ct3wB9AWVjXv7VJbo+o6PBsU1Ts6SuseRBk7ADWpLXzHG?=
 =?us-ascii?Q?LOASAa2k7VF+7PPxy67oY2S0Xxum0LPfTxxi8WHbOHiylbDjWYLYrqw3aYRB?=
 =?us-ascii?Q?5MjxTfiUfE738HMWoltSatJorFk7nA/FQpj8QSZZ+C5huFFKOmdjSTCLLp4j?=
 =?us-ascii?Q?07a1csVHIeiDlI65+KtAUlTzFSavhCtM2E1P0JTpPBonNgLCHAwvrA7cPrhD?=
 =?us-ascii?Q?lNI49h3wDBJ6OPyj4XHtcIDj24KcXZSSH6p97r8HeJhZmWbVoLMP4UYijzFD?=
 =?us-ascii?Q?GMXYZzt33pfGPpKsw9UDcWQJubCNWuZnWxV8Y87CskZkY9jOQ5v163awO2lk?=
 =?us-ascii?Q?M82SVg3/iC+Ntem5PhbS6NleJ6vbLW1yFNbnEMWHsD22LdOZRR8m6SX+MrB4?=
 =?us-ascii?Q?1NcMqE7wnq8Uv6CpMsES1JCr1qmnryD60Fc+8V0fau/GHzKvT/nJ4maxK6Mt?=
 =?us-ascii?Q?p93c6txL43yaHCK2Tg49EEKizR52op6lKmXpFPxkxwDRBMMv39/7KewXQovf?=
 =?us-ascii?Q?um4TOWWX8p4yWV0yqhdyWYXuJP+d21U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fa5490-3df6-4d23-776e-08de706756bf
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:03:47.4440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKn2fZfKbsCXcBdrULB+Ry2oXaRTxLEQec0Uzm5PYMYMDGQFU5kaVPMSjyttwJOR7flrt8+G8Aeh8t4hu34ToPczjZco0ZyNAACuzeoh6eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=69983185 cx=c_pps
 a=uKk6FyUS+xKIvFCPM6xM7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=eUBKwln-REtu_DbdvHUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: wI0qxtftrZPdJYh3qLLBKpVW3pEE6JJx
X-Proofpoint-ORIG-GUID: wI0qxtftrZPdJYh3qLLBKpVW3pEE6JJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NyBTYWx0ZWRfXxI33/VFfueUo
 eD0QFZna05Xg8K3mClZ9HSAGQm4hnpF8cUsWynyApUg046/EmlqOD3+KYHVLebEGKsjt+OYCX7x
 3TFxJ47qlTRQB9DDZBt0PK3IQnjWz9utsWSjARKlyz6Skz8QjosXbiU6URGGoVAfT47qBWx8k5L
 6Sj3Yx3TdH7rzZruLhTSxxiQDSJ44UI2DhQBnZeHOUAYw07/sUy+WORNmd6PspPXQNcjB5NL0c/
 X0G/2wlRQnjUSUKufDLNqauuThq5+Gx6DzlkIDn7AN0dq/X5pnYahDkKzy7AnpKJqg7PH4Qs4IK
 a2c+/x1gM1DXM4ldDmwopdHKt/C0GU7KhZ+tczRBEjt8zSntiYPoS0iznYhaBG5yZjjn/csOIVW
 pinTj4CKmfCVPMs+Wz6T4fE/G2KrFd110O2TUgWS4lQm5nMwvABk0uaSyDL3NyGlgp9xDrqaDBU
 furhRX8nmpbi1MVPy0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602200087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 10:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231504

When wic is used in standalone mode, it relies on host tools such as
debugfs. For directory host->image copies into ext* partitions, wic
uses scripted debugfs "-f" input with multiple mkdir/write commands.

Older host debugfs versions (< 1.46.5) may behave unreliably in this
mode and can silently miss files. This does not affect builds using
debugfs from OE where the version is known to be sufficiently new.

Add a debugfs version check and emit an error when an older host
debugfs is detected. The error is shown once per run and halts execution.

Changes in v2:
- adjust the last working debugfs version to 1.46.5

Changes in v3:
- switch debugfs check from warning to error

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 565a0db38a..8ca8ed0dbd 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -220,6 +220,34 @@ def wic_list(args, scripts_path):
 
     return False
 
+_DEBUGFS_VERSION = None
+
+def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
+    global _DEBUGFS_VERSION
+
+    if _DEBUGFS_VERSION is None:
+        out = ""
+        for flag in ("-V", "-v"):
+            try:
+                out = exec_cmd(f"{debugfs_path} {flag}")
+                break
+            except Exception:
+                continue
+
+        import re
+        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
+        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
+
+    ver = _DEBUGFS_VERSION
+
+    if ver is not None and ver < min_ver:
+        raise WicError(
+            "Sorry, debugfs 1.46.5 or later is required for this script. "
+            "Older versions of debugfs can make directory copies into ext* partitions "
+            "via scripted debugfs (-f) unreliable or broken. Detected version: %s"
+            % (".".join(map(str, ver)) if ver else "unknown")
+        )
+
 
 class Disk:
     def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
@@ -334,6 +362,7 @@ class Disk:
         if self.partitions[pnum].fstype.startswith('ext'):
             if isinstance(src, str): # host to image case
                 if os.path.isdir(src):
+                    debugfs_version_check(self.debugfs)
                     base = os.path.abspath(src)
                     base_parent = os.path.dirname(base)
                     cmds = []
-- 
2.25.1


