Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E129F601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:03:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8HD37V6027777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 06:03:07 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 06:03:06 -0700
Message-ID: <523852F6.1010805@windriver.com>
Date: Tue, 17 Sep 2013 09:02:46 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1379391500-22149-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1379391500-22149-1-git-send-email-otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perf: Ensure we use CFLAGS and LDFLAGS settings from kernel build system
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
X-List-Received-Date: Tue, 17 Sep 2013 13:03:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-17 12:18 AM, Otavio Salvador wrote:
> The kernel build system does the right thing here and we should stop
> overriding it. This code has been added based on a change from
> 'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
> without any information about what problem it fixes so I am reverting
> it.
>
> Using the CFLAGS and LDFLAGS makes it impossible for kernel build
> system to append to it, thus making the build fail in various ways as:
>
> |     CC /.../perf/1.0-r8/perf-1.0/perf.o
> | In file included from builtin.h:4:0,
> |                  from perf.c:9:
> | util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
> |  #include <lk/debugfs.h>
> |                         ^
> | compilation terminated.
>
> The unset is done in do_compile and do_install otherwise it /rebuild/
> perf as it detects the compiler options has change.

Confirmed. I was able to build perf for qemux8-64 with this change in place.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v2:
> - unset CFLAGS and LDFLAGS
> - reword commit log
>
>   meta/recipes-kernel/perf/perf.bb | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index d2c1048..4a815ff 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -60,7 +60,6 @@ B = "${WORKDIR}/${BPN}-${PV}"
>   SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
>   TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
>
> -export LDFLAGS = "-ldl -lutil"
>   EXTRA_OEMAKE = \
>   		'-C ${S}/tools/perf \
>   		O=${B} \
> @@ -72,13 +71,7 @@ EXTRA_OEMAKE = \
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
>   	'prefix=${prefix}' \
>   	'bindir=${bindir}' \
>   	'sharedir=${datadir}' \
> @@ -94,10 +87,14 @@ EXTRA_OEMAKE += "\
>   PARALLEL_MAKE = ""
>
>   do_compile() {
> +	# Linux kernel build system is expected to do the right thing
> +	unset CFLAGS LDFLAGS
>   	oe_runmake all
>   }
>
>   do_install() {
> +	# Linux kernel build system is expected to do the right thing
> +	unset CFLAGS LDFLAGS
>   	oe_runmake DESTDIR=${D} install
>   	# we are checking for this make target to be compatible with older perf versions
>   	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then
>


