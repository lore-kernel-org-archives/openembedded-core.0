Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A301DC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 19:16:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26926.1786648589065447847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 12:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=WcCUnqsp;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq+L3Yt1cKbKKzT+gl5udfNqNmtyB1BJkoFmD7NXoH7N7o06i6n+nmBQI82qrMdFaGYJMW1TU/RJOUxSneZ1S7zfxuOOQ2Rxgy8osMkQdH2EWdI5d4RjWdPsJ1RSXsvE9xW2UcsaggvGuvrJAFAjTQmX+fftS0xtZG5s0GUavHshKHIY9Qw27JPvBe++JCIq1gdK5Qu6cE29+abD3A7OWDNmdCp0QqAjh9VYR74e31klImsTl7LeX+49qDHi4qRpQoIsoRLey5twAOfC0DkydcwYT9pSsiqjOkli/ZXT3BNvC3h/LHIorac3H/fqUpE3G/PlapU6yPGqrLHXdwUNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffHO7BV+kXn7lQ6BD8QYEFXLwx6u7OmXbSJCTad6Zfo=;
 b=hV6kMSzsEicEUGHviFVETQsqfO5KTKiqg0IEqrvt7DHpxBiFODJL3nsFnZaEeFZGISl8GdiHAjIeODtia70t2mMtyhVhd0vpZri4fN10Azw4xRh8gNsV99zS92ZFW6GhCuUeOTZKpRaF6vO0ZaHbFSXyc5nWYe4Tn9UU9+iTOPYgtI/lJo05K3rtlHFkmrGHSdZOEyTLe0zyXwZ0OXVyH+2Q5zKuu1bHtXOI1KBah2T60x7XUqQqsOnoUP74rSgDHVOroXGkqSPUwrkgV7Ehe+qe27evFH2qHZfZlVnFo0YAXZ4gU/NuOwwZ2laag2JoGuXZLNBLQChkZBHRO3EWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffHO7BV+kXn7lQ6BD8QYEFXLwx6u7OmXbSJCTad6Zfo=;
 b=WcCUnqspANxM4zL+LMky7d40+YW5550/XGZ03SKlYuI5blB2isgvbh5pjn6R3HYdYe/HWxrfqMMfdVmCBylFQuhRa2ExA0KYcE24u0Rncj6GHtcYn+ZFC0Z4UgsFSk5q4RAj82a/zlt1JzhJmO/x7yAfyHt6VFqbcd+zSJXmyIEHEe07iq5LzFx34h8CIp9Iz6gt2IBX4ww+r7Sn24VrDJvobnOkiRMFujnUNar9T8FfIFrZJJMN/OgxoIgSowTHcPjB7mHDTQI05E7QKkt7KZ2qYhySVnnLMJjjMdU7t8JmnshCBRwYm7DtwZj5XhryaBON2jIDIcTj8oNvpiUyxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV2P189MB3733.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 19:16:22 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.004; Thu, 13 Aug 2026
 19:16:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/5] meta: fix trailing whitespace across classes, conf and recipes
Date: Thu, 13 Aug 2026 21:16:10 +0200
Message-ID: <20260813191615.34122-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::12) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV2P189MB3733:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa5c6a3-0772-423c-8500-08def96f5c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|376014|366016|11063799006|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	GrzkbtVcAE6i7++6ISdlHo3uAs+R4bdg1dqkbYEm0mwMTsDRblVEJYX1+esmwiGGMW6hwh6WHUR81Ok/LKkWVSNklySL45U3tkvu9k6hlVfnt3oKTHKUZe1138/IjX0aUttkMVHMTm6OeWxW48Y9ZH0xiZc3DXzHJWNIUXtZYYMVtaKPp6rVgSutWOfa/JX26fSAxwRHuXCXAj587rphiv890OXJEno+631A1qnA1kpQbTtzKX2Az5q9KLKJLrJa9+P95w2xzAU5e56t7WKUddSQZk00T6A0ueNHuVIqMviJO5MLMBwRM4HksttQENrEUlGZUGLXjmPRDzaODWUuTsyBZwPljAZySOTL5wtGiXUe9yU5liWOCHkTfdoTuZuWfynHHM4mtb3VZsktxcluVVU0kMDnrMWHteoGbjBIfLLFwa408REsbfKurxaWkuC31RkFzuqqy65EVEHsMK3J9KrUcCeOE1iBICsx+b7bpEQzhwwp6JPh3kBGxpDq8CPkQ0lm7ZpXr7FE0AxOOCBehL52KRMhRd7gtflGy6tH7Gn7WU7XMqb+6NlqVKfZNVlgYbp38i1069yetUnn++IWTyq3Po16PbOLjDAscgQiKCqVXCiftDmewVg17Z5UEmvf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(376014)(366016)(11063799006)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KCYWLMSkxEi1grqKyT+W67xtCDg0jwPtPH7X5WrbNLSHhiRBW/zpIPYDNBr5?=
 =?us-ascii?Q?5TyRh4plsy9koMwoc6UmhP09cwuSxpq6y0yjOlnABSpa2P3pGC3oYzaN4+W7?=
 =?us-ascii?Q?uCsO26EiIxNTemsoc0RwMnSQSNcLxFjZh8lay5yaQOQQWpmhc8Gz53IhZ8V/?=
 =?us-ascii?Q?jplVZz+vfFhZUXjLU8FWYATounmskNG+/cm0WAWmDuXrk2PDMJrksvwUC/hd?=
 =?us-ascii?Q?4KynH09X4Yf61dwpX9wZodYDoUcH0BXYYndrCjuSKqZ8+LyariiJUJUuePH9?=
 =?us-ascii?Q?bXCX+PaV9wF0OVZJu0L7B4phHLjRnT3+dmXBhirocpntNDOG0Wt11/QbcaHe?=
 =?us-ascii?Q?C7G0PoVkVW4LUr4x3X+g+OJVRzMJFqjyUdT0+MZDNPJZLQnzcI9uArG9obtF?=
 =?us-ascii?Q?6ddkF+MgUx0XEyRjFDDVi+CwqmLNYydIco1NtOdbrDaUVUq/0LakJkCAvRou?=
 =?us-ascii?Q?ogdMdx2mWi9EUZf4cVPb+SFP0q1j1jBMhZM4PR6aEOW7H/XK2GyMo9JcQaz5?=
 =?us-ascii?Q?EOaO0iorVnQkyRTB5XAbZNMrQEHNLMPt0aohs0XdNqMW2THcPXjX1bPU7Crs?=
 =?us-ascii?Q?gTEkbikt8r2rReH/BkUJdiwPU9pFSfxmYztyuaXunTC8z+iXUW8exvCnSKTb?=
 =?us-ascii?Q?+QUXVh7qwBqbCcbxI4jM4vZKCMHJKRZKrmtwc0AEoDqFLUE3v+aba6Dw2J8h?=
 =?us-ascii?Q?Vz9MExGGqq+W5sDW42tPM6vdwv7SLUnZt5SCWzEWhHOEr0Ym+0KK3eCcM3CK?=
 =?us-ascii?Q?qK2IPfgUsXOGSJKuGYfQTwXkDS3pEwlXY/SHw6b+ubYEG1W5zBDSZNzrJ+z6?=
 =?us-ascii?Q?nK6ZuWRBZVU19Lgx2EZybx/9pKxdHk0sXZzuwHUhcRzKD7ibLUPB/vnicTqT?=
 =?us-ascii?Q?Urmn4NgrnlGB7UPczMuTdhK2A17TH9OuYINwGmC/unhubw0mQWYkcXEw1VQ4?=
 =?us-ascii?Q?SCyJG1B1eQbAZh2DpVtezcxw+EJ//Ose6gXQ8Itu4CMJPwj+CxtmgaRBQkl4?=
 =?us-ascii?Q?KkZsAzRFUSWy188jJQzd4/hgVj/GdBhoRRKo4YU+EGOaRVBly2Vd2F4EYSzF?=
 =?us-ascii?Q?SNr7Z/1ZdfHW5iK65TH3YvVS6BK5QieXMo6Qjq6mQJrvEnD8HNmr6N9NRRe8?=
 =?us-ascii?Q?eCH1k0ahPCGuckASIlYaMenQEJfSw6MKiHONy1Ovz4mAthc9uSLHs96kmvY5?=
 =?us-ascii?Q?nVlvA2Wi4cukVcQ27Xxs22ki1h5MF3R5qfPiUyKjeYXwLrqz8LkvQ+6fZ+dw?=
 =?us-ascii?Q?fJ6zezcQA+L3DbA/sCBCVP2mC9uN/usASLhCijlWKmnpt96W9Mkysy8BbQ8y?=
 =?us-ascii?Q?cmgNmP2gy7p8lZa2FzsnQcWawE+b7XwVNQTPBmBTVMGORDSGIjnRkN2q56Aq?=
 =?us-ascii?Q?KooGUunu4EjEdmbSjAOOGJA4hZ01CQ5lc/IyVOe2DuR8MOudBX0QE926zQ3Y?=
 =?us-ascii?Q?XCATxi8BYEksGVWWtyEEeZx2H1S7oWmtGh9u8NQtvxEZ6PDTUr4VxkUOY+ih?=
 =?us-ascii?Q?i84KN3C2wvfAAogAlmVW2NU2X2oCxizxSDx2uEP2vPg/u0FljCILJe1Kzvrj?=
 =?us-ascii?Q?ypnkYQomysZU8Y1kj0psAkhP1dRgWqwfv18nNtJUIN0gfYLcGUyo0PtAp6ax?=
 =?us-ascii?Q?VmpjI1Kfpn7NwdD/ZSgK5Cx86ZyqzpUYYSjMdKlrNDp9bVO0ABZDLjHduxhL?=
 =?us-ascii?Q?CTFF9kj5twxL0HdzKkFM8PaZw58GBJxOPzobVaCL5P3twSxzPwVs/MjZSHqQ?=
 =?us-ascii?Q?7owqyohVgqmmopnqqH3esjZuZGQKb60ZvPGqiC+eay3pD0HfA6D3seJ2F46i?=
X-MS-Exchange-AntiSpam-MessageData-1: OZNMHgz6DxYHj8fGesKk8zGA7kxSzxeLZmQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa5c6a3-0772-423c-8500-08def96f5c48
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:16:22.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1KcE0P/3mgQFfvIaQakgjYXto3ObrDb2Sk6MGstgFDjB4r9GML42VvST1WBFQ+OEElQx+26Ku5SjlUC+sBXvQWq8DnnT23rMIdsyPRVF6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 19:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243382

Fix all trailing whitespace warnings reported by bitbake during parsing.
These were flagged on the Yocto autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4405

53 files fixed across 5 patches, split by category:
- classes-global (7 files)
- classes-recipe (11 files)
- classes (2 files)
- conf (2 files)
- recipes (31 files)

Jaipaul Cheernam (5):
  classes-global: fix trailing whitespace
  classes-recipe: fix trailing whitespace
  classes: fix trailing whitespace
  conf: fix trailing whitespace
  recipes: fix trailing whitespace

 meta/classes-global/base.bbclass              |  2 +-
 meta/classes-global/buildstats.bbclass        | 10 ++++----
 meta/classes-global/debian.bbclass            |  2 +-
 meta/classes-global/devshell.bbclass          |  2 +-
 meta/classes-global/logging.bbclass           |  4 ++--
 meta/classes-global/packagedata.bbclass       |  4 ++--
 meta/classes-global/sanity.bbclass            | 16 ++++++-------
 meta/classes-recipe/core-image.bbclass        |  2 +-
 .../gobject-introspection.bbclass             |  4 ++--
 meta/classes-recipe/kernel-yocto.bbclass      | 10 ++++----
 meta/classes-recipe/lib_package.bbclass       |  2 +-
 meta/classes-recipe/libc-package.bbclass      |  6 ++---
 meta/classes-recipe/mime-xdg.bbclass          |  2 +-
 meta/classes-recipe/multilib_header.bbclass   |  4 ++--
 meta/classes-recipe/populate_sdk_ext.bbclass  |  2 +-
 meta/classes-recipe/ptest-cargo.bbclass       |  4 ++--
 .../ptest-python-pytest.bbclass               |  4 ++--
 meta/classes-recipe/uboot-config.bbclass      |  2 +-
 meta/classes/image-buildinfo.bbclass          |  2 +-
 meta/classes/useradd.bbclass                  |  8 +++----
 meta/conf/abi_version.conf                    |  4 ++--
 meta/conf/templates/default/local.conf.sample |  2 +-
 meta/recipes-connectivity/avahi/avahi_0.9.bb  |  2 +-
 .../base-files/base-files_3.0.14.bb           |  2 +-
 .../gettext/gettext-minimal-native_1.0.bb     |  2 +-
 meta/recipes-core/glibc/glibc-scripts.inc     |  2 +-
 .../initramfs-live-install_1.0.bb             |  2 +-
 .../nativesdk-packagegroup-sdk-host.bb        |  2 +-
 .../packagegroup-cross-canadian.bb            |  2 +-
 meta/recipes-devtools/apt/apt_3.0.3.bb        |  2 +-
 .../autoconf/autoconf_2.73.bb                 |  2 +-
 .../bootchart2/bootchart2_0.14.9.bb           | 24 +++++++++----------
 .../gcc/gcc-configure-common.inc              |  2 +-
 .../gcc/gcc-multilib-config.inc               |  2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +-
 .../opkg/opkg-arch-config_1.0.bb              |  2 +-
 meta/recipes-devtools/perl/perl_5.44.0.bb     |  4 ++--
 meta/recipes-devtools/pseudo/pseudo.inc       |  6 ++---
 meta/recipes-devtools/ruby/ruby_4.0.6.bb      |  2 +-
 .../iptables/iptables_1.8.13.bb               |  2 +-
 meta/recipes-extended/mc/mc_4.8.33.bb         |  6 ++---
 .../perl/libxml-sax-perl_1.02.bb              |  2 +-
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  4 ++--
 .../xorg-font/xorg-font-common.inc            |  2 +-
 .../xorg-lib/pixman_0.46.4.bb                 |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc |  8 +++----
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 .../lttng/lttng-tools_2.15.1.bb               |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 meta/recipes-support/libcap/libcap_2.78.bb    |  4 ++--
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  2 +-
 .../recipes-support/numactl/numactl_2.0.19.bb |  2 +-
 53 files changed, 101 insertions(+), 101 deletions(-)


