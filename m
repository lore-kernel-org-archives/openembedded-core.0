Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2635B60780
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 10:21:07 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id hu16so1624069qab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2CqQw0dcTjd8vSS5btYtMZrMp4LlFEaU6S3EJ8H9vyE=;
	b=CZTiMH3pY+6V4RW2tHSOp5gpvJIuj9w5WqTGqZQQ19MMkisb6mOiwOhb+tEcGHAbfT
	Uod0+ZmXDfaDgXiyqEA/qztLXKXgNGC25N7k4SWKHxNCv2mDcIkt0mFeUt9pm6p9828Y
	e5eu4iP4z+l5zkW4Q5Jaztq7yWxQFqiwO57hSJ1Vw4QzR+Y7+37NJFni1BrEaSaVhPSG
	BhPtqkaX3uIXgqxKvqSn+He/1zslywDAnh+jq46D6lWhQ+3NuG39Ue1C7RDGPhmGFSXp
	LMUy87UM+L+j7JwMtf+IU4U6cNS3xyik3PYq1/5dFmOmtUHs9NhMc2PczCH/IYYwlwpr
	5fxA==
MIME-Version: 1.0
X-Received: by 10.224.180.133 with SMTP id bu5mr2514452qab.50.1371982867295;
	Sun, 23 Jun 2013 03:21:07 -0700 (PDT)
Received: by 10.49.59.3 with HTTP; Sun, 23 Jun 2013 03:21:07 -0700 (PDT)
In-Reply-To: <CA+chaQcfgpbEjMZ8pKoP6BWkXrdQYw6+MEDc2yu8sYS1QRsQOA@mail.gmail.com>
References: <1371951415-52721-1-git-send-email-kirgene@gmail.com>
	<CA+chaQcfgpbEjMZ8pKoP6BWkXrdQYw6+MEDc2yu8sYS1QRsQOA@mail.gmail.com>
Date: Sun, 23 Jun 2013 13:21:07 +0300
Message-ID: <CADV-EXGjDtAyJMc7n1M8SaUjiNPw5U9p6CYNaFEXqy5XXSqaUw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] systemd: added python-systemd package generation.
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
X-List-Received-Date: Sun, 23 Jun 2013 10:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oh, yes.
You should move "pythonnative python-dir" from DEPENDS and append to inherit.
Best regards,
Yevhen


2013/6/23 Martin Jansa <martin.jansa@gmail.com>:
> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
> pythonnative python-dir"
>
> This doesn't look right, did you want to inherit them?
>
>
> On Sun, Jun 23, 2013 at 3:36 AM, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>>
>> ---
>>  meta/recipes-core/systemd/systemd_204.bb |   20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_204.bb
>> b/meta/recipes-core/systemd/systemd_204.bb
>> index b8b1290..ea0cdd2 100644
>> --- a/meta/recipes-core/systemd/systemd_204.bb
>> +++ b/meta/recipes-core/systemd/systemd_204.bb
>> @@ -10,9 +10,15 @@ PROVIDES = "udev"
>>
>>  PE = "1"
>>
>> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
>> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
>> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
>> acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux
>> pythonnative python-dir"
>>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>
>> +# need to export these variables for python-config to work
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +
>>  SECTION = "base/shell"
>>
>>  inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> update-alternatives qemu
>> @@ -51,6 +57,8 @@ DEPENDS += "libgcrypt"
>>  # Compress the journal
>>  PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
>>  PACKAGECONFIG[tcp-wrappers] =
>> "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
>> +# Use python-systemd
>> +PACKAGECONFIG[python] = "--with-python,--without-python,python"
>>
>>  CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
>>
>> @@ -71,7 +79,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>>                   --disable-tcpwrap \
>>                   --enable-split-usr \
>>                   --disable-microhttpd \
>> -                 --without-python \
>>                   --with-sysvrcnd-path=${sysconfdir} \
>>                   --with-firmware-path=/lib/firmware \
>>                   ac_cv_path_KILL=${base_bindir}/kill \
>> @@ -93,6 +100,8 @@ do_install() {
>>         # Provided by a separate recipe
>>         rm ${D}${systemd_unitdir}/system/serial-getty* -f
>>
>> +       rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/systemd/*.la
>> +
>>         # Provide support for initramfs
>>         ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
>>         ln -s ${rootlibexecdir}/systemd/systemd-udevd
>> ${D}/${base_sbindir}/udevd
>> @@ -121,7 +130,7 @@ python populate_packages_prepend (){
>>  }
>>  PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>>
>> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
>> ${PN}-kernel-install"
>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze
>> ${PN}-kernel-install python-${PN}"
>>
>>  USERADD_PACKAGES = "${PN}"
>>  GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>> @@ -131,6 +140,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>>  FILES_${PN}-initramfs = "/init"
>>  RDEPENDS_${PN}-initramfs = "${PN}"
>>
>> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py*
>> ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
>> +RDEPENDS_python-${PN} = "python-core python-datetime python-logging
>> python-syslog"
>> +
>>  FILES_${PN}-gui = "${bindir}/systemadm"
>>
>>  FILES_${PN}-vconsole-setup =
>> "${rootlibexecdir}/systemd/systemd-vconsole-setup \
>> @@ -187,7 +199,7 @@ FILES_${PN} = " ${base_bindir}/* \
>>                  /lib/udev/rules.d/99-systemd.rules \
>>                 "
>>
>> -FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug
>> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
>> +FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug
>> ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/
>> ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>>  FILES_${PN}-dev += "${base_libdir}/security/*.la
>> ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>>
>>  RDEPENDS_${PN} += "dbus util-linux-mount"
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

