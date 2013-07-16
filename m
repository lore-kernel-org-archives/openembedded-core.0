Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35DCD6B208
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 06:30:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6G6UXSC020789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2013 23:30:33 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 15 Jul 2013 23:30:33 -0700
Message-ID: <51E4E890.50105@windriver.com>
Date: Tue, 16 Jul 2013 14:30:40 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373598236.git.Qi.Chen@windriver.com>
	<51E41855.5060906@linux.intel.com>
In-Reply-To: <51E41855.5060906@linux.intel.com>
X-Originating-IP: [128.224.162.233]
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
X-List-Received-Date: Tue, 16 Jul 2013 06:30:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 11:42 PM, Saul Wold wrote:
>
>
> This seems to have caused a failure:

Sorry for all these troubles.

I tested this patchset with IMAGE_INSTALL_append = " useradd-example 
xuser-account'.
So it didn't encounter a situation where white spaces appear in /etc/passwd.

Now patch V5 has been sent out to OE.
It has been tested with IMAGE_INSTALL_append = " useradd-example 
pulseaudio avahi xuser-account openssh ppp-dialin dbus".

Thanks,
Chen Qi


>> ERROR: Function failed: useradd_sysroot (log file is located at 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523)
>> ERROR: Logfile of failure stored in: 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523
>> Log data follows:
>> | DEBUG: SITE files ['endian-big', 'bit-32', 'mips-common', 
>> 'common-linux', 'common-glibc', 'mips-linux', 'common']
>> | DEBUG: Executing shell function useradd_sysroot
>> | Running useradd commands...
>> | NOTE: Performing useradd with [--root 
>> /srv/hdd/builds/world/tmp/sysroots/qemumips --system --home 
>> /var/run/avahi-daemon --no-create-home --shell 
>> /bin/false                               --user-group avahi] and 10 
>> times of retry
>> | WARNING: user avahi already exists, not re-creating it
>> | NOTE: Performing useradd with [--root 
>> /srv/hdd/builds/world/tmp/sysroots/qemumips  --system --home 
>> /var/run/avahi-autoipd --no-create-home --shell /bin/false 
>> --user-group                               -c "Avahi autoip 
>> daemon"                               avahi-autoipd] and 10 times of 
>> retry
>> | 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/run.useradd_sysroot.1523: 
>> 260: local: daemon:/var/run/avahi-autoipd:/bin/false: bad variable name
>> | ERROR: Function failed: useradd_sysroot (log file is located at 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/avahi/0.6.31-r6.1/temp/log.do_install.1523)
>> ERROR: Task 6375 
>> (/srv/hdd/poky/meta/recipes-connectivity/avahi/avahi_0.6.31.bb, 
>> do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 11354 tasks of which 8540 didn't need 
>> to be rerun and 2 failed.
>
>
> Sau!
>
>
> On 07/11/2013 08:10 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Changes from V3:
>> 1. naming changes
>>     rename userbase.bbclass to useradd_base.bbclass
>>     rename usersettings.bbclass to extrausers.bbclass
>>     rename USER_GROUP_SETTINGS to EXTRA_USERS_PARAMS
>> 2. Add an example in the extrauser.bbclass to show how to use this 
>> bbclass
>> 3. Report the incorrect setting in EXTRA_USERS_PARAMS.
>>
>> Note the branch has also changed from ChenQi/user_group_settings to 
>> ChenQi/extrausers.
>>
>> The following changes since commit 
>> a63229917a5708de2d161aba0d67168ce0da6365:
>>
>>    meta-yocto-bsp: update reference board SRCREVs (2013-07-10 
>> 09:45:51 +0100)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/extrausers
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/extrausers
>>
>> Chen Qi (3):
>>    useradd_base.bbclass: add a new bbclass
>>    useradd.bbclass: code refactor
>>    extrausers.bbclass: add a new bbclass
>>
>>   meta/classes/extrausers.bbclass   |   61 ++++++++++
>>   meta/classes/useradd.bbclass      |   99 ++--------------
>>   meta/classes/useradd_base.bbclass |  230 
>> +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 299 insertions(+), 91 deletions(-)
>>   create mode 100644 meta/classes/extrausers.bbclass
>>   create mode 100644 meta/classes/useradd_base.bbclass
>>
>
>


