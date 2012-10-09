Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLiau-0001PQ-0L for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 00:48:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q99MYxqG007068;
	Tue, 9 Oct 2012 23:34:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02727-09; Tue,  9 Oct 2012 23:34:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q99MYk50007043
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 9 Oct 2012 23:34:47 +0100
Message-ID: <1349822091.15658.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Tue, 09 Oct 2012 23:34:51 +0100
In-Reply-To: <1349812886-16922-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <CABcZANm_-4qSUXByfvn2dejfDq1EsZ-QKYpWDN_S-fK=qh19Ww@mail.gmail.com>
	<1349812886-16922-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: update gnu-config files always
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
X-List-Received-Date: Tue, 09 Oct 2012 22:48:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-09 at 22:01 +0200, Marcin Juszkiewicz wrote:
> When recipe inherits autotools it gets do_configure defined. One of
> things which are done is autoreconf so gnu-config files are updated to
> latest OE version.
> 
> But some recipes use own do_configure due to hard edited configure
> scripts or other reasons. We can edit those recipes one by one or can
> trick them and provide update gnu-config files without using
> autoreconf.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta/classes/autotools.bbclass |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index e4e034b..d0aad0d 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -99,6 +99,12 @@ autotools_preconfigure() {
>  			mkdir ${B}
>  		fi
>  	fi
> +
> +	# not all recipes which use autotools use it's do_configure
> +	( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
> +		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess `dirname $ac`
> +		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub   `dirname $ac`
> +		done )
>  }
>  
>  autotools_postconfigure(){

I'm not sure we want to go down this route. How about we mandate that
everything call autotools_do_configure but allow various sections of it
to be optional depending on some variables.

We could then trigger the above behaviour for recipes which disable
reautoconf?

Ideally, we should be able to reautoconf everything and we shouldn't
have exceptions at all.

The aim here is to make things more deterministic and make it clear
which code paths are being used where and why.

Cheers,

Richard



