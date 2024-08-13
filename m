Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792B4C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 13:19:43 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.72103.1723555177851108565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 06:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dpZaofEx;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530ae4ef29dso10034761e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723555176; x=1724159976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49DbNpsGulWH8CvwNsY7uDmON1JSqtJWK0KEgKnlLF0=;
        b=dpZaofExCx6eIg5rDINJ0CTbYLcLWTYSyvsUqCdhfZotc1V3RgXvspgqwtQMMow/Pp
         3be2EsmPnv44/yTjrITgjQNCfna5WhiV6/FNWUb/xYbb16Vkf+RFhMySkgEiefq4h2ar
         RAqnLHowM8DUU3w7sVgc/58NEbtH7sstypgRcPzXR98TwrqVVCLMNlG/AK02uXwYmmJF
         pLsTtunr0lnOelHFn9YzJlOhZOvN6JzMKwOAhZKcrHU/B9woWmWsZKQ8lOaxpil90t34
         VOdrRV21XwzzOzytIqBETeETbxwBZYirqi6JZRPdUjK7EtZWteSOGXZxf1TCQnseNywG
         vDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723555176; x=1724159976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49DbNpsGulWH8CvwNsY7uDmON1JSqtJWK0KEgKnlLF0=;
        b=UguQ/tdlfS9ygL3hYlFpeD+kEz8Dhn/tdNLvpLvHgeSmpeApE+VcKtyF40TC+bbm3n
         VvzBMvhUzzNLl6+T5MTCy/xLINENVQA8efFSGhePkcLqNdNHdC3dA+GnOI5v8qOIr6Of
         nE7x9LIi4HBh+BlTxxxtjSkNp6fqUzSicdan+cjHECnGU8P2Tqa6EazXLo4haR4liala
         JJZ15j6H2iDVPLW4AAXOVFd7L5o1Pq4lsZ/SuwZKquweCRXaem4PKHvxD2IhHoFp5IVN
         jUvsY5o761rzYg47X8tOU1oJhf6yC0HBRZXVYg1HPcK/VJELFrOhH6Bkbd+3++AtsdMM
         WpSw==
X-Gm-Message-State: AOJu0Yzv/wVIArvZ9LCt6Lt0zRf/JcvI7U0fEBjikvjgBv85iy0RWayv
	OQk/z6akht2vJr8mriO1wvV+C3i0WyEoNgJ04Sz+riQE3NzqDxWYAsfWESh1uB/i00EXI3U1kif
	/
X-Google-Smtp-Source: AGHT+IEws8tRukIz8PR012k9E+8NdQxRueaORSZ8WphFcbKCSgqh3O8nRjgxItsaytEvPzRbey0z9A==
X-Received: by 2002:ac2:4c42:0:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-53213652f36mr3002519e87.16.1723555175649;
        Tue, 13 Aug 2024 06:19:35 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200ec3ae1sm983501e87.112.2024.08.13.06.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:19:34 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] systemd: update from 256 to 256.4
Date: Tue, 13 Aug 2024 16:19:13 +0300
Message-ID: <20240813131913.65878-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 13:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203279

Changes:

566210c272 meson: Bump version to 256.4
16de138427 mkosi: update debian commit reference
b731debea9 hwdb: update to main@{2024-07-24}
a78a524652 add udev rules for trezor hw wallet devices
b825a8be0b core: reliably check if varlink socket has been deserialized
83c9043727 mkosi: Bump device timeout even more
e60d01bdbf man/systemd-repart: extend description and reword some sentences
766af3f782 Document that MemorySwapMax supports % configuration
1922d49fd6 Make vcs-tag do something useful for non-developer mode as well
5b9ad0bbb8 tools/fetch-distro: switch to the target branch
8334be48a3 tools/fetch-distro: only fetch the configured branch
92890d56e8 tools/update-distro-hash: rename, fetch the repository if appropriate
1f079607f8 Merge pull request #33803 from bluca/v256-stable
e05f93b5c4 mkosi: update arch commit reference
c9d39eea98 mkosi: update fedora commit reference
dbeed95d76 mkosi: Use the Fedora Rawhide spec for CentOS
6108f13fc0 mkosi: Switch back to PKG_SUBDIR instead of symlinks
fd2a6ea0a8 zsh/_networkctl: remove duplicated argument for completion (#31926)
995c702a34 import-creds: when we hit ENOENT on SMBIOS 11 do not even debug log
6a3cb4cd11 core/unit: ignore dropins for masked units completely when checking need_reload
f81659f5f3 test: add a reproducer for #33672
7fcfb73d71 shared: log error when execve fail
7da84cc154 test-execute: ExecStop= and friends should not get credentials
8f58652f5e test: override blocking localed policy in TEST-73-LOCALE
d6f8575f1e meson: fix missing failure if bpf-framework was enabled
e274de4b74 zsh: add varlinkctl completions
cae58967a5 docs: Document how to do stable releases
468b064634 man: Mention Type=oneshot timeout directive
d870f2335b l10n: fix credits for the French translation
8aa9e60f89 sd-device: remove debug log message when dirs are missing
86ec58a55c id128: refuse --app-specific= if we're listing GPT types
b60d5bc1b7 gpt: add more architecture aliases
b786185406 kernel-install: Remove existing loader entries and UKIs
e63ae80a89 bootspec: correct log level for fatal errors
3736e21341 bootspec: implement sorting by tries left/done, to match what sd-boot does
18143edf3e boot: compare filename suffixes without case
78fcf31f08 man: some fixes
bcda6d4637 man: fix typo in unit options section
1747350ffd fsck: do not pull down mount units on soft-reboot
a68188e985 man: fix typo in the alias symlink name
15c236806c vmspawn: define default machines for mips targets
fa2b2da146 path: drop IN_ATTRIB from parent directory watches
35e2f62967 Remove extra period at the end of systemd-bsod's unit description. (#33632)
a40eb432cb test: Set priority for TEST-73-LOCALE
172ffeb813 TEST-06-SELINUX: Disable RuntimeBuildSources=
2fd3514456 test: Add missing --no-rebuild to doc
69c9044525 meson: Bump version to 256.3
16b12506a6 core/cgroup: check root cgroup earlier for unit_get_memory_accounting
06c2ee3979 core/cgroup: make unit_has_host_root_cgroup take const Unit*
15732ee31f core: unify reset_accounting handling
50a0a55066 core: do not drop CGroupRuntime when unit stops, but only on GC
b08b5996d3 core/cgroup: use > 0 comparison rather than == 1
ffd90200b2 core/cgroup: actually make use of the cached accounting values
7684f52839 test-install-root: introduce test case for #33411
a42db16a1c shared/install: correctly report changes in install_info_symlink_alias()
bb83650f96 shared/install: propagate all errors in install_info_apply()
908edce5b6 shared/install: drop unneeded initialization
f414ca0ee3 systemctl: do not try to acquire triggering units for template units
67e0d09368 systemctl: skip triggering unit warning if unit vanished
bb71d5dfb4 man/systemctl: --no-reload is honored by mask/unmask/preset too
7122e226c3 logind-dbus: set gc_mode to USER_GC_BY_PIN when disable linger
5d6bf58cf2 logind-user: take gc_mode into account when reporting user state
bcb13a3fa2 test_ukify: do not use files from /boot
88264411b6 test_ukify: use sha384 in the signing tests
8b3bedd821 test_ukify: add instructions
168b788104 terminal-util: don't issue "ESC c" sequence on reset, but only when erasing the screen
5e4464bb64 mkosi: Bump default device timeout a little
0009ed8ee1 meson: Drop version from 256.3 to v256.2
1354f6194c meson: Drop ~devel suffix from systemd-stable version
fe37213c55 Merge pull request #33774 from DaanDeMeyer/mkosi-backport
677126d300 mkosi: Fix indentation
4c25e572a9 mkosi: Fix typo
400222fa1c mkosi: Drop util-linux from centos/fedora packages
dc3543a391 mkosi: Drop udev from Packages= list
82e2a5f47f mkosi: Fix formatting
11f065d3ee mkosi: Build CentOS Stream 10 images by default
c54eab5dd0 mkosi: Streamline running the integration tests without building systemd
3bde2db7a4 meson: Drop genkey target
baad1c0d0e mkosi: Skip sync script if NO_BUILD is enabled
102ed56c61 mkosi: Remove enforcing=0 from default kernel command line
611e82e660 mkosi: Stop setting apparmor=0
fa7892a690 docs: update mkosi version mentioned in HACKING.md (#33723)
ad444842e0 Merge pull request #33735 from DaanDeMeyer/backport-mkosi
a63e82ca4a repart: Allow overriding fstype per partition designator
9d05f2d559 mkosi: List library packages explicitly in VolatilePackages=
4a55046779 mkosi: Build initrd as a subimage
81bafc8dd9 mkosi: Drop CacheOnly=always from two subimages
1be0b1f54b TEST-13-NSPAWN: make sure we don't load libnss_systemd
0b9df91ce2 mkosi: Disable unique debug source names
89904fc10c systemd-networkd-tests: Skip tests requiring dhcpd if it is not available
c3342c3dc7 TEST-55-OOMD: Remove the opensuse user@ dropin
127f8362c1 mkosi: Install binutils
1a995b9d66 TEST-64-UDEV-STORAGE: Use max_ioqpairs instead of num_queues
367ad876a6 mkosi: Use clang --print-runtime-dir
8b859fa29d mkosi: Extend arch build script comment about symlinks
a8a7a6716e test: do not attempt to set xattr on tmpfs
3fc259ae25 mkosi: Add CI for CentOS Stream 10
945013a092 mkosi: Use squashfs for sysext if mkfs.erofs is not available
480f8fa839 mkosi: Make epel repositories optional for CentOS Stream 9
76e14148f6 mkosi: Introduce build image
abc3a61e59 mkosi: update fedora commit reference
748cd5a703 mkosi: Update to latest
6d07d59237 Merge pull request #33691 from DaanDeMeyer/backport-mkosi
180814f22f mkosi: Switch back to code.opensuse.org for opensuse
976a0d998e test: install split-out sshd-session binary if present
ca97b9a7e6 mkosi: update opensuse commit reference
fef4746218 tools/update-distro-hash: Fix path
54eb9b9301 TEST-06-SELINUX: Various fixes
de6c473b40 mkosi: Don't fail if /var/log/journal does not exist
74475a5169 test: Switch to ncat instead of nc
0c51e28088 TEST-55-OOMD: Switch to stress-ng
0c7d634157 docs: Simplify update commands in HACKING.md
5685a59371 mkosi: Update to latest
370bf11ec4 mkosi: Build a sysext if SYSEXT=1 is specified
0bdb879b3c mkosi: Check for configured build directory if WIPE=1
880c32b7e3 mkosi: Install erofs-utils
cd357eb029 Merge pull request #33674 from DaanDeMeyer/backport-mkosi
c350e02631 mkosi: Fix git commit
00bcc619db mkosi: Adapt configuration to take into account configuration rework
3cf12f4f9a mkosi: use apt pinning for locally built debian/ubuntu packages
7ab51fef1f mkosi: Make .autorelabel file empty
0123dbee1b mkosi: Update to latest
32981c454c build(deps): bump actions/checkout from 4.1.6 to 4.1.7
ab11d7e177 mkosi: policykit-1 was renamed to polkitd
8dd54e5adc mkosi: Use the "default" root filesystem for each distribution
d28aa922fd meson: add option to build systemd-executor "statically"
c3b4032fc3 meson: build libsystemd-core via an intermediate static library
9be2fe707e meson: rename libbasic to libbasic_static
fcbafc3ffe Bump meson version to 256.3~devel
c7e144eb4a Finalize v256.2
709655ea0d mkosi: switch debian to ci/v256-stable branch
e8bbe635cd workflows/labeler: do not set labels on stable backport PRs
aa1eb0b066 labeler: match all mkosi files
32f2b9bba6 labeler: remove matches for dropped files (Makefile)
9a2f16e4ed vmm: make sure we can handle smbios objects without variable part
c32f71aa14 README: update requirements for signed dm-verity
abba1e6bc2 sysusers: handle NSS errors gracefully
df1ed3fbe2 man: fully adopt ~/.local/state/
9d40e5c9c6 man: mention that distinction between /usr/lib/ and /usr/share/ is really about shared *ownership*
8dbb7e2a72 man: drop version info from file hiearchy man page
160b539a9d os-util: avoid matching on the wrong extension-release file
0ff6d2cf47 load-fragment: allow MountImages= with paths starting with /dev
cc4472c31e zsh: add run0 completions
d0a9cf084d docs: Update HACKING
a50e6c5709 README: add missing CONFIG_MEMCG kernel config option for oomd
71de25f2df boot: cover for hardware keys on phones/tablets
243276f008 core/manager: invoke special targets on signal only for system manager
efc44e0c3e core/dbus-manager: refuse SoftReboot() for user managers
399e788553 meson: Define __TARGET_ARCH macros required by bpf
a946258e9d coredump: correctly take tmpfs size into account for compression
05dcd242dc docs: update RELEASE.md to use same repository for stable branches
0a97db8789 docs: Add section to HACKING.md on distribution packages
3c91ea49d2 docs/CODING_STYLE: document that we nowadays prefer (const char*) for func ret type
ea92f16422 test: fix TEST-74-AUX-UTILS.ssh.sh on SUSE
f52475dcf3 test: preserve symlink in inst_recursive()
10b7e0a0af test: fix TEST-24-CRYPTSETUP on SUSE
4f7d6885a1 test: install /etc/hosts
e94e33b566 test: split the resolved test suite into separate test cases
4d561a0e08 mkosi: update debian commit reference
05c9bc547b units: add dep on systemd-logind.service by user@.service
d1cd66ca97 repart: add sections to --help text
c2f74defaa     Conditional PSI check to reflect changes done in 5.13
df990be913 core: try again bind mounting if the destination was already created
24987eb3cc mkfs-util: Set sector size for btrfs as well
e34f436433 repart: Don't set filesystem sector size to 512
3c88c94432 repart: Log more about filesystem sector size
86d47d63b0 core/unit: follow merged units before updating SourcePath= timestamp too
9dec66fc5f meson: use less verbose quoting
6c8e99dedd TEST-54-CREDS: Use UEFI firmware if available
78631dcafd TEST-18-FAILUREACTION: Set auto firmware
71fb49d02c TEST-09-REBOOT: Set auto firmware
938f7b6f29 TEST-06-SELINUX: Explicitly pull in autorelabel.service
37412c952d TEST-70-TPM2: Use UEFI firmware if available
7ee60a8614 resolved: correct parsing of OPT extended RCODEs
711f843e3a TEST-45-TIMEDATE: Use syslog identifier journalctl match
6ead24fcac resolved: allow the full TTL to be used by OPT records
dc0167b674 TEST-64-UDEV-STORAGE: Make nvme_subsystem expected pci symlinks more generic
fb747bd8cd LICENSES/README: expand text to summarize state for binaries and libs
ffc8126cc6 test: pull in multi-user.target explicitly
b908f492bc TEST-64-UDEV-STORAGE: Fix python 3.9 compatibility
1c4f25c296 TEST-64-UDEV-STORAGE: Use bus pci slot 1 instead of 0
9663bb7410 TEST-58-REPART: reverse order of diff args
2f455914f7 man/tmpfiles: remove outdated behavior regarding symlink ownership
24dd273402 test-mountpoint-util: add a test for bind mounted symlinks
99cb4bdbbb mountpoint-util: do not assume symlinks are not mountpoints
4437967cab hostnamed: if polkit authentication fails for Varlink Describe() call, don't reply to client with an error
fb7ec285c9 core/exec-invoke: use sched_setattr instead of sched_setscheduler
5911f1ec25 cryptsetup: improve TPM2 blob display
57661f4ea9 util: make file_read() 64bit offset safe
e2fb3dda24 man/capsule@.service: the capsule user is prefixed with "c-" rather than "p_"
2547de4629 man/capsule@.service.xml: fix typo
98928cf0a7 nspawn, vmspawn: honor the new window title switch
9cbb3aadd5 run: add environment variable to prevent the setting of terminal title
81acc5b39a test-execute: add a test case for issue #33299
d008b3fb26 core: do not filter out write() if required in the very late stage
d580b1f850 core: use write() to send handoff timestamp
52eeeb7d3d seccomp-util: split out seccomp_filter_set_add_by_name()
8e775590f1 Fix typo in CAP_BPF description (#33464)
54910267ba test-network: check if static routes not overridden by NDisc routes
4fda6e8f34 network/ndisc: do not remove static routes when received RA with zero lifetime
34bef8dfac network/ndisc: do not override conflicting static routes
0b909bf685 core/exec-invoke: reopen OpenFile= fds with O_NOCTTY
52371fe526 core: verify WorkingDirectory= is outside of API VFS only under mount namespacing
ec5ac3ea53 terminal-util: use colon as separator for specifying color
421ccd7094 man: fix double is typo in systemd-tmpfiles
778034f42e test: skip test-cgroup-id on ENOSYS from cg_cgroupid_open
3174fae67b meson: bpf: propagate 'sysroot' for cross compilation
a6906475be kernel-install: correct the place where it works in man and help text
3e435e970d man/systemd.exec: list inaccessible files for ProtectKernelTunables
90b5cb35e9 Use consistent spelling of systemd.condition_first_boot argument
b6316b8fac login/user-runtime-dir: free ignored sd_bus_error, avoid triggering assertion
71546deef5 login/user-runtime-dir: use STRLEN where appropriate
fbfc88af5e pretty-print: take console glyph width into account when drawing progress bar
058fca7e6c mkosi: add support for TEST_SAVE_JOURNAL to integration test wrapper
50ae476efd semaphore: pin packaging to ci/v256/stable branch
771bb489bf test: skip TEST-69-SHUTDOWN on Debian
69c51768ef meson: Bump version to 256.2~devel
273b5622ac meson: Fix various versions
9150ffc98a src/boot/efi/meson.build: ensure VERSION_TAG exists in case of cross build
1eb122033f mkosi: Build a disk image by default again
84d6fec8f9 meson: Deal with potential stable versions
851f991b1c mkosi: bump to latest commit
3d3bc1d999 mkosi: Switch back to btrfs
ce41fdbfdc mkosi: Install btrfs-progs on CentOS as well
1566c15fe4 mkosi: Enable hyperscale-packages-experimental for CentOS
33ad0ea834 mkosi: Drop leftover systemd-coredump-debuginfo package for opensuse
2286ae91f4 mkosi: Drop s390x console patch from opensuse spec
7404ba69cf mkosi: use new standalone-shutdown package for debian's exitrd
3f0763b5a6 mkosi: update debian commit reference
9d0259e5bc mkosi: bump Debian Salsa commit to latest
87fc64db36 mkosi: install new split-out systemd packages
245d17d8dd mkosi: update arch commit reference
8717dc0dd4 mkosi: switch opensuse to devel branch
6f720b609a mkosi: update fedora commit reference
a09800cd16 mkosi: update fedora commit reference
e3703f4327 mkosi: Install zypper in opensuse images
a7da351f39 mkosi: Fix sync script git command
a39473aac7 mkosi: Clean up old packages from the build directory
2e0af5f6fe mkosi: remove conflicting deb packages from builddir
6a898c35da mkosi: Copy packages to the build directory as well
16ea64e2be mkosi: Make sure we don't hide errors from git merge-base
3f42d88faa mkosi: Install perf
f2c782c043 mkosi: Install pciutils
054fc83a23 mkosi: move variable to the right scope
8abb2e0f55 mkosi: Don't touch the packaging checkout if work is being done
59ab01d32f vmspawn: define QEMU_MACHINE_TYPE for loongarch64
ba28889c65 vmspawn: define QEMU_MACHINE_TYPE for riscv
715d146a3a docs: fix dead link to GNOME documentation
34ba18b012 logs-show: do not use _SOURCE_MONOTONIC_TIMESTAMP field
f8f669fd69 repart: fix memory leak
7b18adadde mkosi: restrict noble-backports to noble builds
08b8237303 tmpfiles: move --purge to command section in --help text where it belongs
e760157389 tmpfiles: insist on at least one configuration file being specified on --purge
90ec026570 tmpfiles: honour --dry-run when removing directories
c26e56d08f install: allow removing symlinks even for units that are gone
a776dcf7af NEWS: fix typo
d89c99c7ad mkosi: bump to latest
b455006ae1 CI: disable secure boot in mkosi GHA runs
4cc6da9a5d test-network: mention that the captive portal option is supported since v2.20
f7d55cc801 core/service: fix accept-socket deserialization
7d65709901 test: use 'auto' instead of 'uefi' for automated fallback
6178aa4bbc test: support TEST_NO_QEMU in mkosi integration wrapper
a36cb5660e test: support TEST_NO_KVM
df1e7d9572 test: drop obsolete comment
51a2e7be5e test: drop unneeded firmware: uefi setting
50b53b8221 test: check the skip condition before installing additional files
9802a28b36 mkosi: install EFI packages only on EFI architectures
21feae324e mkosi: use ports.ubuntu.com for non-x86 backports
9f5f3c2f8b mkosi: enable unprivileged user ns for integration tests
1a0e6961cf man,units: drop "temporary" from description of systemd-tmpfiles
aedeaf7450 man: add a bit of a warning to systemd-tmpfiles --purge
3706b5e8e9 fundamental: declare flex array updated for gcc15 and clang 19
51390a1f41 analyze: show pcrs also in sha384 bank
a61a83a22b CODING_STYLE: document "reterr_" return parameters
2034de6157 shell-completion: only offer devices for completion
4ebcdcb136 NEWS: note that new stable releases will be in the main repo
d316aed5d8 repart: Use CRYPT_ACTIVATE_PRIVATE
4a468387ac test: dump a simple summary at the end of TEST-02-UNITTEST
70f5fb2f7a repart: Use crypt_reencrypt_run() if available
ba031f1fe8 resolved: permit dnssec rrtype questions when we aren't validating
30df42a927 tpm2-setup: Don't fail if we can't access the TPM due to authorization failure
514ef0f93b strbuf: use GREEDY_REALLOC to grow the buffer
a3d94332a2 rules: Limit the number of device units generated for serial ttys
0d573787ea sd-dhcp-server: clear buffer before receive
f2b5c1ff51 hostnamed: don't allow hostnamed to exit on idle if varlink connections are still ongoing
d918804408 man/systemd: reorder content a bit
1c27c902ad Create CNAME

Dropped merged patches:

0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch

Changed git repo back to systemd main one since that is going to
be used for v256-stable branch and newer releases instead of the
systemd-stable git repo.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ve_256.bb => systemd-boot-native_256.4.bb} |  0
 ...temd-boot_256.bb => systemd-boot_256.4.bb} |  2 --
 meta/recipes-core/systemd/systemd.inc         |  6 ++--
 ...on.build-ensure-VERSION_TAG-exists-i.patch | 32 -------------------
 ...pagate-sysroot-for-cross-compilation.patch | 31 ------------------
 .../{systemd_256.bb => systemd_256.4.bb}      |  2 --
 6 files changed, 3 insertions(+), 70 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_256.bb => systemd-boot-native_256.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_256.bb => systemd-boot_256.4.bb} (95%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch
 rename meta/recipes-core/systemd/{systemd_256.bb => systemd_256.4.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.bb b/meta/recipes-core/systemd/systemd-boot-native_256.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_256.bb
rename to meta/recipes-core/systemd/systemd-boot-native_256.4.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_256.bb b/meta/recipes-core/systemd/systemd-boot_256.4.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd-boot_256.bb
rename to meta/recipes-core/systemd/systemd-boot_256.4.bb
index dd06b6218b..9a6d8e9d6e 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.4.bb
@@ -1,8 +1,6 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
-SRC_URI += "file://0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch"
-
 require conf/image-uefi.conf
 
 DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 6906ff969b..63f024baa9 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "5c79cdec10a547a866764a66e1e14898112a00cd"
-SRCBRANCH = "main"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
+SRCREV = "566210c272820ca6655800ce0d27b6ebc0aedc4c"
+SRCBRANCH = "v256-stable"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch b/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
deleted file mode 100644
index 6f02ea2f43..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9df06062cebd0390d33de9694e9cb1c9fa7b8697 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 3 Jul 2024 23:18:41 -0700
-Subject: [PATCH] src/boot/efi/meson.build: ensure VERSION_TAG exists in case
- of cross build
-
-The GIT_VERSION is changed to use VERSION_TAG, but in case of cross build
-for src/boot/efi, it's not set, causing build error because the compiler cannot
-know it's a macro thus treating it as some variable and error out.
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/33612]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/boot/efi/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
-index 7a60b0ec7e..99d108d6e8 100644
---- a/src/boot/efi/meson.build
-+++ b/src/boot/efi/meson.build
-@@ -65,6 +65,7 @@ endforeach
- 
- if meson.is_cross_build() and get_option('sbat-distro') == 'auto'
-         warning('Auto detection of SBAT information not supported when cross-building, disabling SBAT.')
-+        efi_conf.set_quoted('VERSION_TAG', version_tag)
- elif get_option('sbat-distro') != ''
-         efi_conf.set_quoted('SBAT_PROJECT', meson.project_name())
-         efi_conf.set_quoted('PROJECT_VERSION', meson.project_version().split('~')[0])
--- 
-2.45.1
-
diff --git a/meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch b/meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch
deleted file mode 100644
index 08b70bf66d..0000000000
--- a/meta/recipes-core/systemd/systemd/0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From bbceb4b339231124a0b004531b4b6838539432e6 Mon Sep 17 00:00:00 2001
-From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
-Date: Thu, 20 Jun 2024 12:32:18 +0200
-Subject: [PATCH 03/27] meson: bpf: propagate 'sysroot' for cross compilation
-
-During cross-compilation of systemd, the compiler used to build the bpf's needs
-to be pointed at the correct include searchpath. Which can be done by passing
-the corresponding directory in through the cflags; for example in yocto/bitbake
-this would work: CFLAGS += "--sysroot=${STAGING_DIR_TARGET}"
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/33427]
-Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index ea4e12aa1c..52723bef09 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1739,6 +1739,7 @@ if conf.get('BPF_FRAMEWORK') == 1
-                 '-ffile-prefix-map=',
-                 '-fdebug-prefix-map=',
-                 '-fmacro-prefix-map=',
-+                '--sysroot=',
-         ]
- 
-         foreach opt : c_args
--- 
-2.45.1
-
diff --git a/meta/recipes-core/systemd/systemd_256.bb b/meta/recipes-core/systemd/systemd_256.4.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_256.bb
rename to meta/recipes-core/systemd/systemd_256.4.bb
index 6e3985b94f..ee656c81e5 100644
--- a/meta/recipes-core/systemd/systemd_256.bb
+++ b/meta/recipes-core/systemd/systemd_256.4.bb
@@ -28,8 +28,6 @@ SRC_URI += " \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
-           file://0003-meson-bpf-propagate-sysroot-for-cross-compilation.patch \
-           file://0001-src-boot-efi-meson.build-ensure-VERSION_TAG-exists-i.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


