Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UOF5H-0001bE-6k
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 00:26:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Apr 2013 15:08:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,417,1363158000"; d="scan'208";a="314373764"
Received: from unknown (HELO [10.255.14.17]) ([10.255.14.17])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2013 15:08:55 -0700
Message-ID: <515F4B76.2040607@linux.intel.com>
Date: Fri, 05 Apr 2013 15:08:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Yevhen Kyriukha <kirgene@gmail.com>
References: <1365196380-1930-1-git-send-email-kirgene@gmail.com>
	<20130405212904.GH3191@jama>
In-Reply-To: <20130405212904.GH3191@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: added python-systemd package generation.
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
X-List-Received-Date: Fri, 05 Apr 2013 22:26:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2013 02:29 PM, Martin Jansa wrote:
> On Sat, Apr 06, 2013 at 12:13:00AM +0300, Yevhen Kyriukha wrote:
>> ---
>>   meta/recipes-core/systemd/systemd_199.bb |   21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
>> index ba1d133..2a3d351 100644
>> --- a/meta/recipes-core/systemd/systemd_199.bb
>> +++ b/meta/recipes-core/systemd/systemd_199.bb
>> @@ -10,12 +10,18 @@ PROVIDES = "udev"
>>
>>   PE = "1"
>>
>> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
>> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 python"
>>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>>

I am going to defer this for 1.5, as it's a little late in the 1.4 cycle 
to make this kind of change.  I would also like you to consider making 
it a PACKAGECONFIG, instead of hard wiring it.

If someone wants to create a minimal system with systemd, they might not 
want to have python pulled in also, so making it more optional would be 
better.

Thanks
	Sau!


>>   SECTION = "base/shell"
>>
>> -inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d
>> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d pythonnative python-dir
>> +
>> +# need to export these variables for python-config to work
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>>
>>   SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>>              file://touchscreen.rules \
>> @@ -63,9 +69,9 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
>>                    --disable-coredump \
>>                    --disable-introspection \
>>                    --disable-tcpwrap \
>> +                 --with-python \
>>                    --enable-split-usr \
>>                    --disable-microhttpd \
>> -                 --without-python \
>>                    --with-sysvrcnd-path=${sysconfdir} \
>>                    ac_cv_path_KILL=${base_bindir}/kill \
>>                  "
>> @@ -114,7 +120,7 @@ python populate_packages_prepend (){
>>   }
>>   PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
>>
>> -PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install python-${PN} python-${PN}-dbg python-${PN}-staticdev"
>>
>>   USERADD_PACKAGES = "${PN}"
>>   GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>> @@ -124,6 +130,13 @@ FILES_${PN}-analyze = "${base_bindir}/systemd-analyze"
>>   FILES_${PN}-initramfs = "/init"
>>   RDEPENDS_${PN}-initramfs = "${PN}"
>>
>> +FILES_python-${PN} = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
>> +RDEPENDS_python-${PN} = "python-core"
>> +FILES_python-${PN}-staticdev = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
>> +RDEPENDS_python-${PN} = "python-core"
>> +FILES_python-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/systemd/.debug"
>> +RDEPENDS_python-${PN} = "python-core"
>
> You have 3x RDEPENDS_python-${PN} (maybe you wanted -dbg and -staticdev,
> but those do not need python-core imho).
>
> It's more common to start with ${PN}, but maybe it makes sense with
> python- prefix if you think about it as python module not systemd
> package...
>
>> +
>>   FILES_${PN}-gui = "${bindir}/systemadm"
>>
>>   FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


