Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED61C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 20:08:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16250.1656533324612811984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 13:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LnzPvEbY;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=417919b192=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25TJbw2P031334
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 20:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=re0hgMJx6ngMs5s9Ph402hmwsR8TwYkaOTh4nsU/C/E=;
 b=LnzPvEbY7yo/4EV9ln6rM+onHdNo8iN6vBraQui9m0TMGv3xWTCLfR/xuWeCz9wzZkQW
 n8X0eLI1O+bINJcgy6EnNnTU2zy60djYlR4jdmfLunTnS2eQ5W2kk7hpYse6mnu57yql
 C8QTpNKkBXEIuXQMmIXaUIszluVrcvuFTxefw1QB0P1qRThJPVJW+4CPePwoNhOL6GE0
 DfcX6UoXI+emvl7v67Lor1cFq//IbRF525IH65ZC8f/i2qqOLsOkdVQnO7AapaCVE1vs
 SvvzwAT4LxUi+47pfQaCPKpYTHWwUDbv6D6TwNoBjnneK2Vi64qdIIcBFDGpWS7PuKR2 sQ==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwqk23k06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 20:08:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl/zF0DSn4DRKB17utZ8jwP+yxtflaOJEgoAJOVjvDR8QxEzPjov2p69RMADEsMM8HZqNQkz9VpJSc9Ppoq8FHO779QWg1riqYlfzNdwRvd4yu/0mSy1fY1u188rpKC4MC7sYfSHriH8OVuqzrRPHhWe8oLktj/kuleY4mgzF2/KIXfFIxlVMOAVRPOHh96VBP8yP+tjEojJGo+jyxpV+Mr/kedx7Qc0RoGmqNYh4YmSWzz4lpRWFJCki7BCM3t5W9otBXkJubSoPWfQGgyw6fVpQWZ94e8+7fjTioG6D0X5AiHWlvpcNGXOqf/CDgEy/lULA/HWFWS3dfi6ODiu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re0hgMJx6ngMs5s9Ph402hmwsR8TwYkaOTh4nsU/C/E=;
 b=go/h6WR1tHP9F0LDpoo0rczyCPwl6Gurr0F8Rd5G6+Llo1zyGZ1tDsN6VNDTxTP4qpFrli2JH7xQV5ikNOaYDF/K9eWHgnmEL040BX65f2721Cxusgv5Z4vBHTa5u7DDEEx/62l1+YH37fF3yFkwoq+rANkrCrKdqWfAKI+o9xxSC3jD9KvbPdaCbBy5lrKlWIqVSjbiKYnq3VIN1ctO4ABCY1GqGZJAWjqe21IOw7pifnISmEw7J27aO2HCeGfXEReUaS218uctf7D39UUIPyrXZjovWFO7hYEB5fFxddf9qUL9gt1q3lmi4QbHv9tf12H0nfDiVRxADA2XZNg8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 20:08:42 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::14a3:342b:5f14:eda6%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 20:08:41 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildstats.py: close /proc/pressure/cpu file descriptor
Date: Wed, 29 Jun 2022 16:08:20 -0400
Message-Id: <20220629200820.1948118-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0187.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::30) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53de9e33-ac4a-45a4-e3a1-08da5a0b29a3
X-MS-TrafficTypeDiagnostic: DS0PR11MB6542:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z0L+jt/xsau2LMW0sgusUImtQWzSSFrZ2Ie8CxIoosDO9uASekdxIHO33t+dNbKt/v8C+XG9lYVXUjsLHNnpkA4esFiJtH7Nr8zs6dKDup3Uo42dxCdegRPrKBU7wIZ9140b6zSqM2WrkMLejE96fC0eG/uXuXHmd2x64BZLJJ+CDt1MaHi5PunAeuYZqJV+X/45zBXlgJwUi3HbFDOrj1Zl+cz2v6NXmOIY4uqD9h12OZuns6JExnB8YLdfLrp5hhD83RUzVLXPXpxoAn1IjZOpjDbXsm2dujO21arOvMhn3KsUnlvH5JVcCTeHe9liSgdh7Ohpkq8GNYalQRTiO/peoBPchav7X6q0Iir2Vw5g0Dbb0LT6qjTTMQ9+UJIuYpTZ7NypMj1ohpQCUsnU670+mPQwdEyfcBfk2TH2qiEKQ5YkrzSWMmlvNzbd9jRBDNUPG8KmV9AQvnxach/CRtz7IMsgd4r3Se7ejKxFXZd62IELZdyQkoqXI6SXccdCSy7Q9SyP9glvjPovVCelpg7smnvt5cJnRg08Z1jpWC0QgVEB0feJpgzaDrkVDi+INCYoMZ/qfswVrcbwtF9Om/tm2g2jPcqquxQKUA9uVyA8zOVNVW/sHvuj16qMESzuJIsDDCDGxyp/KKDRfX2PI+b/npiEENUehE0GUZ3h6/CtIRP8A1TKa94XPhl6vT5DPL01FNcZfq05AViNeD2W/CnaJ7/eKq7aEtxMwK+H4N62Ndr10oYMzHTGktG0FPe6w3GMK5Npj9Z1JdmDAm5JttvtUrMPAVKgFj17wZc43Vk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(6512007)(186003)(26005)(66556008)(6506007)(83380400001)(36756003)(66946007)(66476007)(52116002)(38350700002)(2906002)(8676002)(41300700001)(316002)(6916009)(6486002)(38100700002)(8936002)(5660300002)(6666004)(2616005)(1076003)(44832011)(478600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eL/z4sPDDH4Mlj2Ct9jcDsMOhK1smH1XcHrMHuHy/3SPjtzPpKNw3PL43KkO?=
 =?us-ascii?Q?ZcxZt8pdVaqlpt4eC8W/KOZ0xD/lsvcVHvyHQZ4liqv+hvWiJAi8nxRwy4+K?=
 =?us-ascii?Q?hqRjOUDmWWWMnEA34hAKgTHr/AP/NuLW+oEB9GMLvaXjeg3W93WgG/dQL0J6?=
 =?us-ascii?Q?KVOZC5dYCfODVPSjzgIRd01GD80mx/R3EWmUqT2Zs0bxF5fBalpnLxBXQ3fn?=
 =?us-ascii?Q?9nF/HEvRC8mOkd1NWo12xk8tYWj9isMFonnLlKKqH4khp8hORnipPbc0MZ4w?=
 =?us-ascii?Q?mt6UpxxXGflddunnm4mOdkgWytbm0CGPIujEIznF/o1ZD2rLLL0e6bvlUUI1?=
 =?us-ascii?Q?Lx5kyQEFMEHxhRSXovVyqbr7XKgEG4Wx9CcrzPraLDYPQATL9AdzguNsAHDE?=
 =?us-ascii?Q?XcYwCUnaPTmfvcHm9VOVPRoxjLToe3ORTAJqJEVzzwAqBCgQsVtuesMUcMIB?=
 =?us-ascii?Q?peI3HZA/OgbxIBC+IfTvAf8fhg6QoEPJizPK4FvqGLFdmV9RnqhBPcVoWXPh?=
 =?us-ascii?Q?M2+8OpNO5UY6W1ojlVb7kfDAIGn8/bdOue6b+yZLCHeUve91HCdNjYgzAymT?=
 =?us-ascii?Q?gfsNJfN+DgXruTIz+dFHzGVfFX4LeGI5VOeaZ3zmvFlPstNHQM/adb5OkWjl?=
 =?us-ascii?Q?cpDYBJ/Njnbuhy1Ef+qkwSUHqARyKhGl65+VTYY0mq88t9WeUmfckIJInXaA?=
 =?us-ascii?Q?822yhsvc6m5mqo/5LyW4jXkjQjq+6027jQCYelNY3qY7OvjXNWK9XYoYX0ux?=
 =?us-ascii?Q?I2DQGsD7CgVSMHk7rASkHkoMp9QltisWv4yLnmQdLD1sDhSqi4PPm2EaobnW?=
 =?us-ascii?Q?L7bE+QoNLWxKq3+shdvCPkozzUi5ocvYp+ZvSKw8BR2wphQIb06ov7s52/Cp?=
 =?us-ascii?Q?qOBnM8mq+UkWB7LI3oH5Fop6EpWnbjnYLZvS81w4PawcTzOV29sev738o2sN?=
 =?us-ascii?Q?ZKdSFLVXFi3K41m6YoSCeOMGaBREj0LiKy2FkVQI7Z0E9FvITOxK1US0Mo5Z?=
 =?us-ascii?Q?XhocxivHTpSGgt7kuq3hLrmjsQ5cW3Rx2QA312ag8zu+oiSQdH4iZ7Ekd1+6?=
 =?us-ascii?Q?vxBR7o9MC1E6RqyNV8DU3eGlTC68gxaeKa38pH9bXMgMQpvXdLr+4uICZThB?=
 =?us-ascii?Q?8TbVQ4Xs1s0A/weAf7UpN4MiW/XBSiezY8w2zvj8vM8UsL9Dr4SYR/rFAmB/?=
 =?us-ascii?Q?IRAbBEhF83ZrTZCjO7LjVan7/yziDGJg3+9N9qJGFBxRuCVr5xcmc0D2lRSx?=
 =?us-ascii?Q?65RlhazppbROFVunpnLQpSVurJR/XsLEkR43Lx1wETIQb9ZWD/sRHbeyJNI/?=
 =?us-ascii?Q?7OSqV1XEAxTqbJW+0Xb9fNcy+W0T5C59CEn0a2vmwYUjr3KDxqMA2MIWKoZ5?=
 =?us-ascii?Q?cy50RDTx/+Zj8jtdpNMFJ1oveSNlervrcEb5xLmlEioKz9nSjW1r0VYuih/C?=
 =?us-ascii?Q?NE0Fl19VWmfXgpUvJTx+KUlpK0pMgKqFl4+c7U3KHpEAVeroEGxwcavnhyH1?=
 =?us-ascii?Q?lULBeZXoGGD1aQnicsOw52vjf1vet2I6UHggAxEYH1EQhZobCMuyIMmBc4Wm?=
 =?us-ascii?Q?wWdK2lCdhhIOe4OAMtFxYzcPNrohdhPnkOt9HeSPvGdVx73jeHkAd6ab7mtp?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53de9e33-ac4a-45a4-e3a1-08da5a0b29a3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 20:08:41.8436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bvbmgwtWdr/JEvyzyzN+fQE19k98/9C9r5ZFI1K6udpiCS4ztehbb96VwvXXKUp2HK0g6qLrWUdOY9CFzejSIRD3dDPtNa1ISOwmELhV2CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
X-Proofpoint-GUID: JPCWnX70jfgiOriwKaoTrFE9QOvEp51L
X-Proofpoint-ORIG-GUID: JPCWnX70jfgiOriwKaoTrFE9QOvEp51L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_21,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=336 suspectscore=0 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 20:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167389

Use python 'with' symantics to ensure that the /proc/pressure/cpu file
descriptor used in SystemStats init is closed. Previously, this would
lead to a single file descriptor being leaked. For example:
   ResourceWarning: unclosed file <_io.BufferedReader name='/proc/pressure/cpu'>

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 meta/lib/buildstats.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 5d32a81906..99a8303d5e 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -23,8 +23,8 @@ class SystemStats:
         # and ensure that the reduce_proc_pressure directory is not created.
         if os.path.exists("/proc/pressure"):
             try:
-                source = open('/proc/pressure/cpu', 'rb')
-                source.read()
+                with open('/proc/pressure/cpu', 'rb') as source:
+                    source.read()
                 pressuredir = os.path.join(bsdir, 'reduced_proc_pressure')
                 bb.utils.mkdirhier(pressuredir)
                 file_handlers.extend([('pressure/cpu', self._reduce_pressure),
-- 
2.35.1


