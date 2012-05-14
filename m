Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1STx6c-0004sC-Ut
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 17:22:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4EFCcE2007783
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 08:12:38 -0700 (PDT)
Received: from msp-dhcp25.wrs.com (172.25.34.25) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 08:12:37 -0700
Message-ID: <4FB120E4.4070105@windriver.com>
Date: Mon, 14 May 2012 10:12:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336719792.git.xiaofeng.yan@windriver.com>
	<7e9ada8b4a3af9425d343f37de63536abd7de711.1336719792.git.xiaofeng.yan@windriver.com>
	<4FADF81A.9010005@linux.intel.com>
In-Reply-To: <4FADF81A.9010005@linux.intel.com>
Subject: Re: [PATCH 2/2] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Mon, 14 May 2012 15:22:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/12 12:41 AM, Saul Wold wrote:
> On 05/11/2012 12:23 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> LSB Test Suite complains "No library libgdk_pixbuf_xlib-2.0.so.0" \
>> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
>> Use the linuxstdbase override and also make it conditional on x11 \
>> being in DISTRO_FEATURES for passing lsb test.
>> Split libgdk_pixbuf_xlib to a single package.
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>    meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   11 +++++++++--
>>    1 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> index e31f717..a88700b 100644
>> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
>> @@ -19,7 +19,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
>>    SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
>>    SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
>>
>> -PR = "r0"
>> +PR = "r1"
>>
>>    inherit autotools pkgconfig gettext
>>
>> @@ -28,9 +28,16 @@ LIBV = "2.10.0"
>>    EXTRA_OECONF = "\
>>      --without-libtiff \
>>      --with-libpng \
>> -  --without-x11 \
>> +  ${X11DEPENDS} \
>>      --disable-introspection \
>>    "
>> +X11DEPENDS = "--without-x11"
>> +X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
>> +
> I hate to ask this after this has already been merged, but should this
> really have been more generic or do other packages need to be fixed
> since we are seeing failures in the non-LSB case of this new -xlib
> package being depended on.
>
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-png-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-jpeg-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-xpm-2.24.1-r1.armv5te
> | 	gdk-pixbuf-xlib is needed by gdk-pixbuf-loader-gif-2.24.1-r1.armv5te

BTW I agree, there is nothing linuxstdbase specific about this check.  We have a 
distro policy w/ x11, then we should enabled this in gdk-pixbuf.  (The rest of 
the bug it looks like Richard has already worked on.)

--Mark

> Sau!
>
>> +PACKAGES =+ "${PN}-xlib"
>> +
>> +FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
>> +RPROVIDES_${PN}-xlib = "${PN}-xlib"
>>
>>    FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
>>    	${libdir}/lib*.so.*"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



