Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.59])
 by mx.groups.io with SMTP id smtpd.web10.784.1617211293225721036
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 10:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=K8P3/Xn2;
 spf=pass (domain: kpit.com, ip: 40.107.138.59, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQO3lJ0Eewr7HhuEc0OMvKdRn9D7dbXVaOkcdvPjiuewI+0X8a0T2xP4y2BXbhXU27iuslzRkMJEF6TNcghOoUmYbMVkVIvZObjn3vddQB7zGYIApsiI6hMUA8IBRUFIdIXk+EEhOzREjXkl4q+wmo0V+iw7Lc9Hk33irnelqDqfeAiWElMlkYp0FIwoLNmQAqf3dMhVav4VMBU4OVthoYTJbI968xg3UzBj3cf+uplBjMFOcYKwWhPtauEtIRElZ5JIRZl80rs2caSHk5hJaPy8QaeDWCSMpqj/0LOkWDfNSlFdGcvoWAmu4pG8v72ZewUxeTFnreR5qS+kQCP1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhuYv4goF9nim0b6cfRCEhjw5T16SIKf9XiHzRfILi0=;
 b=W8kYDnqS12M7I6FWscrC9BbkfGCbLCXehY0XIEpLhO9l8g/4L06Yd7oJAdMaWhnzL94cjnNOReTHPxwxi7fj0IuGAL/y261NcUYk54bzKlxD063cqToyZYvUzoULw1Ds0/S0QJZcGuXSyY9oWw+WbDGTaFc568QPQzbl3vg3wWQVt7PmuLj6i8h2hr49XepJa5FprYPJZ6Oys+78xY05uE23n4ajXkPSLGV9T3yfb0Q+9Pi2V2HVTlEGklbam3KIkv7CdVIY8wG6BwfUhGS1iJCMsNSejcJCjXBa2gbsWkQ4gI9kGJja43f1WO88xDxb+PL2hkxkBHgCXQ1qjkR3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhuYv4goF9nim0b6cfRCEhjw5T16SIKf9XiHzRfILi0=;
 b=K8P3/Xn2O6/CfASRjNeNQhIOqhB0jjYqK+430H7dEOctmj5yleiaoMH1atn/3bqQdDsv3Q7bIsRHna5FPN0Ig9lXvc82iKtKhK5w/xE2vlRbRxIfPCTfRStnisG7M36vPVTdyd0/Xz1/Jy9yVOCRThVwF7H4N6bNv73jkdihCek=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR0101MB1441.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:20::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 17:21:26 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 17:21:26 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Purushottam.Choudhary@kpit.com,
	Harpritkaur.Bhandari@kpit.com,
	Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14145
Date: Wed, 31 Mar 2021 22:51:04 +0530
Message-Id: <20210331172104.11877-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5020:ea34:c967:f6eb:e575:7c30]
X-ClientProxiedBy: BM1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::18) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5020:ea34:c967:f6eb:e575:7c30) by BM1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 17:21:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 823b9c22-ce66-4a90-a510-08d8f4696a07
X-MS-TrafficTypeDiagnostic: BM1PR0101MB1441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR0101MB1441252AE9219D4E49D93752997C9@BM1PR0101MB1441.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VkIP1FCviiJ9uTHiFWGItNTBKNKaGZynczv2wKuOh0tarWSecfDIBQKdWhlC81i7rlYHfaETj3I8d108ZXLBshQxD4fXz0VaMtbiWCiqIdlWOKV8L1LpG/462jZQliYewwNy2bPAV7I7CfB6q4QL+CnXB5Jl/3DaKBduwiY6dklRa6QrQk+E50lV7GmXZfGifg1NOMfRAMN5K5XJ27a+zY1BaSFn2WhMRbbDpqPkgeWLRjLO7WBkXmu41WJydkOTQfGSGzDNbaCtY8Lib1G3/XvsUFh37ynL7CSYv0RJ0LbVGBsHEvIOBWVO0xDi2xdhMrAehLcA39ifNjEQUcD/PJNynyZJUsrIZTjmtAet1a0Z7w+sL1l8V1riLssnDpFT4g0f963P+JQmWuvzoN6kYhxOKlzZNlmdMujq8jZ4E/Cv+T8+19RGQSe75R6IQnzbxsLTN7Rs7OuYwrNTtUbH2T0IXehGYb/V/pg7bESs4Fz0nolqvkqraL7Ssd2bYUhlcnlkfEqJaio2P7ct7mQCRAJ+2saDKr+9Mc59Y0g/o/y8R7Nl1apsPfn2JR7FXRHLSOUEp5blsoZQeYMBMpra2s4pmYfwm5VXrMBTgTMuL09kE6vPu6Fbf7axpToSuOGZ4k9lFOp7nYlS7hmbe/4TyT6tfa78ca770R30Dfo7fzIq3C8tTiRdsl3ASMOR+CU0bN9IzMidF6v9GR/Lk/exSBVsq+2SU69Urm+87RDvAgUNTOc4N2MgzZRiwqKSHePmthlLFfeF5R+b50VAPibS/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(39840400004)(346002)(66946007)(6512007)(66574015)(2616005)(6506007)(8676002)(316002)(66556008)(52116002)(6666004)(4326008)(6486002)(38100700001)(5660300002)(86362001)(2906002)(16526019)(107886003)(69590400012)(36756003)(1076003)(186003)(8936002)(83380400001)(478600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?zaPViGcp+cJ7GWLvOT6hyPtZMx101DrfWVAVL2zBRgg5bzg1DFrYm0JXts6Q?=
 =?us-ascii?Q?DkHMljrxq3W+exYwzRl1eqMnmn8Mo+nyvxPRHt4QDrjzCua/wEd4z77PhaUJ?=
 =?us-ascii?Q?mPlOfKeQlEg3+TuXdA5mnzdqT7p8rBXycjK9yHDj+0rMZSEqH2QN5Z3GXIEX?=
 =?us-ascii?Q?I+HIIvFqui2U2pWxRf6mXY5Tr7ctD/mqauto0srnXPXFuVeIWjNY8tzsOJ0+?=
 =?us-ascii?Q?gFG9t8UTJxlxBHF5nR1oB0M3zWCi9DtAKNtIBD/3Qw5JXQDL+SWI7FjWJxU1?=
 =?us-ascii?Q?sN1oP3RSj7RIhjBsoLSDt2FSIJTkYsWlJKaWZqiMXNP/UgGW85ZAydhylgq2?=
 =?us-ascii?Q?952XTH2TQhvDkTY8zZW9CUbNEybTGUy96s72H8+gwz+q/Kc8XFOvkwhtRmbm?=
 =?us-ascii?Q?Um+e+ugT9ByEcDxcrlGKFXCKGuQAj+wzQFkDnHOUlLGjoszJASkrAGz601ZX?=
 =?us-ascii?Q?l7OktNJwIDrYwRY/1ADH5OlzDL3ZO49hR41+yGxpI2clraZMg/JQOEdiJfcU?=
 =?us-ascii?Q?YtCzzv6xDIwmX4iIKJvG1+glp+uNcjZb8/nbyY70rtZfpHyE3PVFHoTxeH6u?=
 =?us-ascii?Q?hkk8czTTMWmSR6JV1gjATYBOo6rwlbIH3LWlmWNditFakbxGvek2S0pjR68G?=
 =?us-ascii?Q?LahDt2+1siJn+DktLPs9UQWOM969YacLG/xahzQSQuu0KW5uApKdW9WeRrgD?=
 =?us-ascii?Q?v4W5CzhhP0eq1r845xgLmUn12shtmDaKHcQVnD7B6t6M7oCQlS4D0Kc3LJG3?=
 =?us-ascii?Q?sRM3S+7NGZubnyaCy77Fq3Iddib8zYejzw5mSPtFnJ71cVOlfq0PYqPT+XWH?=
 =?us-ascii?Q?X8ZidOh6okjogC1iqKFzfyvjdvWgAMSsuobtllZmMgrvB8e7AZHjsj+Zps+9?=
 =?us-ascii?Q?5YjW/SjObWsX6al4STXEUCkfxbk4APn0xR8nN0xCfxKrm99j+1hvqd+3fCOL?=
 =?us-ascii?Q?E791BjJ2A7l+HroTo9y3zAAkzeEn+IixheeTOqnOPVvKRnP6InkzhJNJ/Ise?=
 =?us-ascii?Q?r+gtcS9DVc82mnePeUj/aLHqwjceuySZ6K4eQwHU48touZQI2YCnCWbmGIkg?=
 =?us-ascii?Q?MdnqBy6TMXa0Y3KJMmwx14nlokspijs2/5Y/fe41aNiG9F2ucBJzYFjfGLmH?=
 =?us-ascii?Q?8Ftj3m5zFzK9YeSG2KCfsU6Tu+tAp6JnusCHKrQ4BKgfaXmRkT27QhN+XJWA?=
 =?us-ascii?Q?Ql/1o3Yo+66VHuvxqF0jcQ2x4liEvWJRHOLfMbzoXloanZ6f/3OFHnbxFojj?=
 =?us-ascii?Q?oGeCmo0U0Fsbez8ybMRLbksA6noC80z3C5sVvIR+Yihz4g/co7tH6/rvVKKm?=
 =?us-ascii?Q?hjIq5boirOfwVIC1P2CwqKCK+ry7IePqCWDI2jAFo/D7JgJct84ILUNfGHCQ?=
 =?us-ascii?Q?zNOpqypLiHI4kTIrSyJGvHuy1Elsjhpk1O34wl3sqE/6jeG/9w=3D=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823b9c22-ce66-4a90-a510-08d8f4696a07
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 17:21:26.4142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85CSo28rOE7p2O+6ANfbQacTP8LVfCmp5S7XvB5FC65LSM8SHiWQPk9iorHMBUG0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1441
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: 38482edf1a31ed0735b746cf0ab3e1adda4199d1)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../openssh/openssh/CVE-2020-14145.patch      | 90 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1414=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000000..0046ee1a51
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,90 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: [PATCH] upstream: tweak the client hostkey preference ordering
+ algorithm to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+
+Upstream-Status: Backport
+[https://github.com/openssh/openssh-portable/commit/b3855ff053f5078ec3d3c6=
53cdaedefaa5fc362d]
+CVE: CVE-2020-14145
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c60..f64aae66af 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
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
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.2p1.bb
index fe94f30503..17965557a7 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patc=
h \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff=
8bcebdff64e671"
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
