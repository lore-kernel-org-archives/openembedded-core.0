Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rq28A-0008P5-JP for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 13:39:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PCVTET009058
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:31:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08658-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:31:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0PCVIfV009050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 12:31:20 GMT
Message-ID: <1327494679.19643.221.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jan 2012 12:31:19 +0000
In-Reply-To: <f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Wed, 25 Jan 2012 12:39:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-24 at 15:26 -0800, Joshua Lock wrote:
> As binutils is required by perf to build and is GPLv3 licensed adding
> GPLv3 to INCOMPATIBLE_LICENSE will cause linux-yocto to be skipped.
> 
> Long term we should look at moving perf to a separate recipe but as a
> short term solution this patch will ensure that when GPLv3 is in
> INCOMPATIBLE_LICENSE perf is not built and it's dependencies are not
> added to build.
> 
> Fixes [YOCTO #1880]
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/recipes-kernel/linux/linux-tools.inc       |   20 ++++++++++++++++++--
>  meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-kernel/linux/linux-tools.inc
> index aa45dba..69e68c0 100644
> --- a/meta/recipes-kernel/linux/linux-tools.inc
> +++ b/meta/recipes-kernel/linux/linux-tools.inc
> @@ -1,5 +1,18 @@
>  # included by kernel recipes if they want to build/provide
>  # perf functionality from their tree.
> +
> +# perf requires binutils which is GPLv3 licensed, don't prevent the entire kernel
> +# being built if GPLv3 is in INCOMPATIBLE_LICENSE
> +python () {
> +    d.setVar("BUILDPERF", "yes")
> +    d.setVar("PERFDEPENDS", "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot")
> +
> +    if ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
> +       # GPLv3, drop perf
> +       d.setVar("BUILDPERF", "no")
> +       d.setVar("PERFDEPENDS", "")
> +}
> +

Can we make this a little neater, something like:

BUILDPERF = "yes"
BUILDPERF_libc-uclib = "no"
PERFDEPENDS = "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
PERFDEPENDS_libc-uclibc = ""

Then just have the if statement in the anonymous python and drop the
do_compile_perf_libc-uclibc and PERFDEPENDS_libc-uclibc.

This also makes it easy for an external recipe to just disable this
code.

Cheers,

Richard



