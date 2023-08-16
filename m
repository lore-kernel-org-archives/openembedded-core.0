Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D80C25B76
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 20:10:11 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.103])
 by mx.groups.io with SMTP id smtpd.web11.170836.1692216610559862245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 13:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=E/Nfdb9I;
 spf=pass (domain: ni.com, ip: 40.107.237.103, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1FjTuiPtQFxRINYbZuSY5ugSncHaRELWTewMLwsSA8Q5P6AtMJVYHFNhCSRU1gUQ/PhdsgyFkCVYTVRBFOWEvAXN/REFMr+400rs/hD38nVhA1dyj27iciXGoKXz73xXuxyylxz7rwvigBpsJVcVi8flobQQ1gbw3mQI7kJfYfdgva2xMtAF7ztcKBkjJ+WNOACq7jZlvjNtHhVlxvf/1p/GxJzd1TOqVyxmd8anY6UMvNZaUBJ9A2jpo3ogqap20TUT5x3nUDC51XEALJ+sK/Euz2QG3b9syrzZDKNdfgaaQ6a5k5SjeSI2crnDi10O+C7ooOw33fFTaNMtRaC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDHHd6ABQPkVGtUwrAAfdu7lxktQ43NJx7kAf+JkDLA=;
 b=jrLGIlphdOVQqUjzRjpgjPcyhbWxh6NcIKGtHocEDMzbFLrp4MG+64lUINw4MS/2rPcPl9jTZBfUD2DqNXEyZbocwEoSSLiGp5IpF38LZ5N9qlpg/gRdxSzqYBOlVuEWS6a/UWZ5WEoYgPajEtSTILI0myZyD4VABhZTlPygXTz9L3myO70esn64Dw2us5ZKCJFgjSiw/OPIxTwVfSBXLdXJsMbyraj1cYAZYAHwQdwfEZVlM8szZTuOV2ihN0z3X9uTvN57DwrNTvAbIIuGvxr50v38b1VSUFMtfPQi0ObpTVbowH73yK32fRQNunb9oVP829gQl09b6HyXrJeR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDHHd6ABQPkVGtUwrAAfdu7lxktQ43NJx7kAf+JkDLA=;
 b=E/Nfdb9I6jshWk7ClUztBjjqeIafwWkNpg4ee1nirIBEtJ4/GjfU2TdoFab0QF+42M4oXCLtNnrQumnE3nt67d4p3uD84vsqqkslvbr5NCDXInreJvVOZOI4xMxWuJu6drvO89EXCn+EW1gGuYpmVq0zRkSojVBmgDCdUUnIOfg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by BY5PR04MB6963.namprd04.prod.outlook.com (2603:10b6:a03:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 20:10:08 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 20:10:06 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH v2 7/7] testimage.bbclass: Update rpm dnf tests to use do_packagefeed.
Date: Wed, 16 Aug 2023 15:08:37 -0500
Message-ID: <20230816200931.2577181-8-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816200931.2577181-1-charlie.johnston@ni.com>
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::10) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|BY5PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0cc0b3-cc36-473c-2eac-08db9e94c8a9
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t0WUZI2kXRVapvjJcAhJh04PsLu0mT6l3CiIQo/FORJzYdnyP++vASw2+UYzm/XsFJD6y2WMXHQWMMON9CPzaxlxEz8w67edvFnsLUHTqHG61J9/HH4h7BxA2oY99oBwTIHKPJPlYsB//RxxF0GDqsHeFBC6K8VXp5TGcixnMwa802aoC16EAnI4E2qbuAUTwNnDwPDtvhm7CXD4DMOIkorVn4ptUrDbDsrbWiM7b2y5Rv9mKT6rLbbrpFIi91qs12BIEgpr/P6Chaohexn4xPdB/V5MQCiON+ce9nxJuVfBOK2SU14h1LphEoKMzN+W/HwskpSmPT8dgxPBDb69Kkyba8PAA/FPzIgfi6khgwcTVxIIMMZqYZnxNEssmJy3G/spTiL16wF9sPlg4bo1MM8sIu90vC+hEL2+x/x4DEwm0B/+w9VJp/WXpzOULdNLjOUhZbOL821J1owwaGj3hUUWfBM2g4VjAdEWFxirsXH0B07X+XdCbiAkhZpFTfhhsUm+wtGvsTLntGG69BligTyKLQ7lGy3gNg0mkGsewG1IFmWkuTrJHNz/q6gXhzjy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(316002)(6916009)(66946007)(66556008)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(15650500001)(83380400001)(26005)(478600001)(86362001)(6512007)(6506007)(36756003)(6666004)(1076003)(2616005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A1ltvHk3eV1+6Kjez4xmy2+jMgjCPaMyKBKvERsFByewnRO6ps9Lk63vEz33?=
 =?us-ascii?Q?l2d0TylyLUKrs78SPUUHcTSCb9s1H8F/1/mWSL/yaaFwsF89abY9/OQLVMOT?=
 =?us-ascii?Q?OV5NJclryeTfITl49HE/enGCRvxsxrcbKAkPA2E6wtpnoPchlpdeFjVIsK3Z?=
 =?us-ascii?Q?0pmmOvJTO7L87euIBD+2SjM/6oFW9d3oOgcnP1n/jyxGCqeGmah3X2gpfBDK?=
 =?us-ascii?Q?F5HC0zGX7iNkTsuxMZY7hCUfZFC6j8fy5KEteGJZSxuk9je57vfLQyuCTQuG?=
 =?us-ascii?Q?fHLrFWXN5Mpp7u23jGf9HrdP/lU9OIARgdOwrWzBlwEkP0Jcwal3OLsjqbW4?=
 =?us-ascii?Q?iJ6NCkLF2lvpguJbd0ryVNJb6OissDBNt44ZDOAGOi/GbaU3pryQ6dPa0UzM?=
 =?us-ascii?Q?tby/zT3tkuGDw3wefZzxseOz5mms/s7jrYfMML6Cbt0E6Tjye1R0wVXmQlRf?=
 =?us-ascii?Q?KDvvZtNhhUbe+z6z1Sze07DB/YZAQK3lCj708PmRUJu1f2yshgBfCrRWGMA9?=
 =?us-ascii?Q?CxfqeQWvzO5A7oPtoOYFAhJzMA6t5gIDnuxYTvTkzMNUDXRAhx/DRExc3tU/?=
 =?us-ascii?Q?Mhvwfl8mpeYYsffqcsBT7DIq8vqx/QbHR+sLt0XmJUw21pKtn74UILhJzqRn?=
 =?us-ascii?Q?gCHalouVLB8BXK7putu+zDPKao/6O4vcX6QVwBbKTzduqrbAzqnT2GOOEHoP?=
 =?us-ascii?Q?wM0gFK3XNprAfu7moN7ytr40nNsImnAegqYj0HQf4ztWxQXP1rn7lZJ+oHLt?=
 =?us-ascii?Q?z1Fz3KZSqokK8lTfx9E5EttRn81JRi4cFuu9wvHyZwoE2QgKAsSZF3qEFOld?=
 =?us-ascii?Q?rEx1W5jjq0ZTyKSEx9LCV7nPYGT6VHbGyVnAZ25RVKes1v0H8Q6FvQLEg9p0?=
 =?us-ascii?Q?+uR68TSCvZPtvYN3undOQ/HVmI6PF6fHYpdRp6XmdKppOWpwk4Slv5kOxrky?=
 =?us-ascii?Q?HYcZ6uwUVyjbipxkL18Fr8Ra6p5Sg+qDiceCpv3r9R0ZN+LrlYY/ZfnDggjL?=
 =?us-ascii?Q?/2DdGcAMF6K8BmGwcmzwh+mbBc+gwGL6z/E3i+d7LW/J/bTc1UiMkBWTUSNh?=
 =?us-ascii?Q?tTF9cVjCObDMq5kq80qk7TLq/gqg/1u+RhmFgPlmTfADgCbiUCLiS77W/n19?=
 =?us-ascii?Q?W1Z4JBTnsxZD2cs4ZXYcs89A07bJrWUZcOqpVNHcI+wd2YK2f25my6F3xeuk?=
 =?us-ascii?Q?DCgjveeDmGJnNQUB6K/fFC1GYhb8/659bFe8jOtfdFp1ASWNKMAjXI+D4mfx?=
 =?us-ascii?Q?XJkEhDVzz0gHQdH3CfWb6vAjdXwm7VItc8optQ8gWDCBqJA3aqwan5HQumhk?=
 =?us-ascii?Q?KwB3JZCq1vaPIG/uYTNCsNPJoSLqkzIcNjML42dnB/Ri1Tk7PgFKkkMLh0x8?=
 =?us-ascii?Q?sZfi8/aFBrUsvP66Esyesrge5W475mJ64XXhE8Xv/cuAOq57kkuGrSD4KFOp?=
 =?us-ascii?Q?QuzqSp/LwcpPhvAFHUbi9qo3IpEdAD/VDpq0f+ZUOVunhSv5hx+jwtRDg+za?=
 =?us-ascii?Q?2r9qrrhSTDmdnq7wK4cgl6qUqA8LqWNg+0nFGUzIz1kS7Js+/Zykp0V19gJC?=
 =?us-ascii?Q?EoeePF5zHnpvj+0tKFXnaQ7qCuKh6jCtNczJkVMrR83XVEPshxBMqw+5o7rw?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0cc0b3-cc36-473c-2eac-08db9e94c8a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 20:10:06.3121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZ/VyzSUeo04aCaDjWDFjh3qrRgPH9M1nX+RlVoClNqX8mqCZQMXuNGNfxxd0M/fU4VSBE0q/Gm+tztdgjPU6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 20:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186150

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
 .../packagefeeds/packagefeed-core-rpmtest.bb  | 14 +++++
 2 files changed, 22 insertions(+), 49 deletions(-)
 create mode 100644 meta/recipes-core/packagefeeds/packagefeed-core-rpmtest=
.bb

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/te=
stimage.bbclass
index e3068348ff..d862e6d98e 100644
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
index 0000000000..9cb0b933b9
--- /dev/null
+++ b/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb
@@ -0,0 +1,14 @@
+#
+# Package feed containing the packages needed for rpm based testimages.
+#
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


