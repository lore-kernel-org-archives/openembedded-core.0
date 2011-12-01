Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW2wz-0006jv-HN; Thu, 01 Dec 2011 10:29:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB19MPZp012365;
	Thu, 1 Dec 2011 09:22:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11261-08; Thu,  1 Dec 2011 09:22:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB19MF7J012359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 1 Dec 2011 09:22:17 GMT
Message-ID: <1322731343.17484.86.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 09:22:23 +0000
In-Reply-To: <ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
References: <cover.1322729357.git.lei.mei@intel.com>
	<ec329e79d07e83cb240dda3988017741c597b566.1322729357.git.lei.mei@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 1/1] Fix some recipes upstream version check issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Dec 2011 09:29:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 16:54 +0800, Mei Lei wrote:
> Some recipes didn't declare what protocal they use to check the upstream version, this will due to some errors.
> Fix this by add the protocal at the end of the SRC_URI.

What errors does this give? We should be defaulting to git these days.
lib/bb/fetch2/git.py says:

        if 'protocol' in ud.parm:
            ud.proto = ud.parm['protocol']
        elif not ud.host:
            ud.proto = 'file'
        else:
            ud.proto = "git"

?

Cheers,

Richard

> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
>  .../iproute2/iproute2_3.1.0.bb                     |    2 +-
>  meta/recipes-graphics/clutter/clutter-box2d_git.bb |    2 +-
>  meta/recipes-rt/rt-tests/rt-tests_0.83.bb          |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
> index 0b47046..52e40e1 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.1.0.bb
> @@ -2,7 +2,7 @@ require iproute2.inc
>  
>  #v3.1.0 tag
>  SRCREV = "9cbe6bc337a35b91882f92599eefeb161f3e776e"
> -SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
> +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git;protocol=git \
>             file://configure-cross.patch"
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> index 554ce81..7a1dc8e 100644
> --- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> +++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
> @@ -6,7 +6,7 @@ SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
>  PV = "0.12.1+git${SRCPV}"
>  PR = "r0"
>  
> -SRC_URI = "git://git.gnome.org/clutter-box2d.git"
> +SRC_URI = "git://git.gnome.org/clutter-box2d.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> index 78d51b3..7e64032 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> @@ -12,7 +12,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
>  # git -> 0.83 needs a PE bump
>  PE = "1"
>  
> -SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
> +SRC_URI = "git://github.com/clrkwllms/rt-tests.git;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  




