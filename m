Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9A0C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 15:42:58 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web10.41359.1711554169201703312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 08:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=NH92Cmlq;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=JROfiPM0;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220297.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42RBkFBe002436
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=UWSFpLU3IEhV
	Ct95eLRIoPFmCuM5eWcAk017KoVpg2I=; b=NH92CmlqgHOSNv5zDxNT33flWM2W
	YeYqyWP9IchIZzz1PmG0BMy+dgymeo5PByMZUOXaVRChS1L/JHwDAhbx5RF8al/U
	6d6RsViQcMeZu9P3eH0+T7Hdt1YEvZPOSrF36wTwBPy/EQQL9+cr3F1zoe7ktzFG
	DRmEgfmT0gPpmi8pE4NqFD6krdvidGia1hcn08somSxp45zz9ZUmK3Zan3QMffv2
	FLFnFhs8Ox3wz3sSHL3LeYJaU1myhlGzcxk79jWJSr/jUlkDFPKmU5uYToeEwpbk
	bdj87Z3Ddxq2SLI41rF+jBbjnb+uBaGt3SCjvFv4QTnzhbcZaUN8UFBdgw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3x4e3r17yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 10:42:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ssp+rosRqUfQp2Mp6UNb9xcI6Ikvzr1NAD/V6tToGtAuawzcneHQ5tK8Qpi0wvCzJtgE4co7QpI8rTQiYAt9kVm7453hFZTA3R/4uB8FIsuVVgqGtnt3rTGqEA7YnwqWXAE+ZMFlJKRlWCJ06bvIs6NUQjPy1uq50O6kFDGpEmkPpi9vhIg5ooNwUokFtImKnpWJGQhikMZ9lYAOk9HGCaCWvvfLlsDK2HUwMQfRJGZYXjdSWx7ltaWEpw4gIJBYsN6IXwQKU5nVo3tljGnHPy1HXEDtk2zbTm6/jnByyH838LjiPneGcGxg8l5Tk+NFKV189Rczdj4wMO3Qd3J2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWSFpLU3IEhVCt95eLRIoPFmCuM5eWcAk017KoVpg2I=;
 b=PYQVjlSe8CffNf2C8swyhISwvs9Fioulsf6xVkUXs2aWdzKfOy4rYEGNiAGPnv4PdrGHkbm7fhPNmRJFi9LzeL799GfxvATFAqvGP4tYqQR4BWOQBE6mpfwJKrQJogCJ6hCKEkVSPpEskQPn5ToiUtDcRIPj+jflWXZRr2SAJlsBN7kz20NAM8P5BNcaEcMRGpNlHkTXcVxL35pXKvVWHA5me5UQCo3rkUe10hUaINU8xgAVdtTnCs/8wXl8wP0OJM6JiUw5aQMoP6FF1YrIfF5ZQD2mQ4GIqT+/2k69rhcNkE7K6JJnwLK1kIgZpP7SekUeRrwxpol9bJUEG36+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWSFpLU3IEhVCt95eLRIoPFmCuM5eWcAk017KoVpg2I=;
 b=JROfiPM0ms0ucCsvdVsXKmE4y8Yv+Tu0cbBapm3Gjix/ACThh25aTjJFxAr+Ipha9lLmBvAFERiF6HKfMCpFJ8firVsbUze1L9l/8alcJDlXzU1i/AalGb0PXF09Ty388+15JiX+T9p9kREGHZU+7UHbjKlQHCNV/QikuDgrNEu3n8LIR7o+1NVT3HiZkOZIz4WMcVcTqKjGvy3w8Vj52dFgR7YWTX5Y4MiuQDWfxJcWNUgqSsMoIBSGHo+ufqHQfMD8cTcRySMx3F/BIkAhfs3Ak6TMouEw2LQcnzrvztTVEGB7p6pPunf7M4lEeHE/zLZywo0GQQEfksEkbAeaiQ==
Received: from DS7PR06CA0005.namprd06.prod.outlook.com (2603:10b6:8:2a::20) by
 MW6PR04MB8915.namprd04.prod.outlook.com (2603:10b6:303:244::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 15:42:46 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::26) by DS7PR06CA0005.outlook.office365.com
 (2603:10b6:8:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 15:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 15:42:45 +0000
Received: from cv1wpa-exmb3.ad.garmin.com (10.5.144.73) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Mar 2024 10:42:40 -0500
Received: from kc3wpa-exmb4.ad.garmin.com (10.65.32.84) by
 cv1wpa-exmb3.ad.garmin.com (10.5.144.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.37; Wed, 27 Mar 2024 10:42:45 -0500
Received: from kc3wpa-exmb4.ad.garmin.com (10.65.32.84) by
 kc3wpa-exmb4.ad.garmin.com (10.65.32.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.32; Wed, 27 Mar 2024 10:42:44 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.65.32.84) with Microsoft SMTP Server id 15.2.1258.32 via Frontend
 Transport; Wed, 27 Mar 2024 10:42:44 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [OE-core][kirkstone][PATCH] common-licenses: Backport missing license
Date: Wed, 27 Mar 2024 10:42:41 -0500
Message-ID: <20240327154241.812487-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MW6PR04MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bcb8ec-6c5e-4ab4-36be-08dc4e748c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hvx36tOsGeLvZL8BH1MDGM5WkQZhyUcNfG8mS341QkJLw22hIk+0oZHseU2WUVXPww/lVLa9JIkvT3QCDzfJEyZfZ4MF1O8amptrtooapl+gsCWKTEnxGRW+qcPQwKFGJiMQIP+0nn3469oEeDo6BrYIzJbmhC/4QZhRNT9OW8Osmn9iuOXbWsRe9Xbgtg9xKg4zi2wjJh+JUVKJxqzEUtA/+D8944w2VkWaXwiQrgiTCFCRSE0zWW7JZhQFOwvDVuVl0kY6lb19gLwJLvVipW83pkuDGvwDR/jJ+fE/wkYJvRAGHD2IVAwTsSnbjD/BZ3hgPhiulj0WqIRSjKYUX+gxhhIumpyaY18cUDoRz79VzCmRI0jc9PADXUH+rwDHLdkX/+OKSVTYOlyvPs8A0p5F9h7I/EtXpnp8Zp1eBKMlUefBQoHxa8znX6mJYTIX0pCVjwlTXTIIecOsxT22n/G1z1hLj7EMHxhRrTAmPleRZJdYsIVqW0wxxCdRp3x7pEiVntPDE68Ocx/i0QWvfGeXr+reZMuzsYDqzNbgWXR0X6qSTPLuezrmiJ4v2HKfkzwg5TNbZxav6BMKfdJRUzXo1/EUwNToriwICiC2746t+1MVOYMWKNQrM97BxbuooolT4R7ziHxFAYmaR2wI46ruWOQkYy5oby8cBHZAQdiYMSgvpAFKFye3S0DDgHW2hJMzJa6Hyioyac+DwLQ0IQ==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 15:42:45.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bcb8ec-6c5e-4ab4-36be-08dc4e748c73
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR04MB8915
X-Proofpoint-ORIG-GUID: H9KlKtL2qxCccfJiNFI_52pOj1QjNiUa
X-Proofpoint-GUID: H9KlKtL2qxCccfJiNFI_52pOj1QjNiUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_12,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197562

Backports missing license from master to kirkstone.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
---
 .../LGPL-3.0-with-zeromq-exception            | 181 ++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 meta/files/common-licenses/LGPL-3.0-with-zeromq-exception

diff --git a/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception b/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
new file mode 100644
index 0000000000..02e943c4ac
--- /dev/null
+++ b/meta/files/common-licenses/LGPL-3.0-with-zeromq-exception
@@ -0,0 +1,181 @@
+		         GNU LESSER GENERAL PUBLIC LICENSE
+                       Version 3, 29 June 2007
+
+ Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+ Everyone is permitted to copy and distribute verbatim copies
+ of this license document, but changing it is not allowed.
+
+
+  This version of the GNU Lesser General Public License incorporates
+the terms and conditions of version 3 of the GNU General Public
+License, supplemented by the additional permissions listed below.
+
+  0. Additional Definitions. 
+
+  As used herein, "this License" refers to version 3 of the GNU Lesser
+General Public License, and the "GNU GPL" refers to version 3 of the GNU
+General Public License.
+
+  "The Library" refers to a covered work governed by this License,
+other than an Application or a Combined Work as defined below.
+
+  An "Application" is any work that makes use of an interface provided
+by the Library, but which is not otherwise based on the Library.
+Defining a subclass of a class defined by the Library is deemed a mode
+of using an interface provided by the Library.
+
+  A "Combined Work" is a work produced by combining or linking an
+Application with the Library.  The particular version of the Library
+with which the Combined Work was made is also called the "Linked
+Version".
+
+  The "Minimal Corresponding Source" for a Combined Work means the
+Corresponding Source for the Combined Work, excluding any source code
+for portions of the Combined Work that, considered in isolation, are
+based on the Application, and not on the Linked Version.
+
+  The "Corresponding Application Code" for a Combined Work means the
+object code and/or source code for the Application, including any data
+and utility programs needed for reproducing the Combined Work from the
+Application, but excluding the System Libraries of the Combined Work.
+
+  1. Exception to Section 3 of the GNU GPL.
+
+  You may convey a covered work under sections 3 and 4 of this License
+without being bound by section 3 of the GNU GPL.
+
+  2. Conveying Modified Versions.
+
+  If you modify a copy of the Library, and, in your modifications, a
+facility refers to a function or data to be supplied by an Application
+that uses the facility (other than as an argument passed when the
+facility is invoked), then you may convey a copy of the modified
+version:
+
+   a) under this License, provided that you make a good faith effort to
+   ensure that, in the event an Application does not supply the
+   function or data, the facility still operates, and performs
+   whatever part of its purpose remains meaningful, or
+
+   b) under the GNU GPL, with none of the additional permissions of
+   this License applicable to that copy.
+
+  3. Object Code Incorporating Material from Library Header Files.
+
+  The object code form of an Application may incorporate material from
+a header file that is part of the Library.  You may convey such object
+code under terms of your choice, provided that, if the incorporated
+material is not limited to numerical parameters, data structure
+layouts and accessors, or small macros, inline functions and templates
+(ten or fewer lines in length), you do both of the following:
+
+   a) Give prominent notice with each copy of the object code that the
+   Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the object code with a copy of the GNU GPL and this license
+   document.
+
+  4. Combined Works.
+
+  You may convey a Combined Work under terms of your choice that,
+taken together, effectively do not restrict modification of the
+portions of the Library contained in the Combined Work and reverse
+engineering for debugging such modifications, if you also do each of
+the following:
+
+   a) Give prominent notice with each copy of the Combined Work that
+   the Library is used in it and that the Library and its use are
+   covered by this License.
+
+   b) Accompany the Combined Work with a copy of the GNU GPL and this license
+   document.
+
+   c) For a Combined Work that displays copyright notices during
+   execution, include the copyright notice for the Library among
+   these notices, as well as a reference directing the user to the
+   copies of the GNU GPL and this license document.
+
+   d) Do one of the following:
+
+       0) Convey the Minimal Corresponding Source under the terms of this
+       License, and the Corresponding Application Code in a form
+       suitable for, and under terms that permit, the user to
+       recombine or relink the Application with a modified version of
+       the Linked Version to produce a modified Combined Work, in the
+       manner specified by section 6 of the GNU GPL for conveying
+       Corresponding Source.
+
+       1) Use a suitable shared library mechanism for linking with the
+       Library.  A suitable mechanism is one that (a) uses at run time
+       a copy of the Library already present on the user's computer
+       system, and (b) will operate properly with a modified version
+       of the Library that is interface-compatible with the Linked
+       Version. 
+
+   e) Provide Installation Information, but only if you would otherwise
+   be required to provide such information under section 6 of the
+   GNU GPL, and only to the extent that such information is
+   necessary to install and execute a modified version of the
+   Combined Work produced by recombining or relinking the
+   Application with a modified version of the Linked Version. (If
+   you use option 4d0, the Installation Information must accompany
+   the Minimal Corresponding Source and Corresponding Application
+   Code. If you use option 4d1, you must provide the Installation
+   Information in the manner specified by section 6 of the GNU GPL
+   for conveying Corresponding Source.)
+
+  5. Combined Libraries.
+
+  You may place library facilities that are a work based on the
+Library side by side in a single library together with other library
+facilities that are not Applications and are not covered by this
+License, and convey such a combined library under terms of your
+choice, if you do both of the following:
+
+   a) Accompany the combined library with a copy of the same work based
+   on the Library, uncombined with any other library facilities,
+   conveyed under the terms of this License.
+
+   b) Give prominent notice with the combined library that part of it
+   is a work based on the Library, and explaining where to find the
+   accompanying uncombined form of the same work.
+
+  6. Revised Versions of the GNU Lesser General Public License.
+
+  The Free Software Foundation may publish revised and/or new versions
+of the GNU Lesser General Public License from time to time. Such new
+versions will be similar in spirit to the present version, but may
+differ in detail to address new problems or concerns.
+
+  Each version is given a distinguishing version number. If the
+Library as you received it specifies that a certain numbered version
+of the GNU Lesser General Public License "or any later version"
+applies to it, you have the option of following the terms and
+conditions either of that published version or of any later version
+published by the Free Software Foundation. If the Library as you
+received it does not specify a version number of the GNU Lesser
+General Public License, you may choose any version of the GNU Lesser
+General Public License ever published by the Free Software Foundation.
+
+  If the Library as you received it specifies that a proxy can decide
+whether future versions of the GNU Lesser General Public License shall
+apply, that proxy's public statement of acceptance of any version is
+permanent authorization for you to choose that version for the
+Library.
+
+--------------------------------------------------------------------------------
+
+           SPECIAL EXCEPTION GRANTED BY COPYRIGHT HOLDERS
+
+As a special exception, copyright holders give you permission to link this
+library with independent modules to produce an executable, regardless of
+the license terms of these independent modules, and to copy and distribute
+the resulting executable under terms of your choice, provided that you also
+meet, for each linked independent module, the terms and conditions of
+the license of that module. An independent module is a module which is not
+derived from or based on this library. If you modify this library, you must
+extend this exception to your version of the library.
+
+Note: this exception relieves you of any obligations under sections 4 and 5
+of this license, and section 6 of the GNU General Public License.
-- 
2.43.2


