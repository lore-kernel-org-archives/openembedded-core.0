Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.59])
 by mx.groups.io with SMTP id smtpd.web10.11011.1604486065234160060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 02:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=CWIj2amf;
 spf=pass (domain: kpit.com, ip: 40.107.139.59, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyJtaSAebqq+5ESupm7+ahzAwPGV/xlmeH6EZsbXA/lG2ojyyn91ti7+Vp+NpwTSaUAemr90nNEjBByP8J9xM702BrZsEZ2Xuh55LNOWJXufnrJjrhET68g1oiXO7Gm36bbFqU0yDTsTYMavkhea6zt/EQ+eqcxc3FpF8vtaf9bw76sl7RkYQubnL4eedHkvfPZgiVSIKKcmPqzOuTuVjDeTZzDHGQ7nluHUrBeDExT5t4hBaku+BJyw5rEcz2MD6fuL0/kx8aZvSBGuPqxn8NaVFsEvHMihKb9lS41uTjWUGNA50lOyzgoKMt4fyBBdSJiPSO0MviLGwtfol24W2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOohR0fFj51PxThYJfSPm8ykMxJHWvuaZulDkFe+Us8=;
 b=SoZq0BtaZpzNbfBansWPSxTz9NqO8fGguMDBzydc4BD8w1rTS6P49VNXlCpq4YZCOX4bcT4eUhNfr+3EHcCeK6CxoFf0/lIDXylJME9KckJAgAQxwg315EVwj2qRy8RlX3+mVaSfQH+SORT6mYqAmfGQI+ujfJ1WqPpWmD1J92cG6bu+Xdlv64rOfPMLeIxa2cAikMviYM3fM0JTuSHlhkFGa5HjEwZUDMXgY1NFfjG5DWsseDiov3UNKDcC6SeSPBHIQPsD6q7/hkSP3zE61piWJdAnhKQ1HnUkX0rp+PrBJTcRRvqqnMthe50p7EV5ZpHNM+BvQXiACfjUhannZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOohR0fFj51PxThYJfSPm8ykMxJHWvuaZulDkFe+Us8=;
 b=CWIj2amfNV4lBn365q2fIn6kvJ2PXlye1Ns0XHXqqZrD3mv+IefBJKAaGBI5yFxs1wq/EpKUDUQI9t6xPQEIa9AWqlxTjoHz1ZqLBH65E+wWn3jzY6SG1LEJ4XGbKJwS7jGvPG9OGIjXDdg2uxFjEntUEM0FhOapxzvCqb2eBn4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::9)
 by PN1PR0101MB1248.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:11::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 10:34:16 +0000
Received: from PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5]) by PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::801c:f051:cabd:84e5%5]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 10:34:16 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	aditya.tayade@kpit.com
Subject: [poky][master][PATCH] systemd: selinux hook handling to enumerate nexthop
Date: Wed,  4 Nov 2020 16:04:00 +0530
Message-Id: <1604486040-26986-1-git-send-email-purushottam.choudhary@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.51.148.74]
X-ClientProxiedBy: BMXPR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::11) To PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1c::9)
Return-Path: purushottam.choudhary@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (103.51.148.74) by BMXPR01CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 4 Nov 2020 10:34:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2bac2d88-25bc-41a2-5ccb-08d880ad2d6e
X-MS-TrafficTypeDiagnostic: PN1PR0101MB1248:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR0101MB1248873D327EEF37476ECB2890EF0@PN1PR0101MB1248.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YcfYuWYsEQlb4qiELmRYKq+E6eP+8pGUdo7BCpmxZ22ZU1nwIrDIg4C2fP1jhvdMEVBh1Mn+3N87BVz444UiOZsiyBaea1I/N49JV4oRrc6T8wd3t2nopn/HX3ermovtpKuUBO47WTrW1slu3UZ/bvJ2WFJnKICIlaBPQEOZm3YlYaMUT91mogDV+3s4UclJii+/IQ/16Fyhn0Soo6TNOsCwCE3UeHYXcRXhuX/f2HICZSRqlgWXvNwMtPBzfisZAWN3Dn0YaXRIm+UPVS7s+x8X1AICe5Q5gZWDEoaMQVy0SbsOS2D49U8SPOCCw8QyCy/6pAYzOK1zTn5vHcuz75E1laYYaOZnC5OZ+CW4a/kWJx4mNdOtisbZudRcAxBYIoq21cm1hrcKpD8DKEsPaXiN+NshA9S71FztBs9c/UYBoqPSdoEmsnajs9hcEolIlxuMoqcHdXutROsz2dJcog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(366004)(136003)(396003)(86362001)(478600001)(66574015)(186003)(69590400008)(16526019)(956004)(2616005)(6506007)(26005)(52116002)(36756003)(107886003)(6666004)(66556008)(8676002)(66476007)(316002)(4326008)(6486002)(2906002)(5660300002)(8936002)(83380400001)(6512007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	t1s4EZRv8fbaPK0YQnjozZdAOB1TA2Z+q1uJiS0SXNFMGJ9RsUYxrDBKDIqknyjZa+z/qkujD6kogP95/tyiDlXLBaW3l9aT+XtpzRWbiyD9NYgH3pgkSFaB88NDH8c4PMSOYKugnkwTSCyw7jUbCFOPnryE5oxV0FhRBs1gcW15zhILqn2wPm9AxHOdFGTifw+cw1RKds1sQlqkPFY6ZfYVJQhKENWm62hXkluW6vGdWMf/oD7vaUXJJfmEi+wB2+5L3wRRIJ++/yTMexl/ymCx53/QKyKqgKwPDJM2TC5S9de7HVJAtHtp1U5UExPegpMMZuX+DsZnKnKVO9UhlvyTCc6oBjkn1IDeJ28xzHXTVjOgnpjbkQ4vU/MILLeZZ0r+Jy5Z4qU572Yb/x8HrpU7BXeqWfHKOpChCcsZDN2WT0V7EnfHd/3aqZJ3geUe/A5uO9xX9k/ZOlNmq75d3/uwJ6hbjA5Jv96V1O0uqYtOBVlfEJ2o+ykkUFEH87qzkD3OMf9L1Yj8lVnNgLRPuJ2icJFNYriJUMNLX2T0OlSCoMCLSNrjlfE5t97sFFRGSf45WnuozMoBQU3Xjr9/eRIDHPq+fiQcgtxbdzHecIWsQrlMblP8OeVUr0kDAvzB/72Hd0q+yj7UMkFWlwbGDw==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bac2d88-25bc-41a2-5ccb-08d880ad2d6e
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4224.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 10:34:15.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5BcebV7ObwEldHEUtYChT/L/MuD+9u23ePjEOt3cHuK8/0nxSve9DMcluT878c+zEqW3PspsfRcJYefbuCzdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1248
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

When selinux is enabled, the call of
manager_rtnl_enumerate_nexthop() fails.
This fix is to facilitate selinux hook handling
for enumerating nexthop.

In manager_rtnl_enumerate_nexthop() there is a check
if "Not supported" is returned by the send_netlink() call.
This check expects that -EOPNOTSUPP is returned,
the selinux hook seems to return -EINVAL instead.
This happens in kernel older than 5.3
(more specificallytorvalds/linux@65ee00a) as it does not support
nexthop handling through netlink.
And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP
returns -EINVAL.

Thus adding a call in the manager_rtnl_enumerate_nexthop for the
extra return -EINVAL.

Note: systemd version is different in yocto project (v246.6) and
systemd master(v247) and In systemd verison(246.6)
mac_selinux_enforcing() function is not declared and defined.

Signed-off-by: Purushottam choudhary <purushottam.choudhary@kpit.com>
---
 ...elinux-hook-handling-to-enumerate-nexthop.patch | 46 ++++++++++++++++++=
++++
 meta/recipes-core/systemd/systemd_246.6.bb         |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/selinux-hook-handling=
-to-enumerate-nexthop.patch

diff --git a/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enu=
merate-nexthop.patch b/meta/recipes-core/systemd/systemd/selinux-hook-handl=
ing-to-enumerate-nexthop.patch
new file mode 100644
index 0000000..b1c92ed
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/selinux-hook-handling-to-enumerate-=
nexthop.patch
@@ -0,0 +1,46 @@
+From 92b555aaabf710e0a672a7244e8c0e3963075133 Mon Sep 17 00:00:00 2001
+From: Purushottam choudhary <purushottam.choudhary@kpit.com>
+Date: Wed, 28 Oct 2020 22:11:49 +0530
+Subject: [PATCH] network: selinux hook handling to enumerate nexthop
+
+When selinux is enabled, the call of
+manager_rtnl_enumerate_nexthop() fails.
+
+This fix is to facilitate selinux hook handling for enumerating
+nexthop.
+
+In manager_rtnl_enumerate_nexthop() there is a check
+if "Not supported" is returned by the send_netlink() call.
+
+This check expects that -EOPNOTSUPP is returned,
+the selinux hook seems to return -EINVAL instead.
+
+This happens in kernel older than 5.3
+(more specificallytorvalds/linux@65ee00a) as it does not support
+nexthop handling through netlink.
+
+And if SELinux is enforced in the order kernel, callingRTM_GETNEXTHOP
+returns -EINVAL.
+
+Thus adding a call in the manager_rtnl_enumerate_nexthop for the
+extra return -EINVAL.
+
+Upstream-Status: Backport
+https://github.com/systemd/systemd/commit/92b555aaabf710e0a672a7244e8c0e39=
63075133
+---
+ src/network/networkd-manager.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/network/networkd-manager.c b/src/network/networkd-manager=
.c
+index a6c1a39..2a9be85 100644
+--- a/src/network/networkd-manager.c
++++ b/src/network/networkd-manager.c
+@@ -2121,7 +2121,7 @@ int manager_rtnl_enumerate_nexthop(Manager *m) {
+
+         r =3D sd_netlink_call(m->rtnl, req, 0, &reply);
+         if (r < 0) {
+-                if (r =3D=3D -EOPNOTSUPP) {
++                if (r =3D=3D -EOPNOTSUPP || r =3D=3D -EINVAL) {
+                         log_debug("Nexthop are not supported by the kerne=
l. Ignoring.");
+                         return 0;
+                 }
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core=
/systemd/systemd_246.6.bb
index 9215adf..78990f4 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -21,6 +21,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash=
.patch \
+           file://selinux-hook-handling-to-enumerate-nexthop.patch \
            "

 # patches needed by musl
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
