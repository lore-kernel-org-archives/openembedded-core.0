Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A398750E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 09:53:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w849rr8L011926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 02:53:53 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 4 Sep 2018 02:53:52 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1535288685.git.kai.kang@windriver.com>
	<5495bfab4433691120e9300132a3a16a0a77d182.1535288685.git.kai.kang@windriver.com>
	<ee98b583c37153254c89db81f231fc9acd52a023.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <31d9d2d6-754c-1c8f-6953-445ac70ba595@windriver.com>
Date: Tue, 4 Sep 2018 17:52:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ee98b583c37153254c89db81f231fc9acd52a023.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] multilib: fix install file conflicts
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
X-List-Received-Date: Tue, 04 Sep 2018 09:53:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月04日 17:16, richard.purdie@linuxfoundation.org wrote:
> On Sun, 2018-08-26 at 06:06 -0700, Kai Kang wrote:
>> Fix install files conflicts between multlib packages:
>>
>>> Error: Transaction check error:
>>>    file /usr/bin/g-ir-annotation-tool conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
>>>    file /usr/bin/g-ir-scanner conflicts between attempted installs of lib32-gobject-introspection-1.56.1-r0.x86 and gobject-introspection-1.56.1-r0.core2_64
>>>    file /usr/bin/cairo-trace conflicts between attempted installs of lib32-libcairo-perf-utils-1.14.12-r0.x86 and libcairo-perf-utils-1.14.12-r0.core2_64
>>>    file /usr/bin/icu-config conflicts between attempted installs of lib32-icu-dev-62.1-r0.x86 and icu-dev-62.1-r0.core2_64
>>>    file /usr/share/gir-1.0/GLib-2.0.gir conflicts between attempted installs of gobject-introspection-dev-1.56.1-r0.core2_64 and lib32-gobject-introspection-dev-1.56.1-r0.x86
>>>    file /usr/bin/gpgrt-config conflicts between attempted installs of lib32-libgpg-error-dev-1.32-r0.x86 and libgpg-error-dev-1.32-r0.core2_64
>>>    file /usr/share/pkgconfig/udev.pc conflicts between attempted installs of eudev-dev-3.2.5-r0.core2_64 and lib32-eudev-dev-3.2.5-r0.x86
> .pc files installed into /usr/share are architecture
> independent. Either it is arch dependent in which case its in the wrong
> place, or it needs to be fixed.

For .pc file of eudev, it sets udevdir with prefix ${libdir}

$ diff -u image/usr/share/pkgconfig/udev.pc 
../../../x86-pokymllib32-linux/lib32-eudev/3.2.5-r0/image/usr/share/pkgconfig/udev.pc
--- image/usr/share/pkgconfig/udev.pc   2018-08-31 16:03:35.721580345 +0800
+++ 
../../../x86-pokymllib32-linux/lib32-eudev/3.2.5-r0/image/usr/share/pkgconfig/udev.pc 
2018-09-03 14:20:05.320474868 +0800
@@ -3,4 +3,4 @@
  Version: 220
  prefix=/usr
  exec_prefix=/usr
-udevdir=/lib64/udev
+udevdir=/lib/udev


>
> We are not putting these under control of update-alternatives!
>
> It would be helpful to understand the kinds of differences in some of
> these files. gir files in /usr/share/gir-1.0/ should also really be
> arch independent...

For the .gir file, it contains some length of types, such as long and 
pointer.

@@ -21251,16 +21251,16 @@
  This is ":" on UNIX machines and ";" under Windows.</doc>
        <type name="utf8" c:type="gchar*"/>
      </constant>
-    <constant name="SIZEOF_LONG" value="8" c:type="GLIB_SIZEOF_LONG">
+    <constant name="SIZEOF_LONG" value="4" c:type="GLIB_SIZEOF_LONG">
        <type name="gint" c:type="gint"/>
      </constant>
-    <constant name="SIZEOF_SIZE_T" value="8" c:type="GLIB_SIZEOF_SIZE_T">
+    <constant name="SIZEOF_SIZE_T" value="4" c:type="GLIB_SIZEOF_SIZE_T">
        <type name="gint" c:type="gint"/>
      </constant>
-    <constant name="SIZEOF_SSIZE_T" value="8" c:type="GLIB_SIZEOF_SSIZE_T">
+    <constant name="SIZEOF_SSIZE_T" value="4" c:type="GLIB_SIZEOF_SSIZE_T">
        <type name="gint" c:type="gint"/>
      </constant>
-    <constant name="SIZEOF_VOID_P" value="8" c:type="GLIB_SIZEOF_VOID_P">
+    <constant name="SIZEOF_VOID_P" value="4" c:type="GLIB_SIZEOF_VOID_P">
        <type name="gint" c:type="gint"/>
      </constant>
      <record name="SList" c:type="GSList">


Regards,
Kai

>
> Cheers,
>
> Richard
>

-- 
Regards,
Neil | Kai Kang


