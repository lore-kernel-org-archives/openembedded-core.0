Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 600EC600AC;
	Fri, 10 Jan 2014 02:00:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0A204te019531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jan 2014 18:00:04 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 9 Jan 2014 18:00:04 -0800
Message-ID: <52CF543C.3060400@windriver.com>
Date: Fri, 10 Jan 2014 10:00:28 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20140106221511.85C275049C@opal> <20140109144946.GH3709@jama>
In-Reply-To: <20140109144946.GH3709@jama>
X-Originating-IP: [128.224.162.164]
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : Add missing RDEPENDS of initscripts-functions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 02:00:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2014 10:49 PM, Martin Jansa wrote:
> On Mon, Jan 06, 2014 at 10:15:11PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 6690c12cb1977f6bf93f3eb6d471dbd7db81bf28
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6690c12cb1977f6bf93f3eb6d471dbd7db81bf28
>>
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Mon Jan  6 15:27:35 2014 +0800
>>
>> Add missing RDEPENDS of initscripts-functions
>>
>> Now that the initscripts-functions has been packaged separately,
>> packages which may use the functions script should have a runtime
>> dependency on it.
> Do really all these recipes need initscripts-functions e.g. when
> building image with systemd?

Agree.
I think I should take into consideration whether the package has systemd 
service file or not.
If the package has a service, its init script would be deleted anyway, 
so it has no dependency on initscript-functions.
I'll send out a follow-up patch to fix this, together with other systemd 
related patches.

Best Regards,
Chen Qi

> I have initscripts in blacklist for long time (since switching to
> systemd) and now it tries to bring initscripts-functions from it.
>
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-bsp/alsa-state/alsa-state.bb                 | 2 +-
>>   meta/recipes-bsp/apmd/apmd_3.2.2-14.bb                    | 1 +
>>   meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb | 2 ++
>>   meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb    | 4 ++--
>>   meta/recipes-connectivity/openssh/openssh_6.4p1.bb        | 2 +-
>>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb                | 1 +
>>   meta/recipes-core/dbus/dbus.inc                           | 2 +-
>>   meta/recipes-core/systemd/systemd_208.bb                  | 2 +-
>>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb            | 2 +-
>>   meta/recipes-devtools/distcc/distcc_3.1.bb                | 1 +
>>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb          | 2 +-
>>   meta/recipes-extended/at/at_3.1.14.bb                     | 3 +--
>>   meta/recipes-extended/cronie/cronie_1.4.11.bb             | 2 ++
>>   meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb            | 2 ++
>>   meta/recipes-extended/sysklogd/sysklogd.inc               | 2 ++
>>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb             | 1 +
>>   meta/recipes-kernel/oprofile/oprofileui-server_git.bb     | 2 +-
>>   17 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
>> index 552fcfc..4be74aa 100644
>> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
>> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
>> @@ -37,7 +37,7 @@ PACKAGES += "alsa-states"
>>   
>>   RRECOMMENDS_alsa-state = "alsa-states"
>>   
>> -RDEPENDS_${PN} = "alsa-utils-alsactl"
>> +RDEPENDS_${PN} = "alsa-utils-alsactl initscripts-functions"
>>   FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>>   CONFFILES_${PN} = "${sysconfdir}/asound.conf"
>>   
>> diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
>> index 8c4b75e..d5ddc17 100644
>> --- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
>> +++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
>> @@ -8,6 +8,7 @@ LICENSE = "GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                       file://apm.h;beginline=6;endline=18;md5=7d4acc1250910a89f84ce3cc6557c4c2"
>>   DEPENDS = "libtool-cross"
>> +RDEPENDS_${PN} = "initscripts-functions"
>>   PR = "r2"
>>   
>>   SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
>> diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
>> index 7f216ac..59c9b6a 100644
>> --- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
>> +++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
>> @@ -24,6 +24,8 @@ inherit autotools update-rc.d
>>   INITSCRIPT_NAME = "irattach"
>>   INITSCRIPT_PARAMS = "defaults 20"
>>   
>> +RDEPENDS_${PN} += "initscripts-functions"
>> +
>>   do_compile () {
>>       oe_runmake -e -C irattach
>>       oe_runmake -e -C irdaping
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
>> index 45eacd9..fd44ea1 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
>> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
>>   
>>   # util-linux for libblkid
>>   DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
>> -RDEPENDS_${PN}-client = "rpcbind bash"
>> -RDEPENDS_${PN} = "${PN}-client bash"
>> +RDEPENDS_${PN}-client = "rpcbind bash initscripts-functions"
>> +RDEPENDS_${PN} = "${PN}-client bash initscripts-functions"
>>   RRECOMMENDS_${PN} = "kernel-module-nfsd"
>>   
>>   inherit useradd
>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> index 4f8d70a..c61d16f 100644
>> --- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> +++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
>> @@ -122,7 +122,7 @@ FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
>>   FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>>   
>>   RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>> -RDEPENDS_${PN}-sshd += "${PN}-keygen"
>> +RDEPENDS_${PN}-sshd += "${PN}-keygen initscripts-functions"
>>   
>>   CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
>>   CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
>> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
>> index 52bab4f..ed1a391 100644
>> --- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
>> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
>> @@ -5,6 +5,7 @@ SECTION = "console/network"
>>   HOMEPAGE = "http://samba.org/ppp/"
>>   BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
>>   DEPENDS = "libpcap"
>> +RDEPENDS_${PN} = "initscripts-functions"
>>   LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
>>   LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
>>                       file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
>> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
>> index ae80cb0..9bdb489 100644
>> --- a/meta/recipes-core/dbus/dbus.inc
>> +++ b/meta/recipes-core/dbus/dbus.inc
>> @@ -6,7 +6,7 @@ LICENSE = "AFL-2 | GPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>>                       file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
>>   DEPENDS = "expat virtual/libintl"
>> -RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
>> +RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)} initscripts-functions"
>>   RDEPENDS_dbus_class-native = ""
>>   RDEPENDS_dbus_class-nativesdk = ""
>>   
>> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
>> index dcf68dc..6590235 100644
>> --- a/meta/recipes-core/systemd/systemd_208.bb
>> +++ b/meta/recipes-core/systemd/systemd_208.bb
>> @@ -229,7 +229,7 @@ PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
>>   
>>   FILES_udev-dbg += "/lib/udev/.debug"
>>   
>> -RDEPENDS_udev += "udev-utils"
>> +RDEPENDS_udev += "udev-utils initscripts-functions"
>>   RPROVIDES_udev = "hotplug"
>>   RRECOMMENDS_udev += "udev-hwdb"
>>   
>> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>> index dd25f71..a84448a 100644
>> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>>                       file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
>>   PR = "r11"
>>   
>> -RDEPENDS_${PN} = "${PN}-inittab"
>> +RDEPENDS_${PN} = "${PN}-inittab initscripts-functions"
>>   
>>   SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${PV}.tar.bz2 \
>>              file://install.patch \
>> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
>> index 5c889fa..e351a58 100644
>> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
>> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
>> @@ -6,6 +6,7 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>   
>>   DEPENDS = "avahi"
>> +RDEPENDS_${PN} = "initscripts-functions"
>>   
>>   GTKCONFIG = "gtk"
>>   GTKCONFIG_libc-uclibc = ""
>> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> index 1eb0021..6d0fbb6 100644
>> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> @@ -15,7 +15,7 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
>>             "
>>   
>>   DEPENDS = "util-linux openssl"
>> -RDEPENDS_${PN} = "bash"
>> +RDEPENDS_${PN} = "bash initscripts-functions"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extended/at/at_3.1.14.bb
>> index 1eb18b3..0a13157 100644
>> --- a/meta/recipes-extended/at/at_3.1.14.bb
>> +++ b/meta/recipes-extended/at/at_3.1.14.bb
>> @@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>>   DEPENDS = "flex flex-native \
>>              ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>   
>> -VIRTUAL-RUNTIME_initscripts ?= "initscripts"
>>   RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
>> -                  ${VIRTUAL-RUNTIME_initscripts} \
>> +                  initscripts-functions \
>>   "
>>   
>>   PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
>> diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes-extended/cronie/cronie_1.4.11.bb
>> index d98d0d9..c698181 100644
>> --- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
>> +++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
>> @@ -39,6 +39,8 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,${PAM_DEPS}"
>>   INITSCRIPT_NAME = "crond"
>>   INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
>>   
>> +RDEPENDS_${PN} = "initscripts-functions"
>> +
>>   USERADD_PACKAGES = "${PN}"
>>   GROUPADD_PARAM_${PN} = "--system crontab"
>>   
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
>> index 6043501..c1c3403 100644
>> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
>> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
>> @@ -33,6 +33,8 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
>>   INITSCRIPT_NAME = "rpcbind"
>>   INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
>>   
>> +RDEPENDS_${PN} = "initscripts-functions"
>> +
>>   SYSTEMD_SERVICE_${PN} = "rpcbind.service"
>>   SYSTEMD_AUTO_ENABLE = "disable"
>>   
>> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
>> index 3a51810..ef70044 100644
>> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>> @@ -24,6 +24,8 @@ SRC_URI_append_e500v2 = " file://no-vectorization.patch"
>>   INITSCRIPT_NAME = "syslog"
>>   CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
>>   
>> +RDEPENDS_${PN} = "initscripts-functions"
>> +
>>   CFLAGS_append = " -DSYSV"
>>   
>>   do_install () {
>> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> index 1928949..c43892c 100644
>> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
>> @@ -7,6 +7,7 @@ LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
>>   
>>   DEPENDS = ""
>> +RDEPENDS_${PN} = "initscripts-functions"
>>   PR = "r2"
>>   
>>   SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>> diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
>> index dbb5599..63f33e2 100644
>> --- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
>> +++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui \
>>   
>>   EXTRA_OECONF += "--disable-client --enable-server"
>>   
>> -RDEPENDS_${PN} = "oprofile"
>> +RDEPENDS_${PN} = "oprofile initscripts-functions"
>>   
>>   do_install_append() {
>>   	install -d ${D}${sysconfdir}/init.d
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


