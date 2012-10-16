Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TO9Au-0001SH-Pn
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 17:35:21 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0MBZ00GD2P7Y5KM0@vms173003.mailsrvcs.net>; Tue,
	16 Oct 2012 09:21:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D2B25201C0; Tue,
	16 Oct 2012 10:21:34 -0400 (EDT)
Date: Tue, 16 Oct 2012 10:21:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20121016142134.GC5662@denix.org>
References: <1350394502-7745-1-git-send-email-fabien.proriol@jdsu.com>
MIME-version: 1.0
In-reply-to: <1350394502-7745-1-git-send-email-fabien.proriol@jdsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Fabien Proriol <Fabien.Proriol@jdsu.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH] SDK: allow SDK path of various level
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
X-List-Received-Date: Tue, 16 Oct 2012 15:35:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 16, 2012 at 01:37:17PM +0000, Fabien Proriol wrote:
> In the previous version, tar extraction use the --strip-component
> option with "4" hard coded value.
> If we set another SDKPATH, with a different depth, the sdk installation
> fails.
> 
> This patch computes the level from the SDKPATH value.

Thanks! That's part of the problem I was having lately. Although, I think this 
patch should go to OE-Core list instead...

Do you also see the problem building gcc-cross-initial/intermediate 
complaining about missing headers from sysroot (it loses -nativesdk suffix 
for some reason, when looking for the system headers), when building with the 
new SDKPATH/SDK_NAME? I believe there's some path hardcoded somewhere in the 
gcc/cross recipes, but I wasn't able to debug it yet...

-- 
Denys


> Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
> ---
>  meta/classes/populate_sdk_base.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 6eb6726..971adfc 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -117,6 +117,7 @@ fakeroot create_shar() {
>  #!/bin/bash
>  
>  DEFAULT_INSTALL_DIR="${SDKPATH}"
> +COMPONENTS_LEN=$(echo ".${SDKPATH}" | sed "s/\// /g" | wc -w)
>  
>  printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
>  read target_sdk_dir
> @@ -153,7 +154,7 @@ fi
>  payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
>  
>  printf "Extracting SDK..."
> -tail -n +$payload_offset $0| tar xj --strip-components=4 -C $target_sdk_dir
> +tail -n +$payload_offset $0| tar xj --strip-components=$COMPONENTS_LEN -C $target_sdk_dir
>  echo "done"
>  
>  printf "Setting it up..."
> -- 
> 1.7.8.6
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


