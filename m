Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A069E7702A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82Hpctb007689; Wed, 2 Sep 2015 18:51:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2ZsjyQe8fvG5; Wed,  2 Sep 2015 18:51:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82HpNRn007676
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 18:51:34 +0100
Message-ID: <1441216283.24871.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Franco <alejandro.franco@linux.intel.com>
Date: Wed, 02 Sep 2015 18:51:23 +0100
In-Reply-To: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1441211805-17543-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix recursive mode -st on BUILDDIR setup
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
X-List-Received-Date: Wed, 02 Sep 2015 17:51:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 11:36 -0500, Alex Franco wrote:
> Removing recursive option from chmod -st on BUILDDIR as it would
> take very long on existing build directories
> 
> [YOCTO 7669]
> 
> Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
> ---
>  scripts/oe-setup-builddir | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index f5b7e4e..44c7dcc 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -24,7 +24,7 @@ if [ -z "$BUILDDIR" ]; then
>  fi
>  
>  mkdir -p "$BUILDDIR/conf"
> -chmod -R -st "$BUILDDIR" 
> +chmod -st "$BUILDDIR"

I think you did this so that conf/ gets the right permissions too.
Perhaps the best approach is:

+chmod -st "$BUILDDIR" $BUILDDIR/conf"

?

Cheers,

Richard


