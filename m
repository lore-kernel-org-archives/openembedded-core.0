Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WScaxNcH2Q3ewbSMehSCKShMCuZHEwxfORkxX/YiB/+Hlu14oStb9DxpQn9xtKQmH5tbttuXOI
 1+XroGPvpWIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699646"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699646"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:36 -0700
IronPort-SDR: ek9/frQvyNPPorOJLQ9B+03JOsnDtyOfQTz5Abbnb9sK4Gozd4yW2rvm+vmfUw/Xb7i4xp13gr
 D2IDtQO4NNeA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245664"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:35 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/32] zeus review request
Date: Tue, 28 Jul 2020 16:51:01 +0800
Message-Id: <cover.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for zeus. This builds cleanly
except for two unrelated failures:

1/ vulkan-tools fails because some hosts on autobuilder now have latest
buildtools installed which has python 3.8 [1]. There are a couple of
patches that we can backport for this.

2/ virgl_gtk test fails on Ubuntu 18.04 because it needs libdrm version on
host to be 2.4.101 [2]. I am not sure if we should upgrade the libdrm
version or not in zeus.

Does any one have any opinion on these?

This review request also has a patch fixing gstreamer builds when host
has a make version >= 4.3. Patch has more details.

Thanks,

Anuj

[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2140
[2] https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1131

The following changes since commit f5b90eeed7366432b39c7cd8c6ee8c23e2d4abe8:

  libpam: Remove option 'obscure' from common-password (2020-06-29 13:51:38 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

Adrian Bunk (2):
  python3: Upgrade 3.7.7 -> 3.7.8
  python3-numpy: Stop shipping manual config files

Ahmad Fatoum (1):
  core: glib-2.0: fix requested libmount/mkostemp/selinux not being
    linked in

Alexander Kanavin (1):
  bind: update 9.11.5-P4 -> 9.11.13

Anuj Mittal (1):
  gstreamer1.0: fix builds with make 4.3

Armin Kuster (1):
  wpa-supplicant: Security fix CVE-2020-12695

Bruce Ashfield (1):
  perf: fix build for v5.5+

Charles-Antoine Couret (1):
  utils: fix gcc 10 version detection

He Zhe (1):
  perf: Correct the substitution of python shebangs

Hongxu Jia (1):
  iso-codes: switch upstream branch master -> main

Jan-Simon Moeller (1):
  file: add bzip2-replacement-native to DEPENDS to fix sstate issue

Joe Slater (1):
  vim: _FORTIFY_SOURCE=2 be gone

Kai Kang (3):
  gcr: depends on gnupg-native
  wpa-supplicant: remove service templates from SYSTEMD_SERVICE
  encodings: clear postinst script

Khem Raj (1):
  cve-check: Run it after do_fetch

Konrad Weihmann (1):
  cve-update: handle baseMetricV2 as optional

Lee Chee Yang (4):
  libexif: fix CVE-2020-13114
  dbus: fix CVE-2020-12049
  perl: fix CVE-2020-10543 & CVE-2020-10878
  python3: fix CVE-2020-14422

Otavio Salvador (1):
  mtd-utils: Fix return value of ubiformat

Ovidiu Panait (1):
  nss: Fix CVE-2020-12399

Pierre-Jean Texier (1):
  timezone: upgrade 2019c -> 2020a

Ralph Siemsen (1):
  cve-check: include epoch in product version output

Richard Purdie (3):
  patchelf: Add patch to address corrupt shared library issue
  perl: Fix host specific modules problems
  selftest/context: Avoid tracebacks from tests using multiprocessing

Sakib Sajal (1):
  sqlite: backport CVE fix

Zhixiong Chi (1):
  glibc: CVE-2020-6096

akuster (1):
  bind: update to 9.11.19

wenlin.kang@windriver.com (1):
  systemd: fix CVE-2020-13776

 meta/classes/cve-check.bbclass                |   4 +-
 meta/lib/oe/utils.py                          |   2 +-
 meta/lib/oeqa/selftest/context.py             |   6 +-
 .../bind/0001-bind-fix-CVE-2019-6471.patch    |  64 --
 ....in-remove-useless-L-use_openssl-lib.patch |  18 +-
 ...01-fix-enforcement-of-tcp-clients-v1.patch |  60 --
 ...c-extend-DIRNAMESIZE-from-256-to-512.patch |  22 -
 ...001-lib-dns-gen.c-fix-too-long-error.patch |  31 -
 ...p-clients-could-still-be-exceeded-v2.patch | 670 -------------
 ...rence-counter-for-pipeline-groups-v3.patch | 278 ------
 ...accounting-and-client-mortality-chec.patch | 512 ----------
 ...a-and-pipeline-refs-allow-special-ca.patch | 911 ------------------
 ...allowance-for-tcp-clients-interfaces.patch |  80 --
 ...perations-in-bin-named-client.c-with.patch | 140 ---
 .../bind/bind/CVE-2020-8616.patch             | 206 ----
 .../bind/bind/CVE-2020-8617.patch             |  29 -
 ...ching-for-json-headers-searches-sysr.patch |  15 +-
 .../{bind_9.11.5-P4.bb => bind_9.11.19.bb}    |  21 +-
 ...allow-event-subscriptions-with-URLs-.patch | 151 +++
 ...nt-message-generation-using-a-long-U.patch |  62 ++
 ...HTTP-initiation-failures-for-events-.patch |  50 +
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |  11 +-
 .../dbus/dbus/CVE-2020-12049.patch            |  78 ++
 meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
 ...ot-hardcode-linux-as-the-host-system.patch |  49 +
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb |   1 +
 .../glibc/glibc/CVE-2020-6096-1.patch         | 193 ++++
 .../glibc/glibc/CVE-2020-6096-2.patch         | 111 +++
 meta/recipes-core/glibc/glibc_2.30.bb         |   2 +
 .../recipes-core/meta/cve-update-db-native.bb |  13 +-
 .../systemd/systemd/CVE-2020-13776.patch      |  96 ++
 meta/recipes-core/systemd/systemd_243.2.bb    |   1 +
 meta/recipes-devtools/file/file_5.37.bb       |   2 +-
 ...-utils-Fix-return-value-of-ubiformat.patch |  62 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   1 +
 .../patchelf/patchelf/fix-phdrs.patch         |  37 +
 .../patchelf/patchelf_0.10.bb                 |   1 +
 .../perl/files/CVE-2020-10543.patch           |  36 +
 .../perl/files/CVE-2020-10878_1.patch         | 152 +++
 .../perl/files/CVE-2020-10878_2.patch         |  36 +
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   5 +-
 .../python-numpy/files/aarch64/_numpyconfig.h |  32 -
 .../python-numpy/files/aarch64/config.h       | 139 ---
 .../python-numpy/files/arm/config.h           |  21 -
 .../python-numpy/files/arm/numpyconfig.h      |  17 -
 .../python-numpy/files/armeb/config.h         |  21 -
 .../python-numpy/files/armeb/numpyconfig.h    |  17 -
 .../files/mipsarchn32eb/_numpyconfig.h        |  32 -
 .../python-numpy/files/mipsarchn32eb/config.h | 139 ---
 .../files/mipsarchn32el/_numpyconfig.h        |  31 -
 .../python-numpy/files/mipsarchn32el/config.h | 138 ---
 .../files/mipsarchn64eb/_numpyconfig.h        |  32 -
 .../python-numpy/files/mipsarchn64eb/config.h | 139 ---
 .../files/mipsarchn64el/_numpyconfig.h        |  32 -
 .../python-numpy/files/mipsarchn64el/config.h | 138 ---
 .../files/mipsarcho32eb/_numpyconfig.h        |  32 -
 .../python-numpy/files/mipsarcho32eb/config.h | 139 ---
 .../python-numpy/files/mipsarcho32el/config.h |  21 -
 .../files/mipsarcho32el/numpyconfig.h         |  18 -
 .../python-numpy/files/powerpc/_numpyconfig.h |  32 -
 .../python-numpy/files/powerpc/config.h       | 139 ---
 .../files/powerpc64/_numpyconfig.h            |  32 -
 .../python-numpy/files/powerpc64/config.h     | 139 ---
 .../python-numpy/files/riscv64/_numpyconfig.h |  32 -
 .../python-numpy/files/riscv64/config.h       | 139 ---
 .../python-numpy/files/x86-64/_numpyconfig.h  |  32 -
 .../python-numpy/files/x86-64/config.h        | 139 ---
 .../python-numpy/files/x86/config.h           | 108 ---
 .../python-numpy/files/x86/numpyconfig.h      |  24 -
 .../python-numpy/python-numpy.inc             |  68 --
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 -----
 .../python/python3/CVE-2020-14422.patch       |  79 ++
 .../{python3_3.7.7.bb => python3_3.7.8.bb}    |   6 +-
 meta/recipes-extended/timezone/timezone.inc   |  10 +-
 meta/recipes-gnome/gcr/gcr_3.28.1.bb          |   2 +-
 .../xorg-font/encodings_1.0.5.bb              |   4 +
 meta/recipes-kernel/perf/perf.bb              |   6 +-
 .../gstreamer/gstreamer1.0-plugins.inc        |   2 +-
 .../gstreamer1.0-rtsp-server_1.16.2.bb        |   2 +-
 .../gstreamer/gstreamer1.0_1.16.2.bb          |   2 +-
 .../iso-codes/iso-codes_4.3.bb                |   2 +-
 .../libexif/libexif/CVE-2020-13114.patch      |  73 ++
 .../recipes-support/libexif/libexif_0.6.21.bb |   4 +-
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 +++
 meta/recipes-support/nss/nss_3.45.bb          |   1 +
 .../sqlite/files/CVE-2020-11655.patch         |  32 +
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |   1 +
 meta/recipes-support/vim/vim_8.1.1518.bb      |   5 +
 88 files changed, 1492 insertions(+), 5339 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-lib-dns-gen.c-fix-too-long-error.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.5-P4.bb => bind_9.11.19.bb} (83%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096-2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
 delete mode 100644 meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/aarch64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/arm/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/armeb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86-64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-14422.patch
 rename meta/recipes-devtools/python/{python3_3.7.7.bb => python3_3.7.8.bb} (98%)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2020-13114.patch
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch

-- 
2.25.4

