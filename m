Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4590ACD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 09:26:48 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38844.1781861203444068503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 02:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RjVqM73f;
 spf=pass (domain: est.tech, ip: 52.101.69.26, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQpUOjQXSM8OTUB8CyKT/lN83WA/Cljdlv8UsHLMCqrrkcPIHyOQDUDd67DNLAvhq0E6FmpFsIst8va0ni4fsggWx3SOYCZ63cxYEMIzONc5Y2fqenFWcM5agAXgRgm0YKrjNuhE/f3LlRSeLNvUZVUdQgRrl4fXKkCDppoUC/N7ZYUg1jfaDYS0Fk/OZbk0G+JiM2WA7/X0MnCQgA9dSsT8AXR7clkfpiq6WJDvW2sDYPPlCRqHhgNrUjFFUekvIOWkSxyO+LK8BBg8WaCINfKpP9mL82MGVl7h7yb1fCKIHJXCMWCCnVai06vqL6NloqGXBqm5L4myVYau9U8M4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KNfVelhRt1u02OhO2Ujen15++ZlRPKWE86Yq97ZwTw=;
 b=OElWIkf+gTsL7q5hkdHqpihsbjB4KaKJO+mzYB271mGry7KHdAa+h3DKud7kM/QCTaXWoauIVwy/9FL8qg8ZNr7na0Jca8dqR2DwO51jbgGOPN+Wvpxobytnh9Jjk/fHyezARVys4elcgZVHih1tV6csSJBiaQ/n6dio05evmSusAuFITCUiXr8AJQaLehG+wXG+93C44x6AxnqDb+B7QCaKRYmFns5rum6H6y9ueZcq5EjXYAAKaxPsuFzjF4J0u1vr1iH7z+9Up/KFdJywqxwNLLZs0PMFKi9TGBUFWkok3OrbugaGVjzDly1+nG8YaFTjE8Aw4JrLgJN4kWvfGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KNfVelhRt1u02OhO2Ujen15++ZlRPKWE86Yq97ZwTw=;
 b=RjVqM73fBjgQ1RPM43PJRWR+jp76dMt7AUKc30JHRlyrsVeylmx9CGyqaRv8dZOwUpmAiAFxwnydO6KnPfgNrSsvDx92hkMmUZ21bnhjWTX+VK6zJ/vinYb7HsV/YChI2QChsQK7xPVK8c9mq6BF53MrBk3uCeQxtYekONnyNq8FomHDnIOSelHlFQQ6poA3lYOaShz+r/uUqqx94mzKiAClbeXBkxLbpVBiZgOLF5ivcLnpRRvIsMLVD94cqYZPe0ztfiIO2BSCTq0DGx7C6fblndKvtp/G7GzTu7czSQ4R6OVJE9VieS8t4VefHoG6vkHslRtHEpyYD9FGKx1hVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AMBP189MB3277.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 09:26:39 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 09:26:39 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH] oe: pass gcc and tmux commands as lists
Date: Fri, 19 Jun 2026 11:26:31 +0200
Message-ID: <20260619092631.1982181-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P251CA0007.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::9) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AMBP189MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: ac21bc38-438f-4bb0-38e2-08decde4ddc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0EP1a94ocDHNf2k7o8mQWnAy6OHqpQ6W0lxJfkJutgLQd4juyiuXzGbCPhGHOmrhmXI97AqgoR94/oYrnVTK5p3ACWtlOWTPIOcg0fujIH/ClF1oqCqN6sLdiWjton9sSlNN7c2/u+mQx5BSqNbeU9ElMe6k5Dsas+KA3apOYp4/h+2iWEIC7fVrJyVNedzrvgl/JSAO7ZrNGYD8YcSLdkbl0W9mlSVD5GerwwvhVtJkZNqqaa6WwEtO1Fccioh3jPaqhucFL5rnpjiz6nj9c/kbpW0AwVM/jB/hnTh41QQWvuyRpj2DIy1OtrVbGBNzs/ImgVyWmVoifaGIuLh9lCv1zLWQkpQB/c9r/WTtdjAdMpHTLteGOSFhCQMUna4k74bN+QP1GYNcxyM6QsvL1AU1Nf3t/BeGiKJHtBzUy4lxCMqdn5f7P/D9eXYN2x3FqhGX40gLX4ihAMBDg040sb5rlNmJaq2fCiLRSRaweAHPDBxBUpYd4jqp1rRyzNOeCMUDtj+4BgNyOY4jKxTOt3g/rYjhsZa1+4SsyNsRSpX+iu8fkq1QHkK3AwI/2c7FEnYUvu2u6IQ3xgGcLMyA6z5RcXmItNNvX5cWaAVqGKteaOeVTq1b1mkEHNfCv7NB/qBq3xYcHTTvr1YSgdXpg4GEmorZo5nF8ul97gMuD84=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rto/LNJAtEZ4aCubI4pVvHQ0Lw34BvBMfvpX0yOhAafWVZd6li/B3lSp4gte?=
 =?us-ascii?Q?9q959mXAOFQWbI+z/jCpStLjJfaueBgYVGAazOeg0TbZI+mbwcGR6thxWmUB?=
 =?us-ascii?Q?avcvKlTEvo3/sKxiz5+4jJjSd3JVHjBwBiP8cCpxorQMvPzHIDGsAYIjR1Mz?=
 =?us-ascii?Q?aLUZLwR3kSUcTo5aoJbFnqn/9oehEb1n+eUf6QD/Jqda76VJW5lizayj5rDk?=
 =?us-ascii?Q?dhg6UXbo63MrUszxGnBcdui1y9zfmyEkZ8/AM82o6dOZSJCtEVIA8DMEK6SG?=
 =?us-ascii?Q?pt8brHjOLPDGpRin0lLbVciNOmmx2MATZPr8rIdaoB8WHECnFL+JWsxtEzEd?=
 =?us-ascii?Q?d4f4FfMMWKb7RzYsG7DDLZayRRFgfl77vYh7NLeQzKH5a8iJb9LWX7z/Djz8?=
 =?us-ascii?Q?GD+3Nyx8Xp2kP7paAuKZmmeFlnhe5KJqF/auxaq33+EkCazhxanvpIo/xmKF?=
 =?us-ascii?Q?ezYZEcvVVmQ0SmFeM3ftuWOI/IQEXwUvRpugrd2Adqn3Wt+/fyYZHsIIosrX?=
 =?us-ascii?Q?GAPC9qnFnaGl2JwmciyX/YZ03KRbEWt849Q5pKc6uGq7garkw6kyPAhbYFWa?=
 =?us-ascii?Q?e5xpV/SS9vLUAVWFqdpVvOohwpGDPzh8PjLMZ+XSIpDCASUE9eoLNLyx7+1G?=
 =?us-ascii?Q?42eLPGIcEr/L4IECicGXL15ospkZQUJ/ITUf88IRbCXmuw9TL98LsjtjHUsC?=
 =?us-ascii?Q?3N5NhuhRHw1TkHY9NgIdg9g+C4L0GdUrFv6n16uZNf5NCBQJAoH0pWUkYBrc?=
 =?us-ascii?Q?mBuoFnrzjmfLhqnMwcQx1d/GhwdMPHTdXe3UTXWHTcNTi0A2JFIPwjpq2XVv?=
 =?us-ascii?Q?NMznxm+hWallRzEPyYWCtaDpNR/8Et8p254jgpsR4hIwDUpcADiA+nqZBtf4?=
 =?us-ascii?Q?hXlYfV8vcbUZ4Ek7GISSSfeiq01GqkygUdAwwqGoLXl5Zh61ZCwu1B5t4OaD?=
 =?us-ascii?Q?khFBj/7oBplnHnKfYRj/Pe8+XBFpsDNYbsz7Qsf2b4/QU2o3JQWVQ6uWhvYP?=
 =?us-ascii?Q?Sz1HkxbHzJSaaJuvJAinLAoemcNy5D1wxLGbPjbXo2dEhHtLyOlvCHnTWwZq?=
 =?us-ascii?Q?mtNgdsnSV9plyHATE8whkD1HCKxHJA0z/LQb+OSXyahnl66vJ8gaPuOIvlEZ?=
 =?us-ascii?Q?GxGjecqPKWwpyc2aIHptTaDdsZesH1wJ25u92dPuNtBoE1BFP98Jksf+ko7/?=
 =?us-ascii?Q?QyRVeqI2Do5K2eBCtpIgcKsvPOTqF8x8QOMTVdqSs0i053vHfilqgaHM1LRb?=
 =?us-ascii?Q?RpA05Io8vPmm0rlCqJDgtzUlOUsJVRtLlpCLX/VShUgTmz/ywZItc0Ob8GwB?=
 =?us-ascii?Q?1zUsrh3MBv26LuF+Oy7fqe6iT48wvIsFn7sd1KragUcpkhXRT/hrLLqVgrL8?=
 =?us-ascii?Q?xXJ7dPL4vC9MERCxrxhHafdo+Vhqd3nn7PzHaHmL8wDQEVfi65JR6ZJm3hvL?=
 =?us-ascii?Q?2flLpvNHp4KR0+Miq29d8mNZvVnsYenGiGUzgB7L06Es5Sx/DP21HvsX3oSa?=
 =?us-ascii?Q?hH2p5xZvJ3clbwWNu3YQ+Q4NJoIs9IrxEZGd+//P8r++JtA2yRWmjYUB5AvX?=
 =?us-ascii?Q?zkE5HXbJo1ZyRotdkKgj4+7ZoBJjqCQqGaKLRCUd8CHLgJgikRN6vYa6j6AI?=
 =?us-ascii?Q?FZiuhEd35ayfMnVs9WgTYu6EXYFJ9cHB49x44e3XBNxyWdeoWa1JV3Hkgpan?=
 =?us-ascii?Q?Ih7rB5n5MrO93CQfB4laDnvpVHZUfbQ68TKubYxmNUsNSeIO093ElDMVnIf+?=
 =?us-ascii?Q?SyrnEeZPOA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ac21bc38-438f-4bb0-38e2-08decde4ddc3
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:26:39.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGgmwAwo47Ep/0reLt7eigJf0qBPjmwVNXtGSh1zszgGy991iQsXkPRcHmAtaPJljUpdmbZuP0561Mj6wlJ8LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3277
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 09:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239155

Avoid shell=3DTrue in subprocess calls.

Handle OSError if gcc cannot be started.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/terminal.py | 4 ++--
 meta/lib/oe/utils.py    | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 013d77581d..ec65b616ab 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -283,8 +283,8 @@ def check_tmux_pane_size(tmux):
     if not check_tmux_version('1.9'):
         return False
     try:
-        p =3D sub.Popen('%s list-panes -F "#{?pane_active,#{pane_height},}=
"' % tmux,
-                shell=3DTrue,stdout=3Dsub.PIPE,stderr=3Dsub.PIPE)
+        p =3D sub.Popen([tmux, "list-panes", "-F", "#{?pane_active,#{pane_=
height},}"],
+                stdout=3Dsub.PIPE, stderr=3Dsub.PIPE)
         out, err =3D p.communicate()
         size =3D int(out.strip())
     except OSError as exc:
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 18c48a145f..558073d3b1 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -433,10 +433,12 @@ def get_host_gcc_version(d, taskcontextonly=3DFalse):
         # datastore PATH does not contain session PATH as set by environme=
nt-setup-...
         # this breaks the install-buildtools use-case
         # env["PATH"] =3D d.getVar("PATH")
-        output =3D subprocess.check_output("gcc --version", \
-                    shell=3DTrue, env=3Denv, stderr=3Dsubprocess.STDOUT).d=
ecode("utf-8")
+        output =3D subprocess.check_output(["gcc", "--version"], \
+                    env=3Denv, stderr=3Dsubprocess.STDOUT).decode("utf-8")
     except subprocess.CalledProcessError as e:
         bb.fatal("Error running gcc --version: %s" % (e.output.decode("utf=
-8")))
+    except OSError as e:
+        bb.fatal("Error running gcc --version: %s" % e)
=20
     match =3D re.match(r".* (\d+\.\d+)\.\d+.*", output.split('\n')[0])
     if not match:

