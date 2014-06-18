Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AFD706FD2E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 15:39:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jun 2014 08:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,501,1400050800"; d="scan'208";a="557458773"
Received: from unknown (HELO [10.255.12.166]) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2014 08:38:40 -0700
Message-ID: <53A1B280.1030303@linux.intel.com>
Date: Wed, 18 Jun 2014 08:38:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Yao Xinpan <yaoxp@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
References: <1403081651-15505-1-git-send-email-yaoxp@cn.fujitsu.com>
In-Reply-To: <1403081651-15505-1-git-send-email-yaoxp@cn.fujitsu.com>
Subject: Re: [PATCH] nfs-utils: fix the --with-statdpath= flag
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
X-List-Received-Date: Wed, 18 Jun 2014 15:39:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/18/2014 01:54 AM, Yao Xinpan wrote:
> if --with-statdpath= is not the default value, will happen the following questions:
> 'Failed to open directory sm: No such file or directory'.
>
> Nfs community has fixed this bug.
> URL: 'http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=3b1457d219ceb1058d44bacc657581f13437ae40#patch1'
>
> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
> ---
>   .../0001-statd-fixed-the-with-statdpath-flag.patch | 40 ++++++++++++++++++++++
>   .../nfs-utils/nfs-utils_1.3.0.bb                   |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
> new file mode 100644
> index 0000000..59a0935
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-statd-fixed-the-with-statdpath-flag.patch
> @@ -0,0 +1,40 @@
> +From 3b1457d219ceb1058d44bacc657581f13437ae40 Mon Sep 17 00:00:00 2001
> +From: Steve Dickson <steved@redhat.com>
> +Date: Tue, 17 Jun 2014 13:28:53 -0400
> +Subject: [PATCH] statd: fixed the --with-statdpath= flag
> +
> +Create the given path set with --with-statdpath
> +

You also need to include a Upstream-Status: Tag in this .patch file, 
please see the Commit and Patch Comment Guildlines:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

> +Signed-off-by: chendt.fnst@cn.fujitsu.com
> +Reported-by: yaoxp@cn.fujitsu.com
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +---
> + Makefile.am | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ae7cd16..5824adc 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -54,13 +54,13 @@ install-data-hook:
> + 	touch $(DESTDIR)$(statedir)/xtab; chmod 644 $(DESTDIR)$(statedir)/xtab
> + 	touch $(DESTDIR)$(statedir)/etab; chmod 644 $(DESTDIR)$(statedir)/etab
> + 	touch $(DESTDIR)$(statedir)/rmtab; chmod 644 $(DESTDIR)$(statedir)/rmtab
> +-	mkdir -p $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak
> +-	touch $(DESTDIR)$(statedir)/state
> +-	chmod go-rwx $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
> +-	-chown $(statduser) $(DESTDIR)$(statedir)/sm $(DESTDIR)$(statedir)/sm.bak $(DESTDIR)$(statedir)/state
> ++	mkdir -p $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak
> ++	touch $(DESTDIR)$(statdpath)/state
> ++	chmod go-rwx $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> ++	-chown $(statduser) $(DESTDIR)$(statdpath)/sm $(DESTDIR)$(statdpath)/sm.bak $(DESTDIR)$(statdpath)/state
> +
> + uninstall-hook:
> + 	rm $(DESTDIR)$(statedir)/xtab
> + 	rm $(DESTDIR)$(statedir)/etab
> + 	rm $(DESTDIR)$(statedir)/rmtab
> +-	rm $(DESTDIR)$(statedir)/state
> ++	rm $(DESTDIR)$(statdpath)/state
> +--
> +1.8.4.2
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> index 8575647..c813d7f 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
> @@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>              file://nfs-mountd.service \
>              file://nfs-statd.service \
>              file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
> +           file://0001-statd-fixed-the-with-statdpath-flag.patch \
>   "
>
>   SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
>

