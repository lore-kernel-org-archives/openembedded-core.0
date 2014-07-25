Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 7077570523
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 17:25:26 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C1EB4F8120E; Fri, 25 Jul 2014 11:25:27 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A677AF811DD;
	Fri, 25 Jul 2014 11:25:25 -0600 (MDT)
Message-ID: <53D2930C.8090709@mlbassoc.com>
Date: Fri, 25 Jul 2014 11:25:32 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1406085105.git.hongxu.jia@windriver.com>
	<d36bfea1e3c7402098ff8913d473900c8b11eb71.1406085105.git.hongxu.jia@windriver.com>
In-Reply-To: <d36bfea1e3c7402098ff8913d473900c8b11eb71.1406085105.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 25 Jul 2014 17:25:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-22 21:33, Hongxu Jia wrote:
> When adding patches or config files from bbappend files, it requires
> the use of FILESEXTRAPATHS, which has been an issue and failure point
> for people starting to work with bitbake and oe-core.
>
> We add checking to standardize how to use FILESEXTRAPATHS. Only the
> format of:
>    FILESEXTRAPATHS_append := ":${THISDIR}/Your_Files_Path" or
>    FILESEXTRAPATHS_prepend := "${THISDIR}/Your_Files_Path:"
> is acceptable.
>
> [YOCTO #5412]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes/insane.bbclass | 13 +++++++++++++
>   meta/classes/utils.bbclass  |  2 ++
>   meta/conf/bitbake.conf      |  2 ++
>   3 files changed, 17 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index b26216e..6b1c9ad 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1022,6 +1022,19 @@ python () {
>       # Check various variables
>       ###########################################################################
>
> +    # Checking ${FILESEXTRAPATHS}
> +    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
> +    if '__default' not in extrapaths.split(":"):
> +        msg = "FILESEXTRAPATHS-variable, must always use _prepend (or _append)\n"
> +        msg += "type of assignment, and don't forget the colon.\n"
> +        msg += "Please assign it with the format of:\n"
> +        msg += "  FILESEXTRAPATHS_append := \":${THISDIR}/Your_Files_Path\" or\n"
> +        msg += "  FILESEXTRAPATHS_prepend := \"${THISDIR}/Your_Files_Path:\"\n"
> +        msg += "in your bbappend file\n\n"
> +        msg += "Your incorrect assignment is:\n"
> +        msg += "%s\n" % extrapaths
> +        bb.fatal(msg)

It sure would have been nice (even polite?) to make this a warning when first
added.  As is, it's going to break a lot of builds and it will be very tedious
to fix since the parser will die on the first one it finds :-(

> +
>       if d.getVar('do_stage', True) is not None:
>           bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
>
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 0ee13e0..0f2a484 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -312,6 +312,8 @@ def explode_deps(s):
>   def base_set_filespath(path, d):
>       filespath = []
>       extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
> +    # Remove default flag which was used for checking
> +    extrapaths = extrapaths.replace("__default:", "")
>       # Don't prepend empty strings to the path list
>       if extrapaths != "":
>           path = extrapaths.split(":") + path
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f4870d5..6a0cf7a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -311,6 +311,8 @@ FILES_${PN}-locale = "${datadir}/locale"
>   FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
>   # FILESPATH is set in base.bbclass
>   #FILESPATH = "${FILE_DIRNAME}/${PF}:${FILE_DIRNAME}/${P}:${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/${BP}:${FILE_DIRNAME}/${BPN}:${FILE_DIRNAME}/files:${FILE_DIRNAME}"
> +# This default was only used for checking
> +FILESEXTRAPATHS ?= "__default:"
>
>   ##################################################################
>   # General work and output directories for the build system.
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

