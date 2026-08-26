Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EC0C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23524.1787780773627281446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M35XjGN4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKdCQv405552
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 14:46:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Sx6BTDfcjeWeuuaGJCOtC8K59Z/lsdZ6zmvYIuQE6iI=; b=
	M35XjGN4fvmduP3+/WsSqLTUmLc3ONRnrelWv0wSpSOGdSfvUjItyI6wjR8HX0fj
	7P1q+ggrUn25l1SeeK6nXGBfgMggi+X2Cvk2wtunpx+4KKJXVIhvnjDapNliygCd
	HISStru9y6RRE0S0LokLWXUVs5yhuNx0Tob/3ZukMzrQaK4aFbc/Crte4cKn+6kW
	rMty0bEoPcU7UBZraBVTCG+GUfMLSQdRvZq7CjlNzykhAoFFkeggsqD+hOirrodq
	8z2FGPkRqa46k9GWd3KhdgGZ9h7zh+LboZ4SBf6tlTisVEk6xSuP8/abZSwTnDcI
	i9hI/xurIDTg00ji3spZ2A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020081.outbound.protection.outlook.com [52.101.56.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721qf60-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 14:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn7OEKtJV8aP0PLmu/ahlDHr3ABHS0Bp3r4mHiTL3EX5p73lH2+79Xm6Rbx9nT3xUw6QjjaEKx5K66MusdXm1Bfpx9y7t67ijby2QyP7Vkn0zWg6WVNmRU+hMcCTMUYlRtNpKBlj/nPj83GdhWGsw/Kvk8Uqx9tZ/BXw0+bG54nmCt5VeAIiEnlirJqVcrB05QOxy+B7C0W9GF3v6/iS48ityr1IemhfM8JVIzXcUJfCl+3kCWLFhM/GxZeR7bDUGAyunbVoND/2ypj3AzijR7kZPJiS435R2cDYrTNbrBeihAibarKq5JIsHrj6R2VinrkVG/CqwFPv8HF7T/155A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx6BTDfcjeWeuuaGJCOtC8K59Z/lsdZ6zmvYIuQE6iI=;
 b=cGkO58eckRNRtY2+d9knBDvwpP6NPLCOTwYH2Il57ImkLhice+TljPgPoGGQXhnSrn9FayHNv80+MspFPvjuhi0aD9+YK1fYRXCIL/vy6S2Tc5c2T8cYXH0VXQZxscRkJ882rEIXnWvT/WbLxuvQVvaGA4mUNhKNY9N/gySZEsdmyEzCrYzg5Dt2caY9PsLMa4FvJu+SSTcoGNRS/cd3xtVyap2NqesO/NjcVNWNSwYneyPg213O/F7jjud7KuweispGL6KNUtBEBYI8thcWqTDf280ROlEhBkedq+Xe7YMBs1y6ZDsIpDodjdijYsood724UQdrqKeHbbAZv2L4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by CO1PR11MB5028.namprd11.prod.outlook.com
 (2603:10b6:303:9a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 21:46:10 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:10 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 15/16] lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on %post failure
Date: Wed, 26 Aug 2026 14:45:47 -0700
Message-ID: <20260826214548.3002838-16-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f88684d-8638-41dd-c04c-08df03bb7133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|6133799003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lDcvTmL1zEiEwtF3OFjBsynzD2XcP/qC1cOgTuFc+QjExouaEZCiXBu0S7mpqNoAkXhJc6d+APnXUK6JxR+4gbiKLmcGIXQHkP3mMBmRUTktDO+ijegu2Y9uAeVg4JgX0zA9nKhuh7H0nXj4QOv6WrOCFZzZgA/k8994oTolumLDdMKU4uk/IkrQz/9YuThmDgynGYXtBleZxz84bEd3q2V+ZB8/lFCYAhNTErSDiTcUK8//wip2UwQfOiYDkmP73OqeOxbuwrVBVXw2E9PlPBfCpTC21G+VS1H9Uy33aBxGLVR9OocwU9fSCGWGj/+wk0p1noJPVU4Nlpl+2QlLg9e6fKf+BlM5BDm3WbzEPt8L99WhvjmtRB3kvqP7Kchhb37ia35DCZhb+Yeb65cKlj16pibuwn1gjGnmXbXXnsEKO+S9fp50CWkHy4b9OVKzhT4ujzb2MwvDdPVRyEnMhcPTPImcfYt58uOkFYdk51ujPJhvgm7NjtRbsjdj/5xlaefE76YMM/nh6hoH6otPMD/+eOdG/uc4gxnTbzWGNHNY1P9WPLeL9yLZuxx6hYOtOZpMJrptCHfQCUgeaUYmqP9ZT9ghwcxbMy5O+BgBSZXdAA+pbTmcAgUeoTgwF0TF9GtjSWM7TIhL7hRU2CMVu3x47LxfeySITgbY0CdvJMh3HQ8u1tUnBscrq6hjmVOTBzqr0ulw6znf2UdB7l0Bmgl45o2Vp+ptlhG5G4TbQJ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8PLp9V5WnI4IaG5ncNK6CD9tAnOo0KrSOp0CM2tV0F8+7bDOf4t3PnU3Vn/A?=
 =?us-ascii?Q?qchPplNP1BT3IQes7/3r3EK0UM92yNieWM/SEo5OJt8fvhpl/nBmhqjksk8C?=
 =?us-ascii?Q?uB+E9e3I+nLAvaBogtbmdoJgwaQVjpOSW9YMeiE04ZizlFW9vapAnypa4vHE?=
 =?us-ascii?Q?zFz9toDr2LA8NGSrb4ZxH/z2KuSwBFruYvU5DG9gFmVTReCOEB4Qdb5uScmU?=
 =?us-ascii?Q?cQXDlwuFyxXWMPIHPxg2i4/rXJylYoFkeyY98vCHAbCwrSZ/gNeF6GwfRcHL?=
 =?us-ascii?Q?5SYJCJEV3VBjDLEn/TIjs+FgFLX4PsxIL/0C6Aw4A0QByv4/uDBSuszk0IiU?=
 =?us-ascii?Q?Fl9xVyKN8S+fKgzHu78W/+rZMwuoWQ0hlIv76tipqEXsyrH7qhFp0Hl1N1+k?=
 =?us-ascii?Q?r1Kj+Kdpj0rpYUd+XLBxWJR+GUcH2piDBOzD5mTnNHwxxGsMd78W+rlwctFj?=
 =?us-ascii?Q?Stz8tYbmujgfMvpKDgSQxGgZKdR6RZzWgwuJSTtKP4vHt1979NVP3SJMpl1i?=
 =?us-ascii?Q?fYzjZLs/BQr2nCIRipUTKeIBkzeSb5Gz9gBnOVA3QQvF6GE2orkIX4/lHaoy?=
 =?us-ascii?Q?8Bi0p2zMLGRTlWYUab8xEiVVhqSd6C3e99vP19I2m9cCxB6XwAU3zVjwW9z4?=
 =?us-ascii?Q?DL/mP1PCkEcfOBgVsXh0w/JvZ72p8CWKXdQfbIkRtvZpjEJJNULkFBzvOoBK?=
 =?us-ascii?Q?ohZGtFCX2B/RpQXcE3gmkbJi1UddP0cSpGBKrdOKnceTg/87B+gjOfTjzPs5?=
 =?us-ascii?Q?6WRJiEfniGOC+q4kIYiwsyJb/AfpeBNwCZ/L2pfGa67jlSDJ/oyiYkgjxhMQ?=
 =?us-ascii?Q?+pAo1H28Flaz/NRwHntb6JHVz78bOovUi0VCX/0eB/oli+wemZa2AuiY8u2I?=
 =?us-ascii?Q?OUyZg5d65KiqtsgbOhsI7FidPsXDvb1AXM0QVxWHJjBbVSKsQ3ZQ11M53Hmu?=
 =?us-ascii?Q?vTlQvULtJKWW2cxnEp2Ur6RV22wb27A+fYprBv3acEepoXzOb3BdjnnWirm+?=
 =?us-ascii?Q?F0KS4OH/llbfKHOmaHnpD8ZogGqUTar6GcKG9mTJKdxY2YNrP/oqrjzrHfvq?=
 =?us-ascii?Q?xO+A+ezQFo40y+VzzcNt0vqwsU6RvIa64ukKzb9p5DBHEdDTDezmF+AHgLbk?=
 =?us-ascii?Q?g+KEzAKOaIPCzSzXf82ivIYKxPgEFAEzlC3iIwhLPOHEcPUutuvtWlFgqz5B?=
 =?us-ascii?Q?jDStshHm5i3I78ejQqH0CpiDb/ipqYgTI2RpdeZOzhH+3T/apzHyIeqam/is?=
 =?us-ascii?Q?ZardyGlbKHb7gq/TLvmknHq/WxfqS1Wm8PCqoVeml3JmmSuLOiHnXoZvCqT3?=
 =?us-ascii?Q?oM8pnly/yF9aDAOxZBTbgioGy31ABnG16FxJ8nKdmiHEyc1GUfmfw0WLMtPq?=
 =?us-ascii?Q?zD+WCpa9XneOCvJlNst0UxoOe8w6ZqUb2713x6ZqmTZ/YLDxVD7eCf2dvexw?=
 =?us-ascii?Q?DhaL7dbwcFgU6A5OWE8j0Ae/v2WShfzUR3at5WBNP0tSSk9JH3QM297xWh1Y?=
 =?us-ascii?Q?YNxYW83OcCaaekxSkL56j6SYeEVysFlKy97dzI4rlAklqB2/TsPYvNF6ZPap?=
 =?us-ascii?Q?wSbpthZSH19AgdUMR+pYPHtVPF/b5fO+AaOqSZrLHPY2fP6nMcOJ/kr+wBH6?=
 =?us-ascii?Q?zY/xMNyGS03ZJ6WaE9ANvXZKfI9V2yFbj6FQ5JqbJkr+rPPm1uuW8utAbg1P?=
 =?us-ascii?Q?Yv3ApUQxZwwPgvlYN+pyLyObshDSGg2M0n70Ni0KHOXk+iK7+evQa32r/+/r?=
 =?us-ascii?Q?E2qJDKfiB2gtJNHM7RF1fI/45hpFm1g=3D?=
X-Exchange-RoutingPolicyChecked: 
	fVCx1KnWEttndnMphBbKOlwG4jMEKF1ZBjAVvb5OHXD/1FzC7KcohvUkeASnVuHPR51eWQvcNkBW8fJ39/nGMXQzKf/Gm2EFNcaEQMA0MU6Ic1uSWfYZnxqwj4hy5BCAjJyYBXO4csGLXAp6ObEJHqV68bRXloQdI5d17nfILDMR0z3PlEePE9fEoDZ2bchBqOj9ZpCupJpyyPurRfDwHXYXD66Fpm4mlrseSHjQt832vqk1yc92VF03Q1/CYlSV7AODKsD4fhb3zvJV3YfnBezpRHqcdAJK/376sfTNganerAer9t22tQWkyatEgNM7KXbJc+W+CLqbEPGGp3hz7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f88684d-8638-41dd-c04c-08df03bb7133
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:10.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XfxxbbQEg86JB64rtAhRxfi0Sk7CobTFHfEcgJBN0C7/c4iOoONyc4oFKqDpDIJHYvPG8XyIaN06/LAtCMbrfcINyGQ9tzK5LDUttjIgTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8f5ea5 cx=c_pps
 a=H8KQetTyUVx2NtQIo3bL5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=xrz2xm_XJy7u4lCe5tcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ZkIzNtcpClAK97f0OoiWPeuuk2MosyzZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX4AI4hoDmnzhg
 yYaoeWUrTtFEFbbO6fJE6S2PVkPf9ZwYZ1Ky/uGAeU2ATkFUkIIIr2m8ZKlaWLaFWtZhxUsUwO6
 ugnaOIwKSLNK7JVKDaCGyUlwMGkhgf29rMQOiKbcuEaeXaD7QEKAdZrZNw/WQTJxVNlINuLwp+9
 a+yg4G/tc23dK9ah22Sb7YN9OKTFvyjwsU/UFoGL6sCQj1aRYEthXPaIwZ/0djyxvUYSBXMmOGo
 AIYs/UnqkKFihby28tTzq4tP4ZLFeDATbsn8myMKsb+TSbC7mvb0JlR0GwbZ4cPxLBzkbXNdiIu
 Ws+40Q+uPEzOMdepPfYjFQPhLbX0ORjixXVQTBB5SFfSxZ6gP2nA4V7ynchh5cFwxo5Ahdza1nR
 mO3r1aVP+6m1W+dhvp52YiMH3SLANtMrrGIo7KWp2B7zgc5eqWUIdc1eI3609VuaOV9GuKCzaCo
 9ZJ/p8XHaW2SkM7SuqA==
X-Proofpoint-GUID: Wf695aaR-Ir7A2lKXNGeSeS57OR_LeTS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfX+s81R9JV+nuK
 U9UTSoyekBcgfIxb1NurzGuX7tzuwBb9FGbHtfIkYafuGCSBykoqfawJGDbokmMnK4ga0Zge9FB
 dAilQ4m+vgtFuyaTerPMBYpfeGu5MuHw8F2URMYfk108oRyN6O8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244432

RPM 6.0 intentionally changed rpmtsRun() to return -1 whenever any
scriptlet fails, even non-critical ones like %post where warn_only=True
(upstream RPM PR#3819, lib/transaction.cc).

Root cause - two changes in RPM 6 lib/transaction.cc vs RPM 4:

  1. New field set before warn_only resets rc (transaction.cc:1754):
       ts->scriptError = 1;

  2. Final exit now ORs in the new flag (transaction.cc:1910):
       RPM 4: rc = nfailed ? -1 : 0;
       RPM 6: rc = (nfailed || ts->scriptError) ? -1 : 0;

Call chain for a failing %post in RPM 4 (exits 0):
  runScript()        warn_only=1 -> rc reset to RPMRC_OK
  psm.c:896          if (rc) break -> NOT taken, install continues
  rpmte.c:823        if (failed) -> NOT taken, rpmteMarkFailed() skipped
  transaction.c:1652 if (failed) -> NOT taken, nfailed stays 0
  transaction.c:1896 rc = nfailed ? -1 : 0 -> rc=0
  Python ts.run()    returns None -> DNF exits 0

Call chain for a failing %post in RPM 6 (exits 1):
  runScript()         ts->scriptError=1, then rc reset to RPMRC_OK
  psm.c:896           if (rc) break -> NOT taken (rc still 0)
  rpmte.c:823         if (failed) -> NOT taken (same as RPM 4)
  transaction.cc:1652 if (failed) -> NOT taken, nfailed stays 0
  transaction.cc:1910 rc = (nfailed || ts->scriptError) ? -1 : 0 -> rc=-1
  Python ts.run()     returns [] -> DNF raises "Could not run
transaction."
                      -> DNF exits 1

In both RPM versions, RPMCALLBACK_SCRIPT_ERROR fires and DNF's
_scriptError() (dnf/yum/rpmtrans.py:407-418) prints:
  "Error in POSTIN scriptlet in rpm package <name>"

OE's install_pkgs() already scans for this line and calls
failed_postinsts_abort() (package_manager/rpm/__init__.py:210-219).
With RPM 4 this path is always reached because DNF exits 0. With RPM 6
the CalledProcessError raised by DNF's non-zero exit intercepts
execution
in _invoke_dnf() before the scan runs.

DNF 4 (lib/dnf/base.py:1146-1158) was never updated for this RPM 6
behaviour. When ts.run() returns [] with no failed elements it
unconditionally raises "Could not run transaction." - the comment at
base.py:1147 still describes RPM 4 semantics where this case meant a
global error such as a transaction lock failure. There is an open DNF5
issue (#2507) but no fix in DNF 4.

Fix: detect "Error in POSTIN scriptlet in rpm package" in the DNF output
inside _invoke_dnf()'s CalledProcessError handler and return the output
instead of calling bb.fatal(), allowing install_pkgs()'s existing
scriptlet scan to run as it did with RPM 4.

Tested with oe-selftest runtime_test.Postinst.test_failing_postinst:
  rpm 4.20.x: PASSED - DNF exits 0, scan path exercised as expected
  rpm 6.0.x without fix: FAILED - CalledProcessError before scan reached
  rpm 6.0.x with fix: PASSED - scan path restored, bb.fatal() fires

References:
https://github.com/rpm-software-management/rpm/pull/3819

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index cd6efe3d3b..ccb4316bd0 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -333,6 +333,13 @@ class RpmPM(PackageManager):
         except subprocess.CalledProcessError as e:
             if print_output:
                 e_output = e.output.decode("utf-8")
+                # RPM 6 fails the entire transaction when a %post scriptlet
+                # fails, causing dnf to exit non-zero. Let install_pkgs handle
+                # scriptlet failures via its existing "Error in POSTIN scriptlet"
+                # scanning rather than treating this as a fatal dnf invocation error.
+                if "Error in POSTIN scriptlet in rpm package" in e_output:
+                    bb.note(e_output)
+                    return e_output
                 extra_info = ""
                 if "install" in dnf_args:
                     if "Error: Unable to find a match:" in e_output:

