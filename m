Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 856F770396
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:03:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 17:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,661,1400050800"; d="scan'208";a="573122542"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 17:04:00 -0700
Message-ID: <53C46FEC.3080006@linux.intel.com>
Date: Mon, 14 Jul 2014 17:03:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Drew Moseley <drew_moseley@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1405019902-31691-1-git-send-email-drew_moseley@mentor.com>
In-Reply-To: <1405019902-31691-1-git-send-email-drew_moseley@mentor.com>
Subject: Re: [PATCH] libomxil-0.9.3: Move .so files to main package.
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
X-List-Received-Date: Tue, 15 Jul 2014 00:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2014 12:18 PM, Drew Moseley wrote:
> The omxregister-bellagio app scans the libdir for the '*.so'
> files to get them properly registered.  Make sure they are
> included in the base package rather than the dev.
>
Would it be better to patch the register app to have a more generic 
search for .so*??

Something to check with the libomxil upstream?

I am not saying no to this, just want to check out options.

Thanks
	Sau!


> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>   meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> index 103d789..e11febc 100644
> --- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> +++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
> @@ -24,12 +24,14 @@ inherit autotools
>   EXTRA_OECONF += "--disable-doc --disable-Werror"
>
>   FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
> -                ${libdir}/omxloaders/*${SOLIBS}"
> +                ${libdir}/bellagio/*${SOLIBSDEV} \
> +                ${libdir}/omxloaders/*${SOLIBS} \
> +                ${libdir}/omxloaders/*${SOLIBSDEV}"
>   FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
>                             ${libdir}/omxloaders/*.a"
>   FILES_${PN}-dev += "${libdir}/bellagio/*.la \
> -                    ${libdir}/bellagio/*${SOLIBSDEV} \
> -                    ${libdir}/omxloaders/*.la \
> -                    ${libdir}/omxloaders/*${SOLIBSDEV}"
> +                    ${libdir}/omxloaders/*.la"
>   FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
>                       ${libdir}/omxloaders/.debug/"
> +
> +INSANE_SKIP_${PN} += "dev-so"
>

