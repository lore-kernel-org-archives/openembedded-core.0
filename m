Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuUaJ-0003WV-G0
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:22:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2012 13:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="187044511"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 13:11:08 -0700
Message-ID: <5011A45C.9070207@linux.intel.com>
Date: Thu, 26 Jul 2012 13:11:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343302282-24439-1-git-send-email-Song.Li@windriver.com>
In-Reply-To: <1343302282-24439-1-git-send-email-Song.Li@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH] change install-data-hook to install-exec-hook in guile
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
X-List-Received-Date: Thu, 26 Jul 2012 20:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Please modify the patch summary so include the recipe or functional 
change first:

guile: change install-data-hook ...

Thanks
	Sau!

On 07/26/2012 04:31 AM, Song.Li@windriver.com wrote:
> From: "Song.Li" <Song.Li@windriver.com>
>
> In guile meta/Makefile, what install-data-hook do
> must be run after install-binSCRIPTS.so it's a exec hook, not a data hook.
> If keep these exec-hook in data-hook,when we run make with multi-jobbing ,
> install-data-hook and install-binSCRIPTS will be separately
> processed in different thread, no any dependence.
> that will cause error sometimes.
>
> [YOCTO #2796]
>
> Signed-off-by: Song.Li <Song.Li@windriver.com>
> ---
>   ...all-data-hook-to-install-exec-hook-in-gui.patch |   39 ++++++++++++++++++++
>   meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
>   2 files changed, 41 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
>
> diff --git a/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
> new file mode 100644
> index 0000000..10b7cee
> --- /dev/null
> +++ b/meta/recipes-devtools/guile/files/change-install-data-hook-to-install-exec-hook-in-gui.patch
> @@ -0,0 +1,39 @@
> +From 687e5a6598f89b97c89afb94d6ac3ec024dc08e2 Mon Sep 17 00:00:00 2001
> +From: "Song.Li" <Song.Li@windriver.com>
> +Date: Thu, 26 Jul 2012 14:19:46 +0800
> +Subject: [PATCH] change install-data-hook to install-exec-hook in guile
> +
> +In guile meta/Makefile, what install-data-hook do
> +must be run after install-binSCRIPTS.so it's a exec hook, not a data hook.
> +If keep these exec-hook in data-hook,when we run make with multi-jobbing ,
> +install-data-hook and install-binSCRIPTS will be separately
> +processed in different thread, no any dependence.
> +that will cause error sometimes.
> +
> +[YOCTO #2796]
> +
> +Upstream Status:Submitted
> +Upstream Bugid :12015 email:12015@debbugs.gnu.org
> +guile bug maillist: bug-guile@gnu.org
> +
> +Signed-off-by: Song.Li <Song.Li@windriver.com>
> +---
> + meta/Makefile.am |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meta/Makefile.am b/meta/Makefile.am
> +index f26fc44..e603e5c 100644
> +--- a/meta/Makefile.am
> ++++ b/meta/Makefile.am
> +@@ -27,7 +27,7 @@ EXTRA_DIST= \
> +   guild.in guile-config.in
> +
> + # What we now call `guild' used to be known as `guile-tools'.
> +-install-data-hook:
> ++install-exec-hook:
> + 	cd $(DESTDIR)$(bindir) && rm -f guile-tools$(EXEEXT) && \
> + 	$(LN_S) guild$(EXEEXT) guile-tools$(EXEEXT)
> +
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
> index 6c96f87..e8657d4 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.5.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
>              file://guile_2.0.5_fix_cross_compilation.patch \
>              file://remove-gets.patch \
>              file://arm_endianness.patch \
> +           file://change-install-data-hook-to-install-exec-hook-in-gui.patch \
>              "
>
>   #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
> @@ -30,7 +31,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
>   SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
>   SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
>
> -PR = "r3"
> +PR = "r4"
>
>   inherit autotools gettext
>   BBCLASSEXTEND = "native"
>



