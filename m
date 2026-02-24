Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A61F4BB93
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 21:43:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32014.1771969399727832322
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 13:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cXsjhZjb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65157b7930=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLH4XO2444874
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=MdEwia2AQFxJnolbDS0IXL3gp3WB9R7uG/6UeC7qP/4=; b=cXsjhZjbBFrI
	kDw2/ONQXlb5rKXh4+HJEwQNPK6yE+yv8tnKUzVzWz+RYsB92J062R9g2jQirghf
	C6qIMyH1c3WX9NZbvGrgCRUXHyas8eKkeVQ4v3eMG2+hQblSIsTYZ6yNRaIc/+UZ
	2Ilw5/w6aRmc7CE4UiRZcptiEcv/6tU2/L04s7LsA6aYfaZBvssfAMpN75+KIZ60
	ro5y/+oCSmM6nY9esRJ6CmxEz4jrYcXZjMKv3BHys0oY1+ed6bPcSr/pTvq7BJCn
	t4Ymp86v/9WynRk5EyyXj6qu1vptyiEmx79IKOh+qk5M/Gzo0HMFXD3lf7oTObNp
	TCXe9uR85g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf3p4bxcu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkKv268Oq/pQbdrnN2ewLdy+egd34nsfMOp6bePMpNdX3PJzpenQtsSXynIUGxq82TD9X/GSIY+L9DaxHAQDb3hUi29/yiwjNO4HgO1I6CrUCoKme5Jlb2LDEa5hvUf4auG55cWqz1/kFWbqrWfUFmWX8hmG2SeC4RCBjEOUtK5KDIihar1Lr5LxG5tOWclT1QdS8I7IwmovsvkuYQysHfC+VcNcN4HUzXVBtGyZrKdAiZLSs9wDsi3qzEAnWh6rr92JjmchnOdL/2/plhm0FNLoxlEbCUmmKL3PkQurjxAiiEf7po9G2Dc94M6o39Nft1l6Hfo66H9M0MmMCYM7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdEwia2AQFxJnolbDS0IXL3gp3WB9R7uG/6UeC7qP/4=;
 b=CWRbJ0DZkREn9L8xXaapm7naeVvsOaZxVooqEM9qBqSaBer4oiZw54rHyrBq7ibvxj6QLqHf9H74+Aybidp0vn+C8I/zjubNnQBcWgF4m0ijxTlO1g1JccJsXB0usfgg7H882bARg018lhx+9ERLPcf+puVEtPGbDSuzozMk/uKCaUsiyPJ58sGZUKaiKe0ZUgpub+dIzBEoOVt0GTskw8Sm50hSMNsjFvoLsbop+TG86hkbpwpysorchwKDXzaDkwzP4H+XzwzMU3vUstCP8cG9E4C2iMJgJgGUmGuc+oaM99OKSsGbZiWlsROj1/PeOo+tKLD0ZqyLZRXOTUnMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH8PR11MB6660.namprd11.prod.outlook.com (2603:10b6:510:1c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:43:16 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:43:16 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] socat: upgrade 1.8.1.0 -> 1.8.1.1
Date: Tue, 24 Feb 2026 16:42:59 -0500
Message-Id: <20260224214259.2236671-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224214259.2236671-1-Randy.MacLeod@windriver.com>
References: <20260224214259.2236671-1-Randy.MacLeod@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::15) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH8PR11MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 442af127-7891-4158-c070-08de73edb813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OdJPent83ncT44olHLDj7b2sJ4i6ksduJh3INZC7oN3E7wrxUFqJbA5w9Rkr?=
 =?us-ascii?Q?csrlRYpp+tG+YdppM3OzGsX7OTCM1Zh0J3kH4ZfNelJHbBQJIuM3WidnZnsT?=
 =?us-ascii?Q?QOiRsj56wSn1bRcM4QPN7VkdEvW9Zf+dCUoeoQ07ipEXF6/CcACP6LIgLeVT?=
 =?us-ascii?Q?D8gj8xyaeATipxfQbXqDkSiZ4ApViM4CSlN83vcxrbT35Q0y1BfBSBv/IONU?=
 =?us-ascii?Q?mvYlYZjlTItrP6Lf0LZgzhYB7ONbiNR+cPBUzIek74z4sWO01QOUo+zseHpc?=
 =?us-ascii?Q?b68ihfCuNjdZ1DDaQXXeQxLma35poXwv+bsm+ZiS5hE6mPW3Xhjy0f1KE4+K?=
 =?us-ascii?Q?DUJ8p7WDxOjglx13g8Z8Pj1R2FgGufws4hHa1ZfNVzmMLgo2TuUIsLF7Rupi?=
 =?us-ascii?Q?3eqnJMkKkijbCs3AOxHrEf4Ra4OnQ4JSw73IRbGQxUX0IYqa2XL8jG9D9Jg3?=
 =?us-ascii?Q?+1jOg07tWJz2gwTvtHNVBF703vHb3EgY5k9hugus//UHhrOoQWH80UDq+jgu?=
 =?us-ascii?Q?r06A2DN6b0DKJfyAppqFKeEY1KN9bYACXQDOQ3Y62CTRJdOw+c3E/AoZY6Em?=
 =?us-ascii?Q?qi9SoROi27+z7j5BglLauG76607VuxviH77x1rZ2f+sFlCu0ZyRr0sCmkd/D?=
 =?us-ascii?Q?L4S5oPdDEiLTCCuHE1cSJRTaTUYeRL2lxOcBTU3HSdwV8dtK4SLE07f93QiA?=
 =?us-ascii?Q?ZRRNS5SCWdvVRS9HSDnxmxxLoPse99qk9UfBpYlqtKsQf+z/zdjo4e/50dxK?=
 =?us-ascii?Q?Wc8XRejzSL8XUIInKTf5LOIzHKZNnSRYoOBrgK8gEMrrH7UPrEUE74s9hVUu?=
 =?us-ascii?Q?FQkqkZhd7ZgNdgM1SGK0bmMYrKeG8OeflgZQjErf8bV0JqP97a7y3IdRlo5q?=
 =?us-ascii?Q?GtRv7etKU94+WCf/q6povoo3Hzyh/3Q0T0iUyFpJdPyissSAQOWBKOtIQE0w?=
 =?us-ascii?Q?9WqFPuQxGL/fCD2EPleqEGyZ6hLFXEYWlulmC/d0hshHC8BV+ZXl+CgQ3w55?=
 =?us-ascii?Q?42Ch1T315cG6X+yBVemMLlp5JU95ivbRErEZ4XOzSQ7e7XAyafvPlOjmLWS4?=
 =?us-ascii?Q?vkqjNLQsNPBwXRZ5Ez1mVFGA4ac2+SF731BERy69wmDQ8nYGDVY10IoYM32T?=
 =?us-ascii?Q?7sK0/ui9gPi0hXKqWWpWoudpH1yCWahqCOSNH7mbuK8XAEFcG3Aj7J/Gz9J3?=
 =?us-ascii?Q?7dkc75kyB+Jd+1O+p8BqXbR63SxRUTCEbdN91FmtufoI7WGP3K2laT0D6lJS?=
 =?us-ascii?Q?+HLadkcD84sVNhB//EHNQwbyI6Ds0ycayqYWL46optJRAQkKBUocDmRZyYmj?=
 =?us-ascii?Q?G4xSNKcjAj/K0JhtTKyUS6wPLyH3ZErkzJmJBBLrctP1jKtemlJxgLD+SZ6V?=
 =?us-ascii?Q?ju4ebb7DlWsybAoOTtZGQW1tbTZfRVl81vrL1Rcw12Fp0qYh+579CiNRer2U?=
 =?us-ascii?Q?Jq03BGih6QQPjVqMh0rxZ8soVopkBef1H7kdYUjdxMptSzADNRVT1hRD4ujd?=
 =?us-ascii?Q?Qr1JPgUcc/MPxrbw8SoRZ4OAUqf7ulH7+vDpabspIiplpYsKr7cMvla1/J9V?=
 =?us-ascii?Q?TZYc0MhTnaV8sIQcarWqMKFyFkBvEStnLtjMHYhMz4SRK3lHQjBH01ON1pdV?=
 =?us-ascii?Q?0EaGmP9PUz5tIzidjreYE/k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T9oErEKbnALugD18mrrn/ZuKWqH0HGneBIyOJIlZc44hgaFk/ZWsO5B7uTNH?=
 =?us-ascii?Q?Oa51MMhh+TYEeykVpmOXyKSUVcvOg91pVxYrN0eLy12M6CVC4pzd30WbqmP6?=
 =?us-ascii?Q?OaawNOFKYt/swftGf1m0XifxmTxVKZPzd8URKAIUKbmOAS6/KXqVTw49prx5?=
 =?us-ascii?Q?EWPzJLdg0dTnDCaxpXXQuD737kvVlefeSjI7qqDGoq5nvgQYC3EJjqOxacc1?=
 =?us-ascii?Q?qzQZE72sZhCSswKoiKOQZNJbz6kC9sFYNvRlxyLVCDhKN49xHh9YsXvlqb8c?=
 =?us-ascii?Q?lIz0yNoD67xZNsszSA/zrXjQC42Y0b59hHoeswsjeG4a8RP9x7xITtih8Rur?=
 =?us-ascii?Q?HP0E+Wdcfty2Q1JiIZguyLZitevoOcS6hlKmMGERLJq6hJg7R844Q1GUJXum?=
 =?us-ascii?Q?/d67bEdG/D4aB8bswcraH/Y4iDIBUM3FKjlfq9v1/CYZFhyJkQzEZaA+oXKs?=
 =?us-ascii?Q?07y6vV8m4aLkIyO54vXARKmdPakFG4sToYgcORp6L8Ff9IMUqTrXuseiqYMn?=
 =?us-ascii?Q?occk4v5VZOKTYdQfBmjiK0THCYBIkGkU0U/W+UoemfPvWX4abSjbKLmiLWFi?=
 =?us-ascii?Q?iyhK6c72e43gEOl1MfYw4MOBGlDq5qf8jeO+W68Dlz0rKlELxOdlcc8wjfvR?=
 =?us-ascii?Q?ThOnqRgiTbWrIrdXZfNyA8GCbZhI3zDOjou27UV+HwHljnd9hjNmSZ0UPqH7?=
 =?us-ascii?Q?ZY/j5Y5BKKaR81cVZsLlr2X7uvSAwmtYMtwRT2cSrjQX5KP+mSfhRQ8D1l3s?=
 =?us-ascii?Q?UsPM7bh3OGfESiQ2plc5WWjQRJFNH3zRBTNi09DHyJ1rCfRrB7o3eB4QERPr?=
 =?us-ascii?Q?8rURRHyl0+QmqGmjiiNFCsOdhyqD9gXbrHa+uLgtqmTVCGSWglEo28lh2Y8G?=
 =?us-ascii?Q?OAAlw3Y/of4sKEU/TMl2KtI2L5MMqyHejcAfgAG3KekYZtXFWRXtfHpI3imO?=
 =?us-ascii?Q?ZHzFybbf6UPPpH2BeA2ApqjJKhyxBAc+gZN1ku5R5zS4S68uZTd2aIOWfaW7?=
 =?us-ascii?Q?b+Xqar7ukFV09kAZVOYts0NAwYroRLgBR/c3TnmsPwg5K80BLYHM07/QxiGD?=
 =?us-ascii?Q?PWaOYcM837A73Xrj44rHIo2AFa2UsdiGQ64Qji6NROj9ZveYyjCvv2TVIK/d?=
 =?us-ascii?Q?0pOVUaRWPy5Yr8U8swTU3cztJnAU9HqyRk/qvL3Gau3d6OzXT2XE/f61imhr?=
 =?us-ascii?Q?HeXwxk4gFxm6H4cmgId2ukZdGPdByPoBZbVHtnDw/ukh/rIONSXwVfGw5b4X?=
 =?us-ascii?Q?o40qgMBMJOleEFclcjqZURx2x1mxVakjmEq6J+9doTwWQvfs0fznxS4WWCMO?=
 =?us-ascii?Q?1B+O6bATUAEbyuCn5qfO6doVs48Y2ExwlvzRkHQDScNAvmWcMkwsOyk/dDTu?=
 =?us-ascii?Q?/hSLONo4qaEIKrt0GnqVdIYPc54LvMmy297BVM5TwOCLWc1KhDdUKunHV3or?=
 =?us-ascii?Q?INBrvtqtMKdMj7nAzmWhJTvQXi6SZEDT0tb62f9MnPFydQehngkeEDu3Ve1k?=
 =?us-ascii?Q?2FFh3BKHkfxpPqZuMIojf3mfpBCSfsuXuKhRI5Yg225+PGGUusT5Bff7nKD5?=
 =?us-ascii?Q?eWrvAyvRNseIlm7GjDODGfaT9HtiVg4cXyTE1wryPm/RxTO491fplQMjgLrD?=
 =?us-ascii?Q?AFqKF4KhBucaabZpE+INX5jzTx6ez+tlvsC+Kk+MM0mcdanV7NYsBAASsQ7e?=
 =?us-ascii?Q?vfVwbTd5hryusfZBLnLpBXiTBmjJpO97vmBWxOMjYc8ShTFYt5RvsPcJgT5o?=
 =?us-ascii?Q?bD7oYTyFcVeT/OETyHnSJcuqQsSSIMA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442af127-7891-4158-c070-08de73edb813
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:43:16.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+sM7Qd2BEqgrqRs+zBZx3DB6OkHBV4zu/FS5Am2FqS1qSyvliswsCY4YVt+wny95GhvHXfm8D8c3yc6/xOBxG9tFfxtSMp/9iNa/FRHE+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6660
X-Authority-Analysis: v=2.4 cv=V4xwEOni c=1 sm=1 tr=0 ts=699e1b76 cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=uPZiAMpXAAAA:8
 a=rFFRleaeAAAA:8 a=t7CeM3EgAAAA:8 a=n1RcSpXHCNW_RF1RZ90A:9
 a=YLtI_f64H5IAZ6mI3Lwl:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE4OSBTYWx0ZWRfXxMI+DSwsW9kY
 LNPLWIZ1inDuAJ7EW8wUylxce/JWgEF2jb/dgnFFYksFYcVKPdAhwpwoaUkCYv8xjQPiCER+nXF
 76hcf5w8Y2rL6RYHyGr4OCUygyV7q6KHHPHZjK9SZjBPlKIaDQzOtj+1Q385aFhSisMTZ+4nUor
 fiRKQ3mUkpYv98YAEqwotWOY/bemUCScBjnEhgU81MlcP1hsnSpHnoAoCqAwdhl6IfQ7s45/eGW
 0Spkg1BeM22/YjzZphHe9blN7CRI/8wb2HlPBfiFuo4rl879bReWDrQW1Is8dA1y9s/vtV+mA/U
 aLdC98Pkvn/YAzcIPU4+6Rv5Ce4og1IeY6ih5e1/ZUMvzNjQvZbMUlp8uby+KEJyXDsQl4GmyPQ
 ibaxq2B5yiMRPeNT0x0j+7lxUnIK42eVMAM0uqoZQiputWu3iHcEpPUrNjKcjeS8a9ui3pvus1x
 3Osvuo68dlYKul8vpOA==
X-Proofpoint-GUID: JsPtFjqJZy8Umvo9Zg6YO4djvnIS9CnR
X-Proofpoint-ORIG-GUID: JsPtFjqJZy8Umvo9Zg6YO4djvnIS9CnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 21:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231906

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Drop patch:
   0001-fix-compile-failed-with-musl.patch
which is merged upstream:
   a235f59 Avoid compilation issue in xio-netlink.c with Musl libc

commit log:

4ce8786 Version 1.8.1.1
f13b27d A few minor corrections
d5a2c46 Fixed a few buffer read overruns
b314687 Fixed issue with POSIXMQ in unidirectional context
a235f59 Avoid compilation issue in xio-netlink.c with Musl libc
a7058c9 Fixed strchr with const for new glibc
35d5da1 Fixed timestamps of -v and -x (really)

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-fix-compile-failed-with-musl.patch   | 43 -------------------
 .../{socat_1.8.1.0.bb => socat_1.8.1.1.bb}    |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
 rename meta/recipes-connectivity/socat/{socat_1.8.1.0.bb => socat_1.8.1.1.bb} (91%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
deleted file mode 100644
index 1bbc8096ce..0000000000
--- a/meta/recipes-connectivity/socat/files/0001-fix-compile-failed-with-musl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From baf05d4c74d35a98d65328b89627d1806bfd84a5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Dec 2025 11:31:29 +0800
-Subject: [PATCH] fix compile failed with musl
-
-...
-|../sources/socat-1.8.1.0/xio-netlink.c:33:59: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
-|   33 |         struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
-|      |                                                           ^~~~
-...
-
-The warning is due to the fact the NULL macro is defined (by most modern
-compilers) as ((void *)0), as it is intended to be used only for pointers.
-Assigning this value to the void *msg_control member of structure msghdr
-causes the warning.
-
-Make the 0/NULL initialization implicit
-
-Refer https://stackoverflow.com/questions/64535635/assignment-to-int-from-void-makes-integer-from-pointer-without-a-cast
-
-Upstream-Status: Submitted [socat@dest-unreach.org]
-Suggested-by: socat@dest-unreach.org
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- xio-netlink.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xio-netlink.c b/xio-netlink.c
-index 533d78c..cb31c43 100644
---- a/xio-netlink.c
-+++ b/xio-netlink.c
-@@ -30,7 +30,7 @@ int xio_netlink_mtu(
- 	struct nlmsghdr buf[8192/sizeof(struct nlmsghdr)];
- 	struct iovec iov = { buf, sizeof(buf) };
- 	struct sockaddr_nl sa;
--	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1, NULL, 0, 0 };
-+	struct msghdr rtmsg = { &sa, sizeof(sa), &iov, 1};
- 	struct nlmsghdr *nh;
- 
- 	Info2("Setting interface %d MTU to %u using netlink", interface_index, mtu);
--- 
-2.49.0
-
diff --git a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb b/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
similarity index 91%
rename from meta/recipes-connectivity/socat/socat_1.8.1.0.bb
rename to meta/recipes-connectivity/socat/socat_1.8.1.1.bb
index b9a27c648e..f6f2a3304b 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.1.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.1.1.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
-           file://0001-fix-compile-failed-with-musl.patch \
 "
 
-SRC_URI[sha256sum] = "91f222ee65559036600c2505b999acebed48b899f0e2e53ae1c9c31d6986b6a4"
+SRC_URI[sha256sum] = "5ebc636b7f427053f98806696521653a614c7e06464910353cbf54e2327adc1b"
 
 inherit autotools
 
-- 
2.34.1


