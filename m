Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8193C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23516.1787780765512476685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RgyvUFAr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKe5sg747340
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=tzGyhHLV+
	f4Qgv/xrFK0vBVO4hYg5+9gzUMBIr3kzWg=; b=RgyvUFAriLqtb5wF2OHlOhl5s
	IvqoQx5z+5oq5p8kua+Ymjz/ypTx605iH8lw0c90qTtYDRfMwS6YIS5Sgc2I797f
	yNUJdjUABKVlajh5I1DGohp/7bykwlQh9A37btqBTfoYCKlgmEInshPfgiKmAsFV
	T0Usnn2qAqRt90IRrPwG7jZE4nA4Ot2dmSIJuLpFI6Xuqs9m29UBPhfypC6za4MY
	cmSXTO9s6JL1jZbwrygf46zDCxoMJq+RD++BXuC7iafo85ZKmrawZc50B5xbb7pt
	617Qcz0Q7HimCKVUyhMmFozFWp5pxnCdYsjq11D0/Ca8zZQGlon8Gt3aEyXIg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020100.outbound.protection.outlook.com [40.93.198.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100qm09-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX1PFFfrXaB3TpfTYGjO0u7wlca/VEjFM9z9pvLBknrODmUR0bxQJis+pj4RA3PhkbRpdfP38admp93BGhTODVu//dbmY/vMbtibsVNryuEeTrBE1/M2/+mn6xtU9tubzz5mIXQmWNtUybO2t974MFC0LyAm7TzrV64TChi/j9i3n+If0ArMMIhlfVsShpl+uvOK+kGEntdRuitK+4E9AcJ1JuV0SiznsjhgbWKQEQwtOdY8qTPHHDH7mNnkC9sAUwNp6ohV6XWujMxRK2TuC1Wfxra/2TcOSTysBLT8dhmjSzXt2ku4FuPxwtGUhlz5k8UexLc4iyvfnZJt2kMaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzGyhHLV+f4Qgv/xrFK0vBVO4hYg5+9gzUMBIr3kzWg=;
 b=f7muy7p4K4W462Dy2TDwMEzGEb8qJ6uyz6ptto/N8RO6pHXyYrHWdh9iF9Xbzbt7ocVHyJoEr+BIDpozV5rGhHVIGgHKNeI/nmsw/8ikhpEOkCHfkRupOC+D8uVdc35CfTG8hlNRv/n1+zbj1iT559TR9fJOgyvmk3eDcTYkfvg3dJ1dELMceaoGn6dLgapWsTQDX90TE2Ut+4cdvJDIfSdPyRigNvAZTyyRgWFZZc6szhDoxsLUiYN40+urmO2QRc4DI3DMKxQT1T9f1JVpJhJt20nUcmR05bsOoHnqs4Fewk92YqlKJVmkNyxjd26Qag92/OWTeAlou0pmVMKv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:01 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:00 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 00/16] rpm: 4.20.1 -> 6.0.2
Date: Wed, 26 Aug 2026 14:45:32 -0700
Message-ID: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|SAWPR11MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b57ef3-a5b3-45f5-36f9-08df03bb6b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|5023799004|10067099003|6133799003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CwPV9FBP34vztpIXiC0VCq9B5qTRU3ZBKJxOXeiqSBPmRlcNj+GLfDTgSKVy3+Vg9QcNF+223TNbkYBgwfViNSQFCJ0Uxv5AjJdh+FTq6zGi4lvW/itdPp1N+cBhk4OfmzEZ8MsPO//o9krNik2Zy1WROijcSDb2UauqeWQsFUImoNQMr5+MqX3TeWJiBHjVQTSn7PcykJiDLDhtWH/biQRzW+CROohXVnelu4jCCbBxdHVghljMBny2N+F7ZmqqNWWmnsICCIzq1D6OpGqZz4win7Ert2E25WSRWhIbVoCbd0D8OrinSv2U/ZqIeOnktaFtCYbDCyfAP9DrkGOiio04Ej6ZqneXYS5EdfoHhtW+U0aJ8MKTzRrb6U3idGQITGmzHokm1dQJ0JH0QwT7WQWJ2bg40ER/JfQip+9Zo/uhCZ4OvN1oFUx4vsdyomEZ9BQEemCvKxWGpRw7ANrv3U9JsAK882ygIAKnS6/sIhEyLZgQmoBl4fhjlVNZmOZp1b88sYXCQicrleMyEMRgXwt3X5qcwg6Gn0YCMEvyj9wV1g2DJ4LB5grS8k0NmaJTzJzLuvbCoFagQQEt2256Y4Lyg3pKKj6vVPVYFqF/OuxZFgkSMhaAldbWBntc+2aTHgfVxZExFG+hwlOeODAELkGJoZmv80VyVmzdeUskvbV3vE3k1USyXAu6HzOTo4juUL8zANxi5644/pKJ1U1rkdaLj5XWeuxVAh+n0sDyzDc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(38350700014)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7zA5M6dk7KEtjOq+tnMTlAhC/+2x2gItrzKskY64xT+zARRaDlirLevEBSAm?=
 =?us-ascii?Q?MWROdCqOhBMaUmCT2GH/vbsm3rNZ1iHlOSheZt2QyNHxoc3iZ5bkkCX17ru4?=
 =?us-ascii?Q?0lm1U+bRFDTzUtIfvGX0FosQwLd0xTD/bznUUU9fd3N2rueqJ9Ba0fM/URMQ?=
 =?us-ascii?Q?va+SBeVUXePZSXiCGCeJLZ74AudD2/Q7eeCyq/li2vsgUlSxWJvQB0Uozo0o?=
 =?us-ascii?Q?TaRX78Xv/Vpfv5MXOBEyomK1JU7pfWuz+rR/ExXqR/K5wj0+5KqA0oXseJu6?=
 =?us-ascii?Q?EkX+SsP/T5VHyiCtUdFsNJqXGtm1dGJ4g+sgvnPqfpMfEMFLgYX1L+edeCca?=
 =?us-ascii?Q?1h/7eszsDd6RnkwzGkKu5aI+o8JimTyLozbQ7DXuHCeUnwH4X7dCVpGEvpkw?=
 =?us-ascii?Q?0xaiq0x9uMJj/86Zh+rLlPpV0dKBHC2yiNeX+6RV/OiYMiPcTtG0xpUAup6A?=
 =?us-ascii?Q?CV2iS/6VhCW22acoEVv8eCoEBY1TALdblAvDwcSXJScTBgloNUFVEvyk6WNz?=
 =?us-ascii?Q?E3WwPxRa5r7kQ3ghjoiBOT34sjlfQIDYJi3zHZ/RXosSLRDNfQZjAaQXUGhP?=
 =?us-ascii?Q?Exxp+F9RaZCa+ADIznFkNg6kelLZ36z/69uPca3uZoKztNy/Pp5yvGg090cp?=
 =?us-ascii?Q?Vc6ShXix5cj2XZiAvX+onkYeN6s55Pk9PH+39L98ygCqTylnVZuEEBcXd7lS?=
 =?us-ascii?Q?gZMMI9hPdmUbY2PS7TspfZKmX7oUC8xFDnJgjJ/Nx4PbUWGOabJddKidBtkq?=
 =?us-ascii?Q?uGITiWpxmyFkz24IPqCD+WSD2EQcX8N3GGVoX8cdUyB/VkZYyOP2mG5nHhhD?=
 =?us-ascii?Q?OGQyXYuTjhxCV0U/y/zbkH2OaubX0aXdTqv8QTgAvc2HEv6CGa3E8WvtMhSi?=
 =?us-ascii?Q?oKvroKbsbR9i96enlu5blIQihYTBqrZjtaiRFkMwE++SV8JBXetReeko3bP+?=
 =?us-ascii?Q?V0f+xJPqC9cY1UMGHhM57+GAH6G/44h9vzFOosVChgSCvEWgTSmdQaNk1UEP?=
 =?us-ascii?Q?1z/rDz0EOZFJ8ZTqx901blbKeTf3A5tB1A2IGc5wDCDrFY0Wl9HL9TGwpXW7?=
 =?us-ascii?Q?jv/V7HlhSIySCP2MC5TFMtkyWEaJxBYGKafdRXkTjm1GdC8I+WVw03P72974?=
 =?us-ascii?Q?7dhYT4ubLdMEyyg6BAhHT0VslpBuvGU57uWJmCKhZkkXnOedal/1VPwDpI0i?=
 =?us-ascii?Q?qqONgpKccvBnEO8qpJEjmfofOqVR67M+E37l2t7ZSgcZC8xo+EUCf7bMoyXe?=
 =?us-ascii?Q?gE+Rd8G1J51L/TNvFJh6yejnVe4QToqZIpdgx5m+eIJloLoGyiMt1d5JiDHX?=
 =?us-ascii?Q?SY+dxbsedKoaxuRHGx/vaFOdOKOw7FsQ5ofz1sQn7G2YXXPdc9xXlVXjuiZI?=
 =?us-ascii?Q?28aA4frJqzZ5Ah19tuuE1ckVrmWWrdL3K6F/CkeqVWFmFpy2qTJtapUvuy0V?=
 =?us-ascii?Q?q/0RFy5Jaf0xTP/JumVWLAa23mxnHo1+0gmxlOAeNA0rT3MP0HJ1qEiOpJOv?=
 =?us-ascii?Q?22fdz46LrKmHB2S7w3ijY/IlpNZhYxr6nqZkSCB0BAszcTwygD+4XwBLuhhw?=
 =?us-ascii?Q?H7x5CZO7LhsTtZ8u//KJ8suyVX/gFT2NyW9N9EYpx7ktdJbsSc5PwaRybVva?=
 =?us-ascii?Q?dbNdFlEepI54teHToQ1Y2ImGpLMhDstrUOacRlQdOp4RkiVK1nvObVDqbDK1?=
 =?us-ascii?Q?JfqdJCprY/l8xY/Xy2lwELtDTf/31aYUgNDIQbj6aVjhDWyBTpOJyoNv1sqP?=
 =?us-ascii?Q?MwlR3OhHfxBqEvc8/m6XqJPBo4hMIms=3D?=
X-Exchange-RoutingPolicyChecked: 
	NFCLdtH+ubNDOqapgRi5DswHteZaCr5cpFE040sBAf7wIRxdGj3rUVcsYWprRjXAzo4BR/9AP4H6kWHpCM7Ox5c0Pbt/hd7SmrTnNlCJ9xiFu+iBm4miBx27TYM0fngiO8aX4FnfZmkSAkz624084IAPPyhaNYsFi5b35dEjNMB+1j5WCy5Qv8VHFNLaxv60rzrFn76+4A1n2+zVdhmqXvpbJRqQYxSoN6xukrCFPMaegSA15+ljx6OHWLUEIMiO6mpi8aIRJ7CZu2VFhFTCJ7vUGHG/rYzsc5HM5/hKQeLKIMeIfhKoYAMMhtJzl0k1eDvUas5i018RSGSq2n1DlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b57ef3-a5b3-45f5-36f9-08df03bb6b65
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:00.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye8Tlr/Pyth7guO/8H7JZQ04uCSBYGlOMbP92uYGsmYuTziS5WqhUZo2TWFvwek23U7xZQ/IX22St7QpIlDU5UkGJ3qBOZ3p7N5vA0nkGKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 1mMU5UlokUhXeGZme-BOiDHI-PjkkQAg
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8f5e9c cx=c_pps
 a=rsLXg5VPEOJQy+C7BNxFIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=2Zl9oZh2-jUpCg6rjhQA:9
X-Proofpoint-ORIG-GUID: JlrOtZehMaKIGP-omklkjMiTd-wR4GJ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX0MM+mKWmVyKY
 sTFheaWBoTWytIOJzlY399WpqZ+xPGeUuZgDUWjN4QK1T1jRo6EPLBuFvpmaUkDgB8ciwiePrks
 +O/8BfH3qzROThcA/ySlz8rlPYcawKcdbznq08wIedMSs8qsfim4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX6ptpfXyyRNUN
 skGl2dP17gUnYwjytvifPPbV72SQ3q5YxN6ojgGWFZnM+1radPZgTw0pcno49+9XlJfTl57VSA8
 MJEk/lQuaqp3rEBgKCrp5MgQAw/BTP2E+wyS1WBWBxCOm/OcLi1uOOAY8P2MzvVV9jlhxjN7soX
 X0ibOoZvbufNBXu5Rh0itrzTseMDyIpAn19S/7wMFlr5pZAeLVy8Rb6vZjItZy5PFbsfdnHiCbk
 dD7FTs0IgVRKuwjyT3c4k97vau7msKm77MQZen3HI6D0N9vOse8/Cry5NnenZ1S9DSR7JbhiywY
 dteIAMPI6OEbLztbBg8xC4w3FNB4YRXINzYNBkV7qkmW1vMrjvFuqhTNxqQmnMv4jpLQ3aGhUv8
 fHt9sbNbSvWfB+jdB8vcjMVaoumMSeRucNRicOuzL0i3ZZIRN20fr1KCTh35oKmrRdGwHohFS1c
 LauGnOwz9TlIBK0mazw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244417

* V18:
    - patch 01-09: unchanged from v17.
    - patch 10: split into two patches based on richard comments.
    - patch 11-14: no code changes; patch numbering updated to 12-15.
    - Added "package_rpm.bbclass: filter pkgconfig() deps regardless of
      generator state" (0016 patch). Fixes the reproducibility failure
      Mathieu reported on v17 (pkgconfig() Provides/Requires differing
      between reproducibleA/reproducibleB-extended on hicolor-icon-theme-dev
      and others). __pkgconfig_provides/__pkgconfig_requires %{nil}
      don't reliably suppress RPM 6's generator; adds
       __requires_exclude/__provides_exclude as an unconditional filter.  

* V17:
    - patch 14: replaced non-ASCII arrow with ASCII in commit message to 
      fix DKIM signature verification failure on patch 14( v16 patch 14 
      could not be applied via b4 due to BADSIG)
    - all other patches identical to v16

* V16:
    - patch 01-09: unchanged from v15
    - patch 10: updated - rename target path from pkg-config_3.0.5.bb to
      pkg-config_3.0.6.bb to track the pkg-config version bump that
      occured after v15 was submitted
    - patches 11-12: unchanged from v15
    - Added "package_rpm.bbclass: suppress RPM 6 fileattr dependency
      generators" (0013 patch). Suppress all RPM 6 per-filetype 
      fileattr dep generator macros
    - Added "lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on
      %post failure" (0014 patch). RPM 6 #3819 causes rpmtsRun() to 
      return -1 for warn-only %post failures via ts->scriptError;
      intercept in _invoke_dnf() so install_pkgs()'s existing 
      scriptlet scan runs as it did with RPM 4.

* V15:
    - package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
      compatibility.
    - lib/oe/package_manager/rpm: Enable DNF filelists to resolve
      file-based deps.

* V14:
    - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires"
    (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppressing
    the /usr/bin/pkg-config emission, added:
      RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
    to the pkgconf recipe so it satisfies the auto-generated Requires without
    modifying the upstream rpm script.

   - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
     RPM 6's internal dependency generator auto-detects file-level Provides
     from installed files, so nativesdk-pkgconf already provides
     /usr/bin/pkg-config via the wrapper script it installs. Keeping the
     dummy entry caused a DNF conflict during do_populate_sdk:
       nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
       provided by nativesdk-pkgconf

   - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
     With both the RPM filter and RPM format reader registered, the filter
     intercepted RPM files first and failed to parse RPM 6 packages
     (debuginfod scanning still failed after the 0004 patch). Disabling the
     filter's automatic bidding lets the format reader handle RPM files,
     while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
     explicitly, keeping test_read_append_rpm_filter passing.

   - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to include
     the test_read_format_huge_rpm.c changes from upstream PR #2846. This
     test now correctly exercises the format reader instead of the filter.
 
   - Updated patches 7,9 and 10 for the latest master changes; no code 
     changes; removed upstream modifications   

   Tests verified:
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
     - oe-selftest -r sdk.SDKTests.test_sdk_manifests
     - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
     - bitbake core-image-ptest-libarchive:do_testimage
     - bitbake core-image-sato -c populate_sdk
     - bitbake core-image-sato-sdk:do_rootfs

* V13:
  - Added "rpm: Fix pkgconfig() Provides missing in cross-built RPMs"
    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh
    so pkgconfig() Provides/Requires are correctly generated during
    rpmbuild.

  - Added "libarchive: Add RPM format reader to support rpm 6"
    PR #3346 from v12 was insufficient alone. Added PR #2846 patch that
    converts RPM into a proper format reader for RPM 6 packages.
    Existing RPM filter kept for API compatibility.
    test_read_format_huge_rpm.c excluded (filter intercepts before
    format reader).

    Tests verified:
    - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
    - bitbake core-image-ptest-libarchive:do_testimage (libarchive_test PASS)
    - bitbake core-image-sato:do_populate_sdk 
    - bitbake core-image-sato-sdk: do_rootfs 

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (16):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6
  pkgconf: add /usr/bin/pkg-config to RPROVIDES
  libarchive: Disable RPM filter auto-bidding and update huge_rpm test
  package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
    compatibility
  lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
  package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
  lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on %post
    failure
  package_rpm.bbclass: filter pkgconfig() deps regardless of generator
    state

 meta/classes-global/package_rpm.bbclass       |  105 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |   10 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 .../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |    2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...-Verify-that-bidder-and-filter-match.patch |  103 ++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1440 +++++++++++++++++
 ...0005-Disable-RPM-filter-auto-bidding.patch |   73 +
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 29 files changed, 2192 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch


