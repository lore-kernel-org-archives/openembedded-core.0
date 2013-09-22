Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 31D026C8B5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 09:16:11 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8M9UmXg003141; Sun, 22 Sep 2013 10:30:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3mIqURwhHwe3; Sun, 22 Sep 2013 10:30:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8M9UhSQ003138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 22 Sep 2013 10:30:44 +0100
Message-ID: <1379841356.18603.206.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Sep 2013 10:15:56 +0100
In-Reply-To: <1367735093-10221-1-git-send-email-raj.khem@gmail.com>
References: <1367735093-10221-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-configure-target: Add --enable-dependency-tracking to EXTRA_OECONF
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
X-List-Received-Date: Sun, 22 Sep 2013 09:16:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

On Sat, 2013-05-04 at 23:24 -0700, Khem Raj wrote:
> Fixes errors seen while compiling gcc 4.8 for target, errors like
> 
> | /home/khem/work/angstrom/build/tmp-angstrom_next-eglibc/work-shared/gcc-4.8.0-r0/gcc-4.8.0/libatomic/cas_n.c:125:1: fatal error: opening dependency file .deps/cas_1_.lo.Ppo: No such file or directory
> 
> which are due to disabled dependency tracking but dependency files being still generated
> while compiling libatomics.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-target.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> index 6cc374b..5f608d6 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> @@ -5,4 +5,4 @@ EXTRA_OECONF_PATHS = " \
>      --with-sysroot=/ \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
>      --with-native-system-header-dir=${STAGING_DIR_TARGET}${target_includedir} \
> -    --with-gxx-include-dir=${includedir}/c++/"
> +    --with-gxx-include-dir=${includedir}/c++/ --enable-dependency-tracking"

We keep occasionally seeing:

http://autobuilder.yoctoproject.org:8011/builders/nightly-mips-lsb/builds/310/steps/Building%20Images/logs/stdio

which is a failure in target gcc due to the use of the dependency
tracking. I think the dependency tracking code does have some kind of
races in it :(.

Do why know why we can't turn off the dependency tracking in libatomic?
Are there any upstream bug fixes for this?

Cheers,

Richard 




