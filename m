Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 153EF719A4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 01:36:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA11aYcP019719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 31 Oct 2017 18:36:34 -0700
Received: from [128.224.162.135] (128.224.162.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 31 Oct 2017 18:36:33 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1509431793.git.dengke.du@windriver.com>
	<3ce7730efecfc08d8eb8b8cae1cfe6eea9539bf1.1509431793.git.dengke.du@windriver.com>
	<CAMKF1soRxzZDsVbr8dCdkY-o9AGJW4mZQmpJBv6CM5mCnJcRiA@mail.gmail.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <dba12417-71af-c0ba-0010-62c6be98c92b@windriver.com>
Date: Wed, 1 Nov 2017 09:35:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soRxzZDsVbr8dCdkY-o9AGJW4mZQmpJBv6CM5mCnJcRiA@mail.gmail.com>
X-Originating-IP: [128.224.162.135]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] avahi: upgrade to 0.7
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
X-List-Received-Date: Wed, 01 Nov 2017 01:36:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2017年11月01日 03:20, Khem Raj wrote:
> On Mon, Oct 30, 2017 at 11:44 PM, Dengke Du <dengke.du@windriver.com> wrote:
>> Delete the unneeded patch, because the upstream contains the needed changes.
>> The new version of avahi 0.7 use "/run" directory to place some run-time
>> variable data, not /var/run, so in avahi.inc, we should remove the "/run"
>> not "/var/run".
> if var/run is not empty then the content should be deleted as well.

Hi Khem,

Yes, but the installation would not create the /var/run directory.

>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   .../avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb}  |  6 ++---
>>   meta/recipes-connectivity/avahi/avahi.inc          | 11 +++-----
>>   .../avahi/{avahi_0.6.32.bb => avahi_0.7.bb}        |  6 ++---
>>   ...c-install-GtkBuilder-interface-files-for-.patch | 29 ---------------------
>>   .../files/avahi-fix-resource-unavaiable.patch      | 30 ----------------------
>>   5 files changed, 7 insertions(+), 75 deletions(-)
>>   rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.32.bb => avahi-ui_0.7.bb} (89%)
>>   rename meta/recipes-connectivity/avahi/{avahi_0.6.32.bb => avahi_0.7.bb} (78%)
>>   delete mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
>>   delete mode 100644 meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
>>
>> diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>> similarity index 89%
>> rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
>> rename to meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>> index ac36461..5648e38 100644
>> --- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb
>> +++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
>> @@ -9,9 +9,8 @@ require avahi.inc
>>   inherit distro_features_check
>>   ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>>
>> -SRC_URI += "file://0001-configure.ac-install-GtkBuilder-interface-files-for-.patch"
>> -SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
>> -SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
>> +SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
>> +SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
>>
>>   DEPENDS += "avahi"
>>
>> @@ -52,7 +51,6 @@ do_install_append () {
>>          rm ${D}${libdir}/pkgconfig/avahi-g*
>>          rm ${D}${sbindir} -rf
>>          rm ${D}${datadir}/avahi/a*
>> -       rm ${D}${datadir}/avahi/s*
>>          rm ${D}${datadir}/locale/ -rf
>>          rm ${D}${datadir}/dbus* -rf
>>          rm ${D}${mandir}/man1/a*
>> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
>> index 7814464..e9819bf 100644
>> --- a/meta/recipes-connectivity/avahi/avahi.inc
>> +++ b/meta/recipes-connectivity/avahi/avahi.inc
>> @@ -33,11 +33,11 @@ PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
>>   PACKAGECONFIG[pygtk] = "--enable-pygtk,--disable-pygtk,"
>>
>>   USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
>> -USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
>> +USERADD_PARAM_avahi-daemon = "--system --home /run/avahi-daemon \
>>                                 --no-create-home --shell /bin/false \
>>                                 --user-group avahi"
>>
>> -USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
>> +USERADD_PARAM_avahi-autoipd = "--system --home /run/avahi-autoipd \
>>                                 --no-create-home --shell /bin/false \
>>                                 --user-group \
>>                                 -c \"Avahi autoip daemon\" \
>> @@ -125,12 +125,7 @@ INITSCRIPT_PARAMS_avahi-dnsconfd = "defaults 22 19"
>>
>>   do_install() {
>>          autotools_do_install
>> -
>> -       # don't install /var/run when populating rootfs. Do it through volatile
>> -       # /var/run of current version is empty, so just remove it.
>> -       # if /var/run become non-empty in the future, need to install it via volatile
>> -       rm -rf ${D}${localstatedir}/run
>> -       rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
>> +       rm -rf ${D}/run
>>          rm -rf ${D}${datadir}/dbus-1/interfaces
>>          test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
>>          rm -rf ${D}${libdir}/avahi
>> diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>> similarity index 78%
>> rename from meta/recipes-connectivity/avahi/avahi_0.6.32.bb
>> rename to meta/recipes-connectivity/avahi/avahi_0.7.bb
>> index bfa6304..7c91f10 100644
>> --- a/meta/recipes-connectivity/avahi/avahi_0.6.32.bb
>> +++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
>> @@ -12,10 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>>                       file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
>>                       file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
>>
>> -SRC_URI += "file://avahi-fix-resource-unavaiable.patch"
>> -
>> -SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
>> -SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
>> +SRC_URI[md5sum] = "d76c59d0882ac6c256d70a2a585362a6"
>> +SRC_URI[sha256sum] = "57a99b5dfe7fdae794e3d1ee7a62973a368e91e414bd0dfa5d84434de5b14804"
>>
>>   DEPENDS += "intltool-native"
>>
>> diff --git a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
>> deleted file mode 100644
>> index 942607a..0000000
>> --- a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From 6ff255eff4fea6350b5e0462fee176fadc26fc1c Mon Sep 17 00:00:00 2001
>> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -Date: Sun, 12 Jun 2016 18:32:49 +0300
>> -Subject: [PATCH] configure.ac: install GtkBuilder interface files for GTK+3
>> - too
>> -
>> -Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/130]
>> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ----
>> - configure.ac | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 87a9a17..9860dcc 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -965,7 +965,7 @@ AC_SUBST(avahi_socket)
>> - #
>> - # Avahi interfaces dir
>> - #
>> --if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes"; then
>> -+if test "x$HAVE_PYTHON_DBUS" = "xyes" -o "x$HAVE_GTK" = "xyes" -o "x$HAVE_GTK3" = "xyes"; then
>> -       interfacesdir="${datadir}/${PACKAGE}/interfaces/"
>> -       AC_SUBST(interfacesdir)
>> - fi
>> ---
>> -2.8.1
>> -
>> diff --git a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch b/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
>> deleted file mode 100644
>> index 5a2fd75..0000000
>> --- a/meta/recipes-connectivity/avahi/files/avahi-fix-resource-unavaiable.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> -Backport from:
>> -https://github.com/experimental-platform/platform-hostname-avahi/pull/9
>> -
>> -It sometimes fails to run avahi with error: "Could not receive return value
>> -from daemon process". It has same root cause with
>> -https://github.com/lxc/lxc/issues/25.
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ----
>> -From 5150983102ad5ad43f0dae203cb332c168eb5a71 Mon Sep 17 00:00:00 2001
>> -From: Hinnerk Haardt <haardt@information-control.de>
>> -Date: Thu, 17 Dec 2015 11:52:19 +0100
>> -Subject: [PATCH] Fix `chroot.c: fork() failed: Resource temporarily
>> - unavailable` as per https://github.com/lxc/lxc/issues/25.
>> -
>> ----
>> - avahi-daemon/avahi-daemon.conf | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/avahi-daemon/avahi-daemon.conf b/avahi-daemon/avahi-daemon.conf
>> -index 95166f8..3d5b7a6 100644
>> ---- a/avahi-daemon/avahi-daemon.conf
>> -+++ b/avahi-daemon/avahi-daemon.conf
>> -@@ -65,4 +65,3 @@ rlimit-data=4194304
>> - rlimit-fsize=0
>> - rlimit-nofile=768
>> - rlimit-stack=4194304
>> --rlimit-nproc=3
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


