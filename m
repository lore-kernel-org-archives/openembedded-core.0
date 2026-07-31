Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1487C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:26:48 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2924.1785490002156443016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 02:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=ZVHD9aOL;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.106, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aGR5rUU1OCZA0zxJSm+QshYy+N/gJYYPREoCS07UhX0+O++Y2OXkJAmNpYyTDUAklS4cS0omLCOVd1SKuclXrS40iafdqgsHWgxWQjqPACard9USdGoUalYqjqLM1XaxAGR9Z0khs1Oiijf5qiRgtTpjt6or1ZyOWmD/2APh4RywWEI8f7OnZQF0/IJzMRR/xIVTHt+d1OgGWHer3COOb4PyLRcCV/0ZQQBYQdXaTa2n6kCcVhcRocJIFnv/ubUb2cYZpT752VFsMJ8YfAod/Q+e/sP1uMM/reioZhJ6JFa58mvVMnifKiQMzhorzjdXYrABgoKEAnBR0dJEvJMuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq9ZO7jNxShRdTtNupaMSsnhfAFVXlXBEyaRApRWRx0=;
 b=hjlhyrECPVEkZzIVej7xQ0sCIokgt23zhXgBIdNpoV66N1xQGWcbE/ulO/veGlHk80nl1UkujOi5+qAe4Mxbqtf9wDoRuovgeJH+9IzoxgzWmlya068cXaH0PEo83JR84/d52jC0uk30yauRvQNCdNvCckR31HU+NRRJGeS4VHUZXFhhpCxMNbs6Fdn75foi5CENFzY8NIbVxpZPJAWP0Mp1KDsYmRc2qRry/ZKooHasDcTMBZm9IlLT2z+1upF0x9v6fi6H+I7wvNYmIDRGJSHKIVawe6NH90IRzjsUe9WvY9FlTaF2/o1S1G5YVm/sYMTSOq3K5AM4B3kXiH+pnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq9ZO7jNxShRdTtNupaMSsnhfAFVXlXBEyaRApRWRx0=;
 b=ZVHD9aOL0cgAWBD7muBXgBKZ95N5ARsAzszdJgOZwWaS1yiJ5q5lKPRuZjF6zLxUG3u4OKtRpylBP9al0qbuDpFMYflpMA7/HORZThdF0V50y4fiR/xO27dz4BGPODfqx/g7MnGmvvsR3h2S3Qg/NcqMWQEj0+77kJfNKDJC1zQOyUce5QdH5vRZZ9+VAFdABK2SrduQcNGsHfWMFEk4RryZuakkABtv9N7WC+Nk/8uJpiF8rL2gwaD4iqfSePXfNOqPVaPzlDaErno0UEzqA3SsX5SSwNM82UYUHTlPk5eBLPjZOf+eXehWI5QNDzRtdlEjkwaN5ax2jP7D7P7+pA==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by SEZPR06MB5295.apcprd06.prod.outlook.com (2603:1096:101:7b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:26:40 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:26:40 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 5/5] oeqa/selftest/devtool: Add test for multiple nested
 git destsuffix repos
Thread-Topic: [PATCH v4 5/5] oeqa/selftest/devtool: Add test for multiple
 nested git destsuffix repos
Thread-Index: AQHdIM6xV2rzgBG+Ak2NuxjiXSpMbg==
Date: Fri, 31 Jul 2026 09:26:40 +0000
Message-ID: <20260731092634.1127862-6-jamin_lin@aspeedtech.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|SEZPR06MB5295:EE_
x-ms-office365-filtering-correlation-id: 887531ca-9fde-46b6-e81d-08deeee5d3f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|56012099006|10067099003|3023799007|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 1EtIL9sjR46X20Ve1uxJzaek3G8nI3dH6E10TnnqmGGQu7/m2/ZE3IhttuBr1UwiufNEvPUGMa89w0wx+9gSLmvCSFUOFNaTCSau5YlDXSWHEGYVqwC7Af1t99e3hlO7owkmJPKPT/ggQbiAHM9Gx1hg+bMMTr3F3HXp0f8hGM1mspbS446Chfy6+qavgS9KCLwmLQtW+o+hezNj8SX4Jw5TvfjqzZi4TLwAjLGorvCj4/EZLBuM9YauyzmR3Rp2VfRBrs4+ifQOwjZ2Rf5rm5+t6kjaZC+in9A2LknFngTdWLFqu+c2KnkZm+GDhyCMIcZkqDeEMRelPO4oBGnKrV/IJX5djsAQSs6SMG9xEAec8gmWmkElwtl0Iighl/Mm/of3C4vjeFsK5q+1hx6+s4CLXMzK+swR2mTEJnmYnOcaJJgcFXbC9VlHWpBeqcyeATIUUvwVFk2DYBLivczYAFgJKgHJMEoimslydx4UYjPOZwSFxRy8dkYw6D+2+F1r7Ez7eaUrnwclkJOyEmCHdrRkjw3Pl8f/9eoMaygYuktx5Zt5HrXyIGX5SfO2iUQRvew8iCp4kj+9uvkUSRQkP/TdbYavwnLJ19ByzrL1Ad5dU0B8tEyS0fPY1wvGfYIyyZp5jntjabJ2Bubjq6reiKQ+zvESYom/YSA1R6EoLBFp69oIl4hCMlKGEZxP2mU7aoNDyrdwbPmomqfWnmtu8aq0mjIAjiAcTOZNIMzi84k=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?FR6BQb2e7GMZ860DYM3GhS55YTs7oJiOBkC8tWpWqkkH6nzx1G+nlTAedbPn?=
 =?us-ascii?Q?mLAPNCOnkl82klUcvP/bZVWE8FhJeia1xqid0wEK/3F8MYAdlXWCZ1mze2YL?=
 =?us-ascii?Q?epnRBIgb8AXhkrpW2Di2jrYZi6W0ptim1Oi1qx8qBv+OkU9NZGt2oeqzIcjw?=
 =?us-ascii?Q?N1AyrsSC2sffvyIxLgRFYrPFcncdo8yAq4mcROUkQODyRgSFRyR5EnybB9ep?=
 =?us-ascii?Q?R/yTw3Esa04bfXzawa9vRC8hzcB3kx05ML9SAzEnxavprIF7N/rNiZYwMK9e?=
 =?us-ascii?Q?KGWEGh0HORZYf1HciVR6tnOsFbohoI2XBvs9QIUU4L0B6KT4ryXfoHV4y78b?=
 =?us-ascii?Q?7dxiYWixbHBCQGi3LnHbvynBEwxdpw20XW6EFDU4LDvE+YAnggjYzTMbi/2l?=
 =?us-ascii?Q?2vdYJp1c+fLEbnjaWszUGbZtoXPCT48Cdw/LfR2vt+hgYykfIEFNMK/CyiBx?=
 =?us-ascii?Q?3n6xYpgUSX5cZDIlXQWA135Fbq1XTDF75antvo6R+qPbg+k8/YIhxRUvBI6B?=
 =?us-ascii?Q?GuapTmSpAChVtuqewgGvcRuCaBMY7owqAVK2ZvQpUTZgZkD1KoOBwMhdX0K1?=
 =?us-ascii?Q?9JBdgjs6sQqhqQbkVjpE2fm/8rCbcgz903j8AoDI4PMS3G9NEgO6m9fGFb3R?=
 =?us-ascii?Q?1rhlO8q7IH0O9qOaGIOBtPMqgngMe7fIWhWNaJy5MqIlYsxLGEr+94O87aMS?=
 =?us-ascii?Q?ohM/U7POTt1UbxePBMQ/6rNgEHFHw7VifWJ70U+b6Jr4jaRrF9oHdv8ZpwPa?=
 =?us-ascii?Q?fb5v9LIM2yoTBABWQOYkErlZ0Z3VxSMchcYuqbVAYuujUxqyPQNf0q5Y8VxF?=
 =?us-ascii?Q?Ne5RhRlpFakWYVBW0KNcTyhzAi+wpd0oCKIlIXqrL/yuEQgaakeYBELa5m7v?=
 =?us-ascii?Q?+YTEIE+k0M/j0zUWCZn9o+0xoLZr/fLsrLmlVOfeaGtKL/GSvJ7yASc7lvNi?=
 =?us-ascii?Q?x8uiR8ASLZPLd+CJF8fxIyoIT1xRftsyWY4MavBo6GzPjUxw3XgTaqkXmrpx?=
 =?us-ascii?Q?Um2DbvgwDzoYP+dKT5XS9dSfJ73ql8UawnBqAquyzDxXwC5hlrW3fZHnPf3J?=
 =?us-ascii?Q?H2g2yn/etwo4QbYQeAT8iXVRRZWQ4x4mQqWXOQwSNy2Eu5vDGAWQBkMfFWYy?=
 =?us-ascii?Q?MyF5ZryqS7KL9qH9NEvK6GRTHPnoiNa+tJTWPnKOWnJorsuy4h1XXz3KaH/k?=
 =?us-ascii?Q?KqZ7Jw2iyz66PpFX2VkmoCelZkwaJ+T3MbYuc8eRWJ94QJkMGo2dXTBFMJLW?=
 =?us-ascii?Q?Nw92VL3/D8VumJ4TYDAAcbai8Z1M2U5XlGfcQ0oxOXkt0p1wTADZKiSwkaSD?=
 =?us-ascii?Q?Lk0nGgjB4xRjAEhF5G+1BX6TcZyHfzJB7JcbnDszKBYNTs/nFITR4rLT9gQb?=
 =?us-ascii?Q?1VppFqYxcNy+pg/CSJoiYLdnZo6DfovwCq8KhwgMo0ByKI5mp1NtgGyRlIi/?=
 =?us-ascii?Q?B4ADirP6LKQcd9QL0JsUkMLthFyfq62uj+ITrql5Ekmbos2xW4zROB6XilDD?=
 =?us-ascii?Q?wKJFQhvgs4JqCg7WQyeJEHX3DfO1X4HkckD+ogK0yN/FbuIooFrOJs9a2qnX?=
 =?us-ascii?Q?P4ccld7m3MUrHiGfNnB2GEtiqa/t7BqEPXcBjJIXbYnGv4xmBmkrHOa0SOaE?=
 =?us-ascii?Q?WLR1E6sNUWQH3WmH4X6/czZrPzD9UPGM/jreULUZ+cVbDTX9giXIaLL0iT8F?=
 =?us-ascii?Q?LKYdDTwtQUT30CZZNq4AgjwpFGqraB6sLHzJrTH5UduLWzg8xAKru75c2CK6?=
 =?us-ascii?Q?ZQYKg3Z6+A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	f2l9CukdFL/90PIOXr9LGgEHLE+AdB46Xe+1JG6btt8QOFGbC2mE5NZQkfwtGZbhz8mT3rbLpF5TvlBIX9CPpHUE7xuDxDGSDYoL/27eU3D4ftxNBi5q1M0N4q0159fYRO15J9tZWVp0IgtiNw9exvSw6bGf0q3bvloh7y/4CZEnyPCDDjveGBSSccuWzB5mb5X572Ng3HZLcX/bvO70b/0bw5sFs57trcVy9puKu49haN5v/G0Zb9VfdVLvAFTV54Wdm2GrdORZFy96wKTwdTTGFuXTFE7HYwr/qVhaE50ZWC+vuqGYS4pEST445lqdJQCCIXc1vc24WSNzy1FxGA==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887531ca-9fde-46b6-e81d-08deeee5d3f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:26:40.4078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gyZdPx4gvjrq5sa+I9gBqzCEnYjAsRgqBclJjpQGyIB6gnQkZ3bmiBxzdmN6zIGp+/kpVX9s4koDyfKPCThQ8+cgNSeWl7kaPQ6e1mo0VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 09:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242417

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

