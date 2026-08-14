Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557C1C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 15:31:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15681.1786721505972061412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 08:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p+aBD3l/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26865f4484=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDwE7c3789430
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 15:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=sdO6cR3wY
	bKMrOFmZ5rbQ/2ZIZGu3rOGtM2OMBhzp0A=; b=p+aBD3l/2CHfosunbtmmUDuXZ
	sx8OislUA+3GQaoOo1ZQoHIc2UWPO0esUpPLaUtoWtGGQyrb0yaLezIMiD4vfCki
	mjMt4zgJ16lWZIIt1Nlj+dGdYNi5JN1XC0CeJkkf3kWHpfQb1z16nTb040HSYAVG
	ZAxNjaFLVEpEEBeFzt98lNJOWWhL7FLfwZh49wYNw0WRlZm0sU1+LylR7kOm2cDO
	YshqkjTAiykFxhUdF5JBO5/wFveZfIO0EQEq86yhGmHbVoix6YwAFewR4031v766
	7QaIIicYzh5iczpqNmwiEQb3Do9+2dM5iT9yAEOopXznbv+jXaEgyWVR2AnxQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023118.outbound.protection.outlook.com [40.107.201.118])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwye7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 15:31:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6otYG2YzHAN90TMcMrewAzoJLLIyS6kWTW3FrNoVO2rH2AStP40uqLOEUai/qyBKkQGOKmvwnsvlEeS2mthwqnjkEnllDIyNI6ANdwouzsUPjZ0MgMobhTy/w31aGYyq/Wt0lSW1LbX3NBXg78y6foI7QZrWL01/q28WN9DEuEmzd7tILj0uBxzBUavl9mpAEKQdW71D9XXvZPeUOVrg3o3c15ASLXQ6Xm1Ol1nxEBpdirZ+FRbjtjIInQpTU4SQduHy3Y6IOH8oM/By0/u3Frxx2uaSeRLQTB9ABOqVom/mO0FmcayAwMd5/pg6PNCCk39UYdg4aJ79xEoQirqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdO6cR3wYbKMrOFmZ5rbQ/2ZIZGu3rOGtM2OMBhzp0A=;
 b=UdcmYRk96aXIBj5Y/Go4pHlF1meGg544krcvXXDY2UUoyyYKtlYuO8H/GYJ+Cj8/nfPva9i86fxf9DqkqlTxZl18mrCI5SxJ2tz2XlyeqhGH1F3NN6iUzRIMoKH0CFTqQCe8h26k7OiVwPFngrQ31lkQ6TZTbvhoQmZMlS/1VJ5K5NjzJEn9XrwJhXl+K4k/EmyHXQxwJC5qH1ut9DCx6cPBDz+QxhOSNahY7h0yGFF2MbhwnKtrRr84pSobOMMkcKdIedYy1nDTDrhEaJFLZK+H5iEjgNSrrKWJMy6UIm8enafOuP4N71M5/rwGewumHrAV9Mu5IZCHcuNqfwSyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 15:31:40 +0000
Received: from CYYPR11MB8405.namprd11.prod.outlook.com
 ([fe80::f9cd:d294:a6c5:5c45]) by CYYPR11MB8405.namprd11.prod.outlook.com
 ([fe80::f9cd:d294:a6c5:5c45%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 15:31:40 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [OE-core][wrynose][PATCH] perl: upgrade 5.42.0 -> 5.44.0
Date: Fri, 14 Aug 2026 21:00:52 +0530
Message-Id: <20260814153052.2863858-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0091.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::12) To CYYPR11MB8405.namprd11.prod.outlook.com
 (2603:10b6:930:c6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8405:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 94da2ff4-6f1c-4ffc-cbdd-08defa192321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|12006099003|18002099003|56012099006|3023799007|13003099007|6133799003|11063799006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	yQsHHJHVEzohDcRxocweLCni1CPTF9uo1bBmu10oUlPSpFMbKVXR7TRWPr9VScleKzwbHxeFIhGn9C9WZWm0huYt6rpYUOMTO8KQhqkJzo36kgJV33pxZaLiIrmj4oIV91zFZKyj/OInOmzSy5bvR7tA2bjIGI/FHbNls7rVEBZFKYdresHhQNfxHh13labgmcPO88plYQMjlvgj+Rh1Jv/tllpfmQWdP2t4gacPXmUYHoBWft7Hnr6yzqpdX0YHAXIDaQZp+IluUWc4s0jIXqtKmBi9uaxjSaJ1+jQ6S6FdgCs5FNl3Q6W1NR/J63Y+lKcoe74oBn99UWnbBChl6RVCSgftL58bVcq0LiW/xRUyznjltKi2Y0IjtnlhEPAH6USENGvz5cpgHEy8qk+WIq/lbKGPCC3upLCnYCSJ0wKNxgEGKpEU2Ua/H1m8M4cLSaAeEkFi7kbBn4cCQ8WgnckssU+XGtvhVjyetccV45xxD94gelKnuyIbqmY9UoJ4IgmqmPUKFq3bgwAndr4SLLQ3ryyMzIqxAuwuwQkogOuIa73jQ5mviGs2eqDKqCKljekSrfqRJNovXqOL/zbzwKNM4EB+gopdd2aQe2ZtWLjuRW446cLcZ6HtAsx4XVQXGjgbh72qVJjXttsKe+4r4cjAqmXPoPqBLWJ2foQ9dCFQ1/KVi5T6abYfgW7LcV6s4XMallNOujP3OnMfcAGCjNnGMELni5mkR8jVOxDW81A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8405.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(12006099003)(18002099003)(56012099006)(3023799007)(13003099007)(6133799003)(11063799006)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zd22FW4RYIYkfz6XoyJmMPr7cjAeuo7zlLYUjHVmIwf3ExeWA5NvnRhguF8I?=
 =?us-ascii?Q?f0c/kbm6Ag5cwIlhKQy90QYm5FJkUmfp6pGGriyMj5B67KQgz9nptZKDndMX?=
 =?us-ascii?Q?G79UMpjnd5LSTtvcllM5cd0l7SBHG9VsSHgTW29XpR1CaVrtGSEujZ0hw06w?=
 =?us-ascii?Q?v8gljosYCDI1A2q6uxXCMrznZ7EEMZQoIwkflBz+fYF6ZETfJdLGH8p3OAtk?=
 =?us-ascii?Q?x8MM/cbTFtI5kbEQGhjerqtU/lphHd4zv//7aYJgb1tjYfvSyV50ROeC0HvL?=
 =?us-ascii?Q?gbXyTQsTMEGphpoSNmD0JWuLQjvZp+Ri0wUBcmndpxB2wLrRDCNsqAQQQ0UO?=
 =?us-ascii?Q?rPDgfdx7I3TTCsOQl6H5Mgd5j+zxaFehraXc6Z16doEj4qrvDkk10F9Z8b2F?=
 =?us-ascii?Q?qsnI7j+DRtChRd1UeARiyW8Xj/wKmf6XgS+ML2zFvFzr9uADajFLnEJJkdAx?=
 =?us-ascii?Q?PLr6yQzrsxPppszkrrbknNO6j385CQhCZzYncm/JRu5VuSJhwCq9xMguugdM?=
 =?us-ascii?Q?yhpMpu/r06AV5oDLPS9l7gL0R4UkN6zJ5Q4e6M50hH9gseRp7H039Dqw53AJ?=
 =?us-ascii?Q?invlHc94ph85pbNVatBnAdQAaujZmWviDLlDVbyMituUt8wIMt6BCjbOUlHp?=
 =?us-ascii?Q?aLHiusqVQYnkhpZE2PN3XsDz34fQC4ix3dUw8RoomaL0LwwEDLqHniByRolr?=
 =?us-ascii?Q?YUoBgkonQeLygb/dyer0Ynsqp2RODCnaVy9ZCKbPNH51v2tCkv/AjFmou55H?=
 =?us-ascii?Q?E1pZEsPXnW3Skl7Ed0Re/BsVAD5B5kp1pDqEKoxy/XbZ+1H5KYN1pe1xfbdl?=
 =?us-ascii?Q?1sIa9D/t09utmfJu6GHhloal4843blqTx9Y+PoHEaebyqy2qVx9nQ+ah65xX?=
 =?us-ascii?Q?G8LpzG6CCLktOhJn1Ns3X5bIN/+jR6+fHTvV1lpplRtNPHgSIc6+wguK08BU?=
 =?us-ascii?Q?jb3ktk4yeLqKNdWSBpQEmWvxVx5pECgS6txk+X5zFsNQN6YTUNDEbxPqrfyP?=
 =?us-ascii?Q?ZeyKVAJmEFWDefDoHfR39tjkL/eU/E9YcBfz22q6CW8baqwNUGUbjpku4dwF?=
 =?us-ascii?Q?4bQ0vLhpAvlj+b01/xRFB3RAfJ9Ko18dpAWXJPJVBmutVEsJe8Pa21jP+F+R?=
 =?us-ascii?Q?t73GH61A5pMcFdOju7p+VYpjHdUuIjVjOyQxrc0Gz9k4CUG2ZCDNTFC2ZXKf?=
 =?us-ascii?Q?jGUy3S4JEFb1bvBwVmqibX7EpTWGjSo9bcdZFAei1ReIwcE1MmqtPSwd/uy0?=
 =?us-ascii?Q?cnzfAXWAMYtpuH3sZVAh5SgWXeCduQ+C55jSHb6i85OKSJBSoO5cL+ixCPoQ?=
 =?us-ascii?Q?Xy5N7cjSpZfeMzSa5zBhRt7yaCtfZzJM3c1hX0MTDbYxdRuHqZ4a+Irc2n96?=
 =?us-ascii?Q?Qz8lOmM2SPQtcYZNvvFuAyvnV/jbuLOAjBZU3ngwM+zWL78tH6y0K40otwD4?=
 =?us-ascii?Q?958rw4+b4t9dPg8rhK9mgucITzrq6ohkfnH2KvXZssemF72Eomh3rtAdG0eX?=
 =?us-ascii?Q?/08ht0oWEO5X5NJFMASyuY10QVd9D8DEg2crr7Wi8DRlHSZZH+9chRyfCiyw?=
 =?us-ascii?Q?C3FP87kD6AHKsDHbcV5l8gdArdiMNNHdyJcPO21k6X1Jf59fZlUdw35elSEk?=
 =?us-ascii?Q?zGezsEyNuQkrYWp5k/0sGIA4K/6FwVe4a06y/qIHwJBSsP+qVEINupJelkqP?=
 =?us-ascii?Q?b77BbqRKMSC7nKER8hVZNqLFiqYLnNBsMk3QjEEVS6Pm0vPPGvXGWHvBL/c0?=
 =?us-ascii?Q?m+LUonkNf0OFfB91sIq+IaeAfEc7BX7+p9SYEX/wlmjcfU+4ZggJ?=
X-Exchange-RoutingPolicyChecked: 
	pl3nbWn5LWOMrAjFzag3MeeaSls+dlyMmHBJccrInIKzUe4KBK6VzzKDFlyFEd5Hx6tOm8tyv3cae0NbKklHFxigHTig/Gb7x1+9yjyTTcYTjK8GDOry1eNiVIX0LRDEguDsbPT22s1Ie52tTSwczFPXH762uoPO2qRfoalnFbWxBDHkKsH7cA2k2Skani1tTn5HEzd8YPhtk6ftCIXMD9+fq4/j0P9CQseOk6wpySYsU0jyjF2hHW53uTia0am2n8QXiEvns61H+1Gry1KpRENyHi6DdSrscktcSVwkU07xMuyHjLPj+7fZEepHKjWLr0Gb6KEEWDEZL1Z6USWh7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94da2ff4-6f1c-4ffc-cbdd-08defa192321
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8405.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 15:31:40.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVRLTfNk18GfFrCymktCnF1SGHdR6gC948kGhFc2jnlYz3LI/AWBCrEOtohbIh8kOte7UM/VYCoihkLLPlRoM6jGAjNnIQq3XvlwyGVdPHRQ7rO9ro/T4GLxMYdh2vh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7f34df cx=c_pps
 a=MtJuZ5RhhfRGh3snRrmfAQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=_IEhM8lNAAAA:8
 a=NEAV23lmAAAA:8 a=1jPp1DPGAAAA:20 a=eNcD7ojaAAAA:8 a=P-IC7800AAAA:8
 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=q37nXIe6AAAA:8 a=Crg_IfaRAAAA:8
 a=X4Dd0jU7hbeT4szu8xsA:9 a=aEnqwt6v2BhAtWC2:21 a=WN5SZLvFwbRUu1hQBHWk:22
 a=rRYMMicksRHQPzyJ67jW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=BJVlOEsdJj3sJBqmr9yI:22 a=WKt6puP8o2WZ-s9Jsdj1:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX8IqG8uMlGJ/9
 XqfmYROtqyT1/3KPEPnHwd37rXV+iocKEZ1Mgv+AvKHATh7GpvosqbcNm9z1BBM73OqJpx9o0iU
 66yunDRCxr3ApwLgxHQdpgkyVReacY+M3j4aN3Kr6RVbfAkTQaDl
X-Proofpoint-GUID: wutK6nwTOOI7UCb_1stckYZge6g3gi7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExOCBTYWx0ZWRfX2tG2NhubjeL8
 f9aZRZyFmKt20qtm2XTOZMusbqKXQAt08nk2uH1omit83iUHEMQa6XnuZViP5htkaFcZUo/7OMq
 MgrXSxAW0LWSSXGk6pqQ0crIjEEowW3DbOHisNhWkYBax/Z7YLISLqr5PdNIRpmA8iGUKNuf5+E
 y/eFytracsIhLGrKTyMmUUWmRcEbTy9vQog8GSG0M1AKpwzhSPHgQiqpIJG2iC89uPRqaXhnoZr
 W79jxKKL3pk+0bXojtVUvu0Es4mC6j8Gy2w4ZqnPPb17J2JTqXsHBdT/wVMk3xqiyKn296IslVL
 EJXhGqXL0Pe/hDLANHogVTHN71ww68/6wVVhDbbpZtRSVSUwjWCmooEpV3cgsTYRTliHf6ynWVL
 n+2XkIdSrFtroHQh8RnL3G/f8P7T4DGoCROm3ZI2YtKmgxx3ITCHuhPL/yD2+OjaU6t5AGOKG3v
 OD9n7jpKZRNpk60Dl+A==
X-Proofpoint-ORIG-GUID: wutK6nwTOOI7UCb_1stckYZge6g3gi7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 15:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243457

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Cherry-pick from OE-Core master (5.42.2 -> 5.44.0),
adapted for wrynose which had 5.42.0

This upgrade fixes the following CVEs:
  - CVE-2026-42496: Archive::Tar symlink path traversal (CVSS 9.1)
  - CVE-2026-42497: Archive::Tar hardlink path traversal (CVSS 9.1)
  - CVE-2026-9538: Archive::Tar memory exhaustion DoS
  - CVE-2026-8376: Perl regex heap buffer overflow (32-bit)
  - CVE-2026-13221: Perl regex trie overflow (>65535 branches)

Changes: https://perldoc.perl.org/5.44.0/perldelta

Add perlcross patches to support perl 5.44.0:
- Patchset symlinks for perl5-5.44.0
- Configure checks for d_getentropy, i_stdckdint, i_sysrandom
- Fix checkfield() for C23/GCC 16 compatibility

Verified: ptest passed.

Drop patches already included in this release:
- CVE-2026-8376-01.patch (upstream commit e842efdafe7c)
- CVE-2026-8376-02.patch (upstream commit 5e7f119eb2bb)
- determinism.patch (Encode::Byte sort fix)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 036700267e816ebfc56c404e872055f93f73c88f)
Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../files/0001-patches-for-perl-5.44.0.patch  | 110 ++++++++++++++++++
 ...Add-configure-checks-for-perl-5.44.0.patch |  47 ++++++++
 ...Fix-checkfield-for-C23-compatibility.patch |  35 ++++++
 .../perl-cross/perlcross_1.6.4.bb             |   3 +
 .../perl/files/CVE-2026-8376-01.patch         |  62 ----------
 .../perl/files/CVE-2026-8376-02.patch         |  49 --------
 .../perl/files/determinism.patch              |  51 --------
 .../perl/{perl_5.42.0.bb => perl_5.44.0.bb}   |   5 +-
 8 files changed, 196 insertions(+), 166 deletions(-)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/determinism.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.44.0.bb} (98%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
new file mode 100644
index 0000000000..36f065419f
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-patches-for-perl-5.44.0.patch
@@ -0,0 +1,110 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:10:00 +0000
+Subject: [PATCH] patches for perl-5.44.0
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.44.0/constant.patch       | 1 +
+ cnf/diffs/perl5-5.44.0/dynaloader.patch     | 1 +
+ cnf/diffs/perl5-5.44.0/findext.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/installscripts.patch | 1 +
+ cnf/diffs/perl5-5.44.0/liblist.patch        | 1 +
+ cnf/diffs/perl5-5.44.0/makemaker.patch      | 1 +
+ cnf/diffs/perl5-5.44.0/posix-makefile.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-checkcase.patch | 1 +
+ cnf/diffs/perl5-5.44.0/test-makemaker.patch | 1 +
+ cnf/diffs/perl5-5.44.0/xconfig.patch        | 1 +
+ 10 files changed, 10 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.44.0/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/installscripts.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/test-makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.44.0/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.44.0/constant.patch b/cnf/diffs/perl5-5.44.0/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/dynaloader.patch b/cnf/diffs/perl5-5.44.0/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/findext.patch b/cnf/diffs/perl5-5.44.0/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/installscripts.patch b/cnf/diffs/perl5-5.44.0/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/liblist.patch b/cnf/diffs/perl5-5.44.0/liblist.patch
+new file mode 120000
+index 0000000..5037380
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/liblist.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/liblist.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/makemaker.patch b/cnf/diffs/perl5-5.44.0/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/posix-makefile.patch b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-checkcase.patch b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/test-makemaker.patch b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.44.0/xconfig.patch b/cnf/diffs/perl5-5.44.0/xconfig.patch
+new file mode 120000
+index 0000000..87ac501
+--- /dev/null
++++ b/cnf/diffs/perl5-5.44.0/xconfig.patch
+@@ -0,0 +1 @@
++../perl5-5.42.0/xconfig.patch
+\ No newline at end of file
diff --git a/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
new file mode 100644
index 0000000000..e7fd9df2f5
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0002-Add-configure-checks-for-perl-5.44.0.patch
@@ -0,0 +1,47 @@
+From d6010680c68655b782c2e07bd0d38562c1ad0ccb Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 21 Jul 2026 09:28:12 +0000
+Subject: [PATCH] Add configure checks for perl 5.44.0 new symbols
+
+Add detection for d_getentropy, i_stdckdint, and i_sysrandom which
+are new config symbols required by perl 5.44.0.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_func.sh | 1 +
+ cnf/configure_hdrs.sh | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/cnf/configure_func.sh b/cnf/configure_func.sh
+index 20f9cdf..4cbee2f 100644
+--- a/cnf/configure_func.sh
++++ b/cnf/configure_func.sh
+@@ -104,6 +104,7 @@ checkfunc d_getaddrinfo 'getaddrinfo' "NULL,NULL,NULL,NULL" 'sys/types.h sys/soc
+ checkfunc d_get_current_dir_name 'get_current_dir_name' "" 'unistd.h'
+ checkfunc d_getcwd 'getcwd' 'NULL,0' 'unistd.h'
+ checkfunc d_getespwnam 'getespwnam'
++checkfunc d_getentropy 'getentropy' 'NULL,0' 'unistd.h'
+ checkfunc d_getfsstat 'getfsstat' "NULL,0,0" 'sys/types.h sys/mount.h'
+ checkfunc d_getgrent 'getgrent' "" 'sys/types.h grp.h'
+ checkfunc d_getgrps 'getgroups' "0,NULL" 'unistd.h'
+diff --git a/cnf/configure_hdrs.sh b/cnf/configure_hdrs.sh
+index 249f5bc..b2d9d88 100644
+--- a/cnf/configure_hdrs.sh
++++ b/cnf/configure_hdrs.sh
+@@ -64,6 +64,7 @@ checkhdr i_socks 'socks.h'
+ # i_stdarg below
+ checkhdr i_stdbool 'stdbool.h'
+ checkhdr i_stddef 'stddef.h'
++checkhdr i_stdckdint 'stdckdint.h'
+ checkhdr i_stdint 'stdint.h'
+ checkhdr i_stdlib 'stdlib.h'
+ checkhdr i_string 'string.h'
+@@ -88,6 +89,7 @@ checkhdr i_syssockio 'sys/sockio.h'
+ checkhdr i_sysstat 'sys/stat.h'
+ checkhdr i_sysstatfs 'sys/statfs.h'
+ checkhdr i_sysstatvfs 'sys/statvfs.h'
++checkhdr i_sysrandom 'sys/random.h'
+ checkhdr i_systime 'sys/time.h'
+ define i_systimek 'undef' # not a plain header check
+ checkhdr i_systimes 'sys/times.h'
diff --git a/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
new file mode 100644
index 0000000000..b92995b131
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0003-Fix-checkfield-for-C23-compatibility.patch
@@ -0,0 +1,35 @@
+From 7faa8a36afb579f07101a48065e4a19729034807 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 22 Jul 2026 09:21:26 +0000
+Subject: [PATCH] configure_type_ext: Fix checkfield for C23/GCC 16
+
+In C23, 'void foo()' means no parameters, so calling foo(value.field)
+fails with GCC 16 when -Werror is used. This breaks detection of
+struct fields like tm_gmtoff and tm_zone.
+
+Use (void)value.field instead, which works for any field type.
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/178]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/configure_type_ext.sh | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/cnf/configure_type_ext.sh b/cnf/configure_type_ext.sh
+index 0136c90..9ecd3fb 100644
+--- a/cnf/configure_type_ext.sh
++++ b/cnf/configure_type_ext.sh
+@@ -7,11 +7,9 @@ checkfield() {
+ 	
+ 	try_start
+ 	try_includes $4
+-	try_add 'void foo();'
+-	try_add 'void bar()'
+-        try_add "{"
++	try_add 'void bar(void) {'
+ 	try_add "	$2 value;"
+-	try_add "	foo(value.$3);"
++	try_add "	(void)value.$3;"
+ 	try_add "}"
+ 	try_compile
+ 
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
index 3c544c9746..9fa805e2e3 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,6 +15,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-patches-for-perl-5.44.0.patch \
+           file://0002-Add-configure-checks-for-perl-5.44.0.patch \
+           file://0003-Fix-checkfield-for-C23-compatibility.patch \
            "
 GITHUB_BASE_URI = "https://github.com/arsv/perl-cross/releases/"
 
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
deleted file mode 100644
index af94eec29c..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:47:31 +1000
-Subject: [PATCH 1/2] perl/perl-security#147: test cases
-
-The suggested case from the ticket and an alternative.
-
-(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- t/re/pat_psycho.t | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 336039521d..73a7992372 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -10,7 +10,7 @@
- use strict;
- use warnings;
- use 5.010;
--
-+use Config;
- 
- sub run_tests;
- 
-@@ -31,7 +31,7 @@ BEGIN {
- 
- skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
- 
--plan tests => 15;  # Update this when adding/deleting tests.
-+plan tests => 17;  # Update this when adding/deleting tests.
- 
- run_tests() unless caller;
- 
-@@ -211,6 +211,20 @@ EOF
- 
- 
-     }
-+
-+  SKIP:
-+    { # sec #147
-+        $Config{ptrsize} == 4
-+          or skip "these only fail on x32 and use too much memory on x64", 2;
-+        local $::TODO = "This crashes";
-+        # original case
-+        fresh_perl_like('/\x{10000}{1073741824}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow");
-+
-+        # synthesized but similar case
-+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow again");
-+    }
- } # End of sub run_tests
- 
- 1;
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
deleted file mode 100644
index 39b3d510fe..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:51:00 +1000
-Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
- lengths
-
-(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
----
- regcomp_study.c   | 7 +++++++
- t/re/pat_psycho.t | 1 -
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index 9106452dd5..05f1b017b1 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
-                                                (U8 *) SvEND(data->last_found))
-                                 - (U8*)s;
-                         l -= old;
-+
-+                        if (l > 0 &&
-+                            (mincount >= SSize_t_MAX / (SSize_t)l
-+                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
-+                            FAIL("Regexp out of space");
-+                        }
-+
-                         /* Get the added string: */
-                         last_str = newSVpvn_utf8(s  + old, l, UTF);
-                         last_chrs = UTF ? utf8_length((U8*)(s + old),
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 73a7992372..9fd764fd5e 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -216,7 +216,6 @@ EOF
-     { # sec #147
-         $Config{ptrsize} == 4
-           or skip "these only fail on x32 and use too much memory on x64", 2;
--        local $::TODO = "This crashes";
-         # original case
-         fresh_perl_like('/\x{10000}{1073741824}/',
-                         qr/Regexp out of space/, {}, "ssize_t overflow");
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/determinism.patch b/meta/recipes-devtools/perl/files/determinism.patch
deleted file mode 100644
index bdb9a928bb..0000000000
--- a/meta/recipes-devtools/perl/files/determinism.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 5c4fd57daf125357262aa796057d7be8e78d378e Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 5 Feb 2020 23:54:02 +0000
-Subject: [PATCH] Fixes to make the perl build reproducible:
-
-a) Remove the \n from configure_attr.sh since it gets quoted differently depending on
-   whether the shell is bash or dash which can cause the test result to be incorrect.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-b) Sort the order of the module lists from configure_mods.sh since otherwise
-   the result isn't the same leading to makefile differences.
-   Reported upstream: https://github.com/arsv/perl-cross/issues/88
-
-c) Sort the Encode::Byte byte_t.fnm file output (and the makefile depends whilst
-   there for good measure)
-   Submitted to upstream perl: https://github.com/dankogai/p5-encode/pull/179
-
-d) Use bash for perl-cross configure since otherwise trnl gets set to "\n" with bash
-   and "" with dash
-   Reported upstream: https://github.com/arsv/perl-cross/issues/87
-
-RP 2020/2/7
-
-Upstream-Status: Submitted [see links above]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
----
- cpan/Encode/Byte/Makefile.PL | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/Encode/Byte/Makefile.PL b/cpan/Encode/Byte/Makefile.PL
-index 6824bbb..4af4a50 100644
---- a/cpan/Encode/Byte/Makefile.PL
-+++ b/cpan/Encode/Byte/Makefile.PL
-@@ -171,7 +171,7 @@ sub postamble
-     my $lengthsofar = length($str);
-     my $continuator = '';
-     $str .= "$table.c : $enc2xs Makefile.PL";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         $str .= $continuator.' '.$self->catfile($dir,$file);
-         if ( length($str)-$lengthsofar > 128*$numlines )
-@@ -189,7 +189,7 @@ sub postamble
-         qq{\n\t\$(PERL) $plib $enc2xs $ucopts -o \$\@ -f $table.fnm\n\n};
-     open (FILELIST, ">$table.fnm")
-         || die "Could not open $table.fnm: $!";
--    foreach my $file (@{$tables{$table}})
-+    foreach my $file (sort (@{$tables{$table}}))
-     {
-         print FILELIST $self->catfile($dir,$file) . "\n";
-     }
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.44.0.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.44.0.bb
index 1833b7a352..c76810f124 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -14,10 +14,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://native-perlinc.patch \
            file://perl-dynloader.patch \
            file://0002-Constant-Fix-up-shebang.patch \
-           file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
-           file://CVE-2026-8376-01.patch \
-           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
@@ -26,7 +23,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "e093ef184d7f9a1b9797e2465296f55510adb6dab8842b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] = "3b855066b92491cb40e86affb1ca57d1a388aa43e51b91c7806a32c2f65f96c3"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.40.0


