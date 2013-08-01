Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 177416B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 07:38:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r717m4m7008944; Thu, 1 Aug 2013 08:48:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DgqOkKj2o7FL; Thu,  1 Aug 2013 08:48:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r717m0DE008941
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 1 Aug 2013 08:48:02 +0100
Message-ID: <1375342673.3362.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 01 Aug 2013 08:37:53 +0100
In-Reply-To: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
References: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Aug 2013 07:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-31 at 12:13 -0300, Otavio Salvador wrote:
> This allow the addition and removal of distro features easily. To add
> a feature, use:
> 
>  EXTRA_DISTRO_FEATURES += "wayland"
> 
> and to remove, use '~' prefix, as:
> 
>  EXTRA_DISTRO_FEATURES += "~x11"
> 
> This code has been mostly copied from Mentor Graphics public layer but
> changed the variable name for a more descriptive name. The original
> code can be seen at user_feature.bbclass at:
> 
>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes for v3:
> - Drop _prepend/_append flags from DISTRO_FEATURES to avoid the re-add
> 
>  meta/classes/base.bbclass |  4 ++++
>  meta/lib/oe/utils.py      | 25 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 9c92e0b..83f6458 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -298,6 +298,9 @@ def buildcfg_neededvars(d):
>      if pesteruser:
>          bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
>  
> +EXTRA_DISTRO_FEATURES ?= ""
> +EXTRA_DISTRO_FEATURES[type] = "list"
> +
>  addhandler base_eventhandler
>  base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
>  python base_eventhandler() {
> @@ -307,6 +310,7 @@ python base_eventhandler() {
>          preferred_ml_updates(e.data)
>          oe.utils.features_backfill("DISTRO_FEATURES", e.data)
>          oe.utils.features_backfill("MACHINE_FEATURES", e.data)
> +        oe.utils.extra_distro_features(e.data)
>  
>      if isinstance(e, bb.event.BuildStarted):
>          localdata = bb.data.createCopy(e.data)
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 82987e8..db468cb 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -117,6 +117,31 @@ def features_backfill(var,d):
>      if addfeatures:
>          d.appendVar(var, " " + " ".join(addfeatures))
>  
> +def extra_distro_features(d):
> +    import oe.data
> +
> +    l = d.createCopy()
> +    l.finalize()
> +
> +    extra_features = oe.data.typed_value('EXTRA_DISTRO_FEATURES', l)
> +    if not extra_features:
> +        return
> +
> +    distro_features = l.getVar('DISTRO_FEATURES', True).split()
> +    for feature in extra_features:
> +        if feature.startswith('~'):
> +            feature = feature[1:]
> +            if feature in distro_features:
> +                distro_features.remove(feature)
> +        else:
> +            if feature not in distro_features:
> +                distro_features.append(feature)
> +
> +    # Avoid readding the removed features later
> +    d.delVarFlag("DISTRO_FEATURES", "_append")
> +    d.delVarFlag("DISTRO_FEATURES", "_prepend")

I quite clearly said this was a hack to allow you to see what the
problem was with the code and that it was *not* an acceptable change to
go into the core. I don't see any mention of that now and that is a
little frustrating to see this being proposed as a patch.

Cheers,

Richard




