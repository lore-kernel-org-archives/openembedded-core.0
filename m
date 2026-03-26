Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D64B10A3D9E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:35:32 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55120.1774550128963119230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PmXqmKk4;
 spf=pass (domain: ti.com, ip: 52.101.62.51, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEu3Ux7/CO7o+puGkuLc0MtV9NxjpzTbSZxuQajDTA69AH9QijqI9FFGfOLRMIzSLupDwsVoBD8eFigAP/8E9FjEpRFer0XlGEGGbDRTISrE/knQ8JwFBYHrAjks6JoSBYl9HwfbMnwWGuMiY25vXJOM52dPL0twOZPIerk++OU11NNUlfUw/GEVTv90RBj7jgLg+E64PaRbEqJwKsI/buWhra+EE7jCm/26SjdKjVo+zjBGvpcDOzSavAPwvGFCS2oWw1dKa2An2DXp9kDwE4qGnxa9+agK97ZSrbUbOnzCk7eq7CNA7mFSNbk5YOVa9mnWnALM0gIiNhEIRBnegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fKtE0jEuXhc62YCcoG6g+TeuU3s7moeD6tUu3QLrug=;
 b=sRqPrSsa9XmbgVXqSc020ouiXU7wz+D92dY/2CCtdbDtyf4djv6ERSlAsDwi8T8nbxXp11wfus3M0cLIUjK0kXPQpgfxeKRB/65J5fBr24aIKSgj5FRh8ScnlA1RKZW5XqVp6AORCE8kXdfjOmeTTr+8osF/hzAuFlxh0SAh5qC0/6g+LHDBUb5LvGDaT/hY6NRl8vjthnlJFu1d1QFAlqnHWUP6ZuuN/3hEjs6QC3RPAMjECoDMSqN7Zc8JR8noWVld92qfHPkv2udnIPDAGRyVq9AjtgsfotTFRbzCqa0JGenXeMzgfb/U3s63uR8ZgFHAmaDpAU5yCOAeFyPZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fKtE0jEuXhc62YCcoG6g+TeuU3s7moeD6tUu3QLrug=;
 b=PmXqmKk4gSiSmOslNTUZvc6P08MLnsY37uFlBfoU2iJwrr7qwOt72weu4ksBu3fQSQJatpKexd/TaUd4lGrpsn++gJBQK0UnRKaxm5zkMZbatupczu5dT4eQlDEXAZHU3ZSJbi/eqG8Xj4sLROSMjcPh6cyPLr245I6mcDK99Fg=
Received: from BYAPR06CA0021.namprd06.prod.outlook.com (2603:10b6:a03:d4::34)
 by SJ0PR10MB4495.namprd10.prod.outlook.com (2603:10b6:a03:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 18:35:26 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::ac) by BYAPR06CA0021.outlook.office365.com
 (2603:10b6:a03:d4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 18:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 18:35:25 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:35:20 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 13:35:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 13:35:20 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QIZKJp2597547;
	Thu, 26 Mar 2026 13:35:20 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2026 13:35:20 -0500
Message-ID: <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
	<otavio@ossystems.com.br>, <kexin.hao@windriver.com>, <paul@pbarker.dev>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
	<openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
 <189D6251D8E3EDE7.1508127@lists.openembedded.org>
In-Reply-To: <189D6251D8E3EDE7.1508127@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SJ0PR10MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ade0b2-8afc-4693-62ae-08de8b6672c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|3613699012|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EKT3v/cUu/ghdnaWW/1Pcor3/tbIDAZrczVqsHWbkLejCpwkpMV34nsl6lDPTprqopp/fLXnen7BgJDkVIK6VtBAKozxDsi7/8wSlMPJMQ5rBfQvnH5MF2MJX9hXmU+b8CDjkLEtAgjLn+G/7aPomKcrChxlXuljurg7j+GlwoxydrgF7gW0i9NdQpnJ7MmK27oPS3kLeZQatgispUd+FNiOsz1q2flQDINvQ5lNwBRSRtsKzN9EP9RJVF9EofTjoH1ZJWxl6b9zd7t1MCNpArQF2LkM1T45yKMBcr2z2ONh2ImqEOufrNY2YSoaXS2M7X65NzcR3tAzAR56qsRQ3SbdyS9h2SxUAH0AZ7Zrnj5uVEmDhkH7/Z3P+FEp0n6yAkDZo3mYqyiIPcdzemlynEKOfNZtqGxuiRMhR5zCWqUjz/IGEqvsT+x3JKQMIE5KRggf30ytg7+S1niUN+syPkJSqC6SCRriOe+jOoUyzAetE3y8u7e8lhetuQa9DNqUKNvakRX4bdllqycTitd5ItBIMPekloEiqKTuvEEMyFFS3cnMiK6KEtBmKdT9VfphJMr6M0MQXGhxwG00udOmXwAsoFob3bEBp4fMoTGkQeUp1yMEjly/DsKKdZOl3fnmdrSLZAnF/zXJQwMrR2pNKftNLWxRDeqQxdU0OfGtPn8z/eqJCjTILQ7iC16Dgfd9MNUks4sgcW00i3Py44apDc8ji08CDRoUZA95kZXhttARUjN8xe2CvoV7bY+XEqKQgpgBiLwkgK/2N1t5McmTQg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(3613699012)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nSBHcCIc8aRL7Yjw09ohogUdmiPOWdCAc6SzaJ6XbVgWgVCnyAUyMsdGb+8gN0020InXbWDIKbNm/V7gQisWr8AVWe6RzaJDJD/4zQT+Yyf0uqb6AAhlZAxxgz69MKAgjqy4LbvDvoLgKWQ0VkdYbIUXArRQ+mVNtsYxN46q2WbhOaLRG5zHBtCYBjd2RKPsmhbG5Gk/8los+VwPsnCbO8vf+i4Hj1Ft+CqQZ9oM0gTTN2Z4rBUrGY287Qqr72zTtolPsaQZqJ6AMosazglERb8oJUNYTv/t7IYkBrwBZZbOKgKsCMaGUD5l4Bt930uwqZ8T8y8QOapMPaFGdUiIzz9ws67EM3eILDJOl9NjWoyAP5dJ3zjveIAxz5GmyDIIkw8ezTnrTQgx3MlQVrIKbYYpyL6AJcCOs/KAtzIUdfeHRL0NPP4v2MvNwbQDdBld
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 18:35:25.9950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ade0b2-8afc-4693-62ae-08de8b6672c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4495
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234042

On Mon Mar 16, 2026 at 12:25 PM CDT, Randolph Sapp via lists.openembedded.o=
rg wrote:
> On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.openembedded=
.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> No functional changes. Just bumping PR to help with automated testing is=
sues.
>>
>> Information from v15:
>>
>> Alright, now that cgo binary reproducibility has been addressed this sho=
uld be
>> good to go. One slight change from v13, I replaced the inittab.d entry w=
ith a
>> rootfs-postcommands function since busybox-init doesn't support it.
>>
>> Information from v13:
>>
>> Hello maintainers, I wanted to wait for the latest tag to get cut before
>> bringing this back up, but here it is. This version addresses most of th=
e
>> concerns I've seen regarding this series and adds on a little more funct=
ionality
>> considering we now allow for proper session selection.
>>
>> This led me into a bit of a dive into the desktop-entry-spec [1] and ass=
ociated
>> validator [2] that I wouldn't mind some opinions on as well if people ar=
e
>> curious about that.
>>
>> Legacy details follow:
>>
>> We've recently run into some issues with weston-init attempting to start=
 Weston
>> prior to all drm devices being registered. There's not really a good, sc=
riptable
>> mechanism to listen in to device registration events that works with the
>> existing weston-init package. Well, at least one that doesn't involve po=
lling
>> files or introducing more dependency on the init system being used.
>>
>> I also see there is also a lot of scripting around starting X11,
>> xserver-nodm-init, that (from my limited review) should experience the s=
ame
>> issue.
>>
>> I'd like to introduce the following display manager for oe-core, emptty =
[3].
>> This display manager is, as described upstream, a "Dead simple CLI Displ=
ay
>> Manager on TTY". It supports both x11 and wayland sessions, with togglab=
le build
>> parameters to completely remove x11 and pam dependencies. It's licensed =
MIT,
>> which shouldn't be an issue for any users. (It is written in Go, if you =
have
>> opinions about that.)
>>
>> With this, both weston-init and the xserver-nodm-init packages can be re=
-tuned
>> to leverage this display manager and simply add a user and emptty config=
 for an
>> autologin session. This can resolve the current behavior across init sys=
tems
>> without additional scripting, and move some development out of this laye=
r.
>>
>> This lists myself as a maintainer of emptty as well as xserver-nodm-init=
 and
>> xuser-account since these are currently unassigned and I've reworked the=
m
>> significantly here.
>>
>> Sorry for the delay on this series. I found a few bugs in emptty that I =
wanted
>> to address before submitting this officially.
>>
>> [1] https://gitlab.freedesktop.org/xdg/xdg-specs/-/merge_requests/110
>> [2] https://gitlab.freedesktop.org/xdg/desktop-file-utils/-/merge_reques=
ts/28
>> [3] https://github.com/tvrzna/emptty
>>
>> v2:
>> 	- Address spelling issues in commit messages
>> 	- Attempt to resolve some test related issues with weston
>> 	- Add additional logs to X11 related tests
>> v3:
>> 	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
>> 	  under QEMU the first auth attempt almost always fails.
>> v4:
>> 	- Add a tmpfile entry for the x11 domain socket directory.
>> 	- Remove some scripts associated with weston-init that were being
>> 	  shipped with weston
>> v5:
>> 	- Move tmpfile data to individual files
>> 	- Add explicit entries for these in the FILES variable
>> v6:
>> 	- Do not attempt to ship a tmpfiles.d entry in libx11
>> v7:
>> 	- Include a backported fix for go/runtime to address segfault issues
>> 	  reported on x86 platforms in previous revisions
>> v8:
>> 	- Sign-off backported patch
>> v9:
>> 	- Resolve merge conflict in maintainers file
>> v10:
>> 	- Remove the ability to run x11 as root in xserver-nodm-init, see
>> 	  https://lists.openembedded.org/g/openembedded-core/topic/115318655#ms=
g223906
>> 	  for more information
>> 	- Merge xuser-account and xserver-nodm-init as this is now a direct
>> 	  dependency with no other consumers
>> 	- Fix warning about multiple providers for virtual-emptty-conf
>> v11:
>> 	- Bump emptty revision to 0.15.0
>> 	- Add session entries for all the session providers
>> 	- Make autologin default session configurable for xserver-nodm-init
>> v12:
>> 	- Add util-linux-mcookie as a runtime dependency to emptty when x11
>> 	  support is enabled
>> v13:
>> 	- Add nopasswdlogin to the static group definitions list, also register
>> 	  it in the emptty recipe itself since the pam rule provided in that
>> 	  package mentions it
>> 	- Always ship the legacy inittab entry, since it's possible the end use=
r
>> 	  has some unusual distro configuration with multiple init managers
>> 	  enabled
>> v14:
>> 	- Move from legacy inittab.d entry that only sysvinit supports to
>> 	  modifying the inittab file itself for both sysvinit and busybox init
>> 	  support
>> v15:
>> 	- Remind myself how POSIX shell "return" is supposed to work when not
>> 	  given an explicit value
>> v16:
>> 	- Bump PR to make sure caching isn't generating weird test results afte=
r
>> 	  changes to source date epoch calculation method
>>
>>
>> Randolph Sapp (6):
>>   emptty: add version 0.15.0
>>   weston-init: convert to virtual-emptty-conf
>>   weston: remove deprecated weston-start scripts
>>   xserver-nodm-init: convert to virtual-emptty-conf
>>   xuser-account: merge with xserver-nodm-init
>>   xsessions: add unique desktop entries
>>
>>  meta-selftest/files/static-group              |   2 +-
>>  .../rootfs-postcommands.bbclass               |  14 +-
>>  .../conf/distro/include/default-providers.inc |   1 +
>>  meta/conf/distro/include/maintainers.inc      |   5 +-
>>  meta/lib/oeqa/runtime/cases/weston.py         |  18 +-
>>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>>  meta/recipes-graphics/emptty/emptty-conf.bb   |  14 +
>>  meta/recipes-graphics/emptty/emptty.inc       |  27 ++
>>  meta/recipes-graphics/emptty/emptty/pamconf   |  10 +
>>  meta/recipes-graphics/emptty/emptty_0.15.0.bb |  55 +++
>>  .../matchbox-session/matchbox-session.desktop |   6 +
>>  .../matchbox-session/matchbox-session_0.1.bb  |  13 +-
>>  .../files/mini-x-session.desktop              |   6 +
>>  .../mini-x-session/mini-x-session_0.1.bb      |  13 +-
>>  meta/recipes-graphics/wayland/weston-init.bb  |  66 +---
>>  .../wayland/weston-init/emptty.conf           |  77 ++++
>>  .../recipes-graphics/wayland/weston-init/init |  54 ---
>>  .../wayland/weston-init/weston-autologin      |  11 -
>>  .../wayland/weston-init/weston-socket.sh      |  20 -
>>  .../wayland/weston-init/weston-start          |  76 ----
>>  .../wayland/weston-init/weston.env            |   0
>>  .../wayland/weston-init/weston.service        |  71 ----
>>  .../wayland/weston-init/weston.socket         |  14 -
>>  .../weston/systemd-notify.weston-start        |   9 -
>>  .../wayland/weston/xwayland.weston-start      |   6 -
>>  .../recipes-graphics/wayland/weston_14.0.2.bb |  10 -
>>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>>  .../xserver-nodm-init/capability.conf         |   2 -
>>  .../xserver-nodm-init/emptty.conf.in          |  77 ++++
>>  .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
>>  .../xserver-nodm-init}/system-xuser.conf      |   0
>>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>>  .../xserver-nodm-init/xserver-nodm.service.in |  13 -
>>  .../x11-common/xserver-nodm-init_3.0.bb       |  73 ++--
>>  .../user-creation/xuser-account_0.1.bb        |  30 --
>>  40 files changed, 358 insertions(+), 976 deletions(-)
>>  create mode 100644 meta/recipes-graphics/emptty/emptty-conf.bb
>>  create mode 100644 meta/recipes-graphics/emptty/emptty.inc
>>  create mode 100644 meta/recipes-graphics/emptty/emptty/pamconf
>>  create mode 100644 meta/recipes-graphics/emptty/emptty_0.15.0.bb
>>  create mode 100644 meta/recipes-graphics/matchbox-session/matchbox-sess=
ion/matchbox-session.desktop
>>  create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-se=
ssion.desktop
>>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.con=
f
>>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-aut=
ologin
>>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-soc=
ket.sh
>>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-sta=
rt
>>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.ser=
vice
>>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.soc=
ket
>>  delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.=
weston-start
>>  delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston=
-start
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/13xdgbasedirs.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/89xdgautostart.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/90XWindowManager.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
server
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/c=
apability.conf
>>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/e=
mptty.conf.in
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/g=
plv2-license.patch
>>  rename meta/{recipes-support/user-creation/files =3D> recipes-graphics/=
x11-common/xserver-nodm-init}/system-xuser.conf (100%)
>>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm.conf.in
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm.service.in
>>  delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1=
.bb
>>
>> --
>> 2.53.0
>
> Hey Paul, have you gotten a chance to review this series yet? I've been t=
old you
> may have some comments.
>
> Randolph

Has anyone gotten a chance to review this yet?

Randolph

