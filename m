Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAMw5-0001CD-Jh
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:54:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2LEjswR006197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:45:54 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Mar 2012 07:45:55 -0700
Message-ID: <4F69E9A1.2080505@windriver.com>
Date: Wed, 21 Mar 2012 22:45:53 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1332318835.git.liezhi.yang@windriver.com>
	<89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
	<1332333371.9740.150.camel@ted>
In-Reply-To: <1332333371.9740.150.camel@ted>
Subject: Re: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
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
X-List-Received-Date: Wed, 21 Mar 2012 14:54:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Richard,

Please see my comments inline ...

On 03/21/2012 08:36 PM, Richard Purdie wrote:
> On Wed, 2012-03-21 at 16:38 +0800, Robert Yang wrote:
>> Remove the do_configure_prepend which is used for removing
>> ${S}/m4/lib-link.m4 to compile under libtool 2.2.2, but our libtool has
>> been upgraded to 2.4.2, and:
>>
>> for the 3 recipes:
>>      gst-plugins-bad_0.10.22.bb
>>      gst-plugins-base_0.10.35.bb
>>      gst-plugins-good_0.10.30.bb
>>
>> They don't have m4/lib-link.m4 any more.
>>
>> For the gst-plugins-ugly_0.10.18.bb, though it has m4/lib-link.m4, our
>> libtool version is now 2.4.2, so we can remove the do_configure_prepend
>> from all of them.
>>
>> [YOCTO #2148]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>>   .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
>>   .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
>>   .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
>>   .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
>>   4 files changed, 4 insertions(+), 24 deletions(-)
>
> Not so easy I'm afraid. We need to ensure our libtool is being used.
> Even if the version matches, our libtool is patched to ensure the
> sysroot and rpaths work correctly. I'm therefore a little nervous about
> removing these at this point.
>

Yes, I agree with you, though I checked the log.do_configure and log.do_compile, 
it used our libtool. The safe way maybe just remove the
do_configure_prepend from gst-plugins-bad, gst-plugins-base and
gst-plugins-good since they don't have the ${S}/m4/lib-link.m4 any more.

For gst-plugins-ugly, we can remove when it would not have ${S}/m4/lib-link.m4.

I noticed this because there was error when build gst-plugins-base/bad/good:

rm: cannot remove `/path/to/m4/lib-link.m4': No such file or directory.

Here is an updated patch and pull request which only removes
do_configure_prepend for gst-plugins-base/bad/good:
(I'm not sure whether send a V2 is preferred or not for such case).

git://git.pokylinux.org/poky-contrib robert/gst_v2
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/gst_v2

Subject: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend

Remove the do_configure_prepend which is used for removing
${S}/m4/lib-link.m4, but the 3 recipes don't have m4/lib-link.m4 any
more:
     gst-plugins-bad_0.10.22.bb
     gst-plugins-base_0.10.35.bb
     gst-plugins-good_0.10.30.bb

[YOCTO #2148]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
  .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
  .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
  .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
  3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb 
b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index 2c97a10..5c613c3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = 
"file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \

  DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"

-PR = "r3"
+PR = "r4"

  inherit gettext

@@ -17,10 +17,5 @@ EXTRA_OECONF += "--disable-examples --disable-experimental 
--disable-sdl --disab

  ARM_INSTRUCTION_SET = "arm"

-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
-}
-
  SRC_URI[md5sum] = "9a2acee1f386f71247003d0d7090fb1c"
  SRC_URI[sha256sum] = 
"d8f7102f43ffea076646427115ffdccb3975954f1e9367bd304f7ee01e12070c"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb 
b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index 93f8eb3..812d209 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -14,13 +14,8 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
  SRC_URI[md5sum] = "1d300983525f4f09030eb3ba47cb04b0"
  SRC_URI[sha256sum] = 
"cd24f01bb5258a1f400bc4f2c212bb7cee9ee23c9ffb80d537a24ef366d17103"

-PR = "r1"
+PR = "r2"

  inherit gettext

  EXTRA_OECONF += "--disable-freetypetest --disable-pango --disable-gnome_vfs"
-
-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm -f ${S}/m4/lib-link.m4
-}
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb 
b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
index ebd49ab..7810b5b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
@@ -7,17 +7,12 @@ LIC_FILES_CHKSUM = 
"file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \

  DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
  	    speex libsoup-2.4 pulseaudio"
-PR = "r5"
+PR = "r6"

  inherit gettext gconf

  EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 
--disable-libcaca --disable-hal --without-check"

-do_configure_prepend() {
-	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-	rm ${S}/m4/lib-link.m4 || true
-}
-
  SRC_URI[md5sum] = "62fd7a3ef187c4f99b3d7c352d58dae9"
  SRC_URI[sha256sum] = 
"b12cba90b27d8423cd0a808939098d19db3996cfb9bf528507c6321782e095f6"

-- 
1.7.1


// Robert



> If we go through autoconf and automake and make sure our .m4 files are
> used in preference to the recipe source supplied ones, I'll consider
> patches like this but not until we've verified that.
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


