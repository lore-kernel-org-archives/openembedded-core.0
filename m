Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 383CE713BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83Age3v007828; Wed, 3 Sep 2014 11:42:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5qVaPTDqcqBY; Wed,  3 Sep 2014 11:42:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s83Agcqw007825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 3 Sep 2014 11:42:39 +0100
Message-ID: <1409740959.12482.4.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 03 Sep 2014 11:42:39 +0100
In-Reply-To: <ff575b1b7622194f6e15d1b38c191df729a80f47.1409735063.git.Chong.Lu@windriver.com>
References: <cover.1409735063.git.Chong.Lu@windriver.com>
	<ff575b1b7622194f6e15d1b38c191df729a80f47.1409735063.git.Chong.Lu@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] perf: fix issue about package splitting
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
X-List-Received-Date: Wed, 03 Sep 2014 10:42:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-03 at 17:05 +0800, Chong Lu wrote:
> Currently, perf can't split to perf-archive, perf-tests, perf-python and
> perf-perl. All files are included in perf package. Change the files paths to
> make split successfully and add PACKAGECONFIG to make main pkg depends on sub
> pkgs as default.
> 
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index bfd210c..baf0077 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -149,20 +149,27 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  PACKAGES =+ "${PN}-archive ${PN}-tests ${PN}-perl ${PN}-python"
>  
> +PACKAGECONFIG ??= "archive perl python tests"
> +PACKAGECONFIG[archive] = ",,, ${PN}-archive"
> +PACKAGECONFIG[perl] = ",,, ${PN}-perl"
> +PACKAGECONFIG[python] = ",,, ${PN}-python"
> +PACKAGECONFIG[tests] = ",,, ${PN}-tests"
> +
>  RDEPENDS_${PN} += "elfutils"
>  RDEPENDS_${PN}-archive =+ "bash"
>  RDEPENDS_${PN}-python =+ "bash python"
>  RDEPENDS_${PN}-perl =+ "bash perl perl-modules"
> +RDEPENDS_${PN}-tests =+ "python"

I now realise the trick you're playing with PACKAGECONFIG here. Instead
can we just define a package (say ${PN}-all but I'll accept a better
name) which has dependencies on archive perl python tests so then the
user can choose ${PN}, ${PN}-all or some other combination depending on
their needs?
 
>  RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${PN}-python', '',d)}"
>  RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
>  
> -FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
> +FILES_${PN} += "${libdir}/traceevent"
>  FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
> -FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
> -FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
> -FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
> -FILES_${PN}-perl = "${libdir}/perf/perf-core/scripts/perl"
> +FILES_${PN}-archive = "${exec_prefix}/libexec/perf-core/perf-archive"
> +FILES_${PN}-tests = "${exec_prefix}/libexec/perf-core/tests"
> +FILES_${PN}-python = "${exec_prefix}/libexec/perf-core/scripts/python"
> +FILES_${PN}-perl = "${exec_prefix}/libexec/perf-core/scripts/perl"

Can we use ${libexecdir} here please rather than hardcode it?

Cheers,

Richard



