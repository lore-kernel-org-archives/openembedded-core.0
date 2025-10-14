Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0731CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18462.1760453082939667823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EPfIXSG0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2382047737=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59EAhUfs3483883
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=vGMXj9VewZZ0OxcMzE/tNI8yKDNiGtGD/Bw9qe6bc38=; b=
	EPfIXSG0nyta66WsrwwbbGhRjkLccYFW6U8/P1rQQE6zMRus2aOuMQ26tp3094dc
	3l15qXYH/GDbV4XgAlAQE6KuoF9qB6G70gUvRkUAYwNfJXtWpX0byy2C5ymbl0FS
	iJF9X8Aahq0qLryEnnlm/OdVpkuVMWPFmYon0VpdCI9vfsNjzzBIRcDHPwrw6PRi
	d+XIGrDa7nPYMqr3kfYD6aKQ2GBWA/i4a3liw4V9J0kdpnSE/P6BEF3jZ75WUHie
	GisvPv/biDfDrtlxnlsLvDQ/80hMXEmBDYdNnxqqVKtuQ/gTpd/FADZYImvohCFp
	rXc6cJa4dBDEnaroklOcPQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1k3wa-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 07:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Shd34IyznFfLNk1KMXntB1d8OO7unaiA52YF+bq23BX8HGxW4SiMO7DuOvLSSFPdqjICCpe3vDYjn1xfFIx57NndEiRXf28PAEdP0OyYMPlbIlz9zcdG4SSCIG5d711D99Pmqc770qN2CKbuSLMkusmjSPNxDG/jOxFj0YHPBvR6mkUxmKQr1ze9wpTETulRZa4L4tpgf/tuNoQk7VFMs4UsrsuY0WhhHVrEZbM/GmI21Bdkj0CNKAaG/lG27Lt44QtidajgBw4/0PshoPc54rLf78twh12mkvEP8mzyOWGFU8ly1kfyM4sHxcXHF27r5G3IQO4AqbpMJ8vp4JgSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGMXj9VewZZ0OxcMzE/tNI8yKDNiGtGD/Bw9qe6bc38=;
 b=ggmoR2HHi19yQY8jkkZVvowOb+gwBOJDM5+Jwm+D5vm65LH7Vgeg4vC2xjTdg2T9fmZx/xzwtRCEkdnf3VcT2y1vSqZoIojcpLUOl8KBdAfAHmwCH8Evr8JJMN7zImxxLXD3TQTpvqqdwK0Yk2/8LIaxax+x0Odt5ekWyz84Ih88FYYC3cXxQMPJGqQfl1vFDWCtVmDBfYlSOocCTlcXbKEYT5Zv0ctHwcbSZnAN/yWM1mmpiLFL2N8ZfdbxAdEVnMY8Iw6oEeoZCO7SsvdVR0hIh5eglj+38COcMTrKIoDi5PdT0WkWnRmg0NyrS5PjR6Ubl+4IywSJc5p0jjji6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Tue, 14 Oct 2025 14:44:30 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 14:44:30 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH 04/11] glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
Date: Tue, 14 Oct 2025 07:43:40 -0700
Message-ID: <20251014144347.536537-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
References: <20251014144347.536537-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To CH3PR11MB7896.namprd11.prod.outlook.com
 (2603:10b6:610:131::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ffd817-f2fd-48eb-2119-08de0b302eaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VsqMk2FeXgATbtxJ7JDw404geHez2y12kL0s48P3mnF+y5bBfXyC4lVa8V43?=
 =?us-ascii?Q?485az3nCyU4deC3dnFU81suQ0KBdWEQ8tJnF1oMYrqU5GKsrJMK4NUu9D3uq?=
 =?us-ascii?Q?5CIDy4FYc9Jea/Dj7WY5uQTlOf6yq1XuQj9kZJ2frjTaOeNrmJFr5gmB2oB9?=
 =?us-ascii?Q?ypstcJ/+4ioT2I1bpLflNzk0V/oI1cOwQUL5Man2PKS15H8Ej//XfRwJDH9S?=
 =?us-ascii?Q?UpnZoHabzkap2J0cYMCZh62k1xrArT+COGA7civIH2YXQM3dgBK8F68feMLO?=
 =?us-ascii?Q?wQaqoD1AJthWc2fDbe3NUI+n0pQjWifAkfxZ0UNEI+2ZTD7lWXR8D8M2MOwi?=
 =?us-ascii?Q?NqMZSKlIUYUsWFgDYNptJEK1NmvJa2sPvhOls0Q3aQ0UhG6stIcdxyW6bJMM?=
 =?us-ascii?Q?gjIrNq1XEXfz9d7y7Nc3gxW4yIXWe/OSljFyvJXrfrnEDDT1WKKZY2VU4Zxb?=
 =?us-ascii?Q?rilMZdVUvEDKHLW1YPlX5kuYjiaDjpaHefpu2scpis7+ExpVAUbfVqAsbdXN?=
 =?us-ascii?Q?6a6/ZuQPZYKzKcftXiXwuDfiKlEILX9Q+vMtZ2z2sErI3XBNWtpvDCd3gymy?=
 =?us-ascii?Q?EPjsThBwLeqHoRDOYl/sAf/hhmWrMmtWZTiSJAIPVnKZBM8VY8sf19JEfr3k?=
 =?us-ascii?Q?CKB5JMn7SoCNHEjBRzmL9OM4hOrX7JCPOFaLt2VqnAnagLLQ2NSXDFwgqpFR?=
 =?us-ascii?Q?uB2MzNdhk42taGlau1RFHGy6LK/48TNzeqydIkRIeqsKBgU9QKSpZgrT8vPe?=
 =?us-ascii?Q?f5f2OUZRgILa3ex8UwX+i5wmPwCdJAo45AtYKAMvKZ1di79aaNHXlpuVjHjI?=
 =?us-ascii?Q?wYM2lqTdVjxmH+1Skud8xptWZkkSBBUX4405231OFdIjz4DA0+mthyE56gcp?=
 =?us-ascii?Q?EPpmv6q5qhL5jx17W1P0ie3bT3JZGNBkU8lroJdFqcT4NynEkG3jflOkZ7mW?=
 =?us-ascii?Q?G05pTm87tB/wJIZpwvqMHArxT2Xf7Pb2d1AgsFzLbxNpcI9vNwl1b1SMZnkb?=
 =?us-ascii?Q?soILuMrRG7djajT5GQ0YrLdQISc8KeisVBhIvLFRdwV4jAtf739bff1769VC?=
 =?us-ascii?Q?JG9khjVSgXaVfPgoM4qqTWANd99k7r0rZGJY0DVliU7kFyTmJnA5ErLgR+aP?=
 =?us-ascii?Q?PKrWDCasPlRgm2czYaFLrNs/K7v5TZ6xTJXf8JJs/zUChPyr7uMMO5i3ijCJ?=
 =?us-ascii?Q?QVpoPat2RR4cLvIfxrHPLTkNSYyryTD2ePusExa3KcCCqM0SySczPosWX50m?=
 =?us-ascii?Q?RzdQKFSFzFo0OmlpNF1Huop4kXyM0pkd0gNEt2DYKdQJbkdyL6ZsXPdCjLyv?=
 =?us-ascii?Q?zud3z/9mklkCz4RflxBWj8IeCT/tAbeq3q97PJ/4ZRroWjDh/eiDTRWeblk9?=
 =?us-ascii?Q?WQlnF6fiY+FXaoYSX6MzBlKPIrX/32TTk/w6jMqBXYyTc0xkGYHPBv9nYr8m?=
 =?us-ascii?Q?15g3vPerhkQ4u/LGV98qciwmmbnZSf9Xq3FMRHg8smbe2uTqndYE2Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UJdTJsXEc/+r1l7t/DVcg93A3v8e4AA8eCMtbxzBvnFCa+mtC9uLebqVq2ff?=
 =?us-ascii?Q?RwCjrwdICm3sSHW+BShipXXOc1RySE4tPHYFqaCcLmTRdWUA9nc8YN2/5DRL?=
 =?us-ascii?Q?F5PfepLpOQMq2riBKXn31EjzVf6MFw5QgaQ/i1TTTPEb+RwhMATb3pwB1CkF?=
 =?us-ascii?Q?wFkOwIJ5Frt4rlWEHRcPm5OLShTwgBaNiWkjOczU2DfSRp3Xb9aPohrwgrw5?=
 =?us-ascii?Q?uy/JnZGd/R4QQsMW//6n5+Bv6VnwrRMSbcMaIE2cAi+AQiDaMZ2QsGOm3+rs?=
 =?us-ascii?Q?Xes63hQLWNQShrawDIMHlB9nLSiirWDNPPRoxhOlhgs32MpgPI5+JNb0pF4j?=
 =?us-ascii?Q?i41RctPLZ5eJ3sH+fQg0jYYlK6ENR5bfa1a9CEUhCkgdIOngfv34uNwJ2c3z?=
 =?us-ascii?Q?sw1POaLxeXaTRBt1mXzhqQZ3DkfnjXFCQnIESk20xZoZEGV5kgEVrBEB6d4Q?=
 =?us-ascii?Q?LTD/FLkPk8crrtWOkSpYEyaeG/VN7X/Iex3GtNGjIkIT80Zjn/qO39aQJAaZ?=
 =?us-ascii?Q?xGAeDvPoET9vK0gxpoOcA0XXlKwPW9bEGAGYhbHAdm0JWL8nTzdhGJ0e/+qJ?=
 =?us-ascii?Q?nyfpLQqntaIXgoM10BLy/kJ5+/Yr7OtB0poNMDcLPpGNz0Ii2dFZECthqOwN?=
 =?us-ascii?Q?h/tfSLUXM6ad96twjxQ5NYPnh3TGZLyLgE/sEu1NBTiUBT4FxupyAhPlER8z?=
 =?us-ascii?Q?mkrwsAOnXiWaddb/yoNdQofCWaqkgx5INccmCSRbQb+pOAA7L8Rgpic07T65?=
 =?us-ascii?Q?Lqbuwa3kJz9QCWPFKyzuQbYHGHYTHw4X41ArQuNFF+BOSn0Or1dW2ApQcZ5j?=
 =?us-ascii?Q?5ffkI6bsSiH9SP/NCt8dGkAiM0z7B666BkzG++9UwFYckhMVJqenmg/wrY3P?=
 =?us-ascii?Q?mcHvKam2PGZj8krcwZ48aEs1d7SA0bwpsC0VTeLyvCTq6VATDPi2xTkTdKNe?=
 =?us-ascii?Q?zBpesZ8UuFSppCVbtGYu8JDH1J0wY/Aw7nBeb6IVvVfaPAMQvyy3+64EASXI?=
 =?us-ascii?Q?ul7ChvK1mNlkFrme4JKS3cWGXHzvwi85f9R8TI5WDlGou+ewIvxCgtA0kmdN?=
 =?us-ascii?Q?NCcgeHUE7p02Fml8r4XmuVNS9k7EdUg1n7LeG/7bljWmGV3Rxac7FbvGjvpc?=
 =?us-ascii?Q?t1WZQ2lWDeCo1UlKqP1IDqmHFf7epiMFNDMZIzv4TV1VfZgAfOlGMCVnSls7?=
 =?us-ascii?Q?fyhEj/3eDxyYmVkJUKSy4ZOzVgUz3aQcL/fYdpuEAt+6kEoWTTJ2RxPywCjL?=
 =?us-ascii?Q?8b5yfI8vwVhVEFzv/mI7C+9ZAX74JPtHukHF+L/kwr9x0Vc+LfyWj4unzVJF?=
 =?us-ascii?Q?6Ameyhi+ctDrtqQhWqHfBI2ncCMnmOHoXfb9n6w+PqCMcz4xKclYbiW4B6VU?=
 =?us-ascii?Q?YfM8cY8JFPY3dyJoiDOskDtleyvmWYvMx25KHUZnSXRuDgehxfsip3z/ixYN?=
 =?us-ascii?Q?WwnREiJkbOBv+0jNGlePBk1l6Nuctip2Re7Q9RxqOIpD2W7KGWumycD6VPwE?=
 =?us-ascii?Q?G1fZdg5++A/0qj8A3ctITE1CYNFiPmENDSg/ah0aVuFkO4LfJvJ48lqWHrZm?=
 =?us-ascii?Q?62Pg/UMF7mT6430r8amuvmg8O4bKwtMcCMvg6+qKlUonZF+8uDFQqFGELaow?=
 =?us-ascii?Q?bAOME8tyxjnBheZ1c8HmNso=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ffd817-f2fd-48eb-2119-08de0b302eaf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:44:30.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9D1tXaBaZtuFFK2tRDcVY1lZh0Q+7dmd3E57liLwH6aCLEM7UazQlJrQsalGikCIuejcO0/qifnpLpcK53HELOTigadBxJB40F8OpcBlHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDExMSBTYWx0ZWRfX6+93QcT09yus
 oFGEBMvbo5kymIogp7+0Cokqtot6Tk4Na1ZKZYdHNyDGxvoGveNg4rFLyVJXMB33Z5M3s7HHa2V
 dBe1Jh95R9INwLMGK3tGUDm4enfhVhv0oT+Dso05xcn088O521hi50XtnqWgYCiyAuDrpFWezcs
 CEKyB2Q2XTxbTJOhbibgjGbaWWB57MVTpglCVFZHHbbmFrzvYVRzV+4rUBVW1AU9pndKGsi0Cep
 nb6rx2aLXoV41Ma7yHBS5LP4kvcJHX/XCsmvF/E6Qcs/8s6i7Ga3mMe/hX6r/lEAqQ5W/SvE34k
 R9csRWuqVO6oChevmNVBP/hzIt3q5NzJCkHVpU0AuchYbhB/5wiWOiY4Td/QmWMlG5O+A6xcPSc
 nz5lOQA715a1v50MPj/bVqhkJ15tVQ==
X-Proofpoint-GUID: WAMMlraCDM9oI-_ear1yVCWlhtvjvJTM
X-Proofpoint-ORIG-GUID: WAMMlraCDM9oI-_ear1yVCWlhtvjvJTM
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68ee61da cx=c_pps
 a=7v6vjeP3yXOm/Y6ajRpg3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=OTrzE_FXVTYtTbWwAisA:9 a=3K_-HASTV5IA:10
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 14:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224824

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002274.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-3.patch          | 79 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
new file mode 100644
index 0000000000..4228be95d1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
@@ -0,0 +1,79 @@
+From 5f22e8cf95cf6b3b2e16ddb03820ae3e77fd420d Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 04:47:48 -0700
+Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar group
+ switch
+
+This wake is unnecessary. We only switch groups after every sleeper in a group
+has been woken. Sure, they may take a while to actually wake up and may still
+hold a reference, but waking them a second time doesn't speed that up. Instead
+this just makes the code more complicated and may hide problems.
+
+In particular this safety wake wouldn't even have helped with the bug that was
+fixed by Barrus' patch: The bug there was that pthread_cond_signal would not
+switch g1 when it should, so we wouldn't even have entered this code path.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: b42cc6af11062c260c7dfa91f1c89891366fed3e
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002274.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 31 +------------------------------
+ 1 file changed, 1 insertion(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 350a16fa..f976a533 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 have already received a signal and been woken. If they
+-       haven't woken yet, they will be closed out immediately by the advancing
+-       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+-       which will prevent waiters from blocking using a futex on
+-       __g_signals since it provides enough signals for all possible
+-       remaining waiters.  As a result, they can each consume a signal
+-       and they will eventually remove their group reference.  */
++     * Waiters in G1 have already received a signal and been woken.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+@@ -240,29 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 
+   unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
+ 
+-  /* If any waiters still hold group references (and thus could be blocked),
+-     then wake them all up now and prevent any running ones from blocking.
+-     This is effectively a catch-all for any possible current or future
+-     bugs that can allow the group size to reach 0 before all G1 waiters
+-     have been awakened or at least given signals to consume, or any
+-     other case that can leave blocked (or about to block) older waiters..  */
+-  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
+-   {
+-    /* First advance signals to the end of the group (i.e. enough signals
+-       for the entire G1 group) to ensure that waiters which have not
+-       yet blocked in the futex will not block.
+-       Note that in the vast majority of cases, this should never
+-       actually be necessary, since __g_signals will have enough
+-       signals for the remaining g_refs waiters.  As an optimization,
+-       we could check this first before proceeding, although that
+-       could still leave the potential for futex lost wakeup bugs
+-       if the signal count was non-zero but the futex wakeup
+-       was somehow lost.  */
+-    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
+-
+-    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+-   }
+-
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 732cb96f94..0787dfe236 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
+           file://0026-PR25847-3.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


