Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59C0CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:27:08 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.69])
 by mx.groups.io with SMTP id smtpd.web11.214674.1697549217556090878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Jpk/AW6O;
 spf=pass (domain: weidmueller.com, ip: 40.107.105.69, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTPCFE+0xmX65Ov1VLxEkkQCmxAfl3ObsaedUy4p0dx9B9LQOuTcr1VMBV9iB4954qwTNyAuCYjF2esTcQEPMod1fhJo/jwaLjenki+A2GGPUExM89hN7KKFBqA9R1NEhL5H/aPoboCc57DkuxTNUe4G8f+/VxJGwuu6HpMJDtYsIfM0aYJsgf3KZ+MsUqXlBXDF+PMAVBt7TMYvT8sPg83HkLGBxepc5zNym0/qvZqawnKYJ6M3xMUBnviMxnfwV6Nc9kWG5qF1Y8l6lv3n2ruTD414EaG5dsu8ptqvooAbNcczJh4zNo3GFC2U2PB4BosJ24Qeh15u8D/DmWfuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7h1IIhEs0ajCmyrDEiNJPkzzc9Htiy3BdIRGzKaBwcQ=;
 b=ducivPOeoQU25PMurMM4p1yqatNQVo0W5ZMDfoTolCgB/hXp9wuBSrMEH7MDlnq+FR25p5syjR2J+cTGQYNtqVUVm/L9j+eS2bk3wtDIR6udYvt3vRZU2klCxY/WHyhDbr39mhScOG5bvaV/jtgADpNA5r8OSgKgQd71Q5DgD4WqThGCi7tLuXthRzyvPaDn7cKV4FNxdVa2CpBRnW5Cqw1KdTBemQ/P5FIIt8xF0qxSTX8l7Kut1c7lqhPzd4h/+m1t7+l099UtZqR9FuSoey26PIV9ItzxrK8ZiRB7KlmygJXmGkdjO7V4zYvaLEokkT772jTjuTrAP6YLd/ufsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7h1IIhEs0ajCmyrDEiNJPkzzc9Htiy3BdIRGzKaBwcQ=;
 b=Jpk/AW6O8qwsQhNrrKXrKyZY/sZt+ldnab5DCDBeXSChK8FgOmk2RwmSE+Nl/CpcxVsNXYl/V+oQ4ZCSAVxOrl09i44+38d6k/ebC+SQgDHFclZbnsr5eXK9yDdD4SuiUaTvsytslu4u5LrLZNN/lJ8CANQRtozxuWNt4pzzIzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 13:26:54 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::4d2c:55ba:282e:9a62%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 13:26:53 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Lukas Funke <lukas.funke@weidmueller.com>
Subject: [OE-Core][PATCH v2 1/4] classes: go-vendor: Add go-vendor class
Date: Tue, 17 Oct 2023 15:26:44 +0200
Message-ID: <20231017132647.352938-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 5462e3b8-0ecf-4713-ecf6-08dbcf14ba66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zmBVEuyrqAXqudsPMOcDInLrwRqD8qsHCHtJSrXEKv5unfa8jWO6I/KF+24MHk+rrqv4u9rHPl2OjXQeBjgvCQXEaEmZ8KX31fWyHYwe4HeU1dnUD7Leyaq8re7Q7uQUTrkKkvBtAivg0MIyCJHi38UlN5Pll32B8ooOQrsOYLMqgo3KxnvBRQA7Qp0ZIgMBgfVLQjy5TmCnV+yv+X51b8Pzv9cdDVlzLJwWPgO2PQUR5XnGDMsw4F7v9k5trPD0im3MJQTnZl8aY/9nPiJiFiMsq/FMamqurNFiqk7YIDdbwe74elivLhLi3zMOSsdFyKq3oxKhzH2JbJePnt165n9fsVmLG9Hu5B6IuNO/p69+uv8fiubHs2ENRy8lJvAEwiQZbWIl5Nlzr5sb4QdrExtc1aUand02bNm8am9nov0FX0gC1INJ+LNzK1n/c7Wb4WQqfRyUWYbPF6QoubMi/KWiqdePlYwf/3kQSObuqHoo+sI+z32n88Qn5YsbK4f4si7OAVhLCBQjtvp9GyERmG8Xr0tSt2o0HnU8Q8ogKucayCgG79+1RE3Ihghntys7GvBvDW8k7TPVTxMGM73eFSm6raOLr0hi4osY9s9BGjGCkVqzOn1kYq3hfO3RTgtmSgC5ulnrMPW4vsIumhad2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(6512007)(107886003)(6666004)(2616005)(6506007)(1076003)(9686003)(83380400001)(52116002)(54906003)(41300700001)(5660300002)(478600001)(8676002)(966005)(8936002)(6916009)(66476007)(2906002)(6486002)(4326008)(316002)(66556008)(86362001)(66946007)(38100700002)(36756003)(84970400001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0OiJD8ocmkBcrfFIRoRqv9flNxtP/6zSt+1ZdOF1o+3pf5jNF6iSLycRm5O1?=
 =?us-ascii?Q?gCz9DzaUA8L0s9jDwj5PIlE5QPUKpmFDksqCOLwSJ17FNfnRW/7/xZTN/vLH?=
 =?us-ascii?Q?UaCwkQZa18jFgBspSv0wrm3scRBpUydZVbj/7ADXVX9fWVeOz5ZBEzeT6ibq?=
 =?us-ascii?Q?wg0JO9WKqqURjKtJj0bErw2/DsN/PYmxOk7Of6XIxpU2fGFioXJ+6D3ryoXZ?=
 =?us-ascii?Q?Gf4P6UHNOIF1mEBfSU1dQEEegnK3qEpQr2c7vAb7w2x7gBAES7/7KPYPNn8W?=
 =?us-ascii?Q?T5YqXNYDjVEe9ayca33QtrpCtsWuxqjxedLn1RuOkXjUS2GTaY9nizIegIfj?=
 =?us-ascii?Q?BMBI2xAAh4zX5HwCDAggNASckircJSdG7T5qqNM+ogG1YYBvJLlrkQlcYlVS?=
 =?us-ascii?Q?u/z2Qf/H2hxS1d/DvVdjmzXzPckj7DG4w1OkjdSphsZlWlwx+v0PwYnWKuiQ?=
 =?us-ascii?Q?fowloLI+lV1S/to2gzqUpc0DC6Tbr1ARZ2blMbdnEGtgR1tk0V/pUWegBdPV?=
 =?us-ascii?Q?EerxvCnCGEBr5H0aDQ3hcc1NHqVpgb4HQLt2eNLo/t4lWDZ3psHdjGnCHU3M?=
 =?us-ascii?Q?lBqd8y72f5oEnbnSYb/jnTvB4OkMYSRA+NnR1zfpl5O3N0CwfKVZJiCQqj6v?=
 =?us-ascii?Q?J77Avxozy4U+mi1W5qNOwAa4jVlEYNwwiMj+ggWXrr4mKC33hsq8DZJpQxgf?=
 =?us-ascii?Q?7GE2zA6gJcDJDtvEZ46L/u9GADQdh4sGTZ9JSgkUYaKFECaOewdgGsMiuto/?=
 =?us-ascii?Q?3gqhYbDRsewbtx3XYpHnjDkdTl3b9ERf89Vzf1mYiYJcsBSQbaL7e46ArnM1?=
 =?us-ascii?Q?aX7r/OhhkPlPONbv/xHH7Zh7HwN59pJMQ0UMHo2JXA55MJHOxQxOlfe3sGD0?=
 =?us-ascii?Q?hhKUXhV/7SDEMDk9OeiEral4vafbgAphFD69hTnLfOrHOXkk0aZhEYcF+Kkk?=
 =?us-ascii?Q?4+DzOhgVz2LOEicuUZoogOY3Bb5gsjPUyJHI+5jz4qWpgN5kTN6/RfiQvAUh?=
 =?us-ascii?Q?E8I8Dum9vYkE77YRtpbf1dHIrxDR+2RS6KHxF4dzzJEgQI5DKy2B8RxiWs0z?=
 =?us-ascii?Q?z+rkevK4Gcv40IqJugF/A44McDGwD4Cy+dOQPTrdSMvfQVKRXbxzbsk3nYXY?=
 =?us-ascii?Q?77kMKeraZhSe736PG/x5dCE9ismpyGD0QZWVa4Obx3LzLUN4Leg17kDzBmqY?=
 =?us-ascii?Q?wxF+DmYZ6wVCSBHIAJAa9fEFW+F2EtfFZ+SvcyWHB8cOneJRTOH5TATrP/4F?=
 =?us-ascii?Q?fYMFLa550YR9HGvJAdJCBwiMCsy6NaA69M17NxigVjnuKvQK2k20C+x+dt27?=
 =?us-ascii?Q?mqb8MebxBaKWVPjfThiqDLynGTBvA2TxOjwts+eWtIef7tzkSjVhyoUtFRvQ?=
 =?us-ascii?Q?ACl7IKCtNa9gcY+GngQGKI/RMrmKZZllDLJChoZHWaW2VXop83MD/6UM7FIG?=
 =?us-ascii?Q?v9cbbPPNORh+KGBv5LmnjqaL6D73GSabRMasChC0wyfwFqRYCmnCvHGxataL?=
 =?us-ascii?Q?XUf0lFquLxmbUTtiPgeeH8gQKJPjH29HQAfNUFiXYpFiBE5c5G1Zrw5jj9XE?=
 =?us-ascii?Q?yjIVKaVsRw6n21LKT8gR7vXk+7UONuVREh+S6R0iwRufVEbKdaazOgPMUPJF?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5462e3b8-0ecf-4713-ecf6-08dbcf14ba66
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 13:26:53.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjOb17kPuHz+Z6kpM2b1bY8Ikl1wSlxogeHsqn5LuMX+G+29uDOcSdQeMQSbKOBWMvsJbQorpl5yv3guRRL2bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189328

From: Lukas Funke <lukas.funke@weidmueller.com>

Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
---
 meta/classes/go-vendor.bbclass | 135 +++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 meta/classes/go-vendor.bbclass

diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclas=
s
new file mode 100644
index 0000000000..13f1b8b2be
--- /dev/null
+++ b/meta/classes/go-vendor.bbclass
@@ -0,0 +1,135 @@
+#
+# Copyright 2023 (C) Weidmueller GmbH & Co KG
+# Author: Lukas Funke <lukas.funke@weidmueller.com>
+#
+# Handle Go vendor support for offline builds
+#
+# When importing Go modules, Go downloads the imported module using
+# a network (proxy) connection ahead of the compile stage. This contradict=
s=20
+# the yocto build concept of fetching every source ahead of build-time
+# and supporting offline builds.
+#
+# To support offline builds, we use Go 'vendoring': module dependencies ar=
e=20
+# downloaded during the fetch-phase and unpacked into the modules 'vendor'
+# folder. Additinally a manifest file is generated for the 'vendor' folder
+#=20
+
+inherit go-mod
+
+def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \
+                vcs=3D'git', replaces=3DNone, pathmajor=3DNone):
+
+    destsuffix =3D "git/src/import/vendor.fetch"
+    go_module_path =3D repo if not path else path
+
+    src_uri =3D "{}://{}" \
+              ";name=3D{}" \
+              "".format(vcs, repo, \
+                        go_module_path.replace('/', '.'))
+
+    src_uri +=3D ";destsuffix=3D{}/{}@{}".format(destsuffix, \
+                                                go_module_path, \
+                                                version)
+
+    if vcs =3D=3D "git":
+        src_uri +=3D ";nobranch=3D1;protocol=3Dhttps"
+    if replaces:
+        src_uri +=3D ";go_module_replacement=3D{}".format(replaces)
+    if subdir:
+        src_uri +=3D ";go_subdir=3D{}".format(subdir)
+    if pathmajor:
+        src_uri +=3D ";go_pathmajor=3D{}".format(pathmajor)
+
+    return src_uri
+
+
+python do_go_vendor() {
+    import shutil
+
+    src_uri =3D (d.getVar('SRC_URI') or "").split()
+
+    if len(src_uri) =3D=3D 0:
+        bb.error("SRC_URI is empty")
+        return
+
+    default_destsuffix =3D "git/src/import/vendor.fetch"
+    fetcher =3D bb.fetch2.Fetch(src_uri, d)
+    go_import =3D d.getVar('GO_IMPORT')
+    source_dir =3D d.getVar('S')
+
+    vendor_dir =3D os.path.join(source_dir, *['src', go_import, 'vendor'])
+    import_dir =3D os.path.join(source_dir, *['src', 'import', 'vendor.fet=
ch'])
+
+    bb.utils.mkdirhier(vendor_dir)
+    modules =3D {}
+
+    for url in fetcher.urls:
+        srcuri =3D fetcher.ud[url].host + fetcher.ud[url].path
+
+        # Skip main module for which the recipe is actually created
+        if srcuri =3D=3D go_import:
+            continue
+
+        # Skip local files
+        if fetcher.ud[url].type =3D=3D 'file':
+            continue
+
+        destsuffix =3D fetcher.ud[url].parm.get('destsuffix')
+        # We derive the module path / version in the following manner (exm=
aple):
+        #=20
+        # destsuffix =3D git/src/import/vendor.fetch/github.com/foo/bar@v1=
.2.3
+        # p =3D github.com/foo/bar@v1.2.3
+        # path =3D github.com/foo/bar
+        # version =3D v1.2.3
+
+        p =3D destsuffix[len(default_destsuffix)+1:]
+        path, version =3D p.split('@')
+
+        subdir =3D fetcher.ud[url].parm.get('go_subdir')
+        subdir =3D "" if not subdir else subdir
+
+        pathMajor =3D fetcher.ud[url].parm.get('go_pathmajor')
+        pathMajor =3D "" if not pathMajor else pathMajor
+
+        base =3D path[:-(len(subdir)+len(pathMajor))-1]
+        r =3D fetcher.ud[url].parm.get('go_module_replacement')
+
+        if not path in modules and not r:
+            modules[path] =3D   {
+                                "version": version,
+                                "src": os.path.join(import_dir, *[p, subdi=
r]),
+                                "subdir": subdir,
+                                "pathMajor": pathMajor,
+                              }
+
+    for module_key in sorted(modules):
+
+        # only take the version which is explicitly listed
+        # as a dependency in the go.mod
+        module =3D modules[module_key]
+        src =3D module['src']
+
+        # If the module is released at major version 2 or higher, the modu=
le
+        # path must end with a major version suffix like /v2.
+        # This may or may not be part of the subdirectory name
+        #
+        # https://go.dev/ref/mod#modules-overview
+        srcMajorVersion =3D os.path.join(src, module['pathMajor'].strip('/=
'))
+        if os.path.exists(srcMajorVersion):
+            src =3D srcMajorVersion
+        dst =3D os.path.join(vendor_dir, module_key)
+        if os.path.exists(dst):
+            shutil.rmtree(dst)
+
+        bb.debug(1, "cp %s --> %s" % (src, dst))
+        shutil.copytree(src, dst, symlinks=3DTrue, \
+            ignore=3Dshutil.ignore_patterns(".git", \
+                                            "vendor", \
+                                            "*.md", \
+                                            "*._test.go"))
+    # Copy vendor manifest
+    bb.debug(1, "cp %s --> %s" % (os.path.join(d.getVar('WORKDIR'), "modul=
es.txt"), vendor_dir))
+    shutil.copy2(os.path.join(d.getVar('WORKDIR'), "modules.txt"), vendor_=
dir)
+}
+
+addtask go_vendor before do_populate_lic after do_unpack
--=20
2.30.2


