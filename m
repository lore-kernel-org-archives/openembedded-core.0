Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 69C96608BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:42:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2013 08:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="370499822"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 08:42:13 -0700
Message-ID: <51E41855.5060906@linux.intel.com>
Date: Mon, 15 Jul 2013 08:42:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1373598236.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1373598236.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 0/3] Add a method for image level user/group configuration
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
X-List-Received-Date: Mon, 15 Jul 2013 15:42:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



This seems to have caused a failure:
> ERROR: Function failed: useradd_sysroot (log file is located at /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523)
> ERROR: Logfile of failure stored in: /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523
> Log data follows:
> | DEBUG: SITE files ['endian-big', 'bit-32', 'mips-common', 'common-linux', 'common-glibc', 'mips-linux', 'common']
> | DEBUG: Executing shell function useradd_sysroot
> | Running useradd commands...
> | NOTE: Performing useradd with [--root /srv/hdd/builds/world/tmp/sysroots/qemumips --system --home /var/run/avahi-daemon                               --no-create-home --shell /bin/false                               --user-group avahi] and 10 times of retry
> | WARNING: user avahi already exists, not re-creating it
> | NOTE: Performing useradd with [--root /srv/hdd/builds/world/tmp/sysroots/qemumips  --system --home /var/run/avahi-autoipd                               --no-create-home --shell /bin/false                               --user-group                               -c "Avahi autoip daemon"                               avahi-autoipd] and 10 times of retry
> | /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/run.useradd_sysroot.1523: 260: local: daemon:/var/run/avahi-autoipd:/bin/false: bad variable name
> | ERROR: Function failed: useradd_sysroot (log file is located at /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523)
> ERROR: Task 6375 (/srv/hdd/poky/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 11354 tasks of which 8540 didn't need to be rerun and 2 failed.


Sau!


On 07/11/2013 08:10 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Changes from V3:
> 1. naming changes
>     rename userbase.bbclass to useradd_base.bbclass
>     rename usersettings.bbclass to extrausers.bbclass
>     rename USER_GROUP_SETTINGS to EXTRA_USERS_PARAMS
> 2. Add an example in the extrauser.bbclass to show how to use this bbclass
> 3. Report the incorrect setting in EXTRA_USERS_PARAMS.
>
> Note the branch has also changed from ChenQi/user_group_settings to ChenQi/extrausers.
>
> The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:
>
>    meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/extrausers
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/extrausers
>
> Chen Qi (3):
>    useradd_base.bbclass: add a new bbclass
>    useradd.bbclass: code refactor
>    extrausers.bbclass: add a new bbclass
>
>   meta/classes/extrausers.bbclass   |   61 ++++++++++
>   meta/classes/useradd.bbclass      |   99 ++--------------
>   meta/classes/useradd_base.bbclass |  230 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 299 insertions(+), 91 deletions(-)
>   create mode 100644 meta/classes/extrausers.bbclass
>   create mode 100644 meta/classes/useradd_base.bbclass
>

