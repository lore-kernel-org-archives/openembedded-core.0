Received: from mout.gmx.net ([212.227.15.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1Tx8IN-00066L-6g
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 04:43:40 +0100
Received: from mailout-de.gmx.net ([10.1.76.17]) by mrigmx.server.lan
	(mrigmx002) with ESMTP (Nemesis) id 0Lds7x-1TFmlE0827-00j36p for
	<openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:28:11 +0100
Received: (qmail invoked by alias); 21 Jan 2013 03:28:09 -0000
Received: from unknown (EHLO [192.168.1.3]) [78.96.83.205]
	by mail.gmx.net (mp017) with SMTP; 21 Jan 2013 04:28:09 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX19VPiBX/EpVwvdGBQgdavoGId6lVtyIsdklzqcUNO
	plDtOTTPP4krul
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
Date: Mon, 21 Jan 2013 05:30:08 +0200
Message-ID: <1358739008.2945.29.camel@jethro.cheepee.homedns.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
X-Y-GMX-Trusted: 0
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
X-List-Received-Date: Mon, 21 Jan 2013 03:43:47 -0000
Content-Type: multipart/alternative; boundary="=-ZhnMzXlePcCl9Ywd+KhD"

--=-ZhnMzXlePcCl9Ywd+KhD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello.

I am merely a user of the free OpenEmbedded, and I was quite happy to
see that OpenEmbedded was heading towards providing multiple init
managers (be it sysvinit, systemd, openrc, upstart or what not).
However, from this series of patches it seems to me that systemd usage
is added to the openembedded-core meta layer, instead of a separate
meta-systemd layer.

As a result, I have to ask - why would the openembedded-core meta layer
provide a default init manager, instead of separating this choice in
other meta layers, like it was within meta-openembedded?

I find the following organization more orthogonal:

* meta - same as before
* meta-sysvinit - adds sysvinit recipes for meta packages
* meta-systemd - same for systemd-based systems

This would enable users (and yourself) to select whichever they want.
Also it would clean up base recipes from the core meta layer.

However, with oe-core/meta providing a default embedded policy, higher
layers need to remove sysvinit or systemd stuff from base recipes, which
is against bitbake's additive language design (only append/prepend
functions, no -= operator) and against separating concerns.

Cipi

On Sat, 2013-01-19 at 22:47 +0000, Ross Burton wrote:

> Hi,
> 
> This series has the goal of enabling core-image-minimal to boot using systemd.
> As such it touches no real services, just the infrastructural tweaks to make the
> init manager a distribution choice, systemd itself, and a few low-level changes.
> 
> 95% of the credit obviously must go to the contributors of meta-systemd:
> 
>     Andreas Müller <schnitzeltony@googlemail.com>
>     Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>     Holger Hans Peter Freyther <holger@moiji-mobile.com>
>     Khem Raj <raj.khem@gmail.com>
>     Koen Kooi <koen@dominion.thruhere.net>
>     Martin Jansa <Martin.Jansa@gmail.com>
> 
> And thanks to Radu Moisan <radu.moisan@intel.com> for the work pulling together
> a series for merging into oe-core.
> 
> Confirmed that this series using sysvinit results in a zero-delta in
> core-image-minimal.
> 
> Cheers,
> Ross
> 
> The following changes since commit 349e5bea53b02cabf836b8943541a002ce9ba682:
> 
>   guilt: add git 1.8.x support (2013-01-18 13:28:10 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib ross/systemd-minimal
> 
> for you to fetch changes up to 2a93db0fd8302290ac0f2c6c83ea640ad273c3e2:
> 
>   libpam: register PAM session with logind (2013-01-19 22:35:52 +0000)
> 
> ----------------------------------------------------------------
> Koen Kooi (1):
>       libpam: register PAM session with logind
> 
> Martin Donnelly (1):
>       base-files: add fstab for systemd based systems
> 
> Radu Moisan (5):
>       default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>       default-providers: Automatically set PREFERRED_PROVIDER_udev
>       systemd: add systemd recipes
>       default-providers: Add systemd option to PREFERRED_PROVIDER_udev
>       update-rc.d: disable update-rc.d.bbclass when systemd enabled
> 
> Ross Burton (3):
>       dbus: respect systemd distro feature
>       packagegroup-core-boot: install systemd-compat-units on systemd images
>       packagegroup-core-boot: only install initscripts if we're using sysvinit
> 
>  meta/classes/update-rc.d.bbclass                   |   90 +-----
>  meta/classes/update-rc.d_real.bbclass              |   89 ++++++
>  meta/conf/distro/include/default-distrovars.inc    |    3 +-
>  meta/conf/distro/include/default-providers.inc     |    1 +
>  .../base-files/base-files/fstab.systemd            |    9 +
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>  meta/recipes-core/dbus/dbus.inc                    |   27 +-
>  .../packagegroups/packagegroup-core-boot.bb        |    7 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
>  .../systemd/systemd-compat-units/machineid.service |   16 +
>  .../systemd-compat-units/run-postinsts.service     |   17 +
>  meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
>  .../systemd-serialgetty/serial-getty@.service      |   32 ++
>  .../systemd/systemd-systemctl-native.bb            |   15 +
>  .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
>  .../systemd/systemd/00-create-volatile.conf        |   10 +
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
>  meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>  .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>  .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
>  meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>  meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
>  .../pam/libpam/pam.d/common-session                |    4 +-
>  31 files changed, 1726 insertions(+), 108 deletions(-)
>  create mode 100644 meta/classes/update-rc.d_real.bbclass
>  create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>  create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>  create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
>  create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>  create mode 100644 meta/recipes-core/systemd/systemd_196.bb
> 
> Koen Kooi (1):
>   libpam: register PAM session with logind
> 
> Martin Donnelly (1):
>   base-files: add fstab for systemd based systems
> 
> Radu Moisan (5):
>   default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
>   default-providers: Automatically set PREFERRED_PROVIDER_udev
>   systemd: add systemd recipes
>   default-providers: Add systemd option to PREFERRED_PROVIDER_udev
>   update-rc.d: disable update-rc.d.bbclass when systemd enabled
> 
> Ross Burton (3):
>   dbus: respect systemd distro feature
>   packagegroup-core-boot: install systemd-compat-units on systemd
>     images
>   packagegroup-core-boot: only install initscripts if we're using
>     sysvinit
> 
>  meta/classes/update-rc.d.bbclass                   |   90 +-----
>  meta/classes/update-rc.d_real.bbclass              |   89 ++++++
>  meta/conf/distro/include/default-distrovars.inc    |    3 +-
>  meta/conf/distro/include/default-providers.inc     |    1 +
>  .../base-files/base-files/fstab.systemd            |    9 +
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
>  meta/recipes-core/dbus/dbus.inc                    |   27 +-
>  .../packagegroups/packagegroup-core-boot.bb        |    7 +-
>  meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
>  .../systemd/systemd-compat-units/machineid.service |   16 +
>  .../systemd-compat-units/run-postinsts.service     |   17 +
>  meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
>  .../systemd-serialgetty/serial-getty@.service      |   32 ++
>  .../systemd/systemd-systemctl-native.bb            |   15 +
>  .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
>  .../systemd/systemd/00-create-volatile.conf        |   10 +
>  ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
>  ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
>  meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
>  .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
>  .../systemd-pam-configure-check-uclibc.patch       |   26 ++
>  .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
>  .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
>  .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
>  .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
>  .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
>  meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
>  meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
>  .../pam/libpam/pam.d/common-session                |    4 +-
>  31 files changed, 1726 insertions(+), 108 deletions(-)
>  create mode 100644 meta/classes/update-rc.d_real.bbclass
>  create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
>  create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
>  create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>  create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
>  create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
>  create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
>  create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
>  create mode 100644 meta/recipes-core/systemd/systemd_196.bb
> 



--=-ZhnMzXlePcCl9Ywd+KhD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.32.2">
</HEAD>
<BODY>
Hello.<BR>
<BR>
I am merely a user of the free OpenEmbedded, and I was quite happy to see that OpenEmbedded was heading towards providing multiple init managers (be it sysvinit, systemd, openrc, upstart or what not). However, from this series of patches it seems to me that systemd usage is added to the openembedded-core meta layer, instead of a separate meta-systemd layer.<BR>
<BR>
As a result, I have to ask - why would the openembedded-core meta layer provide a default init manager, instead of separating this choice in other meta layers, like it was within meta-openembedded?<BR>
<BR>
I find the following organization more orthogonal:<BR>
<BR>
* meta - same as before<BR>
* meta-sysvinit - adds sysvinit recipes for meta packages<BR>
* meta-systemd - same for systemd-based systems<BR>
<BR>
This would enable users (and yourself) to select whichever they want. Also it would clean up base recipes from the core meta layer.<BR>
<BR>
However, with oe-core/meta providing a default embedded policy, higher layers need to remove sysvinit or systemd stuff from base recipes, which is against bitbake's additive language design (only append/prepend functions, no -= operator) and against separating concerns.<BR>
<BR>
Cipi<BR>
<BR>
On Sat, 2013-01-19 at 22:47 +0000, Ross Burton wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
Hi,

This series has the goal of enabling core-image-minimal to boot using systemd.
As such it touches no real services, just the infrastructural tweaks to make the
init manager a distribution choice, systemd itself, and a few low-level changes.

95% of the credit obviously must go to the contributors of meta-systemd:

    Andreas M&#252;ller &lt;<A HREF="mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</A>&gt;
    Denis 'GNUtoo' Carikli &lt;<A HREF="mailto:GNUtoo@no-log.org">GNUtoo@no-log.org</A>&gt;
    Holger Hans Peter Freyther &lt;<A HREF="mailto:holger@moiji-mobile.com">holger@moiji-mobile.com</A>&gt;
    Khem Raj &lt;<A HREF="mailto:raj.khem@gmail.com">raj.khem@gmail.com</A>&gt;
    Koen Kooi &lt;<A HREF="mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</A>&gt;
    Martin Jansa &lt;<A HREF="mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</A>&gt;

And thanks to Radu Moisan &lt;<A HREF="mailto:radu.moisan@intel.com">radu.moisan@intel.com</A>&gt; for the work pulling together
a series for merging into oe-core.

Confirmed that this series using sysvinit results in a zero-delta in
core-image-minimal.

Cheers,
Ross

The following changes since commit 349e5bea53b02cabf836b8943541a002ce9ba682:

  guilt: add git 1.8.x support (2013-01-18 13:28:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd-minimal

for you to fetch changes up to 2a93db0fd8302290ac0f2c6c83ea640ad273c3e2:

  libpam: register PAM session with logind (2013-01-19 22:35:52 +0000)

----------------------------------------------------------------
Koen Kooi (1):
      libpam: register PAM session with logind

Martin Donnelly (1):
      base-files: add fstab for systemd based systems

Radu Moisan (5):
      default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
      default-providers: Automatically set PREFERRED_PROVIDER_udev
      systemd: add systemd recipes
      default-providers: Add systemd option to PREFERRED_PROVIDER_udev
      update-rc.d: disable update-rc.d.bbclass when systemd enabled

Ross Burton (3):
      dbus: respect systemd distro feature
      packagegroup-core-boot: install systemd-compat-units on systemd images
      packagegroup-core-boot: only install initscripts if we're using sysvinit

 meta/classes/update-rc.d.bbclass                   |   90 +-----
 meta/classes/update-rc.d_real.bbclass              |   89 ++++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 .../base-files/base-files/fstab.systemd            |    9 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 meta/recipes-core/dbus/dbus.inc                    |   27 +-
 .../packagegroups/packagegroup-core-boot.bb        |    7 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 .../systemd/systemd-systemctl-native.bb            |   15 +
 .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
 .../pam/libpam/pam.d/common-session                |    4 +-
 31 files changed, 1726 insertions(+), 108 deletions(-)
 create mode 100644 meta/classes/update-rc.d_real.bbclass
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_196.bb

Koen Kooi (1):
  libpam: register PAM session with logind

Martin Donnelly (1):
  base-files: add fstab for systemd based systems

Radu Moisan (5):
  default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
  default-providers: Automatically set PREFERRED_PROVIDER_udev
  systemd: add systemd recipes
  default-providers: Add systemd option to PREFERRED_PROVIDER_udev
  update-rc.d: disable update-rc.d.bbclass when systemd enabled

Ross Burton (3):
  dbus: respect systemd distro feature
  packagegroup-core-boot: install systemd-compat-units on systemd
    images
  packagegroup-core-boot: only install initscripts if we're using
    sysvinit

 meta/classes/update-rc.d.bbclass                   |   90 +-----
 meta/classes/update-rc.d_real.bbclass              |   89 ++++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 .../base-files/base-files/fstab.systemd            |    9 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 meta/recipes-core/dbus/dbus.inc                    |   27 +-
 .../packagegroups/packagegroup-core-boot.bb        |    7 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 .../systemd/systemd-systemctl-native.bb            |   15 +
 .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
 .../pam/libpam/pam.d/common-session                |    4 +-
 31 files changed, 1726 insertions(+), 108 deletions(-)
 create mode 100644 meta/classes/update-rc.d_real.bbclass
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_196.bb

</PRE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-ZhnMzXlePcCl9Ywd+KhD--
