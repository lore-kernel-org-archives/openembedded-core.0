Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D1B276E00C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 09:14:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2U9CYp8006436; Sun, 30 Mar 2014 10:14:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mzZliAFzWIBP; Sun, 30 Mar 2014 10:14:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2U9ESQe006571
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 30 Mar 2014 10:14:29 +0100
Message-ID: <1396170862.14790.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 30 Mar 2014 10:14:22 +0100
In-Reply-To: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
References: <1396123481-6064-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-core-tools-testapps: Move GLTOOLS to X11GLTOOLS
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
X-List-Received-Date: Sun, 30 Mar 2014 09:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-03-29 at 17:04 -0300, Otavio Salvador wrote:
> piglit and mesa-demos are not buildable in x11-less distros so we must
> to add those only when opengl and x11 DISTRO_FEATURES are available.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> index d8a7306..0ced119 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
> @@ -24,7 +24,7 @@ KEXECTOOLS_powerpc ?= ""
>  KEXECTOOLS_e5500-64b ?= ""
>  KEXECTOOLS_aarch64 ?= ""
>  
> -GLTOOLS = "\
> +X11GLTOOLS = "\
>      mesa-demos \
>      piglit \
>      "
> @@ -58,6 +58,7 @@ RDEPENDS_${PN} = "\
>      connman-tests \
>      connman-client \
>      ${@base_contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
> -    ${@base_contains('DISTRO_FEATURES', 'opengl', "${GLTOOLS}", "", d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'opengl', \
> +        base_contains('DISTRO_FEATURES', 'x11', "${X11GLTOOLS}", "", d), "", d)} \

Please just do:

base_contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} 

Cheers,

Richard


