Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tv1ub-0001ib-Ha for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 09:30:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0F8F4jE014823;
	Tue, 15 Jan 2013 08:15:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17527-09; Tue, 15 Jan 2013 08:14:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0F8EsVS014802
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 15 Jan 2013 08:14:56 GMT
Message-ID: <1358237694.23113.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Ertsaas <martiert@gmail.com>
Date: Tue, 15 Jan 2013 08:14:54 +0000
In-Reply-To: <1357807806-31720-1-git-send-email-martiert@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] sanity: Make the required utilities more platform specific.
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
X-List-Received-Date: Tue, 15 Jan 2013 08:30:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-10 at 09:50 +0100, Martin Ertsaas wrote:
> This might make us able to build on mac os X.
> 
> Signed-off-by: Martin Ertsaas <martiert@gmail.com>
> ---
>  meta/classes/sanity.bbclass |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 0ffa52d..03651be 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -2,7 +2,9 @@
>  # Sanity check the users setup for common misconfigurations
>  #
>  
> -SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
> +SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar gzip gawk wget cpio"
> +SANITY_REQUIRED_UTILITIES_Linux ?= "${SANITY_REQUIRED_UTILITIES} chrpath"
> +SANITY_REQUIRED_UTILITIES_Darwin ?= "${SANITY_REQUIRED_UTILITIES} install_name_tool"

You should be able to make this:

SANITY_REQUIRED_UTILITIES_COMMON ?= "patch diffstat makeinfo git bzip2 tar gzip gawk wget cpio"
SANITY_REQUIRED_UTILITIES ?= "${SANITY_REQUIRED_UTILITIES_COMMON} chrpath"
SANITY_REQUIRED_UTILITIES_build-darwin ?= "${SANITY_REQUIRED_UTILITIES_COMMON} install_name_tool"

which will then simplify the other part of the patch (make it
unnecessary).

Before we go and merge a ton of these type of changes I'd also like to
understand how close we are to making this work?

Cheers,

Richard



