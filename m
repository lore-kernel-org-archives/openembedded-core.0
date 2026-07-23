Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152E5C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:11:39 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18795.1784794286963932835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=nifRXY+C;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYU/dVxv9rP+6qr3u0z0HAgaAnPqr31zJTffCu4ubO72UU41vnp19+omNtXXgj+GPCYrt5EBCMihUSJKfK3lyfALNFxjW3HojCXLoCQ1V14c/zcjScDb7HUS6QGL8Hf5K/8PvO3aAa/hX5+4F+QkUO5yCBW8+mQJlNBRCaeEESgH5j3+nL8aKcU5u4rLPdU/83u129BnQ4wBaXC00BZ8nAJygEbHlTbNCCvsHLZ5WTvBJc2diliybsRLLEID5bc1R4zLdGsqiP3hWPUmcZs1otY0vVwinxJKdN98yrN5LydpVXMubAZI9w8NeRxUmHqoJW0ULPpeRy1Ds1XClKdB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq9ZO7jNxShRdTtNupaMSsnhfAFVXlXBEyaRApRWRx0=;
 b=kW1gCElGhpb+nA5rk0Qzm4hunqrrotZVXvtLuhRRKsbgpENGVDbqH27PBBXX50uWXACZcKMOi1JLL4VCnH2RLXstGHiP8+SH7wv6Cv1pDe0ckEWtzigNnFH/jncJ43YsWqy5BDsGlO+f2x1BSBAmhLEHpNAdH6DeNirCVjzs0LfyzjmKmN/u2pGrb2wOEq3Yu8Aqji0oSzcg2oGZVv7ZtEMpgUTCld6o6dd/mWtXEZRVJsOsP7OfJ3ozfaKjzZoUz3Y1TNn/fGomzHgFY+1ZU+Z//ViO6ICSrcNfB7MnLwzY5Hi71p2cspujlxFugzSdVz11o87iORDuAdoUugFM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq9ZO7jNxShRdTtNupaMSsnhfAFVXlXBEyaRApRWRx0=;
 b=nifRXY+CO9lA/5n33PH8cxGF//Qagu21WHJEhpYllu0Ty3ED4VkMZKtE59Bamt69ZkABkRAK6yimmUwynPTVYnyKQzgO4CQRvc1VlClIvLAKx4Ope3NvxmAsxE59c4RZUlGjlI/fHqsDaLdZftC2pSsExobL+N1DgO+HNj9xrp/X3K8rEwz65QgOWTzJmpBA4rKoAgjgwfWaeDbHf0kRUc1KYEOEaPfs/4HBJgKLx7Vglk1IahPl6419Tky6Mic7l5oHutfq3jAbtqvPAAQBFLUVd4ymef0FYTtyQxMNxwalNncI72va6QeuLg1++P1XPLI1NjZcwX88tYCbq+kyhg==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:11:27 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:11:27 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 5/5] oeqa/selftest/devtool: Add test for multiple nested
 git destsuffix repos
Thread-Topic: [PATCH v3 5/5] oeqa/selftest/devtool: Add test for multiple
 nested git destsuffix repos
Thread-Index: AQHdGnrbSugve8qM9E2N78daPQFmXg==
Date: Thu, 23 Jul 2026 08:11:25 +0000
Message-ID: <20260723081118.1558249-6-jamin_lin@aspeedtech.com>
References: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260723081118.1558249-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5022:EE_
x-ms-office365-filtering-correlation-id: 3b647c42-d877-4557-1987-08dee891fe6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|38070700021|10067099003|56012099006|3023799007;
x-microsoft-antispam-message-info: 
 avpuFYOkzAdHVMkCscVpEC8EUIqM43/pLc3nmqx4fVB7FDX1TKpBOCEL2AWJF0biVpHkw3QSQjbwaTuOMOFOaFLLjpS4kD+ZysVJc30lnr6jklUwfqImSkOwRRLr9ELbQ/uT3NcEIzEFhhAoeyuwuB45NNwiuw/LjCeL6WtbqAG72DmYiwCcDmneZcgDLgOLYa98vP8HfwWRZlq0cdh8LYYX1nm7xwhXa90/isN5AiXbHhrUL3td8JYspz+OtGQ6P0SKX02jG/QpQH/9Dzofcnm5klGMAoztW1fsOH/7lEdexJOyUTSQ8ZxAhw/2mgCJ45PGfe3N+GqQZWpOgahEHe+hIkgnJYefjX7xZI/kKnKpY3S7mW7UdBMevthnhRw44NMmJdjGCL+QUIxGwEhXvUFCZraYnO49KVak+3p5fv8EQaJq+aohQJg5Fm0xwdSq1mZgYo4ECA6xyv/8LQROFanByVUrE+cX68eO+BRi6w+Br0WVft+HgaHtPaOSeVKkuo1ZZ+d/z+Km4ydTr2ZkmsaiU0SFio5cZJmSR95U51rTkhSrU8i4y/FsXbqhmVfPVI85/UAWTWA0MjnFI4AdNRezI6dRY7yDNm5ekG6xHFS8C5gkJR66jpxooHZbVeJiNHt+XT29SOBO6z4BB9GnHc6/fysd7pBPWYYSYNyyyHocV43aVLBqOpKuW82i57sXI91aV6iw6bb8iaFYhVILF2RBPNJmT8nFGjInfqpxdyg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jxcD4q2V7cg6jFKhqF+oTygRz1VYa2Dq1so62ZQ8tFzoaxtmHhVLKCMBSZ7q?=
 =?us-ascii?Q?bRrz5lN2rpDPosFsMqAxD69b/LhicwxsTe0yiRtMhZUyB9LCNhP+QHAUovKM?=
 =?us-ascii?Q?JX5bGQlzXf7eNIhWxuokiMfWEcUDKyoC6IX1p1aBf21z0Rds4aLH+A42PvQ8?=
 =?us-ascii?Q?o4udr0CjeumgzGG2VN+N9UTMEAEK8Icxjc6lL3l9U40KgY/6g5bxNr8/s4V2?=
 =?us-ascii?Q?4JzSTU+42+25iiOsQDiWhX6tGRPJ3SMsQU0K43E+JwR19Dt/gq0W7kRp1Xrc?=
 =?us-ascii?Q?yu1IfwtjtthEseduabXuc1BvfKfT3f4eAjjFHSBvjJrrBbp3hEPjT3BKrgEs?=
 =?us-ascii?Q?CWxEK2y48jNhTysZ1ecerzEBemM8YROptRhMlTmqk5GlA70LzbjKIAdJKJD4?=
 =?us-ascii?Q?5zIyCx/nmIDiK3q+nMIzNApVq6nrhipFB8fQ900eWQwUA01wje0OC/ZqCRCO?=
 =?us-ascii?Q?pjLPAnUFfbYCYmWSAouqVjH7NAhSiGbBZZPEksLbx7fA/deTCvfXY+j/byJ7?=
 =?us-ascii?Q?oBcYoxBhO4OgVbCQC7E0IWlNjJCsXp44I8ohnXun5jVayP9BfgsRffCdoZf7?=
 =?us-ascii?Q?9cKMpo7dz3FSxNSeurGWAhf6SBTJTsxpzcNLYM7zf0gMXsUUTuphDizDtonU?=
 =?us-ascii?Q?b0wKGxUlKMQq8xemI81WAqynskLumSgTSe80Vi4AljGAXNdkFdyidN7BoMJV?=
 =?us-ascii?Q?zju+EnxK0fa7vWt3EgzZGpCIEr9z6Xe55mJ+LX+/sSgyD6WRE6Yhv28aTPQQ?=
 =?us-ascii?Q?jcuIKFUjOWrR8S9OMPEf/ZSONVFk1ZuJtDKXGM+6+XgKgoHQC7luL/64smLF?=
 =?us-ascii?Q?cHPj2zaT/6z0x/fjMHIbnn1U3eGfFC+Ma8ZRp4TvmG8s9cvLP0U6BBnqPI2O?=
 =?us-ascii?Q?D6fQcKhLhtkLJH5hf/aQDUGxV/zVYSGsMp0N33XpdF9IN1WI1/hmm+WKoi9N?=
 =?us-ascii?Q?cBBRJlPWUp4ZYMOcpAk1KwYOR+AIA0JniVGtAf8V2xzoZ/5fQ+7TPt4KdasJ?=
 =?us-ascii?Q?8KPnTgv3I7cygkSYqZ48xI/a3xjlQOk12j2tRFOZNHKNEcdu6GOHjNQiEJEs?=
 =?us-ascii?Q?1hUUvA3nO4lWmiPLe9FvfyosJQAsJuWRw7Ejf8Mu95jROgAhsiVvkyFIVPG8?=
 =?us-ascii?Q?P1gDlj4vO9YZv1RNagiKrbDb85hYw4Xctt8Cuw6y/L4ncjVtXhe20gBcbEd9?=
 =?us-ascii?Q?5B+JytVf7YwSgsn1HV+WAbRqAyLT2GxvmCMoDWH/kT5LdTtlNaZDnaaTBQlF?=
 =?us-ascii?Q?+9Twk9oZt9yzU0rH9cNuY8qj5hE/5yDNC6VabuWZKx9nVfMwPQC8K10rYKh2?=
 =?us-ascii?Q?QIuVuWX2hQFG2ByroKl04uUeXmjJd/c3q58BCbynJldnLVYSCFahlZ2SHrHr?=
 =?us-ascii?Q?FuvTtph8pHHpRLy2GiIEcbEWguISlhpeIff66NLDsBS8Jk1JBvvfX5Lbmg7X?=
 =?us-ascii?Q?POLD2mncJt+nfgH0xi8JlZNQX8V+SZbBmGT8tvqRbGpBpr4tB2n7xRim3v+K?=
 =?us-ascii?Q?a53d6GWZAoLEjCOsfEbfSSlFq8/qAexfniPlfxs4nW9OFY83KY7r2f40F46v?=
 =?us-ascii?Q?ZUj4gIuK8KXoXzCZ1G4Hf7kBaTw8R17TYekmIptIppclcrx0fYPF9RIPDXTH?=
 =?us-ascii?Q?zqOPM8vXZYX9qntcBTQUum/PFhhFU37p7m8/s0lFT49Ug1ex9pJPXkSNwCK5?=
 =?us-ascii?Q?/RenGLQPuSi2+gC10Uon/sNSMKz0dI0TE9A3sKgCwimPgVqChbhWvk3j0/72?=
 =?us-ascii?Q?dYsz/NJ5UQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	dWVFRZtT316TjVoKOYN/0owd/POUhmJrJlt4T8lapZiFZNZcUGIePeRrHesoJyAwFw7VDrXuA+lM2cF1lB96LwG5rnJnuE1dAaZKg76JggG3yNOpzJvPMCvAf0vB5suSP5fpX1rZ/eNFhR434ybRy/PUgG9P78KetOZyKB/b/uatZgt+Duvn57xIUv1yZvsbAc8s0oZhFhOv4X/d4iWhzcjOHLOJC1pt98wcg7ZTNYJd95PgkywFYAIGduUe/5V5UV1lItGr0qZSux5IZBDSzSPNL+34vamczSLXhOUPuTxwSygncEv4w7/rd+fn96zVzS09zbUW+wWZAoeLlLVoEw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b647c42-d877-4557-1987-08dee891fe6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:11:25.7635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D3e6ac2kKVGXSEfVZ6O74orr1TP173DYjTnYVpKy70dquKZp3CF0OzCgalu0klHiWrHNGe8fr9LTdvhudZXLhno7MA75vgSHgKABSxcYrTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241788

Add test_devtool_modify_multi_git_destsuffix_standalone to verify that=0A=
devtool modify converts all nested git repos (from multiple SRC_URI git=0A=
entries with different destsuffix values, including a repo nested inside=0A=
another repo's own working tree) to standalone clones so the workspace=0A=
survives 'bitbake -c cleanall'.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oeqa/selftest/cases/devtool.py | 64 +++++++++++++++++++++++++=0A=
 1 file changed, 64 insertions(+)=0A=
=0A=
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py=0A=
index a10eb0c784..de73a2e620 100644=0A=
--- a/meta/lib/oeqa/selftest/cases/devtool.py=0A=
+++ b/meta/lib/oeqa/selftest/cases/devtool.py=0A=
@@ -1265,6 +1265,70 @@ class DevtoolModifyTests(DevtoolBase):=0A=
         self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bitb=
ake'), 'Submodule not found')=0A=
         self.assertExists(os.path.join(source_repo_gitsm_gitmodules, 'bitb=
ake-gitsm-test1'), 'Submodule not found')=0A=
 =0A=
+    def test_devtool_modify_multi_git_destsuffix_standalone(self):=0A=
+        """=0A=
+        Verify that devtool modify converts all nested git repos (from mul=
tiple=0A=
+        SRC_URI git entries with different destsuffix values) to standalon=
e clones=0A=
+        so that 'bitbake -c cleanall' does not break the devtool workspace=
.=0A=
+=0A=
+        The recipe (devtool-test-multi-destsuffix) has three git SRC_URI e=
ntries=0A=
+        with S =3D ${UNPACKDIR}, each nested inside the previous repo's ow=
n=0A=
+        working tree:=0A=
+            destsuffix=3Dlevel1               -> srcdir/level1/=0A=
+            destsuffix=3Dlevel1/level2        -> srcdir/level1/level2/=0A=
+            destsuffix=3Dlevel1/level2/level3 -> srcdir/level1/level2/leve=
l3/=0A=
+=0A=
+        This mirrors real-world recipes that embed multiple module repos=
=0A=
+        as nested subdirectories of the primary source tree, including the=
=0A=
+        case where one repo's checkout lives inside another repo's working=
=0A=
+        tree rather than merely under a shared plain directory.=0A=
+        """=0A=
+        testrecipe =3D 'devtool-test-multi-destsuffix'=0A=
+        src_uri =3D get_bb_var('SRC_URI', testrecipe)=0A=
+        self.assertIn('git://', src_uri,=0A=
+                      'This test expects %s to have git SRC_URI entries' %=
 testrecipe)=0A=
+        self.track_for_cleanup(self.workspacedir)=0A=
+        self.add_command_to_tearDown('devtool reset %s' % testrecipe)=0A=
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')=0A=
+        result =3D runCmd('devtool modify %s' % testrecipe)=0A=
+        self.assertEqual(result.status, 0,=0A=
+                         'devtool modify failed: %s' % result.output)=0A=
+        srcdir =3D os.path.join(self.workspacedir, 'sources', testrecipe)=
=0A=
+        nested_paths =3D [=0A=
+            ('level1', 'level1'),=0A=
+            ('level2', 'level1/level2'),=0A=
+            ('level3', 'level1/level2/level3'),=0A=
+        ]=0A=
+=0A=
+        for name, subpath in nested_paths:=0A=
+            repo_path =3D os.path.join(srcdir, subpath)=0A=
+            self.assertExists(os.path.join(repo_path, '.git'),=0A=
+                              'Repo %s (.git) not found in devtool workspa=
ce' % name)=0A=
+=0A=
+        # Key assertion: no nested repo should retain a git alternates fil=
e.=0A=
+        # devtool modify must repack objects locally so the workspace does=
 not=0A=
+        # depend on the downloads cache, which 'bitbake -c cleanall' will =
delete.=0A=
+        for name, subpath in nested_paths:=0A=
+            repo_path =3D os.path.join(srcdir, subpath)=0A=
+            alternates_file =3D os.path.join(repo_path, '.git', 'objects',=
=0A=
+                                           'info', 'alternates')=0A=
+            self.assertNotExists(alternates_file,=0A=
+                                 'Repo %s still has a git alternates file =
after '=0A=
+                                 'devtool modify' % name)=0A=
+=0A=
+        # Verify the workspace survives cleanall, which removes the shared=
=0A=
+        # objects in the downloads cache that alternates would reference.=
=0A=
+        bitbake('%s -c cleanall' % testrecipe)=0A=
+=0A=
+        # After cleanall all repos must still be usable.=0A=
+        # A broken alternates file would cause git operations to fail.=0A=
+        for name, subpath in nested_paths:=0A=
+            repo_path =3D os.path.join(srcdir, subpath)=0A=
+            result =3D runCmd('git status', cwd=3Drepo_path)=0A=
+            self.assertEqual(result.status, 0,=0A=
+                             'git status failed in repo %s after cleanall:=
 %s'=0A=
+                             % (name, result.output))=0A=
+=0A=
 class DevtoolUpdateTests(DevtoolBase):=0A=
 =0A=
     def test_devtool_update_recipe(self):=0A=
-- =0A=
2.43.0=0A=

