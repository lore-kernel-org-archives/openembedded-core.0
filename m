Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SfWEc-0002SN-0y for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:06:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FCu4HG013610
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:56:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13116-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:55:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5FCttVn013604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:55:55 +0100
Message-ID: <1339764954.24333.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jun 2012 13:55:54 +0100
In-Reply-To: <c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/9] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 13:06:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 23:12 -0700, Khem Raj wrote:
> futimes is not available on uclibc so use utimes
> qsort is also not as expected by sat-solver therefore
> for uclibc we resort to using internal version of
> qsort
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++++++++++++
>  meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 ++
>  2 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch
> 
> diff --git a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
> new file mode 100644
> index 0000000..b24d852
> --- /dev/null
> +++ b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
> @@ -0,0 +1,32 @@
> +This patch uses utimes instead of futimes for uclibc
> +since futimes is not available
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: git/examples/solv.c
> +===================================================================
> +--- git.orig/examples/solv.c	2012-06-01 12:06:22.041552848 -0700
> ++++ git/examples/solv.c	2012-06-01 12:49:17.417677449 -0700
> +@@ -1027,7 +1027,8 @@
> +   int flags;
> + 
> +   cinfo = repo->appdata;
> +-  if (!(fp = fopen(calccachepath(repo, repoext), "r")))
> ++  const char* fname = calccachepath(repo, repoext);
> ++  if (!(fp = fopen(fname, "r")))
> +     return 0;
> +   if (fseek(fp, -sizeof(mycookie), SEEK_END) || fread(mycookie, sizeof(mycookie), 1, fp) != 1)
> +     {
> +@@ -1068,7 +1069,11 @@
> +       memcpy(cinfo->extcookie, myextcookie, sizeof(myextcookie));
> +     }
> +   if (mark)
> ++#ifdef __UCLIBC__
> ++    utimes(fname, 0);	/* try to set modification time */
> ++#else
> +     futimes(fileno(fp), 0);	/* try to set modification time */
> ++#endif
> +   fclose(fp);
> +   return 1;
> + }
> diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
> index b0382f6..b0daa6a 100644
> --- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
> +++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
> @@ -20,6 +20,7 @@ SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
>             file://sat-solver_core.patch \
>             file://fix_gcc-4.6.0_compile_issue.patch \
>             file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
> +           file://futimes.patch \
>            "
>  
>  S = "${WORKDIR}/git"
> @@ -28,6 +29,8 @@ EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
>  
>  EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
>  
> +TUNE_CCARGS_libc-uclibc_append = " -DUSE_OWN_QSORT=1 "
> +

I suspect you mean TUNE_CCARGS_append_libc-uclibc here?

Cheers,

Richard



