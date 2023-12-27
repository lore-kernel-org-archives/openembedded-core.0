Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F8C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 09:38:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.98437.1703669896048392180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 01:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zq/barvx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0725ab29a4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BR9CGbO028284
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=nd1l2jvlEbmnGcgX5D
	eZogaNMseEe2WsuxmkFA8ME0c=; b=Zq/barvxBeEIrlktmGDKIJY/EO4GiPoMEc
	3u+VWavP7+7A2V1qWTZCgX4JCliFMLpnVWKxhCW15+wXPneGMzRLA5jtwC57PN2y
	o/FawPQzn4UL+W91xCMmUWwsoET9sAcRnYab1Z1UrI0gYsi2PQLIQ2pER96oesMu
	sVlgv0GNs04UF/ojQ2HkPSLhvX8QobgfHjkWcK6R9V5EyvtTI7o4juRc4xGtKYDj
	Mj4b1rGmZhxMyPQcFu3Nsxo2/oN/gMSubtCzWA2PPNfXVtBkwdid4+qGP8tTAWox
	ip8KyRc/FnhvONyUraPxzQxFxfmWarHviagaW3sLMYCYHZWgyegQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5mrxu4km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:38:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miS8bEg7SjeXQuy5Rj/kJi6a7BBWn7d80J2/mGMdLqqJjkyKAf5nOXlPWFPwahTPCPR4YRVwcHXmu7S82ExmeXJX3SW3hB3S0/qcVnJjiKMJcCXF7/oLXKf6qLbkdZmDkzGCt09lOmTcrkt9cNNqJoFQvv9IXNh/XpexlVadEy+qQIIs35PETZwxTwkcvy8Gk5CVV29TEFmx6Cm0aaDPhU24UGXqkXx0M3w1aD75RAIZaUm4s4mplUhygCHPJMqoLEXkXs7FDMQLLpvhyqqpeZXWFJVk4RUj+/CxXbNjbps+5nPKC7ySUjUDWBSLQz0whUWfU+RGtsTgFQfi1W/CLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd1l2jvlEbmnGcgX5DeZogaNMseEe2WsuxmkFA8ME0c=;
 b=JovmAztyhFWIE1X4y1rcWhdlOMy9W2WaLYBfc2NmScAjelV3b7DSP9AFHOEZQ1QhEQ2++kiIotJlqKkWtkF+bmcdRfDC3yxkRQVW1ZpYVkXcwPY7fHrO9ct7deVg/3RdAp6WqQ8gRqltsjMoeTowLQCxm/zPxSqB1j2ARvYaL9U6zkFQVFqYrH5SBO4SKrgQLbYniGehVJykwacJ6DO7UeYKRpVREAd+iwBS+gold5jeR6pBjRIJajokAizChnfNrIarPbk6VS5Uj70N3/H41ee0JTmer1KDtWFNTfPg9xb1ojIsyYRYd47LgiFIE2yqnspUXNg//kjsmM447qeQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 09:38:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.017; Wed, 27 Dec 2023
 09:38:10 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] dbus: upgrade to 1.15.8
Date: Wed, 27 Dec 2023 17:37:56 +0800
Message-Id: <20231227093756.734651-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da40be8-bd75-4e06-26ca-08dc06bf894c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hk1O5p7/U4XoQPDObqu0PwcDZ/k3AOIr+IyzBRiyTGrK9PNIIwYL6PR3sBb11A0dv1qgK5CeKJVcT+ufT+9YLCtYoqYtmq3/2N8jUXHm0r7WgqyJp+rSm447q3UZFwMDrLSp+6k2r17Vf92Pz8X9Cu6O4OGVcRt2ScpEh9PQpLKazy0o1MiPJRMfS9/x8LnIgtMuvMVk36lvsGXlXXl2dD7FjkLTM0miHJW+fsFRBU41QS9+VGhgSSyPzdo1gKw/jvzwp+VQiTeLn5w4qpylynBTt74+49DpqP42Eag1VAta7W0w09aSxE1i9N9RkjsVyuC5+AX2qVPej50/w6nm7I9i60MXL0Jn9PvoaxNBpdBdZfiSzfNYNX9kig+iXZO/45JPzPkDIOgs71Wgtg7hJ9tPaVh8g6zzKijiF+/bSOf9eB+hLkH3iTpl0RYAX+H9QlK3JahstF83k7IdY8umaLi/6wZy7xbfbfh241BVHknlmSZ/JyfS2xw7Wu0ea+PizeVXw8yiIE7hKMUAjQkrIPrufKhg/BTw0r6qVR7XJgTlmcpOsJTQRAk5+GYxoWiEoLo4D9HcwyYWJN42nPir2uCCUJ4YU7/j7xwsNT2IGv0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39840400004)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38350700005)(83380400001)(6916009)(66556008)(316002)(66476007)(66946007)(8676002)(8936002)(9686003)(6506007)(6512007)(6666004)(52116002)(1076003)(478600001)(2616005)(38100700002)(26005)(6486002)(41300700001)(5660300002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+WIta7i0EPCs6BJmkummYHThpqozpCBvGvESVzEf9Y9/IdiA/GXSLCs9tDIW?=
 =?us-ascii?Q?aLR0EkvWnFn9+2ArYqXUr8zr5rPfgQJdlov68qqzQsMf0TWor76SOWimqIG1?=
 =?us-ascii?Q?81OMlcW615SFPQ6dyyXhHfWiPiy76xNg6EqCG6QiXxmPgeHiTnS1me+mc/Wk?=
 =?us-ascii?Q?Q1++n60Ol3t1WEhEsTuPWh61PJ3IiBksmi+0cVcoC5eOZ7aRDiHk2FQRpZfq?=
 =?us-ascii?Q?UqoFxDG8+vJ6vVdNF0Qw0IqWkdKlXGin7vZGQscYEItPpOvZqZWg9AtdfQKI?=
 =?us-ascii?Q?KY/QJKxIQ2bvBvBStkMFrtTTgkTQrFuAX1WwjmbHmQoDP3oJlDsBki0LTme/?=
 =?us-ascii?Q?npMtqd5GnbxO3VTqlaVSX3WpmZBIAKZBRfFEelVQPNwPFpP5mWIamCpC3XyT?=
 =?us-ascii?Q?ZOzoRGH2P4Ho7ddy1BPLab/nwIS2Qgdf/5GhYEYMMpBhf15530es8BGvq2xQ?=
 =?us-ascii?Q?NbvQBpdARzcXwpbkjuq4Sl6A5/TmKSHTG07k06kwimdPFbVTgR/791lvKjX9?=
 =?us-ascii?Q?N3Y8+Vjc2NajC1/HQy4Kl1D82khkaPyDxZzL/1cQMXfehqyTA5xHW/zS7Kfv?=
 =?us-ascii?Q?7jzfVLtiMb6C++wov3ujdT6u0LBEE4EoN/+ihLNisO5e4KeQ3GS8zPXyYqFw?=
 =?us-ascii?Q?56VWsPMBDKqNCE0Z6dhCoNzbVbYcHj/V7fxsyYaw25+KEftnI2H7AHN4akvn?=
 =?us-ascii?Q?baxpAqztDESWHioBx/u8n0761GtaeijTk94JOA7FgMjsW0cxPlAQj9dVwO5K?=
 =?us-ascii?Q?ajtpJQujPICHHtHPGduh9wJWEsU2EuyvRlxKTV1w3n3CPXl9TwO9anOEjdsG?=
 =?us-ascii?Q?RHns80WHkumQGdzpeeIL374cTNm2yC7pINE3TraW+bq0lVmNJyAibAy0xQAg?=
 =?us-ascii?Q?MILfHVCC+8TohGCiqHFDLIWDOE5smC+I/+kg6ZSy8yfpLKJN7VTQ95CYBQYD?=
 =?us-ascii?Q?ocUhCDA9sxzmTFn3uast7OPx96s2YrKqjykjBQRP9TAJGwZaAAMogAPxFT/R?=
 =?us-ascii?Q?f1KCpbU9bo8nP2LJjb99h0TSaL8dMdII9TgCfbCbZzJB2RJfCGnWvYNEx0UP?=
 =?us-ascii?Q?iEY3NMOrIdCetXSUKHmU1UPEoJONnElyw7xc5P15U8tuwAJ35NjMCpkigbxx?=
 =?us-ascii?Q?5NCxq5PbSkJrdjNRSd1UsMp9KHJCwxSOwHWYe3sQy0ss1AMYQm9qCEnJT5Xr?=
 =?us-ascii?Q?UdBsaC+uZDCxxJt/zJexmFTq2i7VPQHsaJSxP9HYVdPXLkJO8Zr7wEnxFeTE?=
 =?us-ascii?Q?BEABt/Eo0rtLlZa5aAibWkgkh7vRutsmQ6WvK6GctPEpei12SUuWXlVHePC2?=
 =?us-ascii?Q?w55zapFmRw6r0vO/cyZU0P/kqCvWLhtPMBFqTWuIOl+rcA2RpwaPKxNGMS1C?=
 =?us-ascii?Q?tNjN7FJDmXzI8D3FeCC9dDLLZd4skUTHelJEWVepPF7YwEHqmeI8WI/6iyIW?=
 =?us-ascii?Q?MQkBMIls8JGWddSKLTQRgzRhYnR80Wg68ZyBZ4gHzV4i2s8tDlOvA+c38SOf?=
 =?us-ascii?Q?8sVqa0MKsitw1fTBRmP3fV/7rZK7hqUcpBVIKNyDiw556sSqWMwmS4oSpacF?=
 =?us-ascii?Q?MdotUf8r+pESJ/fGBP6NqdEBMC2cp5iMxKcaCcnz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da40be8-bd75-4e06-26ca-08dc06bf894c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 09:38:09.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rN/AFC7BrpERepfInefpaguqZPwxELu+osTR4F3/FRscTe0TUx+ucQHXcDH2uAw3zqwoB30L28+sja79vQDuvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
X-Proofpoint-ORIG-GUID: zWZId2_Ttz7Xnf4m3S-0czhgdteGpvyP
X-Proofpoint-GUID: zWZId2_Ttz7Xnf4m3S-0czhgdteGpvyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 09:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192933

From: Chen Qi <Qi.Chen@windriver.com>

License-Update:
===============
The license checksums are changed, but the license remains the same.
The contents change are only about description changes, e.g., not
copying the whole licenses and instead telling people to go check them.

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


