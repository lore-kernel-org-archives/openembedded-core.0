Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 82DD173D27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:04:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 366F23C88761
Message-ID: <1442333089.3357.40.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:04:49 +0100
In-Reply-To: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Tue, 15 Sep 2015 16:04:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 14:22 +0200, Martin Jansa wrote:
> * useful when we need to overlay/extend intercept scripts from oe
> -core
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  meta/lib/oe/rootfs.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index c29843b..76950ec 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -164,6 +164,9 @@ class Rootfs(object):
>          pre_process_cmds =
> self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
>          post_process_cmds =
> self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
>  
> +        postinst_intercepts_dir =
> self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
> +        if not postinst_intercepts_dir:
> +            postinst_intercepts_dir =
> self.d.expand("${COREBASE}/scripts/postinst-intercepts")
>          intercepts_dir = os.path.join(self.d.getVar('WORKDIR',
> True),
>                                        "intercept_scripts")
>  
> @@ -173,8 +176,7 @@ class Rootfs(object):
>  
>          bb.utils.mkdirhier(self.deploy_dir_image)
>  
> -        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst
> -intercepts"),
> -                        intercepts_dir)
> +        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
>  
>         
>  shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.t
> xt"),
>                      self.deploy_dir_image +
> -- 
> 2.5.0
> 

