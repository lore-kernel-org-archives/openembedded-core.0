Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 04A9376B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LC8SJ015380; Tue, 1 Sep 2015 22:12:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 04SQMdZlqoug; Tue,  1 Sep 2015 22:12:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81LBrj1015373
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 22:12:04 +0100
Message-ID: <1441141913.24871.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jian Liu <jian.liu@windriver.com>
Date: Tue, 01 Sep 2015 22:11:53 +0100
In-Reply-To: <1440491341-29988-1-git-send-email-jian.liu@windriver.com>
References: <1440491341-29988-1-git-send-email-jian.liu@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sdk.py: fix conflicts of packages
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
X-List-Received-Date: Tue, 01 Sep 2015 21:12:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-25 at 16:29 +0800, Jian Liu wrote:
> If packages are conveyed to smart to install at the same time,
> conflicts will not happen.
> Try to install packages into sdk image at the same time.

Doesn't smart have an issue where if one package fails to install for
some reason, others listed in the same command won't be attempted? Did
you test that?

Cheers,

Richard

> This patch is not so perfect. For example,
>   IMAGE_INSTALL += "lib32-ncurses"
>   IMAGE_INSTALL += "ncurses-dev"
>  ncurses-dev and lib32-ncurses-dev will have conflicts during packages installation.
> 
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  sdk.py |   45 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
> index c57a441..7b43a29 100644
> --- a/meta/lib/oe/sdk.py
> +++ b/meta/lib/oe/sdk.py
> @@ -107,10 +107,17 @@ class RpmSdk(Sdk):
>          pm.dump_all_available_pkgs()
>          pm.update()
>  
> -        for pkg_type in self.install_order:
> -            if pkg_type in pkgs_to_install:
> -                pm.install(pkgs_to_install[pkg_type],
> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
> +        pkgs = []
> +        pkgs_attempt = []
> +        for pkg_type in pkgs_to_install:
> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
> +                pkgs_attempt += pkgs_to_install[pkg_type]
> +            else:
> +                pkgs += pkgs_to_install[pkg_type]
> +
> +        pm.install(pkgs)
> +
> +        pm.install(pkgs_attempt, True)
>  
>      def _populate(self):
>          bb.note("Installing TARGET packages")
> @@ -184,10 +191,17 @@ class OpkgSdk(Sdk):
>  
>          pm.update()
>  
> -        for pkg_type in self.install_order:
> -            if pkg_type in pkgs_to_install:
> -                pm.install(pkgs_to_install[pkg_type],
> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
> +        pkgs = []
> +        pkgs_attempt = []
> +        for pkg_type in pkgs_to_install:
> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
> +                pkgs_attempt += pkgs_to_install[pkg_type]
> +            else:
> +                pkgs += pkgs_to_install[pkg_type]
> +
> +        pm.install(pkgs)
> +
> +        pm.install(pkgs_attempt, True)
>  
>      def _populate(self):
>          bb.note("Installing TARGET packages")
> @@ -260,10 +274,17 @@ class DpkgSdk(Sdk):
>          pm.write_index()
>          pm.update()
>  
> -        for pkg_type in self.install_order:
> -            if pkg_type in pkgs_to_install:
> -                pm.install(pkgs_to_install[pkg_type],
> -                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
> +        pkgs = []
> +        pkgs_attempt = []
> +        for pkg_type in pkgs_to_install:
> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
> +                pkgs_attempt += pkgs_to_install[pkg_type]
> +            else:
> +                pkgs += pkgs_to_install[pkg_type]
> +
> +        pm.install(pkgs)
> +
> +        pm.install(pkgs_attempt, True)
>  
>      def _populate(self):
>          bb.note("Installing TARGET packages")



