Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3192D6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NKbKoF011020; Tue, 23 Sep 2014 21:37:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tl_plegusWWu; Tue, 23 Sep 2014 21:37:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NKbIEd011017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 23 Sep 2014 21:37:19 +0100
Message-ID: <1411504641.4189.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 23 Sep 2014 21:37:21 +0100
In-Reply-To: <e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Tue, 23 Sep 2014 20:37:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-23 at 22:19 +0800, Hongxu Jia wrote:
> In texinfo, we didn't have info/dir entries, which caused
> info not work.
> ...
> root@qemux86:~# info info
> info: dir: No such file or directory
> ...
> Invoke install-info to create info/dir entries in pkg_postinst_info.
> 
> Also fix a QA Issue
> ...
> ERROR: QA Issue: texinfo: Files/directories were installed but not shipped
>   /usr/share/info/info.info.bz2
>   /usr/share/info/info-stnd.info.bz2 [installed-vs-shipped]
> ...
> 
> [YOCTO #6751]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-extended/texinfo/texinfo_5.2.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/texinfo/texinfo_5.2.bb b/meta/recipes-extended/texinfo/texinfo_5.2.bb
> index be90aba..91552a9 100644
> --- a/meta/recipes-extended/texinfo/texinfo_5.2.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_5.2.bb
> @@ -51,7 +51,7 @@ do_install_append_class-native() {
>  PACKAGES += "info info-doc"
>  
>  FILES_info = "${bindir}/info ${bindir}/infokey ${bindir}/install-info"
> -FILES_info-doc = "${infodir}/info.info ${infodir}/dir ${infodir}/info-*.info \
> +FILES_info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
>                    ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
>                    ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
>  
> @@ -61,4 +61,10 @@ FILES_${PN}-doc = "${infodir}/texinfo* \
>                     ${datadir}/${tex_texinfo} \
>                     ${mandir}/man1 ${mandir}/man5"
>  
> +pkg_postinst_info () {
> +    for f in `find $D/${infodir} -name "*.info*"`; do
> +        install-info $f $D/${infodir}/dir
> +    done
> +}
> +
>  BBCLASSEXTEND = "native"


I think there are a few issues here. Firstly, this postinst can run at
build time which means there is a dependency on texinfo-native. I guess
if this fails, it will just run on target so its probably "harmless" but
not deterministic. Secondly, anything installing an info directory
really needs to update the dir files with its own postinst. For optimal
handling at rootfs time, that will need trigger/intercept support.

So this probably can merge as it improves things however we need some
enhacement bugs opening related to this, we may want to force the
postinst to run on target for now so things are deterministic too.

Cheers,

Richard



