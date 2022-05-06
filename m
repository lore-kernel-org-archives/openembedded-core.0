Return-Path: <pawan.badganchi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CA6C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 08:07:25 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com
 (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.54])
 by mx.groups.io with SMTP id smtpd.web12.7015.1651824437098371141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 01:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=KN7hmbQW;
 spf=pass (domain: kpit.com, ip: 40.107.138.54,
 mailfrom: pawan.badganchi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkCyYx0bMdJnLOrz3Q5Jyo7eJcSGtc0rtpgsvLH5vQ6aw/34YfVTyd/wJVdQKMwyzW4AuSjKt5y15fWj+ECBWIuj3KkdywZkH0G0UDz1xs173zsOtdm+A4mrLVv7Ykkuz+7EGKjnALV0wsi6DybRSAaDonEMUd10p5mc0fmLc1OedEQOFFnyhc702k9h5hXBqSWm17r1qAn9Ak+qditv5RJrv/lEc0Clux4yBj+D6HoHaaER6H/HnSLA4rbr3Vxvwq0uUxomqf0+Ej6Y+ImXsPALVH8mUAb3eHvKxI24/zF7BTksZyt/0LWTKeG6rnRWhus8otzFqYLnc3f0RWejzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0avsyv8EmLwP8gSSZhLj90Jc+9oUhhYqI3f8xq03sPk=;
 b=AwB0crqXKhWm9P/dMhqwgUuV2yvr8iQ+H0oKs4i/G1tbCNfIrkWDY7xK6cWhgXu9zD/KAxho2X2lhk4bm1QEwtNWdjZEp/GAQPheYLdh/gBb8J7bC11/S2BU/DhTRFNFL3myIfXuBudv6uYTosZ07gRl0kwbESZZYE5FreZfTqAnY+EFD6HGLefBKwJWbnH7cTqDD/hpZt2PO6BZ6E1yxRLepADbQUFk26Efcwo1lpfzX428VRRWUg9d98dbS69jpzMIRhcCmrZDUBwuIpcqDxXbipPUJmxnDzDzts/Tf4XchnQZsC9ix79bgkLOsmIAYr4MWPPRi/Hw4aNTQuZAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0avsyv8EmLwP8gSSZhLj90Jc+9oUhhYqI3f8xq03sPk=;
 b=KN7hmbQW8kIDpllLu2hzl87naabdkrTgq+2KoE27hQGqI2cq3UlCI4OX3E2u/gzTJNTyxneQo6FdbDwyMrhC3C4+Q6Ge5AyRalq5qndRMlac5hi7phF/ITNeu6JQzvAKTwT5VBghRoJ2vYtaaqPgMJwN+iVnW+VVo7ESKgr54NU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11) by MAXPR01MB2254.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 08:07:08 +0000
Received: from MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4]) by MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6c6a:548b:35fa:55e4%4]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 08:07:08 +0000
From: pawan <pawan.badganchi@kpit.com>
To: openembedded-core@lists.openembedded.org,
	pawan.badganchi@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [meta][dunfell][PATCH] libinput: Add fix for CVE-2022-1215
Date: Fri,  6 May 2022 13:36:52 +0530
Message-Id: <20220506080652.18787-1-pawan.badganchi@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PN3PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::18) To MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:28::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef81540-7fbc-450b-74fd-08da2f376a33
X-MS-TrafficTypeDiagnostic: MAXPR01MB2254:EE_
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB22542C2C111EE558093BCA3799C59@MAXPR01MB2254.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QYCJQACGNhTprk0MsfBht9jv3t06SQPisBVXDpGyn9fDfTmSJkdqXUgPWmIKst3tJLBNUtTuS/I2dmkPY7aSGF/Oat/fTjIJ0vjpJPBdFkA7j1eUdUUj3QAZK8yUpNU6cTNJq9DCKxz5o1sQ0PDw7Q7rfpJyFifvdBgfQn/1oL2Wy48ec3fS3jjOV3qGGl6NysK7KrGGZEzE20wUYC1nJo6rdg3Im0YmwThol1D8aJeap/WGpIkFgrviMLVKg8wt81KUr+aduN3Oic2X3L9OYh6wG2p14X25ERFP3bTEXuGISnh186lFWuuJIBm/QL/MsP+JbA0wiRtYq7FfZlk+2xbenf2/6JLxvGAm9ZiH7Xvl3hQ6y6sATxFp7dvJQvMq5peZjDO7bnhk8+vAuifNhpSBItoEASRRAY8NZko8WIBZmn9GO2h/l+Pa/Ldx5xas+AjYY1uKvuINXnkE6rAtMQm7E6bS/MyOp+DBiTJUTbPAncvy/CpOzrpZBSYziYLmKUS40NV3uJANPVQgKPsSozbdNQCe807KVhZNMF3nwV8oC/f+iWmk56QxMMhx0rDNR48fhoGGiAQD4RJ1JRkYhBf3cwdatM2HUtqW/mkldnbUvpbnQB2blfLt44kCMKJD7rzto/Xun9gbi4AYiwkTtQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(316002)(36756003)(83380400001)(5660300002)(4326008)(66556008)(66476007)(6666004)(66946007)(2906002)(6486002)(8936002)(966005)(30864003)(8676002)(6512007)(1076003)(107886003)(6506007)(2616005)(186003)(52116002)(66574015)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zy8vZGU0OUVQS3RvT1IrTWw1b3h0UGxyRDNsNWR3TTBGaFp4L1JGelhhQVEz?=
 =?utf-8?B?dkFWQWVMOEpyejdiV2thc3NqT1dxaGllMEFIcEpBOVYvZEFkWE1KT0lmTE9H?=
 =?utf-8?B?WWRmYkNEVFJ4UnJqUFl3QXhUcVUwYVhoRG5FaEI5UE1XbHM5czVCcUhQNXBM?=
 =?utf-8?B?elh0dXZJNHJXWVdBNXdQZTdiVWN2UHFUSEFFTWtDNDZmK3JJeTNMYzkvTjFR?=
 =?utf-8?B?MkUzRUNzbUMvVUQzM3pPS3p6cDM4UXF5MUk4SmIxVnpOOXg2WVFBRDVrc2pO?=
 =?utf-8?B?cndqdWtrMCs4cEIvMmhraGJNdUpSb1Znc3MrSTQrRGZ3TkprUjM2RzJMNWI3?=
 =?utf-8?B?d3VRNkxpUUdRbVpOMjdZUEtqS3RadXBTa2tYT0xYcVRXSVJXN2NxdENRRlls?=
 =?utf-8?B?eWdTRDVLaWNOSzNSWHJiQ01UK2ZTSUNLMk9nNDVtT0YwbXVVbkJJYVZmNkFO?=
 =?utf-8?B?M204cHhjWXZkVXhockVWTUpYNUJKTG1NaE05NEhQamNRVGJCeHFlK2tKOUI2?=
 =?utf-8?B?NThnNHY3WTcvNDJkVHgxazljbEJSTlBGQk9IekVNWFdKeHRXNk5EVXdZUStG?=
 =?utf-8?B?SFpEekZBWjNyZVYzeDlRbWxNZC8wWjR1Q2JiUHcxVitZQVRCWXo3V2pLdVZs?=
 =?utf-8?B?cWJyRjdBdU9xRkVqZlNhTU5ZSHhnUmdEbWgzRG1IYytXczZ4K25aZmxQeHlw?=
 =?utf-8?B?QitQdGttazVLSTl4TytKUktCbmhFTnhmeHN1VWdlUDMwRjBWQm5JTWVMZW9n?=
 =?utf-8?B?WTBiL0hQd0ZUK1JPOU4xUGtBMEZ5enZuTllpajJsUVpLaGFjaVlVYUxvNEw0?=
 =?utf-8?B?WkUxZ2lvcGxaempQTVVMMHdERE8wKzBxNkhRRUI3a0JPSDdvZHJlcnZSUDlo?=
 =?utf-8?B?K3I5TklOR05MMlFPQXZuQytUT0lWbWRiQldWNHFJTlZNSHViRlBGR0hQYmdF?=
 =?utf-8?B?dWxQQVZiZnpZWFFmeHI4N0R5NXZOMEVSYjJYOTJtTGVCbGpjN3dZN0x0eVli?=
 =?utf-8?B?c1F5RmR5dW04WUUxWnljeTdKeXdWNkw3b2FUYTZjRnI5SUVQdEZlaVRlYzJ1?=
 =?utf-8?B?alIrM0VpU002NkNHdmJ0cW9XeThiRVNxdUNWcHZmc3JTUkppbVJhT2d6MXVk?=
 =?utf-8?B?ZWpBc3VrMjdHY0lLOG54OHFyazhPZGVVU1IxdG5kT2dhSVI3bVpza0l4SHp5?=
 =?utf-8?B?QnUzN1V2VGZ0bnZDaFNNNkJBallMMldxa0xiUGRCSGc1L1JtUGE0VVEyRW9Z?=
 =?utf-8?B?bmo0b016QWgyWml4SjNtbEh2aHBOdVFoOXN4ZmZ6MklTT2V0cHg5SUZVZkpB?=
 =?utf-8?B?VnBQMGRuZEYrODVlSHJPRERpcjBkRmh6c2l2SmQ4ak9QNG1ISHFlVy9IN3pO?=
 =?utf-8?B?OHhHd3REekluSnZwSFB3RGNFQXhUZjdJY1J1MEVqWGFLV0Y1d1h4bVlkY2Mr?=
 =?utf-8?B?RllNTVh2aCs1eGFsUFRaaGdlbDAzWVhiVHorRUFJc28wN0dRSnd6dVpKKzgr?=
 =?utf-8?B?NUg0Ny9Ib2JWTG5PM2ZpSkw5WVBFSW50TTF2aFBIRUZqSU9waERFWWFzMzIy?=
 =?utf-8?B?YWdMWjFhK00vK0xxTXcvc1FLbERtaElDUThJT3lmM2xaV3B6NVF0NVJtQ0xh?=
 =?utf-8?B?ZXl2RUhTN25CQWRHNUo1aDIxaW4yN0lYc0JsYnpxTi8zRFU3cWpQZzBUM1hU?=
 =?utf-8?B?MWlSamJvRGRidDNoNjkwbzNpUFRSQUdWeXp1VUZ3SXVvRitvWnFVU1NmK2Nn?=
 =?utf-8?B?Z2w3dk1nd2g2MFVuT1dabGd6MlRNMFZMbjFaa2g0TlpQSkhHZm40bHNXemlW?=
 =?utf-8?B?QVk2VUVQbGt1OTI2ZVlEc3VOQkpMbU9ZaW5VNUVoQkJUVVA3VTI5RkZCYnFu?=
 =?utf-8?B?bXJqemRrNnNYUG83c3hocmRyM0U5amh3bTJ0dWhiRzhmcEt5bTRrYUZYSUUy?=
 =?utf-8?B?WFlGbWhyNFZZNHQ4Uzc2ZG9GOHUvaEN1SXY0VjNVNjRxeUx3SlAxVWZqTlNH?=
 =?utf-8?B?U3ZtaGNndW5zcW1lQU15cGhCdUwvNjloa3lYVERGMGtJNmExeXkxeTZMQlIv?=
 =?utf-8?B?bzBGN0UxbVdGTytuYVQ0TlUwelNSU1JYclpyR3hTRWE3dkFWWCt1aFhzSUp0?=
 =?utf-8?B?ZkpsU0owdCtVMElNZlZENzVzL0ZqQURiVFBRUkNORkc1WWhwMjRGMVVqTjZM?=
 =?utf-8?B?TlBRR0dFbDBRYU14aUlmVHI0RDdsdkw2N21kK0xCa3BLQW9wK2tLeTNGWVps?=
 =?utf-8?B?L1hNWHBwbFNzZnZacFdWUmUvRnBqMTh2NCtDbnptekx0THplUnNCVmZxUVBi?=
 =?utf-8?B?SXNRS2Q1dFlMd2xOMTB2c1JuVXZGaldWdXhFazRHaFBZQWlRN3dMTG9jWWk1?=
 =?utf-8?Q?leGRvg64N4oAvVkJGanC61q0FNXAUHX+dDbceRIYDKgs/?=
X-MS-Exchange-AntiSpam-MessageData-1: SHuxw+aiFAcKhA==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ef81540-7fbc-450b-74fd-08da2f376a33
X-MS-Exchange-CrossTenant-AuthSource: 
 MA1PR0101MB1462.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 08:07:08.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 x+va+63yTlD66wf1qHeA/A4wrf/JjX1mGOjh2kxngLwUNsiUOCGBT3F7x9XvB2lz3PYt47bga0CimtYEcp6J+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2254
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 08:07:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165333

From: Pawan Badganchi <pawan.badganchi@kpit.com>

Add below patch to fix CVE-2022-1215

CVE-2022-1215.patch
Link: https://gitlab.freedesktop.org/libinput/libinput/-/commit/2a8b8fde90d=
63d48ce09ddae44142674bbca1c28

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
---
 .../wayland/libinput/CVE-2022-1215.patch      | 361 ++++++++++++++++++
 .../wayland/libinput_1.15.2.bb                |   1 +
 2 files changed, 362 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2022-1215.pa=
tch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch b/m=
eta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
new file mode 100644
index 0000000000..5f8f7a9894
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2022-1215.patch
@@ -0,0 +1,361 @@
+From 2a8b8fde90d63d48ce09ddae44142674bbca1c28 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 30 Mar 2022 09:25:22 +1000
+Subject: [PATCH] evdev: strip the device name of format directives
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This fixes a format string vulnerabilty.
+
+evdev_log_message() composes a format string consisting of a fixed
+prefix (including the rendered device name) and the passed-in format
+buffer. This format string is then passed with the arguments to the
+actual log handler, which usually and eventually ends up being printf.
+
+If the device name contains a printf-style format directive, these ended
+up in the format string and thus get interpreted correctly, e.g. for a
+device "Foo%sBar" the log message vs printf invocation ends up being:
+  evdev_log_message(device, "some message %s", "some argument");
+  printf("event9 - Foo%sBar: some message %s", "some argument");
+
+This can enable an attacker to execute malicious code with the
+privileges of the process using libinput.
+
+To exploit this, an attacker needs to be able to create a kernel device
+with a malicious name, e.g. through /dev/uinput or a Bluetooth device.
+
+To fix this, convert any potential format directives in the device name
+by duplicating percentages.
+
+Pre-rendering the device to avoid the issue altogether would be nicer
+but the current log level hooks do not easily allow for this. The device
+name is the only user-controlled part of the format string.
+
+A second potential issue is the sysname of the device which is also
+sanitized.
+
+This issue was found by Albin Eldst=C3=A5l-Ahrens and Benjamin Svensson fr=
om
+Assured AB, and independently by Lukas Lamster.
+
+Fixes #752
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit a423d7d3269dc32a87384f79e29bb5ac021c83d1)
+
+CVE: CVE-2022-1215
+Upstream Status: Backport [https://gitlab.freedesktop.org/libinput/libinpu=
t/-/commit/2a8b8fde90d63d48ce09ddae44142674bbca1c28]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+
+---
+ meson.build                        |  1 +
+ src/evdev.c                        | 31 +++++++++++------
+ src/evdev.h                        |  6 ++--
+ src/util-strings.h                 | 30 ++++++++++++++++
+ test/litest-device-format-string.c | 56 ++++++++++++++++++++++++++++++
+ test/litest.h                      |  1 +
+ test/test-utils.c                  | 26 ++++++++++++++
+ 7 files changed, 139 insertions(+), 12 deletions(-)
+ create mode 100644 test/litest-device-format-string.c
+
+diff --git a/meson.build b/meson.build
+index 90f528e6..1f6159e7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -787,6 +787,7 @@
+               'test/litest-device-dell-canvas-totem-touch.c',
+               'test/litest-device-elantech-touchpad.c',
+               'test/litest-device-elan-tablet.c',
++              'test/litest-device-format-string.c',
+               'test/litest-device-generic-singletouch.c',
+               'test/litest-device-gpio-keys.c',
+               'test/litest-device-huion-pentablet.c',
+diff --git a/src/evdev.c b/src/evdev.c
+index 6d81f58f..d1c35c07 100644
+--- a/src/evdev.c
++++ b/src/evdev.c
+@@ -2356,19 +2356,19 @@ evdev_device_create(struct libinput_seat *seat,
+       struct libinput *libinput =3D seat->libinput;
+       struct evdev_device *device =3D NULL;
+       int rc;
+-      int fd;
++      int fd =3D -1;
+       int unhandled_device =3D 0;
+       const char *devnode =3D udev_device_get_devnode(udev_device);
+-      const char *sysname =3D udev_device_get_sysname(udev_device);
++      char *sysname =3D str_sanitize(udev_device_get_sysname(udev_device)=
);
+
+       if (!devnode) {
+               log_info(libinput, "%s: no device node associated\n", sysna=
me);
+-              return NULL;
++              goto err;
+       }
+
+       if (udev_device_should_be_ignored(udev_device)) {
+               log_debug(libinput, "%s: device is ignored\n", sysname);
+-              return NULL;
++              goto err;
+       }
+
+       /* Use non-blocking mode so that we can loop on read on
+@@ -2382,13 +2382,15 @@ evdev_device_create(struct libinput_seat *seat,
+                        sysname,
+                        devnode,
+                        strerror(-fd));
+-              return NULL;
++              goto err;
+       }
+
+       if (!evdev_device_have_same_syspath(udev_device, fd))
+               goto err;
+
+       device =3D zalloc(sizeof *device);
++      device->sysname =3D sysname;
++      sysname =3D NULL;
+
+       libinput_device_init(&device->base, seat);
+       libinput_seat_ref(seat);
+@@ -2411,6 +2413,9 @@ evdev_device_create(struct libinput_seat *seat,
+       device->dispatch =3D NULL;
+       device->fd =3D fd;
+       device->devname =3D libevdev_get_name(device->evdev);
++      /* the log_prefix_name is used as part of a printf format string an=
d
++       * must not contain % directives, see evdev_log_msg */
++      device->log_prefix_name =3D str_sanitize(device->devname);
+       device->scroll.threshold =3D 5.0; /* Default may be overridden */
+       device->scroll.direction_lock_threshold =3D 5.0; /* Default may be =
overridden */
+       device->scroll.direction =3D 0;
+@@ -2238,9 +2238,14 @@
+       return device;
+
+ err:
+-      close_restricted(libinput, fd);
+-      if (device)
+-              evdev_device_destroy(device);
++      if (fd >=3D 0) {
++              close_restricted(libinput, fd);
++              if (device) {
++                      unhandled_device =3D device->seat_caps =3D=3D 0;
++                      evdev_device_destroy(device);
++              }
++            }
++        free(sysname);
+
+       return unhandled_device ? EVDEV_UNHANDLED_DEVICE :  NULL;
+ }
+
+@@ -2469,7 +2478,7 @@ evdev_device_get_output(struct evdev_device *device)
+ const char *
+ evdev_device_get_sysname(struct evdev_device *device)
+ {
+-      return udev_device_get_sysname(device->udev_device);
++      return device->sysname;
+ }
+
+ const char *
+@@ -3066,6 +3075,8 @@ evdev_device_destroy(struct evdev_device *device)
+       if (device->base.group)
+               libinput_device_group_unref(device->base.group);
+
++      free(device->log_prefix_name);
++      free(device->sysname);
+       free(device->output_name);
+       filter_destroy(device->pointer.filter);
+       libinput_timer_destroy(&device->scroll.timer);
+diff --git a/src/evdev.h b/src/evdev.h
+index c7d130f8..980c5943 100644
+--- a/src/evdev.h
++++ b/src/evdev.h
+@@ -169,6 +169,8 @@ struct evdev_device {
+       struct udev_device *udev_device;
+       char *output_name;
+       const char *devname;
++      char *log_prefix_name;
++      char *sysname;
+       bool was_removed;
+       int fd;
+       enum evdev_device_seat_capability seat_caps;
+@@ -786,7 +788,7 @@ evdev_log_msg(struct evdev_device *device,
+                sizeof(buf),
+                "%-7s - %s%s%s",
+                evdev_device_get_sysname(device),
+-               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->devnam=
e : "",
++               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->log_pr=
efix_name : "",
+                (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  ": " : "",
+                format);
+
+@@ -824,7 +826,7 @@ evdev_log_msg_ratelimit(struct evdev_device *device,
+                sizeof(buf),
+                "%-7s - %s%s%s",
+                evdev_device_get_sysname(device),
+-               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->devnam=
e : "",
++               (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  device->log_pr=
efix_name : "",
+                (priority > LIBINPUT_LOG_PRIORITY_DEBUG) ?  ": " : "",
+                format);
+
+diff --git a/src/util-strings.h b/src/util-strings.h
+index 2a15fab3..d5a84146 100644
+--- a/src/util-strings.h
++++ b/src/util-strings.h
+@@ -42,6 +42,7 @@
+ #ifdef HAVE_XLOCALE_H
+ #include <xlocale.h>
+ #endif
++#include "util-macros.h"
+
+ #define streq(s1, s2) (strcmp((s1), (s2)) =3D=3D 0)
+ #define strneq(s1, s2, n) (strncmp((s1), (s2), (n)) =3D=3D 0)
+@@ -312,3 +313,31 @@
+       free(result);
+       return -1;
+ }
++
++/**
++ * Return a copy of str with all % converted to %% to make the string
++ * acceptable as printf format.
++ */
++static inline char *
++str_sanitize(const char *str)
++{
++      if (!str)
++              return NULL;
++
++      if (!strchr(str, '%'))
++              return strdup(str);
++
++      size_t slen =3D min(strlen(str), 512);
++      char *sanitized =3D zalloc(2 * slen + 1);
++      const char *src =3D str;
++      char *dst =3D sanitized;
++
++      for (size_t i =3D 0; i < slen; i++) {
++              if (*src =3D=3D '%')
++                      *dst++ =3D '%';
++              *dst++ =3D *src++;
++      }
++      *dst =3D '\0';
++
++      return sanitized;
++}
+diff --git a/test/litest-device-format-string.c b/test/litest-device-forma=
t-string.c
+new file mode 100644
+index 00000000..aed15db4
+--- /dev/null
++++ b/test/litest-device-format-string.c
+@@ -0,0 +1,56 @@
++
++/*
++ * Copyright =C2=A9 2013 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining =
a
++ * copy of this software and associated documentation files (the "Softwar=
e"),
++ * to deal in the Software without restriction, including without limitat=
ion
++ * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the n=
ext
++ * paragraph) shall be included in all copies or substantial portions of =
the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ */
++
++#include "config.h"
++
++#include "litest.h"
++#include "litest-int.h"
++
++static struct input_id input_id =3D {
++      .bustype =3D 0x3,
++      .vendor =3D 0x0123,
++      .product =3D 0x0456,
++};
++
++static int events[] =3D {
++      EV_KEY, BTN_LEFT,
++      EV_KEY, BTN_RIGHT,
++      EV_KEY, BTN_MIDDLE,
++      EV_REL, REL_X,
++      EV_REL, REL_Y,
++      EV_REL, REL_WHEEL,
++      EV_REL, REL_WHEEL_HI_RES,
++      -1 , -1,
++};
++
++TEST_DEVICE("mouse-format-string",
++      .type =3D LITEST_MOUSE_FORMAT_STRING,
++      .features =3D LITEST_RELATIVE | LITEST_BUTTON | LITEST_WHEEL,
++      .interface =3D NULL,
++
++      .name =3D "Evil %s %d %x Mouse %p %",
++      .id =3D &input_id,
++      .absinfo =3D NULL,
++      .events =3D events,
++)
+diff --git a/test/litest.h b/test/litest.h
+index 4982e516..1b1daa90 100644
+--- a/test/litest.h
++++ b/test/litest.h
+@@ -303,6 +303,7 @@
+       LITEST_ALPS_3FG,
+       LITEST_ELAN_TABLET,
+       LITEST_ABSINFO_OVERRIDE,
++        LITEST_MOUSE_FORMAT_STRING,
+ };
+
+ #define LITEST_DEVICELESS     -2
+diff --git a/test/test-utils.c b/test/test-utils.c
+index 989adecd..e80754be 100644
+--- a/test/test-utils.c
++++ b/test/test-utils.c
+@@ -1267,6 +1267,31 @@ START_TEST(strstartswith_test)
+ }
+ END_TEST
+
++START_TEST(strsanitize_test)
++{
++      struct strsanitize_test {
++              const char *string;
++              const char *expected;
++      } tests[] =3D {
++              { "foobar", "foobar" },
++              { "", "" },
++              { "%", "%%" },
++              { "%%%%", "%%%%%%%%" },
++              { "x %s", "x %%s" },
++              { "x %", "x %%" },
++              { "%sx", "%%sx" },
++              { "%s%s", "%%s%%s" },
++              { NULL, NULL },
++      };
++
++      for (struct strsanitize_test *t =3D tests; t->string; t++) {
++              char *sanitized =3D str_sanitize(t->string);
++              ck_assert_str_eq(sanitized, t->expected);
++              free(sanitized);
++      }
++}
++END_TEST
++
+ START_TEST(list_test_insert)
+ {
+       struct list_test {
+@@ -1138,6 +1138,7 @@
+       tcase_add_test(tc, strsplit_test);
+       tcase_add_test(tc, kvsplit_double_test);
+       tcase_add_test(tc, strjoin_test);
++      tcase_add_test(tc, strsanitize_test);
+       tcase_add_test(tc, time_conversion);
+
+       tcase_add_test(tc, list_test_insert);
+
+--
+GitLab
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.15.2.bb b/meta/recipe=
s-graphics/wayland/libinput_1.15.2.bb
index 810532774e..d7927d132a 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
@@ -14,6 +14,7 @@ DEPENDS =3D "libevdev udev mtdev"

 SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://determinism.patch \
+           file://CVE-2022-1215.patch \
            "
 SRC_URI[md5sum] =3D "eb6bd2907ad33d53954d70dfb881a643"
 SRC_URI[sha256sum] =3D "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f66=
0051f834597747"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

