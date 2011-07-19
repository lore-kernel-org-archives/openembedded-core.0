Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QjDfd-0005v7-RQ for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:01:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JGvChW003471;
	Tue, 19 Jul 2011 17:57:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02278-09; Tue, 19 Jul 2011 17:57:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6JGv3v0003465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Jul 2011 17:57:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7da7d67b36cfd010e56a401f51e20b81e20ddba0.1311008331.git.tom_rini@mentor.com>
References: <cover.1311008331.git.tom_rini@mentor.com>
	<7da7d67b36cfd010e56a401f51e20b81e20ddba0.1311008331.git.tom_rini@mentor.com>
Date: Tue, 19 Jul 2011 17:57:02 +0100
Message-ID: <1311094622.2344.16.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@openembedded.org>,
	Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Subject: Re: [PATCH v3 1/1] Fixed concurrency problem for ZIP packed recipes.
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
X-List-Received-Date: Tue, 19 Jul 2011 17:01:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-18 at 10:00 -0700, Tom Rini wrote:
> From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> 
> The problem occured when unzip-native is not yet staged, and ZIP
> archive unpacking already started resulting in failed do_unpack task.
> 
> (oe.dev has a NEED_UNZIP_FOR_UNPACK variable we did not bring over)
> 
> Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  meta/classes/base.bbclass |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 0c2c546..0347b90 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -354,6 +354,14 @@ python () {
>          depends = depends + " xz-native:do_populate_sysroot"
>          bb.data.setVarFlag('do_unpack', 'depends', depends, d)
>  
> +    # unzip-native should already be staged before unpacking ZIP recipes
> +    src_uri = bb.data.getVar('SRC_URI', d, 1)
> +
> +    if ".zip" in src_uri:
> +        depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
> +        depends = depends + " unzip-native:do_populate_sysroot"
> +        bb.data.setVarFlag('do_unpack', 'depends', depends, d)
> +
>      # 'multimachine' handling
>      mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
>      pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)

Any reason we can't use the value of SRC_URI we already have in the
srcuri variable a few lines above this? :)

Assuming you're ok with the change I can just fix this to save it
bouncing around the lists further...

Cheers,

Richard



