Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 42026747EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:40:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7F9dscW008188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 10:39:55 +0100
Message-ID: <f57db329d5c0d42ec3e90743a78b9e5d5c65aa72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org,
	=?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Date: Wed, 15 Aug 2018 10:39:54 +0100
In-Reply-To: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
References: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] rpm: remove depend on dbus for rpm native
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
X-List-Received-Date: Wed, 15 Aug 2018 09:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-08-15 at 17:24 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> This depend cause a big problem that for one package,
> build enviroment for clean compile and second time compile
> are different. And also rpm-native actually don't need to
> depend on dbus, so remove it.
> 
> Take libfastjson as example:
> (libfastjson don't have autoconf-archive-native in DEPEND)
> if don't remove this dependency, it will have below dependency list:
> libfastjson -> gcc-runtime -> libgcc -> glibc -> linux-libc-headers
> -> rpm-native
> rpm-native -> dbus-native
> dbus-native -> autoconf-archive-native
> 
> in this way:
> do_package of libfastjson will depend on do_populate_sysroot
> of autoconf-archive-native
> 
> for clean compile:
> during do_configure, since do_package not executed,  so .m4 files
> provide by autoconf-archive-native will not under
> recipe_sysroot_native,
> 
> for second time configure:
> .m4 already copy under recipe_sysroot_native when run do_package last
> time
> 
> so if there is code related .m4 of autoconf-archive-native in the
> configure.ac
> there will be differences and may cause problem.
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.14.1.bb | 1 +
>  1 file changed, 1 insertion(+)

This is a little worrying. I think we need to blacklist that dependency
a little more strongly to ensure issues like this don't happen again,
particularly if its coming through a packaging dependency.

There is some code in sstate.bbclass, around the line "# Nothing need
depend on libc-initial/gcc-cross-initial" where we could do this. There
is a patch series from André Draszik, "sstate: allow specifying
indirect dependencies to exclude from sysroot" which would make this
easier to blacklist too.

> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> index e5e87d3..91617a4 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> @@ -52,6 +52,7 @@ S = "${WORKDIR}/git"
>  
>  DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
>  DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
> +DEPENDS_remove_class-native = "dbus"

I really don't like using _remove in OE-Core. Please restructure this
to do:

DEPENDS_append_class-target = "dbus"

or better, make the recipe use PACKAGECONFIG for this option. I'm
curious why we need dbus in the target case but not the native one
too...


Cheers,

Richard

