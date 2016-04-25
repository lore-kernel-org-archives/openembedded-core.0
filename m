Return-Path: <tristan.vanberkom@codethink.co.uk>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Apr 2016 20:41:55 UTC
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id DD7E662137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id D2FF04627C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:41:55 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id gpS5VugxUO1f
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:41:53 +0100 (BST)
Received: from think (unknown [208.113.48.59])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id 0D6EB46174E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 21:41:52 +0100 (BST)
Message-ID: <1461616910.4356.18.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 16:41:50 -0400
In-Reply-To: <1461616586-25202-1-git-send-email-tristan.vanberkom@codethink.co.uk>
References: <1461616586-25202-1-git-send-email-tristan.vanberkom@codethink.co.uk>
Organization: Codethink LTD
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] cross-localedef-native_2.22.bb: Use autotools configure
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
X-List-Received-Date: Mon, 25 Apr 2016 20:41:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

This patch is also discussed in bug 9508:
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=9508

Sorry for messing up the subject line, it should have been [OE-core],
this is just my first git send-email and I copy pasted from:
 http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Cheers,
   -Tristan

On Mon, 2016-04-25 at 16:36 -0400, Tristan Van Berkom wrote:
> Use the autotools default configure commands and just tell autotools
> where to run configure from.
> 
> This fixes the build when running on an aarch64 host, which the
> prebuilt
> configure scripts with glibc 2.22 do not recognize.
> ---
>  meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> index 3aefe74..7e484fa 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> @@ -9,6 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b3
> 6d3209f380deb394b213 \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>  
>  
> +# Tell autotools that we're working in the localedef directory
> +#
> +AUTOTOOLS_SCRIPT_PATH = "${S}/localedef"
> +
>  inherit native
>  inherit autotools
>  
> @@ -49,11 +53,6 @@ S = "${WORKDIR}/git"
>  EXTRA_OECONF = "--with-glibc=${S}"
>  CFLAGS += "-fgnu89-inline -std=gnu99 -DIS_IN\(x\)='0'"
>  
> -do_configure () {
> -	${S}/localedef/configure ${EXTRA_OECONF}
> -}
> -
> -
>  do_install() {
>  	install -d ${D}${bindir}
>  	install -m 0755 ${B}/localedef ${D}${bindir}/cross-localedef


