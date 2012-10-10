Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TLmji-0008Iw-Vo
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 05:13:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9A30Lwj009329
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2012 20:00:21 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Tue, 9 Oct 2012 20:00:20 -0700
Message-ID: <5074E4E2.2090908@windriver.com>
Date: Wed, 10 Oct 2012 11:00:50 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1349829329.git.tom.zanussi@intel.com>
	<2bc985f69847a615429a908aa0e8f972a8be91f9.1349829329.git.tom.zanussi@intel.com>
In-Reply-To: <2bc985f69847a615429a908aa0e8f972a8be91f9.1349829329.git.tom.zanussi@intel.com>
X-Originating-IP: [128.224.162.205]
Subject: Re: [PATCH 2/2] perl: use archlib_exp config.sh variable
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
X-List-Received-Date: Wed, 10 Oct 2012 03:13:31 -0000
Content-Type: multipart/alternative;
	boundary="------------010303040104080803000107"

--------------010303040104080803000107
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012?10?10? 08:48, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> This patch uses an unmodified version of archlibexp called
> archlib_exp, introduced by a previous patch to config.sh, which is
> used to generate the correct value of ARCHLIB_EXP into config.h
>
> Fixes [YOCTO #3099].
>
> Signed-off-by: Tom Zanussi<tom.zanussi@intel.com>
> ---
>   .../perl/perl-5.14.2/perl-archlib-exp.patch               | 15 +++++++++++++++
>   meta/recipes-devtools/perl/perl_5.14.2.bb                 |  3 ++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
>
> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
> new file mode 100644
> index 0000000..1c170ef
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +Index: perl-5.14.2/config_h.SH
> +===================================================================
> +--- perl-5.14.2.orig/config_h.SH
> ++++ perl-5.14.2/config_h.SH
> +@@ -996,7 +996,7 @@ sed<<!GROK!THIS!>$CONFIG_H -e 's!^#und
> +  *	in programs that are not prepared to deal with ~ expansion at run-time.
> +  */
> + #$d_archlib ARCHLIB "$archlib"		/**/
> +-#$d_archlib ARCHLIB_EXP "$archlibexp"		/**/
> ++#$d_archlib ARCHLIB_EXP "$archlib_exp"		/**/
> +
> + /* ARCHNAME:
> +  *	This symbol holds a string representing the architecture name.
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 09b2acb..d9206d8 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db grep-native"
>   DEPENDS += "gdbm zlib"
> -PR = "r10"
> +PR = "r11"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -66,6 +66,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
>           file://cross-generate_uudmap.patch \
>   	file://fix_bad_rpath.patch \
>   	file://perl-build-in-t-dir.patch \
> +	file://perl-archlib-exp.patch \
>   	\
>           file://config.sh \
>           file://config.sh-32 \
test them for qemux86 and qemuppc, the @INC path is right now.

Regards,
Kai

--------------010303040104080803000107
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2012&#24180;10&#26376;10&#26085; 08:48, <a class="moz-txt-link-abbreviated" href="mailto:tom.zanussi@intel.com">tom.zanussi@intel.com</a> wrote:
    <blockquote
cite="mid:2bc985f69847a615429a908aa0e8f972a8be91f9.1349829329.git.tom.zanussi@intel.com"
      type="cite">
      <pre wrap="">From: Tom Zanussi <a class="moz-txt-link-rfc2396E" href="mailto:tom.zanussi@intel.com">&lt;tom.zanussi@intel.com&gt;</a>

This patch uses an unmodified version of archlibexp called
archlib_exp, introduced by a previous patch to config.sh, which is
used to generate the correct value of ARCHLIB_EXP into config.h

Fixes [YOCTO #3099].

Signed-off-by: Tom Zanussi <a class="moz-txt-link-rfc2396E" href="mailto:tom.zanussi@intel.com">&lt;tom.zanussi@intel.com&gt;</a>
---
 .../perl/perl-5.14.2/perl-archlib-exp.patch               | 15 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb                 |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
new file mode 100644
index 0000000..1c170ef
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
@@ -0,0 +1,15 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+Index: perl-5.14.2/config_h.SH
+===================================================================
+--- perl-5.14.2.orig/config_h.SH
++++ perl-5.14.2/config_h.SH
+@@ -996,7 +996,7 @@ sed &lt;&lt;!GROK!THIS! &gt;$CONFIG_H -e 's!^#und
+  *	in programs that are not prepared to deal with ~ expansion at run-time.
+  */
+ #$d_archlib ARCHLIB "$archlib"		/**/
+-#$d_archlib ARCHLIB_EXP "$archlibexp"		/**/
++#$d_archlib ARCHLIB_EXP "$archlib_exp"		/**/
+ 
+ /* ARCHNAME:
+  *	This symbol holds a string representing the architecture name.
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 09b2acb..d9206d8 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a\#Weneedgnugrep(for-I)DEPENDS=">"file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "</a>virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r10"
+PR = "r11"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -66,6 +66,7 @@ SRC_URI = "<a class="moz-txt-link-freetext" href="http://www.cpan.org/src/5.0/perl-$">http://www.cpan.org/src/5.0/perl-$</a>{PV}.tar.gz \
         <a class="moz-txt-link-freetext" href="file://cross-generate_uudmap.patch">file://cross-generate_uudmap.patch</a> \
 	<a class="moz-txt-link-freetext" href="file://fix_bad_rpath.patch">file://fix_bad_rpath.patch</a> \
 	<a class="moz-txt-link-freetext" href="file://perl-build-in-t-dir.patch">file://perl-build-in-t-dir.patch</a> \
+	<a class="moz-txt-link-freetext" href="file://perl-archlib-exp.patch">file://perl-archlib-exp.patch</a> \
 	\
         <a class="moz-txt-link-freetext" href="file://config.sh">file://config.sh</a> \
         <a class="moz-txt-link-freetext" href="file://config.sh-32">file://config.sh-32</a> \
</pre>
    </blockquote>
    <font size="+1">test them for qemux86 and qemuppc, the @INC path is
      right now.<br>
      <br>
      Regards,<br>
      Kai<br>
    </font>
  </body>
</html>

--------------010303040104080803000107--
