Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTTqb-0007TK-8f
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 08:35:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO7TJxM011679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 23:29:19 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 23:29:18 -0800
Message-ID: <4ECDF204.7000105@windriver.com>
Date: Thu, 24 Nov 2011 15:28:04 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>	<20d46c74e1c1de68ca86b5b7eded5ae66a142e85.1322102636.git.xiaofeng.yan@windriver.com>
	<2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
In-Reply-To: <2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 3/9] gtk.inc: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 07:35:53 -0000
Content-Type: multipart/alternative;
	boundary="------------020608070304090106060706"

--------------020608070304090106060706
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?11?24? 14:38, Koen Kooi wrote:
> Op 24 nov. 2011, om 04:06 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
>> the configuration related to x11 should be disabled and directfb should be enabled.
> Apart from this patch is messing with PACKAGES as well, I still don't believe it's true that x11 must be disabled for directfb to work
>
>
As what I explained yesterday, One main goal of this image is to remove 
the stuff related to x11 because I want to build an image only based on 
directfb and run gtk over directfb.
you know, directfb as a graphic library is enough in many embedded 
development. It has many advantages in embedded field like digital 
television, set-top box, ...  Of course, it has its defect in other 
aspect. So x11 is not needed in this image.  I just don't want to let 
user to take too much time for building an image including directfb with 
no x11 during developing product.
>> [YOCTO #1674]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-gnome/gtk+/gtk+.inc |   20 ++++++++++++++++----
>> 1 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
>> index 0e5c45c..926f7dd 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
>> @@ -9,13 +9,20 @@ LICENSE = "LGPLv2&  LGPLv2+&  LGPLv2.1+"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>>
>> SECTION = "libs"
>> -DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
>> -           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
>> -           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
>> +X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
>> +
>> +DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
>> +           libgcrypt cairo gdk-pixbuf"
>> +
>> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
>> +
>> +PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
>> +PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
>>
>> inherit autotools pkgconfig
>>
>> -PACKAGES += "libgail"
>> +PACKAGES += "libgail gtk-demo"
>>
>> FILES_${PN} = "${bindir}/gtk-update-icon-cache \
>> 	${bindir}/gtk-query-immodules-2.0 \
>> @@ -40,6 +47,11 @@ FILES_${PN}-dbg += " \
>> 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
>> 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
>>
>> +FILES_gtk-demo = " \
>> +        ${datadir}/gtk-2.0/demo/* \
>> +        ${bindir}/gtk-demo \
>> +        "
>> +
>> FILES_libgail = " \
>> 	${libdir}/gtk-2.0/modules/libgail.so \
>> 	${libdir}/gtk-2.0/modules/libferret.so \
>> -- 
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------020608070304090106060706
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;11&#26376;24&#26085; 14:38, Koen Kooi wrote:
    <blockquote
      cite="mid:2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 24 nov. 2011, om 04:06 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

gtk run over x11 at current OE-core. If gtk want to run over directfb, then \
the configuration related to x11 should be disabled and directfb should be enabled.
</pre>
      </blockquote>
      <pre wrap="">
Apart from this patch is messing with PACKAGES as well, I still don't believe it's true that x11 must be disabled for directfb to work


</pre>
    </blockquote>
    As what I explained yesterday, One main goal of this image is to
    remove the stuff related to x11 because I want to build an image
    only based on directfb and run gtk over directfb.&nbsp; <br>
    you know, directfb as a graphic library is enough in many embedded
    development. It has many advantages in embedded field like digital
    television, set-top box, ...&nbsp; Of course, it has its defect in other
    aspect. So x11 is not needed in this image.&nbsp; I just don't want to
    let user to take too much time for building an image including
    directfb with no x11 during developing product.&nbsp; <br>
    <blockquote
      cite="mid:2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net"
      type="cite"><span class="mp3"></span>
      <blockquote type="cite">
        <pre wrap="">
[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
---
meta/recipes-gnome/gtk+/gtk+.inc |   20 ++++++++++++++++----
1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 0e5c45c..926f7dd 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -9,13 +9,20 @@ LICENSE = "LGPLv2 &amp; LGPLv2+ &amp; LGPLv2.1+"
LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7">"file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"</a>

SECTION = "libs"
-DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
-           gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf"
+X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
+
+DEPENDS = "glib-2.0 pango atk jpeg libpng gtk-doc-native gdk-pixbuf-native docbook-utils-native \
+           libgcrypt cairo gdk-pixbuf"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+
+PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
+PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"

inherit autotools pkgconfig

-PACKAGES += "libgail"
+PACKAGES += "libgail gtk-demo"

FILES_${PN} = "${bindir}/gtk-update-icon-cache \
	${bindir}/gtk-query-immodules-2.0 \
@@ -40,6 +47,11 @@ FILES_${PN}-dbg += " \
	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"

+FILES_gtk-demo = " \
+        ${datadir}/gtk-2.0/demo/* \
+        ${bindir}/gtk-demo \
+        "
+
FILES_libgail = " \
	${libdir}/gtk-2.0/modules/libgail.so \
	${libdir}/gtk-2.0/modules/libferret.so \
-- 
1.7.0.4


_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020608070304090106060706--
