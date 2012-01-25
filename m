Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RprlL-0002sc-O1
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 02:34:59 +0100
Received: by lags15 with SMTP id s15so2718432lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=0xjOLtOhtVaWDP4f+fdsZZxtzryTlLPIW/w7/YZdJdU=;
	b=LgjWc622q95z8D4NhXxunBj0fllGNSJfVoeccO1h09segLDApsWQaMBcp+tQn4/r7V
	hPp1h5RCvK5FENu+ir87zsqsLOfGjDbT+2UWwVnBmPh8AixMeiCwDwR8W97u28MvHPZf
	AqB3VnJguxM7Kh+7cseZQ9ArHwFfBD/f8ob3o=
Received: by 10.112.32.1 with SMTP id e1mr296511lbi.3.1327454833232; Tue, 24
	Jan 2012 17:27:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 17:26:42 -0800 (PST)
In-Reply-To: <4F1F55F6.3080608@linux.intel.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
	<524198910282e9bd8d1200a1e21c818131352052.1327426808.git.raj.khem@gmail.com>
	<4F1F55F6.3080608@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 17:26:42 -0800
Message-ID: <CAMKF1spYemYppOw6u1AOUZa5jceFygYPnoEUFo6fM=UZmhZs9Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] task-core-tools: Divide it into 3 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 01:34:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 5:08 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/24/2012 09:42 AM, Khem Raj wrote:
>>
>> task-core-tools-debug, task-core-tools-profile, task-core-tools-testapps
>> otherwise if we choose one through PACKAGE_GROUPS all packages
>> are built since they are in same recipe.
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../conf/distro/include/distro_tracking_fields.inc | =C2=A0 26 +++=
++--
>> =C2=A0meta/conf/multilib.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
>> =C2=A0meta/recipes-core/tasks/task-core-tools-debug.bb =C2=A0 | =C2=A0 2=
6 ++++++
>> =C2=A0...sk-core-tools.bb =3D> =C2=A0task-core-tools-profile.bb} | =C2=
=A0 81
>> ++++++--------------
>> =C2=A0.../recipes-core/tasks/task-core-tools-testapps.bb | =C2=A0 46 +++=
++++++++
>> =C2=A05 files changed, 119 insertions(+), 64 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.b=
b
>> =C2=A0rename meta/recipes-core/tasks/{task-core-tools.bb =3D>
>> =C2=A0task-core-tools-profile.bb} (48%)
>
> This breaks meta-yocto which has a task-core-tools.bbappend

that bbappend is redundant. You should just delete it anyway from meta-yoct=
o

>
> Sau!
>
>
>> =C2=A0create mode 100644 meta/recipes-core/tasks/task-core-tools-testapp=
s.bb
>>
>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc
>> b/meta/conf/distro/include/distro_tracking_fields.inc
>> index ce88b2e..5c47fcf 100644
>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
>> @@ -2467,12 +2467,26 @@ RECIPE_LATEST_RELEASE_DATE_pn-task-core-nfs=3D"n=
/a"
>> =C2=A0RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-nfs=3D"n/a"
>> =C2=A0RECIPE_MAINTAINER_pn-task-core-nfs =3D "Dongxiao Xu<dongxiao.xu@in=
tel.com>"
>>
>> -RECIPE_STATUS_pn-task-core-tools=3D"green"
>> -RECIPE_LATEST_VERSION_pn-task-core-tools=3D"1.0"
>> -RECIPE_NO_OF_PATCHES_pn-task-core-tools=3D"0"
>> -RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools=3D"n/a"
>> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools=3D"n/a"
>> -RECIPE_MAINTAINER_pn-task-core-tools =3D "Dongxiao
>> Xu<dongxiao.xu@intel.com>"
>> +RECIPE_STATUS_pn-task-core-tools-debug=3D"green"
>> +RECIPE_LATEST_VERSION_pn-task-core-tools-debug=3D"1.0"
>> +RECIPE_NO_OF_PATCHES_pn-task-core-tools-debug=3D"0"
>> +RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-debug=3D"n/a"
>> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-debug=3D"n/a"
>> +RECIPE_MAINTAINER_pn-task-core-tools-profile =3D "Dongxiao
>> Xu<dongxiao.xu@intel.com>"
>> +
>> +RECIPE_STATUS_pn-task-core-tools-profile=3D"green"
>> +RECIPE_LATEST_VERSION_pn-task-core-tools-profile=3D"1.0"
>> +RECIPE_NO_OF_PATCHES_pn-task-core-tools-profile=3D"0"
>> +RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-profile=3D"n/a"
>> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-profile=3D"n/a=
"
>> +RECIPE_MAINTAINER_pn-task-core-tools-profile =3D "Dongxiao
>> Xu<dongxiao.xu@intel.com>"
>> +
>> +RECIPE_STATUS_pn-task-core-tools-testapps=3D"green"
>> +RECIPE_LATEST_VERSION_pn-task-core-tools-testapps=3D"1.0"
>> +RECIPE_NO_OF_PATCHES_pn-task-core-tools-testapps=3D"0"
>> +RECIPE_LATEST_RELEASE_DATE_pn-task-core-tools-testapps=3D"n/a"
>> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-tools-testapps=3D"n/=
a"
>> +RECIPE_MAINTAINER_pn-task-core-tools-testapps =3D "Dongxiao
>> Xu<dongxiao.xu@intel.com>"
>>
>> =C2=A0RECIPE_STATUS_pn-gst-meta-base=3D"green"
>> =C2=A0DISTRO_PN_ALIAS_pn-gst-meta-base =3D "Meego=3Dgstreamer Fedora=3Dg=
streamer
>> OpenSuSE=3Dgstreamer Ubuntu=3Dgstreamer0.10 Mandriva=3Dgstreamer0.10
>> Debian=3Dgstreamer0.10"
>> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
>> index 9554519..d366fd3 100644
>> --- a/meta/conf/multilib.conf
>> +++ b/meta/conf/multilib.conf
>> @@ -393,7 +393,9 @@ BBCLASSEXTEND_append_pn-task-core-lsb =3D "
>> ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-task-core-nfs =3D " ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-task-core-ssh-dropbear =3D " ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-task-core-ssh-openssh =3D " ${MULTILIBS}"
>> -BBCLASSEXTEND_append_pn-task-core-tools =3D " ${MULTILIBS}"
>> +BBCLASSEXTEND_append_pn-task-core-tools-debug =3D " ${MULTILIBS}"
>> +BBCLASSEXTEND_append_pn-task-core-tools-profile =3D " ${MULTILIBS}"
>> +BBCLASSEXTEND_append_pn-task-core-tools-testapps =3D " ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-task-core-x11 =3D " ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-task-core-x11-sato =3D " ${MULTILIBS}"
>> =C2=A0BBCLASSEXTEND_append_pn-tasks =3D " ${MULTILIBS}"
>> diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb
>> b/meta/recipes-core/tasks/task-core-tools-debug.bb
>> new file mode 100644
>> index 0000000..3c92f3f
>> --- /dev/null
>> +++ b/meta/recipes-core/tasks/task-core-tools-debug.bb
>> @@ -0,0 +1,26 @@
>> +#
>> +# Copyright (C) 2008 OpenedHand Ltd.
>> +#
>> +
>> +DESCRIPTION =3D "Debug tools tasks for OE-Core"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>> +
>> =C2=A0file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b=
4de20420"
>> +
>> +PACKAGES =3D "\
>> + =C2=A0 =C2=A0${PN} \
>> + =C2=A0 =C2=A0${PN}-dbg \
>> + =C2=A0 =C2=A0${PN}-dev \
>> + =C2=A0 =C2=A0"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +ALLOW_EMPTY =3D "1"
>> +
>> +RDEPENDS_${PN} =3D "\
>> + =C2=A0 =C2=A0gdb \
>> + =C2=A0 =C2=A0gdbserver \
>> + =C2=A0 =C2=A0tcf-agent \
>> + =C2=A0 =C2=A0rsync \
>> + =C2=A0 =C2=A0strace \
>> + =C2=A0 =C2=A0"
>> diff --git a/meta/recipes-core/tasks/task-core-tools.bb
>> b/meta/recipes-core/tasks/task-core-tools-profile.bb
>> similarity index 48%
>> rename from meta/recipes-core/tasks/task-core-tools.bb
>> rename to meta/recipes-core/tasks/task-core-tools-profile.bb
>> index 1a42f15..254d3f5 100644
>> --- a/meta/recipes-core/tasks/task-core-tools.bb
>> +++ b/meta/recipes-core/tasks/task-core-tools-profile.bb
>> @@ -2,42 +2,30 @@
>> =C2=A0# Copyright (C) 2008 OpenedHand Ltd.
>> =C2=A0#
>>
>> -DESCRIPTION =3D "Tools tasks for OE-Core"
>> +DESCRIPTION =3D "Profile tools tasks for OE-Core"
>> =C2=A0LICENSE =3D "MIT"
>> =C2=A0LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>>
>> =C2=A0file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b=
4de20420"
>> -PR =3D "r15"
>>
>> =C2=A0PACKAGES =3D "\
>> - =C2=A0 =C2=A0task-core-tools-debug \
>> - =C2=A0 =C2=A0task-core-tools-debug-dbg \
>> - =C2=A0 =C2=A0task-core-tools-debug-dev \
>> - =C2=A0 =C2=A0task-core-tools-profile \
>> - =C2=A0 =C2=A0task-core-tools-profile-dbg \
>> - =C2=A0 =C2=A0task-core-tools-profile-dev \
>> - =C2=A0 =C2=A0task-core-tools-testapps \
>> - =C2=A0 =C2=A0task-core-tools-testapps-dbg \
>> - =C2=A0 =C2=A0task-core-tools-testapps-dev \
>> + =C2=A0 =C2=A0${PN} \
>> + =C2=A0 =C2=A0${PN}-dbg \
>> + =C2=A0 =C2=A0${PN}-dev \
>> =C2=A0 =C2=A0 =C2=A0"
>>
>> =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> =C2=A0ALLOW_EMPTY =3D "1"
>>
>> -# kexec-tools doesn't work on Mips
>> -KEXECTOOLS ?=3D "kexec"
>> -KEXECTOOLS_mips ?=3D ""
>> -KEXECTOOLS_mipsel ?=3D ""
>> -KEXECTOOLS_powerpc ?=3D ""
>> -
>> -RDEPENDS_task-core-tools-debug =3D "\
>> - =C2=A0 =C2=A0gdb \
>> - =C2=A0 =C2=A0gdbserver \
>> - =C2=A0 =C2=A0tcf-agent \
>> - =C2=A0 =C2=A0rsync \
>> - =C2=A0 =C2=A0strace"
>> +RRECOMMENDS_${PN} =3D "\
>> + =C2=A0 =C2=A0perf \
>> + =C2=A0 =C2=A0trace-cmd \
>> + =C2=A0 =C2=A0kernel-module-oprofile \
>> + =C2=A0 =C2=A0blktrace \
>> + =C2=A0 =C2=A0sysprof \
>> + =C2=A0 =C2=A0"
>>
>> -RDEPENDS_task-core-tools-profile =3D "\
>> +PROFILETOOLS =3D "\
>> =C2=A0 =C2=A0 =C2=A0oprofile \
>> =C2=A0 =C2=A0 =C2=A0oprofileui-server \
>> =C2=A0 =C2=A0 =C2=A0powertop \
>> @@ -45,14 +33,6 @@ RDEPENDS_task-core-tools-profile =3D "\
>> =C2=A0 =C2=A0 =C2=A0lttng-control \
>> =C2=A0 =C2=A0 =C2=A0lttng-viewer"
>>
>> -RRECOMMENDS_task-core-tools-profile =3D "\
>> - =C2=A0 =C2=A0perf \
>> - =C2=A0 =C2=A0trace-cmd \
>> - =C2=A0 =C2=A0kernel-module-oprofile \
>> - =C2=A0 =C2=A0blktrace \
>> - =C2=A0 =C2=A0sysprof \
>> - =C2=A0 =C2=A0"
>> -
>> =C2=A0# systemtap needs elfutils which is not fully buildable on uclibc
>> =C2=A0# hence we exclude it from uclibc based builds
>> =C2=A0SYSTEMTAP =3D "systemtap"
>> @@ -66,6 +46,13 @@ SYSTEMTAP_libc-uclibc =3D ""
>>
>> =C2=A0LTTNGUST =3D "lttng-ust"
>> =C2=A0LTTNGUST_libc-uclibc =3D ""
>> +LTTNGUST_mips =3D ""
>> +
>> +# valgrind does not work on mips
>> +
>> +VALGRIND =3D "valgrind"
>> +VALGRIND_libc-uclibc =3D ""
>> +VALGRIND_mips =3D ""
>>
>> =C2=A0# =C2=A0 =C2=A0exmap-console
>> =C2=A0# =C2=A0 =C2=A0exmap-server
>> @@ -74,29 +61,9 @@ LTTNGUST_libc-uclibc =3D ""
>> =C2=A0# qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstrea=
m
>> liburcu
>> =C2=A0# (which is required by lttng-ust) may not build on other platform=
s, like
>> =C2=A0# MIPS.
>> -RDEPENDS_task-core-tools-profile_append_qemux86 =3D " valgrind lttng-us=
t
>> ${SYSTEMTAP}"
>> -RDEPENDS_task-core-tools-profile_append_qemux86-64 =3D " ${LTTNGUST}
>> ${SYSTEMTAP}"
>> -RDEPENDS_task-core-tools-profile_append_qemuppc =3D " ${LTTNGUST}
>> ${SYSTEMTAP}"
>> -RDEPENDS_task-core-tools-profile_append_qemuarm =3D " ${LTTNGUST}
>> ${SYSTEMTAP}"
>> -
>> -RDEPENDS_task-core-tools-testapps =3D "\
>> - =C2=A0 =C2=A0blktool \
>> - =C2=A0 =C2=A0fstests \
>> - =C2=A0 =C2=A0tslib-calibrate \
>> - =C2=A0 =C2=A0tslib-tests \
>> - =C2=A0 =C2=A0lrzsz \
>> - =C2=A0 =C2=A0${KEXECTOOLS} \
>> - =C2=A0 =C2=A0alsa-utils-amixer \
>> - =C2=A0 =C2=A0alsa-utils-aplay \
>> - =C2=A0 =C2=A0owl-video \
>> - =C2=A0 =C2=A0gst-meta-video \
>> - =C2=A0 =C2=A0gst-meta-audio \
>> - =C2=A0 =C2=A0mesa-demos \
>> - =C2=A0 =C2=A0x11perf \
>> - =C2=A0 =C2=A0xrestop \
>> - =C2=A0 =C2=A0xwininfo \
>> - =C2=A0 =C2=A0xprop \
>> - =C2=A0 =C2=A0xvideo-tests \
>> - =C2=A0 =C2=A0clutter-box2d \
>> - =C2=A0 =C2=A0ltp \
>> +RDEPENDS_${PN} =3D "\
>> + =C2=A0 =C2=A0${PROFILETOOLS} \
>> + =C2=A0 =C2=A0${LTTNGUST} \
>> + =C2=A0 =C2=A0${SYSTEMTAP} \
>> + =C2=A0 =C2=A0${VALGRIND} \
>> =C2=A0 =C2=A0 =C2=A0"
>> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> b/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> new file mode 100644
>> index 0000000..b5847f8
>> --- /dev/null
>> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
>> @@ -0,0 +1,46 @@
>> +#
>> +# Copyright (C) 2008 OpenedHand Ltd.
>> +#
>> +
>> +DESCRIPTION =3D "Test apps task for OE-Core"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
>> +
>> =C2=A0file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b=
4de20420"
>> +
>> +PACKAGES =3D "\
>> + =C2=A0 =C2=A0${PN} \
>> + =C2=A0 =C2=A0${PN}-dbg \
>> + =C2=A0 =C2=A0${PN}-dev \
>> + =C2=A0 =C2=A0"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +ALLOW_EMPTY =3D "1"
>> +
>> +# kexec-tools doesn't work on Mips
>> +KEXECTOOLS ?=3D "kexec"
>> +KEXECTOOLS_mips ?=3D ""
>> +KEXECTOOLS_mipsel ?=3D ""
>> +KEXECTOOLS_powerpc ?=3D ""
>> +
>> +RDEPENDS_${PN} =3D "\
>> + =C2=A0 =C2=A0blktool \
>> + =C2=A0 =C2=A0fstests \
>> + =C2=A0 =C2=A0tslib-calibrate \
>> + =C2=A0 =C2=A0tslib-tests \
>> + =C2=A0 =C2=A0lrzsz \
>> + =C2=A0 =C2=A0${KEXECTOOLS} \
>> + =C2=A0 =C2=A0alsa-utils-amixer \
>> + =C2=A0 =C2=A0alsa-utils-aplay \
>> + =C2=A0 =C2=A0owl-video \
>> + =C2=A0 =C2=A0gst-meta-video \
>> + =C2=A0 =C2=A0gst-meta-audio \
>> + =C2=A0 =C2=A0mesa-demos \
>> + =C2=A0 =C2=A0x11perf \
>> + =C2=A0 =C2=A0xrestop \
>> + =C2=A0 =C2=A0xwininfo \
>> + =C2=A0 =C2=A0xprop \
>> + =C2=A0 =C2=A0xvideo-tests \
>> + =C2=A0 =C2=A0clutter-box2d \
>> + =C2=A0 =C2=A0ltp \
>> + =C2=A0 =C2=A0"


