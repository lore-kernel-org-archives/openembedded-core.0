Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59083.1622560181082325875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 08:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=JuUY7UqO;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17867c9906=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151EwdEB007267
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jun 2021 15:09:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 38wptu00x8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 15:09:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVSV2mcqy+hUqFTwYVjW028/oAJSh1po16Nzqd4vzqI9OnjBZ7i0WRmG3trSLYabF/g9ZgTJFq1G+HuqMidbxSARyymPrwjNCmOEyp+qXpygFWfquhkEAMyvmj0TjHHKkKTpjAmjxSazhfE05wzy2SyvqxFCv94DkIIwnB4ZuPXIIen5xIISYNDrnUM8DBav274I0GXilTeD5xlVP8XynTXgUxfvOJL74fyQ2noujkOnvvUEfiqOTfEWovWIBudGVXcTgGucACojckU6YOc0xcdDyd31cyXArRx6eHU+C+wUobdserjNdB0bYOeoeBV79+nXrCUGN9PsUkXredOq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMtYD2jP2fzkUcLJh06gJtfeoWE9zY0quAon4QaQdGE=;
 b=GiABxcKUgY6Kpyfd24kpODY3OI7bxJbkknVkwfRAywflqSVpQnSaoHRBLUPO4NZrIQgINglte5qrfxypirtJ71a+5SNkHOi8wZ1Fz83XeqdELNcaWcpF71CFehmLCSSA7FvtdhhCAsoEkXO8kub+d80LszXMuYQ51Csv+gLS5ke5gOuQ5YqfE9F3VSc30tKO68OeQ7PTybVgGeNIm6gV77wR844ljiMYCno7khbImoZC4a6omLTa5qyyvh10GzFxn3DD8P4V40L+vfUw4Y0mpEWWIWLMi5/0x9yQfDeeKN+o7J2HC8JX7kgJpsl1rSAvAF0q0CUGKp394fJ00p5n1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMtYD2jP2fzkUcLJh06gJtfeoWE9zY0quAon4QaQdGE=;
 b=JuUY7UqO5dFeJEMnfFkppZ7l/MHh5oVrNuh1zqwFukR3UqSaa78Q7p1QcvZzDL9jNacRaEetjBwnA8JTkuaqfR3hp88VOkjwmUzSCKI+V79GJYheNCYbRiAsH0zRCYqloH8Q1/i7+Hp+1YGFpTVaadUsss+mADxareGQvE1FPjY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 15:09:35 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 15:09:35 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH 1/2] curl: fix CVE-2021-22890
Date: Tue,  1 Jun 2021 11:09:27 -0400
Message-Id: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Tue, 1 Jun 2021 15:09:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b83e3dcd-833f-4b1f-32e9-08d9250f448a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4816:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48163F4056F3B4997E9281F29F3E9@SJ0PR11MB4816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	49myQ7QTdYZx0s06bOL6sdk3pLTC3Gz0hgXfbj43q7XA7nqU+irzhVZig3+CDCnsc6B2pbVuU1gZdoRBBChO+syC6vWcN1sLIocyTn2PJ2/XXN3ibdmqKyij6CM2cQ37M6crsukt5IW89koR1I/B6vbPqr3KSK4Aj91svh6ky86JEB8crIt5HG9x4QrLCcigih3c9tVXfkfNLdLt2tpx8adq9YGsUCb/FK2tnUPo9ywlsHWcetCbnbCUOxr5O9viaKP3qNAr/LrJYil3c9wPwd/2JpL3DL34PxoNAfR6zX7Azi4Bfsbm9ggc4zjWh59k+vF9gS/O6cOq1nNACDxZhYYVVUqPYgSyJQbE0cUZJTrqwLxkII9OCs8snk2DaUNrR8bbTfIzCsXusiK2TXdrqgyIjJX0P+ZxfyJqR8jcEpeur2sYrRQb4y1nezHgZM+Rj8dIVM3Vkh/X9iRWxOhVWJaFGoGuTT97nm2o6tza7hSWqZ8xOuBdCIvY5w1WoJnsGmJESmJr7gEWOS1wkz4GmxLlCZ+3+myBg25xDxbG1/6yrWtNlV6Aw6iclUkRKumxaLtFQUoLpaqUOL5cLbRfguEmWg+zQSas/mxkedQf7W9ffMww7IrGfIpwBkgHUFjZyjV+FcJ+ny2PrHE3ieKLGqZCjKkuDbVe0rOwWbaKot6ulCpqvLxZqv992pVxW1QsHfmwjLz0PAT9Z1ODab4IpIrA4Oq+olgk1xTJyBK5u7S/gSWMrvfPppIMPwmi2eakBi66UrGPArbj/zy9D4uk0T79YhT1et2S9LdINkHrKVz5rUfI/SdIyrHrcyHQ9Ki/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(44832011)(66476007)(66556008)(966005)(478600001)(8936002)(2906002)(38350700002)(30864003)(316002)(26005)(5660300002)(38100700002)(8676002)(1076003)(86362001)(36756003)(186003)(6486002)(6916009)(16526019)(6506007)(52116002)(2616005)(956004)(6512007)(83380400001)(6666004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qfqXfz1pi7hHyLHeCKWjyPH/1XV6RS4GACg1eBcP6kVVz8sH5+eEWFzACeGo?=
 =?us-ascii?Q?06t59trW7ba2gxQMexM4dSyVH47aMad252KjzTKf7sRYLqEi9CmujSqT7Uot?=
 =?us-ascii?Q?PtKK1pjnpciBuifg8LBWLUw58sxEubhn9XnwvNb64yR8tu0eXhstou9eCmM0?=
 =?us-ascii?Q?Q8+1FCZScbvSNv87gyyF4TiW4txiPF4Ul/YkUTex468C8xWDFnCfbYuGfNyJ?=
 =?us-ascii?Q?/F/aCDCXsAR9igor4Po+0WUevIqzhROs5U+MXVZcVIVoPcbDEAbgQLSEjSQe?=
 =?us-ascii?Q?mLpyk2JNgmeuhICdj4AO/4CqOtPmppTTut7g7txpm7/MSHZhgtpfMSTVi/Uh?=
 =?us-ascii?Q?JGtRT1nvotC/9GbxOYMUbNYWzyEVCKQ4jsKkI75MOyb3Ik3XFBMg0iy8fIsQ?=
 =?us-ascii?Q?G/2laAwAmXxmaOcFzca/2s4418sILEvNNvlHVz9IjvDRuyu9nhpueWu9yj/t?=
 =?us-ascii?Q?g3z6jzbQTKa0M/mfm2cDsla0bltKXMJYdiGQu2A4grULIKdXSR+7sBfSKJsJ?=
 =?us-ascii?Q?z6nDtlHDNfZKLUcLjtGxTfOn5abIS6sWvByRuSxutiwxGKsod11iFWQaZp9R?=
 =?us-ascii?Q?9TrPzx0Nyzd6yfaxd6/rdXbrqi4S9srli6Ck6TyfwzidAUh72sZZytF53S21?=
 =?us-ascii?Q?ioo1spIkLsDVztTc1FZyOasbxUw1HwPtNJBbSrNn+KufOn9u4XqNLbt54SBQ?=
 =?us-ascii?Q?YBX+UdTxVbIOBGtrQ3FtTROIM3PbtlpQFwDq/knz75WWUMg28YagaIElQqnn?=
 =?us-ascii?Q?hOlOJaOwmjHT8RESYyYeoH5RYNUJvzSemV9rder3D8VO2Oe2i4xHpXqzmYI4?=
 =?us-ascii?Q?Yc6O6nLr9aZ9PEU6Bm6krFQGflXHwxpRNPFBdeH4O4a6+bB9/8779kC3r+Xh?=
 =?us-ascii?Q?1UpSi8WJ/KVHiIJWMiOxm1koiZjQ+CKFSimxCaqyzenidmrKH2W5ehmnOSuu?=
 =?us-ascii?Q?8B0ipoTwKfxvc/VqbkYCR0v3Usb7X/CGxtixQzlQ/aO9QvBVepu1mTKfP2ZT?=
 =?us-ascii?Q?2xYxQ5bEmT5PDd+5mpIPmZE1bEX1skw1TZGAnFIVJrPM+PBUxO/0wIV0s6hN?=
 =?us-ascii?Q?1MsFllWRCvNKiVRZ1PJ7q94BQlvImkFb2UO9HK5FgWASiIInKk0oqnbWdrK3?=
 =?us-ascii?Q?+djUU//pZEPp6n1oE1iyBfLXpg7REt6pRaSbsHDiX5rfSRzjJe+tArqoYBdx?=
 =?us-ascii?Q?w/Q4yFFOvt7IFiCWIfKFzzx7C91uCV/CHATgUvDUpkPQrO8noTlLKpYlRrOc?=
 =?us-ascii?Q?br6dfKgsmA7uSUKz+7haY7X/EcFjhyqeFwxELa9BVioiANWyO203T7TJF0mJ?=
 =?us-ascii?Q?0NEWEyJeThwXASa0fz53AHlS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83e3dcd-833f-4b1f-32e9-08d9250f448a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 15:09:35.7169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPvfWZAIdeznPjHwfwGJZho+MAULYztNWgY3Q2x7sLyNcqd3nXHcrYYcKCX0rX4gqmjEv4rytGlsscM7zzz3FI6g8KP0uTsowH2PMSWQwKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
X-Proofpoint-ORIG-GUID: PRfgqVAi4LCOmXhoWOKmn48z-sl2Rxbv
X-Proofpoint-GUID: PRfgqVAi4LCOmXhoWOKmn48z-sl2Rxbv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_07:2021-06-01,2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010102
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport and modify the patch for CVE-2021-22890 from curl 7.76 to make
it apply cleanly on 7.75.

CVE: CVE-2021-22890

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...-argument-to-Curl_ssl_get-addsession.patch | 517 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   1 +
 2 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch

diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
new file mode 100644
index 0000000000..a0c7d68f33
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
@@ -0,0 +1,517 @@
+From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 1 Jun 2021 09:50:20 -0400
+Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
+ Curl_ssl_get/addsessionid()
+
+To make sure we set and extract the correct session.
+
+Reported-by: Mingtao Yang
+Bug: https://curl.se/docs/CVE-2021-22890.html
+
+CVE-2021-22890
+
+Upstream-Status: Backport
+(https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ lib/vtls/bearssl.c   |  8 +++++--
+ lib/vtls/gtls.c      | 12 ++++++----
+ lib/vtls/mbedtls.c   | 12 ++++++----
+ lib/vtls/mesalink.c  | 14 ++++++++----
+ lib/vtls/openssl.c   | 54 +++++++++++++++++++++++++++++++++-----------
+ lib/vtls/schannel.c  | 10 ++++----
+ lib/vtls/sectransp.c | 10 ++++----
+ lib/vtls/vtls.c      | 12 +++++++---
+ lib/vtls/vtls.h      |  2 ++
+ lib/vtls/wolfssl.c   | 28 +++++++++++++----------
+ 10 files changed, 111 insertions(+), 51 deletions(-)
+
+diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
+index 29b08c0e6..0432dfadc 100644
+--- a/lib/vtls/bearssl.c
++++ b/lib/vtls/bearssl.c
+@@ -375,7 +375,8 @@ static CURLcode bearssl_connect_step1(struct Curl_easy *data,
+     void *session;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &session, NULL, sockindex)) {
+       br_ssl_engine_set_session_parameters(&backend->ctx.eng, session);
+       infof(data, "BearSSL: re-using session ID\n");
+     }
+@@ -571,10 +572,13 @@ static CURLcode bearssl_connect_step3(struct Curl_easy *data,
+     br_ssl_engine_get_session_parameters(&backend->ctx.eng, session);
+     Curl_ssl_sessionid_lock(data);
+     incache = !(Curl_ssl_getsessionid(data, conn,
++                                      SSL_IS_PROXY() ? TRUE : FALSE,
+                                       &oldsession, NULL, sockindex));
+     if(incache)
+       Curl_ssl_delsessionid(data, oldsession);
+-    ret = Curl_ssl_addsessionid(data, conn, session, 0, sockindex);
++    ret = Curl_ssl_addsessionid(data, conn,
++                                SSL_IS_PROXY() ? TRUE : FALSE,
++                                session, 0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(ret) {
+       free(session);
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index 3ddee1974..28ca528a6 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -733,6 +733,7 @@ gtls_connect_step1(struct Curl_easy *data,
+ 
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               &ssl_sessionid, &ssl_idsize, sockindex)) {
+       /* we got a session id, use it! */
+       gnutls_session_set_data(session, ssl_sessionid, ssl_idsize);
+@@ -1292,8 +1293,9 @@ gtls_connect_step3(struct Curl_easy *data,
+       gnutls_session_get_data(session, connect_sessionid, &connect_idsize);
+ 
+       Curl_ssl_sessionid_lock(data);
+-      incache = !(Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL,
+-                                        sockindex));
++      incache = !(Curl_ssl_getsessionid(data, conn,
++                                        SSL_IS_PROXY() ? TRUE : FALSE,
++                                        &ssl_sessionid, NULL, sockindex));
+       if(incache) {
+         /* there was one before in the cache, so instead of risking that the
+            previous one was rejected, we just kill that and store the new */
+@@ -1301,8 +1303,10 @@ gtls_connect_step3(struct Curl_easy *data,
+       }
+ 
+       /* store this session id */
+-      result = Curl_ssl_addsessionid(data, conn, connect_sessionid,
+-                                     connect_idsize, sockindex);
++      result = Curl_ssl_addsessionid(data, conn,
++                                     SSL_IS_PROXY() ? TRUE : FALSE,
++                                     connect_sessionid, connect_idsize,
++                                     sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+         free(connect_sessionid);
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index fc3a948d1..bd0e0802e 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -463,7 +463,9 @@ mbed_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *old_session = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &old_session, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &old_session, NULL, sockindex)) {
+       ret = mbedtls_ssl_set_session(&backend->ssl, old_session);
+       if(ret) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -724,6 +726,7 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     int ret;
+     mbedtls_ssl_session *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = malloc(sizeof(mbedtls_ssl_session));
+     if(!our_ssl_sessionid)
+@@ -742,11 +745,12 @@ mbed_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+ 
+     /* If there's already a matching session in the cache, delete it */
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL, sockindex))
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
++                              sockindex))
+       Curl_ssl_delsessionid(data, old_ssl_sessionid);
+ 
+-    retcode = Curl_ssl_addsessionid(data, conn,
+-                                    our_ssl_sessionid, 0, sockindex);
++    retcode = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                    0, sockindex);
+     Curl_ssl_sessionid_unlock(data);
+     if(retcode) {
+       mbedtls_ssl_session_free(our_ssl_sessionid);
+diff --git a/lib/vtls/mesalink.c b/lib/vtls/mesalink.c
+index b6d1005ec..ad807d3ba 100644
+--- a/lib/vtls/mesalink.c
++++ b/lib/vtls/mesalink.c
+@@ -261,7 +261,9 @@ mesalink_connect_step1(struct Curl_easy *data,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(BACKEND->handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+@@ -345,13 +347,14 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     bool incache;
+     SSL_SESSION *our_ssl_sessionid;
+     void *old_ssl_sessionid = NULL;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
+ 
+     our_ssl_sessionid = SSL_get_session(BACKEND->handle);
+ 
+     Curl_ssl_sessionid_lock(data);
+     incache =
+-      !(Curl_ssl_getsessionid(data, conn,
+-                              &old_ssl_sessionid, NULL, sockindex));
++      !(Curl_ssl_getsessionid(data, conn, isproxy, &old_ssl_sessionid, NULL,
++                              sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != our_ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -361,8 +364,9 @@ mesalink_connect_step3(struct connectdata *conn, int sockindex)
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(
+-        data, conn, our_ssl_sessionid, 0 /* unknown size */, sockindex);
++      result =
++        Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid, 0,
++                              sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, "failed to store ssl session");
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 784d9f70e..8304264d3 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -391,12 +391,23 @@ static int ossl_get_ssl_conn_index(void)
+  */
+ static int ossl_get_ssl_sockindex_index(void)
+ {
+-  static int ssl_ex_data_sockindex_index = -1;
+-  if(ssl_ex_data_sockindex_index < 0) {
+-    ssl_ex_data_sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL,
+-        NULL);
++  static int sockindex_index = -1;
++  if(sockindex_index < 0) {
++    sockindex_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
+   }
+-  return ssl_ex_data_sockindex_index;
++  return sockindex_index;
++}
++
++/* Return an extra data index for proxy boolean.
++ * This index can be used with SSL_get_ex_data() and SSL_set_ex_data().
++ */
++static int ossl_get_proxy_index(void)
++{
++  static int proxy_index = -1;
++  if(proxy_index < 0) {
++    proxy_index = SSL_get_ex_new_index(0, NULL, NULL, NULL, NULL);
++  }
++  return proxy_index;
+ }
+ 
+ static int passwd_callback(char *buf, int num, int encrypting,
+@@ -1172,7 +1183,7 @@ static int ossl_init(void)
+ 
+   /* Initialize the extra data indexes */
+   if(ossl_get_ssl_data_index() < 0 || ossl_get_ssl_conn_index() < 0 ||
+-     ossl_get_ssl_sockindex_index() < 0)
++     ossl_get_ssl_sockindex_index() < 0 || ossl_get_proxy_index() < 0)
+     return 0;
+ 
+   return 1;
+@@ -2455,8 +2466,10 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   int data_idx = ossl_get_ssl_data_index();
+   int connectdata_idx = ossl_get_ssl_conn_index();
+   int sockindex_idx = ossl_get_ssl_sockindex_index();
++  int proxy_idx = ossl_get_proxy_index();
++  bool isproxy;
+ 
+-  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0)
++  if(data_idx < 0 || connectdata_idx < 0 || sockindex_idx < 0 || proxy_idx < 0)
+     return 0;
+ 
+   conn = (struct connectdata*) SSL_get_ex_data(ssl, connectdata_idx);
+@@ -2469,13 +2482,18 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+   sockindex_ptr = (curl_socket_t*) SSL_get_ex_data(ssl, sockindex_idx);
+   sockindex = (int)(sockindex_ptr - conn->sock);
+ 
++  isproxy = SSL_get_ex_data(ssl, proxy_idx) ? TRUE : FALSE;
++
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     bool incache;
+     void *old_ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
+-                                      sockindex));
++    if(isproxy)
++      incache = FALSE;
++    else
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &old_ssl_sessionid, NULL, sockindex));
+     if(incache) {
+       if(old_ssl_sessionid != ssl_sessionid) {
+         infof(data, "old SSL session ID is stale, removing\n");
+@@ -2485,8 +2503,8 @@ static int ossl_new_session_cb(SSL *ssl, SSL_SESSION *ssl_sessionid)
+     }
+ 
+     if(!incache) {
+-      if(!Curl_ssl_addsessionid(data, conn, ssl_sessionid,
+-                                      0 /* unknown size */, sockindex)) {
++      if(!Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
++                                0 /* unknown size */, sockindex)) {
+         /* the session has been put into the session cache */
+         res = 1;
+       }
+@@ -3212,17 +3230,27 @@ static CURLcode ossl_connect_step1(struct Curl_easy *data,
+     int data_idx = ossl_get_ssl_data_index();
+     int connectdata_idx = ossl_get_ssl_conn_index();
+     int sockindex_idx = ossl_get_ssl_sockindex_index();
++    int proxy_idx = ossl_get_proxy_index();
+ 
+-    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0) {
++    if(data_idx >= 0 && connectdata_idx >= 0 && sockindex_idx >= 0 &&
++       proxy_idx >= 0) {
+       /* Store the data needed for the "new session" callback.
+        * The sockindex is stored as a pointer to an array element. */
+       SSL_set_ex_data(backend->handle, data_idx, data);
+       SSL_set_ex_data(backend->handle, connectdata_idx, conn);
+       SSL_set_ex_data(backend->handle, sockindex_idx, conn->sock + sockindex);
++#ifndef CURL_DISABLE_PROXY
++      SSL_set_ex_data(backend->handle, proxy_idx, SSL_IS_PROXY() ? (void *) 1:
++                      NULL);
++#else
++      SSL_set_ex_data(backend->handle, proxy_idx, NULL);
++#endif
++
+     }
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn, SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
+         Curl_ssl_sessionid_unlock(data);
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index 0668f98f2..bd27ba0bf 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -496,6 +496,7 @@ schannel_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+   if(SSL_SET_OPTION(primary.sessionid)) {
+     Curl_ssl_sessionid_lock(data);
+     if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
+                               (void **)&old_cred, NULL, sockindex)) {
+       BACKEND->cred = old_cred;
+       DEBUGF(infof(data, "schannel: re-using existing credential handle\n"));
+@@ -1337,8 +1338,9 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+   struct ssl_connect_data *connssl = &conn->ssl[sockindex];
+   SECURITY_STATUS sspi_status = SEC_E_OK;
+   CERT_CONTEXT *ccert_context = NULL;
++  bool isproxy = SSL_IS_PROXY();
+ #ifdef DEBUGBUILD
+-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
+     conn->host.name;
+ #endif
+ #ifdef HAS_ALPN
+@@ -1414,8 +1416,8 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     struct Curl_schannel_cred *old_cred = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, (void **)&old_cred, NULL,
+-                                      sockindex));
++    incache = !(Curl_ssl_getsessionid(data, conn, isproxy, (void **)&old_cred,
++                                      NULL, sockindex));
+     if(incache) {
+       if(old_cred != BACKEND->cred) {
+         DEBUGF(infof(data,
+@@ -1426,7 +1428,7 @@ schannel_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+       }
+     }
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, (void *)BACKEND->cred,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, BACKEND->cred,
+                                      sizeof(struct Curl_schannel_cred),
+                                      sockindex);
+       if(result) {
+diff --git a/lib/vtls/sectransp.c b/lib/vtls/sectransp.c
+index 9a8f7de8d..6d1ea7e7b 100644
+--- a/lib/vtls/sectransp.c
++++ b/lib/vtls/sectransp.c
+@@ -1400,10 +1400,12 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+   char * const ssl_cert = SSL_SET_OPTION(primary.clientcert);
+   const struct curl_blob *ssl_cert_blob = SSL_SET_OPTION(primary.cert_blob);
+ #ifndef CURL_DISABLE_PROXY
+-  const char * const hostname = SSL_IS_PROXY() ? conn->http_proxy.host.name :
++  bool isproxy = SSL_IS_PROXY();
++  const char * const hostname = isproxy ? conn->http_proxy.host.name :
+     conn->host.name;
+   const long int port = SSL_IS_PROXY() ? conn->port : conn->remote_port;
+ #else
++  const isproxy = FALSE;
+   const char * const hostname = conn->host.name;
+   const long int port = conn->remote_port;
+ #endif
+@@ -1613,7 +1615,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+ #ifdef USE_NGHTTP2
+       if(data->set.httpversion >= CURL_HTTP_VERSION_2
+ #ifndef CURL_DISABLE_PROXY
+-         && (!SSL_IS_PROXY() || !conn->bits.tunnel_proxy)
++         && (!isproxy || !conn->bits.tunnel_proxy)
+ #endif
+         ) {
+         CFArrayAppendValue(alpnArr, CFSTR(NGHTTP2_PROTO_VERSION_ID));
+@@ -1953,7 +1955,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+     size_t ssl_sessionid_len;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, (void **)&ssl_sessionid,
++    if(!Curl_ssl_getsessionid(data, conn, isproxy, (void **)&ssl_sessionid,
+                               &ssl_sessionid_len, sockindex)) {
+       /* we got a session id, use it! */
+       err = SSLSetPeerID(backend->ssl_ctx, ssl_sessionid, ssl_sessionid_len);
+@@ -1981,7 +1983,7 @@ static CURLcode sectransp_connect_step1(struct Curl_easy *data,
+         return CURLE_SSL_CONNECT_ERROR;
+       }
+ 
+-      result = Curl_ssl_addsessionid(data, conn, ssl_sessionid,
++      result = Curl_ssl_addsessionid(data, conn, isproxy, ssl_sessionid,
+                                      ssl_sessionid_len, sockindex);
+       Curl_ssl_sessionid_unlock(data);
+       if(result) {
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index b8ab7494f..8ccc1f2e4 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -367,6 +367,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data)
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isProxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex)
+@@ -377,7 +378,6 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   bool no_match = TRUE;
+ 
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &conn->proxy_ssl_config :
+     &conn->ssl_config;
+@@ -389,10 +389,15 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+   struct ssl_primary_config * const ssl_config = &conn->ssl_config;
+   const char * const name = conn->host.name;
+   int port = conn->remote_port;
+-  (void)sockindex;
+ #endif
++  (void)sockindex;
+   *ssl_sessionid = NULL;
+ 
++#ifdef CURL_DISABLE_PROXY
++  if(isProxy)
++    return TRUE;
++#endif
++
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   if(!SSL_SET_OPTION(primary.sessionid))
+@@ -480,6 +485,7 @@ void Curl_ssl_delsessionid(struct Curl_easy *data, void *ssl_sessionid)
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex)
+@@ -492,7 +498,6 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   int conn_to_port;
+   long *general_age;
+ #ifndef CURL_DISABLE_PROXY
+-  const bool isProxy = CONNECT_PROXY_SSL();
+   struct ssl_primary_config * const ssl_config = isProxy ?
+     &conn->proxy_ssl_config :
+     &conn->ssl_config;
+@@ -505,6 +510,7 @@ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+   const char *hostname = conn->host.name;
+   (void)sockindex;
+ #endif
++  (void)sockindex;
+   DEBUGASSERT(SSL_SET_OPTION(primary.sessionid));
+ 
+   clone_host = strdup(hostname);
+diff --git a/lib/vtls/vtls.h b/lib/vtls/vtls.h
+index 9666682ec..4dc29794c 100644
+--- a/lib/vtls/vtls.h
++++ b/lib/vtls/vtls.h
+@@ -222,6 +222,7 @@ void Curl_ssl_sessionid_unlock(struct Curl_easy *data);
+  */
+ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+                            struct connectdata *conn,
++                           const bool isproxy,
+                            void **ssl_sessionid,
+                            size_t *idsize, /* set 0 if unknown */
+                            int sockindex);
+@@ -232,6 +233,7 @@ bool Curl_ssl_getsessionid(struct Curl_easy *data,
+  */
+ CURLcode Curl_ssl_addsessionid(struct Curl_easy *data,
+                                struct connectdata *conn,
++                               const bool isProxy,
+                                void *ssl_sessionid,
+                                size_t idsize,
+                                int sockindex);
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index e1fa45926..e4c70877f 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
+     void *ssl_sessionid = NULL;
+ 
+     Curl_ssl_sessionid_lock(data);
+-    if(!Curl_ssl_getsessionid(data, conn, &ssl_sessionid, NULL, sockindex)) {
++    if(!Curl_ssl_getsessionid(data, conn,
++                              SSL_IS_PROXY() ? TRUE : FALSE,
++                              &ssl_sessionid, NULL, sockindex)) {
+       /* we got a session id, use it! */
+       if(!SSL_set_session(backend->handle, ssl_sessionid)) {
+         char error_buffer[WOLFSSL_MAX_ERROR_SZ];
+@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+     void *old_ssl_sessionid = NULL;
+ 
+     our_ssl_sessionid = SSL_get_session(backend->handle);
+-
+-    Curl_ssl_sessionid_lock(data);
+-    incache = !(Curl_ssl_getsessionid(data, conn, &old_ssl_sessionid, NULL,
+-                                      sockindex));
+-    if(incache) {
+-      if(old_ssl_sessionid != our_ssl_sessionid) {
+-        infof(data, "old SSL session ID is stale, removing\n");
+-        Curl_ssl_delsessionid(data, old_ssl_sessionid);
+-        incache = FALSE;
++    bool isproxy = SSL_IS_PROXY() ? TRUE : FALSE;
++
++    if(our_ssl_sessionid) {
++      Curl_ssl_sessionid_lock(data);
++      incache = !(Curl_ssl_getsessionid(data, conn, isproxy,
++                                        &old_ssl_sessionid, NULL, sockindex));
++      if(incache) {
++        if(old_ssl_sessionid != our_ssl_sessionid) {
++            infof(data, "old SSL session ID is stale, removing\n");
++            Curl_ssl_delsessionid(data, old_ssl_sessionid);
++            incache = FALSE;
+       }
+     }
+ 
+     if(!incache) {
+-      result = Curl_ssl_addsessionid(data, conn, our_ssl_sessionid,
+-                                     0 /* unknown size */, sockindex);
++      result = Curl_ssl_addsessionid(data, conn, isproxy, our_ssl_sessionid,
++                                     0, sockindex);
+       if(result) {
+         Curl_ssl_sessionid_unlock(data);
+         failf(data, "failed to store ssl session");
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 7666c7b608..428b8cd9e3 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

