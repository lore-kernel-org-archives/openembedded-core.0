Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 067C173111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:31:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v28HVsE0004402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Mar 2017 09:31:54 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 09:31:53 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e1abebd7-dba3-0c61-a3cd-bdc5a9d39fab@windriver.com>
Date: Wed, 8 Mar 2017 11:31:52 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 17:31:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

One of the uses I've seen people ask for is to take the (patched) versions that
OE puts together, store these in their own git trees and manage it there -- also
allowing them to patch them directly in their own trees.

It appears to me this could be used to pull down that content.  Have you thought
about adding anything to make it easier for someone to generate the trees?

--Mark

On 3/8/17 11:25 AM, Ross Burton wrote:
> This class lets you use BBCLASSEXTEND to add a variant of the recipe that
> fetches from git instead of a tarball.
> 
> For example:
> 
>  BBCLASSEXTEND = "gitupstream:target"
>  SRC_URI_class-gitupstream = "git://git.example.com/example"
>  SRCREV_class-gitupstream = "abcd1234"
> 
> This variant will have DEFAULT_PREFERENCE set to -1 so it needs to be selected
> to be used, and any git-specific tweaks can be done with the class-gitupstream
> override, for example:
> 
>  DEPENDS_append_class-gitupstream = " gperf-native"
> 
>  do_configure_prepend_class-gitupstream() {
>     touch ${S}/README
>  }
> 
> It currently only supports creating a git variant of the target recipe, not
> native or nativesdk.  The BBCLASSEXTEND syntax (gitupstream:target) was chosen
> so that support for native and nativesdk can be added at a later date.
> 
> [ YOCTO #10215 ]
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/gitupstream.bbclass | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/classes/gitupstream.bbclass
> 
> diff --git a/meta/classes/gitupstream.bbclass b/meta/classes/gitupstream.bbclass
> new file mode 100644
> index 0000000..405283d
> --- /dev/null
> +++ b/meta/classes/gitupstream.bbclass
> @@ -0,0 +1,25 @@
> +CLASSOVERRIDE = "class-gitupstream"
> +
> +# TODO doesn't let you gitupstream a native recipe yet
> +
> +python gitupstream_virtclass_handler () {
> +    # Do nothing if this is inherited, as it's for BBCLASSEXTEND
> +    if "gitupstream" not in (e.data.getVar('BBCLASSEXTEND', True) or ""):
> +        bb.error("Don't inherit gitupstream, use BBCLASSEXTEND")
> +        return
> +
> +    variant = d.getVar("BBEXTENDVARIANT", True)
> +    if variant not in ("target"):
> +        bb.error("Pass the variant when using gitupstream, for example gitupstream:target")
> +
> +    d.setVar("DEFAULT_PREFERENCE", "-1")
> +    d.setVar("S", "${WORKDIR}/git")
> +
> +    # Modify the SRCREV, if the recipe hasn't used PV_class-gitupstream to
> +    # assign a +gitX PV already.
> +    pv = d.getVar("PV", True)
> +    if "+git" not in pv:
> +        d.setVar("PV", pv + "+git${SRCPV}")
> +}
> +addhandler gitupstream_virtclass_handler
> +gitupstream_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
> 


