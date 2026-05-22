Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67343CD5BB3
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 07:59:43 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com (TYPPR03CU001.outbound.protection.outlook.com [52.101.126.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12593.1779436772187511780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 00:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=EKdAa/O0;
 spf=pass (domain: aspeedtech.com, ip: 52.101.126.72, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec6UhuQZjFMYe4hbOkxmmzBDpHRYx623lUfnOrGEVWC+SVE3+VGKgXqrZdYMCvNU+wh7yWgVTtLrMpRBRgHdSgvMSCz82hXF2w4YP5IpfNRq+FOg9UrLbJ7PUYGn1LUhrYsXIm6v3bNqcRwLHh57zj3VS7tuAn8t1mu8f5+rP9dHOhRU2KPbmbQsju6bFBDvY1L/D3+9nY2HuwfWBvClczTMka++1unN/hWln7UYIL9o9AIS4Y15VAQT91qjr8NWnuKAgxPbsZtOTE+BrOz6xoYPJlY13ysBx9RYYsY4S1pNziFsckLNG9dz/9lZyQgq4tFFH+hJZJhf6Thsubdkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eZIfMQAYR79ukpakEmlja+hrK05t871HiB3Rk//4Qg=;
 b=hf5HJIoREkKJDKym10UH278NIF2hUuVT3pEEOcx/HJ4dWA+LJh9EPTMXjG0zaFxdwnR6cERlY3oB8yn/lViBYZQpDY0ag4cHKVpur4MJrqmPwBkMP+M32C7KotScmlr44yhfNBDbuKunBS0TIz+I/DaJJGyYhh94/iUOV0Mv9ebwYQIYcMKHrz6bH8ICIuHy2LruyZMeWKjRG2bRHXvlDHgjh+R7/ke7I+N0G5DjG399nvSnkdS9yjjh1bA1sZCvSdcA4/gY1nRxG2lyDZeWzcQQpYbK4jbx1NV5kcDGRkgCPtBKAkAsF+0B3Km2x6+7A89FC6cpkZfhbaWVx0YO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eZIfMQAYR79ukpakEmlja+hrK05t871HiB3Rk//4Qg=;
 b=EKdAa/O0ATlh6nnk3AoC9cRZLOn23KowK2HDpsCmvMdV0LwI/RkwY1LK/se9hoaEoAxI2D4csvcg46MpvUwD5XY/fC5xwLMZYn4JaZdjkV68gevZC9SRxt5I48zu/4j7yacYlH+Qxrvxotq8NDraldb3vnWXngvIbvQqn7GslrTIVq+o+ozcP0KbGPoODNiUePG/7IvcUcRrl/jva0+KxT5kaLG5rXhLGcI4aEbEYijqLzt+CAtKMcC+2yGfFXlTI8DxEU4ictjGmCXzH6BrwzCbJ9iw/Bb7yG3hrhe2Cn3gEIHIYMdGC0f0p/H7O11qDWLbytggqUOjZjus/31atw==
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com (2603:1096:405:383::19)
 by SEZPR06MB6118.apcprd06.prod.outlook.com (2603:1096:101:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 07:59:29 +0000
Received: from TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3]) by TYPPR06MB8206.apcprd06.prod.outlook.com
 ([fe80::e659:1ead:77cb:f6d3%2]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 07:59:29 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "paul@pbarker.dev" <paul@pbarker.dev>
CC: Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
	Vince Chang <vince_chang@aspeedtech.com>
Subject: [PATCH v2 3/3] oeqa/selftest/devtool: Add test for multiple nested
 git destsuffix repos
Thread-Topic: [PATCH v2 3/3] oeqa/selftest/devtool: Add test for multiple
 nested git destsuffix repos
Thread-Index: AQHc6cDqzve80/ZqSEWNFneBJ6uB/Q==
Date: Fri, 22 May 2026 07:59:29 +0000
Message-ID: <20260522075925.2381158-4-jamin_lin@aspeedtech.com>
References: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20260522075925.2381158-1-jamin_lin@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYPPR06MB8206:EE_|SEZPR06MB6118:EE_
x-ms-office365-filtering-correlation-id: b573a62a-f4ff-4a5a-c5e3-08deb7d80d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 
 CptfL4RghauII0oOyOP495uRUU1xwcw84BvcKX6hvjJiwtlqSfxzbos3b489HYLX95ChMqHkM1a9wDFqyvs3mWXlDv+nuubdsyaCsy15LL0D2Y6uOubwi4j+ef/bSiyCGX8kx69V5GA5d7Z5+JKAx4tmO30VV06sBvSy+zuwAfXjKfDgubEFo6ffN80HGPsiNk8qgT4EkBRMrarsvRL89hKt0wjxc90y4W6cJ+W43+wIr03Do/2Osy+cKoBAq9BW4CJujVn1YIOmdYDBjHiyd6hMsf0e7Usj8lWhSCDTfH90LSpg4jFQpHHI2tBFjgKXuY6tZGEa/zQpGJiRXVwZtZ+TcLPbEw0/2p8N3TauisUQof9+Xc0nnQZcjAyog1Nvjv55PU0aJQMTAePQsfYaHzk5IU4LDExAwfIfX5MHtlWQ/3XtP5f0iAqmxA82Kr1kG9qwfP+sJASDhuyTJ8581WSid7VVsfuwYFdlHanOshS/vwYQLYWCLzHNI8Py55N7tx9ZAmTjd2/XJSkQ6w2xzXRmzNn4SCdZk9F65APYhkuiM7zzx+h2XdUN7Jo0O27yi9rWB8ap0B2Myo4kYUliCIN5fXRboHS8/i97g0x3MfU9hugdG36V0w1iChHQOr3V3IYwHow+G3FP1D5/tejuYuK6i/AgfSuONv5TdKtREKz9mylngtU252UxB8Ce9Jbp35l3seLhrXyxUBds82RBmC5dtb0Irrr0Dt1Maeuf7P0+gURVCcY32Y1axVSLPWah
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYPPR06MB8206.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VMkmXDA30Z8wFiCDoSlA6Eq6LU05e7YVuSJen6TRBKsgGfebU1EzAShx+TuA?=
 =?us-ascii?Q?ojTpMHqsFHYZ1YjQBHYZ22bjllbXGsEq5sr4f0QQ9OAdx3rmNON21ZEW9sGR?=
 =?us-ascii?Q?9WL++DPExbouvK9W3YZUj66a+Nwfw8jtqttIB7ZaeprJ/7WArpkWRFuSTmy0?=
 =?us-ascii?Q?4AR9e2GQSxiDr+M0iuJpNAnmhE47HhiutPiAovg461MyzhK8BEnWkCKgNgey?=
 =?us-ascii?Q?zY6oEkkYF4b7dUZdg7ojPWFnHogUAkFk6SEIAhTQtSwaiAanL/tUHJlzwBUo?=
 =?us-ascii?Q?nIuhWxRR7Tu+0Px3QtQ+7EH5FnSYi4rLyI5KYYTV4LXdtR9CXDUTAhx+CFtf?=
 =?us-ascii?Q?cevZrQ15VtNFo+TERkB3zcKXoCHYFJ91Tt93zkFUUy70mcQnKfbo1y9Hy/OH?=
 =?us-ascii?Q?lliCbOdEjvBZ2USW5TpJ6TJoMWwT4WCDCrL8RTxf4MJ8W3VGNJO2hffi3B3J?=
 =?us-ascii?Q?PTL4h0vatizyyrV0oIE8n80HgMs4yPIdcI+HxtPmZDLz+XVfyky/eLPJWXPD?=
 =?us-ascii?Q?NWC13Iv5ZeFco+nobtaAuIsjpLp67aOSK6Om8IrLMm6bDdE89iP/M/koPNHG?=
 =?us-ascii?Q?sfTYipuuz+pBW8TgkVPbfsKC4qRyyr+NqqvPHEaWocpYx5n6OlY7/pW7jmS4?=
 =?us-ascii?Q?eSX2V+rjFO0TJzddF80/fMPbJH4z9+3FSMUE17ukFAPCwqe6bF7k1D7EAYUg?=
 =?us-ascii?Q?zR9OktoNRVio7X0h8V3wKlpNWsQhSuoJfiU/Qi+7TwlUUT55AnQUxCtttrLf?=
 =?us-ascii?Q?F3SfB77gD74eM/mHyQlLLyAeGXgWdaUwwR9mQfyJj6HT8c+d/eeI4Qpv8ymA?=
 =?us-ascii?Q?sXMUjQwzFwCfBc1canrnlAF3fmet/9ggCvSWgCLmgAUwioNkF5NQjk0+b5Vt?=
 =?us-ascii?Q?sXvVBtNOZrAPX5muGaq35BgN9kO7urVmaXv3V7LT09gZ13hXY3mXpHBPuhl8?=
 =?us-ascii?Q?zBAsS4hPG9doM7GhkOBYVHJJ3d7jeWOxKGquwzPuD1T065WeHbT4oXan7dDj?=
 =?us-ascii?Q?RIdiKwI6Fejb7p5SC8QFEVP1wf01GJQIRRz7VaXGDDmzwzl6mOmAjNR6bPNs?=
 =?us-ascii?Q?M0GIz9or5pUSmvGT0Uc0ubiO+EbdqVpsCZL0hRoOH7pME4zpWiyfwDtmD4m3?=
 =?us-ascii?Q?vcLRK55isPSVqaCtDkFnhfPxVbuvSgwtNXJ2zfFJvfhbyz9RNu+h5vmSuAzT?=
 =?us-ascii?Q?Ns94NOqC/POdCjiw7iB88z6v1nrg1MfY5o+ZwXJL+DCCS9jjzXJzV8uUY3yD?=
 =?us-ascii?Q?+w2gj4yo44QgRHBfwqlUL/0mAQ+Y3+r6WAH0NATGAGrT3iVi4RuFlI9ffJpK?=
 =?us-ascii?Q?LtNkA0F2KghoQaNfT3gAGL0qiEJvicXxGO0jj+4JaZXUV1H5d+RJ8Yf2Gtm6?=
 =?us-ascii?Q?xi49Gq8FsFPbDi1qx0emTaZYfZKPyoUxqU7ITvVFCjS2dQyfpuIv/8C5Pbgh?=
 =?us-ascii?Q?IvhZjIJdtoSk/GUe3C8fXJpc26MZFfbTO0bN3irPV5rs+Qn9stxfXmitMHcF?=
 =?us-ascii?Q?yPSNXPvcCx8wvjlQ2/xSe2quJsSsCkjU9IKy0TK6Vzi6ZtKTzoRyVWApcLlr?=
 =?us-ascii?Q?Y2JYpRSUAuCXos34dWm3tUI4ehiSnanrmBDN+XuPWqIw1sKgogotcNENC++h?=
 =?us-ascii?Q?xoy05q5uOylZOllaMA73/vvjBybgG3+GPgpUq+qc1orSIWyfeU8o2mQ49Ggw?=
 =?us-ascii?Q?p6l6b08V9t3fWMSm71s+2z+eJtjsk2p4RqV6SxWoC0VN9wHSBUDAf0Fn4Emf?=
 =?us-ascii?Q?7YFJ9FHilQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	XvJc5e88ahZduJfH4v9WvbI+pjZZiTr/aC2DQi6g+KxlYojXQjorAaGpYxVbRA4Ib8zS5MkbCq9M/vEMBN1kNQuOaY9lirKac8Wv3na+LCEGP8ae8zWJYjvwq0YQsw7MSSSfOo2464tPjS4zlJk3q3QBM7khHZ0L+UjOfzMMNfr5ZTJut9XBsF85d/E2GaIfGxchxMv0KVkXpQddDa/nFGcl5zMZjr7Rx7yIl2HU8npwcHIF1D2IelxiR+IfLsj2jsS5abzRJxmUAVM7L/xJ0531kmKySk3B3oex/swu5+MHy/IBPgPyNjfQuWZeGddC8vwZ+9jwdZOFONT6ONGLmw==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYPPR06MB8206.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b573a62a-f4ff-4a5a-c5e3-08deb7d80d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 07:59:29.8362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClwcvV+/TnSxHPB14aNAc3Cks297qeKrAIAJYlBPrhUch2Pp9aQQocslVDNj5DtnXnWbo6GkAMJKz4vOHAYGpqRsP6y+6M4Ls86Wux9lvXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 07:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237532

Add test_devtool_modify_multi_git_destsuffix_standalone to verify that=0A=
devtool modify converts all nested git repos (from multiple SRC_URI git=0A=
entries with different destsuffix values) to standalone clones so the=0A=
workspace survives 'bitbake -c cleanall'.=0A=
=0A=
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>=0A=
---=0A=
 meta/lib/oeqa/selftest/cases/devtool.py | 67 +++++++++++++++++++++++++=0A=
 1 file changed, 67 insertions(+)=0A=
=0A=
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py=0A=
index 5ed69aee1b..b927bbf8f0 100644=0A=
--- a/meta/lib/oeqa/selftest/cases/devtool.py=0A=
+++ b/meta/lib/oeqa/selftest/cases/devtool.py=0A=
@@ -1182,6 +1182,73 @@ class DevtoolModifyTests(DevtoolBase):=0A=
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
+        The recipe (devtool-test-multi-destsuffix) has six git SRC_URI ent=
ries=0A=
+        with S =3D ${UNPACKDIR}. All repos are nested inside S:=0A=
+            destsuffix=3Dlevel1_a              -> srcdir/level1_a/=0A=
+            destsuffix=3Dlevel1_b              -> srcdir/level1_b/=0A=
+            destsuffix=3Dlevel1/level2_a       -> srcdir/level1/level2_a/=
=0A=
+            destsuffix=3Dlevel1/level2_b       -> srcdir/level1/level2_b/=
=0A=
+            destsuffix=3Dlevel1/level2/level3_a -> srcdir/level1/level2/le=
vel3_a/=0A=
+            destsuffix=3Dlevel1/level2/level3_b -> srcdir/level1/level2/le=
vel3_b/=0A=
+=0A=
+        This mirrors real-world recipes that embed multiple module repos=
=0A=
+        as nested subdirectories of the primary source tree.=0A=
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
+            ('level1_a', 'level1_a'),=0A=
+            ('level1_b', 'level1_b'),=0A=
+            ('level2_a', 'level1/level2_a'),=0A=
+            ('level2_b', 'level1/level2_b'),=0A=
+            ('level3_a', 'level1/level2/level3_a'),=0A=
+            ('level3_b', 'level1/level2/level3_b'),=0A=
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

