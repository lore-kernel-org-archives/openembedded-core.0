Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcMO-0007H3-LR
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:02:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 10:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148039354"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 10:51:52 -0700
Message-ID: <4FBE7537.4060105@linux.intel.com>
Date: Thu, 24 May 2012 10:51:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337589526.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1337589526.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] ncurses: Avoid occasional builling failure when having parallel processable task
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
X-List-Received-Date: Thu, 24 May 2012 18:02:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2012 01:51 AM, xiaofeng.yan@windriver.com wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> | tic: error while loading shared libraries: /srv/home/pokybuild \
> /yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/\
> work/x86_64-linux/ncurses-native-5.9-r8.1/ncurses-5.9/narrowc/lib\
> /libtinfo.so.5: file too short
> | ? tic could not build /srv/home/pokybuild/yocto-autobuilder/\
> yocto-slave/nightly-non-gpl3/build/build/tmp/work/x86_64-linux/\
> ncurses-native-5.9-r8.1/image/srv/home/pokybuild/yocto-autobuilder\
> /yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/x86_64-linux\
> /usr/share/terminfo
> | make[1]: *** [install.data] Error 1
>
> This is a race issue which is caused by
> install.libs and install.data:
>
> 1) install.data needs run tic
> 2) tic needs libtinfo.so
> 3) install.libs would regenerate libtinfo.so
> 4) but install.data doesn't depend on install.libs, and they can run
>     parallelly
>
> So there would be errors in a very critical condition: tic is begining
> to run at the same time when install.libs is generating libtinfo.so, and
> this libtinfo.so is not integrity, then there would be the  above error.
>
> Let task install.libs run before install.data for fixing this bug.
>
> The following changes since commit b4c8c74a45e386f99344cf9799eb5294ad6c9e3e:
>    Joshua Lock (1):
>          hob: update required pygtk to 2.22.0 and gtk+ to 2.20.0
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib xiaofeng/2298
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/2298
>
> Xiaofeng Yan (1):
>    ncurses: Avoid occasional builling failure when having parallel
>      processable task
>
>   meta/recipes-core/ncurses/ncurses.inc |   23 ++++++++++++++++++-----
>   1 files changed, 18 insertions(+), 5 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



