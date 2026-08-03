Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C923C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 05:18:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36914.1785734319715544514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 22:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NE/91kXB;
 spf=pass (domain: est.tech, ip: 40.107.162.22, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPbPxxjOX8By4WvWvZ1BQBj0tvwV8waUZ3tyOuCMYhog+pkiYGqwCqfFeCc1G3tk2jCEv0pi/hQfeXvkzLjSFf50KXKdozoo8JWhtpeURlSPvZbpeLUS26Sy0Oq9UwNm4z0bUCcgHS82rvtlMXRXMUiBnwMDPApbO0S+BFu5PxRKVuIFplmwLgHn9F6yOLFwiDg1A08eHTRktbFM0YnpYslWAs570bTh89ARFNRDfNQNOFMLCJ1TcSCESX557N8jZo8M00JgBVyYAQ2kTiZpr5Gj/dP6N2EFlm053/fKL8j/90ShgRBs9GQQfO8hsXtMfu5ol9vy+OS7yxYDlDcS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEP5kc1px9HJHNbKNrkhqgVupWPF2iurQUSkoWQo2KY=;
 b=hyfGrbTt6pfCMkFIIYpDu2uLzfZTbBABvKiDs0//LEc4CvbAUbDZ8ZHALf+CAXYxBR+f1nZn/qal5Oq8dfX9wr4DE6AdUEK6em0SbQAisYA+lwZEMrEtc0mbPFf/ZQ1lrvzW9ZWmnKBjSSL+TSBvDBGSancPfLziU290Y+mvwf/SjXwJw27dj4OXxjk3f1QrQdfONtJruZ1D2T89NsNsnk1ZRAixWoF5tUZpK1y5mlJCZjf6RKTHl9zhoRIFVxkbXZP2A6Py5Q1fBl3uHQyzCq6sLhfLMqE1C9MP89vQEeQd9S1MKTHRIrpZm646nq88SYld5m8QfO5jvQkUxYNAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEP5kc1px9HJHNbKNrkhqgVupWPF2iurQUSkoWQo2KY=;
 b=NE/91kXBOp9SVEW67HUJl7P3dzCHRSeOXfdog9BuWZ4f0c2rM75mFdY7Qnfcd2709WE88q/GfwS3oVzYdUygRZVr/QPhlgU/+n2G3e16efc9BhTie4YwYn7DO32f20ixj1iExt4UPL9DCwUzAsMdeXe1HYV4kfS+3O+csKB0beuzNmg36HsrZh2NvMOYHz/F1f5Y1kobYHobKpZORm42rvLTDuzZMean8zAQ/vIJjuUfudIPN5SDsAaWZ/U3K0ytxsaunwNQUon79XUwtrwsUywg4i5M9qHU07UXZFzZcBzpWbDAJhbKYOlRgdbfgHNzcZNpehfO7yRVc9dSI8UWqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0947.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:178::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 05:18:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 05:18:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/2] shadow: upgrade to 4.20.0
Date: Mon,  3 Aug 2026 07:18:30 +0200
Message-ID: <20260803051832.25488-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0947:EE_
X-MS-Office365-Filtering-Correlation-Id: 2507d38e-504e-475c-0cb5-08def11eaaee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|11063799006|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7lcyOWrpirB/qCZzaxgqwbM1pottvw0DXxwa/dA/tlztoWz0WGaw8p8ypX+ArT4vGZxzsnW/PJ6QlYbA962YHAVD+R+tKN2tLaZbDGBoQ+y7SyRDYO9MBPj+3JHnmVT2SZBkLOOzGMteDGRV/HQxeqnPb2rkKFZBnVIXCe9GcZls/cn61iGa3zSGOEXRPJBHQNdQ3dKMja/KHbhamo2sRkJEnzHUYO508o9cMBJsWKrQYc/qF26yE1lESfNcq8scuvTRz7Y9b40c6LQ/lseoR0g8Do94rGClErdOuLiCQpVMQA/KhJfqYveKAGaf19SSzJNM0Ie8KRvhK8Ss7tSB3lsibEe0TndW5ai7G1QgNNF3RoJSpBBQlZcMzhVuJDbhFec5rcxD4Ut8TU/c2N/DULR9l15ggFrIhGjI8N3DwbKrLQpbZwxf2zwF8CuRRqekfQ/8zwu6X9YfAaMgyotP58G+LWzCVASEqnof9n/psPgWVTHJ005Ti6L8VFZPElOP8SUHmaDUiP7ijDtC57a+8iKYMnvK861o6zJh/G82xz3ss77UOPR1wbQTYeNWN9n6gj1W+qRBnKbVESoV/xx/Fw7MtezIPHd0uX5ZEVvyXe+bOm4PoYlCkAorWtkj3I0+avZURdczTisvxrLk4M8uXAwnuld+dNe1qBMD6p1ciuw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wS210kCBHhlLYPQtZV+BvhTx+72m6UEWfYExqvh7O4don/31Isv7D+MNMxD3?=
 =?us-ascii?Q?7U9SJ/3xCasbJ3iBFUsgO/mwrLsuswZ2dk9p8dFY2+albOB81xXDXy0GrQjL?=
 =?us-ascii?Q?dQ1AvX84t4G5FeVeDCrRWVktJXbNq/yX3bN4uUpDsHnGELVi5l0ypohDYiXO?=
 =?us-ascii?Q?lsWd4uRWuRAzu7OJCFmbLyvpATrSLwQGIj6Wz8GJCFym2cInS7vQkVmbLD2S?=
 =?us-ascii?Q?7/y5UXuTttM+T/uboq9RkFe5lRKYgaGbxjeS4WlRXh8YIgI5T8VhClzoWpNU?=
 =?us-ascii?Q?alKNKjDgTzvu7QzTo8lKDzX+5qxnDQ7RVBFKQth2a2+2V6HendkwvjP5HZkY?=
 =?us-ascii?Q?cqQlOoU0MkdVxDjGH8DZ3gcaDW5pHyDt61pFO4yojno6nGgmrGUjwr1OCgeP?=
 =?us-ascii?Q?LgJa07uH6v9qI4k4g30jjj9XvQ5U6y1XVQUq+XaodFFl7PBa6G415/aWsiWG?=
 =?us-ascii?Q?IO3Rf2+hOmK16POpTaGiEb2i81Y7XSlcrNcMlh2Anbmw9Y8wJiknwIl/hYEP?=
 =?us-ascii?Q?O1H9jt5ZZddr+QDzx3xS0lKHFhQDFPpMpY6mk+ZoFDCCVLLEucJIXmPOKBLI?=
 =?us-ascii?Q?M8g6lahaDxBpZ2DmKT/9PPy405ayc6612gmr1YB1WIWyxPizXUAYlR9CU0YD?=
 =?us-ascii?Q?OiE2zQ64i4WMZlHqEodWWoGASDPZh0yJhZRdRcR0xHCsRbyrcucwv8b4FcuE?=
 =?us-ascii?Q?8fzHt3hRGKHaCYvHhG7q6dk31oCa/Cgpzy1jwz+4lyO4mfTfYJh4Zhed+4uI?=
 =?us-ascii?Q?SG+aUUra07QCPUfU3naWiDmh+2vliQvBwwhTPU1k7sFLgwOs5+vlnq/gOkqk?=
 =?us-ascii?Q?m+WKu/FeHyTOsH6VYQPOb5rJM6G18n62LNrCGtk8w8+8aXOuz4Dp6vOpNCx0?=
 =?us-ascii?Q?W82762/rCXtNmg3paaRJPXsbv5qmbo924QdFZWs1E+j6je6BaR0v0ZYEinpy?=
 =?us-ascii?Q?v1Wm7cB9vtzR3+yuPizwBDwOCThgHcohP+ClAVI3sVpns9I5fa3mDbuiNR0R?=
 =?us-ascii?Q?F27VZ25K0i+pqKEKeNxRrhM6hPCZZmL7ZTfpaA+u0bTkrljyPnaiHfSIz1lb?=
 =?us-ascii?Q?lntirDKm/q59M+4zEzpiVEfaQJy6V8JeaHSh2ASgXZfztl9l2739gUM1SuYP?=
 =?us-ascii?Q?G5bGbjnm3Vn/wJ12pgYYzISnLQFMxzI/f9M+gVXbmKW8hYDT1xxc7lGNPYI3?=
 =?us-ascii?Q?+iUqlzc57XQQ4CZh2jiPl67EBGLYVlkupYzmhAhqbgqmg7o6GA4IBdNKz6u8?=
 =?us-ascii?Q?X9CqkNiJWotQjpwsnrUogsdI4+1PkSz4krLhhGLdGhdUL2A6spWe/QBrTfbJ?=
 =?us-ascii?Q?Puyk8DVn72arYgaUWRXEKxOF5pzLX+d4RzaOzDkLOg29mSzF9gH2xK4o+t70?=
 =?us-ascii?Q?KjKVgACJNzi3y6g5VoQ/m1n6DNCVDjR/giugyZsW5dzo3ybU3Q9BvRezwfvU?=
 =?us-ascii?Q?ooPyENH0rWJ4Ik/hZJJ3X9t5pB3KEn8Yj9ff1mkbTs+t5cGSumb5IihEE+Mf?=
 =?us-ascii?Q?plczEajtr4B3RGJDjXOcGnX/68G2/MTykniPaui3YW42w/K1DrXv7iwm09a3?=
 =?us-ascii?Q?lL44jW5M1f95r09/7PsImdzOtV7+vg09VD1DXqrVOcca2qBJ14EKPVorvu3r?=
 =?us-ascii?Q?yhwkMxuzwCmTEL9AYEdQlfCe/hhPpK2D8Byc4FXnQFA6djeuIBp/lgeRv7MV?=
 =?us-ascii?Q?HUbeYQ9aHhUmYY1nuNtXUaJwbh9BDKYO7FvOAkK1f1eJh28LAy0tzthupA1O?=
 =?us-ascii?Q?HGv3cyukxtGK0648fUIOkPSs3UC42pb4RHt5E0UsRDV7skBWj7IiWLg69tE2?=
X-MS-Exchange-AntiSpam-MessageData-1: sIGhyHYNqq8K0d3AzzuIFza3ssHEIz3piSc=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2507d38e-504e-475c-0cb5-08def11eaaee
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 05:18:35.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqpUyyt417hLn6W4iGlu9pzYi1gK+akaDvNOoZ01EUMk4QFIQQ+scooCohumjZg3BnlDW4Ubwf3O6SZE8kc+qSrUcP9KTrluSvUscvIlX/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 05:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242603

Upgrade shadow from 4.19.4 to 4.20.0.

Release notes: https://github.com/shadow-maint/shadow/releases/tag/4.20.0

This is a breaking release that removes several programs deprecated in
4.19, notably groupmems(8), expiry(1), and logoutd(8). The upstream
recommendation is to use usermod(8) in place of groupmems.

Patch 1 handles the recipe upgrade itself - three patches are dropped
(the code they patched no longer exists) and one backport is added for a
build fix that landed in master after the release.

Patch 2 is a follow-up to remove groupmems from the useradd.bbclass
sysroot setup, since the binary no longer ships. The class was already
emulating groupmems via usermod, so this just removes the dead code path
that was triggering warnings.

Tested with a full core-image-sysext build on qemux86-64.

Jaipaul Cheernam (2):
  shadow: upgrade 4.19.4 -> 4.20.0
  useradd.bbclass: drop groupmems from sysroot setup

 meta/classes/useradd.bbclass                  |   7 +-
 ...001-subid-Add-stdint.h-for-uintmax_t.patch |  43 +++++++
 .../shadow/files/disable_syslog.patch         |  23 ----
 .../shadow/files/prototypes.patch             |  38 ------
 .../shadow/files/shadow-update-pam-conf.patch | 110 ------------------
 .../{shadow_4.19.4.bb =3D> shadow_4.20.0.bb}    |   8 +-
 6 files changed, 47 insertions(+), 182 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-subid-Add-stdin=
t.h-for-uintmax_t.patch
 delete mode 100644 meta/recipes-extended/shadow/files/disable_syslog.patch
 delete mode 100644 meta/recipes-extended/shadow/files/prototypes.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-co=
nf.patch
 rename meta/recipes-extended/shadow/{shadow_4.19.4.bb =3D> shadow_4.20.0.b=
b} (97%)


