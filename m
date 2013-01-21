Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tx8l0-0007Dc-OU
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 05:13:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2013 19:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,502,1355126400"; d="scan'208";a="249952925"
Received: from unknown (HELO [10.255.15.40]) ([10.255.15.40])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2013 19:57:43 -0800
Message-ID: <50FCBCB7.8060201@linux.intel.com>
Date: Sun, 20 Jan 2013 19:57:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
In-Reply-To: <50FC3899.5000202@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 04:13:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/20/2013 10:34 AM, Saul Wold wrote:
> On 01/19/2013 02:47 PM, Ross Burton wrote:
>> Hi,
>>
>> This series has the goal of enabling core-image-minimal to boot using
>> systemd.
>> As such it touches no real services, just the infrastructural tweaks
>> to make the
>> init manager a distribution choice, systemd itself, and a few
>> low-level changes.
>>
>> 95% of the credit obviously must go to the contributors of meta-systemd:
>>
>>      Andreas Müller <schnitzeltony@googlemail.com>
>>      Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>>      Holger Hans Peter Freyther <holger@moiji-mobile.com>
>>      Khem Raj <raj.khem@gmail.com>
>>      Koen Kooi <koen@dominion.thruhere.net>
>>      Martin Jansa <Martin.Jansa@gmail.com>
>>
>> And thanks to Radu Moisan <radu.moisan@intel.com> for the work pulling
>> together
>> a series for merging into oe-core.
>>
>> Confirmed that this series using sysvinit results in a zero-delta in
>> core-image-minimal.
>>
>
> This change introduced a new warning about un-packaged files:
>
>> WARNING: QA Issue: connman: Files/directories were installed but not
>> shipped
>>   /lib
>>   /lib/systemd
>>   /lib/systemd/system
>>   /lib/systemd/system/connman.service
>
>
> Sau!
>
>
>> Cheers,
>> Ross
>>
>> The following changes since commit
>> 349e5bea53b02cabf836b8943541a002ce9ba682:
>>
>>    guilt: add git 1.8.x support (2013-01-18 13:28:10 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib ross/systemd-minimal
>>
>> for you to fetch changes up to 2a93db0fd8302290ac0f2c6c83ea640ad273c3e2:
>>
>>    libpam: register PAM session with logind (2013-01-19 22:35:52 +0000)
>>
>> ----------------------------------------------------------------
>> Koen Kooi (1):
>>        libpam: register PAM session with logind
>>
>> Martin Donnelly (1):
>>        base-files: add fstab for systemd based systems
>>
>> Radu Moisan (5):
>>        default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>        default-providers: Automatically set PREFERRED_PROVIDER_udev
>>        systemd: add systemd recipes
>>        default-providers: Add systemd option to PREFERRED_PROVIDER_udev
>>        update-rc.d: disable update-rc.d.bbclass when systemd enabled
>>
>> Ross Burton (3):
>>        dbus: respect systemd distro feature
>>        packagegroup-core-boot: install systemd-compat-units on systemd
>> images
>>        packagegroup-core-boot: only install initscripts if we're using
>> sysvinit
>>
>>   meta/classes/update-rc.d.bbclass                   |   90 +-----
>>   meta/classes/update-rc.d_real.bbclass              |   89 ++++++
>>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>>   meta/conf/distro/include/default-providers.inc     |    1 +
>>   .../base-files/base-files/fstab.systemd            |    9 +
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>>   meta/recipes-core/dbus/dbus.inc                    |   27 +-
>>   .../packagegroups/packagegroup-core-boot.bb        |    7 +-
>>   meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
>>   .../systemd/systemd-compat-units/machineid.service |   16 +
>>   .../systemd-compat-units/run-postinsts.service     |   17 +
>>   meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
>>   .../systemd-serialgetty/serial-getty@.service      |   32 ++
>>   .../systemd/systemd-systemctl-native.bb            |   15 +
>>   .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
>>   .../systemd/systemd/00-create-volatile.conf        |   10 +
>>   ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
>>   ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
>>   meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>>   .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>>   .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>>   .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>>   .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>>   .../systemd/systemd/systemd-pam-fix-msformat.patch |  335
>> ++++++++++++++++++++
>>   .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>>   .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
>>   meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>>   meta/recipes-core/systemd/systemd_196.bb           |  249
>> +++++++++++++++
>>   .../pam/libpam/pam.d/common-session                |    4 +-
>>   31 files changed, 1726 insertions(+), 108 deletions(-)
>>   create mode 100644 meta/classes/update-rc.d_real.bbclass
>>   create mode 100644
>> meta/recipes-core/base-files/base-files/fstab.systemd
>>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-compat-units/machineid.service
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-systemctl-native.bb
>>   create mode 100755
>> meta/recipes-core/systemd/systemd-systemctl/systemctl
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/00-create-volatile.conf
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
>>
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
>>
>>   create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>>
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/use-rootlibdir.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>>   create mode 100644 meta/recipes-core/systemd/systemd_196.bb
>>
Another thing I just noticed is that many of these patches are missing 
either Signed-off-by or Upstream-Status Tags!

Thanks
	Sau!


>> Koen Kooi (1):
>>    libpam: register PAM session with logind
>>
>> Martin Donnelly (1):
>>    base-files: add fstab for systemd based systems
>>
>> Radu Moisan (5):
>>    default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>>    default-providers: Automatically set PREFERRED_PROVIDER_udev
>>    systemd: add systemd recipes
>>    default-providers: Add systemd option to PREFERRED_PROVIDER_udev
>>    update-rc.d: disable update-rc.d.bbclass when systemd enabled
>>
>> Ross Burton (3):
>>    dbus: respect systemd distro feature
>>    packagegroup-core-boot: install systemd-compat-units on systemd
>>      images
>>    packagegroup-core-boot: only install initscripts if we're using
>>      sysvinit
>>
>>   meta/classes/update-rc.d.bbclass                   |   90 +-----
>>   meta/classes/update-rc.d_real.bbclass              |   89 ++++++
>>   meta/conf/distro/include/default-distrovars.inc    |    3 +-
>>   meta/conf/distro/include/default-providers.inc     |    1 +
>>   .../base-files/base-files/fstab.systemd            |    9 +
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>>   meta/recipes-core/dbus/dbus.inc                    |   27 +-
>>   .../packagegroups/packagegroup-core-boot.bb        |    7 +-
>>   meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
>>   .../systemd/systemd-compat-units/machineid.service |   16 +
>>   .../systemd-compat-units/run-postinsts.service     |   17 +
>>   meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
>>   .../systemd-serialgetty/serial-getty@.service      |   32 ++
>>   .../systemd/systemd-systemctl-native.bb            |   15 +
>>   .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
>>   .../systemd/systemd/00-create-volatile.conf        |   10 +
>>   ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
>>   ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
>>   meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>>   .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>>   .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>>   .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>>   .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>>   .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>>   .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>>   .../systemd/systemd/systemd-pam-fix-msformat.patch |  335
>> ++++++++++++++++++++
>>   .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>>   .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
>>   meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>>   meta/recipes-core/systemd/systemd_196.bb           |  249
>> +++++++++++++++
>>   .../pam/libpam/pam.d/common-session                |    4 +-
>>   31 files changed, 1726 insertions(+), 108 deletions(-)
>>   create mode 100644 meta/classes/update-rc.d_real.bbclass
>>   create mode 100644
>> meta/recipes-core/base-files/base-files/fstab.systemd
>>   create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-compat-units/machineid.service
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>>   create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>>   create mode 100644
>> meta/recipes-core/systemd/systemd-systemctl-native.bb
>>   create mode 100755
>> meta/recipes-core/systemd/systemd-systemctl/systemctl
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/00-create-volatile.conf
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
>>
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
>>
>>   create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>>
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>>   create mode 100644
>> meta/recipes-core/systemd/systemd/use-rootlibdir.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>>   create mode 100644 meta/recipes-core/systemd/systemd_196.bb
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


