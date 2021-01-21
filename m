Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.85])
 by mx.groups.io with SMTP id smtpd.web08.3718.1611212555675224830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 23:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Rs8gbsne;
 spf=pass (domain: kpit.com, ip: 40.107.138.85, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMjx3tnfRTpyiNLkJ4D7Vze2R4gWoCOLryFW7/vjynS9Ty1xmW/xbZdlsg8rkZY6v6Q3riF/UFlAvUvymU9IEyH70SiSukiD1vmytFoj8dFkTODxpB7XCqW0PqrQ12qL4jqAF9pTxfcvUvq7O9dHYk62b9Ei3AEuh1Csp6Bz565pOYUNV6PaljczynZeCQ70Gf3leoZxKkEWZmIkcroRjiceRxG+9ZMB+C/3/RC6+S/F+P4RZYSuLrS5sGL2WvidC9QYVX+JpTEF2Pt+tvvUQzpVp7N1INuOWhOoSoCCqj81LLA8UTTDRUghbLpy/jz2SCmCdKXEBLx2pOgAvB/2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv9xWKsClBq8hpw/T2i6RRV6NeG8nO/wKverESk/hCw=;
 b=CPPh0q46+HN+qC+VyV0SECLj3KksL9Qpd2XFvyx2X6IzwpN6ksOoALSqSXwGKyYFfu9BvUDGPAsYD1XVXJRLVOvwzcC5lwNwaMsH861verNMkGRYmVCjceF83Uq4mzF9Hb+mpLVrUEMO2AOQMpAY1PaKyBeqOAYkeI9hTBI+ZsTj1W9yr2FD6/Uc/KvGBC9R86VxNhDzixGSrnRxfiXVkIZqZAbl6Q1ga6GYz/7uVOsl4SkvZ83pOjVGzZWzRnOjFDi9GSffRXzoFbuJWydzAxPFBoxgJn2h70WdnSkTBu6zirCg+Kpevy5Uw1dl+CN8B1b7OZTjoHHkvg+DtnsWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cv9xWKsClBq8hpw/T2i6RRV6NeG8nO/wKverESk/hCw=;
 b=Rs8gbsne9VjU6QJe6FpSUjATc48Zjns9UtCK3CB7yqlBmcPIFHX/Rdxwr4w8fJXP+8KzPOshw3IPoiiXRU1OzcQhhQw77TGrbU7mgZWWFJpw3GS16fCg6Q36vtChBkInydWiLTxNxVujhXUOlt7C/L+L56LZbWN1667qaUHCfys=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB3282.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Thu, 21 Jan
 2021 07:02:28 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d1e0:16c8:df47:e868%7]) with mapi id 15.20.3763.016; Thu, 21 Jan 2021
 07:02:27 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com
Subject: [poky][dunfell][PATCH v2] openssh: Added and whitelisted security fixes for CVEs
Date: Thu, 21 Jan 2021 12:32:17 +0530
Message-Id: <1611212537-31570-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:2d87:ad18:4068:42fd:40a7:5718]
X-ClientProxiedBy: MA1PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::14) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:2d87:ad18:4068:42fd:40a7:5718) by MA1PR01CA0098.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:02:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d2c5df0-71ac-4610-ba22-08d8bdda8283
X-MS-TrafficTypeDiagnostic: BM1PR01MB3282:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB3282FF97FE888BF09D31773B87A10@BM1PR01MB3282.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:95;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tWhRxzY1p2MNXRTA/gmVL1i/UDxzmx4P/A2eHf9O6hpxF0vz3fIxaJ8ijLnpqka9tCAraIcutoTHJaTaiwKD2kCIpjZ9w76gwwI+q4hdfDQDUnAvGA+cMfbbT5IY4gzj+Qav2fxkPsfNmrqfhJUul5D5j4fiDSk2NsACL9HfzkEO6g8i8wABvG+31G1TZ6quLcIpLAxFU/sxnzb7cnAzozUB99WocPg4F0EUC64bytAoaT2xgC2GgI3LRwK15PESg90d15fI3YHYEPI5oJ657iv9BpT2LIHr7JlovCVjKIfiTXwLXXRrehtvZjQhyOhjrzpFv+MqQsne0ThJ7RBwi9R1+dw402GKNIcXPttSJVwf91y4MZXf2U5ob0j8xZBMmZDbbF7d5MAfs9tCu+bY9eQdylqkiM5bwqGnI7qR+WSYbSC79PYmsHNfFqv6p9KPqukfrEsbdrpoTErQA7E1vNwt6gR56oeXsj0HT33Q9yobA7IRRGCnPXztwwAr6ED76MNx+6kfsR6gxTZhL5ZsPpCto3r1C5nkOnPzq63PT9Q8UjF/oCdl1ia14qWbjYEJU7/noe2h5ifBtAew/awzj5yHVequuLPuBRoP6dvhTpwJidIU/a20wBgn7lv8J0LCUm5y8yk/v8pAvtvSJJo41vAN1Kz/wazdcmywqybEQ/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(66556008)(36756003)(66946007)(186003)(86362001)(6512007)(6506007)(16526019)(69590400011)(966005)(6486002)(478600001)(15650500001)(2906002)(66476007)(8676002)(6666004)(66574015)(83380400001)(52116002)(8936002)(316002)(5660300002)(4326008)(107886003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JQLTxOlz9KvOvunt09e2ROZXjyBaIfp4F0D/uL6WtbCTN7j5URVukDgpV7sO?=
 =?us-ascii?Q?6XKhHwNqcNLretkqpVuXxMcf7u+K1foZK4pFQv7I6DcnuU58G85VSUHENBZw?=
 =?us-ascii?Q?u9HHAdP+gqauNXwuitDCTuSeQ7c9zy+4u+2EQuD0bDUYSGmD9nIOdOP9bqAZ?=
 =?us-ascii?Q?FaDY1J5/RPtDnKgtbUL81c8/5H1XeoHOQbL9+qOqmCVPCt7Gp6G+gl8GF35f?=
 =?us-ascii?Q?qO9kAPW9xCNSTkjbaHxAg1dZBeudunn5g9IAiW9+S9REb3OQzOMU5mSDyy8/?=
 =?us-ascii?Q?QlDL3QP+vzfF3V/jrScUpUotqRiDuJZ3NlSPsnoxawERbzUXeKkjSh/8f+Cj?=
 =?us-ascii?Q?nvXsHmh2aYsKS21VFi7m5GWEVafB3CBGZKkSDOwmJTKG2HhllXp1i7lUblcc?=
 =?us-ascii?Q?sF+6tQhQZNpYrn4nYCidNdutSEfJr+/Clvrn7dAsDiHNWKId+8T8uTiQqdrR?=
 =?us-ascii?Q?bG99HKYFYPrcJ+CRz7Ovcpqmfrm5lYRLbEm6jX54BcBbuwjkKcxKvIKKCeIq?=
 =?us-ascii?Q?ZZM6Fj52M5Zs6i19ZrfrKwm5JjSF0rrCkoNuWc7ALr3sgLQ+Qfhx6Bk96EyL?=
 =?us-ascii?Q?nQPOT+x9dJ5Sl8TUeBqyX6c50unFeTdgXifeeioqEhmmmBum52EdBpesTu0q?=
 =?us-ascii?Q?iwoSQqd5m2TAr5OLIbLwV3/ldwVdiIr/Z3PO2ySB5fy6PlCvQbrXDM2XA+d8?=
 =?us-ascii?Q?i3hUytVVr3CeaG+W8QD6R3jbK7kauN8QfWEBDpYkf4aVzCH1PMSQLAlUcEoO?=
 =?us-ascii?Q?Jf7mh5Rsg3B08x81Bvk0e1T91stAhCrQJfTISf3lib7IoSZZghHoMWNA2VBY?=
 =?us-ascii?Q?JRl7tVnoYPFhewLj+x0hGC0u9Y+zEl+8cT0lKLtUzEMSObUhW53pLDgwddOz?=
 =?us-ascii?Q?7W7SKhW8BT60UckZ9JhovPYOiT9EzVLJh2Ip0P+fjbiC1AcbfDAOyC5TJPGn?=
 =?us-ascii?Q?b8jSuMjWBfk48X/uHmFXDC/ZhV682n3IPEU/g31t2RKESIL+d+IQKimJksl1?=
 =?us-ascii?Q?JHv+XnkyFEEa/D6QHShV8qFX/wb8mKyjQnaWGsi4+t1PnTVIeaj1gxdX6hRG?=
 =?us-ascii?Q?UdH1Krz2?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2c5df0-71ac-4610-ba22-08d8bdda8283
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:02:26.6144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: deo6M4NYh7kiyyHJt8bk9uj7yPcH77jETU+kIbq82AHZBsasNSmPU9PlUdmjVBy0jTX5qD0JSJL8LG7Z6j5P9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB3282
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added security fix for below CVE:
CVE-2020-14145
Link: CVE-2020-14145 [https://security-tracker.debian.org/tracker/CVE-2020-=
14145]
Link: https://anongit.mindrot.org/openssh.git/commit/?id=3Db3855ff053f5078e=
c3d3c653cdaedefaa5fc362d

Whitelisted below CVE due to negligible security impact:
CVE-2020-15778
Link: CVE-2020-15778 [https://security-tracker.debian.org/tracker/CVE-2020-=
15778]
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1860487

Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
---
 .../openssh/openssh/CVE-2020-14145.patch           | 88 ++++++++++++++++++=
++++
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1414=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000..e02e8d0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,88 @@
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
+Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
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
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30..c3b3647 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,13 +24,14 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH=
/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patc=
h \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff=
8bcebdff64e671"

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
