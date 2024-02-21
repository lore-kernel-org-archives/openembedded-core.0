Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B350AC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:30:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8088.1708500599526824015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2781ad8f55=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L70B5e023863
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:29:59 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20crgq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4AR9mQru7QnIwL16l5EOIefVTk4ZBag/srMdhlDS+UqchIY5jSGqA/TSzZCXBrg37+Qe3v3UI9hbp3cA/ONyW2/wJNHcWSctPv48qFojCSoBpOHxGymQ4tUDajrBSBRqbiKqd4mtRdv1ZCGLTEQP4YzDUg2SKGEBe43Kb31DWvoY3rk6eLSAY9M8TVcwNjUGikxg7W7j05fg3w1gfN2xLingE0LuwLkKT/ImQGYLMKBzoesLmmSrOGzbYfokunIVuki/PR8sE2Q5uMw17h5AofN3uxKlwydClVvcwZia1tgi5uSL6wj51+UkIBq/+AapuVCqBVUTljyFeLY91BZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUCb3IWERtiO2cTWytL733X4f55TfNEXaqzQE+7Z7ZU=;
 b=J/tw5IX1J/am97sNDjLFZQdW0JcnVdwcuFqRKc7Rgwq+OQhO35fzy2PZMdsWH/NIEUfVxV+NNNQLQPrHc2ETUWKgVNQ8SWnWpLkCSu9WvtkEEm3gm6eSYr8VTCJaNE7/4f3aeNVpxBsEVqWFZZw7pJFNURwM70QZgC0QgxjRMxP9ipGG8OZhQUzWmf8Z+iM7aJlI89UrxKsSnOkdDJcPxYy68dHvk5ze0fEjkmYE25B8BvbIcwSpUecTQJWVto6l1Tuve/pOl9CfhnoxceMaukOCb9/qv8q/UAG9uWbE7pCCZqcjWg1U9XQlcGwwbBlRaxMJjU2PzLA9G9DCzZY/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 07:29:56 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 07:29:56 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: qi.chen@windriver.com
Subject: [OE-core][PATCH] systemd-systemctl: fix dead loop when multi services enable each other
Date: Wed, 21 Feb 2024 15:29:42 +0800
Message-Id: <20240221072942.3521748-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1540c8-b619-45bb-ca29-08dc32aee75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P6BG9h7Dwr7nEXPtVQC3I4wTOJhWfkCtC+yohKJb6fqPrexRmgwKjzBDVUAbIsWM4Z5OCRxNO90uHJq5Kig6fjvMMygO+vltCBP4HRl8gRcMlck+01r9wcMzx/caaIIm3rUoHtW/pYDi71VpLaotYc4AnhgwpxtMePHR0L9hhHVjM1ENJbhRXzILycBfdn9rhvDIGwqRam+J+pws6DGAQ0/Dz8Yd9DQWQx1v+MmFrfh5+TVMhaLOhE+Ls5FN4HKSFOSmEtocuuzgZswjdNOQy6QXD+C/DxcnMtinwwk53EEXcAxu1c5ly7jetBCrfvviIkkl4ww9JMs9vjQAZQJBw1BCRfdJ90ApLsrcYnq4dSdjddPVJPP7zV1/Q1TjYX8jruzMqlWbdKg30//WGrm7ZvjZWPQdoC43pSN9FIKGnTh0hWSq6IKdAs0PfCmfvI/WohVikzbr7m9H5UDSL2YUGyMHez08patDzh6OhQF/GjI5nsouBmEZPW7XLxnsOmN2y3fq9V4tpRoTqHPLLOifBTRFHB8Y4tsmGMltmacYGDOry/0u/DTopzmiuqjLCssxPNfntzNuuNnuB4OfSi8YAqPFxEypkfbJ+NHx/9IVLdA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ujGkDGosR/nshfealEfE3dnRu/+9B+CSANvGOxGMopYijhDx1bA6zIOfWbJ0?=
 =?us-ascii?Q?IaEFzHgFeaXD7OLkKWkK5dSOepraOz1c4ixzflkW+Res/wPrBIb4T2nBwB6O?=
 =?us-ascii?Q?Pv/HSzwuVroIoXIqlUsQ6TfJ8GPl33kILDyKPQl/od5dSOiUJ+VqheeO9xPg?=
 =?us-ascii?Q?Ozp7NHTucYIaVLxrGsQfzh3WKuyKQiFZ0dZ1T/1nsQMVbZEzGnY+2lzqQqjH?=
 =?us-ascii?Q?JGu7ga7y3tLZxTNmHT4m4uUGzOBUl3Q7Cg2kk9czyHsXmHAN3LQW4GuXjW/2?=
 =?us-ascii?Q?1QpL4o7C2XlkZyznxuXEoZxqhLUnh+yJ+HsJsigLzmoKU0HimLxufA+MPuMy?=
 =?us-ascii?Q?TzjpA+mPs88ijfMMAbpG7jroZ/cpeGtJ3sTUF2XtuJ6oUbsjo8HZXz7ETaL5?=
 =?us-ascii?Q?B3+4JtLUXyKZnblCR27wc9HtAwvAbkjYyQLwG2tMCfKd68Xtts+SjMkcf4le?=
 =?us-ascii?Q?1BUtW6PbExTjYlQnMoaVIBaEYddHViS90VqY/4Ux9UxRiQTEFuT7GwiW7qCW?=
 =?us-ascii?Q?0f/BS17EGezKA+n3UTdHv//00vwwXW2OEL+Y4IV1dwJgdMpVwnSCY67M8fRb?=
 =?us-ascii?Q?VWdZTZtZN4QTfi9rDhFdcmZj7fg0QntlybXJANtYwfZk+Du6uM3iNntDMUau?=
 =?us-ascii?Q?j2At0XFhc4TRb0pPD8wVnOYv3i1b5E+kQwNET6gyKxYHBlqvIbMaYTWfcCSe?=
 =?us-ascii?Q?W1ybqmDzm4komF4nv9dAbXRfphZVcuBRmWHPD4nrSfA9K1AlZHcWLOYbKFW+?=
 =?us-ascii?Q?Ktm0JPRXzif6ygIRPNUqW8vjd54yYpZbYecZN7TIEvvCbrSElXrKR8ZYg4xF?=
 =?us-ascii?Q?5obSOTpveTSNNcpjnZ4ddyAdQAbkTQH1fSE+TR2YkqyMFRdkVA1LXQJaIPfV?=
 =?us-ascii?Q?VnLWevddL9ji9xRIzb289xrNVZ0ALFFxnEfFUkCt0XnSPbJ449l0N6+nhNGw?=
 =?us-ascii?Q?1ViIAGLrvLQeo6VZyX1kXchvJbpy6mg+EbH62N8aLJrnSvsw8KdIEDkhtp3j?=
 =?us-ascii?Q?0/jqpxdf3tXxK2u2zWta7x4dnm9C5mrPu2Xt/kYA5oMzI98itS2F68ZVYsFk?=
 =?us-ascii?Q?8yCXEdxIZPm78sJzd6njiL2lvGG2zlWnd9d2aMFxOnTcWNjbmTwgy4qiXnOh?=
 =?us-ascii?Q?Fbw0ft0eje9KA3bBBHs0wUsqaX6TAnGPiVLTlPizCKbM+j5LN1ELJgQ+I85h?=
 =?us-ascii?Q?HDg4Gn5ROZPZurnz0LbY+sQb9mJs3ujKtP58R222Om7sIKLZiPdjxCt5jY4M?=
 =?us-ascii?Q?i7iBMXCjMByHZNTmKflhZ3bnKvkR5RW27R5k1yB2hm9ukGuqnpMeQMZdmY6a?=
 =?us-ascii?Q?7lu1pqbqMmMzs9Juw5AU2gttAO1sHH3KV1FarpXC+5TPRUjB+eMCNJ6D3Pht?=
 =?us-ascii?Q?RdMt/6iiOgxquVrUQTKitqOXwy1EPZVg3vmoib9+tXczJLyo7GjLwz5X7HhD?=
 =?us-ascii?Q?gO2sZ4ocSZv218H9dqXpm2D3ZvIQwO163g1XHSfnB6eUj2/6QMxiRrS95iNa?=
 =?us-ascii?Q?IUQwCRTSTHTSRnCBUIeB4CqnUKv262Ka6SV4VEtuxVTgp40lF795fBDNkoYH?=
 =?us-ascii?Q?EfI0QeH4Z6vgpquvIaoAZIpcAgGxAmHZL+aGQDfnM/w9V7UlbUu+HGXY2iKl?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1540c8-b619-45bb-ca29-08dc32aee75d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 07:29:56.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uuNWp8IbiyQ4bzzJ5RgtXmjGDCn2A6jX5TWBwxi2m4JL/IPkKIir+dTEl3gV64W16U8+IuQnTQDD+3I/gcB9ZDEIpTr3iE8YXY1w87UBbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
X-Proofpoint-GUID: KwRGwzgrSpq_B3hOxvlsQQ7un6M5aStZ
X-Proofpoint-ORIG-GUID: KwRGwzgrSpq_B3hOxvlsQQ7un6M5aStZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=821 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195958

From: Xiangyu Chen <xiangyu.chen@windriver.com>

libvirt has added a feature that all sockets for a service being enabled when a single
one of them is enabled since 9.9.x[1], it likes serviceA enable serviceB, serviceB enable
serviceA, that cause our systemctl script trap into a dead loop in postinstall stage,
the error message as below:

Traceback (most recent call last):
  File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
    return self._str
AttributeError: _str

During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  [Previous line repeated 988 more times]
......
RecursionError: maximum recursion depth exceeded while calling a Python object

Here using an array to record the services which has been enabled to filter the duplicates.

Ref:
[1] https://github.com/libvirt/libvirt/commit/826931e95a38af8322f8ad069dc89117c6404a00

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 7fe751b397..2229bc7b6d 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -209,7 +209,7 @@ class SystemdUnit():
         except KeyError:
             pass
 
-    def enable(self, caller_unit=None):
+    def enable(self, units_enabled=[]):
         # if we're enabling an instance, first extract the actual instance
         # then figure out what the template unit is
         template = re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit)
@@ -248,8 +248,9 @@ class SystemdUnit():
         try:
             for also in config.get('Install', 'Also'):
                 try:
-                    if caller_unit != also:
-                        SystemdUnit(self.root, also).enable(unit)
+                     units_enabled.append(unit)
+                     if also not in units_enabled:
+                        SystemdUnit(self.root, also).enable(units_enabled)
                 except SystemdUnitNotFoundError as e:
                     sys.exit("Error: Systemctl also enable issue with  %s (%s)" % (service, e.unit))
 
-- 
2.34.1


