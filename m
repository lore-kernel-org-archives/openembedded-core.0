Return-Path: <danismostlikely@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61D2179C53
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 17:46:18 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id c21-v6so1930212ljj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2ZQbhz5Knn6PfwfKs1XAlV8mMHIhHLZgafq7zsUQ0DQ=;
	b=czb49SHH505W8k+ySoms85Qlhe7iO3a+7NHnxeK+ldQe2brUGgNb7+fA7P+S8vgkFu
	faKZyC7bG/gZnC1t5+rf4vwXRL6GVdnr5/GrnfQoqflMjtUmGeqh5T20rtznvGVa1GRZ
	IJS3/k1UXdqtRDKDw4XBhoaWZanVQLYDNsaMbeJKnJEdLFhqLGucqj/T5/Xp+RyIN/d6
	bgEE7Wkfjgfrh/jFHFL6GfalHcOZ5zHHwplmkqU9a+9JlGhUgsa3T9pnh5G7pmOFauji
	wcTj86jzGmMYLuSiq861QTjmFsmqJb7JWyGYmRoGm0lLT6P6qU1Iy01fVUb/DyWpr3ci
	Z0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2ZQbhz5Knn6PfwfKs1XAlV8mMHIhHLZgafq7zsUQ0DQ=;
	b=kfrcqrU0YDdhoueoGS2bMuTPjMOtdX8S97w45bxLo6qjNZupIxCVBtSu/djg/Ckb8v
	H/Cg0fXZc6DBV1W1t42QLPnheFlu3LzW8YK9BzFOc9IYwdf4st8ju+RHjxEpQxF/eCIm
	4qlLgdDqjt1aHmIh9ipcKZ/5pn3P079LGNvMvMyCRoWiT184DOjuqpVTF7vcty0v56jI
	Yz+QrzbL9Y2oDQeJr1bnqi2ktk0zw5wsUTrnOKsFbOZ2PDryfe6YoGwMIg4eKWpP5dKB
	YOirF75/9t+y+aTU0jWKsSmeE3g6xVO4zIe7spHMjp5g5ivxjE9zEFjcmAPUrOYgkBRw
	WOAA==
X-Gm-Message-State: AGRZ1gJ8KXw7Xob6YQOPQfAQnUDl7hv7m542yFESP6UB6qPnrdFcYi4b
	Sg/tAYqKgD2Vm9Hyd5plpKGjzJCVMx6i4/HXyw4=
X-Google-Smtp-Source: AJdET5cwa/ccMgR1Mb8yC2jOa7kgfQu/YOCXKpeP1jqz/tIEMSK5WaDO94yWLD/+0DNxKGpPJ0Asye9BO6f9RJZIuI8=
X-Received: by 2002:a2e:8743:: with SMTP id q3-v6mr3253254ljj.80.1540575978819;
	Fri, 26 Oct 2018 10:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
In-Reply-To: <20181019152214.1600-1-o.mandel@menlosystems.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 26 Oct 2018 11:46:07 -0600
Message-ID: <CACS+7ZTTdXs4WuMqBede2KPrsxWu-By1CvZ8t8SvLzRUU-Z6RA@mail.gmail.com>
To: o.mandel@menlosystems.com
Cc: marex@denx.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] npm: change install directory to upstream default
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
X-List-Received-Date: Fri, 26 Oct 2018 17:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Oct 2018 at 09:29, Olaf Mandel <o.mandel@menlosystems.com> wrote=
:
>
> The node binary searches for packages in a number of locations, the last
> of which is $PREFIX/lib/node (here: /usr/lib/node) from the list of
> GLOBAL_FOLDERS [1]. Change the installation directory for all packages
> depending on npm.bbclass to that location. This removes the need to
> define the NODE_PATH variable to the non-standard /usr/lib/node_modules
> value.
>
> While the Tips for Package Managers [2] discusses installing packages to
> /usr/lib/node_modules/<name>/<version>, this has several drawbacks:
>
>  * it does not work for the REPL as mentioned in the documentation
>  * it also does not work for any code _not_ installed as a global
>    package under /usr/lib/node_modules (e.g. /usr/share/foo.js will not
>    find any packages below /usr/lib)
>  * using the non-default location and then having to set NODE_PATH
>    barely saves any time: there are only two file-system lookups (to the
>    legacy $HOME/.node_modules and $HOME/.node_libraries) directories
>    before the library would be found
>
> And the suggestion was made in the context of deduping the node_modules
> tree by installing all packages in a flat hierarchy and using symlinks
> to the correct version of each dependency. This is not what OpenEmbedded
> does, so none of those benefits (deduping, cleaner packages) are being
> had by shifting the installation directory to /usr/lib/node_modules.
>
> [1]: https://nodejs.org/api/modules.html#modules_loading_from_the_global_=
folders
> [2]: https://nodejs.org/api/modules.html#modules_addenda_package_manager_=
tips
>
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> ---
>  meta/classes/npm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index c351ff0866..d5ff0c6d57 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -10,7 +10,7 @@ def node_pkgname(d):
>
>  NPMPN ?=3D "${@node_pkgname(d)}"
>
> -NPM_INSTALLDIR =3D "${D}${libdir}/node_modules/${NPMPN}"
> +NPM_INSTALLDIR =3D "${D}${libdir}/node/${NPMPN}"

=C3=8F realise this has already gone =C3=AEn, but should this be
${nonarch_libdir}, or does it use /usr/lib64 or /usr/libx32 correctly?

>
>  # function maps arch names to npm arch names
>  def npm_oe_arch_map(target_arch, d):
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

