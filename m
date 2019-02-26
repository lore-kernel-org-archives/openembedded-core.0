Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 14DB472EB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 23:12:08 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id j68so3405901vke.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 15:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ECrVCLkugyQyhGKRmdMohVQAoWfzn5xF03S/+1/oq7U=;
	b=tApqM3YUPNnh+BYqyLjzxjcd4is2M4FgX8hkha2nDhiDR4kytEdo4n8b7+mJVqbOwC
	VYtTzzsUXbTg/YUdRQAivIMWLqPYEhS8QMxChn/JOONbTMME8hJpm+C5gWll2gvbIcT8
	XOlP4PKEhbV62BXEzNNyl79nw9hgi0Nxd4SNZe+NanwjthKZXgNuLuxGFc9ngvFNgezU
	3ezGsma35/2T8L/K5U7oX1rHiI8KhENMlwI2IiB3BB6RDoTh9qtGyO+Aq+MV43YhdEz6
	fmi26Q5qWQ1xpg3BZ2YYid5AtiUsDapHLO0yY1JuXovdlWmcvCepU8ThVSYHYCQlx8EA
	++NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ECrVCLkugyQyhGKRmdMohVQAoWfzn5xF03S/+1/oq7U=;
	b=dWlOR+UxFofJqi3xBfS66zIm6zHFR+JpdlVup+AdSUDvehhcus/A8E631LqIfsk8v9
	JhcaKD1wsG/byYyLSCox1RYrZRej63oHjQkmshFOmhz9cjAuiTKMOUZ7StwkBEM9tvUL
	oRZqCRHQ7dVfA9FDLi83EdS0V9fV60XR7eMVlBjL702IUdMrd2q8Mz5wjJ69ETkYd/8i
	J4Q0ZhGagSoV5Cev+KInTdYxZ/2G3PAzpktUNDWGfS/D0mcsunAo+RCI/LIl5Dso/bQZ
	UKGKK1Ilm7qIPNS7dMHUIeHRwk7kzOlXdDowYQTKrXKk/bWkxT/ngfpEmFZS7xfz5Tyc
	jPtQ==
X-Gm-Message-State: AHQUAuZ0zLJbPmC/KNm4EO61nq1z/+/0qM0oV60bFUuOMy5+tUnw0hHI
	qBEESrlJ20YAWMB56D+x5DjzENBSxOF6DRkbd+bJj0EU
X-Google-Smtp-Source: AHgI3IaD8eJb4NvSdU0kSXyifSTVCs3CTGopQb02sbEmD6eBzDlWierWC/CsPRUhdjM50j0+WkT/h08nj73wCkaeLUM=
X-Received: by 2002:a1f:7f10:: with SMTP id o16mr13855490vki.31.1551222729717; 
	Tue, 26 Feb 2019 15:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20190226093949.32671-1-o.mandel@menlosystems.com>
In-Reply-To: <20190226093949.32671-1-o.mandel@menlosystems.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Feb 2019 15:11:58 -0800
Message-ID: <CAJ86T=VRke7oXB6p-7UA=OCewHC=fb0xMG4Pr+f-8qvG3yof8w@mail.gmail.com>
To: Olaf Mandel <o.mandel@menlosystems.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: deploy-target: support "unsafe" symlinks
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
X-List-Received-Date: Tue, 26 Feb 2019 23:12:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 1:40 AM Olaf Mandel <o.mandel@menlosystems.com> wrote:
>
> The bosybox version of tar considers symlink targets that start with /
> or with ../ to be unsafe and refuses to unpack them unless the
> EXTRACT_UNSAFE_SYMLINKS environment variable is set to 1.
>
> As even many core packages legitimately contain such links (e.g.
> coreutils-locale-*, dropbear, eudev, initscripts, kmod, ...), add the
> environment variable to the remote script.

Upstream Busybox seems to have a different solution, so perhaps worth
adding a comment that EXTRACT_UNSAFE_SYMLINKS is a temporary /
version-specific fix.

  https://git.busybox.net/busybox/commit/?h=1_28_stable&id=37277a23fe48b13313f5d96084d890ed21d5fd8b

> ---
>  scripts/lib/devtool/deploy.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index f345f31b7b..9617388f90 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -114,6 +114,7 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
>              lines.append('rm $3')
>          lines.append('mkdir -p `dirname $manifest`')
>          lines.append('mkdir -p $2')
> +        lines.append('export EXTRACT_UNSAFE_SYMLINKS=1')
>          if verbose:
>              lines.append('    tar xv -C $2 -f - | tee $manifest')
>          else:
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

