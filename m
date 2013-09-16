Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 78B47610F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 07:10:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2013 00:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,913,1371106800"; d="scan'208";a="403836832"
Received: from unknown (HELO [10.255.14.132]) ([10.255.14.132])
	by orsmga002.jf.intel.com with ESMTP; 16 Sep 2013 00:10:44 -0700
Message-ID: <5236AEF3.4000609@linux.intel.com>
Date: Mon, 16 Sep 2013 00:10:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Remove CFLAGS and LDFLAGS override
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
X-List-Received-Date: Mon, 16 Sep 2013 07:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2013 06:37 PM, Otavio Salvador wrote:
> The kernel build system does the right thing here and we should stop
> overriding it. This code has been added based on a change from
> 'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
> without any information about what problem it fixes so I am reverting
> it.
>
> Using the CFLAGS makes it impossible for kernel build system to append
> to it, thus making the build fail in various ways as:
>
> |     CC /.../perf/1.0-r8/perf-1.0/perf.o
> | In file included from builtin.h:4:0,
> |                  from perf.c:9:
> | util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
> |  #include <lk/debugfs.h>
> |                         ^
> | compilation terminated.
>
> Cc: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>   meta/recipes-kernel/perf/perf.bb | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index d2c1048..8d35fc6 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -72,13 +72,7 @@ EXTRA_OEMAKE = \
>   		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>   		'
>
> -# We already pass the correct arguments to our compiler for the CFLAGS (if we
> -# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was failing
> -# to find bfd symbols.
>   EXTRA_OEMAKE += "\
> -	'CFLAGS=${CFLAGS} -fPIC' \
> -	'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
> -	\
Maybe not, I got a compile error with this on the Autobuilder.

http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64/builds/286/steps/Building%20Images/logs/stdio

Sau!

>   	'prefix=${prefix}' \
>   	'bindir=${bindir}' \
>   	'sharedir=${datadir}' \
>

