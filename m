Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFC660116
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 17:34:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w85HY20p016091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 5 Sep 2018 18:34:03 +0100
Message-ID: <29c9d4100bb58139048de99ecd6341b440873889.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Wed, 05 Sep 2018 18:34:02 +0100
In-Reply-To: <1536150963-173280-3-git-send-email-hongxu.jia@windriver.com>
References: <1536150963-173280-1-git-send-email-hongxu.jia@windriver.com>
	<1536150963-173280-3-git-send-email-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/3] prelink: do not use 'exit 0' to incorrectly postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 17:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-05 at 08:36 -0400, Hongxu Jia wrote:
> After postinst was executed at do_rootfs successfully,
> there will be no first boot to redo.
> 
> Since `229f4e9 package.bbclass: add support for
> pkg_postinst_ontarget()' applied in oe-core, use
> pkg_postinst_ontarget to instead.
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/prelink/prelink_git.bb | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb
> b/meta/recipes-devtools/prelink/prelink_git.bb
> index c5eaedd..c110bd2 100644
> --- a/meta/recipes-devtools/prelink/prelink_git.bb
> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> @@ -158,13 +158,7 @@ do_install_append () {
>  # Prelinking during a cross install should be handled by the image-
> prelink
>  # bbclass.  If the user desires this to run on the target at first
> boot
>  # they will need to create a custom boot script.
> -pkg_postinst_prelink() {
> -#!/bin/sh
> -
> -if [ "x$D" != "x" ]; then
> -  exit 0
> -fi
> -
> +pkg_postinst_ontarget_prelink() {
>  prelink -a
>  }

I'm not sure this is correct. The idea here is that no postinst runs,
on target or at rootfs time (since we prelink the rootfs elsewhere at
rootfs time). The only time a postinst runs is if the package is
actually installed onto a target system later on a running system.

I think you change the behaviour here so that it would run on the
target system at first boot?

Cheers,

Richard

