Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqKc-0002Wt-6V
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:02:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2012 09:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221131136"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:49:56 -0700
Message-ID: <5050BD34.5040200@linux.intel.com>
Date: Wed, 12 Sep 2012 09:49:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkit-gtk: work around Make bug by re-running make
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
X-List-Received-Date: Wed, 12 Sep 2012 17:02:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/10/2012 09:02 AM, Ross Burton wrote:
> GNU make 3.82 has a bug where it drops required dependencies.
> https://bugs.webkit.org/show_bug.cgi?id=79498 is the WebKitGTK+
> bug, and http://savannah.gnu.org/bugs/?30653 is the GNU Make bug.
>
> Work around this by running make again if it fails just in case the failure is
> due to the bug.
>
> Based on a patch by Andreas Müller <schnitzeltony@googlemail.com>.
>
> [ YOCTO #2816 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb |   22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>

Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
> index cf4129d..8beb6eb 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
>                       file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
>                       file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
>
> +PR = "r1"
> +
>   # Choice of language backends - icu has issues on Big Endian machines so use pango
>   ICU_LIB = "icu"
>   ICU_LIB_powerpc = "pango"
> @@ -77,6 +79,26 @@ do_configure_append() {
>   	done
>   }
>
> +# A dirty hack for GNU make 3.82 bug which means it drops required
> +# dependencies. https://bugs.webkit.org/show_bug.cgi?id=79498 is the WebKitGTK+
> +# bug, and http://savannah.gnu.org/bugs/?30653 is the GNU Make bug.  This is
> +# fixed in Make CVS, so 3.83 won't have this problem.
> +do_compile() {
> +    if [ x"$MAKE" = x ]; then MAKE=make; fi
> +    bbnote ${MAKE} ${EXTRA_OEMAKE} "$@"
> +    for error_count in 1 2 3; do
> +        bbnote "Attempt $error_count of 3"
> +        exit_code=0
> +        ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
> +        if [ $exit_code = 0 ]; then
> +            break
> +        fi
> +    done
> +    if [ ! $exit_code = 0 ]; then
> +        die "oe_runmake failed"
> +    fi
> +}
> +
>   do_install_append() {
>   	rmdir ${D}${libexecdir}
>   }
>


