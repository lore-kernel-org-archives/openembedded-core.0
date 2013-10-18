Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE176D150
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 15:04:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IF46ax000485; Fri, 18 Oct 2013 16:04:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4hNg1WB_hsbi; Fri, 18 Oct 2013 16:04:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IF4Xdu000498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 18 Oct 2013 16:04:35 +0100
Message-ID: <1382108670.29912.553.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Fri, 18 Oct 2013 16:04:30 +0100
In-Reply-To: <fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
References: <cover.1381954954.git.tom.zanussi@linux.intel.com>
	<fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] wic: add pseudo to the populate-extfs step
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
X-List-Received-Date: Fri, 18 Oct 2013 15:04:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-10-16 at 15:25 -0500, Tom Zanussi wrote:
> Without this, files in the generated filesystem pick up the wrong
> ownership.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  scripts/lib/mic/kickstart/custom_commands/partition.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
> index 302cace..0eb0671 100644
> --- a/scripts/lib/mic/kickstart/custom_commands/partition.py
> +++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
> @@ -216,7 +216,14 @@ class Wic_PartData(Mic_PartData):
>          """
>          Prepare content for an ext2/3/4 rootfs partition.
>          """
> -        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
> +        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> +        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
> +        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir
> +        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"
> +        populate_script += "export PSEUDO_DISABLED=0;"
> +        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
> +            (native_sysroot, native_sysroot)
> +
>          image_extra_space = 10240
>  
>          image_rootfs = rootfs_dir

I've merged this but I would like to figure out why pseudo can't manage
more sane defaults rather than needing all of those variables...

Cheers,

Richard



