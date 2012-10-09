Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TLZmj-0001mM-Pi for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 15:23:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q99DAaMd031370;
	Tue, 9 Oct 2012 14:10:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30947-03; Tue,  9 Oct 2012 14:10:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q99DASnd031364
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 9 Oct 2012 14:10:29 +0100
Message-ID: <1349788232.15658.173.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Tue, 09 Oct 2012 14:10:32 +0100
In-Reply-To: <5638b12dc40290cff09fc211d14b472ef7c2c8c0.1349770454.git.kai.kang@windriver.com>
References: <cover.1349770454.git.kai.kang@windriver.com>
	<5638b12dc40290cff09fc211d14b472ef7c2c8c0.1349770454.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl: fix @INC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 13:23:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-09 at 16:32 +0800, Kang Kai wrote:
> perl @INC path includes native perl modules path. When run "perl -V",
> the output at the end is something like:
>   @INC:
>     /etc/perl
>     /usr/lib/perl/site_perl/5.14.2/
>     /usr/lib/perl/site_perl/5.14.2
>     /usr/lib/perl/vendor_perl/5.14.2/
>     /usr/lib/perl/vendor_perl/5.14.2
>     /mnt/sda10/poky-all-platform/build-qemuppc/tmp/sysroots/qemuppc/usr/lib/perl/5.14.2/
>     /usr/lib/perl/5.14.2
>     /usr/local/lib/site_perl
>     /usr/lib/perl/5.14.2
>     .
> 
> And this is caused by commit aeca6512f3a5468b8f65e2986024ab07d2ce45b4.
> Because the native path is compiled into libperl.so that sed in
> perl_package_preprocess() could NOT remove it. So revert the commit.
> 
> [Yocto #3099]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> index 0d4ca1c..dbfabb5 100644
> --- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/config.sh
> @@ -68,7 +68,7 @@ api_version='14'
>  api_versionstring='5.14.0'
>  ar='ar'
>  archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
> -archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
> +archlibexp='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
>  archname64=''
>  archname='@ARCH@-thread-multi'
>  archobjs=''

I dislike fixing one bug at the expense of breaking another.

Tom,

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=aeca6512f3a5468b8f65e2986024ab07d2ce45b4

Any comments on this? How could we test the issue you originally fixed?

Cheers,

Richard



