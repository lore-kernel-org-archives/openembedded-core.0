Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 201776D3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 10:48:17 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 970D82B32F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:48:18 +0100 (CET)
Message-ID: <527B703D.8080600@pseudoterminal.org>
Date: Thu, 07 Nov 2013 11:49:33 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1383546675-23002-1-git-send-email-net147@gmail.com>
	<20131104090831.GC3684@jama>
In-Reply-To: <20131104090831.GC3684@jama>
Subject: Re: [PATCH] eglibc_2.18.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Thu, 07 Nov 2013 10:48:17 -0000
Content-Type: multipart/alternative;
	boundary="------------090401000405030904080600"

--------------090401000405030904080600
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just tested Jonathan Liu's patch with Yocto 1.5 . It works for me, I 
was able to build a rootfs. Using Arch Linux and make 4.0.
The make 4.0 issue is already fixed in the glibc and eglibc 
repositories, so this patch should be marked with "Upstream-Status: 
inappropiate [other]".

On 2013-11-04 10:08, Martin Jansa wrote:
> On Mon, Nov 04, 2013 at 05:31:15PM +1100, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Hi,
>
> FYI: there is bug report for this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5391
>
>> ---
>>   meta/recipes-core/eglibc/eglibc-2.18/make-4.patch | 31 +++++++++++++++++++++++
>>   meta/recipes-core/eglibc/eglibc_2.18.bb           |  1 +
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>> new file mode 100644
>> index 0000000..ec105b4
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>> @@ -0,0 +1,31 @@
>> +Accept make versions 4.0 and greater
>> +
>> +Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>> +
>> +diff -Nur libc.orig/configure libc/configure
>> +--- libc.orig/configure     2013-08-21 02:23:48.000000000 +1000
>> ++++ libc/configure  2013-11-04 17:04:17.778333748 +1100
>> +@@ -4772,7 +4772,7 @@
>> +   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
>> +   case $ac_prog_version in
>> +     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
>> +-    3.79* | 3.[89]*)
>> ++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
>> +        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
>> +     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
>> +
>> +diff -Nur libc.orig/configure.in libc/configure.in
>> +--- libc.orig/configure.in	2013-08-21 02:23:48.000000000 +1000
>> ++++ libc/configure.in	2013-11-04 16:54:17.955014870 +1100
>> +@@ -989,7 +989,7 @@
>> +   critic_missing="$critic_missing gcc")
>> + AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
>> +   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
>> +-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
>> ++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
>> +
>> + AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
>> +   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
>> index 710b498..15e5eed 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.18.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
>> @@ -27,6 +27,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
>>              file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
>>              file://fix-tibetian-locales.patch \
>>              file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
>> +           file://make-4.patch \
>>             "
>>   SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
>>   SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
>> -- 
>> 1.8.4
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------090401000405030904080600
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">I just tested Jonathan Liu's patch with
      Yocto 1.5 . It works for me, I was able to build a rootfs. Using
      Arch Linux and make 4.0.<br>
      The make 4.0 issue is already fixed in the glibc and eglibc
      repositories, so this patch should be marked with
      "Upstream-Status: inappropiate [other]".<br>
      <br>
      On 2013-11-04 10:08, Martin Jansa wrote:<br>
    </div>
    <blockquote cite="mid:20131104090831.GC3684@jama" type="cite">
      <pre wrap="">On Mon, Nov 04, 2013 at 05:31:15PM +1100, Jonathan Liu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Signed-off-by: Jonathan Liu <a class="moz-txt-link-rfc2396E" href="mailto:net147@gmail.com">&lt;net147@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">
Hi,

FYI: there is bug report for this:
<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=5391">https://bugzilla.yoctoproject.org/show_bug.cgi?id=5391</a>

</pre>
      <blockquote type="cite">
        <pre wrap="">---
 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch | 31 +++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.18.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/make-4.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
new file mode 100644
index 0000000..ec105b4
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
@@ -0,0 +1,31 @@
+Accept make versions 4.0 and greater
+
+Backport of glibc 28d708c44bc47b56f6551ff285f78edcf61c208a.
+
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <a class="moz-txt-link-rfc2396E" href="mailto:net147@gmail.com">&lt;net147@gmail.com&gt;</a>
+
+diff -Nur libc.orig/configure libc/configure
+--- libc.orig/configure     2013-08-21 02:23:48.000000000 +1000
++++ libc/configure  2013-11-04 17:04:17.778333748 +1100
+@@ -4772,7 +4772,7 @@
+   ac_prog_version=`$MAKE --version 2&gt;&amp;1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    3.79* | 3.[89]*)
++    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+diff -Nur libc.orig/configure.in libc/configure.in
+--- libc.orig/configure.in	2013-08-21 02:23:48.000000000 +1000
++++ libc/configure.in	2013-11-04 16:54:17.955014870 +1100
+@@ -989,7 +989,7 @@
+   critic_missing="$critic_missing gcc")
+ AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
+   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
+-  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
++  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
+ 
+ AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
+   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/meta/recipes-core/eglibc/eglibc_2.18.bb b/meta/recipes-core/eglibc/eglibc_2.18.bb
index 710b498..15e5eed 100644
--- a/meta/recipes-core/eglibc/eglibc_2.18.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.18.bb
@@ -27,6 +27,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch\file://fix-tibetian-locales.patch\file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch\+file://make-4.patch\">"http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr23
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
            file://0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch \
+           file://make-4.patch \
           "</a>
 SRC_URI[md5sum] = "b395b021422a027d89884992e91734fc"
 SRC_URI[sha256sum] = "15f564b45dc5dd65faf0875579e3447961ae61e876933384ae05d19328539ad4"
-- 
1.8.4

_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090401000405030904080600--
