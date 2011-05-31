Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRUJl-0003HU-9m
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 21:09:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 May 2011 12:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,299,1304319600"; 
   d="scan'208";a="7401455"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2011 12:06:16 -0700
Message-ID: <4DE53C21.7020000@linux.intel.com>
Date: Tue, 31 May 2011 12:06:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
In-Reply-To: <79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org Project" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
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
X-List-Received-Date: Tue, 31 May 2011 19:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 11:45 AM, Koen Kooi wrote:
> Shouldn't patches like this be sent to the oe-core list? It wouldn't have saved me from the selinux bug in shadow, though :)
>
Scott,

I would agree with Koen, this is a oe-core change, not a Poky only 
change, please resend this request to the oe-core list.

Thanks
	Sau!


> Op 31 mei 2011, om 20:13 heeft Scott Garman het volgende geschreven:
>
>> Hi Saul,
>>
>> This pull request includes everything needed to add the ability to
>> create custom users and groups in our images/packages and the
>> corresponding ability to set custom ownership permissions.
>>
>> There is a useradd-example.bb file in meta-skeleton which provides
>> a heavily-commented example recipe to demonstrate how this feature
>> can be used.
>>
>> I'd like to request that Mark Hatle and Richard do a code review of
>> this and offer their Acked-by: support if they are happy with things.
>>
>> Once this gets into master, I'm happy to write up a short section for
>> the Poky Reference Manual to document it in a more visible way.
>>
>> Scott
>>
>> The following changes since commit 1169f1b066d0028bd2ef7915440450bd42ef165e:
>>
>>   license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib sgarman/user-group-creation
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/user-group-creation
>>
>> Scott Garman (7):
>>   shadow: recipe and patch cleanup
>>   shadow: add a -native recipe with customized utilities
>>   base-passwd: add -cross recipe with default login.defs
>>   useradd.bbclass: new class for managing user/group permissions
>>   useradd-example: example recipe for using inherit useradd
>>   bitbake.conf: set PSEUDO_PASSWD within FAKEROOTENV
>>   package_rpm.bbclass: make RPM use on-disk permissions
>>
>> .../recipes-skeleton/useradd/useradd-example.bb    |   59 +
>> meta/classes/package_rpm.bbclass                   |    2 +
>> meta/classes/useradd.bbclass                       |  136 ++
>> meta/conf/bitbake.conf                             |    2 +-
>> .../base-passwd/base-passwd-3.5.22/login.defs      |  386 ++++++
>> .../base-passwd/base-passwd-cross_3.5.22.bb        |   53 +
>> .../shadow/files/add_root_cmd_options.patch        | 1293 ++++++++++++++++++++
>> .../files/shadow-4.1.3-dots-in-usernames.patch     |    4 +
>> .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    4 +
>> .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |    4 +
>> .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |    4 +
>> .../shadow/files/shadow.automake-1.11.patch        |    4 +
>> .../shadow/shadow-native_4.1.4.3.bb                |   66 +
>> meta/recipes-extended/shadow/shadow.inc            |  121 --
>> meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  141 ++-
>> 15 files changed, 2148 insertions(+), 131 deletions(-)
>> create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
>> create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
>> create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
>> create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
>> create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
>> create mode 100644 meta/classes/useradd.bbclass
>> create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>> create mode 100644 meta/recipes-core/base-passwd/base-passwd-cross_3.5.22.bb
>> create mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
>> create mode 100644 meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
>> delete mode 100644 meta/recipes-extended/shadow/shadow.inc
>>
>> _______________________________________________
>> poky mailing list
>> poky@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/poky
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


