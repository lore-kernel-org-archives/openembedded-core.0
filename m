Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBC965D84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 16:54:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s38GsAxl025688; Tue, 8 Apr 2014 17:54:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7wV-UoXgInDT; Tue,  8 Apr 2014 17:54:09 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s38Gs76V025675
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Apr 2014 17:54:08 +0100
Message-ID: <1396976041.24597.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>
Date: Tue, 08 Apr 2014 17:54:01 +0100
In-Reply-To: <1396912345-7880-1-git-send-email-jslater@windriver.com>
References: <1396912345-7880-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] vala: add dependencies on native packages
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
X-List-Received-Date: Tue, 08 Apr 2014 16:54:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-04-07 at 16:12 -0700, Joe Slater wrote:
> We do not want to run the host xsltproc one time, and ours
> another, so we add a dependency on libxslt-native.  We also
> need to add a dependency on pkgconfig-native because the host
> pkg-config will not see native packages we have built.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-devtools/vala/vala.inc |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)

Could you send something against master please?

Specifically, master has:

DEPENDS = "bison-native flex-native libxslt-native"

so this is half fixed there...

Cheers,

Richard

> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
> index a8927d7..9d273aa 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -3,7 +3,13 @@ Vala compiles to plain C and has no runtime environment nor penalities whatsoeve
>  SECTION = "devel"
>  DEPENDS = "glib-2.0 dbus gtk+"
>  BBCLASSEXTEND = "native"
> -DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native"
> +
> +# libxslt provides xsltproc, which is probably on the host, but we want to use ours.
> +# We need our pkg-config, too.  (Inheriting pkgconfig supplies that dependency, but
> +# we clobber it here).
> +#
> +DEPENDS_virtclass-native = "bison-native glib-2.0-native dbus-native libxslt-native pkgconfig-native"
> +
>  HOMEPAGE = "http://vala-project.org"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> @@ -12,7 +18,8 @@ INC_PR = "r1"
>  SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
>  
>  SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
> -inherit autotools
> +
> +inherit autotools pkgconfig
>  
>  EXTRA_OECONF = "--disable-vapigen"
>  
> -- 
> 1.7.3.4
> 



