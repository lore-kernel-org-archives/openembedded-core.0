Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TVfyH-0001eW-MG
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 11:01:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA69leJe024788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Nov 2012 01:47:40 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.117.126) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 6 Nov 2012 01:47:40 -0800
Message-ID: <5098DCBC.80006@windriver.com>
Date: Tue, 6 Nov 2012 10:47:40 +0100
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20121105140501.78255c6a@e6410-2>
In-Reply-To: <20121105140501.78255c6a@e6410-2>
Subject: Re: Pseudo patch/change, sanity check requested
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
X-List-Received-Date: Tue, 06 Nov 2012 10:01:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/12 9:05 PM, Peter Seebach wrote:
> Okay, this is a little odd.
>
> We had a build failure of pseudo for a 64-bit target. I looked. I found
> an easy fix.
>
> I'm sending this out to the list before I check it in, for one simple
> reason: It is absolutely obvious to me that, without this fix, the
> --enable-static-sqlite feature should never have worked on 64-bit
> systems.
>
> Obviously, it's been in use for months. Which means there's SOMETHING
> going on which I don't understand. And I am soliciting feedback because
> I am not comfortable checking in a fix I don't understand, and I
> recognize that changes to pseudo are relatively high risk.
>
> What I'm looking for:
> 1. Reports from anyone who's been bitten by this.
> 2. Feedback on how it could be that the build system has worked despite
> the obvious bug.
>
> The bug is simply that --enable-static-sqlite has been hard-coding the
> path to $(SQLITE)/lib/libsqlite3.a. This obviously can't work on
> systems where the library directory is lib64. So why haven't we seen it
> before last week?

Within OpenEmbedded-core, we build a local version of sqlite.  This local
version (native sysroot) always lives in the 'lib' directory path at this time.
   If the local sqlite is not built, then pseudo should not have been built.

--Mark


> -s
>
> ---
> commit b6c2409d786e53f62accc1c7a6538f39dd0ab601
> Author: Peter Seebach <peter.seebach@windriver.com>
> Date:   Fri Nov 2 19:55:57 2012 -0500
>
>      Makefile.in/configure: Use $(LIB), not hardcoded lib, for sqlite
>
>      It turns out that the -L usage mostly doesn't matter (usually something
>      else has requested the right directory, or it's the default), but the
>      explicit path to libsqlite3.a hardcoded "lib", and on some systems
>      it should be something else, such as "lib64". Solution: Use $(LIB) for
>      that directory.
>
>      Note that this may not resolve things if, say, you're doing MIPS n32 on a
>      target where that lives in /usr/lib32, but I think in that case you'd
>      be specifying $libdir, so it should still work out.
>
>      Also added --with-static-sqlite=/path as an option in case people need
>      to further outsmart this.
>
>      Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
>
> diff --git a/Makefile.in b/Makefile.in
> index 83fc89f..56ea5e2 100644
> --- a/Makefile.in
> +++ b/Makefile.in
> @@ -38,7 +38,7 @@ CFLAGS_BASE=-pipe -std=gnu99 -Wall -W -Wextra
>   CFLAGS_CODE=-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE $(ARCH_FLAGS)
>   CFLAGS_DEFS=-DPSEUDO_PREFIX='"$(PREFIX)"' -DPSEUDO_SUFFIX='"$(SUFFIX)"' -DPSEUDO_BINDIR='"$(BIN)"' -DPSEUDO_LIBDIR='"$(LIB)"' -DPSEUDO_LOCALSTATEDIR='"$(LOCALSTATE)"' -DPSEUDO_VERSION='"$(VERSION)"'
>   CFLAGS_DEBUG=-O2 -g
> -CFLAGS_SQL=-L$(SQLITE)/lib -I$(SQLITE)/include $(RPATH)
> +CFLAGS_SQL=-L$(SQLITE)/$(LIB) -I$(SQLITE)/include $(RPATH)
>   CFLAGS_PSEUDO=$(CFLAGS_BASE) $(CFLAGS_CODE) $(CFLAGS_DEFS) \
>   	$(CFLAGS_DEBUG) $(CFLAGS_SQL)
>
> diff --git a/configure b/configure
> index 4a41943..c536f58 100755
> --- a/configure
> +++ b/configure
> @@ -37,6 +37,7 @@ usage()
>       echo >&2 "           [--suffix=...]"
>       echo >&2 "           [--with-sqlite=...]"
>       echo >&2 "           [--enable-static-sqlite]"
> +    echo >&2 "           [--with-static-sqlite=...]"
>       echo >&2 "           [--with-rpath=...|--without-rpath]"
>       echo >&2 "           [--cflags='']"
>       echo >&2 "           [--bits=32|64]"
> @@ -58,14 +59,19 @@ do
>       --libdir=*)
>           opt_libdir=${arg#--libdir=}
>           ;;
> +    --with-static-sqlite=*)
> +        opt_sqlite_ldarg=${arg#--with-static-sqlite=}
> +        sqlite_ldarg=$opt_sqlite_ldarg
> +        use_maybe_rpath=false
> +        ;;
>       --enable-static-sqlite)
> -        sqlite_ldarg='$(SQLITE)/lib/libsqlite3.a'
> +        sqlite_ldarg='$(SQLITE)/$(LIB)/libsqlite3.a'
>           use_maybe_rpath=false
>           ;;
>       --with-sqlite=*)
>           opt_sqlite=${arg#--with-sqlite=}
>           # assign new value if unset
> -        maybe_rpath='-Wl,-R$(SQLITE)/lib'
> +        maybe_rpath='-Wl,-R$(SQLITE)/$(LIB)'
>           ;;
>       --without-rpath)
>           opt_rpath=''
>



