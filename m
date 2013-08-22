Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0266B41B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 22:21:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 15:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,937,1367996400"; d="scan'208";a="391849736"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2013 15:20:52 -0700
Message-ID: <52168EC4.8060401@linux.intel.com>
Date: Thu, 22 Aug 2013 15:20:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1374595208-17628-1-git-send-email-cristian.iorga@intel.com>
	<52165B77.2050602@linux.intel.com>
In-Reply-To: <52165B77.2050602@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: upgrade to v4.0
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
X-List-Received-Date: Thu, 22 Aug 2013 22:21:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 11:41 AM, Saul Wold wrote:
>
> I found a floating dependency on gtk+3, and that the configure for 4.0
> takes a different set of options:
>
> configure:29775: WARNING: unrecognized options: --disable-lynx,
> --disable-polkit, --without-jack, --with-glib, --with-alsa, --with-oss,
> --without-hal, --disable-hal, --enable-gtk2
>
> If you look at configure --help for pulse audio, there is an updated
> list of options.  There might be a little challenging with gtk+3 since
> it's enabled by default and we want to disable it when no x11
> DISTRO_FEATURE is there, so look at this carefully.
>
I provided a patch for this already, but you might want to review the 
options that we have enabled, we might want to consider disabling some more.

Sau!

> Sau!
>
>
> On 07/23/2013 09:00 AM, Cristian Iorga wrote:
>> pulseaudio_fix_for_x32.patch removed;
>> included in upstream.
>> general recipe clean-up (multiple src URI removed,
>> inheritance grouping, dependency grouping).
>> parallel make is now active (was disabled in version 0.9).
>>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    9 +-
>>   .../pulseaudio/pulseaudio_fix_for_x32.patch        |  238
>> --------------------
>>   .../{pulseaudio_3.0.bb => pulseaudio_4.0.bb}       |   11 +-
>>   3 files changed, 5 insertions(+), 253 deletions(-)
>>   delete mode 100644
>> meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
>>
>>   rename meta/recipes-multimedia/pulseaudio/{pulseaudio_3.0.bb =>
>> pulseaudio_4.0.bb} (51%)
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> index d4f66e6..d3f6d17 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> @@ -7,15 +7,13 @@ LIC_FILES_CHKSUM =
>> "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>>                       file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>>
>> file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270
>> \
>>
>> file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
>>
>> +
>>   DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
>>   # optional
>>   DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
>> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>>
>> -SRC_URI =
>> "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
>> -           file://gcc4-compile-fix.patch \
>> -           file://volatiles.04_pulse"
>> -
>> -inherit autotools pkgconfig useradd
>> +inherit autotools pkgconfig useradd gettext perlnative
>>
>>   # *.desktop rules wont be generated during configure and build will
>> fail
>>   # if using --disable-nls
>> @@ -53,7 +51,6 @@ PACKAGECONFIG[avahi] =
>> "--enable-avahi,--disable-avahi,avahi"
>>
>>   EXTRA_OECONF_append_arm += "${@bb.utils.contains("TUNE_FEATURES",
>> "neon", "", "--enable-neon-opt=no", d)}"
>>
>> -PARALLEL_MAKE = ""
>>
>>   export TARGET_PFPU = "${TARGET_FPU}"
>>
>> diff --git
>> a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
>> b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
>>
>> deleted file mode 100644
>> index b68ac5b..0000000
>> ---
>> a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio_fix_for_x32.patch
>>
>> +++ /dev/null
>> @@ -1,238 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -This patch makes assembly syntax compatible to the x32 toolchain.
>> -
>> -This fixes these kinds of compilations errors with x32 gcc.
>> -| pulsecore/svolume_mmx.c: Assembler messages:
>> -| pulsecore/svolume_mmx.c:107: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:135: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:161: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:162: Error: `8(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:180: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:210: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:244: Error: `(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| pulsecore/svolume_mmx.c:245: Error: `8(%esi,%rdi,4)' is not a valid
>> base/index expression
>> -| make[3]: *** [libpulsecore_1.1_la-svolume_mmx.lo] Error 1
>> -
>> -Orignally these assembly lines are written for x86_64 ABI, now they
>> are also compatible with
>> -X32 ABI.
>> -
>> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/03
>> -Index: pulseaudio-1.1/src/pulsecore/svolume_mmx.c
>> -===================================================================
>> ---- pulseaudio-1.1.orig/src/pulsecore/svolume_mmx.c
>> -+++ pulseaudio-1.1/src/pulsecore/svolume_mmx.c
>> -@@ -107,7 +107,7 @@ static void pa_volume_s16ne_mmx(int16_t
>> -         " test $1, %2                   \n\t" /* check for odd
>> samples */
>> -         " je 2f                         \n\t"
>> -
>> --        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
>> -+        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
>> -         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
>> -         " movd %4, %%mm1                \n\t"
>> -         VOLUME_32x16 (%%mm1, %%mm0)
>> -@@ -122,7 +122,7 @@ static void pa_volume_s16ne_mmx(int16_t
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t" /* do samples in
>> groups of 2 */
>> --        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -         " movd (%0), %%mm1              \n\t" /*              .. |
>> p1  |  p0   | */
>> -         VOLUME_32x16 (%%mm1, %%mm0)
>> -         " movd %%mm0, (%0)              \n\t" /*              .. |
>> p1*v1 | p0*v0 | */
>> -@@ -135,8 +135,8 @@ static void pa_volume_s16ne_mmx(int16_t
>> -         " je 6f                         \n\t"
>> -
>> -         "5:                             \n\t" /* do samples in
>> groups of 4 */
>> --        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> --        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |
>> v2h  |  v2l  | */
>> -+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |
>> v2h  |  v2l  | */
>> -         " movd (%0), %%mm1              \n\t" /*              .. |
>> p1  |  p0   | */
>> -         " movd 4(%0), %%mm3             \n\t" /*              .. |
>> p3  |  p2   | */
>> -         VOLUME_32x16 (%%mm1, %%mm0)
>> -@@ -180,7 +180,7 @@ static void pa_volume_s16re_mmx(int16_t
>> -         " test $1, %2                   \n\t" /* check for odd
>> samples */
>> -         " je 2f                         \n\t"
>> -
>> --        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
>> -+        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
>> -         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
>> -         " rorw $8, %w4                  \n\t"
>> -         " movd %4, %%mm1                \n\t"
>> -@@ -197,7 +197,7 @@ static void pa_volume_s16re_mmx(int16_t
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t" /* do samples in
>> groups of 2 */
>> --        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -         " movd (%0), %%mm1              \n\t" /*              .. |
>> p1  |  p0   | */
>> -         SWAP_16 (%%mm1)
>> -         VOLUME_32x16 (%%mm1, %%mm0)
>> -@@ -212,8 +212,8 @@ static void pa_volume_s16re_mmx(int16_t
>> -         " je 6f                         \n\t"
>> -
>> -         "5:                             \n\t" /* do samples in
>> groups of 4 */
>> --        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> --        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |
>> v2h  |  v2l  | */
>> -+        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |
>> v2h  |  v2l  | */
>> -         " movd (%0), %%mm1              \n\t" /*              .. |
>> p1  |  p0   | */
>> -         " movd 4(%0), %%mm3             \n\t" /*              .. |
>> p3  |  p2   | */
>> -         SWAP_16_2 (%%mm1, %%mm3)
>> -Index: pulseaudio-1.1/src/pulsecore/svolume_sse.c
>> -===================================================================
>> ---- pulseaudio-1.1.orig/src/pulsecore/svolume_sse.c
>> -+++ pulseaudio-1.1/src/pulsecore/svolume_sse.c
>> -@@ -92,7 +92,7 @@ static void pa_volume_s16ne_sse2(int16_t
>> -         " test $1, %2                   \n\t" /* check for odd
>> samples */
>> -         " je 2f                         \n\t"
>> -
>> --        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
>> -+        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
>> -         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
>> -         " movd %4, %%xmm1               \n\t"
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -@@ -107,7 +107,7 @@ static void pa_volume_s16ne_sse2(int16_t
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t" /* do samples in
>> groups of 2 */
>> --        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -         " movd (%0), %%xmm1             \n\t" /*              .. |
>> p1  |  p0   | */
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -         " movd %%xmm0, (%0)             \n\t" /*              .. |
>> p1*v1 | p0*v0 | */
>> -@@ -123,7 +123,7 @@ static void pa_volume_s16ne_sse2(int16_t
>> -          * that the array is 16 bytes aligned, we probably have to
>> do the odd values
>> -          * after this then. */
>> -         "5:                             \n\t" /* do samples in
>> groups of 4 */
>> --        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..
>> v0h  |  v0l  | */
>> -+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l
>> ..  v0h  |  v0l  | */
>> -         " movq (%0), %%xmm1             \n\t" /*              .. |
>> p3  ..  p0   | */
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -         " movq %%xmm0, (%0)             \n\t" /*              .. |
>> p3*v3 .. p0*v0 | */
>> -@@ -136,8 +136,8 @@ static void pa_volume_s16ne_sse2(int16_t
>> -         " je 8f                         \n\t"
>> -
>> -         "7:                             \n\t" /* do samples in
>> groups of 8 */
>> --        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..
>> v0h  |  v0l  | */
>> --        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..
>> v4h  |  v4l  | */
>> -+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l
>> ..  v0h  |  v0l  | */
>> -+        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l
>> ..  v4h  |  v4l  | */
>> -         " movq (%0), %%xmm1             \n\t" /*              .. |
>> p3  ..  p0   | */
>> -         " movq 8(%0), %%xmm3            \n\t" /*              .. |
>> p7  ..  p4   | */
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -@@ -176,7 +176,7 @@ static void pa_volume_s16re_sse2(int16_t
>> -         " test $1, %2                   \n\t" /* check for odd
>> samples */
>> -         " je 2f                         \n\t"
>> -
>> --        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
>> -+        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
>> -         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
>> -         " rorw $8, %w4                  \n\t"
>> -         " movd %4, %%xmm1               \n\t"
>> -@@ -193,7 +193,7 @@ static void pa_volume_s16re_sse2(int16_t
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t" /* do samples in
>> groups of 2 */
>> --        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -+        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |
>> v0h  |  v0l  | */
>> -         " movd (%0), %%xmm1             \n\t" /*              .. |
>> p1  |  p0   | */
>> -         SWAP_16 (%%xmm1)
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -@@ -211,7 +211,7 @@ static void pa_volume_s16re_sse2(int16_t
>> -          * that the array is 16 bytes aligned, we probably have to
>> do the odd values
>> -          * after this then. */
>> -         "5:                             \n\t" /* do samples in
>> groups of 4 */
>> --        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..
>> v0h  |  v0l  | */
>> -+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l
>> ..  v0h  |  v0l  | */
>> -         " movq (%0), %%xmm1             \n\t" /*              .. |
>> p3  ..  p0   | */
>> -         SWAP_16 (%%xmm1)
>> -         VOLUME_32x16 (%%xmm1, %%xmm0)
>> -@@ -226,8 +226,8 @@ static void pa_volume_s16re_sse2(int16_t
>> -         " je 8f                         \n\t"
>> -
>> -         "7:                             \n\t" /* do samples in
>> groups of 8 */
>> --        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..
>> v0h  |  v0l  | */
>> --        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..
>> v4h  |  v4l  | */
>> -+        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l
>> ..  v0h  |  v0l  | */
>> -+        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l
>> ..  v4h  |  v4l  | */
>> -         " movq (%0), %%xmm1             \n\t" /*              .. |
>> p3  ..  p0   | */
>> -         " movq 8(%0), %%xmm3            \n\t" /*              .. |
>> p7  ..  p4   | */
>> -         SWAP_16_2 (%%xmm1, %%xmm3)
>> -Index: pulseaudio-1.1/src/pulsecore/sconv_sse.c
>> -===================================================================
>> ---- pulseaudio-1.1.orig/src/pulsecore/sconv_sse.c
>> -+++ pulseaudio-1.1/src/pulsecore/sconv_sse.c
>> -@@ -54,8 +54,8 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -         " je 2f                         \n\t"
>> -
>> -         "1:                             \n\t"
>> --        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
>> --        " movups 16(%2, %0, 2), %%xmm2  \n\t"
>> -+        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
>> -+        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
>> -         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
>> -         " minps  %%xmm5, %%xmm2         \n\t"
>> -         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
>> -@@ -72,8 +72,8 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -
>> -         " packssdw %%mm1, %%mm0         \n\t" /* pack parts */
>> -         " packssdw %%mm3, %%mm2         \n\t"
>> --        " movq     %%mm0, (%3, %0)      \n\t"
>> --        " movq    %%mm2, 8(%3, %0)     \n\t"
>> -+        " movq     %%mm0, (%q3, %0)      \n\t"
>> -+        " movq    %%mm2, 8(%q3, %0)     \n\t"
>> -
>> -         " add $16, %0                   \n\t"
>> -         " dec %1                        \n\t"
>> -@@ -85,12 +85,12 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t"
>> --        " movss (%2, %0, 2), %%xmm0     \n\t"
>> -+        " movss (%q2, %0, 2), %%xmm0     \n\t"
>> -         " minss  %%xmm5, %%xmm0         \n\t"
>> -         " maxss  %%xmm6, %%xmm0         \n\t"
>> -         " mulss  %%xmm7, %%xmm0         \n\t"
>> -         " cvtss2si %%xmm0, %4           \n\t"
>> --        " movw  %w4, (%3, %0)           \n\t"
>> -+        " movw  %w4, (%q3, %0)           \n\t"
>> -         " add $2, %0                    \n\t"
>> -         " dec %1                        \n\t"
>> -         " jne 3b                        \n\t"
>> -@@ -119,8 +119,8 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -         " je 2f                         \n\t"
>> -
>> -         "1:                             \n\t"
>> --        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
>> --        " movups 16(%2, %0, 2), %%xmm2  \n\t"
>> -+        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
>> -+        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
>> -         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
>> -         " minps  %%xmm5, %%xmm2         \n\t"
>> -         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
>> -@@ -132,7 +132,7 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -         " cvtps2dq %%xmm2, %%xmm2       \n\t"
>> -
>> -         " packssdw %%xmm2, %%xmm0       \n\t"
>> --        " movdqu   %%xmm0, (%3, %0)     \n\t"
>> -+        " movdqu   %%xmm0, (%q3, %0)     \n\t"
>> -
>> -         " add $16, %0                   \n\t"
>> -         " dec %1                        \n\t"
>> -@@ -144,12 +144,12 @@ static void pa_sconv_s16le_from_f32ne_ss
>> -         " je 4f                         \n\t"
>> -
>> -         "3:                             \n\t"
>> --        " movss (%2, %0, 2), %%xmm0     \n\t"
>> -+        " movss (%q2, %0, 2), %%xmm0     \n\t"
>> -         " minss  %%xmm5, %%xmm0         \n\t"
>> -         " maxss  %%xmm6, %%xmm0         \n\t"
>> -         " mulss  %%xmm7, %%xmm0         \n\t"
>> -         " cvtss2si %%xmm0, %4           \n\t"
>> --        " movw  %w4, (%3, %0)           \n\t"
>> -+        " movw  %w4, (%q3, %0)           \n\t"
>> -         " add $2, %0                    \n\t"
>> -         " dec %1                        \n\t"
>> -         " jne 3b                        \n\t"
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
>> b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
>> similarity index 51%
>> rename from meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
>> rename to meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
>> index 3621452..b419c54 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
>> @@ -1,19 +1,12 @@
>>   require pulseaudio.inc
>>
>> -PR = "r0"
>> -
>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>> -
>> -inherit gettext perlnative
>> -
>>   SRC_URI =
>> "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz
>> \
>>              file://volatiles.04_pulse"
>>
>> -SRC_URI[md5sum] = "47fd7eca8479c757822bee68a1feef25"
>> -SRC_URI[sha256sum] =
>> "c90bfda29605942d08e3e218ef10e3c660506a06651a616bfbb6a6df8392836d"
>> +SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
>> +SRC_URI[sha256sum] =
>> "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
>>
>>   do_compile_prepend() {
>>       mkdir -p ${S}/libltdl
>>       cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
>>   }
>> -
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

