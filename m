Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C097EC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:55:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.9463.1643180111318976830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fHe9I+6a;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8025fc1da3=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20Q6swfI006175
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WYvbAoTssazZSZ71wYeCvJwdNvBwWvoFyqEsPpOGdB8=;
 b=fHe9I+6ax4pB0oSrqLrUZ/97AIo3oiQsBijcEy/moneorzoWxh5oIn4kRUZO6yuM8zBR
 rEoUv2pMMaH+ua7Gjuh4AX7QL01tzwR5i3fNdvNbF/Esrsm+D0K/Egqv7TY+al8PEcp4
 X2AQIq0opnBx/bzgAzuYnf0sLarL87lYO0VndJFkLu0wTuxtMoAwJeDPTJe1iRYPuqh+
 cT1JXnGBTRGi5sk4/u9ZyGLegNYxsAO94z/36hXqNJTlLehbqV07DPe9xg+nOKZ0MIU6
 czH80zAqV64x+TQFBnsc+MI904Lty8ahsxroMq0F9eyxfpgfrBd5uD9SC+BxdhaxUkCP LA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsj6kstf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpxcgltLJMxWr4B8tmkSfPxO6hoq/Qws2XAYuPxvwZdU5cZXPnDiVdUosJV9pk3TQdXIoMWZix48hbIqWfPSWCyaStRAOQtsgkaWaxJb9qOD1fq9UnOB8pV5MpMr2jc50a0sqXaskZYGxZAL5IN5biwzIodNKwzWGK6b0kQVyqqgCsdtYv4Z3/D7nZ6f0JygF5tSVi73Bht3xeL0krfSte2d21gih+9s2VH/5l7ylA69oQLgS3Fb2bXpBpN5aqxzNIWUJ6F069CHBh5EPkQLr5R06OYVemhOMzjte331puEtFs5C6Ds3Lz+SLiGH/d8XyuWzlnSH9exJVVLm58WIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYvbAoTssazZSZ71wYeCvJwdNvBwWvoFyqEsPpOGdB8=;
 b=VrNcwcRpn8zXEEXYrNCZSl/Ey8xMQeLqBQBKTh+smofWBcRb2alnWyMWcZngvSffBkC/YBWhn2pXLVA3SnUsMvtRlC9kxIg/UuQLZ/usa0FuowUXiFAcK1Obn9zPywLNBfP+2iNDuFkezAYDj6INofuWlKUohdV6Is9z9nofx0KAn5S7upGZ5Jr88w/fDR/Sns3/oLLWkuT/N01P+rvalu8A+pJHgUefZ4d3LOsE0nGl9zXnZajHYgE4/jifBuRFVerNKNXPGNRH5zEB0nWucBVzTy5cqwJ/y/YePbFvYswJqfbKVBZJ5uOcUHhCqgZXnttk6M0/Jb4Iu6O1iIx3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 06:55:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 06:55:08 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] mdadm: install mdcheck
Date: Tue, 25 Jan 2022 22:54:56 -0800
Message-Id: <20220126065456.68673-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fc949b3-f540-47e5-83cf-08d9e098ca7f
X-MS-TrafficTypeDiagnostic: DM4PR11MB5437:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5437810CC3BC9B8C4EBAAF09ED209@DM4PR11MB5437.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jZ4034UL14Hl5UThuRpWJ35wn59VzrKu9A5rVyltlPRjsg/0WIetZxM0AZ5AFepUcEimLc+bytULqPM/ip87iZKbpzLq0/i7rINqXB5rPfH+iG+uOYLX9Rpcc1OPa+3ggS6GpFobAz+l+9EkPhNptjLp4Sp+HhchNtge3bO8cFv+48tKwweHUOvwd0+4MJo6SymCabJa2WD2SugotpM0q3tRary1DSjDf+WNHJfaFbsvQ71km7TGUopLPPWHEmeSrLUKWQAXvg/FKHzQ5/M4afupws03q3jPyd8zhvdWOcmb0rtRvQf7y7pWrOdRQOhq60QRVkH48O5d5CmzYPcvBY/Lal2LA+XcgE1q2NO5OrdSLYjObBAXOy4wHNoD4GZlPo6eXBnZ4CPa9ENVsMunEGBT5uFr+4uptWCzY01KBYlDcpFVXV7w7h07uhE8wNoFYqhk5mZ6Grb7u/q7bqFdzuTeb4if4e0ce5CLv/VCHNxtH25S6RFzSpwl+cb9qgXpIfoxacEQCNxPhGP78WhtOrlqgWiRkK67Ko6JmyviHDl6cEz/ujFXMipeAR9MGrgh3LEwxrKQP7du/6511JskmLIrIWiSYqEZi7Euvp8pred1ebDvJw4gKNbReUnY7f7qU9zBlRiAw2XnU2PvHbGB+tdZ34M2JIJu78tAJv2EtmcZ/ILzrC6GN4FF7Zyy9PKMcqrGs5MQrrPO9Rst0kehQ8HCoPIuYW+3SfzIuugQ49Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6666004)(38350700002)(38100700002)(8676002)(86362001)(6916009)(66946007)(66476007)(66556008)(8936002)(316002)(26005)(36756003)(6506007)(52116002)(6512007)(186003)(1076003)(2616005)(5660300002)(2906002)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QIJhKP78mU/bR3Wk8Z0XR6727luz/JLYAG1YEN9PK+qZnpIN4Xxr2NRa0QZ+?=
 =?us-ascii?Q?adYkPWK/Eoqk2xFi5Bzo0HvTw4iITyZnulDXMpxk+vkwWly74SIc+Tk/2xP/?=
 =?us-ascii?Q?eKBO2ns/LnwyZXwzP01VHr5K7U99ATz3Vu5zPzHZJkMvqyiHLmr1l9m0RYsP?=
 =?us-ascii?Q?83K9Z/uEPJ37eJkdn5vmBpZYtv0s7+q44EzBS4fKUTfpo8zME12+0BmndPGj?=
 =?us-ascii?Q?YVLtEf9lUObh++0PxppVTMKUGNed+Wo6093XhyzkfFJbctTUGUbrnkmCmkIL?=
 =?us-ascii?Q?flZcS+3tS+9oBWNB1MRnFOhz89eh+61S5W/nqp7sTjg8hhviirzvvgLEo2Ce?=
 =?us-ascii?Q?aRn8exuQ4i2m95/IDSWZOXp66a9/HpkAmEN9HALEPO4Y61qFkV3mpGX4df0L?=
 =?us-ascii?Q?u43iUz8VE2ShXxZqeByY1aUT0bsOZmzv4W9v3X8wHeb0TE3WEkpdkTw9i2r8?=
 =?us-ascii?Q?5ZmC1rxzoR80BUdXHvU0DZKvZvnmpM/Kd/KjQSANzP1GFNEWemxSBcHxbezz?=
 =?us-ascii?Q?vO7Nqsu0QlkYNgVPcdcZYuYqQc+tLEAvNthaxXuZ7knCYtBsGQ+bz55Me0X5?=
 =?us-ascii?Q?wlLcu0001OWv8TnjsD3FoOs2vOPsFOJaAp0LWIyKjbOb6WNM4dVi1DT8+vRm?=
 =?us-ascii?Q?HprfUqXf29HPp3UVNo/WCotI82I4MrpAhd00Nm3YZM64FE15l8/Xqm4iMzpY?=
 =?us-ascii?Q?cHG5ewMf1LoVZtV4o8hjLfAh0Mb58nDYtJOCw9sY4nj88fUsCunj8bxH5z3W?=
 =?us-ascii?Q?ppbgryB8plLkubK9D7qKkk4H7dpmlA6maYmPr/6ymiFM7Fs+QVh8joRp+em+?=
 =?us-ascii?Q?TIp10G0VG3Gwg7rFtHIylHeB8Akfq3AFMdz6+Io4n28vVrVr6WA64zzdOm0R?=
 =?us-ascii?Q?DpV2PDjskiIUL8fhmFkZ/pc6Rsj4x6/oz+8KWduq8XSm1jNd4XXiRXEC88Qh?=
 =?us-ascii?Q?fZRLIaXGU4mfgwZ+C5+TjpCeftNIEsfpIP40cdf44HkKo/ImfAGDqW81l26O?=
 =?us-ascii?Q?3qMCXItf5edQ5Ott23dyPfPPlF1EKVFJRduf5dkJxOraqUyUHFB5Yep616PY?=
 =?us-ascii?Q?0Vbc112VAe+jtQzg9/GakhSF98MhLSunbeMILkE+cmphdNinalX0Ccv1TO4+?=
 =?us-ascii?Q?Gc6jFAx+JGgWuG3iRFrOehtjnXAc6yt8oA8xYb11GMd5ZJVGRzrQsDfaf7dx?=
 =?us-ascii?Q?H2V5LW+R0PU0Fx2jBbMw6r0H4RChQd45efjkF0G5FQxk+FwNBWgju8KgF/zT?=
 =?us-ascii?Q?OhcCUcgeTzRUjZiYac+qi2KwTkeaOexu/2d6ScDTeMaC5+PISHGgGl4abNJJ?=
 =?us-ascii?Q?25wrz2+ZdPR8DgsgYx8nFVh66ccPM+rP1h87p8Bv3tuEkybNjLDLTSogNDqZ?=
 =?us-ascii?Q?uCBFO8yBmOZkHMzLpG3A6YuvoQsO8aotkV+azW097KI/AZG1EAZIIx5vIPh5?=
 =?us-ascii?Q?dnO3mvo55Mt2HF2zkMq8PCIN68sfyNCofd6c4zPm9BenhKeV5YNpk01WhMPs?=
 =?us-ascii?Q?yIp1kBdfaO6lSBYzANbuE5pO/wghSju/kOoMs3gS8TTAFGezlDC6PVP8X/gl?=
 =?us-ascii?Q?ZsAbA3Yy03TGrqbsQhjozZ/UMDl/m7q/JFxI22WYJl9RArMGiLxMYvNvyOgL?=
 =?us-ascii?Q?jWy0VLd08vqQyRElfar6P6M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fc949b3-f540-47e5-83cf-08d9e098ca7f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 06:55:08.8203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PrQ9MBVus2vYybs7ybLbmH4A9albJRbyzyB3CMa8P9LDO5tEsfdKsGFfTs2DkQalQ8iZ/NCbPJIWfCDZrXdpAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-Proofpoint-GUID: lXCKP-24RmN8SGmuz-tptIBmv-29giiC
X-Proofpoint-ORIG-GUID: lXCKP-24RmN8SGmuz-tptIBmv-29giiC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_01,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=939 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201260036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:55:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160959

This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
new file mode 100644
index 0000000000..3f76ef54d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -0,0 +1,30 @@
+From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 25 Jan 2022 16:25:01 +0800
+Subject: [PATCH] Makefile: install mdcheck
+
+The mdcheck_xxx.service files use mdcheck, but it's not installed.
+We need to install this script.
+
+Upstream-Status: Submitted [Sent patch to maintainer]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 2a51d813..db40c7fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -303,6 +303,7 @@ install-systemd: systemd/mdmon@.service
+ install-bin: mdadm mdmon
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa51364283..e15f8aadab 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
+           file://0001-Makefile-install-mdcheck.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
@@ -92,6 +93,7 @@ do_install_ptest() {
 	done
 }
 
+RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-- 
2.33.0


