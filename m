Return-Path: <martyn.welch@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABDA71C1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:29:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: martyn) with ESMTPSA id 4E21826067B
Message-ID: <1513607380.28676.0.camel@collabora.co.uk>
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 14:29:40 +0000
In-Reply-To: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
Organization: Collabora Ltd
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH v5 1/2] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Mon, 18 Dec 2017 14:29:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This doesn't seem to be applied yet. Is there something else that is
needed?

Martyn

On Mon, 2017-11-27 at 19:28 +0000, Martyn Welch wrote:
> Sometimes we wish to ensure that files or directories are not installed
> somewhere that may prove detrimental to the operation of the system. For
> example, this may be the case if files are placed in a directory that is
> utilised as a mount point at run time, thus making them inaccessible once
> when the mount point is being utilised.
> 
> Implement the prohibited paths QA test, which enables such locations to be
> specified in a "IMAGE_QA_PROHIBITED_PATHS" variable. This implementation
> allows for a colon separated list of paths to be provided. Shell style
> wildcards can be used.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
> Changes since v1:
>  - Correcting author and SOB.
> 
> Changes since v2:
>  - Reimplemented as image rather than package level QA test.
>  - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
>    reflect its use.
> 
> Changes since v3:
>  - Rename variable to IMAGE_QA_PROHIBITED_PATHS.
>  - Use str.startswith().
>  - Simplify if statement.
> 
> Changes since v4:
>  - Move QA test to new class "image-insane.bbclass".
> 
>  meta/classes/image-insane.bbclass | 20 ++++++++++++++++++++
>  meta/classes/image.bbclass        |  1 +
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta/classes/image-insane.bbclass
> 
> diff --git a/meta/classes/image-insane.bbclass b/meta/classes/image-insane.bbclass
> new file mode 100644
> index 0000000..29935cf
> --- /dev/null
> +++ b/meta/classes/image-insane.bbclass
> @@ -0,0 +1,20 @@
> +python image_check_prohibited_paths () {
> +    import glob
> +    from oe.utils import ImageQAFailed
> +
> +    rootfs = d.getVar('IMAGE_ROOTFS')
> +
> +    path = (d.getVar('IMAGE_QA_PROHIBITED_PATHS') or "")
> +    if path != "":
> +        for p in path.split(':'):
> +            if not p.startswith('/'):
> +                raise ImageQAFailed("IMAGE_QA_PROHIBITED_PATHS \"%s\" must be an absolute path" % p, image_check_prohibited_paths)
> +
> +            match = glob.glob("%s%s" % (rootfs, p))
> +            if match:
> +                loc = ", ".join(item.replace(rootfs, '') for item in match)
> +                raise ImageQAFailed("Match(es) for IMAGE_QA_PROHIBITED_PATHS \"%s\": %s" % (p, loc), image_check_prohibited_paths)
> +}
> +
> +IMAGE_QA_COMMANDS += "image_check_prohibited_paths"
> +
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d93de02..8b45abb 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -1,4 +1,5 @@
>  inherit rootfs_${IMAGE_PKGTYPE}
> +inherit image-insane
>  
>  # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
>  # in the non-Linux SDK_OS case, such as mingw32



