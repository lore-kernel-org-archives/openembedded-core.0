Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D5FC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 06:21:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2778.1668406908731191574
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 22:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8317b30afd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AE61EZP005950
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:21:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt0q2s85k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoJjz19G+k8KBppjPVKp2i8iT1slkxQUqVVXdreWLz3eMNsWtURnGC9uL0a8Nbms6Nu5g98Zje42974fRa+iwUKpCNWY2Lf+6erY7uOwgM0N9ntMks0lcDoK0dfP+D7DJIsSRiOgOlFciW6gyBFtgXJ6vGdsLiKIz+kpGPKiey6qXJLCrEwLCSzPuJq8oKDzDXI57Zv3BR1S0Oxn3oGY41nCQZ7n3bDfFCEHqogMjw99Q0impHgZ4odzywXo4asO7Nle4769WoNsRosIxAZd84h01PFz+vIN0MnfKNoS5+ZQOiF6Zu+zWjVEAbN7BXSOAuvuyCx0sgk0Q0mdq1qkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz1QqnsaepsnpqLq4h5cfPuJBE/GgH4MNLudaEx5VgQ=;
 b=MyqQ8C4sXOV7eNkIhnl8EEppwADEhKlzVnfnumMj/+MyZiD7mPg6Zb0WwEX+kXShhjonS/XbJYUlY8ebs7YhPx+i7yNJy1soccvQ8/MAqtoXIQE4XEiftnq/62Z+UBwmzRhY18zMdER9vdKg+1mXYPHiQ7DLDlATuble6o2mBVXtaByHzRBqUw5NRsdHDsCQT9RUH7AfCn83h8bAnsFHQPRP288Kr9wNtfuHoJmDusLx87nqWbiKYSC4vtwJFDQCKWy8lc9/kk7HyJIa/h3WmDf5CDIKG9gZ7fSDhwmLO/He2w1ZyiH8o6cmJwvJPj+BjdYv7deRQ2moH3AoeqrlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN0PR11MB5710.namprd11.prod.outlook.com (2603:10b6:408:14a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 06:21:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 06:21:44 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] dbus: fix CVE-2022-42011 dbus-daemon can be crashed by messages with array length inconsistent with element type
Date: Mon, 14 Nov 2022 14:21:23 +0800
Message-Id: <20221114062123.93041-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN0PR11MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: c0fd803f-9d82-4864-0ca0-08dac6088042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HX3KvvaVloPoFuQwXv9U2i7C2gfg25pUkpX2OngHXhvAE0uvI6lXsHRDwd0/VNDJXkGS3F+LWewvExR4vosfkgkXkE2jhnGHjhRb+0tscx5NDWs42sV0CnNDQJ/LGRdQZ/l18Hz/7YTSnkOdf7iKE73kDaEGNrSJY+GStnrGQVufnuiMzkouVbiWh/xVk20p2ll+5+dV2zqkthNVfzcfTug2JBTBo/upFgPqQO8486Qc4+rUWONsi62rcdLhELx4ge3NI44ajtrhQGG0Cq132+ua869EJ25xnTPK9+JwZbmbrKyiAnQRtTPdQvCtyIQshm4lp2tTEGwXAjMumh5sojSnwvc1BqFePYUrb0xhI4LVzlYglKBjDteu+OhITjFIqOtO91p8HIaZtTPbVuou0qe55iuxMmAqOK5kk4CcLLITIi+vPrfpEbMaO2DZM3tkluMSzc0oR5Q9XNw4lHwJlWjPPheiGUTqX5r61r8VTf8RIFqDaFdnWzshJxkRNnr27fuoQ5v1d46JZJd+KB2051IqpFuDrXNQUU9CFd1sPEmtJIE88IDwYx4cYUpJBOhgKik/276YeXEZrgMvuxjRPbKebsXP2Tx6kVTu80ziF6FKcxp3cmYhDDQSnPNHohDe8IHxb2Jv+7hfOkS6btHUpa37+NdF5L29tAzBuMg+48DVHZkYP0OtC7vE4fKC5Qkp5gzD0Lfyx5tAMVB+dDrElQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(451199015)(966005)(6486002)(6666004)(52116002)(6916009)(478600001)(6506007)(316002)(26005)(6512007)(44832011)(66946007)(8936002)(66556008)(66476007)(8676002)(2616005)(41300700001)(186003)(5660300002)(1076003)(83380400001)(15650500001)(2906002)(83170400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+fSvuoVyWbd3l9yXhQWyL60e+xeuhsOUxRdPmJKm1PBY83msH1+6vMeeGsds?=
 =?us-ascii?Q?jMsftqOR/8KlKOy/FivzVTobmgAIySHxrxk3+o9dJcOapQkBr36Uq+5HxgUe?=
 =?us-ascii?Q?oiXxwhmgI3CxW/B8Kz6ymT0EHfVgiRNWBMN8ZPerjvrxDdI9RUJJjmPMw+yW?=
 =?us-ascii?Q?CdYRmCvErupSxXDYbjx8pnyDX/Zx40NKAwyqDoXPM4+p2XKzjYLPNvm42PUD?=
 =?us-ascii?Q?W0fjTrcvKCQqA/BrF9doP9Av740JuwauH21ZfsdaIewmpWnEqpLVBVXNQHh9?=
 =?us-ascii?Q?cdKQTWgdCPpkjkUkkZr2sxpd0CU4YspIz55uPtRoUT4rfxQpjzdkPBLdEWGd?=
 =?us-ascii?Q?sMbXx9Fxg1PMuytcmvZ8L432eQyGQYFNsfzmVSE/ZgFdtXQgxGcIFJ3zyXRB?=
 =?us-ascii?Q?zQrwcmMPEDiRVX+zpR6jc8NmhdGXVuIvH9BMkffH099Y3s1zUf7kaMBizFlS?=
 =?us-ascii?Q?P8JRhPH0osCtN9lOXbGfp3BqDE1SEtbSk8vfz2+BVaTgFCiYi6g7chAVKTki?=
 =?us-ascii?Q?+Qft92FuoTtXgc2ys7SfeNW1GpgckDQ4Oo6ICwZz3iZZt4GkfqoBni62qMzu?=
 =?us-ascii?Q?YdCS//n2FJAoWbpcBAObC7EwrvBl4wy+iNxl7TwGQr0sTAtxJyxgx5lxV9DP?=
 =?us-ascii?Q?QnZO6buwYHoaxCBnkM1xCP5OD5ll76VWlSu33IvR+D4KCPjlipKGXaQBjBSt?=
 =?us-ascii?Q?u2ptwa8h+yZu1LvogpdsA38F/vcdnPyQ5HJGJj26vMUdt/0cV6d4Wqp9mZsB?=
 =?us-ascii?Q?K0ZlNRDXsZfQkBGLhloPvbAEYhSWQbY9wMUj1QLpSrjdg8bd0kVZSMK/4OFz?=
 =?us-ascii?Q?AhMN8B7RbbdSEsoIS92NrZf0zJu6vVYYjY56z0M59cCesduV/QxwxBXiaKPO?=
 =?us-ascii?Q?Dp+PTZH/UUjFItwcsc0YAXFHaRvssFTf7MOcHSSJwQDGIZJCSWsTGwuZJEIL?=
 =?us-ascii?Q?BgtBH+q9TgG0CIcWGqi0HNWjejo3DWukoNWHzp2Aal6SOS9+PDh1XOFPslo+?=
 =?us-ascii?Q?FV6S3KJWsrW55I7XxQAtzXdhNQw4bXrZITTOJ7+qzZCL0bjt0Bcb7eEgKVYl?=
 =?us-ascii?Q?sCn/aSK1rJQKDpVMHFq9MH0P0WerLmym6yBm10tA8cQ/Wf29A+F5KuozVNOW?=
 =?us-ascii?Q?aLLrCQ0fz4iERom3djWIs/ZPlYI5tIDO2GmWwLliZAU41J3WiBUBWuNLuvQ/?=
 =?us-ascii?Q?/tHJmOuKnoA4OXeMEj0c/3f158SLa+YBCx+5Vi1GxBOQzroVzMgy9TSE6cG8?=
 =?us-ascii?Q?Qdg1cpMPDOMORmJIZu7zV8WNDRsB8GrmWbwZXu6qGd0oCt5sph3uWqDGR86y?=
 =?us-ascii?Q?FwpsiAgyKXeL/BSp7uHY/sskKvNVElbC9HEk2FHYiLNxP/+WpKP0dkNCtpTE?=
 =?us-ascii?Q?Tb/zGDpO6ky0D+uvItyOROjQIXsCx1kU/U6SOKgv9h6GAtCT4COkYSeUDxIJ?=
 =?us-ascii?Q?tYSgf5Fj7ZkguynPT6zAgQeEVL6HuhSCb8n7iRUil5Wx29hRf29KHZFCVeae?=
 =?us-ascii?Q?DDB5sQuPdWtNNT9b9LqKMuwegn3MCxTfX/cwcs9+BnVDSRy2PeaXWreOCz5a?=
 =?us-ascii?Q?Ljs2mMBhzPVM/whxD1Vb/mvJv1eoYxA6TLJNupgW4liW22wWkjZgzAXQBr3G?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0fd803f-9d82-4864-0ca0-08dac6088042
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 06:21:44.2228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXn509bZK49p9NaKKaHG1Bkh1VaF1brkugOqp7LBsKFcsavHocJMn/IEdm0+WXEyiOCAcPdjvaWgoFbEeXlUSiNk0cRNaJtWoFJ+TSbusuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5710
X-Proofpoint-GUID: PRTQSnKnZMZPz0jF7qswI4JMyUD2ugJT
X-Proofpoint-ORIG-GUID: PRTQSnKnZMZPz0jF7qswI4JMyUD2ugJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_05,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211140046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173226

Backport a patch from upstream[1] to fix CVE-2022-42011 dbus-daemon can be crashed by messages with array length inconsistent with element type
[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...idate-Validate-length-of-arrays-of-f.patch | 61 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.14.0.bb         |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch

diff --git a/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
new file mode 100644
index 0000000000..f953326f78
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch
@@ -0,0 +1,61 @@
+From b9e6a7523085a2cfceaffca7ba1ab4251f12a984 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Mon, 12 Sep 2022 13:14:18 +0100
+Subject: [PATCH] dbus-marshal-validate: Validate length of arrays of
+ fixed-length items
+
+This fast-path previously did not check that the array was made up
+of an integer number of items. This could lead to assertion failures
+and out-of-bounds accesses during subsequent message processing (which
+assumes that the message has already been validated), particularly after
+the addition of _dbus_header_remove_unknown_fields(), which makes it
+more likely that dbus-daemon will apply non-trivial edits to messages.
+
+Thanks: Evgeny Vereshchagin
+Fixes: e61f13cf "Bug 18064 - more efficient validation for fixed-size type arrays"
+Resolves: https://gitlab.freedesktop.org/dbus/dbus/-/issues/413
+Resolves: CVE-2022-42011
+
+Upstream-Status: Backport from
+[https://gitlab.freedesktop.org/dbus/dbus/-/commit/b9e6a7523085a2cfceaffca7ba1ab4251f12a984]
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+(cherry picked from commit 079bbf16186e87fb0157adf8951f19864bc2ed69)
+Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
+---
+ dbus/dbus-marshal-validate.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/dbus/dbus-marshal-validate.c b/dbus/dbus-marshal-validate.c
+index ae68414d..7d0d6cf7 100644
+--- a/dbus/dbus-marshal-validate.c
++++ b/dbus/dbus-marshal-validate.c
+@@ -503,13 +503,24 @@ validate_body_helper (DBusTypeReader       *reader,
+                  */ 
+                 if (dbus_type_is_fixed (array_elem_type))
+                   {
++                    /* Note that fixed-size types all have sizes equal to
++                     * their alignments, so this is really the item size. */
++                    alignment = _dbus_type_get_alignment (array_elem_type);
++                    _dbus_assert (alignment == 1 || alignment == 2 ||
++                                  alignment == 4 || alignment == 8);
++
++                    /* Because the alignment is a power of 2, this is
++                     * equivalent to: (claimed_len % alignment) != 0,
++                     * but avoids slower integer division */
++                    if ((claimed_len & (alignment - 1)) != 0)
++                      return DBUS_INVALID_ARRAY_LENGTH_INCORRECT;
++
+                     /* bools need to be handled differently, because they can
+                      * have an invalid value
+                      */
+                     if (array_elem_type == DBUS_TYPE_BOOLEAN)
+                       {
+                         dbus_uint32_t v;
+-                        alignment = _dbus_type_get_alignment (array_elem_type);
+ 
+                         while (p < array_end)
+                           {
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 4577da782c..e1efa9e058 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://0001-dbus-marshal-validate-Check-brackets-in-signature-ne.patch \
+           file://0001-dbus-marshal-validate-Validate-length-of-arrays-of-f.patch \
 "
 
 SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
-- 
2.34.1


