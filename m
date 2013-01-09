Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Tswyf-0003EQ-0X for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:50:03 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1TswkB-0004Rv-SL for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:35:06 +0100
Received: from static-217-133-170-65.clienti.tiscali.it ([217.133.170.65])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:35:03 +0100
Received: from diego.ml by static-217-133-170-65.clienti.tiscali.it with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 15:35:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Diego <diego.ml@zoho.com>
Date: Wed, 9 Jan 2013 14:18:28 +0000 (UTC)
Message-ID: <loom.20130109T151608-390@post.gmane.org>
References: <1357665198-8780-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 217.133.170.65 (Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20100101 Firefox/17.0)
Subject: Re: [PATCH] musicbrainz: handle rebuilds
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
X-List-Received-Date: Wed, 09 Jan 2013 14:50:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ross Burton <ross.burton@...> writes:

> 
> When rebuilding build-native already exists, so don't error when running mkdir.
> 
> Signed-off-by: Ross Burton <ross.burton@...>
> ---
>  meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> index 7343662..76c69c4 100644
> --- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> +++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
> @@ -20,7 +20,7 @@ LDFLAGS_prepend_libc-uclibc = " -lpthread "
>  inherit cmake pkgconfig
> 
>  do_configure_prepend() {
> -    mkdir build-native
> +    mkdir --parents build-native
>      cd build-native
>      cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
>              -DCMAKE_C_COMPILER=${BUILD_CC} \


Please don't apply this patch as it may cause make forkbomb. Removing the folder
seems to work:

do_configure_prepend() {
    rm -rf build-native
    mkdir build-native

Regards,
Diego



