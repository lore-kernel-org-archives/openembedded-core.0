Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8163CC5321A
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 20:04:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27385.1784923483079563606
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 13:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rd65vl2R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1665965d86=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGrPLU2220615
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 13:04:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=; b=
	Rd65vl2R/JX78AbUxxX6S/Mzd+ULy/B0921TtCbp+FEL+tuy80p6d8PFmPIcnsQt
	udHk+Xjf17c/NDf+dNTbdDukwOvJ9FF3gyUtDFocVxWrIzUpvcOL94WnHm02sMdL
	ctMHNwGgf1juWsD5BxRxGJCnrXcqjQLmcVtSv/sn7M3YfCkqT7o2B45+e9VcHu7Q
	9qHaHagD6IpqVla10pSW23ue/maWPNC5ANGeQZjAaDlrhi01xLZ/Qx6ygxZRJ8r0
	AjOVW3SLnCMiX/6VwnRInEYLR09Wpqnw8u5hPTnZyREy9wppBFLJ8NnRb4w3uH7y
	QG3rl85bmknhsnXBuwzbSQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fm8ay0q0n-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 13:04:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDhzfGaM+2HZ449o0+OQGv1SUzDfAci6UiPIroKZMfb90Dk/f1DdMaJpYysNTtmi3NhS6t/9pfNZX4lIld6IzQdZEDlMpknFfXHvckeAkx8pc0DhZRHq0q54CBPlZSOV7/QeiDxtfpPFIPTofCdP4lSu0HCtNA38EeLqkD0MjiDangu+Z5a8p84QxHlSugGOyijyaD9i1wKcrwC5mqtYv1En5mZvP7PP+83Dx5h8QTRbxYVKR/x/+u9SEKhv3DW013YpEiQdkO9bCvJtkUOA7jcICk6Qxc7PgEL5l7aIKlay8rTR4+G3PhAdibpFF4W2mntE1YsRQfm/ucjkOp6jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fHc6cgZgRbhKyjY4NXr914NBxt6aPRaq7TIYGoB/pY=;
 b=AuxRyhMZESyVTa0Vw/M8li5EB0sZ2eQ5yKsOm8H2+HGUoI5USDJD52Wjb0zQNIrQQlq3Y5B5PX1qrueMohNvj5s1YscA0xhrmMEQ5opoKIb7vxGHQKjzChMQvnXHM6fC0bGMqDPiA2x3vmZ4FKbgAQlHIwWJgEYynRnx62hQCJC1jFasuM25TL3fl1g/AUL3JLKlTuUCUAmJ8HV3jpBpVr5jvmleMQdZ2Edv7dzAd9wpu7MJuEUrauRD8kL3EBCvMnjNPQX9eHz2lHx7iQvIcX58Uj8K94dQrCzIhksqN3COHiXVL46ouudPD4wMwHIH9zOviSLL64wVOI2JLlUxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 20:04:38 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 20:04:38 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Cc: esparlin@cisco.com, mathieu.dubois-briand@bootlin.com, mattware@cisco.com,
        peter.marko@siemens.com, randy.macleod@windriver.com,
        sumanth.gavini@windriver.com
Subject: [PATCH v9 1/8] package_rpm.bbclass: Drop external dependency generator to support rpm 6
Date: Fri, 24 Jul 2026 13:04:16 -0700
Message-ID: <20260724200424.954199-2-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260724200424.954199-1-sumanth.gavini@windriver.com>
References: <CANNYZj-hrPf-CVJwTaEJ6dgUuWnipYKKiPZ3r_t1_HPYhCKvYg@mail.gmail.com>
 <20260724200424.954199-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::8) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 73812b0f-1654-40df-2b51-08dee9beca48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xY7VJYxLOvNf5IMvMW6d06zyZlZZ4mF0xdZG5CRS3Z4DzX5eRBvCO5jkbOoWV1nAgjQoobvq7KoRSQZmjU2GVRAQfsNCWS3Yr+A1MmvYMO0IHjvxXVQCjVrdbtTIOdtf2nZ9zX1DUqOqis3wR85OiGvLzDxKHqkdvB0blaHzzdkbX7wAWj21iNav4NJS6eWdoCXHAaC46pV6+762Za/cPIWIOYtz+nMkJuGYbYpRoFYj7J/9XsekWF8GRRhqY3bPiqX/F+o5uqkrLLWYEw66rkbg0Raoj9OW8wfp1wqVp3X1PpMs35ifNQq+8W3tJODQcXbpEiKULoNh4Wp4+CP6eEUPnnrxFTRCSLUCXMP2qoRs7qtiAPcqnpiNHOSipeddTzi/AwHWB8qOZvb4quFXPKLenMtgK+kDSuHOMM9xDWHqQUQWB99sftw/2YtF555DYaDi74sKSWyt+kDNJSw1ZYheeD2jMcLUKe+gmh0i38OC4Ehld1CnwktbO6CWTiWTAThYsJFa5NaMblVitsrnV7u1t54R2tEFQrjD0hMyK+c/H1rQCay6cqvicejcakWOZRKCVTKd4UpBWsspXeX/6yzWl/npEWKU/lto4hbi8jcmf++UG/eKweRcMiLvJ8KGK4DGRGb5QmklE5DQQ4tOUP72j7/UUsu2qmyjWWl4SHNP1yl/8sKULoQiky7ql92ugxNWYFCvixC8fbD5/+tve5fTYuYKnJ3IsYJcP2R873k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?COybKPUmvUswQe2Y21kekuGGAI1Sib8/rQdVfrrrBx+3/yOdVQb8uzR0nbrM?=
 =?us-ascii?Q?JXO3hpBSiqMz+8z5lB0QdyBgmixbvfz8/9DgwRCPuMsmS8Z7k2MX1tjl75CB?=
 =?us-ascii?Q?P2fGz0XCLprUKEywNWoKhZT5BwIgRWYxqy7BY9GhV4KLNPa0wyaF54Aj357w?=
 =?us-ascii?Q?Tj1ObpVNavVemcTBtM8dlkkz8qsZPOlBXmyKVHfmZXafn0xJQ+/mX0PIHSss?=
 =?us-ascii?Q?EpahPoQXml0riTEtWR0njbrBM4LqGQWFBajw9NW0ItUiDk4fCJUCG28jFkJs?=
 =?us-ascii?Q?pkmvJEtfVE1OdYqKfTpGyJluXsRqOZdc050lPn55koPX9s1zF62Eo79GAulJ?=
 =?us-ascii?Q?kVjSgCBsD1HKuRaHy5fLsQnF9juwfFWPTdt1xABXBwVrrPXLMDXQNEK401So?=
 =?us-ascii?Q?61IV2ZaLrOTHyn4/ooYMYmFQpbNagOQKxW5yDgzDCyBiOv9MjQXmHIu+vRt3?=
 =?us-ascii?Q?VNWTKG39x6TY8ShUUSnc3/rWhLDWylkzvFkfZgorMq8UiMSTqBhEycsmehl9?=
 =?us-ascii?Q?AOIxhEtHryvJ1CiN5fU8gWfF6enHmMp2ZjGIJ84BYhRNzL5LpXiFO3J2NZxQ?=
 =?us-ascii?Q?vqzt23yw+a5OWGp+3ZOHhxR+lAimw2w4YBIEd28A8t1mFaX8XmTo3iTU9f5/?=
 =?us-ascii?Q?iTh/ndtkfwMQi2lXxY/D8CnVNogO+otGjN3+8uItzK6hl4Hr48Sea9ESmkyU?=
 =?us-ascii?Q?pyX+OT0r+tEf642wLMv4X9x+ibHN77zXFeGpOUFInwDQeF+gucEtQXzBMM0R?=
 =?us-ascii?Q?21Tzyrcg09jEQbNUHXZlQoocQ68KrLN8Zbs/e6y/XZNrWFrcxWJMAvEj5ZW9?=
 =?us-ascii?Q?mzzwMGq1agwao+QjxJckazKNlRlwFaqsXr5aIDwzuJVRtZm7IZCA2h6zShmI?=
 =?us-ascii?Q?8y66PqiwXrD6lpfoSxsuiBsVsonzAwIx6KHg0R8aHZVhOVj7p4w90bTO7Wqi?=
 =?us-ascii?Q?Zkkn8x/HEsElGzl0sxjv3z1WdRfUJ1UfYaY6Cilbyc+yejPDW3yyLe90L2vR?=
 =?us-ascii?Q?kpXsO18dT1jJlMOycljhWqF5xpa/qCPfx10kS0uG1jb7fP7h9duWAbM3cIf6?=
 =?us-ascii?Q?7s2cNvXbEAu2pSXo8pePAmbzL1U9ma2RuH3Vd28ZvpI30bwxzQDcctLCanvR?=
 =?us-ascii?Q?DIJcznWHcK2PDFTuqVunPtsWto0Z4PWkLu/e5WsWjz6zIXxaH7O7nRZeDi0z?=
 =?us-ascii?Q?TDz5FmAdrpu7d23R06+0WutD1KG2p2xN3PFritDvFSu5OT8tcMq9xKOORJeP?=
 =?us-ascii?Q?E1gHfbnBK1wrklKdRHgF4US4QmIZc91qSabyUPe83Ju9FOCpm4BV20xxUfLX?=
 =?us-ascii?Q?RI5ExQNOtDUhzz68e6dRCeKlpbAeQjRriUF8HurrI3D0TABTrUcRljnNM9L0?=
 =?us-ascii?Q?cGI1q6VvHN9btQYg9xI8iy31odzZTC3Xqh0HoUxHm42V4K0i7rhjRUhtz2TY?=
 =?us-ascii?Q?TVaUnKFS0X6qGiuNf4VAZXLaqjZKEa0UHDHJGA/7RvJ6tjRg/57uiwG2EMOi?=
 =?us-ascii?Q?60JXFuaOy/JoyBwYqpaAryCQ5Kt8J7G53NIq/80XL53UZTXBjW2ciomCKbhX?=
 =?us-ascii?Q?AA/ve9HPzVtlFaGR9tJoPY6l82Bjm1D+ZURXEs8Jjc+TLLDW5QkbChnQI8pt?=
 =?us-ascii?Q?HrzJik1jUgZ3LXV7bkN/rDP1KKLmZenXBI1No0Unxv6wH3ry8r/fKCpCcBQS?=
 =?us-ascii?Q?+Fej04ERIegToIPPvogl2Y0R3yvDCWNctl9PyL8UoxGNL8DiSsm8rDIBVUdR?=
 =?us-ascii?Q?8jfmd0Wn1QtpHwpWXzIgQLwgP8jByso=3D?=
X-Exchange-RoutingPolicyChecked: 
	Qgt/ZN8bz4jycxj4PtYumP+9DEVDP+KmAIYmwL/bHvu0LLpu2sCPZ4z2PPUqXgltUmz5Z9hFLlltp5i2t9HLQ3bjsROgn10rKb1B6Vu0UTbdoydJLSMHJF5vX3cQXxJ+wNAElbrwXqWxqWOM2qHoAYi2afJ7J6Dn44NRiAbLc0jCNc41Ly52SGdXjzel0ldzsVAU7dRsN5B2HjtsS6bsFfEud7W/wANTUkklDVcUDxsluOk6Lpuf1T6lzPf4Nzc0jzGr3fBb0bgB5mKWsTJZAFFFsI/ycD7lNnMowo+a+20HcP0sMy6dqgSN80yGESK/tNWhp/Lpo1ekDRTq8n6WMg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73812b0f-1654-40df-2b51-08dee9beca48
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:04:38.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvhVcNs5OeXX6PpalfJpL86q7vfE69TxwoiQajNP/GPLca7mP8R3yA4OW87ZMZ34l+4LT02Ygy54iyBFdcS/bAeshguQ85DGhXfIbJvrWck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: M9gwmtkalspMj4oK6P7iKOS0lH3jOZlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX1b60PjeKgKtR
 FVufCuM7lmWGKFzvlVvo/cgDQuf1J36jYoaUrcXkcmwejtUFijF3gwyeumPPWtvUgbz4p6zXTcD
 +cKV39y5rAJf3iMqzjj23G2/MzISLxdDqVbTgn1LkQWvPD7xzq89KWZM5lAcj69qadLb3FKokpr
 IQQ9KsnenBwTTU3oiiY8U5QjhoN+PtTRtvl+suWD7HzVl8GewW1HSH/X5Ps+duoYLyQw7+DvkAC
 T5l1x8lI2Xn1j9ulykHHjD/rq9kbIX9lsONfmKaboLgml5/qibxIBYC3eX/+YduVexAZ2BOyR1Q
 u4iVZpN9LhkWw6Y9WoNpfwOnZu/FdbjHNAoStZYzVmrURNGJElIW9N//dy+Ba9QyN8zYWabxxqt
 CJefNkPLNXRFy3qcTEKxrSZ8TZDpZkddL+8sb7HpV2gm4pU4kFNZq6YxOZmA6ZxLERm8gvC2UZQ
 gBr6QUQS8zjEnA205gw==
X-Authority-Analysis: v=2.4 cv=LOFWhpW9 c=1 sm=1 tr=0 ts=6a63c55a cx=c_pps
 a=tl4IwOQKiBOeKWF7Rad3dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=gH8vcDOTmKDoYkm8A40A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE4MCBTYWx0ZWRfX2nSO6APosK6T
 S/LyhpOWgps7h7B292XqPcdv4yYjoNkU2XJ2dKzxEYY1pjqPY8k84rlqafWSjrUK93WAz5/zbc4
 I8sfRGecExB0jkNtuUaQf+N8gAonKc51BeRORAr/rp3ZfZ53avlw
X-Proofpoint-GUID: rdrjz-f5DHe8ND3Dm-ftm-hQSzApdwCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241944

The rpm 6 doesn't support external dependency generator. Oe-core used it for
per file dependency which was saved into pn.requires and pn.provides,but that
hasn't been used any more since 2012 (rev:
be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
updates in the past 13 years, so just drop it to support rpm 6.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 84 +------------------------
 1 file changed, 3 insertions(+), 81 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 9eacd91cbc..f286d3a0e2 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -14,10 +14,6 @@ RPMBUILD_COMPMODE ?= "${@'w%dT%d.zstdio' % (int(d.getVar('ZSTD_COMPRESSION_LEVEL
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-# Maintaining the perfile dependencies has significant overhead when writing the
-# packages. When set, this value merges them for efficiency.
-MERGEPERFILEDEPS = "1"
-
 # Filter dependencies based on a provided function.
 def filter_deps(var, f):
     import collections
@@ -36,67 +32,6 @@ def filter_nativesdk_deps(srcname, var):
         var = filter_deps(var, lambda dep: not dep.startswith('/') and dep != 'perl' and not dep.startswith('perl('))
     return var
 
-# Construct per file dependencies file
-def write_rpm_perfiledata(srcname, d):
-    import oe.package
-    workdir = d.getVar('WORKDIR')
-    packages = d.getVar('PACKAGES')
-    pkgd = d.getVar('PKGD')
-
-    def dump_filerdeps(varname, outfile, d):
-        outfile.write("#!/usr/bin/env python3\n\n")
-        outfile.write("# Dependency table\n")
-        outfile.write('deps = {\n')
-        for pkg in packages.split():
-            dependsflist_key = 'FILE' + varname + 'FLIST' + ":" + pkg
-            dependsflist = (d.getVar(dependsflist_key) or "")
-            for dfile in dependsflist.split():
-                key = "FILE" + varname + ":" + dfile + ":" + pkg
-                deps = filter_nativesdk_deps(srcname, d.getVar(key) or "")
-                depends_dict = bb.utils.explode_dep_versions(deps)
-                file = oe.package.file_reverse_translate(dfile)
-                outfile.write('"' + pkgd + file + '" : "')
-                for dep in depends_dict:
-                    ver = depends_dict[dep]
-                    if dep and ver:
-                        ver = ver.replace("(", "")
-                        ver = ver.replace(")", "")
-                        outfile.write(dep + " " + ver + " ")
-                    else:
-                        outfile.write(dep + " ")
-                outfile.write('",\n')
-        outfile.write('}\n\n')
-        outfile.write("import sys\n")
-        outfile.write("while 1:\n")
-        outfile.write("\tline = sys.stdin.readline().strip()\n")
-        outfile.write("\tif not line:\n")
-        outfile.write("\t\tsys.exit(0)\n")
-        outfile.write("\tif line in deps:\n")
-        outfile.write("\t\tprint(deps[line] + '\\n')\n")
-
-    # OE-core dependencies a.k.a. RPM requires
-    outdepends = workdir + "/" + srcname + ".requires"
-
-    dependsfile = open(outdepends, 'w')
-
-    dump_filerdeps('RDEPENDS', dependsfile, d)
-
-    dependsfile.close()
-    os.chmod(outdepends, 0o755)
-
-    # OE-core / RPM Provides
-    outprovides = workdir + "/" + srcname + ".provides"
-
-    providesfile = open(outprovides, 'w')
-
-    dump_filerdeps('RPROVIDES', providesfile, d)
-
-    providesfile.close()
-    os.chmod(outprovides, 0o755)
-
-    return (outdepends, outprovides)
-
-
 python write_specfile () {
     import oe.packagedata
     import os,pwd,grp,stat
@@ -311,7 +246,6 @@ python write_specfile () {
     spec_files_top = []
     spec_files_bottom = []
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
     extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA") or "0") == "1"
 
     for pkg in packages.split():
@@ -365,10 +299,9 @@ python write_specfile () {
         splitrpostrm   = localdata.getVar('pkg_postrm')
 
 
-        if not perfiledeps:
-            # Add in summary of per file dependencies
-            splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
-            splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
+        # Add in summary of per file dependencies
+        splitrdepends = splitrdepends + " " + get_perfile('RDEPENDS', pkg, d)
+        splitrprovides = splitrprovides + " " + get_perfile('RPROVIDES', pkg, d)
 
         splitrdepends = filter_nativesdk_deps(srcname, splitrdepends)
 
@@ -630,10 +563,6 @@ python do_package_rpm () {
     d.setVar('OUTSPECFILE', outspecfile)
     bb.build.exec_func('write_specfile', d)
 
-    perfiledeps = (d.getVar("MERGEPERFILEDEPS") or "0") == "0"
-    if perfiledeps:
-        outdepends, outprovides = write_rpm_perfiledata(srcname, d)
-
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
@@ -658,7 +587,6 @@ python do_package_rpm () {
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
-    cmd = cmd + " --define '_use_internal_dependency_generator 0'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     cmd = cmd + " --define '_build_id_links none'"
     cmd = cmd + " --define '_smp_ncpus_max 4'"
@@ -668,12 +596,6 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-    if perfiledeps:
-        cmd = cmd + " --define '__find_requires " + outdepends + "'"
-        cmd = cmd + " --define '__find_provides " + outprovides + "'"
-    else:
-        cmd = cmd + " --define '__find_requires %{nil}'"
-        cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

