Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Riu7u-0000rI-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 21:41:53 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LXC00KE9BOLBMC5@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 13:33:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CF10C2028E; Thu,
	05 Jan 2012 14:33:57 -0500 (EST)
Date: Thu, 05 Jan 2012 14:33:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120105193357.GE28075@denix.org>
References: <cover.1325788605.git.sgw@linux.intel.com>
	<024ef12e7ae22df2e8468ccdf1d78d6657905cd6.1325788605.git.sgw@linux.intel.com>
MIME-version: 1.0
In-reply-to: <024ef12e7ae22df2e8468ccdf1d78d6657905cd6.1325788605.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/2] gnutls: remove gettext patch for non-GPLv3
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
X-List-Received-Date: Thu, 05 Jan 2012 20:41:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 05, 2012 at 10:38:37AM -0800, Saul Wold wrote:
> GPLv2 version of gnutls does not need the gettext 0.18 patch
> since it still uses the over version of gettext that is also

"uses the older version", I guess, not "over"...

Thanks for the patch! Have you looked at gnutls-extras by any chance? Do you 
have any details about its GPLv2/v3 licensing?

-- 
Denys


> GPLv2.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-support/gnutls/gnutls_2.12.14.bb |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
> index 045ba69..21fd187 100644
> --- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
> +++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
> @@ -1,10 +1,17 @@
>  require gnutls.inc
>  
> -PR = "${INC_PR}.3"
> +PR = "${INC_PR}.4"
>  
>  SRC_URI += "file://gnutls-openssl.patch \
> -            file://configure-fix.patch \
> -            file://fix-gettext-version.patch"
> +            file://configure-fix.patch"
> +
> +python() {
> +    if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
> +        # if GPLv3 add patch
> +        src_uri = (d.getVar("SRC_URI", False) or "").split()
> +        src_uri.append("file://fix-gettext-version.patch")
> +        d.setVar("SRC_URI", " ".join(src_uri))
> +}
>  
>  SRC_URI[md5sum] = "555687a7ffefba0bd9de1e71cb61402c"
>  SRC_URI[sha256sum] = "5ee72ba6de7a23cf315792561954451e022dac8730149ca95f93c61e95be2ce3"
> -- 
> 1.7.6.4
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


