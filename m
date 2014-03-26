Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 975CA6F87D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:20:01 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id i7so2469941oag.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nXNhNCWe7s/AatFVcYazNe03N3A5KTOi+iLGlcpKUsc=;
	b=M+m9CWdC476aYBf3X7OJd1ZjNTE7YqyQyqtaeLIvrsjNhAkW/hVY/oBcBWIVq7SJE2
	HEHKttzzuKIHLbmyWbshwp+6pjaaonlV+BFnjnHC87cbsT2LFq0x+LMxLuq8vimrIgyI
	38Ltul2DjUXphIc4Uvao8PQTDlTRrqs5e8/JvEchL5pZJwIM0IB2fmYqb35kx6csZsN2
	uMYaphx8OL9+cf7d47tg5U1PZqcReq0Vj3FAe3b7Srl8Ti4Ijj1Kb/Ry03C7TrdQD0QA
	76v/U1Zn2XyhGErFT4d2SEcRavVdRW5fsLwFF4dWiUuFOLVrYtZl2MEPFbK80rjxuSDs
	cutQ==
X-Received: by 10.182.156.19 with SMTP id wa19mr598056obb.80.1395840002561;
	Wed, 26 Mar 2014 06:20:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.116.194 with HTTP; Wed, 26 Mar 2014 06:19:42 -0700 (PDT)
In-Reply-To: <1395834050.24890.87.camel@ted>
References: <1395834050.24890.87.camel@ted>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 26 Mar 2014 14:19:42 +0100
Message-ID: <CAPybu_1O8oCHy4KUm=UPD6qkL2hFs=kjCOQtdNYqGq=F5xz9Lg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: Fix apt-ftparchive index creation problems
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
X-List-Received-Date: Wed, 26 Mar 2014 13:20:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Acked-by: Ricardo Ribalda <Ricardo.Ribalda@gmail.com>

Hello

My fault sorry. I dont have a running system on master. I tried to
port the patch that I tested on dora.

Thanks Richard


On Wed, Mar 26, 2014 at 12:40 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> a) There were missing parameters to the release and package commands (".")
>
> b) The commands need to be executed as one block since they build upon each other
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 692528d..824af00 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -192,17 +192,16 @@ class DpkgIndexer(Indexer):
>              if not os.path.isdir(arch_dir):
>                  continue
>
> -            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s packages > Packages" %
> -                              (arch_dir, apt_ftparchive))
> +            cmd = "cd %s; PSEUDO_UNLOAD=1 %s packages . > Packages;" % (arch_dir, apt_ftparchive)
>
> -            index_cmds.append("cd %s; %s Packages -c > Packages.gz" %
> -                              (arch_dir, gzip))
> +            cmd += "%s -fc Packages > Packages.gz;" % gzip
>
>              with open(os.path.join(arch_dir, "Release"), "w+") as release:
> -                release.write("Label: %s" % arch)
> +                release.write("Label: %s\n" % arch)
>
> -            index_cmds.append("cd %s; PSEUDO_UNLOAD=1 %s release >> Release" %
> -                              (arch_dir, apt_ftparchive))
> +            cmd += "PSEUDO_UNLOAD=1 %s release . >> Release" % apt_ftparchive
> +
> +            index_cmds.append(cmd)
>
>              deb_dirs_found = True
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Ricardo Ribalda

