Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UD4hE-0004WB-Vv
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 04:07:32 +0100
Received: by mail-ie0-f180.google.com with SMTP id bn7so8636619ieb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 18:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=yfKKoCr4XIkpxXdnEMjZfYsEAMKquSLPvlQ3sdPTm5g=;
	b=kRPqksvGRK0cU47DkRKqKIhXZJZREfdugZ9kQnGZPsHGT1hPxTRrGcOLmoC0J1oNQ1
	fi8SgwwyHN0ufk49Xkn8EjYQX26qoCjjA8E0557mdQY7uHlaqEyqZfExxALvi61Dd9qA
	hYlvEFWv2Jj6Ly7XvAAX5+MP3goVeBxhhX+xitRXqMC3u5o35RE28hbODgL5QgHnHXM8
	xySDkX9Lzr5ySV6SqD18AkfFlacp+k1v5Nw5NniBBbGPsOb6JOoogJINdgE0G/tFiERg
	uwf7AtzK9eGYpxzCvJvE7dBOvwTk5DZbgEvJkD/GKedFoi2ABQ5pyeCwwVKwXi9PEYMz
	S8vw==
X-Received: by 10.50.56.141 with SMTP id a13mr9071380igq.24.1362538242279;
	Tue, 05 Mar 2013 18:50:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 5 Mar 2013 18:50:12 -0800 (PST)
In-Reply-To: <1362531151-1094-1-git-send-email-Martin.Jansa@gmail.com>
References: <1362531151-1094-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2013 18:50:12 -0800
Message-ID: <CAMKF1spy6GKyPHOeyTiY9aSJ62dEYBOLTJ5Ca3rE-C5zrsYq-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-module-split: append space to RDEPENDS
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
X-List-Received-Date: Wed, 06 Mar 2013 03:07:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2013 at 4:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * it was generating invalid RDEPENDS when KERNEL_MODULES_META_PACKAGE had
>   RDEPENDS set already without trailing space
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Yes this fixes my regression

Tested-By: Khem Raj <raj.khem@gmail.com>

> ---
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kern=
el-module-split.bbclass
> index aa0c499..45639c6 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -173,7 +173,7 @@ python split_kernel_module_packages () {
>      modules =3D do_split_packages(d, root=3D'/lib/modules', file_regex=
=3Dmodule_regex, output_pattern=3Dmodule_pattern, description=3D'%s kernel =
module', postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfro=
b_metadata, extra_depends=3D'kernel-%s' % (d.getVar("KERNEL_VERSION", True)=
))
>      if modules:
>          metapkg =3D d.getVar('KERNEL_MODULES_META_PACKAGE', True)
> -        d.appendVar('RDEPENDS_' + metapkg, ' '.join(modules))
> +        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>
>      # If modules-load.d and modprobe.d are empty at this point, remove t=
hem to
>      # avoid warnings. removedirs only raises an OSError if an empty
> --
> 1.8.1.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


