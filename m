Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B6FC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:36:29 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web09.34957.1653903386117464280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=owWaDIzh;
 spf=pass (domain: elektrobit.com, ip: 40.107.223.68,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gVJyq66KCUNuJ4bq1pQEpDSenZ5dBsBaK8S9SUAv8I4sKE4faJDRIYp72ZEuK0FAWIi8PiW/uD4D0a/7C6Ij8CSlVR3G9graIVG6pXWrKwgxmhhrPexoe+CgqIBs40Y+WH3ifcOlIgfcj3e9qCJIgXiWsFpQ4l9g+2YhYOv2vXKHg4bEOpddsy7LYdBZLAwAsZFfxz7FTIGT3olBDtamX+ED5+d3kGn14ZqmPW/FYvXbMDLzITdmkPOpK4zH+C6LZJa6C5xoCKbBJ6F5GQdkx+XqMLPHcN5/5sElqjQdbTk6H0VfZwI2z4pHtHlA/pP4vg6JQOtcouBLK55Ig6PvUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pYmV2mUbBwUdIdTFKl7wOuJk4Rxog+CwF3w/zC3tbs=;
 b=kKxL6xLvDUhyERew+ujI8Dwimc7S7oNuZRyjpbW1RvCzafhnTRLJLCZFU3SCMKFFyzzccV8ZFuh0cPlOdfWbtWYv+gkQNCnbLvfK1QtlfnPH+Ritf1PwrCY+DPHhbC0gy9D7iXmBfForNhKzHdFuS/HEYuU9PPLvCcxyH+L+/6BisMAzjlE2VmF7L3PB5Kyc7QVLfRnnZZCh6V0YobgTNrJlrQVuU55o7v3jECXIU2D8Up/E2p6tXnBgbAvRu5zFP/L6SiXLWAl+e+xF7zxiUkkforl8HzbH2za9P75AvkzQya0d9+nGR2PFjUvpSZcP2sa5xQpM2O3M9GRGUnD7Mw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pYmV2mUbBwUdIdTFKl7wOuJk4Rxog+CwF3w/zC3tbs=;
 b=owWaDIzh+sJzaVN9GJbb91V1SdhgR/UgRF0gKxEZ+ivE8DH5ZZwC02+o+ebzEuLeLVDeVwFo3jWM0Iufmyzaxo2dLAkb7UvwgXJ6OPnV34ztICrTeZQsoASRCdg3jI3WdCoUZwfXSe4JcmQRzUyy+NJEWHddBNxKusrEF79UfCg=
Received: from DM5PR17CA0051.namprd17.prod.outlook.com (2603:10b6:3:13f::13)
 by PH0PR08MB7018.namprd08.prod.outlook.com (2603:10b6:510:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 09:36:24 +0000
Received: from DM6NAM12FT033.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::53) by DM5PR17CA0051.outlook.office365.com
 (2603:10b6:3:13f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Mon, 30 May 2022 09:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 DM6NAM12FT033.mail.protection.outlook.com (10.13.179.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.6 via Frontend Transport; Mon, 30 May 2022 09:36:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhIktFu8gDJ0b2oeb2+VcsPd7aBFIgYx4MtpcZ8m1XiRgjaEXS1OuLsAi/pkeNwk3oRJZAEEEb0AVspx8D9uZFVolpsUzVuHO+fHLGq01rt6cPOxckXs5bLSn09gsfLp1PDR/K+WAp4Next+P0DxVu5QQBFiXF/8NqmChJpD2w6KaEeOPuJ9l5Q4gX3yysCbAG+IX/bFSz0IA66wXUhHfIxFVEWiYStURrI/qlEzoMLyLnL4z5GJFmKnvUIw7DOsFYsInOXoI9ehTaTWeI9d7/7Y0j0P+e52HCTLyOyi4qtbyMmVvb/EeS4cbh3GvIY+AsJ4UXS1KlJMJjyJhwAllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pYmV2mUbBwUdIdTFKl7wOuJk4Rxog+CwF3w/zC3tbs=;
 b=gdI4Y9pMzqdB818Xu6q9QCGZc9byiVgzEyE3XOJEFo5C5iEngUT2nZ4Dc2dpdy+XS1ZQtLSUX0JCicW+GZeGetbp7Pp2KGt4AQXiQp3M6q35eWOvD1T+UPTTC0ObRJHlNhjfb2WDHRz7+TckmyFDf6KMd9J6H7lmx6fmZltRwalKE5T2vf5qKhee6D8wSrUZr0dcWSaxrmbLZl/LXLs7m4eyuaf25briOxbrz6HWJg17G0VGzsYyyhtJrULuEG7czJ1RRj9kUuGneHTAGiMbN58jF+OLbSrSVQ1LHmJBaiTtz27GVleojsr66UfonWbHFPun9HawapoSj81vN3NNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=temperror action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pYmV2mUbBwUdIdTFKl7wOuJk4Rxog+CwF3w/zC3tbs=;
 b=owWaDIzh+sJzaVN9GJbb91V1SdhgR/UgRF0gKxEZ+ivE8DH5ZZwC02+o+ebzEuLeLVDeVwFo3jWM0Iufmyzaxo2dLAkb7UvwgXJ6OPnV34ztICrTeZQsoASRCdg3jI3WdCoUZwfXSe4JcmQRzUyy+NJEWHddBNxKusrEF79UfCg=
Received: from BN6PR1701CA0010.namprd17.prod.outlook.com
 (2603:10b6:405:15::20) by DM6PR08MB6218.namprd08.prod.outlook.com
 (2603:10b6:5:1ed::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 09:36:19 +0000
Received: from BN8NAM12FT005.eop-nam12.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::4) by BN6PR1701CA0010.outlook.office365.com
 (2603:10b6:405:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19 via Frontend
 Transport; Mon, 30 May 2022 09:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=elektrobit.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of elektrobit.com: DNS Timeout)
Received: from denue6es011.ebgroup.elektrobit.com (213.95.148.172) by
 BN8NAM12FT005.mail.protection.outlook.com (10.13.182.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.6 via Frontend Transport; Mon, 30 May 2022 09:36:18 +0000
Received: from denue6es011.ebgroup.elektrobit.com (10.243.160.101) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 30 May 2022 11:36:13 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.74) by
 denue6es011.ebgroup.elektrobit.com (10.243.160.101) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Mon, 30 May 2022 11:36:13
 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, Kai Tomerius
	<kai.tomerius@elektrobit.com>
Subject: [PATCH] json-c: Add ptest for json-c
Date: Mon, 30 May 2022 11:36:09 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: 
 <36681a90-b7d3-4332-8860-b24dd9b7a35d@denue6es011.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: a5f3a5a3-1311-43c7-4fa6-08da421fdc71
X-MS-TrafficTypeDiagnostic: 
	DM6PR08MB6218:EE_|DM6NAM12FT033:EE_|PH0PR08MB7018:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR08MB70180B22529DD68A598577FAE2DD9@PH0PR08MB7018.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RJdqM4LNX9hwdkxbcam0zsrxRvA8Js5p9WFVfvQPM8hkeyQ00At19KmLB1pJfZ9qb1FtJjYgM/XBdGR82dRjLperTCk6Pk7rlJv7x+QkynrvyN49XCcdetadJTNP/GuJXpyM+S1baatJ1O/9gh4kcuHRXo3CmEklVr1RvRImuZ9iHSfhmc4SjlHxHZs/atDoHwqoF8yPL73T6yf9sTkzNq7cNjwx5xMumqESPh/rwzLkiyL6kAl5A7CAY0qdBXVtaIriRLEm4jbUl7YlN98IaUDzoybPPwatySV2p/MLZD2640BWU642MY9fYjI92dUCq1yOAf3+zltjxBAHtSiCoETXSvnvmfGeNOdEKD6Tl+66DiAwuhvlv3irMrH262ILJ6MC0vkEfZusEXxqC4HhM58BP+A2jMUGpqv+tQfHSbOp35vA6lxUknD6sJ9D8zmzg1DvkUgC6QUsQgzHYu6bEc2MUmWr1wsH1nWBigulstyd1Ob+G8MlqaEhWAbku4+f20+LyANfFkHUkTZaUsKNPn9TGIJwkuGQ+gr9550vUFY8nhMmVajxrGNqMxXMi1VvBfex5koeDtAUY+9Ass/t29mxyGAxYiwj3PGnUFrMx55NB2wrucd6dtpY2RRmqgXBn4akN+IXRdtQEVYtWig4vertJwvWJEp9yvgbKxQRqWdNOGofn7ziTeCmSMnK/FB6HhMMwoiJrP93R/QjLnMXrKksiFqetc5QGlQxJYWhGI6TQa6XFjbW0I0NbnTK8PHU
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es011.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(83380400001)(63370400001)(508600001)(6916009)(54906003)(316002)(966005)(63350400001)(40460700003)(426003)(336012)(31686004)(70586007)(70206006)(4326008)(31696002)(8676002)(47076005)(8936002)(86362001)(186003)(107886003)(44832011)(82310400005)(36860700001)(6666004)(81166007)(356005)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6218
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DM6NAM12FT033.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a1d2022a-2dee-4baf-6617-08da421fd97b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/lMK0arKGiQbs+Gkk0fmRju8QgbQ01whG39X53ch4TWlmiqj1tPvKFGwuvd+6uSjpbY4TwIWP6bF0IlI7H1ES2piMauTdXIAUgjANqhMfQK0vD1eegPpEKJNZp1s6qpZroawPO7YFKZ/Ii8d6bV6uF3sMjRlkiEe18+aexKiGIGyIjIq/vRzPqUwf6a/uAE7wNTF612E6+khuzMTB61gkslvrurBAzA6YrheYdZeNXGx7MRB3+GTE/fxkDFXMI+28cz+C1+IE0w0fkY1s6n7YGbnafrSlu6Oqq72ZE0ADBZvOOK3FIr6xapYqK1jDBRohub2MG3DYlAtQSr8iytDFTXae7lWNvdx+CHfN/16q35eOVMedL4D6nE0xXElkxclZlZXyDD74LCn4XP0r+jVbE+8xhr3lqSmkLlTe0k+XcN1GWHCvWlBOtRnm09raY250GS/qlvt1Hf9CeizMHOE/2qEHdyyOmZULPmbUnZnI3QpgvGTJN7QjnAdKGH42xZPXtHC2OIn0fhWHmVHjS42q6rTbmCyfv4zRFvrCRqWRX7wWnfA0ctKQVReEjSZHuRrD5IY1m+fp++7AeBYkSTyecJJJ4MM1sdJS1DwXcmqah7wrnhcHUl+W9jk6jlI/KvYKI6OV/mx6qkKtCrYlwvsxUXZ349uCjSNj0Uf7Qj9wPRVEz5S1RXu9IWd4px+mvP4DbKA2/mHAjwwophw+NSCdo4uhldPk6cg+LFqcWEv7Fd4NbbyLmPHJV/RwL9r+NmjlaNWMOaQqXLSIMu0SdiGapuQMYdrJ1r7axq4xfipDPs=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8936002)(26005)(8676002)(86362001)(83380400001)(31696002)(4326008)(6666004)(70586007)(107886003)(70206006)(336012)(426003)(47076005)(186003)(44832011)(2906002)(508600001)(81166007)(5660300002)(40460700003)(31686004)(54906003)(316002)(966005)(6916009)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:36:23.2742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5f3a5a3-1311-43c7-4fa6-08da421fdc71
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM12FT033.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166275

Also add a script for executing the ptests. All tests were sucessful on a t=
rial
run.

Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-devtools/json-c/json-c_0.16.bb     | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index a1ead90649..0bfcb60c76 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -22,6 +22,7 @@ PTESTS_FAST =3D "\
     gettext-ptest \
     glib-networking-ptest \
     gzip-ptest \
+    json-c-ptest \
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-dev=
tools/json-c/json-c_0.16.bb
index fdec5ec9af..3fa5ce2c49 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f=
2"
=20
-SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.g=
z"
+SRC_URI =3D " \
+    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://run-ptest \
+"
=20
 SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030=
c5ba8a0288d96b"
=20
@@ -13,6 +16,14 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\=
d+"
=20
 RPROVIDES:${PN} =3D "libjson"
=20
-inherit cmake
+inherit cmake ptest
+
+do_install_ptest() {
+    cp -r ${B}/tests ${D}/${PTEST_PATH}
+    cp -r ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1


