Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.32999.1585212888780277765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aImufrDa;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id c187so5575590wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ptE8GKjcISqSHXSuxhMuUGaEt5laJZUcMNJStXFb6g=;
        b=aImufrDaw/vi5xqGR63k0bV+wCb832zKh6P3KPYgmPClQKHiKaJ9j5b6ccZAjTh1ry
         0aoXma2pFCvzRI8ei0jD+fSJxV7TceVpWBL4i3sVr8HVhnce6xUiLLuUAAiermI2DlCM
         MlJiFxi+fIxQbVw2jfzaCcPQB9/6uitO3pGVoHNeHDo2jATiZCCp93rb5+VlE7NU66vK
         bnKwG6u0M357tg7n3Z4w9D7hwaaP2KatronFe6zXpZ6J4U3+/EfFLj8vAdOz+qQ43zhk
         /M4VuzIL0NKlAWucwKi1vpTa05HpsdAIJO+jyGWsKHFJ4a2XyJGLCm3Rx1piDb/oxtl7
         nd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ptE8GKjcISqSHXSuxhMuUGaEt5laJZUcMNJStXFb6g=;
        b=NU08yaXtp9AfaResk1KR5/THY/kdsmSXr9SqhdwNKzA7e3fZBBBSZ+WumMqi2ghUNE
         ek0T64UxrOthYp5gn6ZK9w2rFDBDfKQDudxJZ026T9vrbU7ZOhtE4K8QGTZydRmeqRB/
         0aEvLKQFUlFBM+NUxhySu9iaWNjuO/OMa7SXkLFusjuuslD+lKlr15QryFqLbuUlHe6V
         MdUMBVak0VzviGWs712rbcImeu+xKMw/i3bD/tRzyZUDykF0J9b3npZp8PYOzUb+7M+t
         J5rm6dmOcpg0+g5GZlu6s8ING5fxw10dxe0lwy3OxHD1FyaTWz0bchtyAyLhiNi+cEgI
         NmPA==
X-Gm-Message-State: ANhLgQ15M089H3ZLEiMG//bZqdINXX06ThHps2NoPsm3SPfo/2DM8cne
	P6y82MF8Axu1cWaLOLYIN7NT8L9y
X-Google-Smtp-Source: ADFU+vu0mEiDRsDwKw7nJ6Qhm2WenhFQtlL1U4MWLmYSOLlgvAelk5n58VPB9OSmxIngjMdREdGkwA==
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr1990890wml.172.1585212883676;
        Thu, 26 Mar 2020 01:54:43 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:42 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 13/13] systemd: upgrade v244.3 -> v245.2
Date: Thu, 26 Mar 2020 08:54:26 +0000
Message-Id: <20200326085426.117209-14-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refresh patches for v245, enable userdb by default. Update musl patches
for additional missing stdlib headers. Add musl patch to avoid gshadow.

Commits:

  d1d3f2aa1561 docs: Add syntax for templated units to systemd.preset man page
  3c69813c69af man: add a tiny bit of markup
  bf595e788c56 home: fix segfault when parsing arguments in PAM module
  e110f4dacb6d test: wait a bit after starting the test service
  e8df08cfdb20 fix journalctl regression (#15099)
  eb3a38cc23b2 NEWS: add late note about job trimming issue
  405f0fcfddb2 systemctl: hide the 'glyph' column when --no-legend is requested
  1c7de81f89ef format-table: allow hiding a specific column
  b7f2308bda49 core: transition to FINAL_SIGTERM state after ExecStopPost=
  2867dfbf70a5 journalctl: show duplicate entries if they are from the same file (#14898)
  af339a3122be namespace: ignore prefix chars when comparing paths
  d58988be7fab udev: fix SECLABEL{selinux} issue (#15064)
  98f8a718c161 dissect-image: avoid scanning partitions
  35c4d42040ec test: ignore IAB capabilities in `test-execute`
  40737329d960 test: add a test case for migrating DynamicUser=yes to no
  705938529062 execute: Fix migration from DynamicUser=yes to no
  ec458d20b268 homed: replace "home directory" with "home area" in a few places
  20a7592edf5f shared/ask-password-api: do not show hint on echo
  084df9c616fd analyze: fix table time output
  9251cac7b296 Support compiling with clang and gnu11 standard
  ffccc15f725f Typo fix
  1777c7f70d4d Update Croatian translation (#15042)
  73678d230704 boot: Ensure ARM UEFI binary does not contain FP/SIMD instructions
  b7cf4b4ef5d0 core: Fix resolution of nested DM devices for cgroups
  57680ddd4035 Fix typo on initrd-root-device.target
  03985d069b52 NEWS: final contributor update for v245
  0d5aef3eb513 hwdb: update for v245
  9cbf1e58f962 units: skip modprobe@.service if the unit appears to be already loaded
  ff12a7954c19 treewide: more portable bash shebangs
  eda0cbf07186 Use Finished instead of Started for Type=oneshot services (#14851)
  d48eea583fd8 units: make systemd-network-generator.service stay around
  94c3a838da69 systemctl: make list-dependencies take multiple arguments
  82c8bdff122d man: mention networkctl in the networkd man page
  4a29c185b7fe man: add systemd-network-generator.service(8)
  9fd32ff7d363 units: restore RemainAfterExit=yes in systemd-vconsole-setup.service
  44e5d00603a8 pid1: remove unnecessary terminator
  5403e153372e man: update list of supported controllers
  a3558e795203 units: do not ignore return value from systemd --user
  df883de98a88 pid1, nspawn: voidify loopback_setup()
  fd74a13e85ac timesync, meson: allow statically linked build
  dbf2801f5ac4 systemctl: do not print items twice in list-dependencies
  dd0395b5654c make namespace_flags_to_string() not return empty string
  e31b6bd02050 lgtm: drop the TMPDIR/meson workaround
  d4de2b2afff6 man: document that .link/.network/.netdev files have the usual ini syntax
  870d38dca90b docs: add .link/.network/.netdev files to interface stability chart
  c7fe06fb0a00 man: document the default value for IPv6AcceptRA=
  cd517eb7310d man: specify that Domains= is a space-separated list
  1699f5378896 hwdb: add corrections for Olimex Teres-I to keyboard hwdb
  105a1a36cd6e tree-wide: fix spelling of lookup and setup verbs
  33eb1f24978c tree-wide: drop printk.devkmsg=on setting in various places
  a345d5c1c9b2 man,mkosi: use glibc-minimal-langpack for Fedora
  95d311faea78 man: bump fedora versions
  1c5b427f5d36 hwdb: 60-sensor.hwdb: Add proximity sensor udev property (#14845)
  fdb0405edd90 selinux: check return value of string_to_security_class()
  81d4a026a61c drop unused translations
  d015652944b5 update Russian translation
  1fb5a5edc7c1 sysusers: do not require /proc to be mounted
  a100fe3c279b NEWS: Use correct tense in v245 entry
  6cb356ca9fe0 basic/fs-util: add a version of chmod_and_chown that doesn not use  /proc
  08c7c3216bd5 sysusers: many different errnos to express one condition
  d54bb638750c NEWS: two minor entries
  9c4d3d796825 NEWS: update contributors list
  8193040362e8 hwdb: update for v245-rc2
  a75b21175078 network: Move config_parse_ip_service_type to networkd-dhcp4.c and rename
  2b43402c8477 ask-password-api: drop unneeded parentheses
  86fca584c38f core/execute: use return value from sockaddr_un_set_path(), remove duplicate check
  425d925f24a6 homed,userdb: don't use sockaddr_un_set_path() on fixed addresses
  f36a9d590901 tree-wide: use the return value from sockaddr_un_set_path()
  0f1886872362 test-sizeof: print size socklen_t
  64177e9e4e8b journald: fix forwarding to syslog
  3b355677b8cc RequireMountsFor in systemd-nspawn should wait for machine mount
  27f31daf3e22 shared/logs-show: Remove unused OUTPUT_FOLLOW
  ef62949a23a2 network: make Type=ether match based on iftype
  834ea1a4665f test-network: remove unnecessary dummy interface
  2cd651066133 man: fix typo
  f4665664c4ff units: disable ProtectKernelLogs for machined
  123aeae20672 random-seed: add missing header for GRND_NONBLOCK (#14988)
  8632e8768903 po: update Polish translation
  4347f0abe261 l10n: update Czech Translation
  4c2e1833ec1a test-network: add a test case for [DHCPv4] UseRoutes=no
  ad098b14c5ec network: Allow to configure GW even UseRoutes=false
  161bc525bbd7 rules.d: import the keyboard builtin instead of running it
  df70539f9fe0 resolve: error handling improvements
  6f22d5723527 userdb: fix lookup of groups defined by homed
  3e93027b5b94 Fix two typos
  972e81629d40 Italian: removed spurious lines of old labels
  f7ae155b14dc italian: language updates
  0d066dd1a4cd pid1: add new mode systemd.show-status=error and use it when 'quiet' is passed
  5bcf34ebf303 pid1: when showing error status, do not switch to status=temporary
  1b4154a8919c pid1: make cylon timeout significantly bigger when not showing any messages
  ef15d3e1ab67 pid1: touch the /run/systemd/show-status just once
  7365a2967031 pid1: when printing status message status, give reason
  5ca02bfc3968 core: fix message about show status state
  b3ce4e2d407a hwdb: Add Medion Akoya E1239T MD60568 to 60-sensor.hwdb
  196dedd50300 journalctl: implement --facility=foo
  c4ad7f83ec60 homed: fix typo
  aeac9dd6475d Revert "namespace: fix MAC labels of /dev when PrivateDevices=yes"
  ee00d1e95e84 pid1: do not fail if we get EPERM while setting up network name
  ecf63c91025b execute: Make '+' exec prefix ignore PrivateTmp=yes
  5926ea0a6860 presets: enable systemd-pstore.service by default
  aa07dc709328 man: add .service suffix to systemd-pstore(8)
  e3b192626e24 man: tweak markup in systemd-pstore.service(8)
  ebb7a2fcb979 man: add missing refnames for two binary names
  b0cda2414802 docs: interlink the docs to make it easier to navigate
  04c31af4c5cb docs: say XBOOTLDR instead of just giving the GPT identifier
  6ffeca8c8f2e meson: explain GIT_VERSION and PROJECT_VERSION
  62641751d529 man: fix links to ssh(1) and sshd(8)
  3ea2b1137b6a man: add explanation where environment.d are inherited
  8956caf333ff network: fix typo in comment
  e6e81ec0a568 namespace: fix MAC labels of /dev when PrivateDevices=yes
  07336a067216 network: assume Scope=host when Address= is loopback address
  aa73f181e92c basic/string-table: avoid crash when table is sparse
  1a8f0ce64fd2 systemctl: be more specific when emitting warning about rotated journal
  68c1ac156891 conf-parser: fix line number in error message
  79ac19ae616a hwdb: add cube i7
  df5a4889fe85 udevadm: show more error message during exporting database
  287f506c32f3 pstore: Don't start systemd-pstore.service in containers
  81eb5bc5cc7e network: remove redundant %m in error message
  3d7ac1c655ec udev-builtin-input_id: any i2c mouse is a pointing stick
  443876d8dcf3 userdb: make groupdb_all() always set iterator when it returns >= 0
  0ffbe10b8159 userdb: drop unnecessary goto
  e9b0b64f77fd fix ACCEL_MOUNT_MATRIX for Thinkpad Yoga 11e 3rd gen
  19bb96759a91 userdb: allow dots in username
  2a5180945a10 hwdb: Fix rotation for Nuvision Encite Split 11
  9c1f969d40f8 swap: finish the secondary swap units' jobs if deactivation of the primary swap unit fails
  06654d122515 ata_id: Add support for host managed zone block devices (#14933)
  aaaf42cb44d4 units: add mount for tracefs
  6dea2361dc2f typo: stringy -> string
  6ed8c09a40ed po: update Japanese translation of "home area"
  e60228bf6842 kernel-install: strip BOOT_IMAGE= from kernel options
  7c7c44855e2e userdb: fix memleak
  662d74daf7c9 userdb: make userdb_all() always set iterator when it returns >= 0
  4617d37a375c po: fix confusion about what "it" is in Polish translation
  09460a234bed tree-wide: replace "asked to inhibit it" with "is inhibiting this"
  15f73764c4fb tree-wide: replace present participle forms
  40afe4916a58 test-network: add one more test case for VRF=
  a856a83f181a po: update Polish translation of "home area"
  18143cd76795 tree-wide: s/home/home area/g
  c0d48bc50ff4 network: use VRF's route table if VRF= is set
  1ad448673ed3 man/systemd.unit: Add missing article to `Wants=` description
  4a6ab3f79fb3 hwdb.d: actually install the 60-input-id.hwdb
  31c33315b3e9 portablectl: block when stopping a unit on detach (--now)
  d4ffda38716d man: tmpfiles.d: z/Z ignore the argument
  c667e09ba067 ci: pass max_total_time to libFuzzer
  6cec69fc3edd Change all fuzzing links to point to OSS-Fuzz site
  129c55c06f49 docs: fix HACKING.md broken links
  c14faa944015 fixed typo in systemd.netdev Documentation for L2TP
  ad5555b42e9f systemd: Fix busctl crash on aarch64 when setting output table format
  bec31cf5f003 systemd: Fix busctl crash on aarch64 when setting output table format
  c315b79fb43a makefs: strdup arguments to mkfs
  7ad1f0439843 lgtm: use the system version of meson
  65be7042a876 lgtm: set TMPDIR to /var/tmp
  99fdffaa194c Revert "Support Plugable UD-PRO8 dock"
  d900701eeab4 fix typo in object field
  c24c83dc67a6 network: Allow multiple IPv6Token 'static' items to generate addresses
  38d1255a52f7 test-network: add tests for qdisc Handle=
  d8b2396d3458 network: add support for qdisc handle
  bfcdc872604a network: fix indentation
  8a98f11ed0cd network: Make address_hash_ops available outside of networkd-address.c
  0ddad04eda2a network: Document the lack of actual DAD usage in prefixstable algorithm
  8dcce054e396 network: Rewrite IPv6Token documentation for new modes
  53f8cced4570 network: Correct typo and naming in error message
  87f9d6ea8efa network: Improve variable name for address generation
  f7ada4b8ec12 test-network: tentatively stops .socket units for udevd
  b241fa00e92e network: Add test for explicit 'static' IPv6Token
  b751c3e747a9 network fix parser for IPv6Token=
  5f04f4e47037 test: give systemd chance to actually start the unit
  e2c1ddcc492f portablectl: add --now and --enable to attach/detach
  68697cdd1274 hwdb: Fix touchpad toggle on WeiHeng P325J
  74deaff1188a journal: fix log message
  03b76a197731 repart: do not quit earlier when --empty=force
  676047438a12 l10n: update Ukrainian translation
  3d55b5a9def5 test-network: add test for teql
  9b749c11e20b network: tc: support teql
  ab9dc1db477e test-network: add more tests for traffic control
  f0c1ad308d0d network: fix ABRT
  59bae425704f network: update log message
  ab119e633878 network: append period if error message provided by kernel does not contain it
  4c2724013ffa network: drop redundant %m
  2ed5f6d5de38 network: introduce new [QDisc] section to support Parent=ingress
  72545ae05745 core: sync SeccompParseFlags between dbus-execute and load-fragment
  e2c4070edfb0 network: rename eui64 to static
  6e55b9b75839 chromiumos: sync auto suspend rules with chromeos commit e348a229bacc3
  cff789b746c6 core/selinux-access: use _cleanup_ and improve logging
  0ae5ffe0630a repart: quit earlier if no .conf file exists
  d7887449e7c9 basic/selinux-util: expose _cleanup_freecon_
  22cd7aabecd8 core/selinux-access: do not use NULL for %s
  949fb07e6e3e network: also change fair_queue_traffic_policing→fair_queueing
  2b6a90d17f4c selinux: update log message to suppress warning by coverity
  db99904bc848 sysctl: fix segfault
  8aaf18e08a2e shared/ask-password-api: show "(press TAB for no echo)"
  72c08a471c9c shared/ask-password-api: return "error" when dialogue is cancelled
  1acf344dfa28 core: do not prepare a SELinux context for dummy files for devicenode bind-mounting
  39e96f844a46 firstboot: add missing check
  d5d5b3f4a729 man: fix typo in systemd.unit man page
  6b2fd86fd1fd network: remove unnecessary link->ifname from debug log statements
  28ca867abdb2 sd-journal: close journal files that were deleted by journald before we've setup inotify watch
  c7220ca8025e units: drop OnFailure= from .target units
  e0e2112f6184 cgroup: systemctl: Don't display NULL if protection was set to max
  8b51950f4cd2 docs: Correct resource weight range
  129466138124 polkit: remove unused variable
  c450335bf74a github: remove direct paypal link
  384db814eea1 meson: bump version numbers for v245
  901d1ce8efcd NEWS: add contributors for v245
  573e58f62f27 NEWS: mention the operational state changes
  f05c0615f4c0 NEWS: mention SuppressPrefixLength=
  9569e385036c test: adapt to the new capsh format
  87bbebeab6e2 test-network: add tests for IPv6Token=
  5f506a55606f network: Allow to specify multiple IPv6Token for SLAAC
  69f173477bb1 NEWS: mention the TrafficControlQueueingDiscipline rename
  823b03527106 NEWS: mention empty .link and .network files
  2ad988896c47 NEWS: reword and shorten a bunch of stuff
  641aa41200f7 test-network: use udevd in build directory
  ea9bc14cd0a3 hwdb: update for v245-rc1
  427928caa4c0 network: change "Gateway=dhcp" to "Gateway=_dhcp" (#14774)
  c0f765cac8b0 core: move bus-util include out of selinux-access header
  bc130b685832 Fix typo in function name
  5c1163273569 man: document the new sd_bus_enqueue_for_read() API call
  637486261528 polkit: when authorizing via PK let's re-resolve callback/userdata instead of caching it
  1068447e6954 sd-bus: introduce API for re-enqueuing incoming messages
  f4425c72c739 polkit: use structured initialization
  7f5698228927 polkit: on async pk requests, re-validate action/details
  95f82ae9d774 polkit: reuse some common bus message appending code
  773b1a7916bf bus-polkit: rename return error parameter to ret_error
  f156e60c66fa core: unit_label_path(): take const unit
  6bdd90fbcd94 man: add "quick-help" to sysusers.d synopsis
  1648233dce34 selinux-access: log warning on context acquisition failure
  074b597dd904 selinux-util: increase log severity
  ca58d00c68bc network: FairQueueTrafficPolicing→FairQueueing
  60ed2dcfc7ea network: TokenBufferFilter→TokenBucketFilter
  8e92d92fb898 man: tweak description of blockdev@.target
  eb1322744dea NEWS: correct indenting for two entries
  ce4121c6ff92 meson: update efi path detection to gnu-efi-3.0.11
  18de0969c576 network: split TrafficControlQueueingDiscipline section into small pieces
  dade73491747 network,udev: refuse .link and .network settings with no matches
  e519e20ae16e test-network: do not fail if lo has a .network file
  90198bcbea92 Fix generator name in hibernate-resume-generator's drop-in
  61c3e2c8bfc2 presets: "disable" all passive targets by default
  41fd8fe71652 test-network: add a test case for IPv6PrefixDelegation.DNS=linklocal
  fd3ef936ed5b network,radv: make DNS= in [IPv6PrefixDelegation] section take special value 'linklocal'
  5d4fc0e665a3 sysctl: set ipv4 settings in a race-free way
  e0f424790d3d sysctl: add glob syntax to sysctl.d files
  5e9c08f377a6 l10n: update Czech Translation
  50152bb1c5c3 core: call dynamic_user_acquire() only when 'group' is non-null
  4c1dea42b593 journal: drop unreachable path
  e362d6eebadc po: update French translation
  bf2334c054da udev: add {Receive,Transmit}ChecksumOffload= settings
  53e1ba280f07 network: add SuppressPrefixLength option to RoutingPolicyRule (#14736)
  e06d7d0fb0f1 po: update Japanese translation
  10f58ad01534 po: update Polish translation
  9a4940bf92c9 update NEWS
  60d0a5098b2b util: uid_t, gid_t, and pid_t must be 32bit
  c757517d98ad meson: fix feature list
  649916d3561a sysusers: support creating users with a specific primary group
  6be8e78e32ec test-network: add test for UID based routing policy
  ea471a469572 network: support UID based routing policy
  03de302a3132 util: add parse_uid_range() helper function
  af06ddf51a8a meson, man: do not install pam_systemd_home(8) when pam or homed is disabled
  2273ecfeda0b test: don't install /etc/securetty
  020313b213f0 test: also check the result of merge_gid_lists()
  4af8ab2cab69 user-util: fix use after free() on error path
  b44b735a78be userdbd: fix memleak
  ad2378524635 update TODO
  2b6b8bd3f727 man: document --namespace= switch of journalctl
  241c8f67f65a man: document the new sd_journal_open_namespace() API
  5b0a76d107eb man: document LogNamespace= unit setting
  7d8155b3df13 man: document new _NAMESPACE= journal field
  6bc4361997b1 man: document journald@NAMESPACE.conf
  efcbcd0d043f man: document journald namespaces
  23d8c56046f1 journalctl: underline sections in --help
  9610210d3235 nspawn: voidify umount_verbose()
  02cec1562962 user-record-util: add missing error check
  00c7b071acce homework: fix errno in log_error_errno()
  852640f8a223 home: add missing variable initialization
  340cb115b388 units: define RuntimeDirectory= in systemd-journald.service
  5591cd4e2041 units: sort settings in systemd-journald.service again
  fb38a7beb815 tmpfiles: apply ACLs to top-level journal directory in /run, too
  0f5a4f9cd969 tmpfiles: merge lines for the same inodes
  db23d83bd49b test: add simple test for log namespaces
  dc5437c78bbf journald: add ability to activate by varlink socket
  65c398c031a3 journald: add exit on idle
  6d4d6002606e varlink: add ability to register callback for disconnections
  c4f601f20535 varlink: add API for determining number of current connections
  d98580e4380e journald: use structured initialization
  243526917131 journald: add logging for one error we lacked logging for
  d93dda3afef4 systemctl: show logs for correct namespace of service
  21fa231ece5e journalctl: drop misplaced empty line
  6b25db87a180 journalctl: add new --namespace= switch for showing logs for namespace
  31e99dd2cc37 journal: make constant argument actually 'const'
  456aa8790625 journal: allow opening journal files specific to some namespace
  2f5435a14757 journal: use structured initialization
  33ff74643e2a journalctl: use an anonymous array when an array is needed
  68312977db5e journal: properly mark two definitions that are deprecated with GCC attributes for that
  e7238caf0cf5 journalctl: use automatic memory cleanup
  0491150b5cb4 journalctl: use log_error_errno() wherever we can
  a6214d9643c1 journalctl: move pcre function code down
  91dd5f7cbe6f core: add new LogNamespace= execution setting
  839d1b201474 string-util: add brief explanatory comment
  1ee51fbd7075 units: add unit files for instantiated journal daemons
  b1852c48c127 journald: allow running multiple instances of journald
  d6f46470f562 journald: when create journal directories use calculated paths
  4f6031037363 journald: minor coding style updates
  4e00337b1621 journald: let's simplify rotating of offline user journals
  46e2348a586b journald: simplify find_journal() a bit
  b42b9479a8e2 journald: hide current storage determination in helper call
  74dd8f575932 journald: use structured initialization
  8548f4f09ba6 journald: line break overly long function header
  7e7ef3bfb283 journald: let's use TAKE_PTR() and TAKE_FD() where appropriate
  a30e35f85aa9 journald: let's use unlink_and_free() where we can
  2066f4fe30f5 journald: specifying _pure_ on static functions is unnecessary, compiler can figure that out on its own
  a2735a4549e8 journald: don't bother with seqnum file if we don't read form /dev/kmsg anyway
  dbac26257881 journald: fix indentation
  99d0d05a10e4 journald: use free_and_replace() where appropriate
  659a77bec6d5 journald: add missing logging for some errors
  d83f7e4c9218 journald: why bitwise XOR when boolean != is easier to read?
  9a1862bfa6cd tests: unset LD_PRELOAD in testsuite.service when it's run under ASan
  efda8aebcb0e sd-boot: fix -Wpointer-sign warning
  a614aa1985d6 sd-boot: fix warning about comparison is always true
  2d37ea5ca901 man: do not install man pages for systemd-repart if it is disabled
  3ae01632f2d0 dhcp6: coding style fixes
  9de8a4259eae dhcp6: do not use T1 and T2 longer than one provided by the lease
  faec9de87f1a docs: Fix example code in ROOT_STORAGE_DAEMONS
  58345a2332f3 docs: formatting fix (#14707)
  258adeca3c32 po: add src/home/org.freedesktop.home1.policy to POTFILES.in
  56b3eddb7043 fix links to GROUP_RECORD and USER_GROUP_API
  e5e529c30ad5 fix link to JSON User Records
  f770b7e084d6 man: document man/sd_bus_message_dump.xml
  2a4be3c52b98 Various typo fixes and grammar corrections
  402058dc3a2c polkit: tweak grammar
  ec74f47e5617 meson: fix type of homed option
  02d89f9a623a man: add syntax quickhelp to sysctl.d(5)
  def94437934b Revert "sysctl: always write net.ipv4.conf.all.xyz= in addition to net.ipv4.conf.default.xyz="
  fa2111bd3ed2 man: document logging downgrade in systemctl
  f3b136a4847a shared/sysctl-util: normalize repeated slashes or dots to a single value
  ce306dd872af po: update Polish translation
  70e9d9a56c7a update TODO
  ed2d9661521c update TODO
  8d251485fa53 core: fsck images specified as RootImage= too before using them
  4fcb96ce253f nspawn: fsck all images when mounting things
  e475f72977ba dissect: add --fsck= option to systemd-dissect tool
  cf32c4865761 dissect: optionally, run fsck before mounting dissected images
  0f7c9a3d81be dissect: complain if partition flags are set that we don't know
  a44956c94a93 network: fix implicit type conversion warning by GCC-10
  97cd52c1b54b update TODO
  d200253ba5f6 update TODO
  e21d90606afc pam_systemd: resolve the tty of display via /sys instead of /dev
  72d43d09ccb5 id128: change table header from "uuid" to just "id"
  68410195679e NEWS: more v245 preparation
  552cafaa86ad po: update French translation
  723822f00ae3 NEWS: start preparing v245
  bcb1eadc0cf8 test: fix rename_noreplace() test
  3c7b4ebf94d1 test: make sure chase_symlink() returns normalized paths
  47d7ab727cf5 fs-util: make sure we output normalized paths in chase_symlinks()
  6efb1257d10c test: add test for the non-resolving of chase_symlink() root prefix
  c2595d3b0284 fs-util: when calling chase_symlinks() with root path, leave root part unresolved
  c809ed783e6c update TODO
  0edd431e1549 ci: add new dependencies to CI
  a9dabd6866d8 docs: document the home directory format
  f62dd2375e51 docs: document homed UID range
  28e208a7d8bb man: document pam_systemd_home
  38e7b808eb0f man: add systemd-homed man page
  ea7a19e95db9 man: add homectl(1) man page
  ba0fb5acd46e sleep: automatically lock all home directories when suspending
  6ead39170aea test: add test case for homed
  26cf9fb7f833 home: add pam_systemd_home.so PAM hookup
  4aa0a8ac3e54 home: add homectl client tool
  70a5db5822c8 home: add new systemd-homed service that can manage LUKS homes
  e53db1405c5d mkosi: add fdisk-devel, openssl-devel, libpwquality-devel, p11kit-devel and efsck to build
  1ffadeaae32d udev: assume that the recv buffer size of the netlink socket is already configured when the socket is passed in
  a05a6e8bba7e test-network: fix test_qdisc2()
  8bc943b47256 fix erroneous "`" in boot loader spec
  e0db55a643f2 man: document that sd_bus_message_read_array() only supports trivial types
  10c238b2cc4a man: clarify that we decode D-Bus bools as "int", not as C99 "bool"
  e5667705faa8 man: describe types slightly more accurately
  979bdc47c9cd man: enclose C type names in <type></type>
  1b3cccfdacc7 unit: add AF_ALG to systemd-networkd.service
  11a182aa1e64 test: drop sector-size line from output of sfdisk
  37b9966e2525 test: Synchronize journal before reading from it
  006c44c1e86f TODO: add various items as result from devconf.cz 2020 discussions
  58abbbcc6bce sd-bus: fix introspection bug in signal parameter names
  022d334561ab man: doc: Document ProtectClock=
  732e3a61043b network: accept NUL character in SendOption=
  a6a36dea2d40 test: add tests for UNESCAPE_ACCEPT_NUL
  0e72e469f88c escape: introduce UNESCAPE_ACCEPT_NUL flag
  46dc83440fc6 escape: make cunescape() and cunescape_length() inline
  8bdda551dab5 efi: fix build.
  9f37272a192e analyze: Add ProtectClock= to analyze-security
  fc64760dda4d core: shared: Add ProtectClock= to systemd.exec
  0de6103dffed man: tmpfiles.d: list missing q
  576e50efb694 Update copyright notice
  fe5a698f7646 bootspec: parse random-seed-mode line in loader.conf
  a14c18ba7b4e sd-boot: fix typo
  a3e42c468fc1 test: unpin meson from v0.52.1
  da2076a159ba man: remove duplicate in list of variables ignored by Anonymize
  2b4a65b66813 sd-bus: export sd_bus_message_dump
  27cf4c18c76d sd-bus: make dump flags public
  dc972b074071 systemd-id128: add new verb to print GPT partitions UUIDs
  e1d32d6ee86a update TODO
  19ce38ce620f shared/gpt: export gpt_partition_type_uuid_{to,from}_string functions
  6252bd0e8442 update TODO
  4acf0cfd2f92 logind: check PolicyKit before allowing VT switch
  269e4d2d6b75 shared: split out polkit stuff from bus-util.c → bus-polkit.c
  2c0d7ed39393 network: do nothing if link is in pending or linger state on reconfiguring
  0ce0e3470eb5 network: synchronously save state file when link is being reconfigured
  8ae7b8a1e1d6 network: set dirty flag when link is being reconfigured
  dc084399fad2 loginctl: use /org/freedesktop/login1/session/auto when "lock-session" is called without argument
  68bda079fd08 man: document blockdev@.target
  44b0d1fd597d core: add implicit ordering dep on blockdev@.target from all mount units
  e3e6f996894f core: downgrade swap → device dep to Requires=
  61f9cf4e4c48 swap: generate automatic dependencies also for /proc/swaps devices
  5de0acf40d32 core: let's be defensive, /dev/nfs is also a special mount source, filter it out
  219f3cd94106 core: drop _pure_ from static functions
  a7e885587949 units: introduce blockdev@.target for properly ordering mounts/swaps against cryptsetup
  6bbd539e5e72 cryptsetup-generator: order after cryptsetup-pre.target unconditionally
  49685fb31480 cryptsetup-generator: break overly long line
  33a4c9834282 fstab-generator: line break a bit more systematically
  56a061f508ec update TODO
  a15e1a5df0c9 man: fix typo in systemd.netdev Xfrm example
  502991215726 network,udev: use uint64_t for bit rate
  ce96c9cb1a8f timesyncd: log louder when we refuse a server due to root distance
  d3e5639ebb60 Fixed some typos in the documentation
  f1f20764f9e5 resolved: drop DNSSEC root key that is not valid anymore
  be02c1cf426d Implemented x-systemd.{required,wanted}-by= options
  e0567bc8adfe journal: don't use startswith() on something that is not a NUL-terminated string
  f847b7eca30f hwbd: add Asus TP500LA
  df062bef2925 hwdb: merge identical entries
  c9872da4d17c hwdb: fix whitespace issue
  680120bb20f0 virt: do not define vm_from_string() for non-x86 architecture
  b90cf10245bc core: make a number of functions not used externally static
  96462ae9984c core: show the UID we cannot parse
  898820edb5c9 json: lower maximum allowed recursion to 2K
  18e6e8635f06 generator: order growfs for the root fs after systemd-remount-fs
  d6bd2bb4441e hwdb: fix error numbers passed to log_syntax()
  2aecc668878f hwdb: use strv_extend() where we can
  2e5180d38b33 strv: get rid of strv_clear()
  81248e7f3e83 Documentation update for x-systemd.{before,after}
  f85df8181727 import: let's disable UNIX signal generation from curl
  d076f9fd56c9 import: put a time-out on downloads
  137c6c6b3659 import: don't complain if FS_NOCOW_FL is not available
  492f91d8c6c3 update TODO
  e65f29b4c6e8 ci: add dependencies for repart + cryptsetup's pkcs#11 support
  917cc8082bbd man: document systemd-repart
  2f62a8c68809 test: add repart test
  29ee6541a414 units: add unit file for systemd-repart to automatically run at boot
  64db6f3644c3 mkosi: modernize
  e594a3b154bd repart: add new systemd-repart tool
  b57ebc6004bb conf-parser: add parser for 32bit signed integers
  7e70f2cb0e43 locale-util: add special glyph Σ
  1d2a1a0cb808 locale-util: add block drawing special glyphs
  137688dff466 format-table: add support for formatting uuids/id128 values
  1293a168f16d id128: move make_v4_uuid into id128-util.h to make it generally useful
  449d530700ae makefs: simplify SPDX header
  e56a8790a0bf test: add test for https://github.com/systemd/systemd/issues/14560
  3b7f79dc9fc5 core: make sure StandardInput=file: doesn't get dup'ed to stdout/stderr by default
  cdc6804b6046 units: drop full paths for utilities in $PATH
  5608deb847b7 Italian: language update
  5cbaf95ee311 wait-online: Support waiting for interfaces to disappear
  75cd4a5d9294 wait-online: Add maximum operational state option
  fc57f105d9e2 pkgconf: add full generator paths
  7e284b054ec5 tree-wide: we forgot to destroy some bus errors
  287cf2d80226 typo: "May modify to" -> "May modify"
  0879fbd6fedc mount: make checks on perpetual mount units more lax
  88414eed6f45 core: never allow perpetual units to be masked
  f535af6bcd51 man: document that WakeSystem= affects clock choice
  1e1f4f443dc3 docs: uppercase are headers
  3b9796c01c31 docs: let's reduce our spurious whitespace a bit
  8eabc083dc83 docs: in PORTABILITY_AND_STABILITY only use one h1
  54ed193f8d48 man: clarify that user rlimits cannot go beyond limits set for service mgr
  59d83463d18c man: extend on halt documentation
  0b306655f1ec man: document that rootflags= does not override /etc/fstab
  d524094b6b3f man: underline that AccuracySec= is about coalescing timer events, nothing else
  eec68a1a0807 man: mention that Before= doesn't work for device units
  49dd0c161a1e man: suggest SYSTEMD_WANTS usage instead of RUN for long running processes
  f27a21d48bac man: document the limits of the block device discovery for IO cgroup options
  1e8a7eff2207 man: document how error propagation to path units works
  ba96a8a2778c man: document that program invocation will fail if the User= does not exist
  8384ed93b958 docs: clarify that we don't want to own $BOOT exclusively
  4ca739e20a09 core: reduce indentation a bit
  b0a94df9631d logind: use loop instead of repeated code
  ddee3ada467d shared/user-record-nss: use macro to avoid repeats
  192aee3cae72 shared/user-record-nss: shorten code a bit
  c7d26acce6dc Disable reading SystemdOptions EFI Var when in SecureBoot mode
  c97ae2b29036 Clarify journald.conf MaxLevelStore documentation
  c16460cf781c shared/sysctl-util: add missing header
  32458cc9687c sysctl: downgrade message when we have no permission
  b2ae4d9eb85f sysctl: move hashmap allocation out of main function
  e76c60bf2a2b man: rework section about configuration file precedence
  4bb68f2fee91 core: on each iteration processing /proc/self/mountinfo merge all discovery flags for each path
  46d7c6afbf92 execute: allow pam_setcred() to fail, ignore errors
  5b8d1f6b7757 execute: add const to array parameters, where possible
  c903ee897681 docs: add documentation for the varlink user/group APIs
  32eb3c42299d docs: add documentation for JSON group records, too
  812862db7116 docs: add documentation for JSON user records
  0ba56d3657b3 man: document the new nss-systemd behaviour
  7d9ad0e5e51c man: document systemd-userdbd.service
  3b2db6f110f3 man: document userdbctl(1)
  fc89f88e56cd man: document new pam_systemd features in man page
  f9c1f4e19308 pam-systemd: apply user record properties to session
  7bfbf6cc92bd pam-systemd: normalize return values of append_session_xyz()
  9ab0d3ebe5a5 pam-systemd: port over to use a UserRecord structure
  355c9966c207 pam-systemd: share bus connection with pam_systemd_home if we can
  d750dde2a634 pam-systemd: port to pam_bus_log_{create|parse}_error() and pam_log_oom()
  cef9f2a64766 shared: add pam utility helpers
  d510589fd0a4 logind: honour per-user stopDelayUSec property
  156a363750b3 logind: honour killProcesses field of user record
  e8e4b7a0b6ef logind: enforce user record resource settings when user logs in
  22c902faccb3 logind: port to UserRecord object
  1684c56f40f0 nss: hook up nss-systemd with userdb varlink bits
  19d22d433d3a core: add user/group resolution varlink interface to PID 1
  4bad7eedae3d core: make return parameter of dynamic_user_lookup_name() optional
  1604937f83d3 userdbd: add userdbctl tool as client for userdbd
  d093b62c941e userdbd: add new service that can merge userdb queries from multiple clients
  295c1a6e4569 shared: add helpers for displaying new-style user/group records to users
  ec8e4a0ef12f shared: add internal API for querying JSON user records via varlink
  9b2d907877ab shared: add helpers for converting NSS passwd/group structures to new JSON objects
  71d0b9d42263 shared: add generic user/group record structures and JSON parsers
  64aa2622a3ba libcrypt-util: add superficial validator for UNIX hashed password strings
  42f3b2f97510 shared: split out crypt() specific helpers into its own .c/.h in src/shared/
  2ee4b118fa72 nss-util: add macros for generating getpwent()/getgrent() prototypes
  65e2766f6458 docs: fix width of console example
  5425f8a57c22 Revert "docs: rename HACKING → Hacking"
  8c5cd27dd155 docs: rename HACKING → Hacking
  b6bcde2623bf docs: shift console log on index page to the left
  6af0a0442808 docs: add the systemd output example
  4e96d758f883 docs: update old para with links to the blog stories
  48f60ea9ad2e docs: remove markup from title
  d00386fc0b1c man: add commas and reword a sentence
  bbaba5748d65 test-format-table: add tests for TABLE_STRV
  29e15e98c760 resolvectl: use format-table.[ch]
  536cdd07b3f7 networkctl: use TABLE_STRV
  4618660d1012 format-table: introduce TABLE_STRV
  8b75798d12cc strv: introduce strv_compare()
  3fec55246854 docs: rework HTML into GitHub Markdown table
  c238a2f8899b cgroup: minor comment improvement
  be2bb14f0044 logind: refuse overriding idle hint on tty sessions
  de9a8fe18e01 systemctl: use format-table.[ch] for tables
  191a3f163451 basic/strv: drop flags argument from strv_fnmatch()
  0ef84b80c59b networkctl: return error or warning when interfaces are not matched
  1d086a6e5972 mount: mark an existing "mounting" unit from /proc/self/mountinfo as "just_mounted"
  48fd01e5f3bf cgroup: drop redundant if check
  e1e98911a818 cgroup: update only siblings that got realized once
  95ae4d142072 cgroup: drop unnecessary {}
  a0d6590c4e8f cgroup: no need to cast dev_t to dev_t
  57f1030b1373 cgroup: use log_warning_errno() where possible
  b35ec8ded2da docs: uppercase all markdown document titles
  a0fadf66daba docs: drop "The" in categorization titles of Markdown documentation
  744c49e1fef0 docs: update link and more dots
  0a5a8f13b421 docs: say that journalctl --flush/--sync also require journald
  180f7c26aa18 docs: import initrd interface documentation from fdo wiki
  f8349d2fa5ce docs: various small fixes to PORTABILITY_AND_STABILITY markdown
  0bdd282a4e81 killall: update reference to root storage daemon interface docs
  6e47cac0aa86 docs: convert root storage daemon doc to markdown
  61c0ac0924d5 hwdb: Entry for Lenovo Ideapad 310S-14ISK Alps Touchpad
  23b392166388 journalctl: Correctly handle combination of --reverse and --lines (fixes #1596)
  3ac9cac7f7a3 journalctl: Correctly handle --show-cursor in combination with --until or --since and --reverse
  03f9228e7cf2 man: suffix parameter with = in our documentation, if it expects an argument
  fc6eb08e74d6 machinectl: modernize address table handling
  d91614e717ed format-table: natively support multiline cells
  f6857fa60118 string-util: add helper for extracting n'th line of a string
  8dd6491ef9f6 string-util: let's add helper for truncating string after a specified number of lines
  f9951b0cf0e5 man: we support bind mounting regular files too
  151a7133cd06 man: document that we mkdir() on What= in .mount units too
  c6cecb744b53 test: Add tests for gid list ops
  afb11bf1b843 execute: Detect groups added by PAM and merge them with supplementary groups
  3bb39ea936a5 execute: Restore call to pam_setcred
  0c5d667932f8 user-util: Add helper functions for gid lists operations
  d89cde099474 docs: say that various cli progs are independent of pid1
  ef0bea8cf4f1 docs: say that dbus api is stable (but list various caveats)
  b2eea3dc325e docs: say that all documented programs in $PATH are stable
  e4893c6306f4 docs: import "interface stability promise"
  117caf376557 networkctl: break long line
  8571210a21d7 machinectl: reduce scope of iterator variables
  957d9df38822 resolvectl: minor optimizations to allocate less
  d308bb99d20b Resolve alternative ifnames wherever we would resolve an interface name
  fc2ea97ad03b util-lib: add function to resolve "alternative" names
  6b8fe4c30cbb man: XxxRate= are in bps
  b8b7309778ca docs/stability: relax the stance on accepting patches a bit
  02c789f9f966 docs: import stability chart from wiki
  5c3fa98db68f util-lib: move things that parse ifnames to shared/
  955bb7fac3bc basic/socket-util: indent for clarity
  bad7cecc0aa8 sd-netlink: do not require rtnl pointer to be passed
  231d9de1e3e9 networkctl: define a helper for interface name resolution
  9030b50a7bfe timedatectl: drop ifindex output parameter too
  597da51bae9e tree-wide: make parse_ifindex simply return the index
  bcc0fe635df5 nspawn: Correct "container" to "host" MAC setting message
  2e93770fd865 man: document alias rules and aliases dropin loading
  1bf15585521c core,install: allow one more case of "instance propagation"
  972f3176fa36 shared/install: drop an unused variable in config_parse_also()
  66a19d85a533 shared/install: try harder to find enablement symlinks when disabling a unit
  3f57bc2267e0 shared/install: rework alias check and add test
  29a743f99346 core: explicit mention of unit ID is redundant with log_unit_*()
  9a4f9e69e108 shared/unit-file: expose function to check .wants/.requires symlink validity
  2595eb8cd9ba hwdb: make comment more precise
  12845a91b5c6 machinectl: do not truncate addresses when --full is specified
  bd17fa8cd870 tree-wide: use table_log_add_error()
  964a7745de89 portablectl: optimize table creation
  679c7c7a6741 machinectl: optimize table creation
  9c46b437fcb1 analyze: optimize table creation by using table_add_many()
  d8aedafb57df format-table: add table_log_add_error()
  0e05be840513 initctl: (void)ify epoll_ctl() CID 996298
  a602a0b44b9e man: Document systemctl --with-dependencies switch
  e9c387c8293c systemctl: Add --with-dependencies flag
  e2268fa43742 bash-completion: do not ellipsize machine name
  a65e34ccb083 machinectl: do not ellipsize table when --full is specified
  2a6c483b8cb7 bash-completion: busctrl: support --full command line option
  b683b82fe770 busctl: introduce --full command line option
  6c64cf8859ea bash-completion: networkctl: do not show ellipsized link name
  a42d94908003 networkctl: set table width 0 when --full is specified
  a362c069a9d7 systemd-mount: add --full command line option
  bcf00b6c0a6f format-table: allow forcing arbitrary width tables
  0c020321c83e test-network: simplify wait_online() by calling wait_operstate()
  a4632dc7d131 test-network: convert wait_operstate() to recheck condition for timeout seconds
  19cf3143cf9f test-network: rename check_operstate() to wait_operstate()
  4c6496525763 network: drop foreign config after addr_gen_mode has been set
  0917a2717810 network: if ipv6ll is disabled, enumerate tentative ipv6 addrs before dropping foreign addrs
  9524014ee638 network: add link->setting_genmode flag
  3a390124b794 network: rename linux_configure_after_setting_mtu() to linux_configure_continue()
  b63c88b62718 man: describe "symlink" and "systemctl link" explicitly in UNIT FILE LOAD PATH
  65f6b6bdcb50 core: fix re-realization of cgroup siblings
  6fca66a7f125 core: set error value correctly
  af4454cb17da core: use unit-based logging instead of generic logging where appropriate
  eb34a981d671 core: initialize priority_set when parsing swap unit files
  6afc31615e63 core: no need to initialize swap structure fields if all zeroes anyway
  6d9e0ca40013 core: expose swap priority value via dbus only if it is set
  246be82bd419 man: link to specific sections of cgroups-v2 document
  bb6d563a5049 doc: link to html versions of cgroup docs
  0ca1926ec314 bash-completion: networkctl: support --full and --lines
  404308486aa2 core: be more restrictive on the dependency types we allow to be created transiently
  cf57766d792f timedatectl: use format-table.[ch]
  7cce68e1e042 core: make sure we use the correct mount flag when re-mounting bind mounts
  8403219fc13a mount-util: line break overly long function prototypes
  08b1f5c7d119 mount-util: clean up get_mount_flags()
  4eaf0d9401ab mount-util: don't mask away MS_RDONLY twice
  f3dab34d22e6 mount-util: rename cleaned → simplified, because that's what we actually did here
  a5279634c025 systemd-mount: add --no-legend command line option
  6ae6ea55d81d systemd-mount: use format-table.[ch]
  f93d876c80a6 format-table: introduce TABLE_PATH
  4c2ef3276735 core: propagate service state to socket in more load states
  19212f278166 udev: don't import parent ID_FS_ data on partitions
  b0a94268f876 core: when we cannot open an image file for write, try read-only
  c8c535d589cc namespace: tweak checks whether we can mount image read-only
  9a2ec8f7a6d5 install: use path_strv_contains() where appropriate
  3593fa60f2a1 path-util: express PATH_IN_SET() through path_strv_contains()
  3841fee82218 path-util: introduce path_strv_contains() helper
  ab015b13df5e man: small casing fix
  f2e5e70410ab man: document that scope units can fail, but not due to process exit statusses
  c80a9a33d04f core: clearly refuse OnFailure= deps on units that can't fail
  b44d87e200b9 sd-event: use _cleanup_ in one more place
  1eac79486ef3 sd-event: use RAII for struct epoll_event
  0475919b56c4 network: use automatic stack allocation and structured init
  6666c4faeefa network: do not require ethtool_get_permanent_macaddr() to get an fd
  6a6078a585f3 test: minor typo fix
  514793658c49 test: pin meson to 0.52.1 for fuzzit/fuzzbuzz
  64be35ab02c6 network: rename *fd to *ethtool_fd
  d9b204544b69 man: use xi:include to avoid duplication
  95522092925a man: fix option name
  d2e825b4ab51 doc: tweak grammar in CONTAINER_INTERFACE description
  caa8538a22b6 networkctl: show permanent mac address if it is not used now
  4bb7cc828706 network, udev: introduce PermanentMACAddress= setting in [Match] section
  95f2b4dd237f Support Plugable UD-PRO8 dock
  79b4428a7d01 ethtool: introduce ethtool_get_permanent_macaddr()
  4f0840669e17 gpt-auto: don't assume XBOOTLDR is vfat
  5ac8b50d5894 network, meson: allow statically linked build
  356873ddec61 zsh: Complete systemctl subcommands in separate tags
  8f817cb888cc shared/sleep-config: do not ignore resume_offset when resume not set
  8efc2c1608af shared/sleep-config: make swap detection stricter again
  411975ce63b2 shared/bus-util: Don't replace exsting strv
  4353974d7594 boot: fix osrel parser
  3a827125e70a man: stop recommending modprobe -abq in ExecStartPre=
  d5016c21d7bb units: tweaks to modprobe@.service
  867af7282b2e unit: make sure to pull in modprobe@loop.service when RootImage= is used with DeviceAllow=
  07141aa00592 bpf-devices: line-break some overly long function signatures
  625077264ba0 units: Split modprobing out into a separate service unit
  3ce252d0e0cc udev: use dot_or_dot_dot() where appropriate
  a1686563ded4 man: fix documentation of IBM VIO device naming
  e232c307c052 man: slightly extend documentation on difference between ID_NET_NAME_ONBOARD and ID_NET_LABEL_ONBOARD
  e9f0c5d08c65 shared/sleep: use stat() instead of open()+fstat() in one place
  7a182f103437 udev: do not use exact match of file permission
  6b50cb5ca919 nspawn: set original ifname as alternative if it is truncated
  98b0299479a6 network: append INTERFACE= attributes for logs corresponds to a netif
  fc79e6ff5e1f test-network: suppress logs in status command
  10c71c3605d7 networkctl: status command also shows logs of networkd
  b6cea5496a20 man: drop unnecessary white space
  67861acdf3f0 locale-util: extend comments on unicode glyph use, and drop mdash (that actually was an ndash)
  214c5bae09fb test-network: add test for Gateway=DHCP
  1985c54ff352 network: static routes via DHCP gateway
  25454a0c341e virt: drop trailing white spaces
  735ea55f5cd8 virt: use string table to detect VM or container
  0e97a910a63d pkcs11-util: don't mask return value of the first asprintf()
  d6246fd498ab network: lower the log-level of harmless message
  11b8568f26e5 meson: drop unnecessary linking of libudev_core
  a26c307320fb sd-netlink: fix copy and paste mistake
  53dc5fbc41af man: change links to container interface doc to https://systemd.io/
  635dea2783a6 docs: move container interface docs from wiki to markdown
  fc67a943d989 core: drop initial ListNames() bus call from PID 1
  a5b07847950c core: create/remove unit bus name slots always together
  5085ef0d711f core: no need to eat up error
  17bda1f19d53 core: shorten code a bit
  a54654ba700b core: don't check potentially NULL error, it's not gonna work anyway
  42837b813484 core: don't check error parameter of get_name_owner_handler()
  3425c45e1e95 testsuite: drop "systemctl is-system-running --wait" invocation
  13811aa5f6bc test: don't rely on "nobody" user for TEST-43
  519b2e521214 test: hardcode shell to use
  14b6e6b6f31a sd-netlink: use uint8_t* for non-character data
  f9aefc91f170 testsuite: drop "systemctl is-system-running --wait" invocation
  e9786a5c0164 test: don't rely on "nobody" user for TEST-43
  6e0ed2865e34 test: hardcode shell to use
  52133271a7b3 systemd-sleep: always attempt hibernation if configured
  ec04aef44225 dbus-execute: avoid extra strdup()
  ff963ea6ba8e test: use symlinks for Makefiles
  097537f07a2f job: Don't mark as redundant if deps are relevant
  2436ea761b28 nspawn: Make a custom mount on root imply --read-only.
  bbd407ea2bc5 nspawn: Don't mount read-only if we have a custom mount on root.
  72a86dd5ec25 man: tmpfiles.d: only list "v" once
  f6bc26ee7fba man: tmpfiles.d: "b", "c" options require major and minor numbers
  2ceefe45873d hwdb: Lenovo T490 Synaptics Touchpad hwdb entry
  75997c3fa5e7 test: add test case for setpriority_closest()
  390902012c51 core: in execute, Never fail setting Nice priority
  bc5ea049f29c nspawn: Generate unique short veth names
  b355d0c9affc udev: move naming-scheme.[ch] into src/shared/
  b01c1f305c04 systemctl: show 'VENDOR PRESET' column in 'list-unit-files'
  a25457f5b768 systemctl: skip non-existent units in the 'cat' verb
  412a6c646ced systemd.exec: document the file system for EnvironmentFile paths
  5b4855ab73c1 nspawn: Move --network-interface interfaces back to the host.
  85f04a216147 hwdb: 60-sensor.hwdb Chuwi Hi10 CWI515 accelerometer orientation.
  736eadf0284b Update Galician translations
  be78e0f07b23 systemd-analyze: fixed typo in documentation
  e514aa1eead3 tree-wide: yet another batch of coccinelle recommendations
  48d0248e6df3 network: bump netlink receive buffer size to 128M
  14157349db98 travis: wait for the container to fully boot up
  a3d35654517e test-network: add a test case for CoDel
  b078e52855d0 network: add more settings for CoDel
  c695dcf929bc network: Add support to configure DHCPv4 route MTU
  a9a5d632da72 network: tc introduce codel
  e6627f2392cd unit drop-in: Fix ordering of special type.d drop-ins
  f5dd6e50a781 Add failing test to show service.d global drop-in does not get overridden by more specific dropins
  98cd752a285c test-condition: fix group check condition
  6e3c443b56f1 Fix typo
  11fcfc539854 Fix several typos in documentation
  40681e5cdc74 network: add one more log message
  b390f1789262 nspawn-network: Split off udev checking from parse_interface.
  fa7ea8651084 zsh: Prepare for classifying systemctl commands (#14422)
  1d8385b41599 zsh: Complete more systemctl commands
  51a3b7263409 zsh: Group systemctl subcommands as in the manual. No functional change.
  27cc3c9d764f update TODO
  31ca5166b6c7 man: document /var/tmp/ and /var/ handling in systemd-gpt-auto-generator man page
  19ac32cdd6c3 docs: import discoverable partitions spec
  d4dffb8533a0 dissect: introduce new recognizable partition types for /var and /var/tmp
  4171837be6b8 bash-completion: move shell-completion for log-level or friends to systemctl
  b59817b199f3 shared/install: drop creation of alias for DefaultInstance
  4ca8072fd619 umount: when we fail to detach a loopback device, set the auto-clear flag
  b877c3b06f15 umount: check LO_FLAGS_AUTOCLEAR after LOOP_CLR_FD claimed success
  63135a2d8db0 umount: detect root loopback device the same way as we detect root DM devices
  88287615e631 umount: show correct error message
  610f9a42c4a8 umount: remove unneeded variable
  49f80dcec83b umount: line break comments again
  b895fa08e680 Revert "Drop dbus activation stub service"
  0fd8b7180959 test-network: add a test case for DHCPv4.SendDecline=
  c1d3fa29ca9d network: link should not become configured state during ACD probing
  0f3ff4eae2f3 network: DHCP4 introduce send decline
  7c6d95ea5add network: fix typo
  2f8c48b6059b core,journal: export user units' InvocationID and use as _SYSTEMD_INVOCATION_ID
  f9ef25a483ed basic/unit-name: make sure UnitNameFlags is signed
  509b06ffddb0 network: update log message in message_rtnl_process_xyz()
  aa0f357fd833 shared/install: split out alias verification function
  277519db5129 man: add section about user manager units
  f71502c49fd9 man: add remote-*.targets to the bootup sequence
  9e7c8f64cfda time-util: also use 32bit hack on EOVERFLOW
  12c7d4d65e4f hwdb: ignore keys added in kernel 5.5
  419a8a2dabb4 hwdb: Add LCD menu key mappings for the Logitech MX5000 and MX5500 keyboards
  4186441bbd91 Revert "cryptsetup: umount encrypted devices before detaching it during shutdown"
  a1533ad73f09 [man] note which UID ranges will get user journals
  d59fc29bb742 [man] fix URL
  b6657e2c53ee test: add test case for PrivateDevices=y and Group=daemon
  e5f10cafe0bb core: create inaccessible nodes for users when making runtime dirs
  a49ad4c482b8 core: add test case for PrivateUsers=true in user manager
  5749f855a76b core: PrivateUsers=true for (unprivileged) user managers
  d909b40fda52 analyze: badness if neither of RootImage and RootDirectory exists
  de697db05b08 network: introduce AddPrefixRoute= and deprecate PrefixRoute=
  a0ce990e711f test-network: add test case for multipath routing
  6ff5cc6b7a0f network: introduce multipath route
  6497a8aa9b48 sd-netlink: introduce rtattr_append_attribute()
  b012a1f455cb Make openssl dependency optional again
  27b4b3cc927e update TODO
  3d0205f28b06 Be more strict about what can be an Alias for template and instances
  5cddd924aa1f sd-event: don't allocate event queue array on stack
  ac6431dad950 man: add man page for sd_bus_message_sensitive()
  4023637a8ab0 Restore silent handling of BUS_ERROR_SPEED_METER_INACTIVE
  1b49e3e3c4f5 shared/loop-util: rename function
  7a670b1dd981 shared/dropin: fix assert for invalid drop-in
  f27bb6abd3b8 initrd: make udev cleanup service confict trigger and settle too
  9652d740929f varlink: add varlink_close_unref() helper
  e10720818ec3 chown-recursive: add fd based API
  417a6eece8a1 chown-recursive: move src/core/chown-recursive.[ch] → src/shared/
  845a7c1fc183 basic: add quota-util.[ch] with some helpers for the Linux quotactl() API
  6789dd57f0a0 cryptsetup-pkcs11: just return zero on success, no need to return anything else
  3ded1d616a50 cryptsetup-pkcs11: line break some overly long lines
  12f69587e973 cryptsetup-pkcs11: refuse keys above 16MiB size
  2ccf0ff6e8cd man: tweaks to the crypttab(5) man page
  3d864658ea01 hwdb: assume all Medion Akoya E-models have the same matrix
  35a05d8d5edc man: whitespace fix
  76b73ce21c0a man: we support growing xfs too these days
  601f91bec564 time-util: deal with systems where userspace has 64bit time_t but kernel does not
  e7bdadb5c655 network: support alternative name to get bus path for the link
  f7581ed6e06b networkctl: support alternative name to specify interface
  4d016e965b13 udev: sort alternative names
  b04c5e51da7a sd-netlink: introduce rtnl_resolve_link_alternative_names()
  1209ef94bd09 [import] fix stdin/stdout pipe behavior in import/export tar/raw
  05de16766b6b hwdb: Add Bluetooth-attached Logitech MX Master
  4afb4a9cc574 systemctl: show what verbs support --dry-run in the help page
  6d185cffb196 sd-netlink: add a whitespce between cast operator and variable
  f501c2515125 sd-netlink: make netlink_container_parse() takes size_t for rt_len
  49f5cbe92484 network: set AlternativeNamesPolicy= in 99-default.link
  ef1d2c07f956 udev: introduce AlternativeNamesPolicy= setting
  bb181dd4a664 udev: do not fail if kernel does not support alternative names
  a0f11d1d11a5 random-util: call initialize_srand() after fork()
  78f8849f84ca udev: extend the length of ID_NET_NAME_XXX= to ALTIFNAMSIZ
  861f1789051d efivars: properly NUL terminate EFI variables when reading
  e40b4caa1f91 basic/tmpfile: avoid maybe-uninitialized warning in mkostemp_safe()
  b742942edf60 TODO: drop entry
  e51712963b81 shared/install: log syntax error for invalid DefaultInstance=
  cb180b09fab0 Added Trekstor Primetab S11B
  da7667518b57 docs: CSS files should not be executable
  90d81ee96665 github: use systemd.io links in issue template
  479ddcdf5ac5 util: constify arguments of strv_xxx()
  7a2f6fb6f1bf test-network: pass environment variables to networkctl
  6934ace05d04 test-network: add a test case for netdev altname
  511070ee9501 networkctl: show alternative names
  572b21d96cab network: make Name= in [Match] support alternative names of interfaces
  a5053a158b43 udev: support AlternativeName= setting in .link file
  4252696aec9e util: introduce ifname_valid_full()
  d08d92d5ee50 test: add a test for sd_netlink_message_{append,read}_strv()
  6d725977c4f9 sd-netlink: introduce sd_netlink_message_append_strv()
  8f3c18596692 sd-netlink: introduce sd_netlink_message_read_strv()
  01813148619c shared/loop-util: spin on open() returning ENOENT too
  35b9eb0a72b6 basic/efivars: do not return EIO if an efivar read is shorten than fstat size
  a97abb30e7eb shared/efi-loader: add some debugging statements
  f2d9213fee0f shared/loop-util: spin on LOOP_CTL_REMOVE
  e8af3bfd635c shared/loop-util: fix error handling in loop_device_make_full()
  ffeb16f5d832 sd-netlink: support IFLA_PROP_LIST and IFLA_ALT_IFNAME attributes
  d3678e3a0b4b linux: update headers
  d9ceeb9fe7bb Add Acer Spin 1 SP111-33 to sensor hwdb
  c8bf87b3399a hwdb: Add accel orientation quirk for Thundersoft TST168 tablet
  4ef289250f1c test-network: add a test case for new FQ settings
  d7ceaf72618a shared/install: provide a nicer error message for invalid WantedBy=/Required= values
  d9c1c43e678f shared/install: remove duplicated check
  e83562e51e97 network: tc: add more settings for FQ
  d0556c55e7b6 nspawn: fix overlay with automatic temporary tree
  ff2c2d0850c4 docs: make sure there's only one # markdown header in each file
  db8728a60c73 blockdev-util: rework get_block_device()
  bd6609eb11ec nspawn-mount: Use FLAGS_SET to check flags.
  5530dc87f21c nspawn: Only bind-mount directory when necessary.
  e091a5dfd162 nspawn-mount: Remove unused parameters
  5f0a6347acf0 nspawn: Enable specifying root as the mount target directory.
  eae1ef076d6b test: increase qemu timeout for TEST-08 and TEST-09
  679ecd361634 nspawn: allow combination of private-network and network-namespace-path
  9401e488555a test-network: add a test case for the new settings of FQ-CoDel
  ac810b75c103 network: tc: support more attributes for FQ-CoDel
  dd1e09971b7d test: add a test case for network-generator
  21a925a4ac79 network-generator: allow empty hostname
  0baddbd5eef0 test-network: add a test case for FQ
  7234b915963c network tc: inroduce FQ - Fair Queue traffic policing
  eb34f4b3d2a9 sd-netlink: add attributes for FQ
  ef8863902831 man: document INVOCATION_ID and USER_INVOCATION_ID journal fields
  5e13bcdd0391 locale-util: drop weird invisible unicode codepoints accidentally inserted in comment
  c498df3a7e51 hwdb: trivial indentation fix
  8fb82e35dc0d minor: avoid double title
  b41a3f66c97e docs: make it pretty
  e8c17dc078ee network: tc: introduce QDiscVTable for future extendability
  1f9dd3bfdf0a network: tc: drop unused element
  042fc950eafe network: tc: drop unused functions
  335498ca57a5 docs: direct to systemd.io version of naming scheme docs
  7c4a7c6d13db docs: fix markdown links
  471d407eaaea docs: use `` quotes for marking identifiers of some form
  955ed5d540fe man: fix typo in net-naming-scheme man page
  5d3f5e408196 docs: beef up entrypoint documentation page
  4cdca0af1149 docs: place all our markdown docs in rough categories
  f32d15b0e4f5 man: fix typos (#14304)
  92c7593f5e68 network: tc: use typesafe functions to append netlink attributes
  42b5f7dd322d sd-netlink: make TCA_OPTIONS take NETLINK_TYPE_UNION
  e92b60b20f21 ipv4ll: do not reset conflict counter on restart
  40821c2ac3a7 test-network: add a test case for fq-codel
  4e5ef1491901 network tc: Add support to conkfigure CoDel - Controlled-Delay Active Queue Management algorithm
  d80810200832 network tc: qdisc parent add support to set ingress
  5905d7cf5bc8 tree-wide: use SD_ID128_STRING_MAX where appropriate
  b5ea030d65e9 id128: introduce ID128_UUID_STRING_MAX for sizing UUID buffers
  c2d54475c431 man: document pkcs#11 hookup in /etc/crypttab
  086697094ec7 cryptsetup: add native pkcs#11 support to cryptsetup
  f573629c0bba udev: mark all ccid/security devices with a special tag
  839fddbe500f shared: add pkcs11-util.[ch]
  3f6370198305 shared: add openssl helpers
  6047637645ac strv: when growing strv arrays piecemeal actually allocate memory in exponential steps
  47ac31f792a8 test-util: add more tests for ALIGN_POWER2
  e49e4c33dc96 macro: introduce new GREEDY_ALLOC_ROUND_UP() helper
  85c267afa7ce macro: avoid subtraction overflow in ALIGN_POWER2()
  886e07a9cf5d test-network: add tests for new TBF settings
  dcfc23ae7713 network: tc: add more options for TBF
  0810e6d787bd test-network: add a test case for SendOption=
  83b56c70e6bc network: fix segfault in parsing SendOption=
  fb4b0465abbd seccomp: real syscall numbers are >= 0
  0cab1f197647 Add Cube iWork 11 Stylus
  8ee08dc564cc test: do not fail if new device is plugged during enumeration
  bc942f69aa49 test-network: make test_bind_carrier more stable
  6d62ec61b941 network: fix copy and paste mistake
  07317d6e343c resolved, networkd: don't resolve the user if not root
  b076d5d76ddc test-network: add test case for IFB
  3295a461b373 network: introduce ifb (Intermediate Functional Block)
  cec1552ad4e0 sd-netlink: add support for ifb device
  dc7d3c5fd4cf test-network: add test case for IPv4 DAD
  051e77cac119 network: introduce DAD for static address
  b069c2a3f2b0 shared/seccomp: avoid possibly writing bogus errno code in debug log
  2c7b826ddf52 network: do not drop foreign config if interface is in initialized state
  6b2a8b80b4bf shared/loop-util: drop inline function with one use
  ba5450f4119c shared/loop-util: fix leak of fd in error path
  1163a2e98a89 shared/loop-util: operate on the right fd
  7db054470589 test-network: add tests to verify IPv6MTUBytes
  3e8215254359 test-network: disable restart limiting for networkd
  fd372b1a68a6 test-network: in wait_online() allow a few seconds to reach setup_state
  befd4b8b60dd test-network: read link attribute at any depth
  9dfc1a9339ee test-network: allow specifying only individual drop-in files
  d236718c167a network: set ipv6 mtu after link-up or device mtu change
  ab4fae0c8c3f Fix typo (duplicate "or")
  14bb274d3fdd networkd: check return value
  362c378291e8 cryptsetup: umount encrypted devices before detaching it during shutdown
  1dc85eff1d0d crypsetup: introduce x-initrd.attach option
  5ebbb45bdee9 TODO: remove obsolete entries
  bddeb54cbb09 Fix use of unitialized variable in error path
  d6f1e6607692 growfs: port over to resize_fs()
  2b82a99fe0d3 growfs: define main function through macro
  49219b5c2a65 seccomp: mmap test results depend on kernel/libseccomp/glibc
  5ef3ed97e3c7 seccomp: use per arch shmat_syscall
  903659e7b242 seccomp: ensure rules are loaded in seccomp_memory_deny_write_execute
  bed4668d1dae seccomp: fix multiplexed system calls
  bf331d87171b network: if /sys is rw, then udev should be around
  26208d5b9674 nspawn: do not fail if udev is not running
  2e22a54f4e08 Implement SNI when using DNS-over-TLS
  6f0245b34276 sd-bus: don't include properties maked as "emit-invalidation" in InterfacesAdded signals
  7a77d2a41cb6 sd-bus: add new call sd_bus_message_sensitive() and SD_BUS_VTABLE_SENSITIVE
  0ab927913271 test-network: add a test case for SFQ
  b2340fbb5ab3 network: SFQ cannot be configured with netem or TBF
  9942b71089aa network: tc introduce sfq - Stochastic Fairness Queueing
  1b628c4f64e9 test-network: add test case for TBF
  f1dba5556564 network: drop unnecessary headers
  6483f04381db network: make network_emulator_fill_message() take NetworkEmulator
  edc54f2f753b network: rename QDiscs to QDisc
  8efb93f02dd6 network: ignore sections which have both NetworkEmulator and TokenBufferFilter settings
  ba5841b5206d networkd tc: introduce tbf
  28937bcc6ca1 shared: add new wrapper for online fs resizing ioctls
  24a0b2c0abc0 missing: add XFS magic
  6b636c2d2790 main-func: send main exit code to parent via sd_notify() on exit
  8987afc4d12c process-util: add new safe_fork() flag for connecting stdout to stderr
  7a509acc297a tmpfile-util: modernize mkostemp_safe() a bit
  e5ea9ed03078 tmpfile-util: if no path is passed to fopen_temporary() make one up
  a3292ec8d704 user-util: add uid_is_container() for checking whether UID is in container range
  6093b2bb05f3 user-util: export is_nologin_shell() so that we can use it elsewhere
  c0dd3269535b man: document journal rate limit burst multiplier
  53caaffdf4a6 string-util: readd string_erase()
  282bde106652 memory-util: introduce erase_and_free() helper
  9933a4780843 errno-util: add new ERRNO_IS_DISK_SPACE() helper
  b64cea60275b ordered-set: add ordered_set_first() helper
  22810041c220 parse-util: sometimes it is useful to check if a string is a valid integer, but not actually parse it
  26601a2a1771 sd-boot: Add a 0.1 second delay before key-probing for showing menu
  e544601536ac sd-event: refuse running default event loops in any other thread than the one they are default for
  8089643328b2 man: document the new sd-event pidfd magic
  b3508072002c man: mention that SIGCHLD has to be blocked before using sd_event_add_child()
  68765d94fec8 man: don't claim we'd unblock the specified signal in sd_event_add_signal()
  3ecb3bdc9384 test: add test for pidfd support in sd-event
  ee880b37c152 sd-event: refuse sd_event_add_child() if SIGCHLD is not blocked
  d1b75241baa3 sd-event: make use of new signal_is_blocked() helper
  90b15e18eef4 signal-util: add new helper signal_is_blocked()
  f8f3f9263e51 sd-event: add pidfd support
  298f466f159e process-util: add helper pidfd_get_pid()
  5ead4e85f6b5 missing: add rt_sigqueueinfo() syscall definition
  5f152f43d04e missing: define new pidfd syscalls
  5a795bff3840 sd-event: (void)ify some epoll_ctl() syscall invocations
  d1cf20237492 sd-event: drop unnecessary local variable
  9f537ae3100f udev: Ensure udev_event_spawn reads stdout
  a9dfac21ec85 core: reload SELinux label cache on daemon-reload
  68d58f38693e pid1: add new kernel cmdline arg systemd.cpu_affinity=
  6355715e5b5d Fix DPI for MX Master 2s bluetooth mouse
  a652f050a786 Create parent directories when creating systemd-private subdirs
  e813de549b17 network: do not return error but return UINT64_MAX if speed meter is disabled
  cfd54b6a2e8b Alienware M17xR3 ejectcd button fix
  7477451b691d core: swap priority can be negative
  09e4b620e7a9 hwdb: Set trackball property for Logitech MX Ergo (#14231)
  33ebda2e81aa networkctl: fix to show BSSID
  ff757c9d2941 hibernate-resume-generator: wait "infinitely" for the resume device
  7cecc563163f cryptsetup-generator: unconfuse writing of the device timeout
  2fec5854baa6 systemctl: enhance message about kexec missing kernel
  6a2dc6a040f7 TODO: remove obsolete entries
  23e5e79a51f9 initrd: fix systemd.debug-shell & friends
  1e904320aacb Fixup typo in NEWS
  10c1b18888b4 valgrind: temporarily handle that valgrind still doesn't know LOOP_GET_STATUS64
  50d046993be9 loop-util: if we fail to fully set up a loop device, detach it again
  b26c39ad2c65 loop-util: fill in the loopback number, even a posteriori
  f1443709e0c2 loop-util: optionally also resize partitions
  441ec80468d1 loop-util: add api for locking the block device with flock()
  c37878fcedd9 loop-util: allow refreshing offset
  ed9eeb7b0b50 loop-util: allow creating loopback block devices with offset/length
  9dabc4fda574 loop-util: add API to refresh loopback device size and opening existing loopback block devices
  e08f94acf589 loop-util: accept loopback flags when creating loopback device
  2d8143048bc6 json: add new output flag JSON_PRETTY_AUTO
  19a209cc710a json: add const string dispatcher
  e4defdc4b02f json: teach json_build() to build arrays from C arrays of JsonVariant
  a42ef715a2c6 json: add more dispatch helpers
  a832b08e6e1b json: add json_variant_set_field_integer() and json_variant_set_field_boolean() helpers
  faca141c5fb3 json: add json_variant_unbase64() helper
  0b1f2e8a0617 json: add new flag for forcing a flush after dumping json data to file
  0ac0787e30f0 json: add explicit log call for ENOMEM
  3dd1b600b8b7 json: permit 'null' as a way to reset tri-states to default
  aafa52ab8370 json: add ability to generate empty arrays/objects in json builder
  886b0c93a8bc json: allow putting together base64 fields with json_build()
  21e215110771 json: add new helper json_variant_append_array()
  cc164891da29 json: add new helper json_variant_new_base64()
  b7fc90a2e63f json: add concept of normalization
  ca409a59c8ee json: add json_variant_merge() helper
  15f1fb3e3e3f json: add json_variant_set_field_string() and json_variant_set_field_unsigned()
  a7f8c9ce60f9 nspawn-oci: use new json_variant_strv() helper
  22f14d6b0287 json: add json_variant_strv() helper that converts a json variant to an strv
  ba23dbf1ebd9 json: optionally, make string checks stricter when dispatching strings
  d642f640bf39 json: add flags parameter to json_parse_file(), for parsing "sensitive" data
  f325aaf34175 json: add json_parse_file_at() helper
  83bc6cb79233 json: add a new "sensitive" flags for JsonVariant objects
  78a41236e40f json: add new json_variant_set_field() helper
  f2ff34ff2aaa json: add new API json_variant_filter() for dropping fields from objects
  e787b211a5aa json: add new json_variant_is_blank_{object,array}() helpers
  07737617a18d json: beef up strv parser to also accept a single string instead of an array of strings
  95244ceb9c82 fileio: add WRITE_STRING_FILE_MODE_0600 flag for writing files
  8241f785f414 fileio: add 'dir_fd' parameter to read_full_file_full()
  0a38e6b9a37b fileio: add an openat() flavour for fopen()
  d0d7f11ca27b hwdb: Add accel orientation quirk for Teclast X89 tablet
  3b681ace37e2 hwdb: Sort 60-sensor.hwdb Teclast entries alphabetically
  6d8f06368bc0 semaphore: switch branch to debian/master
  3d92aa4596a7 gpt-auto-generator: rename function for clarity
  46c41478c933 tree-wise: standarize on "auto-detection" spelling
  607ebf2bd28f bootlctl: show LoaderDevicePartUUID information in status
  b50a3a156502 gpt-auto-generator: make it easier to notice if boot loader support is missing
  1fac34b94121 gpt-auto-generator: use write_drop_in_format() helper and downgrade failure
  074cdb953bd2 gpt-auto-generator: improve debug messages a bit
  5ecb131d9479 network: include NLMSGERR_ATTR_MSG attribute in error message
  e4a1e68d7ab3 sd-netlink: support NLMSGERR_ATTR_MSG
  0e7e8544712f update TODO
  2b1daf24dc82 man: document initrd.target
  8755dbad5b2a pid1: use initrd.target in the initramfs by default
  9fe6f5cc1668 gpt-auto-generator: move functions around
  80e7c8408142 tmpfiles: create with correct MAC label on option C
  aeec5efab58a copy: add flag COPY_MAC_CREATE to create with correct label
  6e86b24db3c5 tree-wide: normalize includes of public headers
  fe7a6da8c5a9 core: use SPECIAL_DEFAULT_TARGET more
  943800f4e772 execute: Call capability_ambient_set_apply even if ambient set is 0
  155a6234ea2c test-capability: Modify ambient capability tests to test clearing caps
  82d832b435a0 basic: Drop ambient inherited capabilities by default
  f4331d0db28c shared/install: warn about unkown sections in unit files
  130b812f9d68 network: warn about unknown sections when parsing .netdev files
  ddeb3f5d4b7c shared/conf-parser: allow sections to be silently ignored with new -Section syntax
  94a404cb0357 shared/conf-parser: document what the flags do
  f9761a89a84f shared/conf-parser: turn CONFIG_PARSE_REFUSE_BOM flag into a local variable
  15b82eecb646 boot: Deduplicate old-style loader entries.
  ae474efc3f65 boot: Update bootspec.c to match previous changes.
  10d0024a07c8 boot: Improve EFISTUB name and version detection.
  6cd12ebcfe45 boot: Retain ".conf" suffix for loader config IDs.
  65901c0fd164 boot: Ignore EFISTUB binaries starting with "auto-".
  7fa23ab646a0 boot: Make EFISTUB IDs use binaries' filenames.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
This commit doesn't (currently) include a revert of 097537f07a2f ("job:
Don't mark as redundant if deps are relevant"), which both Fedora and
Debian have:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=953670
https://bugzilla.redhat.com/show_bug.cgi?id=1807771
https://github.com/systemd/systemd/issues/15091

The prior commits to psplash and the testsuite fix the issues which this
commit exposes and we probably want to keep both of those changes, but
may still want to revert 097537f07a2f.

Changes in v2:
- move systemd 245 upgrade to last in series
- update to systemd 245.2

 ...md-boot_244.3.bb => systemd-boot_245.2.bb} |   0
 ...md-conf_244.3.bb => systemd-conf_245.2.bb} |   0
 meta/recipes-core/systemd/systemd.inc         |   4 +-
 .../systemd/0001-Handle-missing-gshadow.patch | 171 ++++++++++++++++++
 ...tall-dependency-links-at-install-tim.patch |  14 +-
 ...-not-disable-buffer-in-writing-files.patch |  46 ++---
 ...002-don-t-use-glibc-specific-qsort_r.patch |  12 +-
 ...k-parse_printf_format-implementation.patch |  10 +-
 ...set-util.h-add-__cpu_mask-definition.patch |   8 +-
 ...missing.h-check-for-missing-strndupa.patch |  93 ++++++----
 .../0006-Include-netinet-if_ether.h.patch     |  41 +++--
 ..._register_atfork-for-non-glibc-build.patch |   6 +-
 ...11-Use-uintmax_t-for-handling-rlim_t.patch |  10 +-
 ...sable-tests-for-missing-typedefs-in-.patch |   8 +-
 ...uffering-when-writing-to-oom_score_a.patch |   8 +-
 .../{systemd_244.3.bb => systemd_245.2.bb}    |  11 +-
 16 files changed, 317 insertions(+), 125 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_245.2.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_244.3.bb => systemd-conf_245.2.bb} (100%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_245.2.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_244.3.bb b/meta/recipes-core/systemd/systemd-boot_245.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_244.3.bb
rename to meta/recipes-core/systemd/systemd-boot_245.2.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_244.3.bb b/meta/recipes-core/systemd/systemd-conf_245.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_244.3.bb
rename to meta/recipes-core/systemd/systemd-conf_245.2.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index e73b397b5d64..7576af744bac 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "b7ed902b2394f94e7f1fbe6c3194b5cd9a9429e6"
-SRCBRANCH = "v244-stable"
+SRCREV = "d1d3f2aa1561a9a75ce58026ef0a6bd4c5b464ac"
+SRCBRANCH = "v245-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
new file mode 100644
index 000000000000..26a597d45b60
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Handle-missing-gshadow.patch
@@ -0,0 +1,171 @@
+From ef9580ea1e2f1e57af3c7dcb0ec392ba8dbb5c8d Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 10 Mar 2020 11:05:20 +0000
+Subject: [PATCH] Handle missing gshadow
+
+gshadow usage is now present in the userdb code. Mask all uses of it to
+allow compilation on musl
+
+Upstream-Status: Inappropriate [musl specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/shared/group-record-nss.c | 20 ++++++++++++++++++++
+ src/shared/group-record-nss.h |  4 ++++
+ src/shared/userdb.c           |  6 ++++++
+ 3 files changed, 30 insertions(+)
+
+diff --git a/src/shared/group-record-nss.c b/src/shared/group-record-nss.c
+index 77924f1c4067..c64490253ff3 100644
+--- a/src/shared/group-record-nss.c
++++ b/src/shared/group-record-nss.c
+@@ -19,8 +19,10 @@ int nss_group_to_group_record(
+         if (isempty(grp->gr_name))
+                 return -EINVAL;
+ 
++#if ENABLE_GSHADOW
+         if (sgrp && !streq_ptr(sgrp->sg_namp, grp->gr_name))
+                 return -EINVAL;
++#endif
+ 
+         g = group_record_new();
+         if (!g)
+@@ -36,6 +38,7 @@ int nss_group_to_group_record(
+ 
+         g->gid = grp->gr_gid;
+ 
++#if ENABLE_GSHADOW
+         if (sgrp) {
+                 if (hashed_password_valid(sgrp->sg_passwd)) {
+                         g->hashed_password = strv_new(sgrp->sg_passwd);
+@@ -51,6 +54,7 @@ int nss_group_to_group_record(
+                 if (!g->administrators)
+                         return -ENOMEM;
+         }
++#endif
+ 
+         r = json_build(&g->json, JSON_BUILD_OBJECT(
+                                        JSON_BUILD_PAIR("groupName", JSON_BUILD_STRING(g->group_name)),
+@@ -76,6 +80,7 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+         assert(ret_sgrp);
+         assert(ret_buffer);
+ 
++#if ENABLE_GSHADOW
+         for (;;) {
+                 _cleanup_free_ char *buf = NULL;
+                 struct sgrp sgrp, *result;
+@@ -104,6 +109,9 @@ int nss_sgrp_for_group(const struct group *grp, struct sgrp *ret_sgrp, char **re
+                 buflen *= 2;
+                 buf = mfree(buf);
+         }
++#else
++        return -ESRCH;
++#endif
+ }
+ 
+ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+@@ -111,7 +119,9 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+         struct group grp, *result;
+         bool incomplete = false;
+         size_t buflen = 4096;
++#if ENABLE_GSHADOW
+         struct sgrp sgrp;
++#endif
+         int r;
+ 
+         assert(name);
+@@ -141,6 +151,7 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+                 buf = mfree(buf);
+         }
+ 
++#if ENABLE_GSHADOW
+         r = nss_sgrp_for_group(result, &sgrp, &sbuf);
+         if (r < 0) {
+                 log_debug_errno(r, "Failed to do shadow lookup for group %s, ignoring: %m", result->gr_name);
+@@ -148,6 +159,9 @@ int nss_group_record_by_name(const char *name, GroupRecord **ret) {
+         }
+ 
+         r = nss_group_to_group_record(result, r >= 0 ? &sgrp : NULL, ret);
++#else
++        r = nss_group_to_group_record(result, NULL, ret);
++#endif
+         if (r < 0)
+                 return r;
+ 
+@@ -160,7 +174,9 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
+         struct group grp, *result;
+         bool incomplete = false;
+         size_t buflen = 4096;
++#if ENABLE_GSHADOW
+         struct sgrp sgrp;
++#endif
+         int r;
+ 
+         assert(ret);
+@@ -188,6 +204,7 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
+                 buf = mfree(buf);
+         }
+ 
++#if ENABLE_GSHADOW
+         r = nss_sgrp_for_group(result, &sgrp, &sbuf);
+         if (r < 0) {
+                 log_debug_errno(r, "Failed to do shadow lookup for group %s, ignoring: %m", result->gr_name);
+@@ -195,6 +212,9 @@ int nss_group_record_by_gid(gid_t gid, GroupRecord **ret) {
+         }
+ 
+         r = nss_group_to_group_record(result, r >= 0 ? &sgrp : NULL, ret);
++#else
++        r = nss_group_to_group_record(result, NULL, ret);
++#endif
+         if (r < 0)
+                 return r;
+ 
+diff --git a/src/shared/group-record-nss.h b/src/shared/group-record-nss.h
+index 38b2995178ff..d7d95c44cf11 100644
+--- a/src/shared/group-record-nss.h
++++ b/src/shared/group-record-nss.h
+@@ -2,7 +2,11 @@
+ #pragma once
+ 
+ #include <grp.h>
++#if ENABLE_GSHADOW
+ #include <gshadow.h>
++#else
++struct sgrp;
++#endif
+ 
+ #include "group-record.h"
+ 
+diff --git a/src/shared/userdb.c b/src/shared/userdb.c
+index 92f8796768d7..5d912862f85c 100644
+--- a/src/shared/userdb.c
++++ b/src/shared/userdb.c
+@@ -924,13 +924,16 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+                 if (gr) {
+                         _cleanup_free_ char *buffer = NULL;
+                         bool incomplete = false;
++#if ENABLE_GSHADOW
+                         struct sgrp sgrp;
++#endif
+ 
+                         if (streq_ptr(gr->gr_name, "root"))
+                                 iterator->synthesize_root = false;
+                         if (gr->gr_gid == GID_NOBODY)
+                                 iterator->synthesize_nobody = false;
+ 
++#if ENABLE_GSHADOW
+                         r = nss_sgrp_for_group(gr, &sgrp, &buffer);
+                         if (r < 0) {
+                                 log_debug_errno(r, "Failed to acquire shadow entry for group %s, ignoring: %m", gr->gr_name);
+@@ -938,6 +941,9 @@ int groupdb_iterator_get(UserDBIterator *iterator, GroupRecord **ret) {
+                         }
+ 
+                         r = nss_group_to_group_record(gr, r >= 0 ? &sgrp : NULL, ret);
++#else
++                        r = nss_group_to_group_record(gr, NULL, ret);
++#endif
+                         if (r < 0)
+                                 return r;
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 6eaaec71c533..d098084b2ec6 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From c73a87871df31b4f8d96c9d443759c6f702935f6 Mon Sep 17 00:00:00 2001
+From e9c993816077c1ae67d25d464f2ece2a090f30b8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
@@ -26,10 +26,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  3 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/units/meson.build b/units/meson.build
-index 6a3a0d0dea22..bbb1b78618c3 100644
+index ea91f0cc9ea7..25186f88dfeb 100644
 --- a/units/meson.build
 +++ b/units/meson.build
-@@ -46,8 +46,7 @@ units = [
+@@ -52,8 +52,7 @@ units = [
          ['poweroff.target',                     '',
           'runlevel0.target'],
          ['printer.target',                      ''],
@@ -39,16 +39,16 @@ index 6a3a0d0dea22..bbb1b78618c3 100644
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'runlevel6.target ctrl-alt-del.target'],
-@@ -130,8 +129,7 @@ in_units = [
-         ['systemd-ask-password-console.service', ''],
-         ['systemd-ask-password-wall.service',    ''],
+@@ -161,8 +160,7 @@ in_units = [
+         ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
+         ['rescue.service',                       ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
 -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
 -         'sysinit.target.wants/'],
 +        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
-         ['systemd-boot-system-token.service',    'ENABLE_EFI',
+         ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
 diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
 index 30a6bc991844..4231f3b70fe9 100644
 --- a/units/proc-sys-fs-binfmt_misc.automount
diff --git a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
index f1c7181ef971..4eeec7b7dac1 100644
--- a/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0001-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From f4a0caaea346b70cf5064f9159a53a1b8020071e Mon Sep 17 00:00:00 2001
+From f92fd7e77ed5aab2dda01a20e6891c37f09415d3 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -167,10 +167,10 @@ index 7ff844c78c3a..5c5721d7c2f7 100644
                  STRV_FOREACH(f, files) {
                          k = apply_file(*f, true);
 diff --git a/src/core/main.c b/src/core/main.c
-index c24b696b1663..195be7d2df0d 100644
+index 3c6b66e89c8e..c39ebe56a5b3 100644
 --- a/src/core/main.c
 +++ b/src/core/main.c
-@@ -1303,7 +1303,7 @@ static int bump_unix_max_dgram_qlen(void) {
+@@ -1312,7 +1312,7 @@ static int bump_unix_max_dgram_qlen(void) {
          if (v >= DEFAULT_UNIX_MAX_DGRAM_QLEN)
                  return 0;
  
@@ -179,7 +179,7 @@ index c24b696b1663..195be7d2df0d 100644
          if (r < 0)
                  return log_full_errno(IN_SET(r, -EROFS, -EPERM, -EACCES) ? LOG_DEBUG : LOG_WARNING, r,
                                        "Failed to bump AF_UNIX datagram queue length, ignoring: %m");
-@@ -1527,7 +1527,7 @@ static void initialize_core_pattern(bool skip_setup) {
+@@ -1536,7 +1536,7 @@ static void initialize_core_pattern(bool skip_setup) {
          if (getpid_cached() != 1)
                  return;
  
@@ -228,7 +228,7 @@ index 17e7cd1a009b..87a766771663 100644
                  log_error_errno(r, "Failed to write '%s' to /sys/power/resume: %m", major_minor);
                  return EXIT_FAILURE;
 diff --git a/src/libsystemd/sd-device/sd-device.c b/src/libsystemd/sd-device/sd-device.c
-index f35612fe12bc..20351bf7fa70 100644
+index 1f2451f8e1b4..3f676ec2841a 100644
 --- a/src/libsystemd/sd-device/sd-device.c
 +++ b/src/libsystemd/sd-device/sd-device.c
 @@ -1849,7 +1849,7 @@ _public_ int sd_device_set_sysattr_value(sd_device *device, const char *sysattr,
@@ -241,10 +241,10 @@ index f35612fe12bc..20351bf7fa70 100644
                  if (r == -ELOOP)
                          return -EINVAL;
 diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
-index 69b59948786f..b4973c596d48 100644
+index 52a7ea3c77e9..9703de0dabee 100644
 --- a/src/login/logind-dbus.c
 +++ b/src/login/logind-dbus.c
-@@ -1322,7 +1322,7 @@ static int trigger_device(Manager *m, sd_device *d) {
+@@ -1339,7 +1339,7 @@ static int trigger_device(Manager *m, sd_device *d) {
                  if (!t)
                          return -ENOMEM;
  
@@ -267,10 +267,10 @@ index f5048d9473cb..b6383ab5c97e 100644
                  log_error_errno(r, "Failed to move process: %m");
                  goto finish;
 diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
-index 873a76596f0b..4e496548bb94 100644
+index 734dee1130e0..71add9a055d2 100644
 --- a/src/nspawn/nspawn.c
 +++ b/src/nspawn/nspawn.c
-@@ -2425,7 +2425,7 @@ static int reset_audit_loginuid(void) {
+@@ -2440,7 +2440,7 @@ static int reset_audit_loginuid(void) {
          if (streq(p, "4294967295"))
                  return 0;
  
@@ -279,7 +279,7 @@ index 873a76596f0b..4e496548bb94 100644
          if (r < 0) {
                  log_error_errno(r,
                                  "Failed to reset audit login UID. This probably means that your kernel is too\n"
-@@ -3633,13 +3633,13 @@ static int setup_uid_map(pid_t pid) {
+@@ -3665,13 +3665,13 @@ static int setup_uid_map(pid_t pid) {
  
          xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
          xsprintf(line, UID_FMT " " UID_FMT " " UID_FMT "\n", 0, arg_uid_shift, arg_uid_range);
@@ -318,10 +318,10 @@ index e8398cbde5ba..ba682ec0c9e7 100644
                                  log_debug_errno(r, "Failed to %s controller %s for %s (%s): %m",
                                                  FLAGS_SET(mask, bit) ? "enable" : "disable", n, p, fs);
 diff --git a/src/shared/sysctl-util.c b/src/shared/sysctl-util.c
-index 12fb3ef7ea0e..132ac847c091 100644
+index 8543dbd2d05f..76162599817e 100644
 --- a/src/shared/sysctl-util.c
 +++ b/src/shared/sysctl-util.c
-@@ -87,7 +87,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
+@@ -93,7 +93,7 @@ int sysctl_write_ip_property(int af, const char *ifname, const char *property, c
  
          log_debug("Setting '%s' to '%s'", p, value);
  
@@ -331,28 +331,28 @@ index 12fb3ef7ea0e..132ac847c091 100644
  
  int sysctl_read(const char *property, char **content) {
 diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
-index 89b80367f8f4..33dbb21364d0 100644
+index fbfddc0262fc..7cc2902154e9 100644
 --- a/src/sleep/sleep.c
 +++ b/src/sleep/sleep.c
-@@ -45,7 +45,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+@@ -47,7 +47,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          assert(hibernate_location->swap);
-         assert(hibernate_location->resume);
  
--        r = write_string_file("/sys/power/resume", hibernate_location->resume, WRITE_STRING_FILE_DISABLE_BUFFER);
-+        r = write_string_file("/sys/power/resume", hibernate_location->resume, 0);
+         xsprintf(resume_str, "%u:%u", major(hibernate_location->devno), minor(hibernate_location->devno));
+-        r = write_string_file("/sys/power/resume", resume_str, WRITE_STRING_FILE_DISABLE_BUFFER);
++        r = write_string_file("/sys/power/resume", resume_str, 0);
          if (r < 0)
                  return log_debug_errno(r, "Failed to write partition device to /sys/power/resume for '%s': '%s': %m",
-                                        hibernate_location->swap->device, hibernate_location->resume);
-@@ -72,7 +72,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
+                                        hibernate_location->swap->device, resume_str);
+@@ -74,7 +74,7 @@ static int write_hibernate_location_info(const HibernateLocation *hibernate_loca
          }
  
-         xsprintf(offset_str, "%" PRIu64, hibernate_location->resume_offset);
+         xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
 -        r = write_string_file("/sys/power/resume_offset", offset_str, WRITE_STRING_FILE_DISABLE_BUFFER);
 +        r = write_string_file("/sys/power/resume_offset", offset_str, 0);
          if (r < 0)
                  return log_debug_errno(r, "Failed to write swap file offset to /sys/power/resume_offset for '%s': '%s': %m",
                                         hibernate_location->swap->device, offset_str);
-@@ -89,7 +89,7 @@ static int write_mode(char **modes) {
+@@ -91,7 +91,7 @@ static int write_mode(char **modes) {
          STRV_FOREACH(mode, modes) {
                  int k;
  
@@ -361,7 +361,7 @@ index 89b80367f8f4..33dbb21364d0 100644
                  if (k >= 0)
                          return 0;
  
-@@ -108,7 +108,7 @@ static int write_state(FILE **f, char **states) {
+@@ -110,7 +110,7 @@ static int write_state(FILE **f, char **states) {
          STRV_FOREACH(state, states) {
                  int k;
  
@@ -384,7 +384,7 @@ index 60c68b5029cf..fdca03d3d42c 100644
                          bool ignore = IN_SET(r, -ENOENT, -EACCES, -ENODEV, -EROFS);
  
 diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 7678331897f5..6871cde7aa65 100644
+index ca65474f2763..38780681431a 100644
 --- a/src/udev/udevd.c
 +++ b/src/udev/udevd.c
 @@ -1089,7 +1089,7 @@ static int synthesize_change_one(sd_device *dev, const char *syspath) {
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 6b85ff0f8915..a5e41bfabf23 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 49501c80d32c1bc5ecb07f40c324feb82af0b057 Mon Sep 17 00:00:00 2001
+From 3eb12a6ba0bce149717eaabeb1505d379b3d705a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
@@ -40,7 +40,7 @@ index e029f8646eb0..27d68b341cf3 100644
 -                qsort_r_safe((p), (n), sizeof((p)[0]), (__compar_d_fn_t) _func_, userdata); \
 -        })
 diff --git a/src/libsystemd/sd-hwdb/hwdb-util.c b/src/libsystemd/sd-hwdb/hwdb-util.c
-index c83575c7c876..72f8f3a05048 100644
+index d790e8fd0b19..42e0fd7c9b3c 100644
 --- a/src/libsystemd/sd-hwdb/hwdb-util.c
 +++ b/src/libsystemd/sd-hwdb/hwdb-util.c
 @@ -128,9 +128,13 @@ static void trie_free(struct trie *trie) {
@@ -84,10 +84,10 @@ index c83575c7c876..72f8f3a05048 100644
  }
  
 diff --git a/src/shared/format-table.c b/src/shared/format-table.c
-index 4617ae8badc4..17d6b9616256 100644
+index 425013046491..33c1c5a12d43 100644
 --- a/src/shared/format-table.c
 +++ b/src/shared/format-table.c
-@@ -1109,31 +1109,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
+@@ -1164,31 +1164,33 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
          return CMP(index_a, index_b);
  }
  
@@ -131,7 +131,7 @@ index 4617ae8badc4..17d6b9616256 100644
          }
  
          /* Order identical lines by the order there were originally added in */
-@@ -1533,7 +1535,12 @@ int table_print(Table *t, FILE *f) {
+@@ -1690,7 +1692,12 @@ int table_print(Table *t, FILE *f) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
@@ -145,7 +145,7 @@ index 4617ae8badc4..17d6b9616256 100644
          }
  
          if (t->display_map)
-@@ -1997,7 +2004,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
+@@ -2236,7 +2243,12 @@ int table_to_json(Table *t, JsonVariant **ret) {
                  for (i = 0; i < n_rows; i++)
                          sorted[i] = i * t->n_columns;
  
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 71e52c49674e..0dea93327025 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From 142dcaef0d24a78d3c0c94168b66fdf234497e97 Mon Sep 17 00:00:00 2001
+From 8af168cefca01f8f2da336f1c82620c284dc74f2 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:04:21 +0800
 Subject: [PATCH] add fallback parse_printf_format implementation
@@ -23,10 +23,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  create mode 100644 src/basic/parse-printf-format.h
 
 diff --git a/meson.build b/meson.build
-index 21d6968abdf4..bab0bf84806c 100644
+index fc216d22da24..a25996803d64 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -628,6 +628,7 @@ endif
+@@ -640,6 +640,7 @@ endif
  foreach header : ['crypt.h',
                    'linux/memfd.h',
                    'linux/vm_sockets.h',
@@ -35,10 +35,10 @@ index 21d6968abdf4..bab0bf84806c 100644
                    'valgrind/memcheck.h',
                    'valgrind/valgrind.h',
 diff --git a/src/basic/meson.build b/src/basic/meson.build
-index f70d1b8bf8a0..4cd57373e10d 100644
+index ccb22e159505..25c77ea6bc0e 100644
 --- a/src/basic/meson.build
 +++ b/src/basic/meson.build
-@@ -311,6 +311,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
+@@ -313,6 +313,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
  endforeach
  
  basic_sources += generated_gperf_headers
diff --git a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
index 685df01a10ee..d394444c1c6e 100644
--- a/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
@@ -1,4 +1,4 @@
-From 6883ffc99168056101c667c6421f8353d5ad675a Mon Sep 17 00:00:00 2001
+From dbe8b3ee45580defeefcac929b897c5437ffc50b Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
@@ -38,7 +38,7 @@ index 27812dfd5923..0ab40731ea93 100644
  typedef struct CPUSet {
          cpu_set_t *set;
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index a710db5370b8..d1601ad9292d 100644
+index c65062d2562c..8b6eefa9cdae 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
@@ -47,8 +47,8 @@ index a710db5370b8..d1601ad9292d 100644
 -#include <sched.h>
  #include <stdio.h>
  #include <string.h>
- 
-@@ -8,6 +7,7 @@
+ #include <sys/types.h>
+@@ -10,6 +9,7 @@
  #include <float.h>
  
  #include "time-util.h"
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index aa4bb063c92d..ca4f0d5d623f 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 9597196234a0ccf30d7f65cf185a8c24cb3158b3 Mon Sep 17 00:00:00 2001
+From 85dcaad8f38521ec3dc580794072b601900eed84 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -39,6 +39,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/coredump/coredump-vacuum.c             |  1 +
  src/journal-remote/journal-remote-main.c   |  1 +
  src/journal/journalctl.c                   |  1 +
+ src/journal/sd-journal.c                   |  1 +
  src/libsystemd/sd-bus/bus-message.c        |  1 +
  src/libsystemd/sd-bus/bus-objects.c        |  1 +
  src/libsystemd/sd-bus/bus-socket.c         |  1 +
@@ -65,16 +66,16 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
  src/udev/udev-builtin-path_id.c            |  1 +
  src/udev/udev-event.c                      |  1 +
  src/udev/udev-rules.c                      |  1 +
- 48 files changed, 59 insertions(+)
+ 49 files changed, 60 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index bab0bf84806c..f4e1736cf09e 100644
+index a25996803d64..72b305b5ab58 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -517,6 +517,7 @@ foreach ident : [
-                                  #include <unistd.h>'''],
-         ['get_mempolicy',     '''#include <stdlib.h>
-                                  #include <unistd.h>'''],
+@@ -529,6 +529,7 @@ foreach ident : [
+                                  #include <unistd.h>
+                                  #include <signal.h>
+                                  #include <sys/wait.h>'''],
 +        ['strndupa' ,         '''#include <string.h>'''],
  ]
  
@@ -160,7 +161,7 @@ index fa682d4c438e..37902551490a 100644
  int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
          struct stat st;
 diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
-index aec6099c9cc1..744b9b134ce4 100644
+index e0094b0f370a..00da6518124b 100644
 --- a/src/basic/parse-util.c
 +++ b/src/basic/parse-util.c
 @@ -18,6 +18,7 @@
@@ -172,7 +173,7 @@ index aec6099c9cc1..744b9b134ce4 100644
  int parse_boolean(const char *v) {
          if (!v)
 diff --git a/src/basic/proc-cmdline.c b/src/basic/proc-cmdline.c
-index d3d99d9a7f90..e0b9efad03a2 100644
+index 1af58717c686..c1020f4611d4 100644
 --- a/src/basic/proc-cmdline.c
 +++ b/src/basic/proc-cmdline.c
 @@ -15,6 +15,7 @@
@@ -196,7 +197,7 @@ index 7aaf95bfced2..da7e836f143e 100644
  int procfs_tasks_get_limit(uint64_t *ret) {
          _cleanup_free_ char *value = NULL;
 diff --git a/src/basic/selinux-util.c b/src/basic/selinux-util.c
-index f35e760233be..e4b0a8aa445e 100644
+index 1095cb426cce..806ef4bd97a9 100644
 --- a/src/basic/selinux-util.c
 +++ b/src/basic/selinux-util.c
 @@ -26,6 +26,7 @@
@@ -206,9 +207,9 @@ index f35e760233be..e4b0a8aa445e 100644
 +#include "missing_stdlib.h"
  
  #if HAVE_SELINUX
- DEFINE_TRIVIAL_CLEANUP_FUNC(char*, freecon);
+ DEFINE_TRIVIAL_CLEANUP_FUNC(context_t, context_free);
 diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index bfe2c60da173..d7ef30d2fe52 100644
+index 105584e2e72f..eb0bed47dac3 100644
 --- a/src/basic/time-util.c
 +++ b/src/basic/time-util.c
 @@ -26,6 +26,7 @@
@@ -244,7 +245,7 @@ index 27dc9e43c3e2..b1a83023600b 100644
  BUS_DEFINE_PROPERTY_GET(bus_property_get_tasks_max, "t", TasksMax, tasks_max_resolve);
  
 diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
-index 1d0bc1ede3cb..313654913345 100644
+index d8ba3e5d9241..729e13fda64c 100644
 --- a/src/core/dbus-execute.c
 +++ b/src/core/dbus-execute.c
 @@ -41,6 +41,7 @@
@@ -268,7 +269,7 @@ index 7862beaacb6d..3b1ea53a5f0d 100644
  int bus_property_get_triggered_unit(
                  sd_bus *bus,
 diff --git a/src/core/execute.c b/src/core/execute.c
-index abc164ff5bef..f04b8ba05002 100644
+index 89dbf6fbd2c1..9762dc57443c 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
 @@ -88,6 +88,7 @@
@@ -292,7 +293,7 @@ index 09ccd613e32c..f4e64fa283e9 100644
  #if HAVE_KMOD
  #include "module-util.h"
 diff --git a/src/core/service.c b/src/core/service.c
-index 49ad166c2604..c3b14067e201 100644
+index 17f27a4abce3..e5dcc532d0ce 100644
 --- a/src/core/service.c
 +++ b/src/core/service.c
 @@ -41,6 +41,7 @@
@@ -316,10 +317,10 @@ index 35885dfb47c4..bb9f0660a6a0 100644
  #define DEFAULT_MAX_USE_LOWER (uint64_t) (1ULL*1024ULL*1024ULL)           /* 1 MiB */
  #define DEFAULT_MAX_USE_UPPER (uint64_t) (4ULL*1024ULL*1024ULL*1024ULL)   /* 4 GiB */
 diff --git a/src/journal-remote/journal-remote-main.c b/src/journal-remote/journal-remote-main.c
-index ac2bf648d2af..06c86f0201af 100644
+index 88e42d3a984b..0f08376e5399 100644
 --- a/src/journal-remote/journal-remote-main.c
 +++ b/src/journal-remote/journal-remote-main.c
-@@ -21,6 +21,7 @@
+@@ -22,6 +22,7 @@
  #include "stat-util.h"
  #include "string-table.h"
  #include "strv.h"
@@ -328,19 +329,31 @@ index ac2bf648d2af..06c86f0201af 100644
  #define PRIV_KEY_FILE CERTIFICATE_ROOT "/private/journal-remote.pem"
  #define CERT_FILE     CERTIFICATE_ROOT "/certs/journal-remote.pem"
 diff --git a/src/journal/journalctl.c b/src/journal/journalctl.c
-index 95b6bfee172a..e0bcfb9d4233 100644
+index e5feec83bce6..c3aec1e219d7 100644
 --- a/src/journal/journalctl.c
 +++ b/src/journal/journalctl.c
-@@ -68,6 +68,7 @@
+@@ -69,6 +69,7 @@
  #include "unit-name.h"
  #include "user-util.h"
  #include "varlink.h"
 +#include "missing_stdlib.h"
  
  #define DEFAULT_FSS_INTERVAL_USEC (15*USEC_PER_MINUTE)
+ #define PROCESS_INOTIFY_INTERVAL 1024   /* Every 1,024 messages processed */
+diff --git a/src/journal/sd-journal.c b/src/journal/sd-journal.c
+index 3fa98dfda237..e655d77e714a 100644
+--- a/src/journal/sd-journal.c
++++ b/src/journal/sd-journal.c
+@@ -40,6 +40,7 @@
+ #include "string-util.h"
+ #include "strv.h"
+ #include "syslog-util.h"
++#include "missing_stdlib.h"
+ 
+ #define JOURNAL_FILES_MAX 7168
  
 diff --git a/src/libsystemd/sd-bus/bus-message.c b/src/libsystemd/sd-bus/bus-message.c
-index eb029e445326..8da2c5d51a75 100644
+index 73127dfe0253..cc8635dea591 100644
 --- a/src/libsystemd/sd-bus/bus-message.c
 +++ b/src/libsystemd/sd-bus/bus-message.c
 @@ -21,6 +21,7 @@
@@ -352,7 +365,7 @@ index eb029e445326..8da2c5d51a75 100644
  static int message_append_basic(sd_bus_message *m, char type, const void *p, const void **stored);
  
 diff --git a/src/libsystemd/sd-bus/bus-objects.c b/src/libsystemd/sd-bus/bus-objects.c
-index ae643cacc740..f766e235206d 100644
+index 6d140348ec4c..9126b8801bc5 100644
 --- a/src/libsystemd/sd-bus/bus-objects.c
 +++ b/src/libsystemd/sd-bus/bus-objects.c
 @@ -13,6 +13,7 @@
@@ -376,7 +389,7 @@ index 18d30d010a20..be2ab703f8ed 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index 058492a83eec..54c896f572b9 100644
+index 7ad03680f48d..b9d2181e4910 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -41,6 +41,7 @@
@@ -400,7 +413,7 @@ index 8de0a859ee94..58044b6ba908 100644
  #define MAX_SIZE (2*1024*1024)
  
 diff --git a/src/locale/keymap-util.c b/src/locale/keymap-util.c
-index 519dd0d188cf..a8f536915bb2 100644
+index 30669a9359e5..6544b3722099 100644
 --- a/src/locale/keymap-util.c
 +++ b/src/locale/keymap-util.c
 @@ -21,6 +21,7 @@
@@ -412,19 +425,19 @@ index 519dd0d188cf..a8f536915bb2 100644
  static bool startswith_comma(const char *s, const char *prefix) {
          s = startswith(s, prefix);
 diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
-index aa6e5ea7aca8..c439c21b2872 100644
+index 84bea21ab7be..49720c7f742e 100644
 --- a/src/login/pam_systemd.c
 +++ b/src/login/pam_systemd.c
-@@ -28,6 +28,7 @@
- #include "hostname-util.h"
+@@ -31,6 +31,7 @@
+ #include "locale-util.h"
  #include "login-util.h"
  #include "macro.h"
 +#include "missing_stdlib.h"
+ #include "pam-util.h"
  #include "parse-util.h"
  #include "path-util.h"
- #include "process-util.h"
 diff --git a/src/network/generator/network-generator.c b/src/network/generator/network-generator.c
-index 81afa9530762..2c5328f97c63 100644
+index bed1e42697c4..e4847c2beea2 100644
 --- a/src/network/generator/network-generator.c
 +++ b/src/network/generator/network-generator.c
 @@ -13,6 +13,7 @@
@@ -460,10 +473,10 @@ index 364356da5622..47d4ea44e40f 100644
  NSS_GETHOSTBYNAME_PROTOTYPES(mymachines);
  NSS_GETPW_PROTOTYPES(mymachines);
 diff --git a/src/portable/portable.c b/src/portable/portable.c
-index 34b123e84692..5a48504d00ac 100644
+index e18826ab2685..d9f4b81d8937 100644
 --- a/src/portable/portable.c
 +++ b/src/portable/portable.c
-@@ -29,6 +29,7 @@
+@@ -31,6 +31,7 @@
  #include "strv.h"
  #include "tmpfile-util.h"
  #include "user-util.h"
@@ -472,10 +485,10 @@ index 34b123e84692..5a48504d00ac 100644
  static const char profile_dirs[] = CONF_PATHS_NULSTR("systemd/portable/profile");
  
 diff --git a/src/resolve/resolvectl.c b/src/resolve/resolvectl.c
-index 0a96a18b3836..432d6ebc3730 100644
+index f20e8c44b8bc..9f6c4e8f49a7 100644
 --- a/src/resolve/resolvectl.c
 +++ b/src/resolve/resolvectl.c
-@@ -31,6 +31,7 @@
+@@ -33,6 +33,7 @@
  #include "strv.h"
  #include "terminal-util.h"
  #include "verbs.h"
@@ -496,7 +509,7 @@ index b21fe393265f..af2640005c1d 100644
  struct CGroupInfo {
          char *cgroup_path;
 diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
-index 22a15493d7f3..3f4c51975675 100644
+index 28d85944a8a7..4743a84a417e 100644
 --- a/src/shared/bus-unit-util.c
 +++ b/src/shared/bus-unit-util.c
 @@ -34,6 +34,7 @@
@@ -508,10 +521,10 @@ index 22a15493d7f3..3f4c51975675 100644
  int bus_parse_unit_info(sd_bus_message *message, UnitInfo *u) {
          assert(message);
 diff --git a/src/shared/bus-util.c b/src/shared/bus-util.c
-index aea46d311996..223426298144 100644
+index 8e6a6e2ce2de..0cbf4b1997df 100644
 --- a/src/shared/bus-util.c
 +++ b/src/shared/bus-util.c
-@@ -34,6 +34,7 @@
+@@ -30,6 +30,7 @@
  #include "stdio-util.h"
  #include "strv.h"
  #include "user-util.h"
@@ -544,10 +557,10 @@ index 7c4fc7021dec..3fbaf5a63969 100644
  enum {
          IMPORTER_STATE_LINE = 0,    /* waiting to read, or reading line */
 diff --git a/src/shared/logs-show.c b/src/shared/logs-show.c
-index 95b2e3376e9a..facc23aaecd5 100644
+index 2bfd0b60c26b..6a1bb3a0760f 100644
 --- a/src/shared/logs-show.c
 +++ b/src/shared/logs-show.c
-@@ -37,6 +37,7 @@
+@@ -39,6 +39,7 @@
  #include "time-util.h"
  #include "utf8.h"
  #include "util.h"
@@ -592,7 +605,7 @@ index 7cb7d8a477e9..8e7d7f9e7ca6 100644
  static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
          assert(range);
 diff --git a/src/socket-proxy/socket-proxyd.c b/src/socket-proxy/socket-proxyd.c
-index 2fb9c854fa50..58cef31458f7 100644
+index 2ee6fc2f0a6a..4a9934f9c14d 100644
 --- a/src/socket-proxy/socket-proxyd.c
 +++ b/src/socket-proxy/socket-proxyd.c
 @@ -26,6 +26,7 @@
@@ -628,7 +641,7 @@ index ca38f5608791..9d8cf4d2807b 100644
  _printf_(2,3)
  static void path_prepend(char **path, const char *fmt, ...) {
 diff --git a/src/udev/udev-event.c b/src/udev/udev-event.c
-index 58d484280aa5..90eab6806b55 100644
+index eb51139e519c..977cc16e9d7c 100644
 --- a/src/udev/udev-event.c
 +++ b/src/udev/udev-event.c
 @@ -34,6 +34,7 @@
@@ -640,7 +653,7 @@ index 58d484280aa5..90eab6806b55 100644
  typedef struct Spawn {
          sd_device *device;
 diff --git a/src/udev/udev-rules.c b/src/udev/udev-rules.c
-index 6168b332d3b2..245fe0a64d22 100644
+index b9b350d1ef7a..2c114cc77572 100644
 --- a/src/udev/udev-rules.c
 +++ b/src/udev/udev-rules.c
 @@ -30,6 +30,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index ea003fd7dab7..9142d7b45c8d 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From 3932ce7f6c8ace5e1210aad20e1a141cb29329b1 Mon Sep 17 00:00:00 2001
+From 47818052121d135632f5e46c369e3e4706a0f9e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
@@ -53,7 +53,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  19 files changed, 18 insertions(+), 4 deletions(-)
 
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index 5417ba8c5feb..d3aba928dd96 100644
+index eac2e725cce7..1beae7ba91cc 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -65,7 +65,7 @@ index 5417ba8c5feb..d3aba928dd96 100644
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
-index a55460f03407..6f9cd527c800 100644
+index e35127a4cd2e..4f6ad9ef5886 100644
 --- a/src/libsystemd/sd-netlink/netlink-types.c
 +++ b/src/libsystemd/sd-netlink/netlink-types.c
 @@ -3,6 +3,7 @@
@@ -77,7 +77,7 @@ index a55460f03407..6f9cd527c800 100644
  #include <linux/netlink.h>
  #include <linux/rtnetlink.h>
 diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
-index 3b2ac3829859..760ccb445cd0 100644
+index a2990452af17..5af350883c28 100644
 --- a/src/machine/machine-dbus.c
 +++ b/src/machine/machine-dbus.c
 @@ -3,6 +3,7 @@
@@ -89,7 +89,7 @@ index 3b2ac3829859..760ccb445cd0 100644
  /* When we include libgen.h because we need dirname() we immediately
   * undefine basename() since libgen.h defines it as a macro to the POSIX
 diff --git a/src/network/netdev/bond.c b/src/network/netdev/bond.c
-index 185b155440e7..dc1cd236c814 100644
+index 8df39e35843f..8d697894f970 100644
 --- a/src/network/netdev/bond.c
 +++ b/src/network/netdev/bond.c
 @@ -1,5 +1,6 @@
@@ -100,7 +100,7 @@ index 185b155440e7..dc1cd236c814 100644
  #include "bond.h"
  #include "conf-parser.h"
 diff --git a/src/network/netdev/bridge.c b/src/network/netdev/bridge.c
-index 59a40faef8fa..8e821a3216b3 100644
+index 6b8f9944612e..7f81ec25c407 100644
 --- a/src/network/netdev/bridge.c
 +++ b/src/network/netdev/bridge.c
 @@ -1,5 +1,6 @@
@@ -111,7 +111,7 @@ index 59a40faef8fa..8e821a3216b3 100644
  
  #include "bridge.h"
 diff --git a/src/network/netdev/macsec.c b/src/network/netdev/macsec.c
-index 25dc23ff0338..f20d11fbcf53 100644
+index 7d1fec3afe6d..e948a335336d 100644
 --- a/src/network/netdev/macsec.c
 +++ b/src/network/netdev/macsec.c
 @@ -1,5 +1,6 @@
@@ -134,7 +134,7 @@ index 09a5f4822e03..873299b1f98a 100644
  #include "bond.h"
  #include "bridge.h"
 diff --git a/src/network/netdev/netdev.c b/src/network/netdev/netdev.c
-index 6908c4e811b0..e0d8c459ab63 100644
+index f8121a48ed92..437f411c61e8 100644
 --- a/src/network/netdev/netdev.c
 +++ b/src/network/netdev/netdev.c
 @@ -1,5 +1,6 @@
@@ -145,7 +145,7 @@ index 6908c4e811b0..e0d8c459ab63 100644
  #include <netinet/in.h>
  
 diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
-index c3c5d535ac66..ebea408c89a8 100644
+index 41f09287f2b7..b67ce4fc8844 100644
 --- a/src/network/networkd-brvlan.c
 +++ b/src/network/networkd-brvlan.c
 @@ -4,6 +4,7 @@
@@ -157,7 +157,7 @@ index c3c5d535ac66..ebea408c89a8 100644
  #include <stdbool.h>
  
 diff --git a/src/network/networkd-dhcp-common.c b/src/network/networkd-dhcp-common.c
-index 6465a8cfe9c7..bd4b2cdfac15 100644
+index 8664d8cdc0d4..e9f91f74c1a1 100644
 --- a/src/network/networkd-dhcp-common.c
 +++ b/src/network/networkd-dhcp-common.c
 @@ -4,6 +4,7 @@
@@ -169,21 +169,22 @@ index 6465a8cfe9c7..bd4b2cdfac15 100644
  #include "parse-util.h"
  #include "string-table.h"
 diff --git a/src/network/networkd-dhcp4.c b/src/network/networkd-dhcp4.c
-index 8ca87d99d4db..a66284896cf3 100644
+index 13e3e32f40e8..5394399c9150 100644
 --- a/src/network/networkd-dhcp4.c
 +++ b/src/network/networkd-dhcp4.c
-@@ -1,8 +1,8 @@
+@@ -1,9 +1,9 @@
  /* SPDX-License-Identifier: LGPL-2.1+ */
  
 +#include <netinet/if_ether.h>
  #include <netinet/in.h>
+ #include <netinet/ip.h>
  #include <linux/if.h>
 -#include <linux/if_arp.h>
  
  #include "alloc-util.h"
  #include "dhcp-client-internal.h"
 diff --git a/src/network/networkd-dhcp6.c b/src/network/networkd-dhcp6.c
-index 647623ac3778..325c641c6231 100644
+index 7304270c60b1..099064f64715 100644
 --- a/src/network/networkd-dhcp6.c
 +++ b/src/network/networkd-dhcp6.c
 @@ -3,9 +3,9 @@
@@ -198,7 +199,7 @@ index 647623ac3778..325c641c6231 100644
  
  #include "sd-dhcp6-client.h"
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 2e60adbf7818..05aa8672d585 100644
+index 99d4b29c31ec..e8b467d6ac09 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
 @@ -1,8 +1,8 @@
@@ -212,7 +213,7 @@ index 2e60adbf7818..05aa8672d585 100644
  
  #include "alloc-util.h"
 diff --git a/src/network/networkd-network.c b/src/network/networkd-network.c
-index 6e443975f171..d1aab0ca5ba2 100644
+index 2e716b291e97..56f18cea57fe 100644
 --- a/src/network/networkd-network.c
 +++ b/src/network/networkd-network.c
 @@ -1,5 +1,6 @@
@@ -232,7 +233,7 @@ index 25b939639775..530e4928835c 100644
  #include "dhcp6-internal.h"
  #include "dhcp6-protocol.h"
 diff --git a/src/shared/ethtool-util.c b/src/shared/ethtool-util.c
-index 3119b2b92e3b..927ddd067eef 100644
+index 00a71d64a638..4593e89120b8 100644
 --- a/src/shared/ethtool-util.c
 +++ b/src/shared/ethtool-util.c
 @@ -1,5 +1,6 @@
@@ -243,19 +244,19 @@ index 3119b2b92e3b..927ddd067eef 100644
  #include <sys/ioctl.h>
  #include <linux/ethtool.h>
 diff --git a/src/shared/ethtool-util.h b/src/shared/ethtool-util.h
-index d408bcd90a0b..7a1e399af023 100644
+index c1d5d7590ef9..b3e018bf76e9 100644
 --- a/src/shared/ethtool-util.h
 +++ b/src/shared/ethtool-util.h
-@@ -2,6 +2,7 @@
- #pragma once
+@@ -3,6 +3,7 @@
  
  #include <macro.h>
+ #include <net/ethernet.h>
 +#include <netinet/if_ether.h>
  #include <linux/ethtool.h>
  
  #include "conf-parser.h"
 diff --git a/src/udev/net/link-config.c b/src/udev/net/link-config.c
-index 7b07e2f38fa8..18680a8e5484 100644
+index 0332e99269c9..ff3aead4a779 100644
 --- a/src/udev/net/link-config.c
 +++ b/src/udev/net/link-config.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 0de1121906d3..5ee501f23596 100644
--- a/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0010-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From 5166a6657570d4072cdce118621791e4a8186e07 Mon Sep 17 00:00:00 2001
+From eed7427db98cc01db7e9b3479655d68b044bc85b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
@@ -12,7 +12,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 9b6c4c31f713..24fec5ecb53a 100644
+index 5de366f830e8..644f53aee005 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
 @@ -18,6 +18,9 @@
@@ -25,7 +25,7 @@ index 9b6c4c31f713..24fec5ecb53a 100644
  
  #include "alloc-util.h"
  #include "architecture.h"
-@@ -1114,11 +1117,15 @@ void reset_cached_pid(void) {
+@@ -1116,11 +1119,15 @@ void reset_cached_pid(void) {
          cached_pid = CACHED_PID_UNSET;
  }
  
diff --git a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
index e00600ab7c32..e5d9515e8639 100644
--- a/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0011-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From f6df7f25a6bb00d5540915216adfff8afefec2b0 Mon Sep 17 00:00:00 2001
+From 4aa91347ae975051dbe4dd2f98a1f4f459f2604f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
@@ -28,10 +28,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  3 files changed, 8 insertions(+), 14 deletions(-)
 
 diff --git a/src/basic/format-util.h b/src/basic/format-util.h
-index 59622508a333..779b6826d50e 100644
+index c47fa76ea8ff..14a78d9f5fd0 100644
 --- a/src/basic/format-util.h
 +++ b/src/basic/format-util.h
-@@ -44,13 +44,7 @@
+@@ -32,13 +32,7 @@ assert_cc(sizeof(gid_t) == sizeof(uint32_t));
  #  define PRI_TIMEX "li"
  #endif
  
@@ -78,10 +78,10 @@ index 2dc13eabc30d..0633cc67f417 100644
          return 1;
  }
 diff --git a/src/core/execute.c b/src/core/execute.c
-index f04b8ba05002..084cf1420078 100644
+index 9762dc57443c..4a3421bb3ee6 100644
 --- a/src/core/execute.c
 +++ b/src/core/execute.c
-@@ -4455,9 +4455,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+@@ -4567,9 +4567,9 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
          for (i = 0; i < RLIM_NLIMITS; i++)
                  if (c->rlimit[i]) {
                          fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
diff --git a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index aa23c7ab7d08..049096d2a971 100644
--- a/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0014-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From 7874912817b5ac7ed7f8557359a12d9d4b2f53eb Mon Sep 17 00:00:00 2001
+From 62fac5e3ff0fccd329cdc49605258b6d0e573a3e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
@@ -13,10 +13,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 7fc16a62b656..a710db5370b8 100644
+index 1020e0cb3153..c65062d2562c 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
-@@ -42,8 +42,10 @@ int main(void) {
+@@ -44,8 +44,10 @@ int main(void) {
          info(unsigned);
          info(long unsigned);
          info(long long unsigned);
@@ -27,7 +27,7 @@ index 7fc16a62b656..a710db5370b8 100644
  
          info(float);
          info(double);
-@@ -61,7 +63,9 @@ int main(void) {
+@@ -63,7 +65,9 @@ int main(void) {
          info(ssize_t);
          info(time_t);
          info(usec_t);
diff --git a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index 56f45381de0a..1934b783dc39 100644
--- a/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From a6f3359042219abaa8ae06dfcce41a4721e8c21f Mon Sep 17 00:00:00 2001
+From bb28a9c870bb47dcdb1ccebaa8e3a5a86730a244 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/basic/process-util.c b/src/basic/process-util.c
-index 24fec5ecb53a..642b02443c85 100644
+index 644f53aee005..acaf13591396 100644
 --- a/src/basic/process-util.c
 +++ b/src/basic/process-util.c
-@@ -1492,7 +1492,7 @@ int set_oom_score_adjust(int value) {
+@@ -1500,7 +1500,7 @@ int set_oom_score_adjust(int value) {
          sprintf(t, "%i", value);
  
          return write_string_file("/proc/self/oom_score_adj", t,
@@ -36,4 +36,4 @@ index 24fec5ecb53a..642b02443c85 100644
 +                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
  }
  
- static const char *const ioprio_class_table[] = {
+ int pidfd_get_pid(int fd, pid_t *ret) {
diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_245.2.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_244.3.bb
rename to meta/recipes-core/systemd/systemd_245.2.bb
index ad148628715a..9e472a1a5ea6 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_245.2.bb
@@ -47,6 +47,7 @@ SRC_URI_MUSL = "\
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
                file://0003-src-basic-copy.c-include-signal.h.patch \
                file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
+               file://0001-Handle-missing-gshadow.patch \
                "
 
 PAM_PLUGINS = " \
@@ -82,6 +83,7 @@ PACKAGECONFIG ??= " \
     sysusers \
     timedated \
     timesyncd \
+    userdb \
     utmp \
     vconsole \
     xz \
@@ -96,6 +98,7 @@ PACKAGECONFIG_remove_libc-musl = " \
     nss-mymachines \
     nss-resolve \
     sysusers \
+    userdb \
     utmp \
 "
 
@@ -173,6 +176,7 @@ PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[usrmerge] = "-Dsplit-usr=false,-Dsplit-usr=true"
 PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
+PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
 PACKAGECONFIG[vconsole] = "-Dvconsole=true,-Dvconsole=false,,${PN}-vconsole-setup"
@@ -493,10 +497,13 @@ FILES_${PN}-extra-utils = "\
 CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
-	${sysconfdir}/systemd/system.conf \
-	${sysconfdir}/systemd/user.conf \
+	${sysconfdir}/systemd/networkd.conf \
+	${sysconfdir}/systemd/pstore.conf \
 	${sysconfdir}/systemd/resolved.conf \
+	${sysconfdir}/systemd/sleep.conf \
+	${sysconfdir}/systemd/system.conf \
 	${sysconfdir}/systemd/timesyncd.conf \
+	${sysconfdir}/systemd/user.conf \
 "
 
 FILES_${PN} = " ${base_bindir}/* \
-- 
2.17.1

