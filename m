Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UK59Y-0001nO-AZ for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 12:01:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PAs0W1024438; Mon, 25 Mar 2013 10:54:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SmwN2xtQHuDN; Mon, 25 Mar 2013 10:54:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PArpXq024430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 10:53:54 GMT
Message-ID: <1364208241.3097.38.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Date: Mon, 25 Mar 2013 10:44:01 +0000
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A01487E80@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363831511-800-1-git-send-email-zhenhua.luo@freescale.com>
	<1363969789.3097.16.camel@ted> <514C8F34.7060503@windriver.com>
	<CA452391058F6D4E9715FB2C29D9312A01487E80@039-SN2MPN1-022.039d.mgd.msft.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core v2] rpm: split out run-postinsts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 11:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 10:38 +0000, Luo Zhenhua-B19537 wrote:
> > > Don't we need to depend on this package somewhere so that it gets
> > > installed?
> > 
> > I think it should be required from the rootfs_rpm.bbclass in some way.
> [Luo Zhenhua-B19537] Is following the right way to include the rpm-postinsts into rootfs or any better idea? Below patch is verified to be working. 
> 
> --- a/meta/classes/rootfs_rpm.bbclass
> +++ b/meta/classes/rootfs_rpm.bbclass
> @@ -35,6 +35,8 @@ opkglibdir = "${localstatedir}/lib/opkg"
>  RPMOPTS="--dbpath ${rpmlibdir}"
>  RPM="rpm ${RPMOPTS}"
>  
> +IMAGE_INSTALL += "rpm-postinsts"
> +
>  # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
>  # in ${DEPLOY_DIR_RPM}. This can be removed if package_update_index_rpm can be called concurrently
>  do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"

Looking at rootfs_ipk:

ROOTFS_PKGMANAGE = "opkg opkg-collateral ${EXTRAOPKGCONFIG}"
ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"

seems to be a pretty good setup to copy, particularly given the rpm
counterpart:

# Postinstalls on device are handled within this class at present
ROOTFS_PKGMANAGE_BOOTSTRAP = ""

which is no longer true.

Cheers,

Richard



