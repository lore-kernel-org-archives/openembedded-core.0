Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.82])
 by mx.groups.io with SMTP id smtpd.web12.3996.1611215108624660981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 23:45:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=o6EfN7Es;
 spf=pass (domain: windriver.com, ip: 40.107.93.82, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnJyAkbt5/ypuyS+EB+qc+odU9hLEfAmjoFMfxCwSC5sKaJ2Ub42hJCBzeSqOacNQCY2PEd1nciOShtfTDNd9ZCOlav6nq9mwnNHDEgErVsjD0EP+/5sNAJi1LGe+E8+yeUNqf1LQoZaq1mgWUmz8LQrWvYJpufxAHmYLpeyw1CnMr+Qzt+L7km5oFOjhi+oIx/oAYO6H1L6Lxg7VnqEgJ4vS1lAlckBbBWCV+VFrq/e4qOdaUPGttyWYxJbJP/1OnU6zJa096I1AGDIpTh0eNBRyM9slqPbV0dapLaXf5FBBWLxM1OEn9QJBkqTtJYgnYxDiar2ZBRXN/HLlpXuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwAvAd3rHx1mMcQqZ8wQTX5fbsBEHrTUZq8WvPwlWtY=;
 b=VuDkUhaO4TZLuO/MOlkvZZZASwtdlxE2/k1UWlhhD9YczSOL2SLRZ+RbGucmVIPN3FPk24i3p/cw8tE3XDlr1EhISXBTnjeoC8mqzxaBk76ZV9q/hdo4dvvZMq8r61RIwkMjhkE+zkA6lY9YLxggbfh276X3veNGHrocPqJHx2/2oygKO5gOCHkXLopA+iEQLAl469Vfb5ADqK8p17AwfZ0x2BLhwQnXjJl8aGwJkPfoR2bVk5D0kYaZ2jcaJ8H1lehwhCIUbDr/lBeHhBTOXCqIjSAEjleVRLlhKveuFqr7pgsbfC/B1POy/z9gofNnlQ2FLfsbDKt62y7VoPbzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwAvAd3rHx1mMcQqZ8wQTX5fbsBEHrTUZq8WvPwlWtY=;
 b=o6EfN7EsT7vfOaKhCxP0o0mheHRl9zN7JC9OySN3XTRTrEpvB6kmRKM30+C1Voc3d7j0Y2ioeT7CSSs16LoEgDhpt6g0FvBtus5lJQmGMkopP89U3aA7tJyGt00lRqnXSV/AqtSp+lWFd0bfJDgLQgtPsJ6S+uSTII/UY5zZd0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1949.namprd11.prod.outlook.com (2603:10b6:300:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Thu, 21 Jan
 2021 07:45:07 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 07:45:07 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] systemd: resolve executable path if it is relative
Date: Thu, 21 Jan 2021 15:44:49 +0800
Message-Id: <20210121074449.15457-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <4835fbae4a7172d0a6cf807b732f5ba8220c190d.camel@linuxfoundation.org>
References: <4835fbae4a7172d0a6cf807b732f5ba8220c190d.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 07:45:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0842fed8-e85f-415c-9aca-08d8bde07875
X-MS-TrafficTypeDiagnostic: MWHPR11MB1949:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19495552E5893A7701EA6AA0F1A19@MWHPR11MB1949.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nfRkeOznY8ez/cSVh+of8K0Vb0+LZOciBsKyeqJre3QxpOiqBIqCDZA38VPg5NwXsFqw62DeEBQJ/ccpi6R2aU6Do38xKA/DLmuSHlS+DN+RL3aAwlGxsdf7O1QDx2A+OrA3EWCf1mywLXdj+PDU4ZK8YjOYXBxAKqHxqnk/yii0Y2cBAYkC6QxrtCx4+7l4yPqfGwaiR6pJ1jhOFs8cz/72o3Q0ofnetkHRq7sZk5Yq+8ltj+XcrdggpswbYeOEY5qmPHuIDFhlxgWbOIAS5Q/Y5sxPNfeu/MTfTwb2RziGPWlbScy+TPgheruygvXkDzzlq+d0qvPMxiJRVDPY89O20AjTw/sw9L3aQIdngbeiXs8OrZiQA5tkVsk53/A9UFgw+Sb5JIlmf9eliinPMgZz6BXd/llCBpacfrjA246WvBcwxuz0hxHNK5TMzzCq3yPJhZADrkQrM5INEqyubg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(6916009)(6666004)(186003)(316002)(2906002)(66556008)(2616005)(956004)(83380400001)(5660300002)(26005)(16526019)(6512007)(9686003)(36756003)(8936002)(6506007)(1076003)(6486002)(8676002)(478600001)(52116002)(66946007)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?SC7nfvtmHcterj58Bqp5YJ5jtwqjnToo0BNctYTZ53ebyQ0ZxutryvXb0z0c?=
 =?us-ascii?Q?T+d6fcPkoLWWXHstOvFYw3JbdC2o8lspkYxA9JZo3J1NjafprMkCDS9055EF?=
 =?us-ascii?Q?HFZTP20IuQa3cz4pwe68ipKFp8KCJnBpxkYynG5niNgKKqNUoNNTLMkYXj30?=
 =?us-ascii?Q?CR+S4pqz7zoHjJqmJydlAPp6YBoMHxfLyC9ACJtK35div6BYEfsaqy4HCnip?=
 =?us-ascii?Q?S3EwgwdmSo9LlX4CMnpFkTKQBVbpFAY894lcVKZTT5UicJCI5AMifBRJYOQa?=
 =?us-ascii?Q?mfdU77aYv2neykv5KxwqD2IXy5pu/UMqnPdPtxNNdKpt643T053vyxRttfki?=
 =?us-ascii?Q?CIoDsDZGrKqZuTB+q0xRHsdVIz0asji2XRflAvGyw+yALHoNfFGfWsOWzEWX?=
 =?us-ascii?Q?NjWvTOnY4UoemqMSvARThNao2PDAWbzcF0bxFoduUnE7i1p5EPvuzbpgRE4X?=
 =?us-ascii?Q?+Aei/vnSyeKYQoNeec8mvsbb1qpFDKLeYllqClQ+og8gDfCKGjoknV3F04p3?=
 =?us-ascii?Q?RAOUqIncW3+Ri048QUG0znc+Dctf5BdoVloNxiTimImF2e/Bqh+yHh69f1q+?=
 =?us-ascii?Q?/axNMQcWqUYY2FsANuyu7IgOqQK8HhuIeOwbPgxYz+SUxFp8MvkYTl2rmbJz?=
 =?us-ascii?Q?goUqcEGqdDYXZUNTleYIyd+JTvAo4DRcRi3Bi06u8iOWMsB2fqA6na6PrmZR?=
 =?us-ascii?Q?HvPQ3SsORc5/VzMALIsQjU+tvSAig+eRQAwKT/4AR+W89F/SuUPF6kmwsQVO?=
 =?us-ascii?Q?dQMVQJ8BSDgms+AcCjV/UYWW/HBPgp2393tOh7yC/qkhDPft+s89GUVUBbGJ?=
 =?us-ascii?Q?eXoZNSaNDFqYiMog6rDVdg6n6iO8fQQstBKBlx0az0TqrrvoYNb1K4HgPGYB?=
 =?us-ascii?Q?BbraHk40tBOAQkrptplVIJbuAfXAew5Yq1dt4wfhYllgIDZ5cNwKHlvWe1/V?=
 =?us-ascii?Q?L+c78XCsZh7G/t9AmDxn7JxE4RwOy6wfjNPonlDpOkLMc8cbsb/RwPM4CImW?=
 =?us-ascii?Q?yspq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0842fed8-e85f-415c-9aca-08d8bde07875
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 07:45:06.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52yTCUT21tRfOZFPRToTFS4BaOLLYU2nnS9CTWyqcDkf1tIihFmraimmjrSP5qGpZWjSdLp0idTH1TLhQXsEgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix the below systemd-analyze issue:
 # systemd-analyze --man=false verify /lib/systemd/system/initrd-cleanup.service
 initrd-cleanup.service: Command systemctl is not executable: No such file or directory

 # which systemctl
 /bin/systemctl

 # cat /lib/systemd/system/initrd-cleanup.service
 [snip]
 [Unit]
 Description=Cleaning Up and Shutting Down Daemons
 DefaultDependencies=no
 AssertPathExists=/etc/initrd-release
 OnFailure=emergency.target
 OnFailureJobMode=replace-irreversibly
 After=initrd-root-fs.target initrd-fs.target initrd.target

 [Service]
 Type=oneshot
 ExecStart=systemctl --no-block isolate initrd-switch-root.target

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve-executable-path-if-it-is-relative.patch | 39 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.2.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch b/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
new file mode 100644
index 0000000000..fd7f94a61d
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-analyze-resolve-executable-path-if-it-is-relative.patch
@@ -0,0 +1,39 @@
+From b9b7a8e3825f0433e120f7a6d7d5d635a839cab9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 21 Jan 2021 06:19:44 +0000
+Subject: [PATCH] analyze: resolve executable path if it is relative
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/f1fb046a985521f7d4a662f02546686ff20b7e5d]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/analyze/analyze-verify.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/analyze/analyze-verify.c b/src/analyze/analyze-verify.c
+index a9c89173bf..969523df18 100644
+--- a/src/analyze/analyze-verify.c
++++ b/src/analyze/analyze-verify.c
+@@ -115,14 +115,17 @@ static int verify_socket(Unit *u) {
+ }
+ 
+ int verify_executable(Unit *u, const ExecCommand *exec) {
++        int r;
++
+         if (!exec)
+                 return 0;
+ 
+         if (exec->flags & EXEC_COMMAND_IGNORE_FAILURE)
+                 return 0;
+ 
+-        if (access(exec->path, X_OK) < 0)
+-                return log_unit_error_errno(u, errno, "Command %s is not executable: %m", exec->path);
++        r = find_executable_full(exec->path, false, NULL);
++        if (r < 0)
++                return log_unit_error_errno(u, r, "Command %s is not executable: %m", exec->path);
+ 
+         return 0;
+ }
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index 455a29affc..6abb27747a 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
+           file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
            "
 
 # patches needed by musl
-- 
2.17.1

