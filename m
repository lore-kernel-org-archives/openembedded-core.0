Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 259986C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:19:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKAJBNN011941; Wed, 20 Nov 2013 10:19:12 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tzlpz133JiVw; Wed, 20 Nov 2013 10:19:11 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKAJ7Mq011937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 10:19:09 GMT
Message-ID: <1384942744.16887.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Wed, 20 Nov 2013 10:19:04 +0000
In-Reply-To: <16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
References: <cover.1384907111.git.peter.seebach@windriver.com>
	<16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: Don't fatal() when trying to dump environment.
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
X-List-Received-Date: Wed, 20 Nov 2013 10:19:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 18:31 -0600, Peter Seebach wrote:
> It is distressing when bitbake -e can't run due to sanity check
> failures, because the solution often involves figuring out what
> configuration file are being read and what values they are setting.
> Solution: Don't do that. If the datasmart object reports that
> tracking is enabled, emit an error() but not a fatal(), and also
> warn the user that things may be badly broken.
> 
> This depends on a change to bitbake (adding the isTracking() method).
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/sanity.bbclass |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6807a23..1ef811d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -82,11 +82,17 @@ def raise_sanity_error(msg, d, network_error=False):
>              bb.event.fire(bb.event.SanityCheckFailed(msg), d)
>          return
>  
> -    bb.fatal(""" OE-core's config sanity checker detected a potential misconfiguration.
> +    msg = (""" OE-core's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
>      
>      %s""" % msg)
> +    if d.isTracking():
> +	bb.warn("Environment tracking enabled: NOT exiting on sanity check failures.")
> +	bb.warn("Results may be inconsistent or meaningless; proceed at your own risk.")
> +        bb.error(msg)
> +    else:
> +        bb.fatal(msg)

This is creative but you just disabled the sanity tests in the graphical
UIs like hob.

isTracking() does not mean -e is being used, we use the tracking in
other places now too.

Cheers,

Richard


