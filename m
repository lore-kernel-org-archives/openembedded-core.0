Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.3030.1605582966297078983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 19:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YuvzHSaX;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddtTqYL7aBPhHjPaVxfEBZ8Dn0Cf1kaqDZTafpN9BTJvy6d7edwMBTF9I8w8TKfl9cvv6tc18YCAN3QqFbwAFH3zbitfTuxYRXgHF5sY3MuGW7pwywSluVQaw624dBgw/yaN7ft1Gr7F5e6TzzYMiv6Ol+tP1KL8I8GuU5J1SMoN+QhN62xnSqBkGypDsi4IIy6YKk7LKp3pz/ijabGX0G6A2o4mElKhGV5rW8MPUsJoXJ1AjYak5jKYBMvDH+kMoLwUPGSSSvURa5l5aSQ51tlz1WxgCUlKT1jSzydzoliXrtO80xLxWSdZOs1W8Fqt+Y0sC4BIFybMkV9aR/nkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIX/LFA4UrKdhswBENPIJkeUG2pV8ps/3/xFPvLk6II=;
 b=eWgdL+Guk3XSRviIwPSkdaINXFBdqRGI7gLA8ejQ0+XFtLF814WFml1W4kSeid9kgW0/GTO8J4lv/DfmwV610x7LUtG7I02dGSQZVjMMqMkVlZ5hTcSYH0lNofvmDnZew9Bf6gnzZIrrEmpnmbzOW+KqOz+pmpA+WJf3JD+ub3XzTdMZEIEalXt7qLldRCyGf6XE0pCjvD0B0A7pv8vdsEFkRrL5r7uVUabitLUStaXW4pum6yJttBR77VOBpKoz+XX+cPRASMUmWEB9nwRJVIQJHqOckh1t5e5jbWME5u2wqWJxZUv1mHnB4OgEgJYn+Zs6NNj6SyiKjHbNiPAJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIX/LFA4UrKdhswBENPIJkeUG2pV8ps/3/xFPvLk6II=;
 b=YuvzHSaXqoWWZv094L3jSCY32hB7F3jqZkblTyv0Xq/ARADZ7+3KLbWLTren2D75kABkwA8gdAk8aIkathGc/mgId5nuSTFwTqe6XOWgrDZL8mW7WClNiNKgxVKxFNqw3UQ+f/0fsh704qOGEEFX2Zpovw91MuELmNsMMAA98Kk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 03:16:04 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 03:16:04 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: ross@burtonini.com
Subject: [PATCH 1/1] sudo: fix multilib conflict
Date: Tue, 17 Nov 2020 11:13:40 +0800
Message-Id: <20201117031340.29809-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117031340.29809-1-kai.kang@windriver.com>
References: <20201117031340.29809-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0001.apcprd03.prod.outlook.com
 (2603:1096:202::11) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0302CA0001.apcprd03.prod.outlook.com (2603:1096:202::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.12 via Frontend Transport; Tue, 17 Nov 2020 03:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b165e72e-5964-457e-62a6-08d88aa71e0e
X-MS-TrafficTypeDiagnostic: SA2PR11MB5019:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5019CE4722F6EB548A0BFB6895E20@SA2PR11MB5019.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sxIGlBceVXd3q8/Kl2dhYITNh7KoTC79onz1rvRRWbLTrdkB0uFlX7kxtiRPUgGkNeIymNDMgLjGHitEjqRtxHfLMQXhtswqnF+nK4hGoNDR7NtCumuetxuaqCYVOnzr6z1LThsoy37/L4x0zm8IsgZoZhQG5FNPeX7aRyWIOaJUqaB+iymMHKEIhb/7Ib/dKYOjSeDIqjJyPLn7so/EcxPVFG98XOyyns21LVOIYPwxhERi4AxQ+2T1NT8Nt/cIuRJw87/hUH+Cpjl+8o39KUsTuNHeJ4rtlzvp1MwHWzczHH/K3ul9tLcrzgVAmJYbQvMjwTAjNxlkZu1JLzzX6/LPuik5nGGDRMejPj6KLX+NuMqgUo+pk8GgW/MIQTSR+aBROBte97iHuD3ep941yA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(396003)(136003)(2906002)(66556008)(16526019)(83380400001)(66946007)(86362001)(66476007)(26005)(186003)(6512007)(6486002)(52116002)(6506007)(9686003)(316002)(478600001)(2616005)(956004)(6666004)(36756003)(6916009)(4326008)(5660300002)(8676002)(8936002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	by0E62Kq1t6lXXQ2ZW3qPei1pJCTzvYOfNlPL/0JVakNLybw/AqJ6GUGpmx4wbPJem5E7BcPetlQLbPfF9xw/ZJ/oEW/r7DFcRflIj5M2Zl1sN4ZKPJdzdIa2mCPxSC+ybeFGaLR+hhtY6+6s8iFR0bxv/clFBE9wokGd/kgmRc5T3DtEvc1QwVr34Jq1GxZuW6DJLHkW8JvmFK1n9EUAnFmLAIXc7PeRgzd/7EfWKGkrqs/5Sjm7gLBQ1LWvGR7/YXjeB6xC0JAvX8LJvxsj9Wy0Y/xE5UdwAmGQD84f+8E0F6WmvFZvZnMoqxEqAafWG//82gnClXfLbnAERV94TqdyFn7ew9vjDxpqQgYAoFzzwishm7UXyo2tG7tGHeovurHQuzAinIAUDZPNHNJigTFHR+xB10MOnVC2YoHOpRYks6WcSLAzADPOVSjN6k+S2+SKPdO4XdPtVbhf3L8YF+APnQxKDvBfstwXjqs4PvXeu8wwlQiXBt5lP11v94zqgE7FffUcIcO+Q3vONlNw9Vjk7x54VIP31ScLfurIE2cIHqDxNazOlX8wO3U2iOVMHBpCTG46Zx92GT5QDL9CorpNdZ1nKMcKQhEPNGVM/L1qv/X+UIEZOZywrhCqd1fvYFWj1dCdoRnqaBqzFJ77A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b165e72e-5964-457e-62a6-08d88aa71e0e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 03:16:04.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSoam/6PZRmCSg0vdoYmIdUL0JAlc1DweT0GVK5hgxOfUK2AIBwRMpeH3JjQPFQvwDDa+qWSnqF7amJ1n9VgLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to install sudo and lib32-sudo at same time:

| Error: Transaction test error:
|  file /usr/libexec/sudo/audit_json.so conflicts between attempted
     installs of lib32-sudo-1.9.3p1-r0.core2_32 and sudo-1.9.3p1-r0.core2_64
|  file /usr/libexec/sudo/group_file.so conflicts between attempted
     installs of lib32-sudo-1.9.3p1-r0.core2_32 and sudo-1.9.3p1-r0.core2_64

Pass ${libdir} to configure option --libexecdir of sudo that it installs
plugin libraries to /usr/lib{,64} rather than /usr/libexec/. Then add a
patch to fix multilib conflict of sudo.conf.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 50 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.3p1.bb    |  6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
new file mode 100644
index 0000000000..cfac926731
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -0,0 +1,50 @@
+sudo.conf.in: fix conflict with multilib
+
+When pass ${libdir} to --libexecdir of sudo, it fails to install sudo
+and lib32-sudo at same time:
+
+| Error: Transaction test error:
+|  file /etc/sudo.conf conflicts between attempted installs of
+     sudo-1.9.3p1-r0.core2_64 and lib32-sudo-1.9.3p1-r0.core2_32
+
+Update the comments in sudo.conf.in to avoid the conflict.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ examples/sudo.conf.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
+index 19e33ff..af78235 100644
+--- a/examples/sudo.conf.in
++++ b/examples/sudo.conf.in
+@@ -4,7 +4,7 @@
+ # Sudo plugins:
+ #   Plugin plugin_name plugin_path plugin_options ...
+ #
+-# The plugin_path is relative to @plugindir@ unless
++# The plugin_path is relative to $plugindir such as /usr/lib/sudo unless
+ #   fully qualified.
+ # The plugin_name corresponds to a global symbol in the plugin
+ #   that contains the plugin interface structure.
+@@ -50,7 +50,7 @@ Plugin sudoers_audit sudoers.so
+ # The compiled-in value is usually sufficient and should only be changed
+ # if you rename or move the sudo_noexec.so file.
+ #
+-#Path noexec @plugindir@/sudo_noexec.so
++#Path noexec $plugindir/sudo_noexec.so
+ 
+ #
+ # Sudo plugin directory:
+@@ -59,7 +59,7 @@ Plugin sudoers_audit sudoers.so
+ # The default directory to use when searching for plugins that are
+ # specified without a fully qualified path name.
+ #
+-#Path plugin_dir @plugindir@
++#Path plugin_dir $plugindir
+ 
+ #
+ # Sudo developer mode:
+--
+2.17.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
index 08a0fa03a3..ba61a7f247 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
@@ -2,6 +2,7 @@ require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
@@ -24,6 +25,7 @@ EXTRA_OECONF += " \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${nonarch_libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
              --with-rundir=/run/sudo \
              --with-vardir=/var/lib/sudo \
+             --libexecdir=${libdir} \
              "
 
 do_install_append () {
@@ -43,5 +45,5 @@ do_install_append () {
 }
 
 FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
-FILES_${PN}-dev += "${libexecdir}/${BPN}/lib*${SOLIBSDEV} ${libexecdir}/${BPN}/*.la \
-                    ${libexecdir}/lib*${SOLIBSDEV} ${libexecdir}/*.la"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
+                    ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
-- 
2.17.1

