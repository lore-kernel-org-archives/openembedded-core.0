Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BFD746B05F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:37:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1OFbGYQ017451; Mon, 24 Feb 2014 15:37:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id djIhft2lrXUh; Mon, 24 Feb 2014 15:37:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1OFbB12017445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Feb 2014 15:37:12 GMT
Message-ID: <1393256224.31769.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Mon, 24 Feb 2014 15:37:04 +0000
In-Reply-To: <1393255080-12382-3-git-send-email-gary@mlbassoc.com>
References: <1393255080-12382-1-git-send-email-gary@mlbassoc.com>
	<1393255080-12382-3-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting
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
X-List-Received-Date: Mon, 24 Feb 2014 15:37:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-24 at 08:18 -0700, Gary Thomas wrote:
> Keeping track of the TEMPLATECONF variable in the build
> tree will let this script produce the same output when
> listing 'conf-notes.txt' every time the script is run,
> regardless of whether or not TEMPLATECONF has been provided
> by the user.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  scripts/oe-setup-builddir |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index a869fdc..4322158 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -37,8 +37,16 @@ fi
>  
>  cd "$BUILDDIR"
>  
> +if (test -f "$BUILDDIR/conf/template.conf") then
> +    TEMPLATECONF=$(cat $BUILDDIR/conf/template.conf)
> +fi
> +
>  TEMPLATECONF=${TEMPLATECONF:-meta/conf}
>  
> +if ! (test -f "$BUILDDIR/conf/template.conf") then
> +    echo "$TEMPLATECONF" >$BUILDDIR/conf/template.conf
> +fi
> +

Can you please call this something other than xxx.conf? I don't fancy
someone trying to load this ".conf" file with bitbake...

Since you're also looking in this area, there is one piece I've meant to
add for a long time but never quite got to. I think something like a
hidden top level ".templatepointer" style file might be a good idea for
repos like poky and for anyone else trying to customise the build. This
would allow us to point directly at poky's template configuration files
without having to hack the scripts which is currently what happens
there.

That hacking has long since bothered me, equally, I tend to have more
pressing issues to deal with so its never been done as yet.

Cheers,

Richard







