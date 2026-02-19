Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE0CE9A05A
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 19:12:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22167.1771528363432583325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 11:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eROlNmhS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651017371c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCKK2C240940
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:12:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=qSlAmDGOu6cKF/8ZkwW4x8twMZMRDP3m0iah+DDIC1E=; b=eROlNmhSxi7V
	/jJyKxYIchlPRMAAReAYFoUXbOrFxsXO+uYZwiVIXSXOLCFIYdXB9Qz6CQOZaXa7
	tn6cpE1sQtcWmSegVion1qJ/7oYGUtU83ePTNIB4yxOonPSpgyRbHYXqbR3oVW0V
	jo0e2eESou6qUirj7H1gKQnhIq+hNTzZNcMDxxxpVB4XtWkjLI2pqN+GL/XAhrbU
	rT/QEgDmTRSAsuh+eeTCUwJ+Fxcp/S462uMMOEv7tWvA9xHKGtYjM3fKPnKF3uzP
	AdbZ7Ia2b6Ky78TNdI8OXPBGHUM4mrwD6GaPHEub1bNVrxjH3eCqpcKvGJ7cc/9V
	mkXqjG9z/A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuagrnn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFMOkPbIHXu9Fe/mhE1IpwwUiBbOxcCTi0Zxgsyqme7epaOP4CW903nGAjbm778JarELjkKlO49Y9bgp32dQovoi/joJdKNZVXaCsK2PpNc1hWWQl9/AT/D2ymQa9YbD6pEMLQHMayFP2F8RfAeaPfweKhF639ur00dG3+CTBe1WtDdSAtK6nevlgr45jsNj8A6evhC2zsIMGeNzu/mUYt1negtWRArSqOX75AdcRkdEdfPRygVFRBiWJFzmu3h+EsU4S694b9JZaO8qjZHg46mmOULnVeEBkeseKplKzTfFMBkCmvNepuzBk4vv61KaG+GBV/zBTPRjZkmqGIIDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSlAmDGOu6cKF/8ZkwW4x8twMZMRDP3m0iah+DDIC1E=;
 b=qZL3CFHXEznNcBZ0DL1/g1hR+rEjR8iAME5CspGAoNvBCXsxFstA3L5hVdMnVgn9dNIaYvOtzKWaApVL2IVyYL1ExYFviC7EbP2KSrJNMsu7umsaRCK5qweEmfIZOR2dIRcSI/nUxTKTWQQ59UuHkX3Dr7L6ee7xcpKVbLkupZM8VqSE+6rQgK7WiPdykwIsr23bOJqum09+z1veeN5hqQkp7mDKFpKP6wGq/RARj1279AarL7IJjnShtSJ/VGMncHwwvLCtdg3fEfTIe64j2nA9IcSL99YKQDg+AZE7E6+AlcTrGn3d9dYtm2UiDzJe7t5ypxtu6r4AmYJ4xc8Yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 19:12:40 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:12:40 +0000
From: Randy.MacLeod@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] coreutils: upgrade 9.9 -> 9.10
Date: Thu, 19 Feb 2026 14:12:20 -0500
Message-Id: <20260219191220.460166-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219191220.460166-1-Randy.MacLeod@windriver.com>
References: <20260219191220.460166-1-Randy.MacLeod@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0281.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: fc30ecf4-34db-41b7-0486-08de6feada11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bPvsgp43YTUegqJH5tMBVvGC4Gn35WxfHkAIu/quAIUGlgoi0X6++SALYe9h?=
 =?us-ascii?Q?1QuZVmBzkJ9KjDExqEAv5zHuHhQ/abX/sv5je+1prnSYU9TjI8+dzayoPrSF?=
 =?us-ascii?Q?bcolqJaHdq7KPEaObmr+G7lZRJI65pG0HZS2Is4xtCARQOOz/oH3u78O4JyD?=
 =?us-ascii?Q?MYBZbd85L7LsoQecPddWOKRI/hSW+nfSlT2MHTV3MmMCqK4rOK7n2pXcva9g?=
 =?us-ascii?Q?QuaYbzKVawNWONE7WAlZrY1WE2TRF+XPyO/dNogRDVw47iTNyx23pfgCPdUK?=
 =?us-ascii?Q?b5XUvABzsF/rr80dR+k5xqCMJDyOJ+sLZNULl7EmF/HNivEQIsF0Mck6hCkM?=
 =?us-ascii?Q?gS2WlvtCE0rG2M7tk5uE3Uts8ZlzO078FvRPbNgWfBVQb8sG4jc5yLonx3r2?=
 =?us-ascii?Q?M3YD+kJVIr3Ln9uNrgHH601wuHzt8fKbq/BAR3hB7zha9wDyKTD/FZw+dMZ5?=
 =?us-ascii?Q?6hPZIt0Nl0xeUEIwY3+DIkzxCot9M6us6ep/wDHvHnlNH2DiCy7xDg39EEOs?=
 =?us-ascii?Q?vq7t8uQ7bokcR5zh6H1jOTGxj9XfBR/IPFUaB4lx31sLtjWa0ehJx/ELZsOI?=
 =?us-ascii?Q?uptanj3HFwTsUa+2Q/lxCzpAHtD3vOhtu6Rs8t5Pn2tQYh2xq1A1Kss3IiIQ?=
 =?us-ascii?Q?8kbuyaXga8+VX8HLpk8tMl5R1ogX/Ng5/Tgzqalh2wyrdNnxTnZ/lY74p7lI?=
 =?us-ascii?Q?04XO8JcsWCTjR/eU5rrnKXKg2FXz2/9FxP1k5reBTvsNChM7SnPCY04boAwT?=
 =?us-ascii?Q?APAAnDo1CGfY/HtSzldkjAQjFX8JGS8yvGfww4M/X/fcxUpJS/EsXingVI+0?=
 =?us-ascii?Q?WGb8tSn310xXDQodSWewyoGdqLJtmZea5wj1MJgEYJfskxH70LT+JLqmtCjX?=
 =?us-ascii?Q?7inrgtr6pzJKHNqF/pZ42ZXJqr3yyl1IDzMlkLsw7DlmWUz9c3ljWT0f7Ert?=
 =?us-ascii?Q?YPNz4RLTGCxb1qUXSNEk9cGRabQT/SPQTP5kQslslat3V2j27TD6Fbe+aKvx?=
 =?us-ascii?Q?QBBFwdNM2rg9jYkspsn7uNwwkNbfoWdUHkOzt5ljCu57EvQJ0Sgt9rmzD2+y?=
 =?us-ascii?Q?ck8I0GsoEvFD+aeyi6zEO/HXv9XGhgR4mOs4dJBKhtErvgk4Aas3DZzo+aJW?=
 =?us-ascii?Q?tw4gnK02wRd6G9VhFeDYtLspIbqEyE2Xw2VjFc6HtQEdFsGU125KrWcqKAZG?=
 =?us-ascii?Q?iV8iYfRLTfkAfhHAuoSSLq8EpIr6f5DWCihb1ebB2jNjT5AuGbV3Dt22Qt6C?=
 =?us-ascii?Q?ZmARoty2l2fWqFPEpFoKqnGa0sHi4ClqERx85VpOYJzsZpbO7+WQU82wvdf+?=
 =?us-ascii?Q?u3AEbqncMl7poLVrws4lPkZxk+yK+QhRduOdElwYcMdK+w0l/+uPWbpgGFRb?=
 =?us-ascii?Q?qRAzRbEiVkOxeQi1KbxgZx+zLIU9XRiNysBe82/wwlIurIR0IhO5CCKPFKmp?=
 =?us-ascii?Q?D79erJuX/xUIYBeU5WrUVC7m50vzMKLm7yBZMPC9q9SQJzFGWL6JEFzjS3qH?=
 =?us-ascii?Q?6+/XrsEYLnSAxNViSC2a3cn0B4FOeUOYwH6gDMrzQxcLfya4dR4Nr2Zu6rDL?=
 =?us-ascii?Q?j9CRHrFMK9rmnsEBThIH4NDUE4WZ5GZUe9ZnNN0Ixc7xD/k5Lf0JL2rVHu5y?=
 =?us-ascii?Q?eEMRujrUAw+fUI0/RNueU2il684MGZJGBPxXUsOdxnGN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Ih+4xVEoslJOT+Y9CD1L04Nzfu1xki1vWvQF4at3W3MvrRwA+S4jaKTdY5W?=
 =?us-ascii?Q?SNz23qnT7aC8Cesw15oV/27eOiJQQSH/h16NzbPEe3WryNxTfPVrODJmWueR?=
 =?us-ascii?Q?ldVcCDfQmBIxSsUD3O1lpibhpuuV+Sf+nBwljfQiF1EpBBbuVdZPIdHCRVkB?=
 =?us-ascii?Q?yIhrHGg9G/3N+ndMRktKWB7mZtT6vsoiKdxKUp085UD6F3I1O6bgB+3vu8BE?=
 =?us-ascii?Q?Yj5Llo2SYBCKV+e6TG9wMs+gTcZKqJfJofnbqRJqkMizbkrlYjEYCfQkmwEA?=
 =?us-ascii?Q?DklZSv+KKiJw2P/PE4JI6bJp0eswmNicCM5yZzmQERPTGxfPvKSu3z6LMgtz?=
 =?us-ascii?Q?5zEMwph5vqriiYUwaD9PsCJZFhLD8PriMbTEC9de3p7JrpW77fgBa/mDcrLg?=
 =?us-ascii?Q?UAST0NbeKEOmovPNvJOms3n/nzEZdlc1C1H9qdy9BM5SzBs5B4mCOIUlbowC?=
 =?us-ascii?Q?BdayCZcErPkKmAXPTYpKzqZuMfL3j6+5ZoRGb67wto2gLQqXHI2GJLReM5Uf?=
 =?us-ascii?Q?E+WVGZGI8USLTY81ceMiO95CyHZCSAvmWxyHpznKXeXkXOJUOVnnRDCbB3Z8?=
 =?us-ascii?Q?Hru7mqhYl9QJ1kVpbX/O/D0EJ251Iim0LZaI3EwS54KHSeuGIB4UB6iKwgeo?=
 =?us-ascii?Q?fg9X+HEed93OYWpBVqe6ocUITVy05JItvsVib1z3kI5mjkTfEznXlKmBWow5?=
 =?us-ascii?Q?kCHjKaMw1I+iyFdPQ28c3aj33IsAD/gPsCIRWGASk43Q3YAFJ/6PqtGZFb+Y?=
 =?us-ascii?Q?KvR1Vl9aAMwYyse3YVa32AfeNLfskez6Wd2pe7+IXyMoCegRZBpfs5ws4gNg?=
 =?us-ascii?Q?t+O75T024Q7sPrjo61A3njVg/Gc5ybI1QLWFh4Uh/n7d4cCyU7UuVsSH68e4?=
 =?us-ascii?Q?s+kUT6x7jcd/grNCNMtwbbrfw3s0925XCVXng5ZtsUHhE+18M0CyDdEhLje6?=
 =?us-ascii?Q?zwI0hzJ3kukYdr0SjyHzxieXKHsI6D7AVdvL3m7MZkyciXwKuN/zJFhdF6Wb?=
 =?us-ascii?Q?w1Fzx+fgAwGkDjGkr748Qam8lhdvZ+rHw4s1UtlSU+ZHfx2SyghEoLMintXU?=
 =?us-ascii?Q?V/4QZ6kA3BONSitZFbdOK4xWTSsuxPAJqSe3nNCZinNGnjXDBU0rVuRMXxNY?=
 =?us-ascii?Q?SsF6PGRhX/KyBu7Uv8bX7K8SwkpBD2lxlaJ4/k/MqQKQbJTRv9PN1NSHFhfi?=
 =?us-ascii?Q?zkolqcID252Udh2w60p95HE46ejjkD6ZQ7ha/4Ft5GQTyJvLRB71vFfbW4AA?=
 =?us-ascii?Q?Yj2fSdowhedlz3JNCkaf4z8HUBjkEapzliDVEnHQVZtEQHSibMrJ4+OGXL39?=
 =?us-ascii?Q?AnDWi2jnZZRVhAgqbmFIzhvSEZ5aZxpe0ABB/QZV84U8K39ALqLVz38iZMTp?=
 =?us-ascii?Q?mM+/H3RJ9AEtqjbixEG8cBdaSdw8GhTg48rYSLtnwa1WfBICg00Ac7bSL7PP?=
 =?us-ascii?Q?gADQXDL4GKvIqEgBOUD4DnX4NBLf7UnMGxkR/kVonQjj1eGjj9ZEPrF5aKw6?=
 =?us-ascii?Q?A7yf5bvZ/XyxptC5FEiBFtkSxQYXBoHSh647zToo7/B0MN6ksef1bqemMSj9?=
 =?us-ascii?Q?5n/Qol1UXF2sf5yDPqIJWXrF+XOj1lB2oM48HuAmS7gnYDrHK7oFiU0tP6Jc?=
 =?us-ascii?Q?m9WZ7WPZRnw+l9vfPCAfZn21MDBbWiq/Zi1K+S6XnbYumg0bB2rIZbQImafn?=
 =?us-ascii?Q?avYHBAMjgMOVmYMxis9xJ+HNy0mcVCe07xSLds404Y1/J+51AraSZva59NEc?=
 =?us-ascii?Q?Ndca2OtnDwz2dQC7C78esWgSIWB4G3U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc30ecf4-34db-41b7-0486-08de6feada11
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:12:40.7284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yT5Ncf2k/457rtmU+obALZwousBwRelucmd7+tOZJr6JStn7E70AsIgcDmsqoKK8uVF+tEToNZ+pid6oxKPzHl/XB1zmkCmItbvFot+tIqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=699760ab cx=c_pps
 a=3EeCZaq8L1ZepF5DamB/SA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=_jSD2gayuV9mtc5T49UA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-GUID: tp5qqIpT2Z3ymVZKuDTX5ZwL_v3v6xmr
X-Proofpoint-ORIG-GUID: tp5qqIpT2Z3ymVZKuDTX5ZwL_v3v6xmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE3NCBTYWx0ZWRfX58CXgdrIGHOH
 PJqycZyIfPnQT23ssHW3Xh3c5xJi9n520fqj38/lkgjIwxJCQ5UtEpWybd4Q32brfR4S6zx1OCZ
 47AdxMh8/Mx4nV1ykS6zFppERT6WMHRZGzXJADJUuk7mJH98/IH0QEMnVQPeiV3AOv3ijaoklMG
 UeFZOEyzzgybjdAujQ7SveHG56I3utWQ7lEU3YYavs7JDgnCVPBt3KpKPsHD46DxxyOB7Dh9mq8
 o85m2t3I6OGENJjAa8yYQ3EAefiC1VjaSaHFXoOA4OIcRAVKekoOme9MKmJHi3J0HRwEBzZ25C5
 fPYfBpiqtL2n66JZwZp3LFMilZ0L/oBvbnX9qN+pJdPpzXIR2pALkwXrV9n9ne0yCQ+WrSSuNBM
 V2JriKD5d5pEhWeF/J6t9x5lAq6PqO8L9EtDRZpyd43GvLZvj9egGrsDoICXHFyznRhZ2QEVoLq
 y8XQUYzEMLJ5apkQgVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602190174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 19:12:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231439

From: Randy MacLeod <Randy.MacLeod@windriver.com>

From:
   https://lists.gnu.org/archive/html/coreutils-announce/2026-02/msg00000.html

Notable changes include:
- Options in man pages link directly into the full web docs
- timeout(1) now kills the command for all terminating signals
- paste(1) is now multi-byte character aware
- cp(1) fixes an unlikely infinite loop introduced in v9.9
- The multi-call binary is 3.2% smaller

Drop the 2 backported patches which are now part of 9.10.

License-Update: copyright years refreshed

For ptests, also install coreutils.texi which is used for a new test that ensures
there is an anchor for each --help option for all of coreutils' programs. See:
   https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?h=v9.10&id=77e6b5d8f8d1ebc3125d6585a266a912a1123791

+---------+--------+-------+------+------+
| Version | Libc   | TOTAL | PASS | SKIP |
+---------+--------+-------+------+------+
| 9.10    | glibc  |  705  |  543 |  162 |
| 9.9     | glibc  |  683  |  527 |  156 |
+---------+--------+-------+------+------+
| diff    | glibc  |   22  |   16 |    6 |
+---------+--------+-------+------+------+
| 9.10    | musl   |  703  |  544 |  159 |
| 9.10    | musl   |  681  |  529 |  152 |
+---------+--------+-------+------+------+
| diff    | musl   |   22  |   15 |    7 |
+---------+--------+-------+------+------+

Most of the skipped tests are due to being "very expensive" according to the coreutils developers.
The other skipped tests need strace, gdb, etc or locale dependencies which has not yet been added.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../coreutils/0001-fix-lseek-copy-loop.patch  | 35 -----------
 .../coreutils/0002-fix-lseek-copy-loop.patch  | 58 -------------------
 .../{coreutils_9.9.bb => coreutils_9.10.bb}   |  7 +--
 3 files changed, 3 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch
 rename meta/recipes-core/coreutils/{coreutils_9.9.bb => coreutils_9.10.bb} (97%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch b/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch
deleted file mode 100644
index 04380a575f..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bd528f923482223649aa84be7d131e69356149da Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Sun, 4 Jan 2026 12:45:46 +0000
-Subject: [PATCH] copy: fix possible infinite loop with SEEK_HOLE
-
-Commit v9.8-95-g4c0cf3864 intended to initialize
-ext_start to src_pos, as was described at:
-https://lists.gnu.org/r/coreutils/2025-11/msg00035.html
-However ipos was inadvertently used, which is only
-valid the first time through the loop.
-
-* src/copy-file-data.c (lseek_copy): Use scan_inference->hole_start
-only with the initial offset passed to lseek_copy().
-* NEWS: Mention the bug fix.
-Reported at https://github.com/coreutils/coreutils/issues/159
-
-Upstream-Status: Backport [commit bd528f923482223649aa84be7d131e69356149da]
-  - Removed changes to NEWS as they don't apply.
-
-Signed-off-by: Paul Barker <paul@pbarker.dev>
----
-
-diff --git a/src/copy-file-data.c b/src/copy-file-data.c
-index 927a6e0480..56b669fe72 100644
---- a/src/copy-file-data.c
-+++ b/src/copy-file-data.c
-@@ -338,7 +338,7 @@ lseek_copy (int src_fd, int dest_fd, char **abuf, idx_t buf_size,
-   for (off_t ext_start = scan_inference->ext_start;
-        0 <= ext_start && ext_start < max_ipos; )
-     {
--      off_t ext_end = (ext_start == ipos
-+      off_t ext_end = (ext_start == src_pos
-                        ? scan_inference->hole_start
-                        : lseek (src_fd, ext_start, SEEK_HOLE));
-       if (0 <= ext_end)
diff --git a/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch b/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch
deleted file mode 100644
index f247b6412d..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 33bc44e1ba3aa4c70f3cd16aa9c41331543986dd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Mon, 5 Jan 2026 14:46:33 +0000
-Subject: [PATCH] copy: protect against infinite loop due to pathological race
-
-Consider:
-
-1. In infer_scantype():
-    - SEEK_DATA returns 0
-      - hole punched at 0
-    - SEEK_HOLE returns 0 (now a hole)
-    - Cache scan_inference->hole_start = 0
-2. In lseek_copy():
-      - data written at 0
-    - ext_start = 0, use cached hole_start = 0
-    - ext_len = 0
-    - now loop doesn't progress
-
-* src/copy-file-data.c (lseek_copy): Apply a more defensive check
-to ensure we only use the cached offsets in SCAN_INFERENCE once.
-This protects against an infinite loop where an extent (at SRC_POS)
-flip flops between data and hole extent while infer_scantype()
-and lseek_copy() are inspecting it.  I.e. ensure we use SEEK_HOLE
-to progress the copy.
-
-Upstream-Status: Backport [commit 33bc44e1ba3aa4c70f3cd16aa9c41331543986dd]
-Signed-off-by: Paul Barker <paul@pbarker.dev>
----
- src/copy-file-data.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/src/copy-file-data.c b/src/copy-file-data.c
-index 56b669fe72..9bc4311af4 100644
---- a/src/copy-file-data.c
-+++ b/src/copy-file-data.c
-@@ -335,12 +335,19 @@ lseek_copy (int src_fd, int dest_fd, char **abuf, idx_t buf_size,
- 
-   debug->sparse_detection = COPY_DEBUG_EXTERNAL;
- 
-+  bool used_scan_inference = false;
-+
-   for (off_t ext_start = scan_inference->ext_start;
-        0 <= ext_start && ext_start < max_ipos; )
-     {
--      off_t ext_end = (ext_start == src_pos
--                       ? scan_inference->hole_start
--                       : lseek (src_fd, ext_start, SEEK_HOLE));
-+      off_t ext_end;
-+      if (ext_start == src_pos && ! used_scan_inference)
-+        {
-+          ext_end = scan_inference->hole_start;
-+          used_scan_inference = true;
-+        }
-+      else
-+        ext_end = lseek (src_fd, ext_start, SEEK_HOLE);
-       if (0 <= ext_end)
-         ext_end = MIN (ext_end, max_ipos);
-       else
diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-core/coreutils/coreutils_9.10.bb
similarity index 97%
rename from meta/recipes-core/coreutils/coreutils_9.9.bb
rename to meta/recipes-core/coreutils/coreutils_9.10.bb
index 1a017cb0bb..984c5b5292 100644
--- a/meta/recipes-core/coreutils/coreutils_9.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=824c1997414aea9f344747bd81cf5a31 \
+                    file://src/ls.c;beginline=1;endline=15;md5=f3bf23485dbd07e6c14bd74401b744c6\
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -15,11 +15,9 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://0001-fix-lseek-copy-loop.patch \
-           file://0002-fix-lseek-copy-loop.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "19bcb6ca867183c57d77155eae946c5eced88183143b45ca51ad7d26c628ca75"
+SRC_URI[sha256sum] = "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
@@ -179,6 +177,7 @@ do_install_ptest () {
     cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
     install -d ${D}${PTEST_PATH}/build-aux
     install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+    install -Dm 0644 ${S}/doc/coreutils.texi ${D}${PTEST_PATH}/doc/coreutils.texi
     install -Dm 0644 ${B}/lib/config.h ${D}${PTEST_PATH}/lib/config.h
     cp ${B}/Makefile ${D}${PTEST_PATH}/
     cp ${S}/init.cfg ${D}${PTEST_PATH}/
-- 
2.34.1


