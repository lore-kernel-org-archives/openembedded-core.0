Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5CAD677BE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BG1dmO002226; 
	Tue, 11 Apr 2017 17:01:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EnU6HuORw8a7; Tue, 11 Apr 2017 17:01:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BFi5kv032187
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 16:44:06 +0100
Message-ID: <1491925445.12091.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:44:05 +0100
In-Reply-To: <1491897828-50233-1-git-send-email-li.zhou@windriver.com>
References: <1491897828-50233-1-git-send-email-li.zhou@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] python2/3: Remove building host path from packages
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
X-List-Received-Date: Tue, 11 Apr 2017 16:01:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-11 at 16:03 +0800, Li Zhou wrote:
> 
> Remove building host related path from python2 and python3 packages.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.2.bb | 8 +++++++-
>  meta/recipes-devtools/python/python_2.7.13.bb | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
> index 2ff7c9e..ca8dfe3 100644
> --- a/meta/recipes-devtools/python/python3_3.5.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.2.bb
> @@ -185,9 +185,15 @@ py_package_preprocess () {
>  	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
>  	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
>  	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
> +		-e 's:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig:${datadir}/pkgconfig:g' \
> +		-e 's:${STAGING_DIR_NATIVE}::g' \
> +		-e 's:${STAGING_DIR_HOST}::g' \
> +		-e 's:${WORKDIR}::g' \
> +		-e 's:${TMPDIR}::g' \
>  		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
>  		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
> -		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
> +		${PKGD}/${bindir}/python${PYTHON_MAJMIN}${PYTHON_ABI}-config
>   }

This breaks our builds since it regresses 
$ oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
which is due to the use of MACHINE above. It also raises the question
about why we're fixing paths which do not exist in master?

This is the second patch in 24 hours from Wind River which is not
appropriate for master, not tested against it and actively breaks
things.

In case its not clear, the
path s:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig does not exist in
master after the RSS. You're therefore trying to get us to add complex
pointless broken code.

Yes, I'm not happy at all in case that isn't clear either as this is a
total waste of my time.

Richard

