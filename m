Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17C4F60144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 17:02:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB2H2qGK024893
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Dec 2014 09:02:52 -0800 (PST)
Received: from Marks-MacBook-Pro.local (147.11.116.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Dec 2014 09:02:51 -0800
Message-ID: <547DF0C1.4020608@windriver.com>
Date: Tue, 2 Dec 2014 11:02:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1417535164.git.ross.burton@intel.com>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/4][RFC] Change libexecdir to ${prefix}/libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 17:02:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/14, 9:53 AM, Ross Burton wrote:
> Hi,
>
> First, this is VERY MUCH A RFC!
>
> There's numerous problems with setting ${libexecdir} to ${libdir}/${BPN}, but
> the a easy argument in my opinion is that nobody else does this.
>
> The Debian world sets libexecdir to ${exec_prefix}/lib, and the Red Hat world
> uses ${exec_prefix}/libexec.  The FHS says either are fine.  Nobody puts the
> package name into the definition of libexecdir, as automake provides
> pkglibexecdir ($libexec/$package) for package-specific binaries.

Originally this was choosen because most packages were -not- using 
pkglibexecdir.  This was causing a libexecdir that was containing multiple, 
sometimes conflicting binary names.

So the fix was either patch the recipes to add their BPN, or just add the BPN to 
the libexecdir itself.

Personally I think using "${exec_prefix}/libexec" is incorrect.  This does not 
support a multilib configuration where you may have both a 64-bit and 32-bit 
version of the libexec program on the system.  (perhaps this isn't a real 
problem, but we ran into some conflicts in the past.)

So moving to the libdir, ensures that we are unique per multilib.. and the BPN 
ensures that we're unique per recipe.

> This branch changes bitbake.conf to use ${exec_prefix}/libexec and a few patches
> to fix (or hack around) any problems this has revealed so far.
>
> Comments and testing (especially with other layers, and multilib configurations)
> much appreciated.
>
> Ross
>
> The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:
>
>    package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/libexec
>
> for you to fetch changes up to ed5b853fc4626afabcad8171f478893d5fb438f5:
>
>    bitbake: set libexecdir to prefix/libexec (2014-12-02 15:43:36 +0000)
>
> ----------------------------------------------------------------
> Ross Burton (4):
>        eglibc: WIP fix paths for libexec
>        neard: remove libexec hacks
>        weston: fix plugin location in FILES
>        bitbake: set libexecdir to prefix/libexec
>
>   meta/conf/bitbake.conf                                 |    4 ++--
>   meta/recipes-connectivity/neard/neard.inc              |   10 +++-------
>   meta/recipes-connectivity/neard/neard/neard.in         |    2 +-
>   meta/recipes-connectivity/neard/neard/neard.service.in |    2 +-
>   meta/recipes-core/glibc/glibc-package.inc              |    2 +-
>   meta/recipes-graphics/wayland/weston_1.6.0.bb          |    2 +-
>   6 files changed, 9 insertions(+), 13 deletions(-)
>
> Ross Burton (4):
>    eglibc: WIP fix paths for libexec
>    neard: remove libexec hacks
>    weston: fix plugin location in FILES
>    bitbake: set libexecdir to prefix/libexec
>
>   meta/conf/bitbake.conf                                 |    4 ++--
>   meta/recipes-connectivity/neard/neard.inc              |   10 +++-------
>   meta/recipes-connectivity/neard/neard/neard.in         |    2 +-
>   meta/recipes-connectivity/neard/neard/neard.service.in |    2 +-
>   meta/recipes-core/glibc/glibc-package.inc              |    2 +-
>   meta/recipes-graphics/wayland/weston_1.6.0.bb          |    2 +-
>   6 files changed, 9 insertions(+), 13 deletions(-)
>


