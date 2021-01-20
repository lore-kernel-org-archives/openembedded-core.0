Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.88])
 by mx.groups.io with SMTP id smtpd.web12.30266.1611159240326371698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=bscczoEj;
 spf=pass (domain: kpit.com, ip: 40.107.138.88, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhbV6e9Xi+J5suzPyHRdnHh82iU2bJ+wy3RaGj9/IGBk0BFKXhvALyG6eCzCSc7FWBOke9/koIzMIp+qPrrEF7G7Tz3tVNjG8SmmADQao0aeH1jzW0ALe4Rn0UUuBjwMtHU5Ne1U8eD+gT3Bwt7AsrTYJe2e7k2ydd8UoK+pPrwj7tErVEI17KFu2SL5gCpQFE+zTV/pzRmZELdFvjsg0lcxHZeyGzFSL89oKXXQUMsLJOZ9inEj9L8I8w3+EFfjOABR3cerA96XEaew0OAHV5hyj0XCvR9ky0tA9Fau5sBI4xaYXvlSBbltvTiUnr3NyKLmGt37cOM5gxrh0JH8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twdsjgohHXboVtDUlJKF9anfz2fG3H6o7fsmW5cruEw=;
 b=WoQMietU0fzdXF6etxxtoeLaqI2S3MSsri8kGdIDo/H7zqkPRbVtd9z6BFcxJK9QP4A5VCSvnRBqfEnCVZZ/RS04lfyjmJ8pEDyFGsUBqx6v+7RHng1/stldIEk/Lsxu7g/Ekuk++hvG0A0iq6QCbqFtgcFshc1uaC0oGW5hYS0ccO2Cuy+Ry5d8QN/S1Tqlx82q7OX2ofWbMMWyT0RaseK58xD81pZ9l4AEXsSJNbiEIqzV3eHVN1UtL3oUthPCIfmLjjJ10i2jbUshO5EQBLV0gx0IU52/endk+/xy8aZMf97E1TzH2BpGtWVO6smFm/hVe2uvo3mJPFSyuiNNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twdsjgohHXboVtDUlJKF9anfz2fG3H6o7fsmW5cruEw=;
 b=bscczoEjrHZkkxxx0GhQyMW05qsbBVHPt8fh2a1QuoUN5vmStiQQRGqO56sq/1Is+21h8+CENRp2oQMbUomj5Y0ZbrjeoyEh8TPjDoGBT2DRjCfyv7i6vxcrwmFXVd1piTVFb/rHdm79JttNz7jxwBl5fD/+mQ2LMVs6JhgbFHI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB3284.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:69::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 16:13:51 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 16:13:51 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][dunfell][PATCH] openssh: Added security fix for CVE-2020-14145
Date: Wed, 20 Jan 2021 21:43:32 +0530
Message-Id: <1611159212-7640-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:48f:38f2:4068:42fd:40a7:5718]
X-ClientProxiedBy: BM1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::15) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:48f:38f2:4068:42fd:40a7:5718) by BM1PR01CA0075.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 16:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4678c0c-5b9b-49a7-691c-08d8bd5e606b
X-MS-TrafficTypeDiagnostic: BM1PR01MB3284:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB32840AD6EA4F9B49C4AFEAD287A20@BM1PR01MB3284.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:95;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TJ8b9+1QQZCxjnGWrcQOu1WD0Q1yVeMYH8+wiOHmsUpBwnlpLUOpzFHQrzzYKGPMdn40NGKY/U1CoeEJg5OcoO3pYvByX28aiLz3+kAI4fRPME5QCbOkmoK/nS4HcybeTaLx9wn81dWaUlc7TvMJJtg7du0pFplVtYojHnRLLmoiybq5K0cCzyjmCwaiODJ2hAHqgBO2U2WGbnnI4aFIS+UcQBoCj/BgcYCqrU7OJKZ73lumtQrCE9y/nCWolnd/dhxXV+nkTrsYPbqca0phLuKxmR+yi2yqGN24BiGxlhKQswwx/uZ0MmPvGs3a7gJv64RSpnJMwyLCMm3l2pQiLoGdTXFDbvEVesqDssqVs0sBe1xU/TmUCp/DDgi1Di0hTf+YSTWfIACR2JyAw0e3/7PrFkX8tjMe0ARba0zxTrTNSvmd7POce43zLLW5JCiBGg6S49ILFilyXPvH7SAHk/0kHJn9p5ZZjAuT2ZIFROeGX+iT5KepASn3B/grHkU2b2RDHEsShCZ8A5dqDCCdNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(136003)(376002)(396003)(2906002)(6666004)(6512007)(36756003)(316002)(6506007)(966005)(5660300002)(478600001)(16526019)(186003)(107886003)(52116002)(8936002)(6486002)(66946007)(66556008)(66476007)(83380400001)(2616005)(86362001)(66574015)(15650500001)(8676002)(69590400011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7Bp8bHPo5MltiLoTRtTvm8M1tsGqopon08pflvUwQ0x3b5JCAiy+o30ngNvo?=
 =?us-ascii?Q?uYu70o2twiLcw6bVj/NgkVpMr9nmS5OQe+LtoWoAw592yXw63bE7c482AnDS?=
 =?us-ascii?Q?CEN3H4qw+66dRM1m50NH+boMmUg00OuAfdfD6np04dh8tKzFkmJqoCj5RLFl?=
 =?us-ascii?Q?VcSf7CY6GPdIx0Trn5BJmVNT5NzBKAIUo6/EdrhU7oR8IT9EwoydbvFN3MLg?=
 =?us-ascii?Q?aFoTgpuuV4DIEPgYm7rUX2I/Gi/nALhKoUHrTmN6XFeTGNMkXvupHfzV3bB5?=
 =?us-ascii?Q?sKT0QsSuwa6MqP5nh/kR7erXuzeATSIvaFF9SI8TppUZqgbM8TSbh8ZfgK6j?=
 =?us-ascii?Q?34nPUoYLk4N9C84ET/IkS5Mei6ttt4o8aUVhZbQcpgeatfh3lbZdCXQ5dTtp?=
 =?us-ascii?Q?08gue2z8uSvojfFG+jouXwu88emIUngHIpU70N8tyG9UlV4Py/Qy66DFeadV?=
 =?us-ascii?Q?iqYJdNmD3Wh+vAdtRteJRYKQVztyXoD5ybnMpmeXeK3JUYdv7fn+1tuaKuah?=
 =?us-ascii?Q?5QfzqDZW9k2AqkFxDj/pznGLfKRAMBCd6uwT99bA1O1epcNuqYlafufCPEzu?=
 =?us-ascii?Q?t42FPEB4KljgNpWUo6r76hduAB4DtWRHtBIhJb0FODuvl5XdbFl3wYllffQy?=
 =?us-ascii?Q?uELdYkmpvDrCLvyuSXc5SC9QielBASxl9irEZznq/u+Tg4G/Dc3IwUGWERRi?=
 =?us-ascii?Q?xYlmF1dfiUBYRmdt1pFd7OcuTOJbwbXbFJ/CJbtARvLdLJLIzD5TAuer4Ppl?=
 =?us-ascii?Q?j8U4mFZi4osOIkiei0848FpSy0d+OmF6hKHdzXYESJVjpjhvX94TczawPyeu?=
 =?us-ascii?Q?Q6xUQKi94oJJxnDck2N4LszTGFOKe155GLbfJVnAdkesB1I58X5+fzlSl3De?=
 =?us-ascii?Q?Psyu0ThFqB+ZX6amVnye6m2TGZq8rLSLGpVki3stV1fdfXAI9ltAuoGu/dIk?=
 =?us-ascii?Q?7H0dOzqLzbNlnj3e8EVdWiECPFKogRULaemwLm4zTf+5oQcCi4L24BHGfkFp?=
 =?us-ascii?Q?1XOIZfVzVybF5pcvbKSsOfR8aTc+lc7b7duukdbWdXffPx2zJdn505wf3FXy?=
 =?us-ascii?Q?SQRcOhhj?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4678c0c-5b9b-49a7-691c-08d8bd5e606b
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 16:13:51.8080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 178nWt/58hvz6JVYYx7OtVb7IfzonCpH5YUYYoNRAAe0t4f3G3iMtt4prrW4X/ssq8hCNUPejzMOESMoWGHdGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3284
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added security fix for below CVE:

CVE-2020-14145
Link: https://security-tracker.debian.org/tracker/CVE-2020-14145
Link: https://anongit.mindrot.org/openssh.git/commit/?id=3Db3855ff053f5078e=
c3d3c653cdaedefaa5fc362d

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../openssh/openssh/CVE-2020-14145.patch           | 87 ++++++++++++++++++=
++++
 meta/recipes-connectivity/openssh/openssh_8.4p1.bb |  3 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1414=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000..50bf74d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,87 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: upstream: tweak the client hostkey preference ordering algorithm =
to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+CVE: CVE-2020-14145
+Upstream-Status: Backport [https://security-tracker.debian.org/tracker/CVE=
-2020-14145]
+Comment: 1 hunk with comment changes removed.
+---
+ sshconnect2.c | 39 +++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c..f64aae66 100644
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, str=
uct ssh *ssh)
+       return 0;
+ }
+
++/* Returns the first item from a comma-separated algorithm list */
++static char *
++first_alg(const char *algs)
++{
++      char *ret, *cp;
++
++      ret =3D xstrdup(algs);
++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
++              *cp =3D '\0';
++      return ret;
++}
++
+ static char *
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ {
+-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =3D =
NULL;
++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D NU=
LL;
+       size_t maxlen;
+-      struct hostkeys *hostkeys;
++      struct hostkeys *hostkeys =3D NULL;
+       int ktype;
+       u_int i;
+
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostad=
dr, u_short port)
+       for (i =3D 0; i < options.num_system_hostfiles; i++)
+               load_hostkeys(hostkeys, hostname, options.system_hostfiles[=
i]);
+
++      /*
++       * If a plain public key exists that matches the type of the best
++       * preference HostkeyAlgorithms, then use the whole list as is.
++       * Note that we ignore whether the best preference algorithm is a
++       * certificate type, as sshconnect.c will downgrade certs to
++       * plain keys if necessary.
++       */
++      best =3D first_alg(options.hostkeyalgorithms);
++      if (lookup_key_in_hostkeys_by_type(hostkeys,
++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
++              debug3("%s: have matching best-preference key type %s, "
++                  "using HostkeyAlgorithms verbatim", __func__, best);
++              ret =3D xstrdup(options.hostkeyalgorithms);
++              goto out;
++      }
++
++      /*
++       * Otherwise, prefer the host key algorithms that match known keys
++       * while keeping the ordering of HostkeyAlgorithms as much as possi=
ble.
++       */
+       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
+       maxlen =3D strlen(avail) + 1;
+       first =3D xmalloc(maxlen);
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostadd=
r, u_short port)
+       if (*first !=3D '\0')
+               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
+
++ out:
++      free(best);
+       free(first);
+       free(last);
+       free(hostname);
+--
+cgit v1.2.3
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.4p1.bb
index 688fc8a..b71e156 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -24,12 +24,13 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patc=
h \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[sha256sum] =3D "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd3=
8748dafa1d2b24"

 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat En=
terprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant t=
o OpenEmbedded
-CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
+CVE_CHECK_WHITELIST +=3D "CVE-2014-9278 CVE-2020-15778"

 PAM_SRC_URI =3D "file://sshd"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
