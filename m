Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QodSd-0000LA-0o
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:34:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p73FTsUN020640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 08:29:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 3 Aug 2011 08:29:54 -0700
Message-ID: <4E396971.7040506@windriver.com>
Date: Wed, 3 Aug 2011 10:29:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/7][PULL] Multilib: various fixes
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
X-List-Received-Date: Wed, 03 Aug 2011 15:34:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 10:19 AM, Dongxiao Xu wrote:
> Hi Richard,
> 
> This pull request contains several multilib fixes, especially for rpm side.
> Please help to review and pull.
> 
> Current status for rpm sato is, most of the error dependency issues have been solved except one error while do_rootfs:
> 
> error: Failed dependencies:
>         /bin/sh is needed by dbus-1.4.12-r0.x86_64
>         /bin/sh is needed by psplash-0.0+svnr424-r6.x86_64
>         /bin/sh is needed by portmap-6.0-r7.x86_64
>         /bin/sh is needed by dropbear-0.52-r3.x86_64
>         ...
> 
> I am looking into that currently. Any suggestion would be appreciated.

The issue is due to nothing providing /bin/sh currently.  /bin/sh is provide via
the alternatives mechanism, we need a way to use this mechanism to tell RPM the
required component is available.  (A discussion is already going on within the
oe-core mailing list, topic is "[PATCH 5/5] update-alternatives: Add
alternatives as a runtime provide".

> Thanks,
> Dongxiao
> 
> The following changes since commit 07864a16baf18046b726ec72b688594a91c6e4b4:
> 
>   local.conf.sample: Fix TUNENAME reference (should be DEFAULTTUNE) (2011-08-02 14:40:54 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ml
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml
> 
> Dongxiao Xu (7):
>   eglibc-locale: Specially handle FILES_eglibc-gconv for multilib
>   libxml-simple-perl: Use BBCLASSEXTEND insteand of *-native recipe
>   openjade-native: Change RDEPENDS of sgml-common-native
>   multilib: Use BPN instead of PN for style like lib${PN}
>   multilib: remove MULTILIB_PACKAGE_ARCHS variable
>   package_rpm: fix strip_multilib function
>   package_rpm: Fix package rename issue in multilib case
> 
>  meta/classes/libc-package.bbclass                  |    2 +-
>  meta/classes/package_rpm.bbclass                   |   31 +++++++-------------
>  meta/classes/populate_sdk_rpm.bbclass              |    3 --
>  meta/classes/rootfs_rpm.bbclass                    |    3 --
>  meta/recipes-core/eglibc/eglibc-locale.inc         |    5 ++-
>  .../openjade/openjade-native_1.3.2.bb              |    2 +-
>  .../perl/libxml-simple-perl-native_2.18.bb         |    7 ----
>  .../perl/libxml-simple-perl_2.18.bb                |    2 +
>  meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
>  meta/recipes-extended/augeas/augeas.inc            |   12 ++++----
>  meta/recipes-extended/gamin/gamin_0.1.10.bb        |    8 ++--
>  meta/recipes-support/attr/ea-acl.inc               |    2 +-
>  meta/recipes-support/sqlite/sqlite3.inc            |    6 ++--
>  13 files changed, 35 insertions(+), 52 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



