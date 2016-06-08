Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5BE6FF25
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 16:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u58GxYeI006039; Wed, 8 Jun 2016 17:59:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YAplOXioGAgW; Wed,  8 Jun 2016 17:59:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u58GxUwm006035
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Jun 2016 17:59:31 +0100
Message-ID: <1465405170.13979.111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jun 2016 17:59:30 +0100
In-Reply-To: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
References: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 0/3] ipk/deb/rpm: add kernel version to its dependencies
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
X-List-Received-Date: Wed, 08 Jun 2016 16:59:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-06-08 at 19:08 +0300, Ovidiu-Adrian Vancea wrote:
> Updating the kernel (for all package managers) does not update the
> dependencies
> (eg. modules) because there is no possibility to do version
> enforcement in the
> OE recipe. Upon rebooting, the older version modules do not load and
> can leave
> hardware in a non-functioning state (if their drivers are not built
> into the
> kernel).
> 
> Use the Version field from the kernel package on its rdepends,
> rrecommends, and
> rsuggests fields’ version. This makes the packages on which the
> kernel depends
> to be the same version as the kernel. Version field contains package
> build
> number (including git hash) and package revision, thus restricting
> the kernel
> and modules to always be built together.
> 
> The current and default behavior will not change unless the variable 
> "VERSION_KERNEL_MODULES = 1" is defined in the kernel recipe.
> 
> Ovidiu-Adrian Vancea (3):
>   package_ipk.bbclass: add kernel version to its dependencies
>   package_deb.bbclass: add kernel version to its dependencies
>   package_rpm.bbclass: add kernel version to its dependencies

Why are you doing this at package_write_XXX? These tasks are there
specifically to write out the packages. With your changes the data
written to the packages would be different to that written out to
packagedata for example. We shouldn't encourage different package
metadata in different places.

I think this needs to happen somewhere at do_package time, probably
from a hook in module.bbclass?

Sorry if I wasn't clear about this last time.

Cheers,

Richard





