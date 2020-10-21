Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.50])
 by mx.groups.io with SMTP id smtpd.web10.17340.1603308628099366908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 12:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eZIFvBwX;
 spf=pass (domain: windriver.com, ip: 40.107.243.50, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDAph4r5fSslZSxkCazJ2QoA7WoL+cKLnHMwo9v9XzdJ2HM3cFg0YNibWaF+uOsxKkS0F20urU3GQwvcwJ/me4eKOXtvJHJgAGcef6EIXUstkQuA+dWrZLpawmxfpka34BUqxJ6AZ4AW1ocdE+u/lcGYQkgYovNkD4UMcml0KQ4o8VVAaOcKP/Z8Xo4/PHucB5OrdbhA+Blg4Vdhl532UAGHq5ssP9PnEvjtL6TcCfAMYeJTxqYV63zLG2dm50ROLJtb5Ay2l3QzLte7sA4lIY5oKHDj9j7s39YiXUTswc54h3coH+EWy/hRh/VM/SWyNUKfaXP8R9TBtEkImdPj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipg0jU7ou+9gTKMcM4sC7O9363XawDFCrzn5dXqXNgg=;
 b=Z+u+v4s3ut24RT+PfKauazmsqD3iq2tNIqFINN1YQClntDwrW7F2fl14dvHZrtiN1eBRgizS2a5dxejhCIV3N3m+JlYbKC6gN5RVq0qcfBAXZm2QQuUB1Ds2UF7RURIWyqbeqXUdSJlu9reT06C9pL7bZ7VPIz3IKOreJeg2OH31eTwY4ZdrgYSAOiYhIfFtZ121jIrL+iIr28eVqZaVB/bVWVB3wi9Ai0F2AtKqao9qka5HkR/4Mvki3wkZe+zq0cNnu7TuzIdrnJY0YQAkz10gQfWM/Tyt1A/4zW6iBJSAJ4EzQBQeRmmPZX4fXyNWRfYJPY/bPC7zRhgTDZNJQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipg0jU7ou+9gTKMcM4sC7O9363XawDFCrzn5dXqXNgg=;
 b=eZIFvBwXgL/Sa9YCIHDW30oFNmQZt3G9rfSk/dcrVaOnD6ci1exeKdpRqF4LK37SKk1JclEH8G8CMeYk2oi499mtCtrMafS8wmJPpOWYWS28LMKryIHyRQ3CLZrVQrg0As+PJPdV3Tn4/xOWFPzEkClfzVW6VKK2pwMXUdi2Uxw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 19:30:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 19:30:26 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC][PATCH] buildstats-summary-native: add bbclass for tracking native sstate reuse
Date: Wed, 21 Oct 2020 15:30:09 -0400
Message-ID: <20201021193009.3279776-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 19:30:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 873746cf-9eb1-477e-9164-08d875f7c2ae
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4911:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4911A423F5663C718D4E48CA9F1C0@SJ0PR11MB4911.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hvUQf/MizglqbgO4qgpA6cQCDufOp0Y9Kp3YZ2vr4ctvWH5g4thBx+M8uq7kfX6pqZ0yFOZFkwWp6+qwGORaYGFz80YQucdkB2dDFdqIVK6PfYHcv6KNa++znIwqdcT6jmBWK8uG+ZRZSV4cbF2vmb01QjmOpvEM5fGD1PIJjD81Dv4PeYYKawMahDwXKgkPOfF78bGFgDCcQtKZ/wE7p1fnPqHHipbbSYhXXn3bHBPYgahSGOkhldpHxZ+9AlMWU78tKKFRmBjSSSFG8EthWrsvDW9pkK4PhdUbLwOlao6QMYLWF+Lzu0dqP/cPuMQPibvGq1+Ca/gWG4cDu+piMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(16526019)(478600001)(86362001)(5660300002)(186003)(2616005)(1076003)(956004)(52116002)(316002)(6506007)(2906002)(6486002)(66476007)(6666004)(26005)(6512007)(8676002)(6916009)(66556008)(66946007)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dpmXx1jY1lCd8CQQuOvWRiNdKcbzasFh46VQp8XcGJ4oKGGSesd2juisXBfFaBGRTBQoGpgbFZoqynywJxkFc+pTr/1B+McJEmWck8RJtVVley68Blo7XLWIdTDtoTp9SAkvvRfVH/0vqZXe7eEuW0wa1/F6HE1Q42/RKta7vnsd5Tmr4v922Giw0JzQpETtkNRhwdd1gd52X1tT9/pQ7YH6qm04GdBRHMu0SesJG/FAfbS66qzWOPIPsfXBxGGITGgVEY4StwQgxK9Cd0o6ynt8jUMmRmGVdrfhwHjQBMAonDOfhL7qa/L924x2S2i1Js0V4mObJxrAnjt5WuAY+1KnJ4BaQR1dBDPub94+thQDtM+TyxmqrO+g+j8nExk8ibOTNa6+eyc+dMRrHjEVAXVxe4iRyKmRKIZs4ojNOrm4nA/koh88UaoKJslpiIM7a06xcZz60k/pFjhFRNtNYJP2tXI0Me7xKWKv1bDWLM2J/ZOAh4TAADu4Ah1cvbPxC0/IfBPpASTEf1io6ZYy0vWriyZ2lU4ie1zzJraNYGgEHsueqxdTjw2cIpnXSBXVz3288DV9HRUrqJl14R+9bWrMoOSoFtqjN6TZjBcS31kifmV+2OEi8OkvXfRQ3aoHCAUAZmJdhXM1ndlp9PuDhA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873746cf-9eb1-477e-9164-08d875f7c2ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 19:30:25.8996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbnC8r51e0ppbMOonWxUX3jMsoRZLlMU+n9kUm7942XokOE2dxzHo4soBXMgSaaNCfdw2wTHu8bZnoz1lI+cxLsJD8ZFxYk4ewmMPgxGdew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

buildstats-summary doesn't distinguish between native and non-native
sstate reuse, where native sstate reuse in particular may be useful to
track when sharing sstate caches across multiple target architectures.
We can tweak buildstats-summary and add a buildstats-summary-native
bbclass that is more explicit in reporting sstate reuse, as well as
making the output more readable for parsing by other scripts.

Note that (as far as my tests have gone, anyway) do_package* tasks
haven't had any native reuse at all, so that result should always
be zero unless something has gone horribly wrong.

An example, where core-image-full-cmdline has been built after the
sstate-cache has been filled by a core-image-minimal build:

NOTE: Build completion summary:
NOTE:   do_populate_sysroot: native from source 5 of 139 (96.4% sstate reus=
e), target from source 35 of 161 (78.3% sstate reuse), 300 total
NOTE:   do_deploy_source_date_epoch: native from source 5 of 139 (96.4% sst=
ate reuse), target from source 36 of 162 (77.8% sstate reuse), 301 total
NOTE:   do_package_qa: native from source 0 of 0 (0% sstate reuse), target =
from source 37 of 159 (76.7% sstate reuse), 159 total
NOTE:   do_package: native from source 0 of 0 (0% sstate reuse), target fro=
m source 37 of 37 (0.0% sstate reuse), 37 total
NOTE:   do_packagedata: native from source 0 of 0 (0% sstate reuse), target=
 from source 37 of 159 (76.7% sstate reuse), 159 total
NOTE:   do_package_write_rpm: native from source 0 of 0 (0% sstate reuse), =
target from source 37 of 159 (76.7% sstate reuse), 159 total
NOTE:   do_populate_lic: native from source 5 of 139 (96.4% sstate reuse), =
target from source 37 of 165 (77.6% sstate reuse), 304 total

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../classes/buildstats-summary-native.bbclass | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/classes/buildstats-summary-native.bbclass

diff --git a/meta/classes/buildstats-summary-native.bbclass b/meta/classes/=
buildstats-summary-native.bbclass
new file mode 100644
index 0000000000..f8e502ca7d
--- /dev/null
+++ b/meta/classes/buildstats-summary-native.bbclass
@@ -0,0 +1,55 @@
+# Summarize sstate usage at the end of the build
+python buildstats_summary () {
+    import collections
+    import os.path
+
+    bsdir =3D e.data.expand("${BUILDSTATS_BASE}/${BUILDNAME}")
+    if not os.path.exists(bsdir):
+        return
+
+    sstatetasks =3D (e.data.getVar('SSTATETASKS') or '').split()
+    built =3D collections.defaultdict(lambda: [set(), set(), set(), set()]=
)
+    for pf in os.listdir(bsdir):
+        taskdir =3D os.path.join(bsdir, pf)
+        bb.note(taskdir)
+        if not os.path.isdir(taskdir):
+            continue
+
+        tasks =3D os.listdir(taskdir)
+        for t in sstatetasks:
+            target_source, native_source, native_sstate, target_sstate =3D=
 built[t]
+            if t in tasks and "-native" in pf:
+                native_source.add(pf)
+            elif t in tasks:
+                target_source.add(pf)
+            elif t + '_setscene' in tasks and "-native" in pf:
+                native_sstate.add(pf)
+            elif t + '_setscene' in tasks:
+                target_sstate.add(pf)
+
+    header_printed =3D False
+    for t in sstatetasks:
+        target_source, native_source, native_sstate, target_sstate =3D bui=
lt[t]
+        if target_source | native_source | native_sstate | target_sstate:
+            if not header_printed:
+                header_printed =3D True
+                bb.note("Build completion summary:")
+
+            target_sstate_count =3D len(target_sstate)
+            native_sstate_count =3D len(native_sstate)
+            target_source_count =3D len(target_source)
+            native_source_count =3D len(native_source)
+            total_source_count =3D target_source_count + native_source_cou=
nt
+            total_sstate_count =3D target_sstate_count + native_sstate_cou=
nt
+            total_native_count =3D native_source_count + native_sstate_cou=
nt
+            total_target_count =3D target_source_count + target_sstate_cou=
nt
+            total_count =3D total_source_count + total_sstate_count
+
+            #do_package_qa, do_packagedata, and do_package_write_rpm won't=
 have native sstate, so declare them as 0% reuse=20
+            if native_sstate_count =3D=3D 0:
+                bb.note("  {0}: native from source {1} of {2} (0% sstate r=
euse), target from source {3} of {4} ({5:.1f}% sstate reuse), {6} total".fo=
rmat(t, native_source_count, total_native_count, target_source_count, total=
_target_count, round(100 * target_sstate_count / total_target_count, 1), to=
tal_count))
+            else:
+                bb.note("  {0}: native from source {1} of {2} ({3:.1f}% ss=
tate reuse), target from source {4} of {5} ({6:.1f}% sstate reuse), {7} tot=
al".format(t, native_source_count, total_native_count, round(100 * native_s=
state_count / total_native_count, 1), target_source_count, total_target_cou=
nt, round(100 * target_sstate_count / total_target_count, 1), total_count))
+}
+addhandler buildstats_summary
+buildstats_summary[eventmask] =3D "bb.event.BuildCompleted"
--=20
2.26.2

