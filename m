Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4DB7266F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 18:58:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 24 Dec 2014 10:56:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,639,1413270000"; d="scan'208";a="642503563"
Received: from aeadams-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.255.13.204])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2014 10:58:40 -0800
Message-ID: <549B0CE0.20003@linux.intel.com>
Date: Wed, 24 Dec 2014 10:58:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
	<1417610456-788-2-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1417610456-788-2-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH][V2 2/3] gettext-native: build libintl so that other native recipes can use them
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
X-List-Received-Date: Wed, 24 Dec 2014 18:58:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2014 04:40 AM, Andreas Müller wrote:
> I have a native recipe around which directly compiles/links against libintl.
> Gettext contains this code (usually supplied by glibc) as fallback. In native
> case this code is used by default because we don't have glibc there. This patch
> changes static linking into dynamic linking making libintl code shareable.
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   meta/recipes-core/gettext/gettext_0.18.3.2.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> index 65d4103..98838d7 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
> @@ -39,6 +39,9 @@ EXTRA_OECONF += "--without-lispdir \
>                    --with-included-libunistring \
>                   "
>
> +# we have no glib intl
> +EXTRA_OECONF_append_class-native = "--with-included-gettext --enable-shared"
> +

This patch might be causing problems in other places, we had a recent 
failure on the Autobuilder:

> | Building program /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/work/x86_64-linux/apt-native/0.9.9.4-r0/build/bin/methods/mirror
> | /usr/bin/ld: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/work/x86_64-linux/apt-native/0.9.9.4-r0/build/obj/methods/mirror.o: undefined reference to symbol 'libintl_dgettext'
> | /usr/bin/ld: note: 'libintl_dgettext' is defined in DSO /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/sysroots/x86_64-linux/usr/lib/libintl.so.8 so try adding it to the linker command line
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/sysroots/x86_64-linux/usr/lib/libintl.so.8: could not read symbols: Invalid operation
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/work/x86_64-linux/apt-native/0.9.9.4-r0/build/bin/methods/mirror] Error 1
> | make[1]: *** [all] Error 2
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb/build/build/tmp/work/x86_64-linux/apt-native/0.9.9.4-r0/temp/log.do_compile.12994)
> NOTE: recipe apt-native-0.9.9.4-r0: task do_compile: Failed

Since gettext affects alot of other projects, can you try a world build 
to ensure there is not other issues with this change. Or check at least 
check more native recipes.

Thanks

Sau!
>   acpaths = '-I ${S}/gettext-runtime/m4 \
>              -I ${S}/gettext-tools/m4'
>
>

