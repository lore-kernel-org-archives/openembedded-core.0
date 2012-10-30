Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TT8k2-00040t-AQ for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:08:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9U9scIW014936;
	Tue, 30 Oct 2012 09:54:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12691-08; Tue, 30 Oct 2012 09:54:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9U9sVBs014930
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 30 Oct 2012 09:54:32 GMT
Message-ID: <1351590871.2828.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 30 Oct 2012 09:54:31 +0000
In-Reply-To: <8757dbc0cba44d712d24bea43a3ed78c37b0f991.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
	<8757dbc0cba44d712d24bea43a3ed78c37b0f991.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/11] multilib.bbclass: add class-multilib to override
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
X-List-Received-Date: Tue, 30 Oct 2012 10:08:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-30 at 17:33 +0800, Robert Yang wrote:
> Add the new override way CLASSOVERRIDE = "class-multilib" to
> multilib.bbclass, and add the check code to sanity.bbclass, we keep both
> the old and new way, which means, both of the following are supported:
> 
> virtclass-multilib
> class-multilib
> 
> [YOCTO #3297]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/multilib.bbclass | 2 ++
>  meta/classes/sanity.bbclass   | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index 77ccce4..2dd2f85 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -1,3 +1,5 @@
> +CLASSOVERRIDE = "class-multilib"
> +
>  python multilib_virtclass_handler () {
>      if not isinstance(e, bb.event.RecipePreFinalise):
>          return
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3806bc5..ba1cd6d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -122,7 +122,8 @@ def check_toolchain(data):
>                  tune_error_set.append("The multilib '%s' appears more than once." % lib)
>              else:
>                  seen_libs.append(lib)
> -            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True)
> +            tune = data.getVar("DEFAULTTUNE_virtclass-multilib-%s" % lib, True) or \
> +                   data.getVar("DEFAULTTUNE_class-multilib-%s" % lib, True)
>              if tune in seen_tunes:
>                  tune_error_set.append("The tuning '%s' appears in more than one multilib." % tune)
>              else:

Sorry but this isn't right. The multilib case is special since it sets
"class-multilib-xxx", not "class-multilib" without the suffix. The above
changes are just going to confuse people and depending on what you do in
other patches, may or may not work.

Can you resend the patch set just changing the native/nativesdk values
please? We can then look at multilib specifically as a follow up.

Cheers,

Richard



