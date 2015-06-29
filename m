Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 751867413A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 16:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5TGZoRZ013144; Mon, 29 Jun 2015 17:35:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b3ycxMthKCWm; Mon, 29 Jun 2015 17:35:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5TGZccq013135
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Jun 2015 17:35:50 +0100
Message-ID: <1435595738.7287.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Mon, 29 Jun 2015 17:35:38 +0100
In-Reply-To: <1435556374-25959-1-git-send-email-rongqing.li@windriver.com>
References: <1435556374-25959-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootchart2: add runtime dependency
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
X-List-Received-Date: Mon, 29 Jun 2015 16:35:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-06-29 at 13:39 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> bootchartd needs the command lsb_release and pidof to run, pidof maybe
> provided by sysvinit or procpus
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-devtools/bootchart2/bootchart2_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/bootchart2/bootchart2_git.bb b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> index 5fc7211..586417e 100644
> --- a/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> +++ b/meta/recipes-devtools/bootchart2/bootchart2_git.bb
> @@ -143,6 +143,8 @@ do_install () {
>  PACKAGES =+ "pybootchartgui"
>  FILES_pybootchartgui += "${libdir}/python*/site-packages/pybootchartgui ${bindir}/pybootchartgui"
>  RDEPENDS_pybootchartgui = "python-pycairo python-compression python-image python-textutils python-shell python-compression python-codecs"
> +RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit-pidof', 'procps', d)}"
> +RDEPENDS_${PN} += "lsb"
>  DEPENDS_append_class-native = " python-pycairo-native"
>  

Results in 

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/358/steps/BuildImages/logs/stdio

Cheers,

Richard


