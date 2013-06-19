Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7D980601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:11:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JEHC6L026019; Wed, 19 Jun 2013 15:17:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hG9nCD3X8X9c; Wed, 19 Jun 2013 15:17:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JEH6Oj026008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 15:17:07 +0100
Message-ID: <1371651046.20823.189.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joe@deserted.net
Date: Wed, 19 Jun 2013 15:10:46 +0100
In-Reply-To: <1371650216-31735-1-git-send-email-joe@deserted.net>
References: <1371650216-31735-1-git-send-email-joe@deserted.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: joe.macdonald@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bdwgc: support configure on autoconf <2.69
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
X-List-Received-Date: Wed, 19 Jun 2013 14:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 09:56 -0400, joe@deserted.net wrote:
> From: Joe MacDonald <joe@deserted.net>
> 
> Building bdwgc-native on systems with older versions of autoconf (earlier
> than 2.69) is known to have issues:
> 
> 	https://github.com/ivmai/bdwgc/issues/16
> 
> An option is to simply mask the errors with m4_pattern_allow(...) for each
> of the macros, but rerunning autoreconf produces a functional configure
> script that builds a functional native version of bdwgc.
> 
> Signed-off-by: Joe MacDonald <joe@deserted.net>
> ---
>  meta/recipes-support/bdwgc/bdwgc_7.2d.bb | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> I tripped over this yesterday on one of my older builders.  It happens to still
> be Ubuntu 12.04.2.  I don't know if it's unique to my configuration, but after
> doing some digging around on the web I can't see any obvious indications that
> I'm missing any autotools package and the general consensus seems to be that
> autoreconf is the best option when the failures are relatively beign as they
> are here.
> 
> -J.
> 
> diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> index 46e5257..d8e2de5 100644
> --- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> +++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
> @@ -36,3 +36,12 @@ ARM_INSTRUCTION_SET = "arm"
>  
>  inherit autotools
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_configure_prepend() {
> +	# Without this, on older installations of autoconf errors crop up during configure:
> +	# | configure.ac:70: error: possibly undefined macro: AC_MSG_ERROR
> +	# |       If this token and others are legitimate, please use m4_pattern_allow.
> +	# |       See the Autoconf documentation.
> +	# | configure.ac:358: error: possibly undefined macro: AS_IF
> +	( cd ${S}; autoreconf -i )
> +}

This is timely since we're seeing this issue on some of the
autobuilders. We should be autoreconfing by default though, any idea why
it doesn't in this case?

Cheers,

Richard


