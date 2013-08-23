Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 035D16065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:59:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFBQv2021057; Fri, 23 Aug 2013 16:11:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EYNCg8vO6xrr; Fri, 23 Aug 2013 16:11:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFBM0D021052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 23 Aug 2013 16:11:24 +0100
Message-ID: <1377269956.6762.92.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 23 Aug 2013 15:59:16 +0100
In-Reply-To: <1377269339-6139-2-git-send-email-otavio@ossystems.com.br>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
	<1377269339-6139-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v5 1/2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 23 Aug 2013 14:59:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 11:48 -0300, Otavio Salvador wrote:
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

I discussed this with Otavio. My personal view is that we should hold
off this right now. The removal issues he ran into with poky have been
addressed in other ways so there is less of an immediate issue.

The better fix for this kind of problem is -=/=- or more likely _remove
override support in bitbake. I did propose a _remove patch a while back
but Chris has some valid concerns about it, I don't remember the details
offhand. I'd much rather we focused on fixing that and getting that
merged than trying to add this functionality to every variable.

Cheers,

Richard



> ---
> Changes in v5:
> - Resend
> 
> Changes in v4:
> - Drop _prepend/_append hack and remove/add DISTRO_FEATURES (thanks to
>   RP for the tip).
> 
> Changes in v3:
> - Drop _prepend/_append flags from DISTRO_FEATURES to avoid the re-add
> 
> Changes in v2:
> - Use data copy to fix wrong prepend/append expanding.
> 
>  meta/classes/base.bbclass |  4 ++++
>  meta/lib/oe/utils.py      | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 98b823e..f30f4db 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -288,6 +288,9 @@ def buildcfg_neededvars(d):
>      if pesteruser:
>          bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
>  
> +EXTRA_DISTRO_FEATURES ?= ""
> +EXTRA_DISTRO_FEATURES[type] = "list"
> +
>  addhandler base_eventhandler
>  base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
>  python base_eventhandler() {
> @@ -297,6 +300,7 @@ python base_eventhandler() {
>          preferred_ml_updates(e.data)
>          oe.utils.features_backfill("DISTRO_FEATURES", e.data)
>          oe.utils.features_backfill("MACHINE_FEATURES", e.data)
> +        oe.utils.extra_distro_features(e.data)
>  
>      if isinstance(e, bb.event.BuildStarted):
>          localdata = bb.data.createCopy(e.data)
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index 82987e8..0c9dde0 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -117,6 +117,30 @@ def features_backfill(var,d):
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
> +    d.delVar("DISTRO_FEATURES")
> +
> +    d.setVar('DISTRO_FEATURES', ' '.join(distro_features))
>  
>  def packages_filter_out_system(d):
>      """



