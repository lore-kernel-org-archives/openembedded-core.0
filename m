Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.44])
 by mx.groups.io with SMTP id smtpd.web12.6590.1609932309538697722
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 03:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=hhegJaUe;
 spf=pass (domain: kpit.com, ip: 40.107.138.44, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J32mR5ewvtjN8dbPB7BXJTpCVjKd8lB18egc8uZDN8Vg6gVapnG85VRhGrhDMF+r0JLG2Pz2HFTWqixivQdOpemHechXeaa8VzRRnHs8tsjyGmqQofejyq1vmL08Uol8coC3vdymh79SjDzGMlAeVzjInOyYzwRakVoqDhOnoSFyayK7pzp+/Dddzg1KJQP/HJLxY6pkyW4H30IwhSrxLa781Fh/7y6bo1GGDRzgi8FPDTRPLSkqHFRJ6+QV447iZ3fyVcI2MZ7OaGCh+TCmBhLAD0nWqg0oRyFK/PpoRN9bGV29RI2vNu9U0y9LpzcOcqK6m9V+dmKT3XOCMuziEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtH4D+P3/Mihs3LlJvbDFMbgxEggKXCjB3nhdL5uW4=;
 b=c0adNxJqyElOMp3MdB6wMg3sQ+oCadt7BApCi+9bGslEpvxBcrAB9EnzTdQrg7CgijgsNz8YaEwwFlIx3/kuQyIpS17tdEPr23i7HELHIeotMvX70FC7iDidxOmfegybBoRruzxgjrz9wNFxArYwg/ttFMxqtR64FqJMWZTqP67q1M2DL+quCWIKEPLINT8iPYBZxX2SG4PmJjInmOkd2e/HWs40DPsShCJdMa824bW5cbVmiml518EOk+WR1c5deuA3q67Qk+w4B8Xqs/RFJIWThNbK0C3UwksrL4aMlgLbvZOji+wANrXOZYMxLp98wxLSNSPWEFzRVKcpGpNzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePtH4D+P3/Mihs3LlJvbDFMbgxEggKXCjB3nhdL5uW4=;
 b=hhegJaUe6xHvSapQfj7fPTRMEpCT6rBISRdY3yfixFTdBFxCF16iknywEODyTdkEFfQwKJZ2MEufP3V6zSq8RL8IbgTkIXqmI5THKSPVZIBIYypVwH1PceSichDZOH2AqApGvd6WGlhwnP9Jx7ZU2qZ3dUXpUG1dYz+g7e2dNH8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB1010.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 11:24:58 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 11:24:58 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com
Subject: [poky][sumo][PATCH] busybox: Add fix for CVE-2018-20679
Date: Wed,  6 Jan 2021 16:54:45 +0530
Message-Id: <20210106112445.30416-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 11:24:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c5e610c-6198-40e4-6586-08d8b235b33f
X-MS-TrafficTypeDiagnostic: BM1PR01MB1010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB10108E019072225A701C5341F2D00@BM1PR01MB1010.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NdpZSQDbnUp4Zn2magFj3FWoF288kQDtdB+12r7HFQJLkkDUTNjJ3iwQe+BNSDOhJ6fHZWfA4tJKtFjogpeLLV5KO1mwYkCZsMvbnuJar0bR0wFH9PdOfvD3XwSSzYHBLaX5hvgG21T8D2rtpwu28zPG5No8NU1emlmWkAT07FKMaCYxH86vHk5f9rbKKDz7caSvYmWrUBt6x9zEyyZq17n63dqdGTTQyLFW6yns4NIJ3adVvqfjQ9lMfJNxwBWXYY/C01exOGJaSVNp/eiM15PA/fcDBO0v0hUXm032VAm6x2V8zc2WjL99vW30qg9mq3lRl+AUsovZx2B0A38fqD12CIOFBVfz8YNPkGjPN9o7oBvmm27yIqcBCt8wSpkiI1KsvrbI/i4lSYPpM2Uo8k1ZiciqDGf8fdxgvD3v7jLj/uVq044hBPbLr5kIZabMJ0hS9LJHCIjZQVkiCaQbPPQmC3r4j6pwstZ1XpuBwLSyFNTFUYNl9WnHZXdZ77V2aRBdRdj8ilPJoffi2Q3Gdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(8936002)(956004)(316002)(6506007)(26005)(66574015)(36756003)(16526019)(2906002)(2616005)(966005)(83380400001)(8676002)(478600001)(186003)(66556008)(6486002)(1076003)(107886003)(5660300002)(86362001)(4326008)(52116002)(66476007)(6666004)(6512007)(66946007)(69590400011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?e7JFTHAx6NHOoNPUpMxqN/f/b4qA6OQyweiob0u8x4N6FfSV/mQf7hu7SRoK?=
 =?us-ascii?Q?6gIqa7lYwk5vO73r1kc0+xAzMSAqj4q9vjZ9uvMxW8b6auywCtHXFEaKkTBq?=
 =?us-ascii?Q?acE0YAawXONwngOGimXfQYemh1RupYKxcQNsFGNGVRmfVYOlck6o4L9gAj0V?=
 =?us-ascii?Q?ITEqWOFkxBJRH/o25K1KeThMy9K30HYUIr/q2+ksxNJbl4w0yG53IYeFNTor?=
 =?us-ascii?Q?J3Duz7kcWzRdT4645LKdDggnWUJP7wwNbI91Z3Z/ILP57SJXSYgmW2smC7eG?=
 =?us-ascii?Q?BVEaxLWIu+Y4pnW4KbuzfIja231rVMpHa7wjYgjmUrc7NQaYYbcWc/YE98Pn?=
 =?us-ascii?Q?eFFU6q1iAA7j9/3uMEdtNLjuKJN4Kg0TjcIm1K4joJJu4m5VjtAz/LTEB9mj?=
 =?us-ascii?Q?v7hQ6/knzUf5We7LMN/9HI+w3caaWBDSOjQ5fChCc5r4ermXv84PIbCtApLr?=
 =?us-ascii?Q?OTWg+fvNdkWrA5XEveiYmko5yN+0Jq7vpg84l/2fjh6FC0sVTwEZ/RRl7Vdn?=
 =?us-ascii?Q?DKcwc8PneqYNhl1RgGmlE5WRXxoeXmYyjsRyqM7iKM/wxchDPvxrWUvA4r70?=
 =?us-ascii?Q?3EhoIQxVj1l+qrrS0SyPjmLCKKLxhlLVmSuex18OKFxMRLagmU2kPiouoI7Q?=
 =?us-ascii?Q?1q1GauARRUc+p3aL+hx0h0B1apSAyk7rHdG/iwhsH+C6FfV+kgB2ASAsUww4?=
 =?us-ascii?Q?Sk9Sbges0C4mMfDw1zRrp2+cwrNvlmL3/bxemv+Ds3u81FLCfnOQiHg/ktCE?=
 =?us-ascii?Q?EUZPw/+C8a7qyxMQmZfTj+Zo/OcBbVTsb4YB5A4vIn0dgBK4o1drmKrNPOu2?=
 =?us-ascii?Q?fHhpjXdL8lQKHelV9hg7PpZITppxtJg5ZUztIkVdliyM5S6ghGMdcmQNeEE6?=
 =?us-ascii?Q?WVqc0N1JvjOUz58dWhZuVGhEVDQyreLdnocdx65+GEhyPYnDGzBgzLx6ph1h?=
 =?us-ascii?Q?xHQozXW9e0Px+R+/JdC2yhtvUbccWKI5mvXgOfITCRV+5j5sCMT4TJzVjm8S?=
 =?us-ascii?Q?kIs3?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 11:24:58.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5e610c-6198-40e4-6586-08d8b235b33f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6/ezlYEYMvrpNBm6LsF8cg26DodGifQu/AhM3GMdDwojuUXh+nAGGAFXxpsbWrx4lcxqX7YZcPftk9jDeHKLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB1010
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied patch that Ubuntu applied to busybox 1.27.2

The patch is available from file:
http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubuntu=
3.2.debian.tar.xz
in path debian/patches/.

The below patch is added:

CVE-2018-20679.patch

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../busybox/busybox/CVE-2018-20679.patch      | 136 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2018-20679.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2018-20679.patch b/meta/=
recipes-core/busybox/busybox/CVE-2018-20679.patch
new file mode 100644
index 0000000000..963b360e13
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2018-20679.patch
@@ -0,0 +1,136 @@
+From 6d3b4bb24da9a07c263f3c1acf8df85382ff562c Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 17 Dec 2018 18:07:18 +0100
+Subject: udhcpc: check that 4-byte options are indeed 4-byte, closes 11506
+
+function                                             old     new   delta
+udhcp_get_option32                                     -      27     +27
+udhcp_get_option                                     231     248     +17
+--------------------------------------------------------------------------=
----
+(add/remove: 1/0 grow/shrink: 1/0 up/down: 44/0)               Total: 44 b=
ytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+CVE-2018-20679
+[http://archive.ubuntu.com/ubuntu/pool/main/b/busybox/busybox_1.27.2-2ubun=
tu3.2.debian.tar.xz]
+Upstream-Status: Backport
+---
+ networking/udhcp/common.c | 19 +++++++++++++++++++
+ networking/udhcp/common.h |  4 ++++
+ networking/udhcp/dhcpc.c  |  6 +++---
+ networking/udhcp/dhcpd.c  |  6 +++---
+ 4 files changed, 29 insertions(+), 6 deletions(-)
+
+Index: busybox-1.27.2/networking/udhcp/common.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/common.c      2019-03-06 15:10:40=
.241569417 -0500
++++ busybox-1.27.2/networking/udhcp/common.c   2019-03-06 15:10:40.2375693=
97 -0500
+@@ -270,6 +270,15 @@ uint8_t* FAST_FUNC udhcp_get_option(stru
+                       goto complain; /* complain and return NULL */
+
+               if (optionptr[OPT_CODE] =3D=3D code) {
++                      if (optionptr[OPT_LEN] =3D=3D 0) {
++                              /* So far no valid option with length 0 kno=
wn.
++                               * Having this check means that searching
++                               * for DHCP_MESSAGE_TYPE need not worry
++                               * that returned pointer might be unsafe
++                               * to dereference.
++                               */
++                              goto complain; /* complain and return NULL =
*/
++                      }
+                       log_option("option found", optionptr);
+                       return optionptr + OPT_DATA;
+               }
+@@ -287,6 +296,16 @@ uint8_t* FAST_FUNC udhcp_get_option(stru
+       return NULL;
+ }
+
++uint8_t* FAST_FUNC udhcp_get_option32(struct dhcp_packet *packet, int cod=
e)
++{
++      uint8_t *r =3D udhcp_get_option(packet, code);
++      if (r) {
++              if (r[-1] !=3D 4)
++                      r =3D NULL;
++      }
++      return r;
++}
++
+ /* Return the position of the 'end' option (no bounds checking) */
+ int FAST_FUNC udhcp_end_option(uint8_t *optionptr)
+ {
+Index: busybox-1.27.2/networking/udhcp/common.h
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/common.h      2019-03-06 15:10:40=
.241569417 -0500
++++ busybox-1.27.2/networking/udhcp/common.h   2019-03-06 15:10:40.2375693=
97 -0500
+@@ -200,6 +200,10 @@ extern const uint8_t dhcp_option_lengths
+ unsigned FAST_FUNC udhcp_option_idx(const char *name, const char *option_=
strings);
+
+ uint8_t *udhcp_get_option(struct dhcp_packet *packet, int code) FAST_FUNC=
;
++/* Same as above + ensures that option length is 4 bytes
++ * (returns NULL if size is different)
++ */
++uint8_t *udhcp_get_option32(struct dhcp_packet *packet, int code) FAST_FU=
NC;
+ int udhcp_end_option(uint8_t *optionptr) FAST_FUNC;
+ void udhcp_add_binary_option(struct dhcp_packet *packet, uint8_t *addopt)=
 FAST_FUNC;
+ #if ENABLE_UDHCPC || ENABLE_UDHCPD
+Index: busybox-1.27.2/networking/udhcp/dhcpc.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/dhcpc.c       2019-03-06 15:10:40=
.241569417 -0500
++++ busybox-1.27.2/networking/udhcp/dhcpc.c    2019-03-06 15:10:40.2375693=
97 -0500
+@@ -1706,7 +1706,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+  * They say ISC DHCP client supports this case.
+  */
+                               server_addr =3D 0;
+-                              temp =3D udhcp_get_option(&packet, DHCP_SER=
VER_ID);
++                              temp =3D udhcp_get_option32(&packet, DHCP_S=
ERVER_ID);
+                               if (!temp) {
+                                       bb_error_msg("no server ID, using 0=
.0.0.0");
+                               } else {
+@@ -1733,7 +1733,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+                               struct in_addr temp_addr;
+                               uint8_t *temp;
+
+-                              temp =3D udhcp_get_option(&packet, DHCP_LEA=
SE_TIME);
++                              temp =3D udhcp_get_option32(&packet, DHCP_L=
EASE_TIME);
+                               if (!temp) {
+                                       bb_error_msg("no lease time with AC=
K, using 1 hour lease");
+                                       lease_seconds =3D 60 * 60;
+@@ -1825,7 +1825,7 @@ int udhcpc_main(int argc UNUSED_PARAM, c
+                                       uint32_t svid;
+                                       uint8_t *temp;
+
+-                                      temp =3D udhcp_get_option(&packet, =
DHCP_SERVER_ID);
++                                      temp =3D udhcp_get_option32(&packet=
, DHCP_SERVER_ID);
+                                       if (!temp) {
+  non_matching_svid:
+                                               log1("received DHCP NAK wit=
h wrong"
+Index: busybox-1.27.2/networking/udhcp/dhcpd.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- busybox-1.27.2.orig/networking/udhcp/dhcpd.c       2019-03-06 15:10:40=
.241569417 -0500
++++ busybox-1.27.2/networking/udhcp/dhcpd.c    2019-03-06 15:10:40.2375693=
97 -0500
+@@ -637,7 +637,7 @@ static void add_server_options(struct dh
+ static uint32_t select_lease_time(struct dhcp_packet *packet)
+ {
+       uint32_t lease_time_sec =3D server_config.max_lease_sec;
+-      uint8_t *lease_time_opt =3D udhcp_get_option(packet, DHCP_LEASE_TIM=
E);
++      uint8_t *lease_time_opt =3D udhcp_get_option32(packet, DHCP_LEASE_T=
IME);
+       if (lease_time_opt) {
+               move_from_unaligned32(lease_time_sec, lease_time_opt);
+               lease_time_sec =3D ntohl(lease_time_sec);
+@@ -966,7 +966,7 @@ int udhcpd_main(int argc UNUSED_PARAM, c
+               }
+
+               /* Get SERVER_ID if present */
+-              server_id_opt =3D udhcp_get_option(&packet, DHCP_SERVER_ID)=
;
++              server_id_opt =3D udhcp_get_option32(&packet, DHCP_SERVER_I=
D);
+               if (server_id_opt) {
+                       uint32_t server_id_network_order;
+                       move_from_unaligned32(server_id_network_order, serv=
er_id_opt);
+@@ -990,7 +990,7 @@ int udhcpd_main(int argc UNUSED_PARAM, c
+               }
+
+               /* Get REQUESTED_IP if present */
+-              requested_ip_opt =3D udhcp_get_option(&packet, DHCP_REQUEST=
ED_IP);
++              requested_ip_opt =3D udhcp_get_option32(&packet, DHCP_REQUE=
STED_IP);
+               if (requested_ip_opt) {
+                       move_from_unaligned32(requested_nip, requested_ip_o=
pt);
+               }
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-cor=
e/busybox/busybox_1.27.2.bb
index 716a0650fc..8b08c577ab 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
            file://busybox-fix-lzma-segfaults.patch \
            file://umount-ignore-c.patch \
            file://CVE-2017-15874.patch \
+           file://CVE-2018-20679.patch \
 "
 SRC_URI_append_libc-musl =3D " file://musl.cfg "

--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
