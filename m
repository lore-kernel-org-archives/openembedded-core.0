Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.6842.1624355464208204540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: InuqXubJK81UOJLef5/CmQc8IUAGhVZ9OiGFoGlVT1CA+bXM4b9r+cITZPAa93pB04IRJQYsMl
 P0mwlOPe4ztQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014056"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:53 -0700
IronPort-SDR: HiKAs9ZB9IISI8GV7xWQS3GGi6gpQjgUe6k7snDki+BXg8//vDO9TJV71m9NSeMNsXnxkfwJjz
 kSlcTTyt3jmA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423259998"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/13] review request
Date: Tue, 22 Jun 2021 17:50:19 +0800
Message-Id: <cover.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. I have not included 5.10
kernel update since that breaks build for -rt kernel.

Two ptests, for valgrind and lttng-tools, failed while testing on
autobuilder. We already have bugs for these.

Thanks,

Anuj

The following changes since commit bfe25c99e914062b0527a6e74ebb8ce1eaad4ca8:

  linux-firmware: upgrade 20210315 -> 20210511 (2021-06-11 11:46:53 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Andrea Adami (1):
  kernel.bbclass: fix do_sizecheck() comparison

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.124
  linux-yocto/5.4: update to v5.4.125

Kai Kang (1):
  libx11: fix CVE-2021-31535

Khem Raj (1):
  linuxloader: Be aware of riscv32 ldso

Peter Kjellerstedt (2):
  util-linux.inc: Do not modify BPN
  native.bbclass: Do not remove "-native" in the middle of recipe names

Richard Purdie (2):
  lttng-tools: upgrade 2.12.3 -> 2.12.4
  perf: Use python3targetconfig to ensure we use target libraries

Ross Burton (1):
  avahi: apply fix for CVE-2021-3468

Tony Tascioglu (2):
  valgrind: remove buggy ptest from arm64
  valgrind: Actually install list of non-deterministic ptests

Trevor Gamblin (1):
  curl: cleanup CVE patches for hardknott

 meta/classes/kernel.bbclass                   |   2 +-
 meta/classes/linuxloader.bbclass              |   2 +
 meta/classes/native.bbclass                   |   8 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/handle-hup.patch              |  41 +++
 meta/recipes-core/util-linux/util-linux.inc   |   3 +-
 .../valgrind/valgrind/remove-for-aarch64      |   1 +
 .../valgrind/valgrind/run-ptest               |   4 +-
 .../valgrind/taskset_nondeterministic_tests   |   2 -
 .../valgrind/valgrind_3.16.1.bb               |   2 +
 .../xorg-lib/libx11/fix-CVE-2021-31535.patch  | 320 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.7.0.bb |   5 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...-tools_2.12.3.bb => lttng-tools_2.12.4.bb} |   9 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 ...-argument-to-Curl_ssl_get-addsession.patch |  16 +-
 ...redentials-from-the-auto-referer-hea.patch |   5 +-
 19 files changed, 417 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-CVE-2021-31535.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb} (94%)

-- 
2.31.1

