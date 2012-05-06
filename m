Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SQxR3-0007h8-HO for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 11:07:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q468ubRo027569
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 May 2012 09:56:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22167-07 for <openembedded-core@lists.openembedded.org>;
	Sun,  6 May 2012 09:56:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q468uSCt027563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 May 2012 09:56:30 +0100
Message-ID: <1336294592.23777.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 06 May 2012 09:56:32 +0100
In-Reply-To: <1336148632-5828-1-git-send-email-sgw@linux.intel.com>
References: <1336148632-5828-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2][EDISON 1.1.2] image.bbclass: add check for live and convert to ext3
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
X-List-Received-Date: Sun, 06 May 2012 09:07:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-05-04 at 09:23 -0700, Saul Wold wrote:
> The live image type depends on ext3 which has it's own
> dependencies, while the live type has none, this is a
> backport change to fix [YOCTO #2246]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image.bbclass |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index b8ca370..e9a3aa6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -76,6 +76,8 @@ inherit image-${IMAGE_TYPE}
>  python () {
>      deps = bb.data.getVarFlag('do_rootfs', 'depends', d) or ""
>      for type in (bb.data.getVar('IMAGE_FSTYPES', d, True) or "").split():
> +        if type == "live":
> +            type = "ext3"
>          for dep in ((bb.data.getVar('IMAGE_DEPENDS_%s' % type, d) or "").split() or []):
>              deps += " %s:do_populate_sysroot" % dep
>      for dep in (bb.data.getVar('EXTRA_IMAGEDEPENDS', d, True) or "").split():

Merged to 2011-1 and master, thanks.

Richard



