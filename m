Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tsz6g-00089f-Vs
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:06:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jan 2013 08:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,438,1355126400"; d="scan'208";a="244117994"
Received: from unknown (HELO [10.255.14.147]) ([10.255.14.147])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2013 08:51:12 -0800
Message-ID: <50EDA000.9000505@linux.intel.com>
Date: Wed, 09 Jan 2013 08:51:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
In-Reply-To: <cover.1357647338.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 17:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2013 04:24 AM, Radu Moisan wrote:
> As Ross suggested I've done the following changes to the previous set:
> * added two patches (the first two) that address multiple init systems support,\
> as in shifting from default hardcoded sysvinit to something more generic while
> the default values still remains on sysvinit
> * moved automatic setting of PREFERRED_PROVIDER_udev into default_providers.inc
> * removed ahavi-systemd since all it provided was service files; now service files
> are pulled in by avahi-daemon
> * also rebased on master
>

With a world build I saw the following failure:
> | i586-poky-linux-libtool: link: (cd ".libs" && rm -f "libsystemd-journal.so" && ln -s "libsystemd-journal.so.0.6.0" "libsystemd-journal.so")
> | i586-poky-linux-libtool: link: (cd ".libs" && rm -f "libsystemd-id128.so.0" && ln -s "libsystemd-id128.so.0.0.15" "libsystemd-id128.so.0")
> | i586-poky-linux-libtool: link: (cd .libs/libudev.lax/libsystemd-shared.a && i586-poky-linux-ar x "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/systemd/git-r12/git/./.libs/libsystemd-shared.a")
> | i586-poky-linux-libtool: link: (cd ".libs" && rm -f "libsystemd-id128.so" && ln -s "libsystemd-id128.so.0.0.15" "libsystemd-id128.so")
> | ./.libs/libsystemd-daemon.so: undefined reference to `mq_getattr'
> | i586-poky-linux-libtool: link: (cd .libs/libsystemd-logs.lax/libsystemd-shared.a && i586-poky-linux-ar x "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/systemd/git-r12/git/./.libs/libsystemd-shared.a")
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [systemd-nspawn] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "libsystemd-journal.la" && ln -s "../libsystemd-journal.la" "libsystemd-journal.la" )
> | i586-poky-linux-libtool: link: i586-poky-linux-ar cru .libs/libudev.a  src/libudev/libudev_la-libudev.o src/libudev/libudev_la-libudev-list.o src/libudev/libudev_la-libudev-util.o src/libudev/libudev_la-libudev-device.o src/libudev/libudev_la-libudev-enumerate.o src/libudev/libudev_la-libudev-monitor.o src/libudev/libudev_la-libudev-queue.o  .libs/libudev.lax/libsystemd-shared.a/cgroup-show.o .libs/libudev.lax/libsystemd-shared.a/cgroup-util.o .libs/libudev.lax/libsystemd-shared.a/conf-files.o .libs/libudev.lax/libsystemd-shared.a/conf-parser.o .libs/libudev.lax/libsystemd-shared.a/exit-status.o .libs/libudev.lax/libsystemd-shared.a/hashmap.o .libs/libudev.lax/libsystemd-shared.a/hwclock.o .libs/libudev.lax/libsystemd-shared.a/log.o .libs/libudev.lax/libsystemd-shared.a/pager.o .libs/libudev.lax/libsystemd-shared.a/path-util.o .libs/libudev.lax/libsystemd-shared.a/ratelimit.o .libs/libudev.lax/libsystemd-shared.a/set.o .libs/libudev.lax/libsystemd-shared.a/socket-util.o .libs/libu
dev.lax/libsystemd-shared.a/spawn-ask-password-agent.o .libs/libudev.lax/libsystemd-shared.a/spawn-polkit-agent.o .libs/libudev.lax/libsystemd-shared.a/specifier.o .libs/libudev.lax/libsystemd-shared.a/strbuf.o .libs/libudev.lax/libsystemd-shared.a/strv.o .libs/libudev.lax/libsystemd-shared.a/unit-name.o .libs/libudev.lax/libsystemd-shared.a/utf8.o .libs/libudev.lax/libsystemd-shared.a/util.o .libs/libudev.lax/libsystemd-shared.a/utmp-wtmp.o .libs/libudev.lax/libsystemd-shared.a/virt.o .libs/libudev.lax/libsystemd-shared.a/watchdog.o
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "libsystemd-id128.la" && ln -s "../libsystemd-id128.la" "libsystemd-id128.la" )
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-cgroup src/test/test-cgroup.o  ./.libs/libsystemd-label.a ./.libs/libsystemd-shared.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-env-replace src/test/test-env-replace.o  ./.libs/libsystemd-shared.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-ar cru .libs/libsystemd-logs.a src/shared/.libs/libsystemd_logs_la-logs-show.o   .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-fsprg.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-journal-authenticate.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-journal-file.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-journal-send.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-journal-vacuum.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-journal-verify.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-lookup3.o .libs/libsystemd-logs.lax/libsystemd-journal-internal.a/libsystemd_journal_internal_la-mmap-cache.o .libs/libsystemd-logs.lax/libsystemd-journal-internal
.a/libsystemd_journal_internal_la-sd-journal.o  .libs/libsystemd-logs.lax/libsystemd-id128-internal.a/sd-id128.o  .libs/libsystemd-logs.lax/libsystemd-shared.a/cgroup-show.o .libs/libsystemd-logs.lax/libsystemd-shared.a/cgroup-util.o .libs/libsystemd-logs.lax/libsystemd-shared.a/conf-files.o .libs/libsystemd-logs.lax/libsystemd-shared.a/conf-parser.o .libs/libsystemd-logs.lax/libsystemd-shared.a/exit-status.o .libs/libsystemd-logs.lax/libsystemd-shared.a/hashmap.o .libs/libsystemd-logs.lax/libsystemd-shared.a/hwclock.o .libs/libsystemd-logs.lax/libsystemd-shared.a/log.o .libs/libsystemd-logs.lax/libsystemd-shared.a/pager.o .libs/libsystemd-logs.lax/libsystemd-shared.a/path-util.o .libs/libsystemd-logs.lax/libsystemd-shared.a/ratelimit.o .libs/libsystemd-logs.lax/libsystemd-shared.a/set.o .libs/libsystemd-logs.lax/libsystemd-shared.a/socket-util.o .libs/libsystemd-logs.lax/libsystemd-shared.a/spawn-ask-password-agent.o .libs/libsystemd-logs.lax/libsystemd-shared.a/spawn-polkit-agent.o 
.libs/libsystemd-logs.lax/libsystemd-shared.a/specifier.o .libs/libsystemd-logs.lax/libsystemd-shared.a/strbuf.o .libs/libsystemd-logs.lax/libsystemd-shared.a/strv.o .libs/libsystemd-logs.lax/libsystemd-shared.a/unit-name.o .libs/libsystemd-logs.lax/libsystemd-shared.a/utf8.o .libs/libsystemd-logs.lax/libsystemd-shared.a/util.o .libs/libsystemd-logs.lax/libsystemd-shared.a/utmp-wtmp.o .libs/libsystemd-logs.lax/libsystemd-shared.a/virt.o .libs/libsystemd-logs.lax/libsystemd-shared.a/watchdog.o
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-strv src/test/test-strv.o  ./.libs/libsystemd-shared.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-watchdog src/test/test-watchdog.o  ./.libs/libsystemd-shared.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-id128 src/test/test-id128.o  ./.libs/libsystemd-shared.a ./.libs/libsystemd-id128-internal.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -I/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/include/dbus-1.0 -I/srv/home/pokybu
ild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/dbus-1.0/include -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o test-install src/test/test_install-test-install.o  ./.libs/libsystemd-units.a ./.libs/libsystemd-label.a ./.libs/libsystemd-shared.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-journal-syslog src/journal/test-journal-syslog.o src/journal/journald-syslog.o  ./.libs/libsystemd-shared.a ./.libs/libsystemd-journal-internal.a -L/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgcrypt.so -L=/usr/lib -lcap /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgpg-error.so ./.libs/libsystemd-id128-internal.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-journal-send src/journal/test-journal-send.o  ./.libs/libsystemd-shared.a ./.libs/libsystemd-journal-internal.a -L/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgcrypt.so -L=/usr/lib -lcap /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgpg-error.so ./.libs/libsystemd-id128-internal.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o test-journal src/journal/test-journal.o  ./.libs/libsystemd-shared.a ./.libs/libsystemd-journal-internal.a -L/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgcrypt.so -L=/usr/lib -lcap /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86/usr/lib/libgpg-error.so ./.libs/libsystemd-id128-internal.a -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/sysroots/qemux86 -std=gnu99 -pipe -Wall -Wextra -Wno-inline -Wundef -Wformat=2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs -Wold-style-definition -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-long-long -Wno-overlength-strings -Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result -Werror=overflow -ffast-math -fno-common -fdiagnostics-show-option -fno-strict-aliasing -fvisibility=hidden -ffunction-sections -fdata-sections -fstack-protector --param=ssp-buffer-size=4 -O2 -pipe -g -feliminate-unused-debug-types -Wl,--as-needed -Wl,--gc-sections -Wl,-z -Wl,relro -Wl,-z -Wl,now -Wl,-O1 -Wl,--hash-style=gnu
 -Wl,--as-needed -o .libs/test-daemon src/test/test-daemon.o  ./.libs/libsystemd-shared.a ./.libs/libsystemd-daemon.so -ldl
> | i586-poky-linux-libtool: link: i586-poky-linux-ranlib .libs/libudev-private.a
> | i586-poky-linux-libtool: link: i586-poky-linux-ranlib .libs/libsystemd-logs.a
> | i586-poky-linux-libtool: link: i586-poky-linux-ranlib .libs/libudev.a
> | i586-poky-linux-libtool: link: rm -fr .libs/libudev-private.lax
> | i586-poky-linux-libtool: link: rm -fr .libs/libsystemd-logs.lax
> | i586-poky-linux-libtool: link: rm -fr .libs/libudev.lax
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "libudev-private.la" && ln -s "../libudev-private.la" "libudev-private.la" )
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "libsystemd-logs.la" && ln -s "../libsystemd-logs.la" "libsystemd-logs.la" )
> | i586-poky-linux-libtool: link: ( cd ".libs" && rm -f "libudev.la" && ln -s "../libudev.la" "libudev.la" )
> | ./.libs/libsystemd-daemon.so: undefined reference to `mq_getattr'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [test-daemon] Error 1
> | rm units/console-shell.service.m4 src/core/org.freedesktop.systemd1.policy.in units/rescue.service.m4 units/console-getty.service.m4
> | make[1]: *** [all-recursive] Error 1
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/systemd/git-r12/temp/log.do_compile.7045 for further information)
> NOTE: recipe systemd-git-r12: task do_compile: Failed
> ERROR: Task 9123 (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-core/systemd/systemd_git.bb, do_compile) failed with exit code '1'


This was with the eglibc 2.17, so I am not sure that's related or not, I 
have cc'ed Khem, since none of the other AB build systemd code this is 
the first time it's seeing it.

Sau!


> The following changes since commit 7e1f8faad0c4b6f490c26f87acc698dd6e002b15:
>
>    perl: Remove bashism from perl-tests.inc (2013-01-07 22:37:37 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib rmoisan/systemd
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/systemd
>
> Enrico Scholz (1):
>    systemd: move disable operation into prerm() script
>
> Holger Hans Peter Freyther (2):
>    systemd: Make the main systemd files proper CONFFILES
>    systemd: Introduce a create-volatile to create tmp directories
>
> Khem Raj (1):
>    systemd: Fix build when base_libdir is not /lib
>
> Martin Donnelly (2):
>    cgroups: Add INSANE_SKIP to avoid warning about .so file
>    systemd: Remove sysvinit mount related services if systemd is enabled
>
> Martin Jansa (2):
>    systemd: fix FILESPATH to find systemctl
>    systemd: add PACKAGES_DYNAMIC
>
> Radu Moisan (13):
>    default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>    default-providers: Automatically set PREFERRED_PROVIDER_udev
>    systemd: initial integration
>    systemd: Add systemd_base.bbclass
>    systemd: Add systemd option to PREFERRED_PROVIDER_udev
>    systemd: set default.target to multi-user.target
>    systemd: update FILESPATH with *-native directory
>    systemd: disable sysfs.service
>    systemd: Add systemd-compat-units
>    systemd: Add avahi to packagegroup-core-boot
>    xserver-nodm-init: Enable systemd support
>    util-linux: Enable systemd support
>    systemd: Disable xz when building with GPLv3 incompatibility flag
>
>   meta/classes/systemd.bbclass                       |    1 +
>   meta/classes/systemd_base.bbclass                  |  218 +++++++++++++
>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>   meta/conf/distro/include/default-providers.inc     |    1 +
>   meta/recipes-bsp/keymaps/files/keymaps.service     |    9 +
>   meta/recipes-bsp/keymaps/keymaps_1.0.bb            |    9 +-
>   meta/recipes-connectivity/avahi/avahi.inc          |   23 +-
>   meta/recipes-connectivity/connman/connman.inc      |    6 +
>   meta/recipes-connectivity/connman/connman_1.4.bb   |    3 +-
>   meta/recipes-connectivity/dhcp/dhcp.inc            |   15 +-
>   meta/recipes-connectivity/dhcp/files/dhcpd.service |   12 +
>   .../dhcp/files/dhcrelay.service                    |   10 +
>   .../openssh/openssh-6.0p1/sshd.socket              |   11 +
>   .../openssh/openssh-6.0p1/sshd@.service            |    9 +
>   .../openssh/openssh-6.0p1/sshdgenkeys.service      |   10 +
>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |   14 +-
>   .../wpa-supplicant/wpa-supplicant-1.0.inc          |   74 +++--
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
>   meta/recipes-core/busybox/busybox.inc              |   18 ++
>   meta/recipes-core/busybox/busybox_1.20.2.bb        |    4 +-
>   .../busybox/files/busybox-klogd.service.in         |    8 +
>   .../busybox/files/busybox-syslog.service.in        |   13 +
>   meta/recipes-core/dropbear/dropbear.inc            |   81 ++---
>   .../recipes-core/dropbear/dropbear/dropbear.socket |   10 +
>   .../dropbear/dropbear/dropbear@.service            |    9 +
>   .../dropbear/dropbear/dropbearkey.service          |   10 +
>   .../initscripts-1.0/{urandom => urandom.sh}        |    0
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  164 +++++-----
>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    1 +
>   .../packagegroups/packagegroup-base.bb             |    3 +-
>   .../packagegroups/packagegroup-core-boot.bb        |    9 +-
>   meta/recipes-core/systemd/systemd-compat-units.bb  |   59 ++++
>   .../systemd/systemd-compat-units/machineid.service |   16 +
>   .../systemd-compat-units/run-postinsts.service     |   17 +
>   .../systemd/systemd-machine-units_1.0.bb           |   14 +
>   meta/recipes-core/systemd/systemd-serialgetty.bb   |   46 +++
>   .../systemd/systemd-serialgetty/LICENSE            |  339 ++++++++++++++++++++
>   .../systemd-serialgetty/serial-getty@.service      |   32 ++
>   meta/recipes-core/systemd/systemd-speed-hacks.bb   |   18 ++
>   .../systemd/systemd-systemctl-native.bb            |   20 ++
>   .../systemd/systemd-systemctl-native/systemctl     |  126 ++++++++
>   .../systemd/systemd/create-volatile.conf           |   10 +
>   meta/recipes-core/systemd/systemd/gtk-doc.make     |  230 +++++++++++++
>   meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>   .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>   .../systemd/set_default_target_to_multi-user.patch |   13 +
>   .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>   .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>   .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>   .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 +++++++++++++++++++
>   .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>   meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>   meta/recipes-core/systemd/systemd_git.bb           |  252 +++++++++++++++
>   meta/recipes-core/util-linux/util-linux.inc        |   11 +-
>   meta/recipes-extended/cronie/cronie/crond.service  |   10 +
>   meta/recipes-extended/cronie/cronie_1.4.8.bb       |   10 +-
>   .../lighttpd/files/lighttpd.service                |   13 +
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   11 +-
>   meta/recipes-extended/pam/libpam_1.1.6.bb          |    3 +
>   meta/recipes-extended/polkit/polkit_0.104.bb       |    9 +-
>   meta/recipes-graphics/x11-common/x11-common_0.1.bb |    4 +-
>   .../x11-common/xserver-nodm-init.bb                |   19 +-
>   .../x11-common/xserver-nodm-init/xserver-nodm.conf |    1 +
>   .../xserver-nodm-init/xserver-nodm.service         |    9 +
>   66 files changed, 2606 insertions(+), 174 deletions(-)
>   create mode 100644 meta/classes/systemd.bbclass
>   create mode 100644 meta/classes/systemd_base.bbclass
>   create mode 100644 meta/recipes-bsp/keymaps/files/keymaps.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd.socket
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshd@.service
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-6.0p1/sshdgenkeys.service
>   create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
>   create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.service
>   rename meta/recipes-core/initscripts/initscripts-1.0/{urandom => urandom.sh} (100%)
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>   create mode 100644 meta/recipes-core/systemd/systemd-machine-units_1.0.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/LICENSE
>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>   create mode 100644 meta/recipes-core/systemd/systemd-speed-hacks.bb
>   create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>   create mode 100755 meta/recipes-core/systemd/systemd-systemctl-native/systemctl
>   create mode 100644 meta/recipes-core/systemd/systemd/create-volatile.conf
>   create mode 100644 meta/recipes-core/systemd/systemd/gtk-doc.make
>   create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>   create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>   create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>   create mode 100644 meta/recipes-core/systemd/systemd_git.bb
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond.service
>   create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd.service
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.conf
>   create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service
>


