Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0126C8FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 14:04:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IEIv5c006539; Wed, 18 Sep 2013 15:18:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4JqOBhCE13WW; Wed, 18 Sep 2013 15:18:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8IEIrVh006526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 18 Sep 2013 15:18:54 +0100
Message-ID: <1379513067.32201.158.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 18 Sep 2013 15:04:27 +0100
In-Reply-To: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
References: <1379512264-8755-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add LDFLAGS to allow build of old kernels without patching
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
X-List-Received-Date: Wed, 18 Sep 2013 14:04:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-18 at 10:51 -0300, Otavio Salvador wrote:
> The LDFLAGS is required or some old kernels fails due missing
> symbols and this is preferred than requiring patches to every old
> supported kernel.
> 
> Fixes [YOCTO: #5221]
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-kernel/perf/perf.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Doesn't this reintroduce the problem you previously fixed though with
things rebuilding because the flags changed?

Cheers,

Richard





> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 4a815ff..269069f 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -60,6 +60,11 @@ B = "${WORKDIR}/${BPN}-${PV}"
>  SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
>  TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
>  
> +# The LDFLAGS is required or some old kernels fails due missing
> +# symbols and this is preferred than requiring patches to every old
> +# supported kernel.
> +LDFLAGS="-ldl -lutil"
> +
>  EXTRA_OEMAKE = \
>  		'-C ${S}/tools/perf \
>  		O=${B} \
> @@ -88,13 +93,13 @@ PARALLEL_MAKE = ""
>  
>  do_compile() {
>  	# Linux kernel build system is expected to do the right thing
> -	unset CFLAGS LDFLAGS
> +	unset CFLAGS
>  	oe_runmake all
>  }
>  
>  do_install() {
>  	# Linux kernel build system is expected to do the right thing
> -	unset CFLAGS LDFLAGS
> +	unset CFLAGS
>  	oe_runmake DESTDIR=${D} install
>  	# we are checking for this make target to be compatible with older perf versions
>  	if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" -a $(grep install-python_ext ${S}/tools/perf/Makefile) = "0"]; then



