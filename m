Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgdeM-00072C-Vn for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 16:46:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FVjLr030263;
	Thu, 6 Dec 2012 15:31:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29258-08; Thu,  6 Dec 2012 15:31:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6FVakW030257
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 15:31:37 GMT
Message-ID: <1354807886.12928.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 06 Dec 2012 15:31:26 +0000
In-Reply-To: <04747ce39a3fbbd538556c67247452b931a3ccc5.1354650148.git.mark.hatle@windriver.com>
References: <cover.1354650148.git.mark.hatle@windriver.com>
	<04747ce39a3fbbd538556c67247452b931a3ccc5.1354650148.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] classes/*_rpm: integrate Smart into RPM filesystem construction
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
X-List-Received-Date: Thu, 06 Dec 2012 15:46:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-04 at 13:49 -0600, Mark Hatle wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Use Smart to construct the root filesystem for images and the contents
> of SDKs rather than the custom scripts around rpm we had previously.
> This ensures the result when producing an updated image will be the
> same as upgrading to the same package versions from an older image on
> the target, as well as allowing us to remove a substantial amount of
> code making the rpm classes much easier to follow.
> 
> Some bugfixes from Bogdan Marinescu <bogdan.marinescu@intel.com>.
> SDK implementation and testing as well as a number of bugfixes from
> Mark Hatle <mark.hatle@windriver.com>.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/classes/package_rpm.bbclass      |  533 ++++++---------------------------
>  meta/classes/populate_sdk_rpm.bbclass |   48 +---
>  meta/classes/rootfs_rpm.bbclass       |   31 +-
>  3 files changed, 117 insertions(+), 495 deletions(-)
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 200a941..aa5b156 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -8,6 +8,8 @@ RPMBUILD="rpmbuild"
>  PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
>  PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
>  
> +EXTRANATIVEPATH += "python-native"
> +

Er, no!

Why do we need to do this? We now need python-native at package
generation time? Why?

There is no dependency for that and this would totally kill build
performance if we did add it.

Cheers,

Richard



