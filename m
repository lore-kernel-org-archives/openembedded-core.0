Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 48CB16067D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 14:34:25 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6800DJKWHEEX10@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 09:34:26 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
	a=uQSJor8-Dk161V8S1KMA:9	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 03f6e26f; Tue, 26 Apr 2016 14:34:26 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8137B161FC7; Tue,
	26 Apr 2016 10:34:25 -0400 (EDT)
Date: Tue, 26 Apr 2016 10:34:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Yang <liezhi.yang@windriver.com>
Message-id: <20160426143425.GF31113@denix.org>
References: <cover.1461650616.git.liezhi.yang@windriver.com>
	<c53c41d6a33a354b8030e5a4b325aeb2753e9258.1461650616.git.liezhi.yang@windriver.com>
MIME-version: 1.0
In-reply-to: <c53c41d6a33a354b8030e5a4b325aeb2753e9258.1461650616.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] coreutils: fix for native and nativesdk
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
X-List-Received-Date: Tue, 26 Apr 2016 14:34:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 25, 2016 at 11:04:37PM -0700, Robert Yang wrote:
> From: Dengke Du <dengke.du@windriver.com>
> 
> The do_install_append is used for moving/renaming for ALTERNATIVE, but
> it breaks native, for example there is no ln, but ln.coreutils, that
> makes coreutils-native don't work. This patch fixes the problem.
> 
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/coreutils/coreutils_8.25.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
> index 419a693..77b3862 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
> @@ -70,6 +70,11 @@ do_compile_prepend () {
>  }
>  
>  do_install_append() {
> +	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
> +		rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
> +		return
> +	fi

Would that skip the rest of do_install_append() for class-native due to the 
return call? Is it expected?


>  	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
>  
>  	install -d ${D}${base_bindir}
> @@ -91,11 +96,6 @@ do_install_append() {
>  	cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
>  }
>  
> -do_install_append_class-native(){
> -	# remove groups to fix conflict with shadow-native
> -	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
> -}
> -
>  inherit update-alternatives
>  
>  ALTERNATIVE_PRIORITY = "100"
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

