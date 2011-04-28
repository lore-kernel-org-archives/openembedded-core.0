Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFN9Y-00072Z-Mu for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:04:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S92BbN016091;
	Thu, 28 Apr 2011 10:02:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15613-10; Thu, 28 Apr 2011 10:02:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S922MX016085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:02:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
Date: Thu, 28 Apr 2011 10:01:30 +0100
Message-ID: <1303981290.21461.39.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 28 Apr 2011 09:04:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-27 at 00:29 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Ensure gettext and gettext-native are removed from DEPENDS when
> not using NLS
> 
> Use append instead of += to get gettext dependecies processed
> correctly in all cases
> 
> Dont remove gettext-native for native recipes as ENABLE_NLS is
> only for target and not for native recipes
> 
> Replace using 1 for a boolean type with True
> 
> Honor INHIBIT_DEFAULT_DEPS
> 
> Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is non
> null
> 
> operate on virtclass overrides individually
> 
> virtclass classes are parsed at the end hence
> just doing DEPENDS munging is not enough since
> it will be overridden

This patch is better but I have a couple of things I'd like to see
tweaked.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/gettext.bbclass |   38 ++++++++++++++++++++++++++------------
>  1 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
> index a40e74f..f7b84ec 100644
> --- a/meta/classes/gettext.bbclass
> +++ b/meta/classes/gettext.bbclass
> @@ -1,17 +1,31 @@
>  def gettext_after_parse(d):
> -    # Remove the NLS bits if USE_NLS is no.
> -    if bb.data.getVar('USE_NLS', d, 1) == 'no':
> -        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
> -        cfg += " --disable-nls"
> -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
> -        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
> -        bb.data.setVar('EXTRA_OECONF', cfg, d)
> -
> +   # Remove the NLS bits if USE_NLS is no.
> +   if bb.data.getVar('USE_NLS', d, True) == 'no':
> +       cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
> +       cfg += " --disable-nls"
> +       depends = bb.data.getVar('DEPENDS', d, True) or ""

These lines all look the same but the indentation is different. Python
should always be four spaces and indentation changes should always be as
a separate patch from code changes anyway. Please fix :)

> +       depends = oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gettext)$', depends, d)
> +       if not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crosssdk'):
> +           depends = oe_filter_out('^(gettext-native)$', depends, d)
> +       bb.data.setVar('DEPENDS', depends, d)
> +       bb.data.setVar('EXTRA_OECONF', cfg, d)
> +   # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove dependencies
> +   # added by this class through DEPENDS_GETTEXT
> +   if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True):
> +       depends_native = bb.data.getVar('DEPENDS_virtclass-native', d, True) or ""
> +       depends_nativesdk = bb.data.getVar('DEPENDS_virtclass-nativesdk', d, True) or ""
> +       depends = bb.data.getVar('DEPENDS', d, True) or ""
> +       gettext_deps = bb.data.getVar('DEPENDS_GETTEXT', d, True).replace(' ','|')
> +       gettext_deps = '^(' + gettext_deps + ')$'
> +       depends_native = oe_filter_out(gettext_deps, depends_native, d)
> +       depends_nativesdk = oe_filter_out(gettext_deps, depends_nativesdk, d)
> +       depends = oe_filter_out(gettext_deps, depends, d)
> +       bb.data.setVar('DEPENDS_virtclass-native', depends, d)
> +       bb.data.setVar('DEPENDS_virtclass-nativesdk', depends, d)
> +       bb.data.setVar('DEPENDS', depends, d)

We can make this simpler. We should just setVar("DEPENDS_GETTEXT", "")
in the INHIBIT_DEFAULT_DEPS case. If anything is expanding the variables
somewhere, we should fix that.

In fact, rather than all this ugly manipulation can't we just set
DEPENDS_GETTEXT to "" in the INHIBIT_DEFAULT_DEPS or USE_NLS cases? If
that doesn't work, the recipes dependencies are broken and should be
fixed to inherit this class, right? 

>  python () {
>      gettext_after_parse(d)
>  }
> -
> -DEPENDS_GETTEXT = "gettext gettext-native"
> -
> -DEPENDS =+ "${DEPENDS_GETTEXT}"
>  EXTRA_OECONF += "--enable-nls"
> +DEPENDS_GETTEXT ?= "virtual/gettext"
> +DEPENDS_append = " ${DEPENDS_GETTEXT} "

I think this needs to be:

DEPENDS_GETTEXT ?= "virtual/gettext virtual/gettext-native"

as I'm sure we're been bitten by a lack of the native dependency
before :/. Target packages using gettext do definitely need both to be
available.

Cheers,

Richard



