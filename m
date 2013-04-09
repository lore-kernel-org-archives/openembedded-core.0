Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPXkA-0002iT-P3 for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 14:33:55 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CRPQu010760; Tue, 9 Apr 2013 13:27:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Asm78NlZMMk9; Tue,  9 Apr 2013 13:27:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39CRI3F010739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 13:27:21 +0100
Message-ID: <1365509766.12407.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 09 Apr 2013 13:16:06 +0100
In-Reply-To: <4b8c3ca6b0f66674fbc8196e9bbed57ca9df2980.1365503027.git.pkj@axis.com>
References: <cover.1365503027.git.pkj@axis.com>
	<4b8c3ca6b0f66674fbc8196e9bbed57ca9df2980.1365503027.git.pkj@axis.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Tue, 09 Apr 2013 12:34:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 12:24 +0200, Peter Kjellerstedt wrote:
> First strip $PATH of any existence of the paths needed by Open Embedded
> and BitBake. Then add the needed paths at the beginning. This makes sure
> the needed paths are searched first, without growing $PATH unnecessarily
> if oe-init-build-env is rerun for a directory for which it has
> previously been run.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  scripts/oe-buildenv-internal | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I'll merge this however ultimately I suspect we should have off the
original PATH into some variable, then if that variable is set, append
NEWPATHS to the original value and reset PATH to that.

It does mean if the user messed with path in the meantime, it gets reset
but I suspect not many users do that.

Cheers,

Richard

> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 0a4d324..644df8f 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -74,8 +74,10 @@ if ! (test -d "$BITBAKEDIR"); then
>      return 1
>  fi
>  
> -PATH="${OEROOT}/scripts:$BITBAKEDIR/bin/:$PATH"
> -unset BITBAKEDIR
> +# Make sure our paths are at the beginning of $PATH
> +NEWPATHS="${OEROOT}/scripts:$BITBAKEDIR/bin:"
> +PATH=$NEWPATHS$(echo $PATH | sed -e "s|:$NEWPATHS|:|g" -e "s|^$NEWPATHS||")
> +unset BITBAKEDIR NEWPATHS
>  
>  # Used by the runqemu script
>  export BUILDDIR




