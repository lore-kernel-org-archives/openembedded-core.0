Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB676CE74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:11:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N35004IYP2NJG40@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 28 Mar 2014 12:11:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A4D3A20357; Fri,
	28 Mar 2014 13:11:11 -0400 (EDT)
Date: Fri, 28 Mar 2014 13:11:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Kai Kang <kai.kang@windriver.com>
Message-id: <20140328171111.GH3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<a1ff6a91da21f19e5365114dca7ae942803efcd6.1395825881.git.kai.kang@windriver.com>
MIME-version: 1.0
In-reply-to: <a1ff6a91da21f19e5365114dca7ae942803efcd6.1395825881.git.kai.kang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] cryptodev-linux: add recipe
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
X-List-Received-Date: Fri, 28 Mar 2014 17:11:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 26, 2014 at 06:15:57PM +0800, Kai Kang wrote:
> Yocto kernel linux-yocto uses cryptodev-linux to use device /dev/crypto.
> So add cryptodev-linux which is one alternative of ocf-linux and then
> remove ocf-linux later.

Quick question - is it native-only recipe? Does it expect cryptodev module to 
be patched into kernel? Is this what the above description implies - 
"linux-yocto uses cryptodev-linux"?

From the looks of it, the recipe only installs a header and doesn't even build 
the out-of-tree module for cryptodev, that cryptodev-linux provides...


> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../openssl/cryptodev-linux_1.6.bb                 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
> 
> diff --git a/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb b/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
> new file mode 100644
> index 0000000..320716d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/cryptodev-linux_1.6.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "A /dev/crypto device driver"
> +HOMEPAGE = "http://cryptodev-linux.org/"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "http://download.gna.org/cryptodev-linux/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
> +SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
> +
> +do_compile() {
> +	:
> +}
> +
> +# Just install cryptodev.h which is the only header file needed to be exported
> +do_install() {
> +	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.8.1.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

