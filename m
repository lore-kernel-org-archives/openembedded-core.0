Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38EDC55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:26:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37354.1785925591814185461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=J7VB1yoX;
 spf=pass (domain: ericsson.com, ip: 52.101.84.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMBEM2QY4Dt62n9I5KlFEOPlM7znEMjF9js/b4norkM/DjHJMmJVee0MEp2Lqte/CAQ8SHqi8JWSUo+TU773eJkzqRaXLwb25l/q608rhhhCHJXNtLZtFKZiWT9Dnr3oTRSzbzCRdZ1kMZRy+b1HOmE54TG8qDzwx3/ih6V1ee1ToRtoKQN5EqK7ll/HqyqupcP0IxqKdHpqegViG2qvJVg3BVGdeN3gd/ofnWXr3OL2L6kktmFi3ro/wSRE3iQRVQgfZdelexSO0RGTSHwzKZl3goezJbOOBIyrVDD8UI6tgjboX1XT27iv6/wIJggjdD4D8Z1r4LZgdq3TyDI0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8EMMkfxiSzspzRBQ0GAv+3iv9PfE7U9tGhIxFQzqh0=;
 b=FRs1lfdHYPglbDeqbc6w6c9mq0ChvVjBxdUN9oCL8jIbOMrVFNtM4Gixza1CFd+0RrgryqWDb4ps6ETFMFRpnSoCll/4marF/uFjd7ZVQjiJ6uaCz2Ahcb39JvWb25Nin6JPl7EvE91/jHDeOnND+h07DC68V2nxhwI4XsHhru65kb6hx3nXt5ZdVqu0VXpHUpGIXpJLIYTkT8sY8yy+xVCR84Jo14GJP0/jtvEvmtUJ2UAokJG1k5vNkBe9/DUOndB4ThCgHFrYXVlqbOycamyJ13AZSc1PfAhGhdlG+owxgqU++6JhitLzouXj3MxhawwjZsBgqnlj+DOHU1CiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8EMMkfxiSzspzRBQ0GAv+3iv9PfE7U9tGhIxFQzqh0=;
 b=J7VB1yoXKUAatI2pECMUGbNUB0wYZM8I2ME7jsqKRv5pnZChpGWReUsVf+jV4qJGMjLYTGBCSzE2RZKiytNMAneXTZ03uZ+ZhmCQUzjr8mhOSN95cV+dnb0TUpGUYLmAhzdnFtP6mHJmqyAoPcS+tyTNJMk2PD61cyn99OQmdxzLcajMJPVa8RC40Boqp6FD9LBcaWd0rT0JLKqL9tbp7r4mMyl3l1agDJSxIW981VF494ZBVQrfdJTAeJcHPUWNDzwQQhdSSNurbtiKEVfwcvewHrok0cmsJax7+yL/hPRwHXQCPgVE6JYtGBXGOQXsUSf/kbIMut9kuiG8EIiiig==
Received: from AS4P190CA0069.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::15)
 by AS5PR07MB9893.eurprd07.prod.outlook.com (2603:10a6:20b:67c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 10:26:22 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:20b:656:cafe::41) by AS4P190CA0069.outlook.office365.com
 (2603:10a6:20b:656::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 10:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 10:26:22 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.65) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 5 Aug 2026 12:26:21 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 6D56D95800;
	Wed,  5 Aug 2026 12:26:21 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3A3AB700DBB0; Wed,  5 Aug 2026 12:26:21 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] systemd: upgrade to 261.2
Date: Wed, 5 Aug 2026 12:26:15 +0200
Message-ID: <20260805102615.1663361-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|AS5PR07MB9893:EE_
X-MS-Office365-Filtering-Correlation-Id: b131e115-9a0b-4d65-013a-08def2dbfeee
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|6133799003|56012099006|11063799006|5023799004|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3vpoxGnjCwvKlue5yyTQ8X7hh4hNbjCuYb6HSD9L97IgniAGXpBDBMfh7zd2gUWEwtFA6DwN0UG2+sx/88gqBKYhGzW8lGJ2cdjhyDJSvAh0PFtn/aiCcQun5fXOSb7qn3PZE+nziEiKoaaG2SI3pRlby/WyPbOcK+7VVt7d+IKSMmz2JZrm8ksb9ziiev98dxcz3a3NacxD30PiqzRc3CbCB2Lz+SP6WQLJXjNP9Gc0dv47oprr+STiVw2dpZEXS2eA7FCtZzE70ERMuzsK7uv4uRXYygBkMdhDWNNspU/xl0+kd5QPOyQSm8rZMMS7Vnv1YLiBJXXM5dFFCFWCKM6X3RTlEikDrFsy2JFWV8rI7/WSIAX1RiN5qDH0rfMYCIH9Douq0HJl5FWBqScHvN0mk0ckbZZ6CGUGypAJeNyyBumTcXqvrHu5ntNjU8jybLWwWLiOOR0ZPcrLXpgC/47cqs1MuBGFQY8hB/mOeYw0HuHfBzmpNdQXXp5Ld/pIrSXrVsZQ6haEhD7GgJ3PdW1BOTEsowjSyrQ9SVA27GhZYfD/dAT2hPP3aI5uHNMdgVJlXxZGiV7KU7w/v9AfqObRM1IBfnBlKXry0Hg1HFwTymbqwoPaBPGwPbyiQI5qGOJvlv+p0j10dvw4EpR+tXJmsg+PDmGcijtY1drDP/vkPyXsHZhh8P+wiuUv+usHOq4YeDN5hTYteNyyG3zNdA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(6133799003)(56012099006)(11063799006)(5023799004)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ST7FdEpdpAKQcdawFJoMg5sWTvo9on7ZZ0LriEjtoOmxGGAWBUN8xeiwg95+x+gqPIuGLZAc8KkLc23KWbmq/FS6D/hCU9bp4J54h2q4kkkbt8X97KEvUTXWPF0XvHPUiRIKgXo5InP/RiJQ1wNbWj+I0mMJ6dQe+uHirlH0D2W2MSEX84nFBGcnB3VyxiFXV9D4dQ9w0xeA2dKAbj4x0mExTaYJm0Qw56rmJh11K0CBmIM4jz84sLQ16w32K8p+m+JN2GNxMqZ1hl853UD8JrXqIT4tE2/Hup7pvoWONw/269jXLlbf0eWN1jM2HgrODFVoN45tm9YVE34cWOaTC+pDCm4EZpcJBT3rDEVJJeW2ijMzwOD6JAgacuyXFjIHXekDWWqNXrsKwW/w5xrKXuSRrUcowcAdHf0haFHSQpkLZbl1xLB587t0w5zQ2MfT
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:26:22.1059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b131e115-9a0b-4d65-013a-08def2dbfeee
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9893
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242857

From: Daniel Turull <daniel.turull@ericsson.com>

Drop two backports that are already in the new version

Changelog for systemd: 261.1 -> 261.2

4925d9f07f meson: bump version to 261.2
70cc4f3d72 escape: reject UTF-16 surrogates in \u escapes in cunescape_one(=
) (#43079)
a7bce5b205 homed: verify privileged worker changes
f62b9ce4ed man: document that ExitType=3Dcgroup is rejected for Type=3Dones=
hot
24ca862cf7 man: update the sample glib/sd-event integration
28c374ef1c man: document unlocked as default IMDS network mode
1192084871 sd-device: allow non-safe characters in uevent files
dbfd5d2789 hwdb: classify PlayStation controller audio as controller form-f=
actor
41932924a4 hwdb: strip the root from filenames when generating hwdb.bin
089099b924 man/network: fix default value for RequiredFamilyForOnline=3D
ff395a8c2a hwdb: add debug logging for the output filename
26f3717e27 core/dbus: do not block the manager on GetId during bus (re-)con=
nection
dc225cc553 boot: cover BCD offsets past the buffer
d8cdc4ee79 password-quality-util-passwdqc: restore password-quality-util.h =
include
598273bb05 systemd-imds-generator: fix import docs
b9a65cb1ba creds: reject empty validity intervals
5158952f96 dissect: include image size in JSON output
d4ea8a3061 repart: skip generated files during dry runs
eeb244e82c firstboot: validate root shell credentials
431c436a53 sysusers: validate shell credentials
d3ebe51c6a docs: clarify scope of portable services
c6fc821265 repart: fix varlink description string
484aee1528 network: silence false warning about unitialized variable
ef3e2271bd id128: reject app-specific IDs for new
2edfcce6b0 rm-rf: downgrade root check log when directory doesn't exist
caa3df83b3 rm-rf: use faccessat instead of fstatat
180baee67d repart: log allocation failure at debug level in Varlink service=
 mode
b83eac6ac0 repart: report the actual block device size in currentSizeBytes
a315a8afca portable: honor --force for directory extensions
0e4bb54915 portabled: apply pool limits to portable images
bcc187363a portablectl: normalize set-limit image paths
bf5bf89bd4 portablectl: normalize remove image paths
81e6878669 portable: keep unit symlinks inside the image
4f7c9b77ae portablectl: normalize read-only image paths
e67b1bfaf5 portablectl: keep inspect --force unit metadata
b05d2790a2 hwdb: update to main@{2026-07-17}
b456963bec obs: disable Tumbleweed too
43c416bcd6 units: properly wait for swtpm to finish before the initrd trans=
ition
b2f01dfed1 units: harden systemd-tpm2-swtpm.service
a4badd74aa tpm2: stop the software TPM before the ESP is unmounted on shutd=
own
160d4f1259 tree-wide: get rid of backslashes in file names
8467a27870 nspawn: use chase() for creating dev nodes
c889bcb737 nspawn: log at error level before exiting if parsing OCI fails
fe3dbfdf7f boot: fix MEMMAP_DEVICE_PATH EndingAddress field calculation
870d718006 Rebased and reapplied the fix, dropped the test case.
7aa2da940f discover-image: don't ignore symlinks to raw images
d392d17143 homed: fix verification of local identity file
eb24d74627 machined: Allow user ids in open_shell for machine-dbus
c6138ffbdc udev-util: bound leading whitespace skip in udev_replace_whitesp=
ace
f4c528cb06 string-util: add strnspn()
f767359875 sysext: validate work directory metadata before removal
4529bb61d9 shift-uid: close consumed directory fds on early return
9033eae9af rm-rf: fail closed when the root check fails
c63b37c0f0 vconsole: reject empty layout during keymap conversion with erro=
r
fd01077f17 resolved: preserve unchanged question on asymmetric redirect
350d79015d journal-remote: zero-initialize MHD daemon wrapper
bd45f60193 journal-remote: remove disabled compression entry before freeing
91796f82de network: cancel netlink calls for detached requests
edd08edfe2 network: compare all multipath route nexthops
742bdbb0ea tpm2-util: keep the measurement log's torn-write marker intact
170dab0fe9 journalctl: reject field listing with filters
5e150d2eb5 test: make NSS IPv4 tuple bounds explicit
17dfd608f5 oci-util: Don't fall back to default registry for explicit regis=
tries
92ea6ed698 boot: guard missing Windows auto entry
19ce494c58 journalctl: use root machine ID for namespaces
5ab9b61004 tpm2-util: initialize NvPCRs on first extension
6f10261eef sd-dhcp-relay: fix off-by-one when discarding BOOTREQUEST messag=
es by hops count
56958bd945 boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
fdd3966f56 sysupdate: use strverscmp_improved() like everywhere else
2c219d2f09 timedatectl: display RTCTimeUSec in UTC format
aa10c21092 network: do not use assert() on a call with side effects
8e10f5f229 dissect-image: don't assert() on partition geometry from blkid
20140670a5 homework-luks: add new key slots before destroying old ones
ff4298e73b pull-oci: switch assert() to assert_se() for set_remove() call
b5c0959d45 copy: avoid following fifo/node chmod target
cb25da37eb log: add upper bound to journal iovec accounting
a09c3c523d string-util: add upper bound to ellipsize_mem UTF-8 walks
c8e6b02ce6 test: Remove a redundant exit call
ddc90bf66c sysupdate: Downgrade an info to a debug log message
c8dabc7a90 man: update gpt-auto-generator ESP mounting behavior
b8a1d98873 repart: Properly pre-calculate auto size of images
2d75ade520 id128: honor json output for single ids
c3ce4a403d boot: allow BCD fields to end at buffer limit
e42a4b8be7 portablectl: retry inspect with PORTABLE_PREFIXES
1b23cedff3 string-util: introduce STRING_FILENAME_PART flag for string_is_s=
afe()
87983793db string-util: add STRING_DISALLOW_WHITESPACE for string_is_safe
14648c131e dns-answer: preserve shared aliases when removing records
faa89f2c7d resolved: roll back partial DNS zone publication
856f2c88b7 man: clarify that --when=3D is a lower bound, not a condition
72816231de boot: skip boot counter logic for entries marked read-only
848532980f boot-secret: don't initialize secret mixin file if marked read-o=
nly
4c27b10f7f boot: skip random seed handling if seed file is marked read-only
eab3959fee run: reject waiting for remain-after-exit services
cdc7b3c086 run: reject JSON output with verbose logs
c6750b6267 run: reject JSON output in scope mode
1e4abaa22c run: reject JSON output for trigger units
53947cf5a3 run: reject JSON output with stdio forwarding
abe01e1a8c run: accept explicit trigger unit names
2e5787eb75 run: reject --ignore-failure in scope mode
3e93ac6e17 run: honor --no-block for trigger units
8f4aa23791 repart: Fix growing the partition preceding a FreeArea from left=
over space
6a2db11e2e timer: avoid re-arming WakeSystem=3Dyes timer after suspend
61ed8f7147 resolved: publish browsed service after initialization
49f3d283fd libudev: replace unique list entries in place
48161d0f85 udev/net: reset the config list head in link_configs_free()
3c0f875c76 repart: Don't copy trailing padding when using --copy-from=3D
377c4e1001 repart: Clarify and test that --copy-from=3D argument respects g=
rain size
293e44cb09 repart: Don't get old grain size from fdisk for --copy-from=3D
15b672e8a5 udevadm-trigger: reject invalid wait-daemon timeout
461c203676 udev-config: merge configured children max
af2e46c389 man/udevadm: update device-id-of-file arguments
c9c847e23d udevadm-settle: reject positional arguments
feb767cb60 udevadm-wait: let --removed override initialization
400b796c81 udevadm-info: allow valueless attr filters
ac6eb48563 udev: avoid reading before empty capability masks
32fc32a92f test: TEST-89: assert ifindex=3D0 browse does not flap
72cb20049e ci: check 'update-man-rules' to ensure it is not forgotten
e445b27491 resolved: fix spurious BrowseServices add/remove flapping with i=
findex=3D0
8ac83d4f6c nss-myhostname: keep IPv6 probe result stable
a6bd0815f5 creds: tolerate TPM2 seal failure in auto mode
af1a5b4566 ndisc: reject non-zero ICMPv6 codes in parsers
9d34967b4f pull-oci: verify redirected manifest digest
69a4065ae0 efivars: fix concurrent growth read accounting
ebbad7adc9 network: do not regenerate MAC address if already set by userspa=
ce
5e1295cb08 obs: explicitly disable Ubuntu/i586 builds
f1c1f93118 udev: require exact builtin command matches
a7ca71c5a4 include: add hwcaps missing from glibc and musl
7bb32fdcee nspawn-oci: match the spec-correct "swappiness" memory field key
7ac32985fe udevadm-info: handle missing data db cleanup
1da0209142 udevadm-control: reject oversized children-max
eca88a543b udev-rules: drop truncated import output line
76f014a083 udevadm-hwdb: honor root when querying
ab9695a0b1 udev-rules: accept cvm CONST matches
5df1e9d9f4 import: drop redundant oci-util.c from sources
735ac821c8 dns-configuration: make dns_scope_free() static
f36fa3cd91 creds: Use ERRNO_IS_NEG_TPM2_UNSEAL_BAD_PCR
a5231d9ace cryptsetup: Give NV index missing its own error code
5713f1e55e cryptsetup: Skip tokens with JSON parsing errors
e8660577a4 cryptsetup: Reduce log level for TPM mismatches
9ccec8367c cryptsetup: Remap bad PCR set early to EPERM
70eb48e1a4 TEST-70-TPM2.cryptsetup: Make sure we iterate over foreign token=
s
2424b89f5e tpm2-util: Also report EREMOTE if key is for different parent te=
mplate
6ff4b985ac tpm2-util: For NV index errors report EREMOTE to be able to cont=
inue
793efd3553 tpm2-util: Align tpm2_import with tpm2_load to report on foreign=
 keys
96cc8eecb7 cryptsetup/cryptenroll: Iterate over TPM tokens when they don't =
match
4d229c8d85 cryptsetup: Report mismatching TPM token error separately
0bd3d0c2e2 stub: Set up all detected consoles
a047e14bc8 mount-util/sysext: Clone sub mounts as private to preserve neste=
d ones
2d4b465561 mount-util: Compact list of sub mounts after dropping
434d6e0274 core: make `/run/systemd/first-boot` available earlier
df771b177b sysupdate: handle slashes after pattern fields
43a450377b tree-wide: fix some double word errors like "the the"
3b3b4692a8 core: connect to sockets in credential directories
42060d2c30 pcrlock: handle piped PE input
2073a33f0d dissect: do not follow copy-to directory symlinks
86931d2563 stub: Prefer graphical console over virtio detection heuristic
94d7796aef logind: set session->started before seat_read_active_vt() call
723b35b584 journal-remote: do not create /var/log/journal/remote
c76ae7a879 mkosi: update arch commit reference to f884cb080300eeb273fb7549f=
d0aa19bb6142c21
a955daf063 efi-api: validate boot option device path lengths
b82a9f9f53 dns-rr: invalidate wire format after changing ttl
872ad58935 tmpfiles: add hardening in glob_item_recursively
c4e5f003ed resolved: honour per-link DNSOverTLS=3Dyes for certificate verif=
ication
4cff7ce255 sd-event: use CLOCK_BOOTTIME for rate limits
bcabc25eb6 creds-util: log when we remove a secret from a different machine
050ff0d62b sd-device: check fd validity before using in sendmsg in test
dd01b5bd60 dns-rr: fix SOA JSON fields
d51dd5a655 fsck: don't apply invalid mode or repair values
c4e0899385 bootctl: Fix prepend when installing systemd-boot for the first =
time
fc4658bc0a sd-bus: voidify bus_match_remove call
9ec5d452f2 measure-smbios: bound type 1 length before zeroing wake-up type
ac406e3232 gitignore: add .envrc, .direnv
b8522c506f portable: fix marker_matches_images() and propagate errors corre=
ctly
138467290f journald: replace existing syslog event source before reopening
626c57b9ba journald: pin the sending client's context across native message=
 dispatch
60cba9ebf8 portable: detect drop-in-only attachments
706c4491ce sbsign: write unaligned signature size into WIN_CERTIFICATE head=
er
775a9e171b pull: honor sync for OCI artifacts
8201bf6977 copy: keep replaced target after publish errors
675f4b0b06 mkosi: update fedora commit reference to 57cbcf979ce2dd872a871c5=
9e87d2c65dfa996e6
589ba40e97 mkosi: update fedora commit reference to 45c16dd369c961b70664e47=
3552def34d5469664
9e41763ec9 resolve: anchor the service browser from mDNS maintenance querie=
s
4744ed0712 network: implement refcounting for SR-IOV objects
0c65971685 udev: clear event back-pointer when freeing a worker
c6d35bf4cb sd-bus: drop half-registered vtable members on failure
4a895ab034 sd-bus: re-check match_callbacks_modified in the argNhas value l=
oop
c01e2dff1f sd-netlink: disconnect the slot on async/match error paths
9d9774050f network: initialize dot_servers before CLEANUP_ARRAY
16b5fcfa0d udev: track remaining buffer size across $links devlinks
10bc41033c sd-device: avoid 32-bit overflow in the monitor properties bound=
s check
99d7c6743a hashmap: honor the value destructor in set_ensure_consume()
5867697d6e sd-device: bound the tag filter BPF program size
0826a4a15d logind: drop the seat from the GC queue after draining its devic=
es
d65875951e logind: cancel long-press timers when the Button is freed
b6a6963e78 logind: don't free live SessionDevice on duplicate TakeDevice
40467642bd boot: require a minimum PE optional header size in verify_pe()
b16364d0df boot: restore parent loaded image when initrd registration fails
b2644bfe8f boot: restore RW/RO memory attributes on every error
23741dcd57 boot: check PE section against SizeOfImage
0f3dd7ab02 boot: bound PE section VirtualSize before zeroing the inner kern=
el
1dbedeef33 boot: reject inner kernel entry point outside the image
ec6c9360b7 boot: don't unquote an empty value in line_get_key_value()
3b32f046f0 boot: initialize return parameters on zero-length EFI variable r=
ead
e62dc3e2bf boot: make device_path_next_node() robust against malformed zero=
-length nodes
0b59b1bd1f test-socket-util: convert to new ASSERT macros
313edfcb48 meson: merge two libelf-related clfags dependencies
30d63ed089 meson: merge three glib cflags dependencies
8e34addf1a meson: do not pass space-separated list of libraries
ab892b3e1f meson: use tpm2_cflags dependency rather than tpm2
93f26c6c5d pull: introduce pull-forward.h
2a08e8cb08 sysinstall: Look for valid kernel image before installing
e233936dbc boot: reject GPT headers with SizeOfPartitionEntry below the min=
imum
8eb162df81 machined: drop superfluos 'supervisor' varlink input parameter f=
or register method
0cb4245755 calendarspec: warn on weekday/date conflict in systemd-analyze a=
nd systemd-run
387df32dc2 test: ignore fails when the formatted timezone differs from the =
current one
6fff312839 pcrextend,tpm2-util,tpm2-setup: gracefully skip NvPCR when TPM N=
V space is exhausted
4f5dcef65d bless-boot: avoid false maybe-uninitialized warning
a035cb3445 resolve: fix segfault when built with OPENSSL_NO_DEPRECATED_3_0
1f720ac2dd coredumpctl: use break instead of continue for time bound checks
f07d32db0f man: add thread-awareness note to sd_bus/sd_event manpages
c12e4a6e28 man: note that sd-tmpfiles/sysusers --root is not a sandboxing f=
eature
3e5fdf2835 vmspawn/nspawn: Always use a per-machine runtime subdirectory
924727469e meson: fix fs.exists() check for fuzz corpus samples
59e87bb61a compress: handle ZSTD_CONTENTSIZE_UNKNOWN when decompressing blo=
bs
97369d584a docs: Update memory pressure docs for latest GLib support for it
dc8ce44f48 test: suppress fails on the Africa/Tripoli (Libya) timezone
e61272caf1 ukify: show all sections and profiles in inspect JSON output
35178b46b7 test: add test case for show_menu()
f99cc27984 terminal-util: drop assert() on 'x'
8a6900b8fe terminal-util: make sure we never go below 10 characters line wi=
dth
380432f43a terminal-util: use LESS_BY() where appropriate
8f62acc860 terminal-util: calculate array index only once
c547cddab9 bpf-restrict-fs: use a 32-bit magic key on big-endian too
ce595a30c1 core/scope: don't assert when start is retried during cgroup cho=
wn
337cc13d8b core: donate the fdset to do_reexecute() to avoid a double free
a8d535fb55 run: refuse --no-block when combined with --scope
cfeae2790c shared/install: give the borrowed name back before bailing on er=
ror
7d0f473cb9 quotacheck: don't apply an invalid quotacheck.mode=3D value
c4fe868f7b core: avoid using uninitialized buffer on bad systemd.random_see=
d=3D
256465f3f7 tree-wide: fix return type of sysconf()
cce527de38 memory-util: don't use 'r' for non-int returns
c9248545a5 build(deps): bump the actions group with 6 updates
8d8f9c1e39 man: update description for sd_device_enumerator_add_match_subsy=
stem
9836c4ab8c test: reduce number of disks in TEST-64-UDEV-STORAGE-simultaneou=
s_events on Debian/Ubuntu
de01a0f78f sd-journal: rate-limit tail timestamp refresh during iteration
2db85c4e1c man: fix wrong KillUserProcesses=3D default in systemd-run(1)
114df0eeab ptyfwd: avoid touching forwarder after exit drain
3c06c9e4ad boot/random-seed: create \loader\ dir if missing when seeding
903f1d1dc6 env-util: ensure NUL termination of the replace_env_argv() outpu=
t array
9d3da650d0 fido2: reject zero-length HMAC secret
2674591913 ssl-util: set log level to debug in dlopen_many_sym_or_warn()
80f8a1124a resolvectl: fix JSON reply cleanup in varlink_dump_dns_configura=
tion
a22d428609 exec-invoke: fix wrong errno in log_error_errno for setenv failu=
re
b9ec917f14 crypto-util: set log level to debug in dlopen_many_sym_or_warn()
26916eda27 luo-util: use new LIVEUPDATE_SESSION_GET_NAME ioctl to get sessi=
on name if available
8b45e907e7 Import linux/liveupdate.h UAPI header from 7.2-rc1
d76499f0b4 portable: leave room for trailing NUL in metadata receive buffer
ae34b3441d man: document that $XDG_CONFIG_HOME affects environment.d lookup=
 path
14ec524c1f shared/varlink: fix license of varlink-io.systemd.Udev.c
eeb5862a0b test: drop ASAN workaround in TEST-07-PID1.issue-14566
cc0c446e10 test: use /run/ for temporary files in TEST-07-PID1.issue-14566
5827c35fd8 test: make TEST-07-PID1.issue-14566 more robust
5323aefd49 mkosi: fix license of mkosi.finalize
2bb7b1ae7c shell-completion: add missing commands and options to timedatect=
l zsh
1fc65de3b4 tmpfiles: fix device node major:minor logging to use i->major_mi=
nor
dd6c1c63de logind: fix typo in reboot-to-boot-loader-entry path
b8418ff33a journal-verify: fix offset reported for tail hash mismatch
38d246a627 tmpfiles: propagate clean_item_instance() error in clean_item()
df9ffa2309 Correct allocation size computation in xescape_full
71fc09c47e vmspawn: complain loudly if we can't prepare a unix socket for v=
irtiofsd
06f2b81cc9 mkosi: pull new split-out packages for deb/ubuntu
73b089c099 journal-importer: avoid false maybe-uninitialized warning
cc674bbeca test: relax grep for DNS query refusal
6a5feb213e sd-json: Fix validation of optional fields within a mandatory st=
ruct
1e133c189e man: fix first argument in Environment=3D expansion example
0f1a2cde63 mkosi: update debian commit reference to 8e947316488c163321665a6=
0766dbc972e9edf7a

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ..._261.1.bb =3D> systemd-boot-native_261.2.bb} |  0
 ...md-boot_261.1.bb =3D> systemd-boot_261.2.bb} |  0
 ...261.1.bb =3D> systemd-tools-native_261.2.bb} |  2 -
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 ...oot-from-filenames-when-generating-h.patch | 40 ----------------
 ...FI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch | 47 -------------------
 .../{systemd_261.1.bb =3D> systemd_261.2.bb}    |  1 -
 7 files changed, 1 insertion(+), 91 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_261.1.bb =3D> system=
d-boot-native_261.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_261.1.bb =3D> systemd-boot_=
261.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-tools-native_261.1.bb =3D> syste=
md-tools-native_261.2.bb} (95%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-r=
oot-from-filenames-when-generating-h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0005-boot-downgrade-E=
FI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
 rename meta/recipes-core/systemd/{systemd_261.1.bb =3D> systemd_261.2.bb} =
(99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_261.1.bb b/meta/=
recipes-core/systemd/systemd-boot-native_261.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_261.1.bb
rename to meta/recipes-core/systemd/systemd-boot-native_261.2.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_261.1.bb b/meta/recipes=
-core/systemd/systemd-boot_261.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_261.1.bb
rename to meta/recipes-core/systemd/systemd-boot_261.2.bb
diff --git a/meta/recipes-core/systemd/systemd-tools-native_261.1.bb b/meta=
/recipes-core/systemd/systemd-tools-native_261.2.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd-tools-native_261.1.bb
rename to meta/recipes-core/systemd/systemd-tools-native_261.2.bb
index d13d2f2cad..bffaf5a2f0 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_261.1.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_261.2.bb
@@ -4,8 +4,6 @@ require systemd.inc
=20
 SUMMARY =3D "native tools from systemd"
=20
-SRC_URI +=3D "file://0001-hwdb-strip-the-root-from-filenames-when-generati=
ng-h.patch"
-
 # TODO: Remove STATX_MNT_ID patch once minimum supported build host kernel=
 is >=3D 5.8 (RHEL 8 EOL: 2029)
 SRC_URI +=3D "file://Handle-missing-STATX_MNT_ID-on-older-kernels.patch"
=20
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index 0348f9f08d..70c5ac758d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3Dc09786363500a9acc29b147e6e=
72d2c6 \
                     file://LICENSE.LGPL2.1;md5=3Dbe0aaf4a380f73f7e00b420a0=
07368f2"
=20
-SRCREV =3D "eff9446d505d62c075bed37d606860b38cfe51fb"
+SRCREV =3D "4925d9f07fc697efccd98a93046ff535b8832445"
 SRCBRANCH =3D "v261-stable"
 SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH};tag=3Dv${PV}"
=20
diff --git a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-fro=
m-filenames-when-generating-h.patch b/meta/recipes-core/systemd/systemd/000=
1-hwdb-strip-the-root-from-filenames-when-generating-h.patch
deleted file mode 100644
index f11199c553..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-hwdb-strip-the-root-from-filen=
ames-when-generating-h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0031715c560e8138cc320f017a0a2c7160b1f7fe Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 17 Jul 2026 17:25:31 +0100
-Subject: [PATCH] hwdb: strip the root from filenames when generating hwdb.=
bin
-
-The modern hwdb.bin format contains the filenames of the input data that
-makes up the database.  This is useful but in offline builds where
---root is used, the filenames are the full build paths including the
-specified root.  This introduces build paths and thus information
-leakage and non-reproducible data.
-
-Solve this by stripping the root prefix off the original path when
-passing to import_file.
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/pull/43062]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/shared/hwdb-util.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/shared/hwdb-util.c b/src/shared/hwdb-util.c
-index b42681a289..5386b4e9f4 100644
---- a/src/shared/hwdb-util.c
-+++ b/src/shared/hwdb-util.c
-@@ -632,9 +632,11 @@ int hwdb_update(const char *root, const char *hwdb_bi=
n_dir, bool strict, bool co
-=20
-         FOREACH_ARRAY(i, files, n_files) {
-                 ConfFile *c =3D *i;
-+                char *path_in_root;
-=20
-                 log_debug("Reading file \"%s\" -> \"%s\"", c->original_pa=
th, c->resolved_path);
--                RET_GATHER(ret, import_file(trie, c->fd, c->original_path=
, file_priority++, compat));
-+                path_in_root =3D path_startswith_full(c->original_path, e=
mpty_to_root(root), PATH_STARTSWITH_RETURN_LEADING_SLASH);
-+                RET_GATHER(ret, import_file(trie, c->fd, path_in_root, fi=
le_priority++, compat));
-         }
-=20
-         strbuf_complete(trie->strings);
---=20
-2.43.0
-
diff --git a/meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMO=
RY_ATTRIBUTE_PROTOCOL-warning.patch b/meta/recipes-core/systemd/systemd/000=
5-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warning.patch
deleted file mode 100644
index 7db73571cd..0000000000
--- a/meta/recipes-core/systemd/systemd/0005-boot-downgrade-EFI_MEMORY_ATTR=
IBUTE_PROTOCOL-warning.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 829c2f0e3dffe8b4484e730a3f3058b61e2133ad Mon Sep 17 00:00:00 2001
-From: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
-Date: Tue, 14 Jul 2026 11:37:14 +0530
-Subject: [PATCH] boot: downgrade EFI_MEMORY_ATTRIBUTE_PROTOCOL warning
-
-U-Boot currently does not implement EFI_MEMORY_ATTRIBUTE_PROTOCOL
-even when reporting EFI version >=3D 2.10. Consequently, systemd-boot
-emits a warning on every boot when running on U-Boot firmware.
-
-The absence of EFI_MEMORY_ATTRIBUTE_PROTOCOL is a current
-U-Boot limitation and not a condition users can remedy.
-Furthermore, the EFI specification does not require all
-firmware advertising EFI 2.10 or newer to implement the
-protocol. As a result, the warning provides little value on
-U-Boot systems while causing log_wait() to impose a 2.5-second
-boot delay.
-
-Downgrade the message to LOG_DEBUG, this keeps the diagnostic
-available for debugging purposes without penalizing normal
-boot time.
-
-Upstream-Status: Backport [ https://github.com/systemd/systemd/pull/43017 =
]
-
-Signed-off-by: Aswin Murugan <aswin.murugan@oss.qualcomm.com>
----
- src/boot/linux.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/boot/linux.c b/src/boot/linux.c
-index 67ed859993..09fb63419d 100644
---- a/src/boot/linux.c
-+++ b/src/boot/linux.c
-@@ -267,10 +267,7 @@ EFI_STATUS linux_exec(
-                  * if required for NX_COMPAT */
-                 err =3D BS->LocateProtocol(MAKE_GUID_PTR(EFI_MEMORY_ATTRI=
BUTE_PROTOCOL), /* Registration=3D */ NULL, (void **) &memory_proto);
-                 if (err !=3D EFI_SUCCESS)
--                        /* Only warn if the UEFI should have support in t=
he first place (version >=3D 2.10) */
--                        log_full(err,
--                                 ST->Hdr.Revision >=3D ((2U << 16) | 100U=
) ? LOG_WARNING : LOG_DEBUG,
--                                 "No EFI_MEMORY_ATTRIBUTE_PROTOCOL found,=
 skipping NX_COMPAT support.");
-+                        log_debug_status(err, "No EFI_MEMORY_ATTRIBUTE_PR=
OTOCOL found, skipping NX_COMPAT support.");
-         }
-=20
-         const PeSectionHeader *headers;
---=20
-2.34.1
-
diff --git a/meta/recipes-core/systemd/systemd_261.1.bb b/meta/recipes-core=
/systemd/systemd_261.2.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_261.1.bb
rename to meta/recipes-core/systemd/systemd_261.2.bb
index 575717bb89..b295a69548 100644
--- a/meta/recipes-core/systemd/systemd_261.1.bb
+++ b/meta/recipes-core/systemd/systemd_261.2.bb
@@ -36,7 +36,6 @@ SRC_URI +=3D " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-ti=
m.patch \
            file://0003-Do-not-create-var-log-README.patch \
-           file://0005-boot-downgrade-EFI_MEMORY_ATTRIBUTE_PROTOCOL-warnin=
g.patch \
            "
=20
 PAM_PLUGINS =3D " \

