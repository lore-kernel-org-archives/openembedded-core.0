Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 922D077895
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 11:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BBN1K1014401; Sat, 11 Mar 2017 11:23:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rti3kubG_XJW; Sat, 11 Mar 2017 11:23:01 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BBMvxm014398
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Mar 2017 11:22:58 GMT
Message-ID: <1489231377.13980.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 11:22:57 +0000
In-Reply-To: <3f1ae965face4644d3d1998d8fd3c21e6ef20711.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<3f1ae965face4644d3d1998d8fd3c21e6ef20711.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 43/44] base-files: do not write the current date into /etc/issue and /etc/issue.net
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
X-List-Received-Date: Sat, 11 Mar 2017 11:25:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-03-10 at 13:24 +0200, Alexander Kanavin wrote:
> This is causing a problem in multilib where base-files and lib64/32-
> base-files
> clash because they may have different dates. Also, if the package is
> coming
> from sstate it has an incorrect date anyway.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index d1380053115..c7a9e803cb1 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -145,8 +145,9 @@ do_install_basefilesissue () {
>  		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
>  		printf "${DISTRO_NAME} " >>
> ${D}${sysconfdir}/issue.net
>  		if [ -n "${DISTRO_VERSION}" ]; then
> -			printf "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue
> -			printf "${DISTRO_VERSION} " >>
> ${D}${sysconfdir}/issue.net
> +			distro_version_nodate=${@'${DISTRO_VERSION}'
> .replace('snapshot-${DATE}','snapshot').replace('${DATE}','')}
> +			printf "%s " $distro_version_nodate >>
> ${D}${sysconfdir}/issue
> +			printf "%s " $distro_version_nodate >>
> ${D}${sysconfdir}/issue.net
>  		fi
>  		printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
>  		echo >> ${D}${sysconfdir}/issue


https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/213/steps/Running%20oe-selftest/logs/stdio

You probably need a vardepsexclude on DATE here...

Cheers,

Richard


