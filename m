Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BF6C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:46:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.98330.1703666751718359848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fgS1RZc2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725ab29a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR7tuXn017314
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 00:45:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=iH0rYHHW0HzJWhRdch
	/H9CjWGTRiTTx3CeiR/sgrB4U=; b=fgS1RZc27yDyhBDDeN1b8AL6OAqIn6/NFZ
	D11zvXXoLMPj9BjUshajbonAhQMd/tSJ4+sD5HosTEN3Rqdmc1A3D1Hq7GyuA/q0
	w/69I7F+NmZKelCtjjqbpHmSwCNDVwbqyPYqewTLMQEc9hlnq7XVZ8/nScO8KtqV
	heU8AfyoytfDgrFuXYQUX3XyYFNj9cgBHbeG0+uBjQ4hQbUyKKgdEJ0ljdhKv8Kx
	1Wyolj4K8wg86e2c2E9fHh1xONm5ELkHojpMtXwA4yXzIl1+Lfr8b0Bj3uM5NkUY
	VSx9UGHGXhqGOfT2ROMS9gfeSSV+39H+Q9x0lhUWbPykfXZRROQw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm2r8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 00:45:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIQXQH12jX0CgGj/9dcvQr9HNoygXHnXRHUgQEfK690FOh5lnAJdHa3a1k6Ly62K385Ep8mMKRaT0yjm7wx0ANHwivjuQWD/z7l1w6SVNNzDrZNTGOT5KnsAR/mRvbNI7eR2FvKPj93tuwaKAiCMgSEertvvt9axJMzqQgmLE9TX4AsVFv7aPCcFBNj+Kk2Osrwm6wZ+AFluSxsAspX7e4YpLjleMr1lZPTF+86xjEvrvhyRGIffje1ZNGYHYlFZTTjlHvekh8eG6BnA0qc1wDn+vj9NPFcwyY6D6cl8kZFDfhV4ve3X9h4hmFVC51go0I8skDfBQEKSadL0LWJ1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH0rYHHW0HzJWhRdch/H9CjWGTRiTTx3CeiR/sgrB4U=;
 b=oMtVbd019fVZtCLbevzzeyW+Jj1w8vOpae1fXmfE8P6PNatWz1TPftr30ee/Bw/g5GIkY50iLMxwcGw9Dj4IyrhY4Bhz8C49a/LROWA6JyDNXdhTXaCVL1SN7Ndn3g+X+Kd/VumrOELbPnCAfRf+/TPsff7dydQgCgXBqgE8gtZLLgoFjt4T92uMuFY6NFbtspah8V6ezIGqYYFL50optTzMvmmY759oSzep+rGDD0YlEQhJ8XGVvkrmj43ssEmO+uoprPmwMzuUwgMjHvFuEteE0YeLp+YBpPYzYiPhgG9nxGwbCRcN6VYsiBfcLB06QeAr+bLiJT6vDCgnV1O+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL1PR11MB5462.namprd11.prod.outlook.com (2603:10b6:208:31e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Wed, 27 Dec
 2023 08:45:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 08:45:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] dbus: upgrade to 1.15.8
Date: Wed, 27 Dec 2023 16:45:30 +0800
Message-Id: <20231227084530.732291-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL1PR11MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4b6a41-0a4c-43c2-45d0-08dc06b838e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UduAIfit6AvjEJbV5SJLAElBmVIDXOQgHmusFKN78iz9EChO0+cl/wYbkaO83HWdLhBd3AGaW69mJTlMLngTo32SZsgKB61vKU1LyZ8ctnUo91kI7ETs7Et4/GMSQf6XMOSPm2KU0QAd0n01kLag2GKWcaibs8AHZ0qlRbeEzHAOziDnKIXSGmhy2gv4iUGHrZwvVj/ej+doPZGLMNP0w5Y9YRCjm31klHe/xYHma00+QmrWXXQd3L41IgeT1vGJRgkB9tFbDOtDeNU78T7UcAZ9awV3WNCOJUShzDL3PWS+9KB4AU7XAk2Hsmo6s50WoZLgNzpIdq2yH2UulP2TN9GUHfTdLqZS38zchuQcvmw1HlTiJ4FZ1UwqpQwbOQfMdbZoYhyIZSBaiteFE72zCgNrxrFckkXfuWv6ke3cLwza5q4SVxxngCyehzh5dhJF9jlpbAxCOQ+tP7Th//B0VpnMz97KDWaPaNoVdLxAs629DxNAuMMhuBbRELiAmUiFq4d9yf02/ieyYLaCQ8CIidrK4EhaWLT41w9A7SMEs3ZY9Pw6RaYcNvI5UC5s7iQQ+scDRvxJo7rBkSCteX59MoO4wvV32elfFsX7IHsdFuM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39850400004)(366004)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(66476007)(316002)(66946007)(66556008)(6666004)(52116002)(83380400001)(6506007)(9686003)(6512007)(2616005)(26005)(1076003)(8936002)(5660300002)(6486002)(8676002)(6916009)(478600001)(36756003)(2906002)(38350700005)(86362001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BqhnFSmfK6Lt0Maln76deu/ZYBNMN+2de5Hl23pi1BOhaAS/4s7laFTOJVg9?=
 =?us-ascii?Q?FNzmfkRr3E9aCvqqVmLZYSGjIPM2BzTkCu1iumAmx92RuJPHSCXciWIjmGQW?=
 =?us-ascii?Q?sIEAlqQB9GatxEpBvT4CAP8q/a9UCOgEghRGSe3WFhgdRd5hx9XeNWaSw3hs?=
 =?us-ascii?Q?bh5vgmdQA3Qo0fYnWQ23Mezs4vXFXuScwNrAnvbRhUBxP4IiWVy6N6yYKfjv?=
 =?us-ascii?Q?EnlUuTYdRe9UUwVvQd37QRcivEQgEpVH087Qo4b0vWTT8GNFspSdFzu9T+el?=
 =?us-ascii?Q?v/5lGuPX/8KdlrJg+8JBQVpW7PvM2DEb1WuE4akXWV9Lt41xJ30KOKPfLvXn?=
 =?us-ascii?Q?tnoMARwfhmn8qa1j1WBQuB3xHYQpAkLe5aIrhN9GECqu6hWLT9tGJyARx9a5?=
 =?us-ascii?Q?KWwtOzd+U+pNqqUzI7DP+p/ErCiQsaXjQ0jSp6ZRvRvKtc7pxPtU9qJzztgO?=
 =?us-ascii?Q?hiMVjO/fI3oZp3ItQ0BLuQL69iVoMYsGUkLYAqBOHzG8uoIKkKtdZwvXx7S4?=
 =?us-ascii?Q?3jHeSe4wl6ADuPOKQKtW3y2JIbTl5GUwKzSTUAUHpSqVU9LIj8qAQaS24n1G?=
 =?us-ascii?Q?ezI1pb3Bj0DPVHAEveg/ZWsCcrrw25bzzQh4YLnHZEnM+ZL52NIfFKby+Snn?=
 =?us-ascii?Q?KvJq/4c4gfDns3XnYKBJx7LOMQUHvjBf3Qv/9aTFp2QmDzha8Ru+njUPHq/X?=
 =?us-ascii?Q?XFg1aGrXuSWS0QDGgxxFvmlgO1TuvkNeFSCjkwCyYRHm0zkqJx+bVhfjSK51?=
 =?us-ascii?Q?4gJeZqHZZiOQkWeoabhGsYeO9q58TkQ2GSHQXQ/j6P1surhD+H3/uRSfulSu?=
 =?us-ascii?Q?Cnp8cHUbgfuT42vk2K4qfGVp4ZfivRCQgp7RY8WX9vS5sRP9b+xtR5QIPEPS?=
 =?us-ascii?Q?s6LqcMwzivE3N8vgWw+H4VjfsTtdpv4LgKoyHGKefGIoJDBYwXuibCRbI6E1?=
 =?us-ascii?Q?5jttmcg6n8owlL8J4IVo96E+9bVeCJI6xsdgdu8ffjWtQtvh3qxkWu0RYVPP?=
 =?us-ascii?Q?hPiOaS16fMWH6TC7DxWYDVbvyXQXfu7ZtbBDHkvNDk9EsYVz2iLHRqFBppQY?=
 =?us-ascii?Q?r3kVLQeKoSrfgnM2zLuwz/ejmATqAtunKKoP8H0lM4ls3p4HveGqwel5SZAM?=
 =?us-ascii?Q?kM6AEztLmqLrzS9bMJ/b47F3YYN6WdS/GNCmN8Rq9ab9aYYyBeKO6TXMIhQR?=
 =?us-ascii?Q?qTK36H3Zpl5ArrRC53lptgG2ZW/ckQQPHfC48EidgwjmOGfYR027LzKYmVUS?=
 =?us-ascii?Q?3J3PSTOe/MUOGHocodbaEAf2+Q4uL8rPHITcE4GMCtaXBhkKH7t06ik4IiPU?=
 =?us-ascii?Q?QI8uAbh83v/y6uJBXIgQRAPoBmeqm1CBGswX+uBg2kaufysoKSo14xuVE25w?=
 =?us-ascii?Q?BHxDsFEpHaBxCgBLvDyftJoanGB9y4YGyUVeH1N0z/f0IYhYRc7KmdmzdhB5?=
 =?us-ascii?Q?Gx7nk2k9tz9UOsI7a0N7Tkx0IeeiJmxXwp2EFHMjLX4uUWEv/iOs5D0T1q9E?=
 =?us-ascii?Q?sXPnhA6HGSG//IIEQyzdjntZG7uHtDks6Bc0GlpuwYGQzwAVhUs7SY1LWtOE?=
 =?us-ascii?Q?VxgkMQk5tvfRd+bsYful9Z0aIqdPxc5DdGWSqeNS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4b6a41-0a4c-43c2-45d0-08dc06b838e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 08:45:47.9854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cv874p2nP3lP/yf0fVNyo7TKoQQrrWXRu0oXzwgn7X2lPepnogC6uzFRgI6uQ5x5NA2LfpTnmNQWPdRhJCvRPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5462
X-Proofpoint-GUID: C9EYboVNDMbXDXCPciGcmkEkHJdSuQt5
X-Proofpoint-ORIG-GUID: C9EYboVNDMbXDXCPciGcmkEkHJdSuQt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192926

From: Chen Qi <Qi.Chen@windriver.com>

The license checksums are changed, but he license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../dbus/{dbus_1.14.10.bb => dbus_1.15.8.bb}           | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.10.bb => dbus_1.15.8.bb} (94%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.10.bb b/meta/recipes-core/dbus/dbus_1.15.8.bb
similarity index 94%
rename from meta/recipes-core/dbus/dbus_1.14.10.bb
rename to meta/recipes-core/dbus/dbus_1.15.8.bb
index 2a256beabf..4ff115186c 100644
--- a/meta/recipes-core/dbus/dbus_1.14.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.15.8.bb
@@ -6,8 +6,8 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb0ffc69a965797a3d6686baa153ef05 \
+                    file://dbus/dbus.h;beginline=6;endline=22;md5=df4251a6c6e15e6a9e3c77b2ac30065d \
                     "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "ba1f21d2bd9d339da2d4aa8780c09df32fea87998b73da24f49ab9df1e36a50f"
+SRC_URI[sha256sum] = "84fc597e6ec82f05dc18a7d12c17046f95bad7be99fc03c15bc254c4701ed204"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
@@ -160,8 +160,8 @@ do_install() {
 	# Remove empty testexec directory as we don't build tests
 	rm -rf ${D}${libdir}/dbus-1.0/test
 
-	# Remove /var/run as it is created on startup
-	rm -rf ${D}${localstatedir}/run
+	# Remove /var/run and /run as it is created on startup
+	rm -rf ${D}${localstatedir}/run rm -rf ${D}/run
 }
 
 do_install:class-native() {
-- 
2.34.1


