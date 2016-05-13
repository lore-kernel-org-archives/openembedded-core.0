Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21D4D73174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DHDxi2022722; Fri, 13 May 2016 18:13:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7ISoCTqH_m6M; Fri, 13 May 2016 18:13:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4DHDr0l022717
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 May 2016 18:13:54 +0100
Message-ID: <1463159633.9746.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 18:13:53 +0100
In-Reply-To: <9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Fri, 13 May 2016 17:14:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-02 at 15:22 +0300, Ed Bartosh wrote:
> Generated standalone bmaptool script that is more convenient
> to use than native script. It can be run straight from
> its location ./tmp/deploy/tools/bmaptool. The script doesn't
> depend on anything except Python.
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 20
> +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> index e10f5fd..0f95788 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
> @@ -15,10 +15,28 @@ SRC_URI[sha256sum] =
> "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02b
>  
>  RDEPENDS_${PN} = "python-core python-compression"
>  
> -inherit setuptools
> +inherit setuptools deploy
>  
>  BBCLASSEXTEND = "native"
>  
>  do_install_append_class-native() {
>      sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env
> nativepython|' ${D}${bindir}/bmaptool
>  }
> +
> +do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
> +do_deploy[stamp-extra-info] = ""
> +do_deploy_class-native() {
> +    cp bmaptool __main__.py
> +    python -m zipfile -c bmaptool.zip bmaptools __main__.py
> +    echo '#!/usr/bin/env python' | cat - bmaptool.zip > bmaptool
> -standalone
> +    install -d ${DEPLOYDIR}
> +    install -m 0755 bmaptool-standalone ${DEPLOYDIR}/bmaptool-${PV}
> +    rm -f ${DEPLOYDIR}/bmaptool
> +    ln -sf ./bmaptool-${PV} ${DEPLOYDIR}/bmaptool
> +}
> +
> +do_deploy() {
> +    :
> +}
> +
> +addtask deploy before do_package after do_install

I'm not sure if we want to do this in the first place. Regardless, the
addtask here is incorrect too.

Cheers,

Richard


