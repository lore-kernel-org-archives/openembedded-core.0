Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0816379982
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:37:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8TCbppr026485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 29 Sep 2018 13:37:52 +0100
Message-ID: <b39f86162f18cbaf06d9d2757419255aac9cbec2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 29 Sep 2018 13:37:51 +0100
In-Reply-To: <7cf91a3e20704f362f975a75775fd864bdb2731c.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
	<7cf91a3e20704f362f975a75775fd864bdb2731c.1538199671.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 08/10] os-release: fix install file conflict for multilib
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
X-List-Received-Date: Sat, 29 Sep 2018 12:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-09-29 at 13:43 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It fails to create image when install os-release and lib32-os-release 
> both:
> 
> > file /etc/os-release conflicts between attempted installs of
> > os-release-1.0-r0.core2_64 and lib32-os-release-1.0-r0.x86
> 
> The /etc/os-release is a symlink link to ${libdir}/os-release.
> Actually
> the content of files are identical and make /etc/os-release to be
> hard
> link could fix the issue. But according to os-release (5), symlink
> link
> is necessary for initrd environment such as dracut.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/os-release/os-release.bb
> b/meta/recipes-core/os-release/os-release.bb
> index bf4f815a10..4d5487c06d 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -1,10 +1,12 @@
> -inherit allarch
> -
>  SUMMARY = "Operating system identification"
>  DESCRIPTION = "The /usr/lib/os-release file contains operating
> system identification data."
>  LICENSE = "MIT"
>  INHIBIT_DEFAULT_DEPS = "1"
>  
> +inherit allarch multilib_script
> +
> +MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/os-release"

This is exactly the kind of thing I did not want to see
MUTLILIB_SCRIPTS used for. Its now being proposed everywhere you have
an issue with conflicting files without consideration about what
actually makes sense.

What might make more sense here is only to build os-release for the
main namespace and not any of the multilibs. It could RPROVIDE if
necessary.

Cheers,

Richard


