Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9259161000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:31:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9HEVXCp023398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:31:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 17 Oct 2013 07:31:33 -0700
Message-ID: <525FF4C6.6020601@windriver.com>
Date: Thu, 17 Oct 2013 09:31:34 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
	<1382018386-25389-12-git-send-email-david.nystrom@enea.com>
In-Reply-To: <1382018386-25389-12-git-send-email-david.nystrom@enea.com>
Subject: Re: [PATCH 11/11] rpm: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:31:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/13 8:59 AM, David Nyström wrote:

Should have a commit message explaining the various changes.

> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index 3c7e03b..0630f74 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -105,12 +105,12 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
>   # Specify the default rpm macros in terms of adjustable variables
>   rpm_macros = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
>   rpm_macros_class-native = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
> +rpm_macros_class-nativesdk = "%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
>
>   # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
>
>   # Note: perl and sqlite w/o db specified does not currently work.
>   #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
> -PACKAGECONFIG_class-native ??= "db bzip2 zlib beecrypt openssl libelf python"
>   PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
>
>   PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
> @@ -224,8 +224,11 @@ FILES_${PN} =  "${bindir}/rpm \
>   		${libdir}/rpm/bin/rpmrepo \
>   		${libdir}/rpm/bin/rpmspecdump \
>   		${libdir}/rpm/bin/wget \
> -		/var/lib/rpm \
> -		/var/cache/rpm \
> +		${libdir}/rpm \
> +		${localstatedir}/cache/rpm \
> +		${localstatedir}/cache/wdj \
> +		${localstatedir}/lib/rpm \
> +		${localstatedir}/lib/wdj \

The above was hard defined because the /var/lib, /var/cache locations were hard 
coded into RPM itself and did not vary based on libdir/localstatedir.  It's 
possible this has changed since the work was originally done.  But you should be 
sure to verify that.


Otherwise the content looks fine.

--Mark

>   		"
>
>   FILES_${PN}-dbg += "${libdir}/rpm/.debug \
> @@ -235,7 +238,7 @@ FILES_${PN}-dbg += "${libdir}/rpm/.debug \
>   FILES_${PN}-common = "${bindir}/rpm2cpio \
>   		${bindir}/gendiff \
>   		${sysconfdir}/rpm \
> -		/var/spool/repackage \
> +		${localstatedir}/spool/repackage \
>   		"
>
>   FILES_${PN}-libs = "${libdir}/librpm-*.so \
> @@ -313,6 +316,7 @@ FILES_${PN}-build = "${prefix}/src/rpm \
>   		"
>   RDEPENDS_${PN} = "base-files run-postinsts"
>   RDEPENDS_${PN}_class-native = ""
> +RDEPENDS_${PN}_class-nativesdk = ""
>   RDEPENDS_${PN}-build = "file"
>
>   RDEPENDS_python-rpm = "${PN}"
> @@ -452,7 +456,7 @@ do_install_append() {
>
>   }
>
> -do_install_append_class-native() {
> +add_native_wrapper() {
>           create_wrapper ${D}/${bindir}/rpm \
>   		RPM_USRLIBRPM='`dirname $''realpath`'/${@os.path.relpath(d.getVar('libdir', True), d.getVar('bindir', True))}/rpm \
>   		RPM_ETCRPM='$'{RPM_ETCRPM-'`dirname $''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True), d.getVar('bindir', True))}/rpm} \
> @@ -481,4 +485,12 @@ do_install_append_class-native() {
>   	done
>   }
>
> -BBCLASSEXTEND = "native"
> +do_install_append_class-native() {
> +	add_native_wrapper
> +}
> +
> +do_install_append_class-nativesdk() {
> +	add_native_wrapper
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
>


