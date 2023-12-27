Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DACC46CD4
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 04:21:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.95947.1703650858244027537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 20:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a85Je7QP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725ab29a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR418j7006540
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5E+Ml1trekHbLVbZrr
	TcYM5bnRzOV6FQD+7w7YJl2QA=; b=a85Je7QPzJzFORJVsAKIR8IrsJV5U+wRb+
	WDOKWZ+KBXKUMk+0aFQ6ntuyHzviBu5DIITEXoNaak0x++zpW/sjZ1FJSG9ZT4iM
	+PZdvL/ZAWpguHZIZLPZuxZKhERbFUK0NZGmvlCEXomv7bHqqV7rKzT/N4tZASAm
	J55ix3EyaFxKkbahC5/oQckTgL6GBwzumX3ZvWBFrkCaYNvG2e9iaBxFbpXDe06m
	TDq3hw5tcDa9XA56SD1w6+5jFUHfxCI6qkQ0MVP8w/nxckoI35ZCSU2Hy7ihMFwi
	O6Qak3dJS9DzivAZuGBl69idNYTEvnIM/iWYFBmrR8JQ8AnmfC7Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5ph62u8r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:20:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy2TBWQUO1x5v+4lwxXnNsnUJQDQQC5B4JP3iDgt/NMuxFDRf5n9D9KRtmga3glVIzSiq6Oo71H1xl/i3F2HM7QNN8RbFcgGWNUrKmDpcwonQ4iXXbLLfWnZdXvJW8E+MOwJoDF088VgDVsuvO2Otk733FQ48t/Bz5x48SOxKcKVo1o5fQlrT9QTYzi2w7VgIXPKfkgBTtHDg3kcouSnbfP3K1Eypv4mAh1HCVPWfpRgeoSGzxRdycMdtfGz0awrdSh4K1RAKkLxHv6FPaFJIKA6mSPzegBSR/F9ByDv1osm3Rrzd4biURjqExadhvQFdGMYS4k4kyNvJFvN2I79jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E+Ml1trekHbLVbZrrTcYM5bnRzOV6FQD+7w7YJl2QA=;
 b=YqiFY+vNtqDo0Oasv6+qcFLw0ppLO/2+CpEojIwzw+UxsiGVbsgLfozpDa0thCHdvqybIk46vqmBShlOX8nLRv87XT6bhogSyfGhjRKz0zmgN8gL4a3Aqt0tzIVzFbHwpAxBdw9j5P35k25EhrhVGcFBQpRvsx2sf0BalIKdRT8h68CwctqnVms7SRphGJiDiKqisYKZtePXfiGXPbePKcQ7WtJRw4Ed/qkFPmE5aJVEWmMKaEWyPvsoF52/9DqhujH6z9h611kZuZTVf++kaZp8e9rPLKt7TcjFzg/to4PYoHplD/HmQBcQgsanUJrhECGsJ8uNrOWloXpXUmFpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Wed, 27 Dec 2023 04:20:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 04:20:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Date: Wed, 27 Dec 2023 12:20:34 +0800
Message-Id: <20231227042036.2376255-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e5d1f4-e54f-4a35-2bbc-08dc069336a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SwjoGIpP8RFsfi3y4LrEYu5bVlqVNcT9gDPcVIGv8trgB5z2XpAjHJKLZhbYoRuDTt+xIUBnU2SpU2ZaesX7wtETymWwpVCN/PheLaeRs0KhV21ofWbRwZ7K531KfH9rjxQR/NNeZCcpCu6xeYx59f1XTie7I0BBtxTP4GE5al42uhS7GQpD1NMQJsDp7uI+BlT2mwKsZfps4jEnrlgdsIIwjjWE/tarf5efCkj3EeZSFLGDxV9DdoBtl9Jbo6fsbE71LwjTHEvjhncpAIRD0CyWb/7OOdXJ4RxLsMeZ+TU27UGWyO4YVdbEJksVp8RI4T6fkr+NdhHroOxdT+nerYTPZrEKd9bNCeU9cNZ/jrAu4tbX0Y5xjeGU3Y4h4uZDCqhj8lRXxepIODYgKEHqIlG4ibVd14P3klJRLpa0WaUGetZHQeGOMPtCcB1kHGlTsgvG51PXNmrOG4uXR5Ml+ahUl7bA6n6j6VB3c54C+0jRIFGREwvsSJ4l0/EY3MwQzZIO4K5lCfPGqmTHNomdU754w4gyo4f1y2LjnpPL+EnDq0JaEiDH5vU30rZKcpOoQG3rLMGIdbcKX8W4+XRnDcds64rtM/1RpcU+T9YHaTGGjknOuQNmgWwBQ7PaIueIOCVoaI8s8rLel2E/Y9tf6FXBcy629yvGmI/xohIy+1Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39840400004)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(38100700002)(83380400001)(86362001)(2906002)(478600001)(5660300002)(6916009)(8676002)(30864003)(316002)(41300700001)(8936002)(6666004)(6512007)(6506007)(52116002)(9686003)(6486002)(66556008)(66476007)(36756003)(66946007)(38350700005)(26005)(2616005)(1076003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bI2Sz/h70sT5iCfgp/A0/3l8OfEF3pq5THCklHgxnGVcB0av4qUWcweQ6QXq?=
 =?us-ascii?Q?ru0zsvYetpIC42sBg3mtuiFcgA5P/0L5v1uQ6Ues4iuDgiyJ5k3GpFLb+yUA?=
 =?us-ascii?Q?jAP5e/KZ33g3z12yAk1VFI6DUuztaGho+JCp8ZcoFkIyV7YHWc2k4QIbe0vL?=
 =?us-ascii?Q?75qHX+EL2PsJcyVUwsiBXPKkhMz0Rv4l1dXVv7esJ0gT+VgE4LlJ6jEERvvI?=
 =?us-ascii?Q?ig951e4Lq7TjNRsWVXGinASxLDTOW8YSqduxFTbotpmB67T9wXFgncqzjlY0?=
 =?us-ascii?Q?im1eqFliXa66+r4sX0k182Y2JHNjRwel4ZFt8I6JWjhn8BNVIbxJ291jK2Lh?=
 =?us-ascii?Q?W8oyjmjifrGJV38ermABa1BjztJh45vM+pjks2RknOaR3G889+h8/n4rSo0Z?=
 =?us-ascii?Q?ZGvR0TJzTxP15Jo5lO6zmUe1nEWLDqM2KxaWIcQPGgkzeZs1o4vPbwxVsv3B?=
 =?us-ascii?Q?HBUcvW0T2dfFgPHZguoDtK9VLNZ7ADlHwnj7bzY5nCmwlSyHd20vXsCXR2eo?=
 =?us-ascii?Q?zBHZDq3/KhQDl5iPDUI/g5Kg/zt3g1QKIBt+23JjgNGYPCq+uWmYU/QNY1d+?=
 =?us-ascii?Q?9X7AgCq8qsEqaG5eJhAbXOLRhE+tj7/Myk14BGO5fiFkKXDZUh1qMkZV+JZS?=
 =?us-ascii?Q?w5JUCaEOjwZUbCCAirQJiAGcvdxBRkYMCSmwuSib4TCqcGvAGP031vlaaIMN?=
 =?us-ascii?Q?z50s/o1lw5DQDBxdFSbqF18YJaxYxZdW85mkuSxt1/MqcHTncNAbH7/BVk7Y?=
 =?us-ascii?Q?uptWiL2NMaUg3nthzya4sC+JD7w8xZx4oO4nz0He1Dmx2rLwc7PW/9usYAgE?=
 =?us-ascii?Q?KcOZ6OWbERNJ9lPMtBnof9YiwJLSgBiP+01+IgetFxk/YHD8sQcrT7V11sYm?=
 =?us-ascii?Q?aq1XigLLUGvsD+1VAs0c9cyJFC1W8qxgqC0k0MJ1StSrSzBVWfmEtZ/6XbcH?=
 =?us-ascii?Q?Xc3UOBiRhecvddlSd79EeA6MSzZY3FrLFxLO7ccO92+LqjHJq3U6Vo077Svz?=
 =?us-ascii?Q?B5RTjYmwtmxyyfaVVtcY1s2kZ3VrR9khP5j4TbnP2N6ZHlFy0PAThtQprQfI?=
 =?us-ascii?Q?jf0vYzzhvKoVSBmokW2rcCNyrRZ08pIGF4S2zTTrXkRKGxGxmDiq8tbqTr+u?=
 =?us-ascii?Q?swG4liCGEmxOfnRerkwmm5/z4Pw8bjXicx8YVsKh601GEuBK/8Mqs1MY8Bxf?=
 =?us-ascii?Q?U45+F9Ly/kBkH2H0wBrKMipALVjj0qd92O5c8kDLxNnbUFLxHyx/8Mig+/1K?=
 =?us-ascii?Q?u5RiCP3liHnc29xEKKPjL7nidlbbEcZRx2n5UkdpnV2GxP8WnJGil+XA+qnB?=
 =?us-ascii?Q?gqVrCIQewAg2/WTlrJIxTKJ5suoQttxfebfANwH8pkAS+wuKWIwDjomOdsHZ?=
 =?us-ascii?Q?rBAdHECjqBqdIXJRItMr3MOBrPr16QYqz9NCGvVpnXv76J01/6KhFJvRYx5q?=
 =?us-ascii?Q?h9dMbby891fIyd0BMpt+uUoQ6hrSe8bDWNdYIGRz9PRu5gbUDg7AcumInZ3p?=
 =?us-ascii?Q?9493HPsxQUh2OdNosyseALk5vLJRByBUvS5IGNUBMK5kU9HL+ggyngPS3OB7?=
 =?us-ascii?Q?CR9FTvv/4DOfdKwZSwSBFz+Z8rYuXZ80zuLu8zF5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e5d1f4-e54f-4a35-2bbc-08dc069336a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 04:20:52.9589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 94t0quuVcvG2C+oJhVu5HlVgQPU0wGOlBFEj75c6sO0txQtGvurit7jmOedK1fL5wmdvA64GDHBcEk6ySobRHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
X-Proofpoint-ORIG-GUID: suXW73WNRlR4CxRQ1nYBzH5dLHxNW3Mz
X-Proofpoint-GUID: suXW73WNRlR4CxRQ1nYBzH5dLHxNW3Mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 04:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192923

From: Chen Qi <Qi.Chen@windriver.com>

1. Patch changes:

0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
is removed because it has no real effect now. The /lib is now
/usr/lib because 'usrmerge' is a required distro feature for systemd.

0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
refreshed for the new version to avoid patch-fuzz issue.

2. root user's home directory now defaults to "/root":

The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
value, so if users set ROOT_HOME to "/home/root", the behavior is the
same as before. However, this is only for backward compatibility. With
this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd.inc.
This is because systemd's source codes are hardcoding "/root", and other
values are not officially supported. See the list below.
$ grep -rl '"/root"' src/ | grep -v 'src/test'
src/core/namespace.c
src/basic/user-util.c
src/nss-systemd/nss-systemd.c
src/nspawn/nspawn.c
src/firstboot/firstboot.c
src/shared/userdb.c
src/shared/user-record.c
$ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/ tmpfiles.d/ units/ xorg/ tools/
sysusers.d/basic.conf.in
tmpfiles.d/provision.conf
units/emergency.service.in
units/rescue.service.in
tools/list-discoverable-partitions.py
Previously, the recipe was just substituting sysusers.d/basic.conf.in,
which is not enough to be treated as 'fully support'. I deliberately put
a warning message in do_install to warn users about non "/root" ROOT_HOME
value. Don't remove it until all above places are handled.

3. cgroupv2 is now the default.
cgroupv2 is the default for systemd for many years and it's the default
for distros such as ubuntu and fedora. Let's also use it as the default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../distro/include/init-manager-systemd.inc   |  2 +
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 ...tall-dependency-links-at-install-tim.patch | 22 +++---
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
 .../systemd/systemd/basic.conf.in             | 40 ----------
 .../{systemd_254.4.bb => systemd_255.1.bb}    | 16 ++--
 6 files changed, 25 insertions(+), 132 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/basic.conf.in
 rename meta/recipes-core/systemd/{systemd_254.4.bb => systemd_255.1.bb} (98%)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 595d1f2644..0a76647459 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+# systemd hardcodes /root in its source codes, other values are not offically supported
+ROOT_HOME ?= "/root"
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccc3236457..1417e0150f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
-SRCBRANCH = "v254-stable"
+SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
+SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 085f1e9052..be231cf6b2 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
+From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH] binfmt: Don't install dependency links at install time for
- the binfmt services
+Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
+ for the binfmt services
 
 use [Install] blocks so that they get created when the service is enabled
 like a traditional service.
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index c7939a10f8..219570ab19 100644
+index e7bfb7f838..1d5ec4b178 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -149,7 +149,6 @@ units = [
+@@ -154,7 +154,6 @@ units = [
          {
            'file' : 'proc-sys-fs-binfmt_misc.automount',
            'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index c7939a10f8..219570ab19 100644
          },
          {
            'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -246,7 +245,6 @@ units = [
+@@ -251,7 +250,6 @@ units = [
          {
            'file' : 'systemd-binfmt.service.in',
            'conditions' : ['ENABLE_BINFMT'],
@@ -45,7 +45,7 @@ index c7939a10f8..219570ab19 100644
          {
            'file' : 'systemd-bless-boot.service.in',
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 6b1bbdc91e..5ec5b8670a 100644
+index 5d212015a5..6c2900ca77 100644
 --- a/units/proc-sys-fs-binfmt_misc.automount
 +++ b/units/proc-sys-fs-binfmt_misc.automount
 @@ -22,3 +22,6 @@ Before=shutdown.target
@@ -56,7 +56,7 @@ index 6b1bbdc91e..5ec5b8670a 100644
 +[Install]
 +WantedBy=sysinit.target
 diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index b04412e037..63f116e4fa 100644
+index 6861c76674..531e9fbd90 100644
 --- a/units/systemd-binfmt.service.in
 +++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
@@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
  After=proc-sys-fs-binfmt_misc.mount
  After=local-fs.target
 @@ -31,3 +32,6 @@ RemainAfterExit=yes
- ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
- ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
+ ExecStart={{LIBEXECDIR}}/systemd-binfmt
+ ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
  TimeoutSec=90s
 +
 +[Install]
 +WantedBy=sysinit.target
 -- 
-2.39.2
+2.34.1
 
diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
deleted file mode 100644
index 98914ae154..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Sep 2020 18:01:41 -0700
-Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
-
-These directories are moved to /lib since systemd v246, commit
-4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
-the old /usr/lib is still being used.
-
-Upstream-Status: Inappropriate (OE-specific)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
----
- src/core/systemd.pc.in           | 8 ++++----
- src/libsystemd/sd-path/sd-path.c | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index 693433b34b..8368a3ff02 100644
---- a/src/core/systemd.pc.in
-+++ b/src/core/systemd.pc.in
-@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
- 
- user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
- 
--sysusers_dir=${rootprefix}/lib/sysusers.d
-+sysusers_dir=${prefix}/lib/sysusers.d
- sysusersdir=${sysusers_dir}
- 
--sysctl_dir=${rootprefix}/lib/sysctl.d
-+sysctl_dir=${prefix}/lib/sysctl.d
- sysctldir=${sysctl_dir}
- 
--binfmt_dir=${rootprefix}/lib/binfmt.d
-+binfmt_dir=${prefix}/lib/binfmt.d
- binfmtdir=${binfmt_dir}
- 
--modules_load_dir=${rootprefix}/lib/modules-load.d
-+modules_load_dir=${prefix}/lib/modules-load.d
- modulesloaddir=${modules_load_dir}
- 
- catalog_dir=${prefix}/lib/systemd/catalog
-diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
-index 1af3a36d1d..def502b717 100644
---- a/src/libsystemd/sd-path/sd-path.c
-+++ b/src/libsystemd/sd-path/sd-path.c
-@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
-                 return 0;
- 
-         case SD_PATH_SYSUSERS:
--                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
-+                *ret = "/usr/lib/sysusers.d";
-                 return 0;
- 
-         case SD_PATH_SYSCTL:
--                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
-+                *ret = "/usr/lib/sysctl.d";
-                 return 0;
- 
-         case SD_PATH_BINFMT:
--                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
-+                *ret = "/usr/lib/binfmt.d";
-                 return 0;
- 
-         case SD_PATH_MODULES_LOAD:
--                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
-+                *ret = "/usr/lib/modules-load.d";
-                 return 0;
- 
-         case SD_PATH_CATALOG:
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
deleted file mode 100644
index fac288f7fa..0000000000
--- a/meta/recipes-core/systemd/systemd/basic.conf.in
+++ /dev/null
@@ -1,40 +0,0 @@
-#  This file is part of systemd.
-#
-#  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU Lesser General Public License as published by
-#  the Free Software Foundation; either version 2.1 of the License, or
-#  (at your option) any later version.
-
-# The superuser
-u root    0     "root" :ROOT_HOME:
-
-# The nobody user/group for NFS file systems
-g {{NOBODY_GROUP_NAME}} 65534       -            -
-u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
-
-# Administrator group: can *see* more than normal users
-g adm     {{ADM_GID    }}     -            -
-
-# Administrator group: can *do* more than normal users
-g wheel   {{WHEEL_GID  }}     -            -
-
-# Access to shared database of users on the system
-g utmp    {{UTMP_GID   }}     -            -
-
-# Physical and virtual hardware access groups
-g audio   {{AUDIO_GID  }}     -            -
-g cdrom   {{CDROM_GID  }}     -            -
-g dialout {{DIALOUT_GID}}     -            -
-g disk    {{DISK_GID   }}     -            -
-g input   {{INPUT_GID  }}     -            -
-g kmem    {{KMEM_GID   }}     -            -
-g kvm     {{KVM_GID    }}     -            -
-g lp      {{LP_GID     }}     -            -
-g render  {{RENDER_GID }}     -            -
-g sgx     {{SGX_GID    }}     -            -
-g tape    {{TAPE_GID   }}     -            -
-g tty     {{TTY_GID    }}     -            -
-g video   {{VIDEO_GID  }}     -            -
-
-# Default group for normal users
-g users   {{USERS_GID  }}     -            -
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_255.1.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_254.4.bb
rename to meta/recipes-core/systemd/systemd_255.1.bb
index 0c12926bef..daa3a01fef 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
 SRC_URI += " \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-           file://basic.conf.in \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
            file://init \
@@ -29,7 +28,6 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
-           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            "
 
 # patches needed by musl
@@ -73,6 +71,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
     backlight \
     binfmt \
+    cgroupv2 \
     gshadow \
     hibernate \
     hostnamed \
@@ -266,12 +265,16 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
 # The 60 seconds is watchdog's default vaule.
 WATCHDOG_TIMEOUT ??= "60"
 
-do_configure:prepend() {
-  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
-}
-
 do_install() {
 	meson_do_install
+	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
+	# This is done merely for backward compatibility with previous systemd recipes.
+	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
+	# may have unexpected runtime behaviors.
+	if [ "${ROOT_HOME}" != "/root" ]; then
+		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
+		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+	fi
 	install -d ${D}/${base_sbindir}
 	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
 		# Provided by a separate recipe
@@ -754,6 +757,7 @@ FILES:udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
                ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
                ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
-- 
2.34.1


