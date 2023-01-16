Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9801AC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 08:51:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.162261.1673859114199304663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 00:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Y2zJCdru;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03803bb0c9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G7mioo008430
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=16aDz/tGyXeBLIgLtx+pVR4Y0d+CVxVAMqt7sG6l91E=;
 b=Y2zJCdru2YAlHbqOBDCDGXeflWaJ9CtdS76aJ+fnMuFZm0cbb1wvoL6eXN8mPsLuFzqd
 4wwlb5pg4iNEOKRP62YzbExvgbwk3L184jOpx29A5aLCztwbt5aHh5yTq5vtGsG4KVKq
 naqTyaegvp+nSDEUHyYlrIy82mpMoe1GITa2CZrIP/3p4cv1wnU5VL5iYWEKhzZ8zm4b
 YVhxrr2I5lXuR5lyP+kqZC3COR6/dnHIaifBw7eV5n4zfC46hZdhDYKJqYSxOfNupYKU
 kixFRlaGfw2SuAHHXdVdrTYyalfrfwWc7uXslSB04rS5SsXMiwY0kf+Y06TS8xDWq0d4 CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc89s2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:51:53 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30G8pq9B007390
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:51:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc89s2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 08:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUwNSYC+kdz2G/+ArBCWFVbQvyWLZ2BR9gyszz2Y6+Yp9C0derM5MUiIUUImWOjXVTjlR8YUmzpcwEczWQ5V33P4VF5A0IeppurzZmrsuSRuwVvqH85IS5SfOhldRtPoTvVs/K5lrxpq2Fv8A2Otp5pM6bytDBxY5rYBbvoYaOJvSJQy+lEo2AwCTp0XVbNJFMonrz32/G8hox1c6qyJ6FJgBtndsBfexMNs/1nYTMc7Rj2IXWDk302nAoIG4wzXH4zt2WGAuElR1I+CvsMYnuyv4BuovUfBBqXxWoP6nDFMojRQTy4DTvzbXj8JFsyXEQG20hNltOevumN0rn5EgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16aDz/tGyXeBLIgLtx+pVR4Y0d+CVxVAMqt7sG6l91E=;
 b=BTSq6lNUTRZq5yAhtKINxiiSbdlqXCkKUIScwcv34sEbShZ4OAzeGOaczaDS9Faa4KoMs3c3++vxijskWWPRb8KVCFtQt3bgFsbkIz/aic8qiwxySuthYs6HbeRJb1VHu+FMQop/wDNn9880O0YqnZ003nesxSqX99k7WepRbSzhgz2QttEvL2uULHXUNe+kgRRT3OCe8FQNmoBug6kpp+/qoR8ducPrLObxXxckIDlQ9sYxQTSV3oN4hAhoj0ZZUIbtjxAj03knA99Ovn3iBRDvDgWq9KaAo8YL/yY7iy5cIAEv0gNZ4X6jaoxh0EuVl354yafcLFXkW+EClPb7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 16 Jan
 2023 08:51:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%9]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 08:51:49 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Martin Jansa <Martin.Jansa@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] nativesdk-rpm: export RPM_ETCCONFIGDIR and
 MAGIC in environment like RPM_CONFIGDIR
Thread-Topic: [OE-core] [PATCH 1/2] nativesdk-rpm: export RPM_ETCCONFIGDIR and
 MAGIC in environment like RPM_CONFIGDIR
Thread-Index: AQHZG6GstUV8zUFW+UCR1YOb4zASNq6gxVow
Date: Mon, 16 Jan 2023 08:51:49 +0000
Message-ID: 
 <CO6PR11MB5602268E32392A9AD7960A83EDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221229162132.1256730-1-Martin.Jansa@gmail.com>
In-Reply-To: <20221229162132.1256730-1-Martin.Jansa@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA0PR11MB4544:EE_
x-ms-office365-filtering-correlation-id: 707eddbf-3170-4b76-921b-08daf79ee827
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HgI6nJ8zsy8+mSJyRvPjD+7NQn4FOGeY8SfeqtQtvYKxVec7OjGx/QXquuSK4jTnrghOME3/bKCtq91F8o+us5N9yuc6eul5TP8oHRAwn05VFNsoTmHg00/sRsd4wT8mHqtw9+oaaOv+kD6PyBkAQc9C+8zAxhxoHN9fz+MjsdJ5TmNl+iwyBFTua8ZMribXCXI2/i9rb5TuLI+eEomCmMOPY4g5jUfF8CyifJ5ba330UlL5KwtWl5Qg22GuCC1XIS4OYvVxyT6u/0GWy0u6bQeCo70YnEOnzbPlkUVBXM2ASXK+kY+1sKHrsg+d0W0Ihi7RBZte2z+BvVS8SvA50qpUERyxOd8e+ReVYfmcpWj1Ljo4Nykvbs5OJMu2DvREyfJiU6j/tDRYiy/NEdj5L0n7HY9a0WvsTdPPc1urJ6sMPFak017n9Gd9CfHfFATUMax/M+4AFYcelq2jIFE6HksQbwQE3bR5MqFm+1GgjNZjdfet5csDn6afSNjMXriM+WK2cNulgaRkIObIf1/1aWXUhOWP8eZxTcWJT04k+nwFsx0D2NWTXOKLkxfBIQ3qJA5xxtWeBiP5OueaXO4XUjeFcBhgkek4/uvjDv/u9PuKg9B4woJ3uUbSZbCeh2w6acmEU+MYbpcTcxa6fgR+8moXNvKxwq+8tNkx9eGeSg906jZ2rkksZOW7hvEggW2dRol+0yl4IotqZfcNSWuGAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(451199015)(38100700002)(6506007)(122000001)(53546011)(2906002)(478600001)(5660300002)(8676002)(33656002)(86362001)(7696005)(186003)(26005)(316002)(9686003)(71200400001)(83380400001)(8936002)(38070700005)(52536014)(55016003)(76116006)(41300700001)(64756008)(66556008)(66946007)(110136005)(66446008)(66476007)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?53+btNcv0W8DXkrXAWCXB6GIRsGSiLYCKV9UBC5PP5j9zb6y0rPopl2Yb4/2?=
 =?us-ascii?Q?YLKbpzXOTT4GmDcap6w+WCKVeiCh27bgzZNR/E4sOI6C0ntT1pkyKF/JP+pw?=
 =?us-ascii?Q?qblZAB8l+aQB/ImiXG2OSeLtzbnSEiNeBjtmXvLBVyTMDd9rPLml7eIHKGRI?=
 =?us-ascii?Q?gTIVikoRiLTNO4ao3oHUx1p21QwQ7LuVepXk2qpTwvreJiEXRxw9OoulCV9y?=
 =?us-ascii?Q?6Tbki7OJyHoeCn+M2urEwLP/RaeGcfMP/iM7TPssyJuKAwm4fPfAWdKZEbUf?=
 =?us-ascii?Q?uumWY12bf6QCJppLawSDsntc3toJEUmymHwW5YVf3UE/eHLV15hzHkRAG75P?=
 =?us-ascii?Q?qek+//MRxbW/5oepxb7ZDnrP83iUi0lKaS0VLP8hvDhvhyU79Jlj/wIOYyXF?=
 =?us-ascii?Q?sbB0Ime0I+w85wzxiGPVk93k02BruhUuRLgATJ/lsV/8Mj8NXTyau9NM+xXy?=
 =?us-ascii?Q?/wuQzEQDWFWLNVUpzS6GboWRZRyah+IpIiYvdDaBEn7kEdQiF06I9KLoFtnj?=
 =?us-ascii?Q?fadiiKkKSqxJ+AsbV0Hn3cy7sVJHgIKSInTy4kMQme/0x6XfNJrQeb34jKnQ?=
 =?us-ascii?Q?u3BLz04agKkJQcbU3X5c3++ihgrUjcRfSmWS3QmT+hwxrVxhK2EqlH74i3Fn?=
 =?us-ascii?Q?srGzAHXOBY19fWAKkt9u6lKl5EiuG2EsC3PoBFSJUqGzLT8Q80Hu+8sOrHiR?=
 =?us-ascii?Q?se+HjORN+3ECKE6LdNR06wajatgiHHTUTxfjUAVgrWhKmGjNzbNQkduzgr4R?=
 =?us-ascii?Q?0Irs6hyMoZNHjYLdl6d5tsJ1hefTxQnhX/rtFnytL0oKAiXC0y/ccTkyqq3+?=
 =?us-ascii?Q?J4x1MyW+4c7WZN/qW9qfMJUCBfdO2UzQ1dFRxUHEsgYrInSKMrRv8wS4cRvj?=
 =?us-ascii?Q?z48V4GBrFphwMgFrbhlmK/XIFeJOzLbKptbpqu79Dwfi9LafvaNx7Bd7QSp2?=
 =?us-ascii?Q?jTUzQqCQvkDdeM0cTrXkMpB9vPL7QmeEeJ84OHdsLXNI5s90jx3jIaxFIoMq?=
 =?us-ascii?Q?3K80zX7ds2hgP5xpX/+G/hYcI1VT9DKKSJ0wdK7Zi7sEcPtlfJr491o40oIc?=
 =?us-ascii?Q?dGg6ZYkp4oAUhqnSblCsaHrBfXr3leKRpLQKvPOUs13jvYH2w4EGueBAvmip?=
 =?us-ascii?Q?hsL41ucoyfY1GUu6hklOibFAHqXFR1GS2vHVDueMNASG/MuJV9Itsdxm2ZIA?=
 =?us-ascii?Q?kw6sN3Q9F4NK0kshc41hleD+NGXWMt4TMNETWjEwuPvuNF35v7Um0YxF+sZF?=
 =?us-ascii?Q?G0zaCPHLWKLRABW3kEzr7M8tR1CIIVP82/j3YO5DmJJjIf0B6eYVywxlo2Qb?=
 =?us-ascii?Q?c+C+nYU7eiBbApgycJ+D7m2trtIRhq9El1IVnNuINNPZ7qzWMWWlK72nVUGm?=
 =?us-ascii?Q?fMrTLrmEjaLwyHBYJl8RRpFCuKsAMTHF4HoMznt3I2VHjayIeIWmBilvfjME?=
 =?us-ascii?Q?k041uAWtZYbuJQv0+vYdezN2qUg++G60xdAisx/WqfSy73xvOE2ArV++MDR9?=
 =?us-ascii?Q?qbhzsX/cp2B6yR3rlDsj4kgyBN750DmqwnmCEUVPeiAskhARvMA2t4U+sIoK?=
 =?us-ascii?Q?nBrbehubvmjZn9RYrXu3Zx+d4siFzmZtzr72aBvc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707eddbf-3170-4b76-921b-08daf79ee827
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 08:51:49.7991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibVCRQctCSTd6/IDvS/N7adfs7ECzS+545UWg7RRzfvUlMHwjmY+ueDl62d73sYcf2iDNvDfyw5uHRAdUWKIfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
X-Proofpoint-GUID: HvEto0jdaMWBoF-GppTIbYRVvGavpC4q
X-Proofpoint-ORIG-GUID: bv7GOLFhgrGG9lf6KfgY46kG0O_pj1a0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_06,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301160065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 08:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175964

Hi Martin,

This patch is causing a regression: running `file xxx' inside SDK errors ou=
t.
e.g.,
sdkinst [3][0] $ file environment-setup-core2-64-poky-linux
file: could not find any valid magic files!
sdkinst [3][0] $ which file
/usr/bin/file

I've sent out a patch to fix the issue: rpm: make nativesdk-rpm rdepend on =
nativesdk-file.
Not sure if there's a better solution. Could you please help review it?

Regards,
Qi


-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Martin Jansa
Sent: Friday, December 30, 2022 12:22 AM
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [OE-core] [PATCH 1/2] nativesdk-rpm: export RPM_ETCCONFIGDIR and M=
AGIC in environment like RPM_CONFIGDIR

* the paths in wrapper don't work for rpmdeps which is installed in
  ${libdir}/rpm unlike other wrapped bins from ${bindir} these relative
  paths don't work there

* replace environment.d-rpm.sh with here-doc so that we can use
  OE variables

* in the end it might be better to just get rid of the wrappers at
  this point and depend on environment.d to always set right values

* the wrappers were added in:
  commit 760103cdaed3e820888d8984ec0b76cfc831d534
  Author: Ovidiu Panait <ovidiu.panait@windriver.com>
  Date:   Fri May 25 10:48:29 2018 +0800

    nativesdk-rpm: Add wrappers for nativesdk support

    When installing the SDK to a non-default path, running "rpm --showrc" f=
rom the
    sdk will produce the following error:
    error: Unable to open /opt/windriver/wrlinux-small/10.17.41/sysroots/x8=
6_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or direct=
ory.
    Fix this by adding wrappers that dynamically export the RPM_CONFIGDIR,
    RPM_ETCCONFIGDIR and MAGIC environment variables, pointing to the prope=
r
    sdk locations.

* the rpm.sh in environment.d a bit later:
  commit 5f16fd0bf774314c79572daf4ba7e4a8ae209ba1
  Author: hongxu <hongxu.jia@windriver.com>
  Date:   Wed Jul 29 01:22:06 2020 -0700

    nativesdk-rpm: adjust RPM_CONFIGDIR paths dynamically

    While installing/extracting SDK to a non-default dir(not /opt),
    run rpm failed:
    $ python3 -c "import rpm"
    |error: Unable to open /opt/windriver/wrlinux-graphics/20.31/sysroots/
    x86_64-wrlinuxsdk-linux/usr/lib/rpm/rpmrc for reading: No such file or
    directory.

    This patch adds a flexible way to configure RPM_CONFIGDIR in SDK.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../rpm/files/environment.d-rpm.sh                 |  1 -
 meta/recipes-devtools/rpm/rpm_4.18.0.bb            | 14 +++++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)  delete mode 100644 meta/=
recipes-devtools/rpm/files/environment.d-rpm.sh

diff --git a/meta/recipes-devtools/rpm/files/environment.d-rpm.sh b/meta/re=
cipes-devtools/rpm/files/environment.d-rpm.sh
deleted file mode 100644
index 9b669a18d1..0000000000
--- a/meta/recipes-devtools/rpm/files/environment.d-rpm.sh
+++ /dev/null
@@ -1 +0,0 @@
-export RPM_CONFIGDIR=3D"$OECORE_NATIVE_SYSROOT/usr/lib/rpm"
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devtool=
s/rpm/rpm_4.18.0.bb
index 5f3986d8a3..152cab490d 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
@@ -25,7 +25,6 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b48a43=
f"
=20
 SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4.1=
8.x;protocol=3Dhttps \
-           file://environment.d-rpm.sh \
            file://0001-Do-not-add-an-unsatisfiable-dependency-when-buildin=
g.patch \
            file://0001-Do-not-read-config-files-from-HOME.patch \
            file://0001-When-cross-installing-execute-package-scriptlets-wi=
t.patch \ @@ -120,16 +119,21 @@ do_install:append:class-native() {
 do_install:append:class-nativesdk() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
-                        RPM_CONFIGDIR=3D'`dirname $''realpath`'/${@os.path=
.relpath(d.getVar('libdir'), d.getVar('bindir'))}/rpm \
+                        RPM_CONFIGDIR=3D'$'{RPM_CONFIGDIR-'`dirname=20
+ $''realpath`'/${@os.path.relpath(d.getVar('libdir'),=20
+ d.getVar('bindir'))}/rpm} \
                         RPM_ETCCONFIGDIR=3D'$'{RPM_ETCCONFIGDIR-'`dirname =
$''realpath`'/${@os.path.relpath(d.getVar('sysconfdir'), d.getVar('bindir')=
)}/..} \
-                        MAGIC=3D'`dirname $''realpath`'/${@os.path.relpath=
(d.getVar('datadir'), d.getVar('bindir'))}/misc/magic.mgc \
+                        MAGIC=3D''{MAGIC-'`dirname=20
+ $''realpath`'/${@os.path.relpath(d.getVar('datadir'),=20
+ d.getVar('bindir'))}/misc/magic.mgc} \
                         RPM_NO_CHROOT_FOR_SCRIPTS=3D1
         done
=20
         rm -rf ${D}/var
=20
-        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-        install -m 644 ${WORKDIR}/environment.d-rpm.sh ${D}${SDKPATHNATIVE=
}/environment-setup.d/rpm.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/rpm.sh
+		export RPM_CONFIGDIR=3D"$OECORE_NATIVE_SYSROOT${libdir}/rpm"
+		export RPM_ETCCONFIGDIR=3D"$OECORE_NATIVE_SYSROOT${sysconfdir}"
+		export MAGIC=3D"$OECORE_NATIVE_SYSROOT${datadir}/misc/magic.mgc"
+		export RPM_NO_CHROOT_FOR_SCRIPTS=3D1
+	EOF
 }
=20
 # Rpm's make install creates var/tmp which clashes with base-files packagi=
ng
--
2.39.0


