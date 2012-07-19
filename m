Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sru0D-0001i9-AZ for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:55:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JGhdiW004409
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 17:43:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04242-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 17:43:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JGhTls004403
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 17:43:30 +0100
Message-ID: <1342716212.21788.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 17:43:32 +0100
In-Reply-To: <24f8f05067f1d4ac201dbda0247ffc7cc521b7b6.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
	<24f8f05067f1d4ac201dbda0247ffc7cc521b7b6.1342713965.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 02/26] change gtk-doc.bbclass to pull in depends and oeconf
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
X-List-Received-Date: Thu, 19 Jul 2012 16:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 17:10 +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/gtk-doc.bbclass |   20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
> index 58daaf3..6a3854f 100644
> --- a/meta/classes/gtk-doc.bbclass
> +++ b/meta/classes/gtk-doc.bbclass
> @@ -1,4 +1,16 @@
> -# We don't have gtk-doc so disable it
> -do_configure_prepend() {
> -	echo "EXTRA_DIST=">> ${S}/gtk-doc.make
> -}
> +# Helper class to pull in the right gtk-doc dependencies and disable
> +# gtk-doc.
> +#
> +# Long-term it would be great if this class could be toggled between
> +# gtk-doc-stub-native and the real gtk-doc-native, which would enable
> +# re-generation of documentation.  For now, we'll make do with this which
> +# packages up any existing documentation (so from tarball builds).
> +
> +DEPENDS += "gtk-doc-stub-native"
> +DEPENDS_virtclass-native += "gtk-doc-stub-native"
> +

Ok, now I understand why this needs to be an append.

Take a recipe like glib which has:

DEPENDS = "x"
DEPENDS_virtclass-native = "y"

Depending on inherit order, 

DEPENDS_virtclass-native += "gtk-doc-stub-native"

may append to DEPENDS_virtclass-native, or it may get overwritten by the
direct assignment if that happens second.

On the other hand, if you do:

DEPENDS_virtclass-native_append = " gtk-doc-stub-native"

you stand a better change of getting the behaviour you want as it can't
get overwritten.

Cheers,

Richard




