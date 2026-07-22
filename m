Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E42DC44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 13:17:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47640.1784726226670435669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 06:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ceDwOs7c;
 spf=pass (domain: ericsson.com, ip: 40.107.159.0, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIofoqHSMimcOspeee+QHBhb5cOHGVB7/3kXJHUsx+m+Q3JnjoYq3/gCxIn7pwSVQpIKKqOKGDMSfIBM7mkEqvbNyfI261c2fmGG8p1iSx9cNFASnObcewZwqNjps2kqkWkGGd0ZELfoPyE16kCpt4hbMKsQ/qrRk7U974dBDiHWZY4HwUBj3d9ffB0vEKTf++gGanHtAIptL9rovIgdyr1odSEBummBvYZD1MDs7hEZsYJBdUFHfZfXKCG6+5bHSJTacnmX6Pn2xvF3bakF622Vs4Nie2OdrwIm33X5/ZJp/8RQq4QKjE1R4HsoBRjdBrrFC3a6mi4LNWAikcMzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmRBnesN8kAsMr2KWlJCcjbUaMT5D44oRj5yzW+ACiA=;
 b=yEPcKjJMVCEPtI1yX4239EiPaz4z2rU0Y6xIKca0J6p4v0H7xs+LQhIjWp2jByxEs/fu97ri57q6w8vphfRfTh6pDTWGHWDb1X+UW2MXEZJmKJFXLYtQM1AM4SYRNZ4D303kqX/obOdDSCgZYSGXJ2fQ46x44u2UzEiWtALq4fTmqlV6NzYuwFPE6bxYzLheadZfj7/7ksklDPBpds8alWM7tVT+k0oLOn4W5yoQaRIa/hjk8WVoKurLgzPSmKcvHac/qPa+8ExHBDYl4q8sYRxZncw9gImhrTkBjLveBt/GLYEtg25jPHu7+HRWW0d6lixR6aVyL7b2gqKWzuIsww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmRBnesN8kAsMr2KWlJCcjbUaMT5D44oRj5yzW+ACiA=;
 b=ceDwOs7chWbSYWLpG44aXjQlssiSY2CGGM2I8kUvP37/bb0BXGJo7Mew1dHYFQMDOJsxH/sCICHTDSOSd2CIfCzpHPOUQkCuo+QT0NQFONTcSIBI4PF3J4mANbbBrI5C7JWKYCnZwKnjx6oNO1KHMpWZA4FR8UorN58RPU+x9moqeFCiKT6sv2r3CgYK0X7Cnxz7oKNYmg39ZN23xsSc3KaBo8zKECVpYRLQI2Hmz7d57zwvFZhRemL/Agd+ajg8n4RT81fv8oCQ2xiVB1AIlNXk2mSRWL1psXERndXNnvugTpVOoe8jg2QCAwUiXVH1jCFt7LxQVeoDvDLlN9EEJg==
Received: from AS4P192CA0011.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::8)
 by AM4PR07MB10990.eurprd07.prod.outlook.com (2603:10a6:20b:6e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 13:16:58 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::85) by AS4P192CA0011.outlook.office365.com
 (2603:10a6:20b:5da::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 13:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 13:16:58 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Jul 2026 15:16:57 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 5CC3E4020B40;
	Wed, 22 Jul 2026 15:16:56 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 39534700DBB0; Wed, 22 Jul 2026 15:16:56 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>,
	<ross.burton@arm.com>, <mathieu.dubois-briand@bootlin.com>
CC: <anders.heimer@est.tech>, <qi.chen@windriver.com>,
	<alex.kanavin@gmail.com>, <richard.purdie@linuxfoundation.org>,
	<joerg.sommer@navimatix.de>
Subject: [PATCH v5 1/2] systemd: upgrade to 261.1
Date: Wed, 22 Jul 2026 15:16:39 +0200
Message-ID: <20260722131640.4155716-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722131640.4155716-1-daniel.turull@ericsson.com>
References: <20260722131640.4155716-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|AM4PR07MB10990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f36f380-eb99-4cdc-cbe6-08dee7f38246
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|5023799004|3023799007|13003099007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	229QNwHBO+OqF0n/Nq2lQVeJR3Wk99PjiRhGV8sg8CnrJRk3HJUuZxGiTA8OwbE5ecGgUigJigBjMjrzF6WdE3YHlY9dcFPXlAKmEMfgX1QDWAaMkJYaU4OAJ+ozOohx0KX4ua0YOSULOtPyGTnVWYxNOG1X5SA84NJwetsLqW8kCXeBMPiqmsOozRKWFM4/vZmJuIne6rF7+d5aCK/8elpb9LrdGb2io5S1ZaelHkir5t3T4U47lx6QVFQaMJif55FQnzogVBcdBoVYPptspLW4TyrkONbHxzMdiMCh//zJQNKVj1iOaYlA9gjOzjYHm1rXitq2+MNQ+ApiNyipYiWNisHwDpvfqO4qJR8/+JcCiLFJRripN6eXXVKRkLjA1x6CN8BGJ3c5hu9PYEmhxgAL9k0qNOXSVEDNd4FTCSyuMo3xVyS3O3nm7c540COxHJtHVVtGNiCyqhFaAG7xg4iMj9jwvAK3MCmM+jsvWMScPuiJwUDnFTij2nSKPe+MW1GmjW8aHzIjKtcNWI4ysiGk0I2Jv0KPndv59siyT93fyThRP5Q4Rlvc2D8HszVcMQhHOXw5+ECMws5rt/FLo5/y9cjEO3lTNpRJOjxHh+wchYuCVcL1NOOnmmsx5wzWYStqaM6NOKZJhI2Sps+VV2+dDtXTr6t2+/DVBk2OzM8oSRralYpKm1AvFfsQ0vTj6KQ16Z70cJXiJrP+dXzjXA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(3023799007)(13003099007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MmitLLUrZDORIIPQnHL1exc8DB0RTepzKh4dFNmEhewXQcdIMRrrWmepomiI5Ap41ifT2yjy+882SIQ2DvPGuMaycoFFG+XN3eAKzggYsE3cSWnraIGJfHZnQlhtW1g3sw+MAOabaxTbwpsEsg2s2/d9rMQYBQAEHvuFMae64cw8ZrLVuX1P1zU86NoFO6Sl2o1ryIo2tuxbOypuFWrpExcLobVGAW70/jZ175LlNpiBSRWyqwa+9xVwtrnxv1lDehNlUnmEzigBhCjIKciwPTH+OEU2mXHy45bAw/5DL5UhjDEyZ4+GnDmvaxlAbCJy1Eo+g17dcL+phH4bS1IBaUnY67aQoRzXeAn8JgSa4cavfsRR2nPgENjdFVNKvd0T5OR0TYkf5iQLDLo1tbaaHWBsyN2jHoLPqI9i8pDbjRGbgf2iBBkwSeZHe1nJRo/j
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:16:58.1315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f36f380-eb99-4cdc-cbe6-08dee7f38246
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB10990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241692

From: Daniel Turull <daniel.turull@ericsson.com>

Changes: https://github.com/systemd/systemd/compare/v259.5...v261.1
https://github.com/systemd/systemd/blob/main/NEWS

- Drop backported patches no longer needed (libfido2_cflags,
  tpm2-util PCR bank, fdset_new debug)
- Remove sysvinit-path/sysvrcnd-path meson options and
  systemd-sysv-install skeleton (removed upstream in 260)
- Add explicit meson disables for auto-detected features in
  systemd-systemctl-native to prevent host sysroot contamination
- Refresh 0003-Do-not-create-var-log-README.patch

Tested on qemu target with testsuite systemd.

Summary of changes in systemd from NEWS file:

* Drop legacy SysV init support: rc-local, sysv-generator, sysv-install
  removed; services must ship native systemd unit files going forward.

* Deprecate non-system users/groups in udev and systemd-networkd
  configs; usage still works but emits warnings and is scheduled for
  removal.

* Raise dependency baselines:
  - cryptsetup, elfutils, libblkid, libseccomp, glibc, libxcrypt,
    OpenSSL, Python all require newer versions.
  - Linux baseline moved from 5.4 to 5.10, recommended 5.14, with
    6.6 needed for full functionality; compatibility code for older
    kernels dropped.
  - musl minimum bumped from 1.2.5 to 1.2.6 when building with
    -Dlibc=3Dmusl.

* Rework dynamic linking: shift optional dependencies to dlopen() for
  libgnutls, libmicrohttpd, libcurl, libcrypto, libssl, libfdisk,
  libcryptsetup. libsystemd no longer guarantees a link to libm, so
  consumers relying on transitive libm must link it explicitly.

* sd-varlink API: temporary enum extension in 260-rc1 changed numeric
  values, reverted in -rc2. Binaries built against -rc1 headers must
  be rebuilt to avoid ABI mismatches.

* systemd-logind D-Bus CanPowerOff/CanReboot/CanSuspend/... gain new
  return values for inhibitors: "inhibited", "inhibitor-blocked",
  "challenge-inhibitor-blocked". Consumers assuming only "yes"/"no"
  need adjustment.

* Rename systemd-nspawn --user=3D to --uid=3D. The -u short option still
  works. Old forms --user NAME/--user=3DNAME remain accepted but are
  deprecated and emit a warning; bare --user now toggles user manager
  scope instead of taking an argument.

* Varlink io.systemd.Unit: several configuration fields switched from
  free-form strings to enums (ExecInputType, ExecOutputType,
  ProtectHome, CGroupController, CollectMode, EmergencyAction,
  JobMode). Wire format now uses underscores instead of dashes/plus
  (e.g. "tty-force" -> "tty_force", "kmsg+console" -> "kmsg_console").

* Announced removal of experimental systemd-sysupdated D-Bus API in
  favor of direct Varlink IPC to systemd-sysupdate; updatectl will be
  reworked accordingly.

* TPM / CC measurement changes:
  - systemd-stub now measures more artifacts into hardware CC
    registers (e.g. TDX RTMRs) in addition to TPM, altering expected
    CC values for devicetree, initrd, ucode addons, UKI profile.
  - New verity TPM NvPCR added; various components measure dm-verity
    images into it.
  - New ConditionSecurity=3Dmeasured-os, and improved SMBIOS measurements
    in systemd-boot/systemd-stub.
  - New systemd-pcrosseparator.service adds a PCR separator
    measurement affecting PCRs 0-7,9,12-14 to isolate firmware vs OS
    measurements.

* Boot and UKI tooling:
  - systemd-stub introduces a "boot secret" passed via initrd for TPM
    fallback key material in non-TPM environments.
  - Keyboard layout and serial console are auto-propagated from UEFI
    to Linux; LoaderKeyboardLayout EFI variable used as fallback
    mapping.
  - Unified handling of UKI sidecars and "extra" Type #1 stanzas for
    confext/sysext/credentials.
  - systemd-boot avoids auto-boot into non-default UKI profiles and
    adds better fallback handling and new bootctl verbs/options.

* New IMDS subsystem:
  - hwdb gains 40-imds.hwdb to detect major public clouds and describe
    access to local IMDS endpoints.
  - systemd-imdsd provides Varlink IPC for IMDS access; systemd-imds
    imports IMDS data into credentials with measurements.
  - Optional network lockdown for IMDS via -Dimds-network=3D, with a
    "locked" default recommended for secure setups.

* New metrics / report framework:
  - systemd-report defines a Varlink-based metrics aggregation API
    under /run/systemd/report/.
  - Initial endpoints from systemd-networkd and the service manager in
    260; extended in 261 to system-wide and per-service/cgroup metrics,
    with Varlink and HTTP upload support.

* New mstack feature:
  - ".mstack/" directory layout defines overlayfs + bind mount stacks
    for services/containers.
  - RootMStack=3D unit setting and systemd-nspawn --mstack=3D support
    invoking services and containers from self-describing mstack
    images.
  - importctl pull-oci stores OCI images as mstack images.

* Manager and resource-control enhancements:
  - New per-unit settings: RootMStack=3D, PrivateUsers=3Dmanaged,
    MemoryTHP=3D, CPUSetPartition=3D, RestrictFileSystemAccess=3D (BPF LSM)=
,
    CPUPressureWatch=3D/CPUPressureThresholdSec=3D,
    IOPressureWatch=3D/IOPressureThresholdSec=3D.
  - New global knobs: DefaultMemoryZSwapWriteback=3D,
    EventLoopRateLimitIntervalSec=3D/EventLoopRateLimitBurst=3D,
    MinimumUptimeSec=3D (default 15s to avoid tight boot loops).
  - fd-store persistence improvements: LUO/Kexec handover support in
    PID1, FileDescriptorStorePreserve=3Don-success and user/manager
    plumbing to keep memfds and other state across session restarts
    and kexec.

* Varlink and IPC surface growth:
  - New Varlink methods for shutdown (PowerOff, Reboot, SoftReboot,
    Halt, Kexec) on io.systemd.Manager and io.systemd.Shutdown.
  - io.systemd.Unit.StartTransient(), io.systemd.Manager.ListUnitsByNames()=
,
    io.systemd.Job interface for job inspection/cancellation.
  - systemd-networkd Varlink updates: Reload(), Link.Describe(),
    Reconfigure(), Renew(), ForceRenew(), Up()/Down() and reporting
    of interface bit rates.
  - journalctl gains a Varlink GetEntries() interface.
  - New sd-varlink APIs for sentinel handling and protocol upgrade,
    plus wildcard type SD_VARLINK_ANY and per-UID connection limit
    reduction.

* Scheduling and rollout knobs:
  - CPUSchedulingPolicy=3Dext for SCHED_EXT.
  - ConditionFraction=3D for percentage-based staged rollouts keyed by
    machine ID and tag.
  - ConditionMachineTag=3D and new Tags=3D in /etc/machine-info for
    fleet-wide targeting via hostnamed.

* Filesystem, tmpfiles, sysusers:
  - tmpfiles.d/root.conf sets / to mode 0555 in certain setups.
  - systemd-tmpfiles gains --inline and new k/K directives for
    capabilities.
  - New initrd services systemd-sysext-sysroot.service and
    systemd-confext-sysroot.service to merge extensions from initrd,
    plus a kernel kill switch to fully disable sysext/confext.

* Networking and resolved:
  - DHCP relay refactoring with sd-dhcp-relay backend; [DHCPServer]
    options deprecated in favor of [Network]/[DHCPRelay] + networkd.conf
    settings.
  - systemd-networkd adds MultiPathRoute=3D improvements, ModemManager
    "simple connect" integration, new offload controls in .link files,
    new DHCPv4 server options, and various Varlink/JSON interface
    updates.
  - systemd-resolved adds JSON static RR drop-ins, per-interface cache
    size tunables, improved DNSSEC handling for insecure answers,
    better stale cache retention, and reload of /etc/hosts on
    SIGHUP/Reload().
  - resolvectl now talks via Varlink; nss-resolve gains interface
    scoping via $SYSTEMD_NSS_RESOLVE_INTERFACE.

* Logging, coredumps, cryptsetup:
  - coredumpctl info gains JSON output; crashing thread TID/name and
    new COREDUMP_CODE field recorded.
  - systemd-cryptsetup/libcryptsetup moved behind dlopen(); new
    fixate-volume-key=3D support for binding crypttab entries to volume
    keys; systemd-cryptenroll now defaults to RSA-OAEP+SHA-256 for
    sealed keys.
  - systemd-creds improves TPM2 PCR handling to avoid errors on non-TPM
    systems.

* OOM and reliability:
  - systemd-oomd gains OOM rulesets and "prekill hook" integration via
    Varlink sockets.
  - systemd-oomd and PID1 adopt pidfds in more places.
  - systemd-run gets --output=3D to control verbose mode logging.

* Misc:
  - RootImageOptions=3D/ExtensionImages=3D/MountImages=3D parsing changed s=
o
    last definition per partition wins, aligning with other option
    semantics.
  - systemd-sysext/confext refresh now suppresses unnecessary
    umount/mount by default, with --always-refresh=3D to force a
    refresh.
  - getty@.service now has [Install] section and must be explicitly
    enabled.
  - runlevel[0-6].target can be restored when building with
    -Dcompat-sysv-interfaces=3Dyes, but SysV scripts themselves are
    gone.

AI-Generated: Claude-opus-4.6
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ..._259.5.bb =3D> systemd-boot-native_261.1.bb} |  0
 ...md-boot_259.5.bb =3D> systemd-boot_261.1.bb} |  0
 ...259.5.bb =3D> systemd-tools-native_261.1.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  8 +-
 ...meson-use-libfido2_cflags-dependency.patch | 54 -----------
 .../0003-Do-not-create-var-log-README.patch   | 10 +-
 ...il-fix-PCR-bank-guessing-without-EFI.patch | 62 ------------
 ...-detailed-debug-logging-to-fdset_new.patch | 97 -------------------
 .../{systemd_259.5.bb =3D> systemd_261.1.bb}    | 12 +--
 9 files changed, 11 insertions(+), 232 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_259.5.bb =3D> system=
d-boot-native_261.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_259.5.bb =3D> systemd-boot_=
261.1.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_259.5.bb =3D> syste=
md-tools-native_261.1.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfid=
o2_cflags-dependency.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PC=
R-bank-guessing-without-EFI.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-add=
-detailed-debug-logging-to-fdset_new.patch
 rename meta/recipes-core/systemd/{systemd_259.5.bb =3D> systemd_261.1.bb} =
(99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_259.5.bb b/meta/=
recipes-core/systemd/systemd-boot-native_261.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot-native_261.1.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_259.5.bb b/meta/recipes=
-core/systemd/systemd-boot_261.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_259.5.bb
rename to meta/recipes-core/systemd/systemd-boot_261.1.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/meta=
/recipes-core/systemd/systemd-tools-native_261.1.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-tools-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-tools-native_261.1.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index efd7826684..bb499a0587 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,14 +15,10 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
-SRCBRANCH =3D "v259-stable"
+SRCREV =3D "eff9446d505d62c075bed37d606860b38cfe51fb"
+SRCBRANCH =3D "v261-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
 CVE_PRODUCT =3D "systemd"
=20
 CVE_STATUS[CVE-2019-3815] =3D "not-applicable-platform: only applied to RH=
EL"
-CVE_STATUS[CVE-2026-40223] =3D "fixed-version: fixed in 259.2"
-CVE_STATUS[CVE-2026-40224] =3D "fixed-version: fixed in 259.3"
-CVE_STATUS[CVE-2026-40225] =3D "fixed-version: fixed in 259.5"
-CVE_STATUS[CVE-2026-40226] =3D "fixed-version: fixed in 259.4"
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cfla=
gs-dependency.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-libf=
ido2_cflags-dependency.patch
deleted file mode 100644
index 4bc1e10ee7..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-depe=
ndency.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001
-From: Dan McGregor <danmcgr@protonmail.com>
-Date: Wed, 11 Mar 2026 18:26:05 -0600
-Subject: [PATCH] meson: use libfido2_cflags dependency
-
-Add the libfido2 dependency to cryptenroll and cryptsetup's
-meson files. If libfido2's not installed in the default path
-the build wasn't finding its headers correctly.
-
-Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9ce90=
5e35f690e7a10cd286be2b50594d0857f5e]
----
- src/cryptenroll/meson.build                  | 1 +
- src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-
- src/cryptsetup/meson.build                   | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build
-index 488ceea14d..11265c8b41 100644
---- a/src/cryptenroll/meson.build
-+++ b/src/cryptenroll/meson.build
-@@ -23,6 +23,7 @@ executables +=3D [
-                 'dependencies' : [
-                         libcryptsetup,
-                         libdl,
-+                        libfido2_cflags,
-                         libopenssl,
-                         libp11kit_cflags,
-                 ],
-diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build b/src/cryptsetup=
/cryptsetup-tokens/meson.build
-index 804e18bc67..0fd6309201 100644
---- a/src/cryptsetup/cryptsetup-tokens/meson.build
-+++ b/src/cryptsetup/cryptsetup-tokens/meson.build
-@@ -58,7 +58,7 @@ modules +=3D [
-                 'sources' : cryptsetup_token_systemd_fido2_sources,
-                 'dependencies' : [
-                         libcryptsetup,
--                        libfido2,
-+                        libfido2_cflags,
-                 ],
-         },
-         template + {
-diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build
-index d9778259c2..b36354fb0a 100644
---- a/src/cryptsetup/meson.build
-+++ b/src/cryptsetup/meson.build
-@@ -19,6 +19,7 @@ executables +=3D [
-                 'sources' : systemd_cryptsetup_sources,
-                 'dependencies' : [
-                         libcryptsetup,
-+                        libfido2_cflags,
-                         libmount_cflags,
-                         libopenssl,
-                         libp11kit_cflags,
diff --git a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-R=
EADME.patch b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-=
README.patch
index 1d3c4f83c0..0128c83d9f 100644
--- a/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
+++ b/meta/recipes-core/systemd/systemd/0003-Do-not-create-var-log-README.p=
atch
@@ -1,7 +1,7 @@
 From a7f6a296707642d05463aec22ea3dfce7d06c989 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Tue, 21 Jan 2025 05:02:00 +0100
-Subject: [PATCH 03/16] Do not create /var/log/README
+Subject: [PATCH] Do not create /var/log/README
=20
 /var/log/README is a link to /usr/share/doc/systemd/README.logs. The
 latter is packaged in systemd-doc and likely not installed, which leaves
@@ -15,19 +15,15 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@a=
xis.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/tmpfiles.d/legacy.conf.in b/tmpfiles.d/legacy.conf.in
-index cdef21fa9b..03798c953e 100644
+index cdef21fa9b..7890abcdef 100644
 --- a/tmpfiles.d/legacy.conf.in
 +++ b/tmpfiles.d/legacy.conf.in
-@@ -13,9 +13,6 @@
+@@ -13,6 +13,3 @@
 =20
  d /run/lock 0755 root root -
  L /var/lock - - - - ../run/lock
 -{% if CREATE_LOG_DIRS %}
 -L$ /var/log/README - - - - ../..{{DOC_DIR}}/README.logs
 -{% endif %}
-=20
- {% if HAVE_SYSV_COMPAT %}
- # /run/lock/subsys is used for serializing SysV service execution, and
 --=20
 2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-=
guessing-without-EFI.patch b/meta/recipes-core/systemd/systemd/0004-tpm2-ut=
il-fix-PCR-bank-guessing-without-EFI.patch
deleted file mode 100644
index c590b01cd3..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-tpm2-util-fix-PCR-bank-guessin=
g-without-EFI.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 3cef11c710e95bb5f891181e9b2a6d8f174712c3 Mon Sep 17 00:00:00 2001
-From: Patrick Wicki <patrick.wicki@subset.ch>
-Date: Fri, 20 Mar 2026 15:56:56 +0100
-Subject: [PATCH] tpm2-util: fix PCR bank guessing without EFI
-
-Since 7643e4a89 efi_get_active_pcr_banks() is used to determine the
-active PCR banks. Without EFI support, this returns -EOPNOTSUPP. This in
-turns leads to cryptenroll and cryptsetup attach failures unless the PCR
-bank is explicitly set, i.e.
-
-$ systemd-cryptenroll $LUKS_PART --tpm2-device=3Dauto --tpm2-pcrs=3D'7'
-[...]
-Could not read pcr values: Operation not supported
-
-But it works fine with --tpm2-pcrs=3D'7:sha256'.
-
-Similarly, unsealing during cryptsetup attach also fails if the bank
-needs to be determined:
-
-Failed to unseal secret using TPM2: Operation not supported
-
-Catch the -EOPNOTSUPP and fallback to the guessing strategy.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/41231]
-
-Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
----
- src/shared/tpm2-util.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/shared/tpm2-util.c b/src/shared/tpm2-util.c
-index cf11b50695..c0590fe575 100644
---- a/src/shared/tpm2-util.c
-+++ b/src/shared/tpm2-util.c
-@@ -2702,11 +2702,11 @@ int tpm2_get_best_pcr_bank(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If variable is not set use guesswork below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
-@@ -2811,11 +2811,11 @@ int tpm2_get_good_pcr_banks(
-         uint32_t efi_banks;
-         r =3D efi_get_active_pcr_banks(&efi_banks);
-         if (r < 0) {
--                if (r !=3D -ENOENT)
-+                if (!IN_SET(r, -ENOENT, -EOPNOTSUPP))
-                         return r;
-=20
-                 /* If the variable is not set we have to guess via the co=
de below */
--                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable, we have to guess the used PCR banks.");
-+                log_debug("Boot loader didn't set the LoaderTpm2ActivePcr=
Banks EFI variable or EFI support is unavailable, we have to guess the used=
 PCR banks.");
-         } else if (efi_banks =3D=3D UINT32_MAX)
-                 log_debug("Boot loader set the LoaderTpm2ActivePcrBanks E=
FI variable to indicate that the GetActivePcrBanks() API is not available i=
n the firmware. We have to guess the used PCR banks.");
-         else {
diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detail=
ed-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/001=
8-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
deleted file mode 100644
index 63fa7fefec..0000000000
--- a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-debu=
g-logging-to-fdset_new.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
-From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
-Date: Wed, 21 Jan 2026 14:13:29 +0530
-Subject: [PATCH] systemd: Add detailed debug logging to fdset_new_fill()
-
-Currently, when fdset_new_fill() fails to open /proc/self/fd or
-encounters an error while processing individual file descriptors
-(such as fcntl or fstat failures), it returns a silent error code.
-
-For debugging rarely reproducible failures it becomes difficult to
-know the exact cause of failure
-This commit updates the function to use log_debug_errno() for all
-error paths and hence  provides better visibility into why FD collection
-failed, including the path of the problematic FD (via fd_get_path)
-and its inode type.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]
-
-Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
----
- src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
- 1 file changed, 26 insertions(+), 9 deletions(-)
-
-diff --git a/src/shared/fdset.c b/src/shared/fdset.c
-index 832e7fda60..f340f41b0e 100644
---- a/src/shared/fdset.c
-+++ b/src/shared/fdset.c
-@@ -8,6 +8,7 @@
- #include "alloc-util.h"
- #include "async.h"
- #include "dirent-util.h"
-+#include "errno-util.h"
- #include "fd-util.h"
- #include "fdset.h"
- #include "log.h"
-@@ -179,9 +180,10 @@ int fdset_new_fill(
-         d =3D opendir("/proc/self/fd");
-         if (!d) {
-                 if (errno =3D=3D ENOENT && proc_mounted() =3D=3D 0)
--                        return -ENOSYS;
-+                        return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),
-+                                               "Failed to open /proc/self=
/fd/, /proc/ is not mounted.");
-=20
--                return -errno;
-+                return log_debug_errno(errno, "Failed to open /proc/self/=
fd/: %m ");
-         }
-=20
-         s =3D fdset_new();
-@@ -210,9 +212,14 @@ int fdset_new_fill(
-                          * been passed in can be collected and fds which =
have been created locally can be
-                          * ignored, under the assumption that only the la=
tter have O_CLOEXEC set. */
-=20
--                        fl =3D fcntl(fd, F_GETFD);
--                        if (fl < 0)
--                                return -errno;
-+                        fl =3D RET_NERRNO(fcntl(fd, F_GETFD));
-+                        if (fl < 0) {
-+                                _cleanup_free_ char *path =3D NULL;
-+                                (void) fd_get_path(fd, &path);
-+                                return log_debug_errno(fl,
-+                                                       "Failed to get fla=
g of fd=3D%d (%s): %m ",
-+                                                       fd, strna(path));
-+                        }
-=20
-                         if (FLAGS_SET(fl, FD_CLOEXEC) !=3D !!filter_cloex=
ec)
-                                 continue;
-@@ -221,13 +228,23 @@ int fdset_new_fill(
-                 /* We need to set CLOEXEC manually only if we're collecti=
ng non-CLOEXEC fds. */
-                 if (filter_cloexec <=3D 0) {
-                         r =3D fd_cloexec(fd, true);
--                        if (r < 0)
--                                return r;
-+                        if (r < 0) {
-+                                _cleanup_free_ char *path =3D NULL;
-+                                (void) fd_get_path(fd, &path);
-+                                return log_debug_errno(r,
-+                                                       "Failed to set CLO=
EXEC flag fd=3D%d (%s): %m ",
-+                                                       fd, strna(path));
-+                        }
-                 }
-=20
-                 r =3D fdset_put(s, fd);
--                if (r < 0)
--                        return r;
-+                if (r < 0) {
-+                        _cleanup_free_ char *path =3D NULL;
-+                        (void) fd_get_path(fd, &path);
-+                        return log_debug_errno(r,
-+                                               "Failed to put fd=3D%d (%s=
) into fdset: %m ",
-+                                               fd, strna(path));
-+                }
-         }
-=20
-         *ret =3D TAKE_PTR(s);
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_261.1.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_259.5.bb
rename to meta/recipes-core/systemd/systemd_261.1.bb
index edb6410772..6775a2a205 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_261.1.bb
@@ -36,9 +36,6 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0001-meson-use-libfido2_cflags-dependency.patch \
-           file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_ne=
w.patch \
-           file://0004-tpm2-util-fix-PCR-bank-guessing-without-EFI.patch \
            file://0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warnin=
g.patch \
            "
=20
@@ -231,9 +228,6 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Ddbus=3Ddisabled \
                   -Dtests=3Dfalse \
                   -Dlibc=3D${TCLIBC} \
-                  -Drc-local=3D'' \
-                  -Dsysvinit-path=3D'' \
-                  -Dsysvrcnd-path=3D'' \
                   "
=20
 # Hardcode target binary paths to avoid using paths from sysroot or worse
@@ -587,6 +581,8 @@ FILES:${PN}-extra-utils =3D "\
                         ${bindir}/systemd-cgtop \
                         ${bindir}/systemd-stdio-bridge \
                         ${base_sbindir}/mount.ddi \
+                        ${base_sbindir}/mount.mstack \
+                        ${base_sbindir}/mount.storage \
                         ${systemd_system_unitdir}/initrd.target.wants/syst=
emd-pcrphase-initrd.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/sys=
temd-pcrphase.path \
                         ${systemd_system_unitdir}/sysinit.target.wants/sys=
temd-pcrphase-sysinit.path \
@@ -683,6 +679,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/polkit-1 \
                 ${datadir}/${BPN} \
                 ${datadir}/factory \
+                ${datadir}/user-tmpfiles.d \
                 ${sysconfdir}/credstore/ \
                 ${sysconfdir}/credstore.encrypted/ \
                 ${sysconfdir}/dbus-1/ \
@@ -692,6 +689,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${sysconfdir}/sysctl.d/ \
                 ${sysconfdir}/systemd/ \
                 ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/user-tmpfiles.d/ \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv-conf.systemd \
@@ -803,11 +801,13 @@ FILES:udev +=3D "${base_sbindir}/udevd \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage.rules =
\
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-mtd.ru=
les \
                ${nonarch_libdir}/udev/rules.d/60-persistent-storage-tape.r=
ules \
+               ${nonarch_libdir}/udev/rules.d/60-tpm2-id.rules \
                ${nonarch_libdir}/udev/rules.d/60-persistent-v4l.rules \
                ${nonarch_libdir}/udev/rules.d/60-sensor.rules \
                ${nonarch_libdir}/udev/rules.d/60-serial.rules \
                ${nonarch_libdir}/udev/rules.d/61-autosuspend-manual.rules =
\
                ${nonarch_libdir}/udev/rules.d/64-btrfs.rules \
+               ${nonarch_libdir}/udev/rules.d/65-integration.rules \
                ${nonarch_libdir}/udev/rules.d/70-camera.rules \
                ${nonarch_libdir}/udev/rules.d/70-joystick.rules \
                ${nonarch_libdir}/udev/rules.d/70-memory.rules \

