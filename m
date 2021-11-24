Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0662FC43219
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:48:17 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.72])
 by mx.groups.io with SMTP id smtpd.web10.6992.1637765289962517376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:48:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=O9BIHlCC;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.72,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfas8hbffeEL+FnqQL8jEdV4ebltpaFnTM76SrPu/UfEZYDNonad6CBEe+fEj7z7cKe2KPeT5IG5TYKL2HHPqrvGRAz9j7yWibXdlAAIPxKXX2stEqOk+VCj6pL7TuDuIz4FNFxDi1LARV8CJzSfuuYXeNSLZ3V6CQB3wbq70L1NrwpcELfO3pYvm44YQi47T6+BiCQYgKf6S5R3MnshQuCNsm2IdLZ7/CVLxJIqOJM4kv1ie9RH38aR7+6ea+U1w9EOMWOl+gF5Iyxq40ntVHc7QU8xQY8Ki6joUurpsbN6vbyybb5Qq9Lcq4wDi7JRg3jr7wvoQY48jLAHxSQLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/ojoUW+P2y1o3vcHovXTMzY6zBSVN0THSzip2H2Ojw=;
 b=hdCEnH8XRzJ2zI84gIIvQ/dvLbyIeaRtLMdZIpA38Q5Hny5cIH98A+Dao2l/6G2YeKAf01O8GL9fVWypA8ZepXFVDBntNdfh5AbwaVru4Lnf80yvVL48r4QPF7YjFJIRfWzeSs7Z0mGdNotbPO4VPtwioJFyAZi77rxWbGfBdGm0Hd1UVRUGO2GAXAUh8/0deLZ0sbDiitattuXHsKqOrNRfs4fbw21sd/TvULX00q/5B792NO/cNDDnSMtTveNkNBWS8zhUtPf1YAC3wzSVkQ+f4qO0AEd5GpjhCbHTRvyD0qqN9aU8cTsyFfiiFA69aaGhpFQB2WkilvHlkrBVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/ojoUW+P2y1o3vcHovXTMzY6zBSVN0THSzip2H2Ojw=;
 b=O9BIHlCCDadHiVCjjAArzZLuHu+ENt76svhR0gkIwM0Pe4mH5d95J09I7Ujxu01rMI9WWaczZTP970kQT3Vnbpln1Xfy9Y6v5iVI+Rn8/JohekDPnuGGmXqkCROTCrxZUko+7Hm79mD2sirOaumWlPt5H9wrsiH3svgzRSKA4DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5801.eurprd08.prod.outlook.com (2603:10a6:102:81::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:48:10 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 14:48:10 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
	Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 12/15] recipetool: npm: Add dependencies to SRC_URI and
 auto select classes
Date: Wed, 24 Nov 2021 15:47:36 +0100
Message-ID: 
 <20211124144739.2250-13-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:203:51::25) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.208) by
 AM5PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:203:51::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:48:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8dcfe0c-a6bb-43b1-da99-08d9af596f43
X-MS-TrafficTypeDiagnostic: PR3PR08MB5801:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5801D5B6BB1342492A04D4ACD7619@PR3PR08MB5801.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Je0k51NovSg+EInl3cP+kBFaHcKv4gD7s3eL2NKa/Cp+teWy0LerNLX3xTudUUASraCkPwGkCVFYOScRJUoOuYWfOIkji77x+c4slIALkMWdoTN3Gn5iFtgUHT/ewEuwBbjkYRm4f+bE2CAhKcGStDGSOsA7FeAtzzdvbsrRDLyCIiNtWFM7KWiiOKOxd0UPNq7HfR/g35zuv+aQDdyP52Ehi+oH2WTtANZ/2q14JO3ucWwEa7G0M4rZuukmwtmHD5BkxJI2DbpDENzuSvItxB/OQT722SJjq8908ULRpYtVc1PlZLTnCv1OZy5QmqXiB+S2RKP3JVCCzDfCAIKT24SQK7nTJFi0xo+xH5/U3kCq7PEjN3remMcle2FIEaAuJ3PStBKKsU8bqHFZZNSqAjoL6Xu8FOZfCNj9LDi+BJQ8ZQHX/kczF8LefnI1BpzotUEcK332ZqcBV3nXP068o13LAuaKMuqI6pNjgiazJUs0Hu93Mu/xMV2uvXD/eqESBx3ybi9qvJq3noEgf03uJlRlXDzRLEfNy2LQDnxmwzkP5JFSbKgi7ptG8L6MkGEEX9iEx9JTWufb43C5ZZD7140EKnMZP0DVquEjMQduHrZ7U39j/6ACuZwYe160YdWNU90VFhZEwnaSjrcBjofKeJgCa+owODH40N9512QrHswWdpiSN7ceL4EYXP31yt7EbWScFOGJWVn1nzMS2PhRNKAoc/60+0xqVK+ddwMIKRN5S6ngZX0VWhfbd84deRzmUxp/QwaQ6KMUbPwmM//Uj+YiAdwkkFhPbFxP78SGPQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66476007)(66946007)(52116002)(66556008)(6666004)(8936002)(107886003)(8676002)(7696005)(2616005)(83380400001)(186003)(26005)(1076003)(38100700002)(5660300002)(38350700002)(2906002)(956004)(110136005)(316002)(508600001)(4326008)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bJ81sGBk0/2hyiHkJmK6Obw4Jn5Vh+ku6gNln58I8H8wfQaoqEPcXpFXh/gj?=
 =?us-ascii?Q?7CuMTZKWpJdS2ufL5tTHZ/j98wBRugSuWtTgxF4cNe6dMVF0jdRD6ALy8A7h?=
 =?us-ascii?Q?OB6us+pmP38C7bPYD7cPz1s0SSeXv/x+BKLM0p3ZFM8IIF6Pyc872rLNqJx2?=
 =?us-ascii?Q?vsVlad47QEmcDFRzLN+dTd2PrUP/I0PVdlp8PRhgDKOBb8jSfB/OuuJSQtc5?=
 =?us-ascii?Q?nRf1jL0J51NJfRbIP/Sj2GciTUlfjLgFw030WOts4YrvkrTudYJLVO9x0ZYQ?=
 =?us-ascii?Q?y796DQvgklILLUDS3Ba9Wf2ZjCtrJXrYZgCQvNqN5Jbbxw+tnElCUKRMkOZ7?=
 =?us-ascii?Q?as7UqdHPy5xcGZczjE2CyCjMBYmKamshy/T74WYHWCx2Szem+KShQlE+fcfz?=
 =?us-ascii?Q?1wlV5DeK6j7VCg7NJ92D+70YSFVPn4rGWKdGWhazLD2/Rn7EvQqTuMxSw+YS?=
 =?us-ascii?Q?+urzgPoYM7PenKVMxRCMXpAVzeRTXOu1FRWRr2jtPGAauy3m92YF45Kmkvsp?=
 =?us-ascii?Q?d87hyYAxojFRJ3lyj5D60gpqHPyl1wairm4VnRnUPffVS7D/xKoNryFo3X6F?=
 =?us-ascii?Q?WVfW3hEA7AqqnQ2zFGHbgTvTUDe0rSV+F66xv6jWNn1Dc2mbbhkl/g8iFW+x?=
 =?us-ascii?Q?7gixZFORL16UsJjR8Z6AzhOCmsDmLu9eEuOZYKSlfe2O5Z2z3cTuvL+/2xB7?=
 =?us-ascii?Q?E2wVs3Isqqvde9AtAuZ5Vl6GQ8NGjc6OKUiDCw6Z9OXZFp5Y8EE75ve1Li1y?=
 =?us-ascii?Q?sk92fhQUkQoreQsEuqNTJZj6uivnu24txO88UvjpURJQ4Kx3qWWxgdehbMT0?=
 =?us-ascii?Q?fS5nH4enCmWV3LxJIQ/Htisi8rUfmghHuCDc5WR8dgXRZ/L8UwJMzQZs84KD?=
 =?us-ascii?Q?cQNoMHNklxnAwVAJpKZ48Qt3QR1G+NPzWVYFsuUTiNGDj30Aa44qCG2ntKTu?=
 =?us-ascii?Q?Da81XCpFisq31w7eaGuX5BWShkWp+hlzCwMQ2FF6lGs2QmX96zAt94/4NTOB?=
 =?us-ascii?Q?xa8c7jOlY7869iVozMcoS0sB4M+EhT6s2xWMSIkmRpGwXhkCYLT6lOsux7o8?=
 =?us-ascii?Q?NbakJ2zaGSi2MqkSCCUCWvqMOAd2iHNMZksrtbxNf58PO2iBYyI4FrJQ1fsl?=
 =?us-ascii?Q?j8b08+T319mWM+kvtcxWPlADdIJ8kWhQYFH23VHvHi3/3V+7MtZjc0LDGBIC?=
 =?us-ascii?Q?ZwrEu7rS01iw1diuzgxJoWB/2mllsfeUrzqsz4s2du0ec7fakqOzAdgtO2/l?=
 =?us-ascii?Q?02EvpGvYSRyWh99Kqmrao18E7+2GOSdBUtZuui/Wkw9cdwa0cZszYePHCiGP?=
 =?us-ascii?Q?b4BA/ZC9SMG2EYxf7iKAydobWt4YzhO2cY/+Pn53rhGeOx0aSQzUxGpgUSSf?=
 =?us-ascii?Q?oZ7Sd2CugZW1KSWOTESdV0rbCzoQCfiUyK1fM64XiGtihjzdrBtbF0KaBR2L?=
 =?us-ascii?Q?6hd1HnGdocGbb9A/pk2oopP0NzP+CIg0Qxn+9Bu5G7rHegxABXW0Vn9Arqpt?=
 =?us-ascii?Q?9EWgkNTMXZq81+izyyOZhjlU9gApUBFmXMjlfH4enYESjTP3X0gwEuebQzNm?=
 =?us-ascii?Q?me4XHGfRrM8+MJGsZcMPEE5bAS5uJx2DEYKx/fXoUNubzWt4mgBCDd7hLw50?=
 =?us-ascii?Q?rkALDPZa4KC8oqObpIoSVC4=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8dcfe0c-a6bb-43b1-da99-08d9af596f43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:48:10.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xxn6JaMCzUhdl6OF5HNPG7xMIN1XxuuOGWbOoOE9XuXcOWrGB7FNhPAR/4YQsQecgUjB0b5jfenw58M4oBMyKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158707

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 scripts/lib/recipetool/create_npm.py | 243 ++++++++++++++++++++++++---
 1 file changed, 222 insertions(+), 21 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py
index 3394a89970..296b84340e 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -39,6 +39,14 @@ class NpmRecipeHandler(RecipeHandler):
         name =3D name.strip("-")
         return name
=20
+    @staticmethod
+    def _node_recipe_name(name):
+        """Generate a OE friendly Node.js recipe name"""
+        name =3D NpmRecipeHandler._npm_name(name)
+        if not name.startswith("node-"):
+            name =3D "node-" + name
+        return name
+
     @staticmethod
     def _get_registry(lines):
         """Get the registry value from the 'npm://registry' url"""
@@ -54,6 +62,24 @@ class NpmRecipeHandler(RecipeHandler):
=20
         return registry
=20
+    @staticmethod
+    def _get_srcdir(lines):
+        """Get the source directory value from the url"""
+        srcdir =3D ""
+
+        def _handle_srcdir(varname, origvalue, op, newlines):
+            nonlocal srcdir
+            if origvalue.startswith("${WORKDIR}"):
+                srcdir =3D origvalue[11:]
+            else:
+                srcdir =3D "${BP}"
+
+            return origvalue, None, 0, True
+
+        bb.utils.edit_metadata(lines, ["S"], _handle_srcdir)
+
+        return srcdir
+
     @staticmethod
     def _ensure_npm():
         """Check if the 'npm' command is available in the recipes"""
@@ -116,6 +142,118 @@ class NpmRecipeHandler(RecipeHandler):
=20
         return os.path.join(srctree, "npm-shrinkwrap.json")
=20
+    def _process_shrinkwrap(self, srctree, shrinkwrap, srcdir):
+        """
+            Extract package urls from shrinkwrap dependencies
+        """
+
+        urls =3D []
+
+        def _populate_modules(name, params, deptree):
+            from bb.fetch2 import URI
+            from bb.fetch2.npm import npm_integrity
+            from bb.fetch2.npm import npm_localfile
+
+            destsubdirs =3D [os.path.join("node_modules", dep) for dep in =
deptree]
+            destsuffix =3D os.path.join(srcdir, *destsubdirs)
+
+            dev =3D params.get("dev", False)
+            integrity =3D params.get("integrity")
+            resolved =3D params.get("resolved")
+            version =3D params.get("version")
+            requires =3D params.get("requires", {})
+
+            # Handle registry sources
+            if bb.utils.is_semver(version) and integrity:
+                # Skip dependencies without url
+                if not resolved:
+                    return
+
+                pkgv =3D version
+
+                uri =3D URI(resolved)
+                uri.params["downloadfilename"] =3D npm_localfile(name, ver=
sion)
+
+                checksum_name, checksum_expected =3D npm_integrity(integri=
ty)
+                uri.params[checksum_name] =3D checksum_expected
+
+                uri.params["subdir"] =3D destsuffix
+                uri.params["striplevel"] =3D "1"
+
+                url =3D str(uri)
+
+            # Handle http tarball sources
+            elif version.startswith("http") and integrity:
+                checksum_name, checksum_expected =3D npm_integrity(integri=
ty)
+
+                pkgv =3D checksum_expected[:13]
+
+                uri =3D URI(version)
+                uri.params["downloadfilename"] =3D npm_localfile(name, pkg=
v)
+
+                uri.params[checksum_name] =3D checksum_expected
+
+                uri.params["destsuffix"] =3D destsuffix
+                uri.params["striplevel"] =3D "1"
+
+                url =3D str(uri)
+
+            # Handle git sources
+            elif version.startswith("git"):
+                if version.startswith("github:"):
+                    version =3D "git+https://github.com/" + version[len("g=
ithub:"):]
+                regex =3D re.compile(r"""
+                    ^
+                    git\+
+                    (?P<protocol>[a-z]+)
+                    ://
+                    (?P<url>[^#]+)
+                    \#
+                    (?P<rev>[0-9a-f]+)
+                    $
+                    """, re.VERBOSE)
+
+                match =3D regex.match(version)
+
+                if not match:
+                    raise Exception("Invalid git url: %s - %s" % (version,=
 url))
+
+                groups =3D match.groupdict()
+
+                pkgv =3D str(groups["rev"])[:10]
+
+                uri =3D URI("git://" + str(groups["url"]))
+                uri.params["destsuffix"] =3D destsuffix
+                uri.params["nobranch"] =3D "1"
+                uri.params["protocol"] =3D str(groups["protocol"])
+                uri.params["rev"] =3D str(groups["rev"])
+
+                url =3D str(uri)
+
+            else:
+                raise Exception("Unsupported dependency: %s - %s" % (name,=
 version))
+
+            # Set package version in shrinkwrap for dependency resolution
+            params["pkgv"] =3D pkgv
+
+            urls.append(url)
+
+        def _foreach_shrinkwrap_dependency(shrinkwrap, callback):
+            def _walk_dependencies(deps, deptree):
+                for name in deps:
+                    subtree =3D [*deptree, name]
+                    _walk_dependencies(deps[name].get("dependencies", {}),=
 subtree)
+                    if deps[name].get("bundled", False):
+                        continue
+                    callback(name, deps[name], subtree)
+
+            _walk_dependencies(shrinkwrap.get("dependencies", {}), [])
+
+        _foreach_shrinkwrap_dependency(shrinkwrap, _populate_modules)
+
+        return urls
+
+
     def _handle_licenses(self, srctree, shrinkwrap_file, dev):
         """Return the extra license files and the list of packages"""
         licfiles =3D []
@@ -173,7 +311,7 @@ class NpmRecipeHandler(RecipeHandler):
         if "name" not in data or "version" not in data:
             return False
=20
-        extravalues["PN"] =3D self._npm_name(data["name"])
+        extravalues["PN"] =3D self._node_recipe_name(data["name"])
         extravalues["PV"] =3D data["version"]
=20
         if "description" in data:
@@ -184,6 +322,24 @@ class NpmRecipeHandler(RecipeHandler):
=20
         dev =3D bb.utils.to_boolean(str(extravalues.get("NPM_INSTALL_DEV",=
 "0")), False)
         registry =3D self._get_registry(lines_before)
+        srcdir =3D self._get_srcdir(lines_before)
+        # Replace reserved directories
+        if srcdir =3D=3D "package":
+            srcdir =3D "npm"
+            def _handle_srcuri(varname, origvalue, op, newlines):
+                """Update the version value"""
+                values =3D "%s;subdir=3D%s;striplevel=3D1" % (origvalue, s=
rcdir)
+                return values, None, 4, False
+
+            (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_U=
RI"], _handle_srcuri)
+            lines_before[:] =3D [line.rstrip('\n') for line in newlines]
+
+            def _handle_srcdir(varname, origvalue, op, newlines):
+                value =3D "${WORKDIR}/%s" % (srcdir)
+                return value, None, 0, True
+
+            (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["S"], =
_handle_srcdir)
+            lines_before[:] =3D [line.rstrip('\n') for line in newlines]
=20
         bb.note("Checking if npm is available ...")
         # The native npm is used here (and not the host one) to ensure tha=
t the
@@ -223,37 +379,65 @@ class NpmRecipeHandler(RecipeHandler):
         if os.path.exists(lock_copy):
             bb.utils.movefile(lock_copy, lock_file)
=20
-        # Add the shrinkwrap file as 'extrafiles'
-        shrinkwrap_copy =3D shrinkwrap_file + ".copy"
-        bb.utils.copyfile(shrinkwrap_file, shrinkwrap_copy)
-        extravalues.setdefault("extrafiles", {})
-        extravalues["extrafiles"]["npm-shrinkwrap.json"] =3D shrinkwrap_co=
py
-
-        url_local =3D "npmsw://%s" % shrinkwrap_file
-        url_recipe=3D "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
-
-        if dev:
-            url_local +=3D ";dev=3D1"
-            url_recipe +=3D ";dev=3D1"
-
-        # Add the npmsw url in the SRC_URI of the generated recipe
         def _handle_srcuri(varname, origvalue, op, newlines):
-            """Update the version value and add the 'npmsw://' url"""
+            """Update the version value"""
             value =3D origvalue.replace("version=3D" + data["version"], "v=
ersion=3D${PV}")
             value =3D value.replace("version=3Dlatest", "version=3D${PV}")
             values =3D [line.strip() for line in value.strip('\n').splitli=
nes()]
-            if "dependencies" in shrinkwrap:
-                values.append(url_recipe)
             return values, None, 4, False
=20
         (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_URI"]=
, _handle_srcuri)
         lines_before[:] =3D [line.rstrip('\n') for line in newlines]
=20
+        urls =3D self._process_shrinkwrap(srctree, shrinkwrap, srcdir)
+
+        # Add the package urls in the SRC_URI of the generated recipe
+        def _handle_srcuri(varname, origvalue, op, newlines):
+            """Add the package urls and git SRCREVs"""
+            values =3D None
+            # Handle SRCREVs
+            if varname =3D=3D "SRCREV":
+                newlines.append('SRCREV_FORMAT =3D "main"')
+                newlines.append('SRCREV_main =3D "%s"' % origvalue)
+            # Handle urls
+            elif varname =3D=3D "SRC_URI":
+                values =3D [line.strip() for line in origvalue.split()]
+                values =3D ["%s;name=3Dmain" % (v) if v.startswith(("git",=
 "http")) else v for v in values]
+                values.extend(sorted(urls))
+            # Handle hashes
+            else:
+                newvarname =3D varname.replace("[", "[main.")
+                newlines.append('%s =3D "%s"' % (newvarname, origvalue))
+            return values, None, 4, False
+
+        (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_URI",=
 "SRCREV", "SRC_URI\[\w*\]"], _handle_srcuri)
+        lines_before[:] =3D [line.rstrip('\n') for line in newlines]
+
+
+        # Add the package urls in the SRC_URI of the generated recipe
+        def _handle_sums(varname, origvalue, op, newlines):
+            """Add the package urls and git SRCREVs"""
+            values =3D None
+            if varname =3D=3D "SRC_URI[md5sum]":
+                # Add the urls
+                values =3D [line.strip() for line in origvalue.split()]
+                values =3D [v + ";name=3Dmain" if v.startswith("git", "htt=
p") else v for v in values]
+                values.extend(sorted(urls))
+            else:
+                # Add git SRCREVs
+                newlines.append('SRCREV_FORMAT =3D "main"')
+                newlines.append('SRCREV_main =3D "%s"' % origvalue)
+            return values, None, 4, False
+
+        (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_URI[m=
d5sum]", "SRCREV" ], _handle_sums)
+        lines_before[:] =3D [line.rstrip('\n') for line in newlines]
+
         # In order to generate correct licence checksums in the recipe the
-        # dependencies have to be fetched again using the npmsw url
+        # dependencies have to be fetched agai  n using the urls
         bb.note("Fetching npm dependencies ...")
         bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=3DT=
rue)
-        fetcher =3D bb.fetch2.Fetch([url_local], d)
+        srcurls =3D [url.replace("=3D%s/node_modules" % srcdir, "=3Dnode_m=
odules") for url in urls]
+        fetcher =3D bb.fetch2.Fetch(srcurls, d)
         fetcher.download()
         fetcher.unpack(srctree)
=20
@@ -289,7 +473,24 @@ class NpmRecipeHandler(RecipeHandler):
         (licenses, extravalues["LIC_FILES_CHKSUM"]) =3D _guess_odd_license=
(licfiles)
         split_pkg_licenses([*licenses, *guess_license(srctree, d)], packag=
es, lines_after)
=20
-        classes.append("npm")
+        # Add suitable npm class
+        if dev:
+            scripts =3D data.get("scripts", {})
+            if scripts.get("build"):
+                deps =3D data.get("devDependencies", {})
+                if deps.get("@angular/cli"):
+                    classes.append("angular")
+                elif deps.get("karma"):
+                    classes.append("karma")
+                elif scripts.get("test"):
+                    classes.append("npm_test")
+                else:
+                    classes.append("npm_build")
+            else:
+                classes.append("npm")
+        else:
+            classes.append("npm")
+
         handled.append("buildsystem")
=20
         return True
--=20
2.20.1


