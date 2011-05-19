Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QN1tY-000600-2w
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:00:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 89C6816603AF; Thu, 19 May 2011 05:57:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E96231660367;
	Thu, 19 May 2011 05:57:03 -0600 (MDT)
Message-ID: <4DD5058F.4080306@mlbassoc.com>
Date: Thu, 19 May 2011 05:57:03 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305745000.git.sgw@linux.intel.com>
	<acb069f6d1606913110f0829a4d8f738395d3baa.1305745000.git.sgw@linux.intel.com>
In-Reply-To: <acb069f6d1606913110f0829a4d8f738395d3baa.1305745000.git.sgw@linux.intel.com>
Subject: Re: [PATCH 1/1] utils.bbclass: modify create_wrapper to correctly follow symlinks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 12:00:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 12:57 PM, Saul Wold wrote:
> From: Saul Wold<sgw@linux.intel.com>
>
> This ensures you look up the symbolic link to get the full path
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>

Verified - this patch fixes the current breakage in the Poky tree as well.

Thanks

> ---
>   meta/classes/utils.bbclass |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 6bcaf86..1965d2f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -312,7 +312,8 @@ create_wrapper () {
>      cmdname=`basename $cmd`.real
>      cat<<END>$cmd
>   #!/bin/sh
> -exec env $@ \`dirname \$0\`/$cmdname "\$@"
> +realpath=\`readlink -fn \$0\`
> +exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
>   END
>      chmod +x $cmd
>   }

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


