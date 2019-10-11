Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 46E5E7ED3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 09:20:02 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D6EF95C00AC;
	Fri, 11 Oct 2019 11:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570785602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=6lXPre23qcW2TEMfI0HaS3Cj3uohY41r5RlGXtMO3vo=;
	b=ceLsN+joa7OXCl7KZU0jIOTcaNjfouOYNPjoNO5VJZozH1e3o5APDO+KYGxNjCjhn/BEN4
	/RR6D9tz5lIrAse7VKSnlzVgsJL1Hivz6+i6YFy4RcZc5syeQ7H6vnmMXwfm0xbxvUJkp8
	/mEhcBtVFCSp/5XbudwtNl5RI1pIWqw=
MIME-Version: 1.0
Date: Fri, 11 Oct 2019 11:20:01 +0200
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
In-Reply-To: <20191011090659.34036-1-stefan@agner.ch>
References: <20191011090659.34036-1-stefan@agner.ch>
Message-ID: <1fc7a92d88b9de884036323552d3c223@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>, liu.ming50@gmail.com
Subject: Re: [PATCH] uninative: check .done file instead of tarball
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
X-List-Received-Date: Fri, 11 Oct 2019 09:20:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Also add Richard.

On 2019-10-11 11:06, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> In case multiple builds share UNINATIVE_DLDIR's location, one build
> might be in the process of downloading the tarball while another is
> just checking whether the tarball exists. Check for the done file
> instead and rely on the fetchers lockfile mechanism in case two
> builds are running.
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta/classes/uninative.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
> index 3326c0db3d..9f8645a36a 100644
> --- a/meta/classes/uninative.bbclass
> +++ b/meta/classes/uninative.bbclass
> @@ -45,7 +45,7 @@ python uninative_event_fetchloader() {
>          tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
>          tarballpath = os.path.join(tarballdir, tarball)
>  
> -        if not os.path.exists(tarballpath):
> +        if not os.path.exists(tarballpath + ".done"):
>              bb.utils.mkdirhier(tarballdir)
>              if d.getVar("UNINATIVE_URL") == "unset":
>                  bb.fatal("Uninative selected but not configured,
> please set UNINATIVE_URL")
> -- 
> 2.20.1

