Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4C4609BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 15:16:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NFGMP1005845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 08:16:23 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 08:16:22 -0700
Message-ID: <54218EC5.6000708@windriver.com>
Date: Tue, 23 Sep 2014 10:16:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1411473883.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1411473883.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/3] man/info: fix not support xz/bz2 compression
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
X-List-Received-Date: Tue, 23 Sep 2014 15:16:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/14, 9:19 AM, Hongxu Jia wrote:
> Test Case:
>
> vim local.conf
> ..
> IMAGE_INSTALL_append = " man man-doc texinfo texinfo-doc info info-doc"
> INHERIT += "compress_doc"
> DOC_COMPRESS = "xz" or DOC_COMPRESS = "bz2"
> ..

Patch 1/3 the busybox change.  I'm not sure we really want to make that change 
as it will increase the size of busybox.

(following is me thinking aloud and hopefully someone will have a suggest on how 
best to unify this..)

I'm wondering if instead of forcing the change for everyone via the busybox 
change, if it makes sense to add a image validation routine or something that 
verifies if the DOC_COMPRESS is set, that the corresponding tool was installed 
into the target environment (along w/ man, info or other appropriate items.. and 
the pkgs-docs was set as well.. if any of those are missing then a warning 
should probably be presented.)

I'm sure there is probably a better way to set this via a distribution 
configuration switch or something as well.. maybe something like?

DISTRO += "man info"

That could then force the man and info systems to add a dependency on bz2 (or xz 
or whatever else was set in DOC_COMPRESS)..  and also add man, info and the 
associated man and info pages to the image itself.

(As I see it, DOC_COMPRESS is really a distribution wide setting, so we should 
treat it as such...)


--Mark

> bitbake core-image-minimal
>
> runqemu qemux86
>
> On target,
> ...
> root@qemux86:~# man man
>
> root@qemux86:~# info info
> ...
>
> //Hongxu
>
> The following changes since commit afdbe3112b940987f3f3cddcb32c91a5e17a297d:
>
>    bitbake: bitbake-worker: Fix bitbake -n (2014-09-22 15:54:40 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib hongxu/fix-doc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-doc
>
> Hongxu Jia (3):
>    busybox: enable CONFIG_BZIP2/CONFIG_XZ/CONFIG_UNXZ by default
>    man: fix not support xz/bz2 compression
>    texinfo: fix info not work
>
>   meta/recipes-core/busybox/busybox/defconfig  | 6 +++---
>   meta/recipes-extended/man/man/man.conf       | 3 ++-
>   meta/recipes-extended/texinfo/texinfo_5.2.bb | 8 +++++++-
>   3 files changed, 12 insertions(+), 5 deletions(-)
>


