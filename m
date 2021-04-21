Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web08.6328.1618968886998788459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 18:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4] (unknown [IPv6:2001:470:b30d:2:ec4:7aff:fe92:7ff4])
	by kozue.soulik.info (Postfix) with ESMTPSA id 652E01007A7;
	Wed, 21 Apr 2021 10:34:42 +0900 (JST)
Subject: Re: [OE-core] [PATCH v3] seatd: add seatd recipe
To: Joshua Watt <jpewhacker@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, contact@emersion.fr, kl@kl.wtf
References: <20210420234341.182745-1-ayaka@soulik.info>
 <50825f3b-3c5f-1b51-d01f-eb850cca4da3@gmail.com>
From: "Randy Li" <ayaka@soulik.info>
Message-ID: <434efd41-dd9a-ac4e-4ac4-681b982678c0@soulik.info>
Date: Wed, 21 Apr 2021 09:34:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <50825f3b-3c5f-1b51-d01f-eb850cca4da3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/21/21 9:26 AM, Joshua Watt wrote:
>
>
> On 4/20/21 6:43 PM, Randy Li wrote:
>> Seat management takes care of mediating access to shared devices
>> (graphics, input), without requiring the applications needing access to
>> be root.
>>
>> weston would depend on it as well as wlroots.
>>
>> Signed-off-by: Randy Li<ayaka@soulik.info>
>> ---
>>   ...build-fixup-standalone-without-seatd.patch | 71 +++++++++++++++++++
>>   meta/recipes-core/seatd/libseat/init          | 50 +++++++++++++
>>   meta/recipes-core/seatd/libseat_0.5.0.bb      | 43 +++++++++++
>>   3 files changed, 164 insertions(+)
>>   create mode 100644 meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
>>   create mode 100644 meta/recipes-core/seatd/libseat/init
>>   create mode 100644 meta/recipes-core/seatd/libseat_0.5.0.bb
>>
>> diff --git a/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
>> new file mode 100644
>> index 0000000000..66e1ac73ab
>> --- /dev/null
>> +++ b/meta/recipes-core/seatd/libseat/0001-build-fixup-standalone-without-seatd.patch
>> @@ -0,0 +1,71 @@
>> +From 084df8ab271ce4b09c1ef5d9c5a859b2d02d20e7 Mon Sep 17 00:00:00 2001
>> +From: ayaka<ayaka@soulik.info>
>> +Date: Mon, 19 Apr 2021 22:15:46 +0800
>> +Subject: [PATCH] build: fixup standalone without seatd
>> +
>> +I think that server option means the same thing as seatd, so I
>> +get rid of it.
>
> I don't understand the purpose of this patch; why do we need to get 
> rid of the server?
>
I also sent this patch to the upstream, seatd is the server of libseat, 
besides you could build a libseat with a embedded server without 
shipping the seatd.

Then the feature opinions "server" and "seatd" are both controlling the 
same thing.

I sent this patch because I tended to use the built-in version for 
sysvinit before, but later the maintainer make a decision that built-in 
server would be removed in the future. Anyway, those two opinions are 
still duplicated.

>> +---
>> + meson.build       | 10 +++++-----
>> + meson_options.txt |  1 -
>> + 2 files changed, 5 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 7a70cb6..a2166c5 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -104,10 +104,11 @@ server_files = [
>> +
>> + with_seatd = get_option('seatd') == 'enabled'
>> + with_builtin = get_option('builtin') == 'enabled'
>> +-with_server = get_option('server') == 'enabled'
>> +
>> +-if with_seatd
>> ++if with_seatd or with_builtin
>> + 	private_files += 'libseat/backend/seatd.c'
>> ++endif
>> ++if with_seatd
>> + 	add_project_arguments('-DSEATD_ENABLED=1', language: 'c')
>> + endif
>> +
>> +@@ -189,7 +190,7 @@ libseat = declare_dependency(
>> + 	variables: libseat_vars,
>> + )
>> +
>> +-if with_server
>> ++if with_seatd
>> + 	executable(
>> + 		'seatd',
>> + 		[ server_files, 'seatd/seatd.c' ],
>> +@@ -221,7 +222,7 @@ foreach name, value : tests
>> + 		include_directories: [include_directories('.', 'include')]))
>> + endforeach
>> +
>> +-if with_server
>> ++if with_seatd
>> + 	scdoc = dependency('scdoc', required: get_option('man-pages'), version: '>= 1.9.7', native: true)
>> + else
>> + 	scdoc = disabler()
>> +@@ -252,7 +253,6 @@ endif
>> + summary({
>> + 	'seatd': with_seatd,
>> + 	'builtin': with_builtin,
>> +-	'server': with_server,
>> + 	'systemd': logind.found() and logind_provider == 'systemd',
>> + 	'elogind': logind.found() and logind_provider == 'elogind',
>> + }, bool_yn: true)
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index 144ce7a..c61d473 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -1,7 +1,6 @@
>> + option('logind', type: 'combo', choices: ['auto', 'disabled', 'elogind', 'systemd'], value: 'auto', description: 'logind support')
>> + option('seatd', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd support')
>> + option('builtin', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'builtin seatd server')
>> +-option('server', type: 'combo', choices: ['enabled', 'disabled'], value: 'enabled', description: 'seatd server')
>> + option('examples', type: 'combo', choices: ['enabled', 'disabled'], value: 'disabled', description: 'libseat example programs')
>> + option('man-pages', type: 'feature', value: 'auto', description: 'Generate and install man pages')
>> + option('defaultpath', type: 'string', value: '', description: 'Default location for seatd socket (empty for default)')
>> +--
>> +2.30.2
>> +
>> diff --git a/meta/recipes-core/seatd/libseat/init b/meta/recipes-core/seatd/libseat/init
>> new file mode 100644
>> index 0000000000..8c9d77255d
>> --- /dev/null
>> +++ b/meta/recipes-core/seatd/libseat/init
>> @@ -0,0 +1,50 @@
>> +#!/bin/sh
>> +#
>> +### BEGIN INIT INFO
>> +# Provides:          seatd
>> +# Short-Description: Start seat management daemon
>> +# Required-Start:    $local_fs $remote_fs
>> +# Required-Stop:     $local_fs $remote_fs
>> +# Default-Start:     2 3 4 5
>> +# Default-Stop:      0 1 6
>> +### END INIT INFO
>> +
>> +PATH=/bin:/usr/bin:/sbin:/usr/sbin
>> +
>> +test -x /usr/bin/seatd || exit 0
>> +
>> +# For configuration of the init script use the file
>> +# /etc/default/seatd, do not edit this init script.
>> +
>> +seatd_group="seatd"
>> +
>> +[ -e /etc/default/seatd ] && . /etc/default/seatd
>> +
>> +NAME=seatd
>> +DAEMON=/usr/bin/seatd
>> +STOP_RETRY_SCHEDULE='TERM/10/forever/KILL/1'
>> +
>> +. /etc/init.d/functions
>> +
>> +case "$1" in
>> +  start)
>> +    start-stop-daemon --start --backgroud --quiet --pidfile /var/run/$NAME.pid \
>> +	    --exec $DAEMON -- -g $seatd_group
>> +    ;;
>> +
>> +  stop)
>> +    killproc $NAME
>> +    ;;
>> +
>> +  restart)
>> +    $0 stop
>> +    sleep 1
>> +    $0 start
>> +    ;;
>> +  *)
>> +    echo "Usage: $0 {start|stop|restart}"
>> +    exit 1
>> +
>> +esac
>> +
>> +exit 0
>> diff --git a/meta/recipes-core/seatd/libseat_0.5.0.bb b/meta/recipes-core/seatd/libseat_0.5.0.bb
>> new file mode 100644
>> index 0000000000..8067d32a26
>> --- /dev/null
>> +++ b/meta/recipes-core/seatd/libseat_0.5.0.bb
>> @@ -0,0 +1,43 @@
>> +SUMMARY = "Seat management daemon and library"
>> +HOMEPAGE ="https://git.sr.ht/~kennylevinsen/seatd"
>> +SECTION = "base"
>> +
>> +DESCRIPTION = "A minimal seat management daemon, and a universal seat management \
>> +library. Seat management takes care of mediating access to shared devices \
>> +(graphics, input), without requiring the applications needing access to be root."
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM ="file://LICENSE;beginline=3;md5=6a01e8ccc65bea4e8bfa79b09ea1444c"
>> +
>> +SRCREV = "5535c2c3b19b42ebfe4c451600059e9418e401a6"
>> +SRCBRANCH = "master"
>> +SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=http;branch=${SRCBRANCH} \
>> +file://0001-build-fixup-standalone-without-seatd.patch  \
>> +file://init"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig meson useradd update-rc.d
>> +
>> +PACKAGECONFIG ??="${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 
>> 'systemd', 'seatd', d)}"
>> +
>> +PACKAGECONFIG[seatd] = "-Dseatd=enabled, -Dseatd=disabled"
>> +PACKAGECONFIG[systemd] = "-Dlogind=systemd, -Dlogind=disabled, systemd dbus"
>> +
>> +PACKAGES += "seatd"
>> +
>> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
>> +FILES_seatd = "${bindir}/seatd ${sysconfdir}"
>> +
>> +do_install_append() {
>> +	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
>> +		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/seatd
>> +	fi
>> +}
>> +
>> +INITSCRIPT_NAME = "seatd"
>> +INITSCRIPT_PARAMS = "start 8 5 2 . stop 21 0 1 6 ."
>> +
>> +USERADD_PACKAGES = "seatd"
>> +
>> +GROUPADD_PARAM_seatd = "-r seatd"
>>
>> 
>>
