Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC85C731CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 18:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1AITKcB025355; Wed, 10 Feb 2016 18:29:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SZLz3_-wjjCw; Wed, 10 Feb 2016 18:29:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1AITHVc025351
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 10 Feb 2016 18:29:18 GMT
Message-ID: <1455128957.16142.182.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 18:29:17 +0000
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
	<d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/9] distutils: Consider S != B case
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
X-List-Received-Date: Wed, 10 Feb 2016 18:29:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-10 at 17:43 +0000, Khem Raj wrote:
> out of tree builds can break the assumption about setup.py being in
> the
> current directory, seen especially with devtool when using
> externalsrc
> many python modules cant build since it cant find setup.py in devtool
> workspace
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/distutils.bbclass  | 27 +++++++++++++++++----------
>  meta/classes/distutils3.bbclass | 26 +++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/meta/classes/distutils.bbclass
> b/meta/classes/distutils.bbclass
> index cd06713..d9e0086 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -8,44 +8,51 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix}
> \
>      --install-data=${D}/${datadir}"
>  
>  distutils_do_compile() {
> -         STAGING_INCDIR=${STAGING_INCDIR} \
> -         STAGING_LIBDIR=${STAGING_LIBDIR} \
> -         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py build ${DISTUTILS_BUILD_ARGS} || \
> -         bbfatal "${PYTHON_PN} setup.py build execution failed."
> +        cwd=$PWD;cd ${S}
> +        STAGING_INCDIR=${STAGING_INCDIR} \
> +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> +        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> ${S}/setup.py build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
> +        bbfatal "${PYTHON_PN} setup.py build execution failed."
> +        cd $cwd
>  }

I still can't help feeling we're putting far too much boiler plate into
these functions and putting in too many redundant checks, "just to be
sure".

If we really want to add the cd and so on, the [dirs] function flag
should be used rather than playing with cwd like this IMO.

Cheers,

Richard


