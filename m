Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Slcai-0002qS-K0 for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 11:06:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q628tjjf029598
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 09:55:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26131-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2012 09:55:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q628tZeO029591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 09:55:37 +0100
Message-ID: <1341219341.23146.183.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 09:55:41 +0100
In-Reply-To: <13ed4eabf4dfcb28267d045fc30e402a3484e95d.1340600710.git.lianhao.lu@intel.com>
References: <5bfc2cadad3f2b0e2b03c4562aba4efd0a604c95.1340600710.git.lianhao.lu@intel.com>
	<13ed4eabf4dfcb28267d045fc30e402a3484e95d.1340600710.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V3 2/3] image/core-image: Handle conflicting IMAGE_FEATURES.
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
X-List-Received-Date: Mon, 02 Jul 2012 09:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-25 at 13:15 +0800, Lianhao Lu wrote:
> IMAGE_FEATURES such as 'ssh-server-dropbear' and 'ssh-server-openssh'
> can't be both enabled. User can use the following variables to define
> the relationship of image features:
> 
> IMAGE_FEATURES_REPLACES_foo = "bar" means including image feature "foo"
> would replace the image feature "bar".
> 
> IMAGE_FEATURES_CONFLICTS_foo = "bar" means including both image features
> "foo" and "bar" would cause an parsing error.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/core-image.bbclass                 |   11 ++++++++++-
>  meta/classes/image.bbclass                      |   17 +++++++++++++++++
>  meta/recipes-sato/images/core-image-sato-sdk.bb |    2 ++
>  3 files changed, 29 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 25f5c5a..6b207d7 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -47,6 +47,14 @@ PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
>  PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
>  PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
>  
> +
> +# IMAGE_FEAETURES_REPLACES_foo = 'bar1 bar2'
> +# Including image feature foo would replace the image features bar1 and bar2
> +IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
> +
> +# IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
> +# An error exception would be raised if both image features foo and bar1(or bar2) are included
> +
>  CORE_IMAGE_BASE_INSTALL = '\
>      task-core-boot \
>      task-base-extended \
> @@ -60,7 +68,8 @@ IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>  
>  X11_IMAGE_FEATURES  = "x11-base apps-x11-core package-management"
>  ENHANCED_IMAGE_FEATURES = "${X11_IMAGE_FEATURES} apps-x11-games apps-x11-pimlico package-management"
> -SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ssh-server-dropbear"
> +SSHSERVER_IMAGE_FEATURES ??= "ssh-server-dropbear"
> +SATO_IMAGE_FEATURES = "${ENHANCED_IMAGE_FEATURES} x11-sato ${SSHSERVER_IMAGE_FEATURES}"
>  
>  inherit image
>  
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 0772363..6fac974 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -87,6 +87,23 @@ python () {
>          deps += " %s:do_populate_sysroot" % dep
>      d.setVarFlag('do_rootfs', 'depends', deps)
>  
> +    #process IMAGE_FEATURES, we must do this before runtime_mapping_rename
> +    #Check for replaces image features
> +    features = set(oe.data.typed_value('IMAGE_FEATURES', d))
> +    remain_features = features.copy()
> +    for feature in features:
> +        replaces = set((d.getVar("IMAGE_FEATURES_REPLACES_%s" % feature, True) or "").split())
> +        remain_features -= replaces
> +
> +    #Check for conflict image features
> +    for feature in remain_features:
> +        conflicts = set((d.getVar("IMAGE_FEATURES_CONFLICTS_%s" % feature, True) or "").split())
> +        temp = conflicts & remain_features
> +        if temp:
> +            raise bb.parse.SkipPackage("%s contains conflicting IMAGE_FEATURES %s %s" % (d.getVar('PN', True), feature, ' '.join(list(temp))))


I'm not sure that SkipPackage is the right error here. This will simply
make the image target "disappear" when in this case we really want to
raise a "proper" error?


Cheers,

Richard



