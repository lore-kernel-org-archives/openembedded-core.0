Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD43C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 19:32:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2765.1667503931583420668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 12:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Nb0u90bh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83062f08e3=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A3BvlRI032037
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Nov 2022 19:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aqoru0WQ4Em6NDM0LkEuO7SUcgRKsLMfT19rIMEsO8Q=;
 b=Nb0u90bhLe47xJEkCRcS/JhAWEDJwDT+zSLXAruemrUcjO2zSCN9swZl/tGlmx8klNR6
 4rqtumlCj9PLEqkOAY7dt3Vt0OmMa/6M+uK0uG5YIIudguwwIxJJhf11c66PZthMUIoE
 DjXIQXS/TAxzN/RLqGIIfqPJV/r21sR6FSLDVDPmlXDqbHGNAqglaqqWGAVQl4gO/FCC
 K79vg7oDQvoHdFTlzjgu0dTDFuXODuJTh2q9EresbFBNCoemhr9lTy+nY9GvZ+LHFUf3
 kUxgJ7j+XywCg42pmOeJsfVGHVTKhgBSfONgU7y90X1OOuyt2koEHox9PFJPwHnbPv63 ZA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3km4d30q2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 19:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+Nvb3QejE5MS6nyHYkitzkE+GOzKIXnUlcDRoeZ5Ek+QRiiUZqpAKXdsh7QU3Y7qOuNbmOKlArh3tK5SSRXjq7p6JXnKpebp1bo9BKfnBc1d6LxSeZYcsyQaVQsD8gOGgCeRrspFdLQIJDbKVKT08xzvXwuNtcb6v+gWiaHJXlLEIbE22d1QUEsZ2rgVbEKeM+AlBoDqxBonOeh+I1RW22Jl6Z+nsvCz8CwEqgeU8Fz8DN0P1AldJ8tqv5i2mEBDpcT19zjayLRSEn7OOFD+oTCm9S4MU4pLoyDzE9p2PbLD0xko2gMMaCXum7vZNujNI7wU8B/tKP2X7xn2yQ4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqoru0WQ4Em6NDM0LkEuO7SUcgRKsLMfT19rIMEsO8Q=;
 b=lXhQNhyI86+o7bRHlb5jxjbofu1PYx3575eR2jhhrQyDRGp12h2KQNmyujWtfG5subBO3uDxzQ/8uVR7hWt4MuGU4Mllf+GAH0eabXYr/GHCOb2stpEhzYfOiwfWLiBOEIn9wp7OJzg7SpFHsBypmT1M7sKpyWuGSN8RI43Z8nZsq3ZSSKcxEPSFU1zm/39D6YaPPt1hb13jao7cWczONhJs07gnwzNB/Ze8ppXmXtkGkkKrGxRnvtOn5LCK0FzSHOlKusbhELg9EhayeFFvGYirpsuhrh2CkDEfGHtYS2W3hF8hLC8HsNtHWmhLLc+T3o3fJ784HxOMkI/wHDmgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Thu, 3 Nov
 2022 19:32:07 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::1f24:5efb:1519:ef4d%7]) with mapi id 15.20.5791.021; Thu, 3 Nov 2022
 19:32:07 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] blktrace: ask for python3 specifically
Date: Thu,  3 Nov 2022 15:29:58 -0400
Message-Id: <20221103192958.29651-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4P288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::19) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: e8501ab8-719f-4755-ca05-08dabdd2182d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7IXMQF8pVrlIy7SYsSGyAuGZ4L2Iqphr5hwBt1B+UJbbzu57KfGdkRlm7dRr7zlpu5D7xuDnmTR1T1swyJkBQXTevbF+sYmSdl/+7ZtR25JfrCtByz38jmRw6C9YMRSIrASoOGihMvTpoQoxZUjYa8EskE7aLP5/CxAAxAJ8rX66xSEA2NZ7QI4imlKpHlBJ2MswCFJi3Y5MHCqr3I5KjmvkK5CPHJGa6Jzp1x6DRS6dQ4etYGlCDuRSKQaskLMfxDFCPpMNGEdD182X4oVldcPHZw8/4QA8iE3IMhRRpBYYdLT9zuWJpmuAPydmvPhycHDeu8Wtr439+I/R2McrV9MXlDjs/YLHbd3UCn98dHn8a+q8Q6wP3BZOINqo9PakViWXJ9qsvWPK37zxHxAwKXFBHgR/lujVTkFc1U5esbd49pJJI3I+mM04It2ArlY16ec57O7Smztv7CVQ+Hufnjmj5Xl/DaZWqYFJUw7Pi4XKdbWwA+pmwtnZ1ADNDNpqj6iziZYAcneIPx3R5BmuPIxSvyZpqIbEteAH1EY+Y7tDYzbf6wmSXVVdi7lpJS0s0Ey0MTar3nhXQt/jHTMXLCbB6lJBIhkhj74ci+Q36jfzYJZYQZvWKdGyyd566sNQORdW0SX7/Pj0sC01eXccBoqopln7IZFstUHxn9l/Ec6VcUYVhZTjrIzezrfPljQXPVkXJyS7xQgHaMhleIvgdNj8jEiHQ6tnIRAY/FG5KIbg6tyh5Qtf5FMXzL0+afNr//3nx1q58wGcIZr2GGJmjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(136003)(39850400004)(451199015)(41300700001)(5660300002)(83380400001)(316002)(44832011)(8936002)(6916009)(66556008)(6486002)(66476007)(8676002)(66946007)(2906002)(1076003)(38350700002)(38100700002)(52116002)(6666004)(6506007)(86362001)(186003)(6512007)(2616005)(26005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iY1xMhTCBNA8U1vGA1rJPVJMzi1cgQN796Tbr2u5wcKVcEP9Surxk2UkI/ff?=
 =?us-ascii?Q?XAoRnxFUug66cgiO4xnA8ooMy6wkR+UuxgEfP34L1iUOvZ7EyGVOR8AIXpYU?=
 =?us-ascii?Q?/+m7wog87RvRNACipWy5zuW2bSHHhOEkt7wJOhfc4titShHsupi5sL5rWbQx?=
 =?us-ascii?Q?qnKAjJMTvnxc7Z8OBOnKfzlETGWdS5ewMTieNKOl5NrNrhA9CDW2a5+q0MhJ?=
 =?us-ascii?Q?fdsif5gABBFyHn5aduitXkhXT9NypkJX00/JoNwqXgGTm5yaEp2+15hsTFhb?=
 =?us-ascii?Q?4D749rp1GM78MhrUpruH9l0qZ8stLOI8aOl0VRtOlQfjjC+FnZ1gX5MG+v6w?=
 =?us-ascii?Q?vcgTe5TtbEqYhtLKdA0Q0WkB9MKz0vAGxqiSyoLtpC6zlOczYcWUY8fkBekq?=
 =?us-ascii?Q?9gKXxoLU5Ligk3DxzUvbLCiRF3cLn6S2Lf7GL2gQtoWPsHrJeXVkK84XECy/?=
 =?us-ascii?Q?RNlI/ItKubUeVJtihdEKnmkR1ZrW8a21jikpuiQWVN6uTkA4uJ9+aWsSR1Gd?=
 =?us-ascii?Q?z0WdDSkEgfQkLoixu+OChggDNcubW7wTDMoLTyZIUpO0OigcwPEDkSoxQkms?=
 =?us-ascii?Q?eUVeDsEWsGgp/G0FO2kzOMMLpTdDcTpbOm8IO8C2pUmNquyIOiu+U4e7FRcG?=
 =?us-ascii?Q?dPMhzoNtcasi9urzmpjbOpRogu0uH83v2vdOkEVuu/CrLrtLWLafl+TFSb1k?=
 =?us-ascii?Q?wFGY/0hRzh3JhdpW7o/0asErh44r9/tK/LTyjCVgT0ErHCWzAy9/WM57ttUw?=
 =?us-ascii?Q?7gCks3NajTxmg87NzmIPWkzYkI6eaWjniS+V2OCwXKk/wVaXECs/Nv1/r/gG?=
 =?us-ascii?Q?MOMAMq/I4jSNRoZY0AAFPMErlInrwxsb+EC8LfwE+56EsgBd38NsHu0BT0uA?=
 =?us-ascii?Q?RR1t/oCDUKKMhAdLAHnZIXahAIfEbC6BgVMMRrEalOeLAxi8xmosnPwf/Qna?=
 =?us-ascii?Q?dhkFP1+TBYUC0o/4xUU3fJOJuLHet8aR1U6NpR09HoceA+EBrEOlDtdhhQI8?=
 =?us-ascii?Q?wYOkoEZb17sG769DvXKL6ilfr9JzlliMQjzmka61lKNJTzp/bFVM6O2CgQeQ?=
 =?us-ascii?Q?6cUMkS157NgvcPCQWaSDBE+xtRfRH9Isz5IXLRIC0TJZc1LBAdtdJ0WvUB4B?=
 =?us-ascii?Q?wacBgJFvzUq4ooLJuGv6HeNq8LdXfF9gsd0gccZrDBwYQD5seruQLSiMVUMv?=
 =?us-ascii?Q?simGAlrR86uBbbt3/jSGdY5uYUnHx4f/uR+4fOW6uokKAMXMz8Lj5D9BZW+P?=
 =?us-ascii?Q?iKZWyn0w8VJ3ewEX2qGhd4mHFTWnV2s9Gvp+hFr5iA+N2JRUDBn7yz8NQrQN?=
 =?us-ascii?Q?EzcbRx5NpMOhrSl+7EHlYuVBryv2ZxlvJZzsqbzFS6mgumZsRDRbi5RcaB4z?=
 =?us-ascii?Q?NCDXKOz3yKu3p0LprfxSUSTs2V7laLpvtMV0QOmGQ7OF48d+Bu6Gob86iiak?=
 =?us-ascii?Q?JTVNuCYtZU4PB0GD7F4hGvYbnulkbedvkZkb4xy6zJFM2wqGJGZWo2/zVPEa?=
 =?us-ascii?Q?qZhm2Cakb0zyqzJa+bC9ZNzoJvvhYHBM4mqBkJUmJTkQ6Tv5EbTr+zK95J9L?=
 =?us-ascii?Q?GiJsaBFxOp8jgUhOI/st1LGuvkOg/eIwGY4Lodnd/RKdsR2R2UdRuxqIv8xe?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8501ab8-719f-4755-ca05-08dabdd2182d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 19:32:07.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3igFCBEjC5nnjftkIwAxy0QYB2jo5aV/LtJDFU+6IY+O3uO9mJdJtcGtK+qU/+ehaZQaBre42rss7DNz7qhp0OllLGnBr8Kt6MuqUjL3HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
X-Proofpoint-GUID: CfURWpSjXiXVob4_f-JKTGc96mzLUphP
X-Proofpoint-ORIG-GUID: CfURWpSjXiXVob4_f-JKTGc96mzLUphP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=427
 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=1 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 19:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172652

python2 has been deprecated, use python3 instead

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...plot.py-ask-for-python3-specifically.patch | 35 +++++++++++++++++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
new file mode 100644
index 0000000000..42412678f7
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
@@ -0,0 +1,35 @@
+From c6776fb9c990830357e71a0e75805e7ce25877cc Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 3 Nov 2022 12:29:59 -0400
+Subject: [PATCH] bno_plot.py, btt_plot.py: ask for python3 specifically
+
+python2 has been deprecated, use python3 instead
+
+Upstream-Status: Inappropriate (OE-specific)
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ btt/bno_plot.py | 2 +-
+ btt/btt_plot.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index bba5e04504..c278e066c7 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,12 +9,15 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
+RDEPENDS:${PN} = "python3"
 
 SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
+           file://0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0


