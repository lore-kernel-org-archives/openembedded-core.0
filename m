Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5D57B610DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 10:03:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PA3QSC024645; Wed, 25 Sep 2013 11:03:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iDhEcaYCzaKI; Wed, 25 Sep 2013 11:03:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8PA3NDa024637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 25 Sep 2013 11:03:25 +0100
Message-ID: <1380103400.18603.318.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Wed, 25 Sep 2013 11:03:20 +0100
In-Reply-To: <5241A215.4020501@gmail.com>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>
	<5240820E.5020407@windriver.com>
	<CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>
	<1379970871.18603.265.camel@ted> <1380011114.18603.270.camel@ted>
	<5241A215.4020501@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
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
X-List-Received-Date: Wed, 25 Sep 2013 10:03:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2013-09-24 at 16:30 +0200, David Nyström wrote:
> I'm have a question about this though.
> 
> diff --git a/meta/recipes-extended/shadow/shadow.inc 
> b/meta/recipes-extended/shadow/shadow.inc
> index 4df5e5e..75b0afc 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> <snip>
> +pkg_postinst_${PN} () {
> +	if [ "x$D" != "x" ]; then
> +	  rootarg="--root=$D"
> +	else
> +	  rootarg=""
> +	fi
> +
> +	pwconv $rootarg
> +	grpconv $rootarg
> +}
> <snip>
> 
> This will introduce the postinstall hook for both ${BPN}-native and 
> ${BPN} ?. Before the change, the postinstall hook was activated only by 
> ${BPN} afaict. Tried removing it from native* through 
> pkg_postinst_${BPN}, but that does not seem to work.

Basically the postinst is ignored for the -native version. It never gets
packaged so isn't relevant. Adding in special cases for native for each
and every recipe would get ugly very quickly.

> Hmm, slightly off-topic, but when looking at the postinstalls:
> 
> shadow:
> cat /tmp/opkg-extract-574/CONTROL/postinst
> 	if [ "x$D" != "x" ]; then
> 	  rootarg="--root=$D"
> 	else
> 	  rootarg=""
> 	fi
> 
> 	pwconv $rootarg
> 	grpconv $rootarg
> 	update-alternatives --install /usr/bin/passwd passwd 
> /usr/bin/passwd.shadow 200
> 	update-alternatives --install /usr/bin/chfn chfn /usr/bin/chfn.shadow 200
> 	update-alternatives --install /usr/bin/newgrp newgrp 
> /usr/bin/newgrp.shadow 200
> 
> Above is not a problem since OPKG_OFFLINE_ROOT in update-alternatives 
> can be used to redirect symlink creation when creating a from a package 
> repo.
> 
> nativesdk-shadow:
> if [ "x$D" != "x" ]; then
> 	  rootarg="--root=$D"
> 	else
> 	  rootarg=""
> 	fi
> 
> 	pwconv $rootarg
> 	grpconv $rootarg
> 	update-alternatives --install 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/passwd 
> passwd 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/passwd.shadow 
> 200
> 	update-alternatives --install 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chfn chfn 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chfn.shadow 200
> 	update-alternatives --install 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp 
> newgrp 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp.shadow 
> 200
> 	update-alternatives --install 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chsh chsh 
> /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/chsh.shadow 200
> 
> Could we not add a "--root" option to update-alternatives like done to 
> update-rc.d instead of hardcoding paths or using envs.

nativesdk are built to run in that specific path. We're therefore not
installing them to some subdirectory where a root makes sense, the
prefix really was /opt/xxx. We then manipulate things later to make them
more relocatable.

> 
> Also, seems like ${sysconfdir} in the nativesdk-opkg postinstall expands to:
> 
> chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
> chmod 0755 
> $D/opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts
> 
> Is this really expected behaviour ?

nativesdk postinstalls are probably badly handled at the moment. I
suspect if things can run at rootfs creation time they work out, if they
can't run then, they never happen at all. We don't have a "first boot"
of the sdk...

Cheers,

Richard


