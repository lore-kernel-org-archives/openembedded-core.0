Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C059EE498E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:40 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.137])
 by mx.groups.io with SMTP id smtpd.web11.930.1692380911643476540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=BhgFRTHe;
 spf=pass (domain: ni.com, ip: 40.107.101.137, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQmi0RLyOChg6cDF/5QmY7PTxoupPlXpofaQ85ohaIuK4mjXGhDG9MNnzjqhrJ+7oXWdcZzA11fz/8HWkOJL74xV8UdLkPMfcqv0G3MddW0oDO13bjec+xSKwpwNxbUdSF0X7Q+H8hwC4p6R8D6BTKRiGOJsptNcR6PWo/IpcMDJjUIpr15VUEWxbXSprmNxb8r7u3eXhcCAN297w13fq8i2MdJCd2fYLvMrTzg8QTE9sR6Lf1vdODKkhaZAaQdhvj9HtUZnkDzeCy0ZWOGwxBm5926kSjAMR2wn3MiSdGi9jqYLZ0DI2UXBSos3JSA8XYUTBecwB6cSWKevV8CdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEBCUcekyudKWpV/SkR2dmXDFO9v46d8CG6o4o5odmE=;
 b=USr8Ly3WycAzna7qOWr67I75mxQAsFxH/O/Hykl35/UFYu7xppIbLv0HuqvQWRGHNETaWJRG8QlUTtfcHoF5VoCykL6mqCKxZa1sRaFRQMOz/+sxfjWLbODNAkHlE3umjQutMV6UJrY3vRc/tzTb9EG9eLg+RWtjnA8ezeFaJtvaoeAan0I3Ar+HfHzaK5Z3lpxsPqM75aK+cWhJrHjl5tzv3XSsc0g25NuN899tfg+jYsQefJeao409At6ojBCGyVx0avUHPd8sUw9jI7Bo8HMH8xzP9N4Wm8Xp4uiNj5fgwt62t4ma21nfqbVHXpj9SLzWVh8Zj20ZaUsxB9KBLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEBCUcekyudKWpV/SkR2dmXDFO9v46d8CG6o4o5odmE=;
 b=BhgFRTHe1QFM3kt3/v+VIzFf35rqapSYYsfLM3er9FT1FYcO7xJP2MWwxy1tq6zUVEW3bfkGgBuwEYpAN6rDgrq05M0X8uyY5sp36WhfzjpP84oUVYJNLDg1Up/MKblhiXTOq1/awreFahXLtJJ9oeOoRTkoeMWRlu2zYgQA9BY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by CYYPR04MB8867.namprd04.prod.outlook.com (2603:10b6:930:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 17:48:25 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:48:24 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v3 7/8] testimage.bbclass: Update rpm dnf tests to use do_packagefeed.
Date: Fri, 18 Aug 2023 12:44:56 -0500
Message-ID: <20230818174754.988128-8-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818174754.988128-1-charlie.johnston@ni.com>
References: <20230818174754.988128-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0042.namprd05.prod.outlook.com
 (2603:10b6:803:41::19) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|CYYPR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 681e7dee-06a5-4697-a922-08dba0135225
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AhtXsO+do0AWAzArHmLi/1sClhzCk29VeXr0s7JiNwvIdojha0I7KQgz9wkVYJkCIZ6aI7Unx8r5J4hJCawbNEZF2GC4r1O0esNk2j7PkHmSfLEJSIgpdOFptAjcHjs1yZdPoCy7woKy/Fvt7slKAjIckXp8Z79h31vzPNSa0zXB++4f9E8K73qDeJonr9klANzq71kbJbCd4KLI4Hy6ndBwHJLdR0t3AzPWhZOjvTzfuk6uiTYrsYarhUOkowwJTuA4Ziak2Kje1JOuNWEosaC3k/ck0XvdZOxSwBxhv9EOSqhss9LWePwMBqG+pxEke5HLmK9EZhQ0tZaEt2QoKzxR5gmw6Lr+B63nHRcR70yEGotFqPyv/p6vnSQCkMerDv3sOj6u2zPz24ohwXu061MwETRSOImqEGW99vVALXS50Wm7snHW/5/ZFBRuV2JBUm5zD6e41EWbUoh30Aw9uOImXkkYs6mo7HoPxk9eNscSoqYECbHoC5s7PmyFYqtawakNRuIU13pS7YF63JTs2fnw+GCGkgCcWtChbzXpNA4zLuNXvySf91GJr2aWNx+w
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(186009)(451199024)(1800799009)(2616005)(83380400001)(6916009)(316002)(66556008)(66476007)(66946007)(2906002)(26005)(36756003)(44832011)(1076003)(6506007)(6512007)(6486002)(15650500001)(5660300002)(478600001)(4326008)(6666004)(38100700002)(86362001)(8936002)(8676002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YrhwswTSPdeXkZ0a9wmjVK5IBxJg61hVBTq1/FuyscDkvSgX01HznNIRwQP/?=
 =?us-ascii?Q?J8lAOH9v4Jp4AZK6kVn5ZmZxYyTvQXmQVIbqwmfdN3IhFnv46PVTLvhZJ5dm?=
 =?us-ascii?Q?9lc223g/oqHjaZLlQCMfrnD8SUUfZpT3aJQQIS54zZfuWpcEHgTRcq8Cvnif?=
 =?us-ascii?Q?ECbKri9cP3QH/vv4rb7HNCm8WjMGQuGKfaSsKb2KyFicFN9Np3L3udFNZWPK?=
 =?us-ascii?Q?XNX3b9O/VFUdjjIPdNJMNofPUi69+ZDtmgigiRYUREgS6an0qLSx2v0zLFUg?=
 =?us-ascii?Q?gViYQtqV6rFbAHff7CTQumtbd+2Ef3EXwfyYc5M794dx9xr7rXQWH4+uCksT?=
 =?us-ascii?Q?utqK+LSZQoy71g0FUNe9S7CCdsRBknuLxCBC0qkj3U4Dqgq5iU79pfU7Hc2r?=
 =?us-ascii?Q?U2X2oM7yZfSKcll0EPmM8COBBHi3qVQUqwKEUCxOBIjMPTL8hI5RXlZuA1uX?=
 =?us-ascii?Q?/nkqOwrdPju4uMXsQyEHkIQHNIdNdtkH/l0hcuGc7GebRdWFs6bdjV4OII7o?=
 =?us-ascii?Q?qnTq7mtpjGegjYVgmOTUUP/MMS6wykQWpvzX7THiGLBGYwE9u6fSL4uI0HmQ?=
 =?us-ascii?Q?lBMCpUR7TPHPh5BhaA8hzv3OadjRf/RvhNywIY0nqFYlZqJZ1pd0QqP608Xr?=
 =?us-ascii?Q?bUN5qaj9acUtbhXgZYqnGBN0NgR+gpl6WJDcyB/WhLyo7YS3MPw7d5R5wvLB?=
 =?us-ascii?Q?QPqWLzrHspHqWvQ/G9jdcbfBfoSChZboOZiIjIBbgqsYobeuKxo77itT5ERb?=
 =?us-ascii?Q?NXCI8fWSmiQw5RT+2V2f7PmK2gXEy31jhap1tu3Rb9iymYxqbsaW6qm9ejM0?=
 =?us-ascii?Q?dt3bsqVETcOdZCxNXFxOo18khOpZ0hL75y7Uz0k6u3X94TdDIbtabZrL6BX4?=
 =?us-ascii?Q?cp44iQz5kS6G5Qf18jqQT+WaG6wYNC6a/iw4l8WckQLdLMg26BScxR/ctSA4?=
 =?us-ascii?Q?fzLu8NGptBmd0B9Iw8FC4j76y6gmu/9+sXTL+D4Q9AC3SDbq7zHIqqF6fCTR?=
 =?us-ascii?Q?o+q0xq3s34/mUDxZ/Lwd7j2Xp87CgjVh4f377amc2h8lPrHKc6KHmO9Ujnzs?=
 =?us-ascii?Q?/lhviCZ+AUPJ8yQoOF18OxEHarW67Risx9Dclpv9N15HGoUbIBX+8GEeyE9c?=
 =?us-ascii?Q?zMzFhCEc/L/7fnnMAaF2c3+YmjSGk8/6u6ai7CCYLIAoSdzBQZToim4mqPlr?=
 =?us-ascii?Q?vvdq7XZcwOLa+HBZqBHbrTsWH+U4D1HNPscF/Jx2Yj8CkajX7daIDmYuIONc?=
 =?us-ascii?Q?tWrlSxoPcAs+HrimoegmJHONhbHgicFbMreG2YX16y9H9N2kcxST0JxZwf6R?=
 =?us-ascii?Q?7jOqN2dSFPdTkKjj9lX3u6N9yFg1QUzPKmnScksZ9ahEGopmoai/sERiJRxW?=
 =?us-ascii?Q?3YkZ/xCpZnxJaRacFnvpuKe0DXGKkNh3e243cBkOiMPokdZVsJXTdsUXpbMI?=
 =?us-ascii?Q?WhBnweN/3ZCiECKh/GYVkVvgpso+E0oPTmurmnjn9Kq53k+t/+gis238apRQ?=
 =?us-ascii?Q?zC1CbgZ9arHW2rxd6WcK7Ydv9HAA2c6mdlmLSPRIx2sAe+oLr8qOvpKRRShd?=
 =?us-ascii?Q?BsDJinfgychCKton7oeJ87DVW2ey+iSTW8AHnwgZhAFR1mR7BxiiF1PeXUfn?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681e7dee-06a5-4697-a922-08dba0135225
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:48:24.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEljrIYSJGtUA888n1lLtUaYPcn+MW5utINhoX19kZuFVsRMjRwqKFqI1Uvq1LPYv+NTbCJkRVdqRFSxcD/VuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR04MB8867
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186391

To test the new packagefeed.bbclass, the testimage case for
testing on rpm images has been updated to use a newly added
packagefeed (packagefeed-core-rpmtest) instead
of manually moving the feeds from DEPLOY_DIR_RPM, removing
unwanted packages, and building the indexes manually. The
new logic creates the feed in DEPLOY_DIR_FEED_RPM via
building the packagefeed and links to it from the location
expected for the tests to run.

The resulting feed is technically bigger than before but is
still smaller than creating a feed with all packages present
in DEPLOY_DIR_RPM without the manual removal step.

These changes were tested against testimage runs of the
following images:
- core-image-minimal
- core-image-full-cmdline
- core-image-sato
- core-image-sato-sdk

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/classes-recipe/testimage.bbclass         | 57 +++----------------
 .../packagefeeds/packagefeed-core-rpmtest.bb  | 12 ++++
 2 files changed, 20 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-core/packagefeeds/packagefeed-core-rpmtest=
.bb

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/te=
stimage.bbclass
index e3068348ff0..d862e6d98ee 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -101,6 +101,7 @@ TESTIMAGEDEPENDS +=3D "${@bb.utils.contains('IMAGE_PKGT=
YPE', 'rpm', 'dnf-native:do
 TESTIMAGEDEPENDS +=3D "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'creat=
erepo-c-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS +=3D "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-=
utils-native:do_populate_sysroot package-index:do_package_index', '', d)}"
 TESTIMAGEDEPENDS +=3D "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-n=
ative:do_populate_sysroot  package-index:do_package_index', '', d)}"
+TESTIMAGEDEPENDS +=3D "${@oe.utils.ifelse(d.getVar('IMAGE_PKGTYPE') =3D=3D=
 'rpm' and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SU=
ITES')), 'packagefeed-core-rpmtest:do_packagefeed', '')}"
=20
 TESTIMAGELOCK =3D "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK:qemuall =3D ""
@@ -251,7 +252,7 @@ def testimage_main(d):
=20
     if (d.getVar('IMAGE_PKGTYPE') =3D=3D 'rpm'
        and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_S=
UITES'))):
-        create_rpm_index(d)
+        copy_rpm_repos(d)
=20
     logger =3D make_logger_bitbake_compatible(logging.getLogger("BitBake")=
)
     pn =3D d.getVar("PN")
@@ -459,55 +460,13 @@ def get_runtime_paths(d):
             paths.append(path)
     return paths
=20
-def create_index(arg):
-    import subprocess
+def copy_rpm_repos(d):
+    rpm_dir =3D os.path.join(d.getVar('DEPLOY_DIR_FEED'), 'rpm', 'packagef=
eed-core-rpmtest')
+    idx_path =3D os.path.join(d.getVar('WORKDIR'), 'oe-testimage-repo')
=20
-    index_cmd =3D arg
-    try:
-        bb.note("Executing '%s' ..." % index_cmd)
-        result =3D subprocess.check_output(index_cmd,
-                                        stderr=3Dsubprocess.STDOUT,
-                                        shell=3DTrue)
-        result =3D result.decode('utf-8')
-    except subprocess.CalledProcessError as e:
-        return("Index creation command '%s' failed with return code "
-               '%d:\n%s' % (e.cmd, e.returncode, e.output.decode("utf-8"))=
)
-    if result:
-        bb.note(result)
-    return None
-
-def create_rpm_index(d):
-    import glob
-    # Index RPMs
-    rpm_createrepo =3D bb.utils.which(os.getenv('PATH'), "createrepo_c")
-    index_cmds =3D []
-    archs =3D (d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or '').replace('-', =
'_')
-
-    for arch in archs.split():
-        rpm_dir =3D os.path.join(d.getVar('DEPLOY_DIR_RPM'), arch)
-        idx_path =3D os.path.join(d.getVar('WORKDIR'), 'oe-testimage-repo'=
, arch)
-
-        if not os.path.isdir(rpm_dir):
-            continue
-
-        lockfilename =3D os.path.join(d.getVar('DEPLOY_DIR_RPM'), 'rpm.loc=
k')
-        lf =3D bb.utils.lockfile(lockfilename, False)
-        oe.path.copyhardlinktree(rpm_dir, idx_path)
-        # Full indexes overload a 256MB image so reduce the number of rpms
-        # in the feed by filtering to specific packages needed by the test=
s.
-        package_list =3D glob.glob(idx_path + "*/*.rpm")
-
-        for pkg in package_list:
-            if not os.path.basename(pkg).startswith(("dnf-test-", "busybox=
", "update-alternatives", "libc6", "musl")):
-                bb.utils.remove(pkg)
-
-        bb.utils.unlockfile(lf)
-        cmd =3D '%s --update -q %s' % (rpm_createrepo, idx_path)
-
-        # Create repodata
-        result =3D create_index(cmd)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
+    oe.path.copyhardlinktree(rpm_dir, idx_path)
+    # Test cases assume only arch directories and not a top-level repodata=
 next to them.
+    oe.path.remove("%s/repodata" % idx_path)
=20
 def package_extraction(d, test_suites):
     from oeqa.utils.package_manager import find_packages_to_extract
diff --git a/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb b/m=
eta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb
new file mode 100644
index 00000000000..cec5458a8bf
--- /dev/null
+++ b/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Package feed containing the packages needed for dnf testing o=
f rpm based testimages."
+
+inherit packagefeed
+
+RDEPENDS:${PN} +=3D " \
+    busybox \
+    update-alternatives \
+    glibc \
+    dnf \
+"
+
+SKIP_RECIPE[packagefeed-core-rpmtest] ?=3D "${@bb.utils.contains('PACKAGE_=
CLASSES', 'package_rpm', '', 'is intended only for tests where PACKAGE_CLAS=
SES includes package_rpm.', d)}"
--=20
2.41.0


