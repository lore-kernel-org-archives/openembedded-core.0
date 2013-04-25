Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVNOo-00043Y-4l
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 16:43:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3PEPutR002411
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2013 07:25:56 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 07:25:57 -0700
Message-ID: <51793CE0.7060809@windriver.com>
Date: Thu, 25 Apr 2013 09:25:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>, <martin.donnelly@ge.com>
References: <1366896519-27520-1-git-send-email-martin.donnelly@ge.com>
In-Reply-To: <1366896519-27520-1-git-send-email-martin.donnelly@ge.com>
Subject: Re: [PATCH] cracklib: generate the default dictionary on the target
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
X-List-Received-Date: Thu, 25 Apr 2013 14:44:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/13 8:28 AM, Martin Donnelly wrote:
> Currently cracklib-native is used to generate the dictionary
> database from the wordlist during install. Unfortunately the
> database files are endian-specific and this results in
> errors when the host and target endianness differ.
>
> This patch creates the default dictionary files on the target
> during post-install. In order to do this the default wordlist has
> also been compressed, this enables an unmodified cracklib-format
> to correctly parse the input file with both busybox and GNU gzip.
> (These behave differently if the input is uncompressed, GNU
> gzip behaves like cat while busybox returns an error).
>
> Finally the cracklib-native package has been removed since
> it is no longer used.

I thought we had fixed cracklib to have a fixed endian.  If not, this is a bug. 
  We want to avoid running things like the cracklib generation on the target if 
possible, as it impacts the first boot time and read-only roots.

(I'm fine with this as a workaround, but it's not the fix I'd like.)  I'd be 
happy if we simply fixed the cracklib-native to pass in an endian and have the 
right output generated.  (Note, we also have to consider structure 
alignment/packing as well.)

If there isn't already a bug in the Yocto Project bugzilla, can you add one?

--Mark

> Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
> ---
>   meta/recipes-extended/cracklib/cracklib_2.8.22.bb |   15 ++++++++++-----
>   1 files changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> index 7e398f4..9ebca33 100644
> --- a/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> +++ b/meta/recipes-extended/cracklib/cracklib_2.8.22.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
>   LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
>
> -DEPENDS = "cracklib-native zlib"
> -DEPENDS_class-native = "zlib"
> +DEPENDS = "zlib"
>   PR ="r0"
>
>   EXTRA_OECONF = "--without-python"
> @@ -17,8 +16,14 @@ SRC_URI[sha256sum] = "feaff49bfb513ec10b2618c00d2f7f60776ba93fcc5fa22dd3479dd9ca
>
>   inherit autotools gettext
>
> -BBCLASSEXTEND = "native"
> -
>   do_install_append_class-target() {
> -	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
> +	gzip ${D}${datadir}/cracklib/cracklib-small
> +}
> +
> +pkg_postinst_${PN} () {
> +if [ "x$D" = "x" ]; then
> +	create-cracklib-dict -o ${datadir}/cracklib/pw_dict ${datadir}/cracklib/cracklib-small.gz >/dev/null
> +else
> +	exit 1
> +fi
>   }
>



