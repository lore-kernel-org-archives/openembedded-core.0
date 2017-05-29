Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE397809C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 23:31:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4TNVaaC014857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 30 May 2017 00:31:38 +0100
Message-ID: <1496100696.25229.150.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 May 2017 00:31:36 +0100
In-Reply-To: <1496034979-99713-2-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1496034979-99713-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 30 May 2017 00:31:39 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] devshell.bbclass: ensure toolchains available for do_devshell
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
X-List-Received-Date: Mon, 29 May 2017 23:31:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


On Mon, 2017-05-29 at 13:16 +0800, Chang Rebecca Swee Fun wrote:
> Toolchains are required to be prepopulated in sysroot before
> entering devshell.
> 
> [YOCTO #11464]
> 
> Signed-off-by: Chang Rebecca Swee Fun 
> ---
>  meta/classes/devshell.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

This looks awfully complicated and I'm not sure this does much more
than this would:

-addtask devshell after do_patch
+addtask devshell after do_prepare_recipe_sysroot

Can someone explain to me why we want to do the below instead as I
think the effect is the same?

I did read the bug too but that didn't help answer my question.

Yes, this does mean devshell will now trigger a lot of more
dependencies and build but I think the change below would do the same
thing too.

Cheers,

Richard

> diff --git a/meta/classes/devshell.bbclass
> b/meta/classes/devshell.bbclass
> index 4de7ea6..770dcbd 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -32,7 +32,16 @@ python () {
>         # can't manipulate the environment and variables here yet
> (see YOCTO #4795)
>         d.setVarFlag("do_devshell", "manualfakeroot", "1")
>         d.delVarFlag("do_devshell", "fakeroot")
> -} 
> +
> +    # We need to ensure that the toolchains are available in the
> sysroot
> +    # when running devshell (see YOCTO #11464)
> +    # We get the dependency for do_configure depends varflag and
> DEPENDS
> +    # variable, then append it to do_devshell depends varflag
> +    deps = d.getVarFlag('do_configure', 'depends') or ""
> +    for x in bb.utils.explode_deps(d.getVar('DEPENDS') or ""):
> +        deps += ' %s:do_populate_sysroot' % x
> +    d.appendVarFlag('do_devshell', 'depends', deps)
> +}
>  
>  def devpyshell(d):
>  
> -- 
> 2.7.4
> 

