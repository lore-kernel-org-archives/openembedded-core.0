Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A53660034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 22:14:39 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so24157108iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5gmHeTbFJQcnQ24uU8wW3vV+aMnbAJ+4lbXGwHToZNw=;
	b=ry9BifZzfEo4Izlge1OlwZN9Q9im3q9dWlvSbd7UK3JGM1lltAwcbNAKnH90vqkgx+
	o3Nrj7IahCMO69ZXzGJuR7ucbI51KHwdEyJfD2Ydy0xqOL7BsCAOihZi5ky3Ntcz+OJS
	SxalRwH3QILzhy8/plWu2gqWDMBPqvvcJBFg6LZoXYWO28g8YWqhQOZMhe2/7nw7GbrV
	3kdlT29TnH5f0aKWvfX0p9ZGX2B1cdneMV8ZByrPtzL5a4ArOdK9IqvK6B9tiz5f9p8g
	laNNyu0nLQqqR2F+39z4kbWEWM3La5zJf5UFvcfMmOtFvkwYZ4BHB7+eE909Y8Yaz8B9
	4pGA==
X-Received: by 10.42.76.6 with SMTP id c6mr89027985ick.52.1426630479763; Tue,
	17 Mar 2015 15:14:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 17 Mar 2015 15:14:09 -0700 (PDT)
In-Reply-To: <1426618681.2828.0.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1425935453-15437-1-git-send-email-bruno.bottazzini@intel.com>
	<1426170396.16718.0.camel@bottazzini-ThinkPad-T430>
	<1426618681.2828.0.camel@bottazzini-ThinkPad-T430>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2015 15:14:09 -0700
Message-ID: <CAMKF1sqB_aYJOBJX-nmfLEsfDOEvHfKFWxEXjg7kkoV3DeG=gw@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/4] systemd and dbus split into packages
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
X-List-Received-Date: Tue, 17 Mar 2015 22:14:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 17, 2015 at 11:58 AM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> Could you guys look at this patch ?
>

I would hold off this until after 1.8 and consider this for master and
backport immediately for 1.8.1 release.

> On Qui, 2015-03-12 at 11:26 -0300, Bottazzini, Bruno wrote:
>> Ping
>>
>> On Seg, 2015-03-09 at 18:10 -0300, Bruno Bottazzini wrote:
>> > Differences from v1:
>> >
>> > dbus: Adding change that Andreas Oberritter recommended.
>> > -Setting RRECOMMENDS_${PN}_class-native instead RPROVIDES
>> >  dbus-native-tools-native.
>> >
>> > systemd: Adding change that Anders Darander and Khem Raj recommended
>> > -Modifying PACKAGECONFIG as requested to use it with bbutils.
>> >
>> > systemd: Adding change that Khem Raj requested:
>> > -Porting patches that was used on the release of the 219 stable version
>> >  instead of changing the repository.
>> >
>> >
>> > -------------------------------------------------------------------------------
>> > In this patchset we include the following:
>> >
>> > 1- dbus: split tools package
>> >    Most tools are not required if one is launching a simple daemon.
>> >    So, we split it into two packages dbus and dbus-tools which the user
>> >    will be able to exclude it from the image if he wants to.
>> >
>> > 2- systemd: verify if files test-udev and systemd-journal-flush exists
>> >    If the user put --disable-tests on EXTRA_OECONF for systemd, some files will
>> >    not be created and systemd do_install phase
>> >    will fail.
>> >    This patch will give this flexibility for the user
>> >
>> > 3- systemd: split modules into packages
>> >    Since systemd repo grows with more and more tools, the recipe will provide
>> >    a customizable layer and he will be able to choose what he wants to ship
>> >    to the final image.
>> >    He will be able to save space and exclude unwanted packages from the
>> >    final image.
>> >
>> > 4- systemd: add patches from systemd 219 - stable
>> >    Adding patches that fix bugs for 219 version.
>> >    This will get the same consistency of the stable systemd 219 version.
>> >
>> >
>> > Bruno Bottazzini (3):
>> >   systemd: verify if files test-udev and systemd-journal-flush exists
>> >   systemd: split modules into packages
>> >   systemd: v219 with stable fixes
>> >
>> > Gustavo Sverzut Barbieri (1):
>> >   dbus: split tools package.
>> >
>> > Bruno Bottazzini (3):
>> >   systemd: verify if files test-udev and systemd-journal-flush exists
>> >   systemd: split modules into packages
>> >   systemd: v219 with stable fixes
>> >
>> > Gustavo Sverzut Barbieri (1):
>> >   dbus: split tools package.
>> >
>> >  meta/recipes-core/dbus/dbus.inc                    |    9 +-
>> >  ...remote-fix-certificate-status-memory-leak.patch |   31 +
>> >  ...ournal-remote-fix-client_cert-memory-leak.patch |   35 +
>> >  ...0003-tmpfiles-Fix-parse_acl-error-message.patch |   28 +
>> >  ...-test-utf8-fix-utf16-tests-on-BE-machines.patch |   26 +
>> >  ...iles-avoid-creating-duplicate-acl-entries.patch |  131 +++
>> >  .../0006-shared-time-util-fix-gcc5-warning.patch   |   32 +
>> >  ...time-test-infinity-parsing-in-nanoseconds.patch |   36 +
>> >  .../0008-bootchart-fix-default-init-path.patch     |   44 +
>> >  ...emctl-bump-NOFILE-only-for-systemctl_main.patch |   44 +
>> >  ...0-Make-root-s-home-directory-configurable.patch |   89 +-
>> >  ...-util-avoid-freeing-uninitialized-pointer.patch |   37 +
>> >  ...11-bootchart-svg-fix-checking-of-list-end.patch |   28 +
>> >  ...md-add-getrandom-syscall-numbers-for-MIPS.patch |   38 +
>> >  ...aker-dependencies-between-mount-and-devic.patch |   33 +
>> >  ...topping-due-to-BindsTo-log-which-unit-cau.patch |   43 +
>> >  ...grade-message-about-sysctl-overrides-to-d.patch |   30 +
>> >  ...l-add-some-hints-how-to-override-settings.patch |   39 +
>> >  .../0017-core-rework-device-state-logic.patch      |  912 ++++++++++++++++
>> >  .../0018-core-fix-return-value-on-OOM.patch        |   26 +
>> >  ...e-x-machine-unix-prefix-for-the-container.patch |   33 +
>> >  ...0-shared-AFS-is-also-a-network-filesystem.patch |   25 +
>> >  ...downgrade-unit-type-not-supported-message.patch |   31 +
>> >  ...ournal-remote-fix-saving-of-binary-fields.patch |   97 ++
>> >  ...ix-Inappropriate-ioctl-for-device-on-ext4.patch |   37 +
>> >  ...eplace-VLA-with-alloca-to-make-llvm-happy.patch |   53 +
>> >  ...ietly-ignore-ACLs-on-unsupported-filesyst.patch |   84 ++
>> >  ...-assume-ac-when-sys-class-power_supply-is.patch |   30 +
>> >  meta/recipes-core/systemd/systemd_219.bb           | 1111 +++++++++++++++++---
>> >  29 files changed, 3006 insertions(+), 186 deletions(-)
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-remote-fix-certificate-status-memory-leak.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0002-journal-remote-fix-client_cert-memory-leak.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0003-tmpfiles-Fix-parse_acl-error-message.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0004-test-utf8-fix-utf16-tests-on-BE-machines.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0005-tmpfiles-avoid-creating-duplicate-acl-entries.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0006-shared-time-util-fix-gcc5-warning.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0007-test-time-test-infinity-parsing-in-nanoseconds.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0008-bootchart-fix-default-init-path.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0009-systemctl-bump-NOFILE-only-for-systemctl_main.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0010-acl-util-avoid-freeing-uninitialized-pointer.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0011-bootchart-svg-fix-checking-of-list-end.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-add-getrandom-syscall-numbers-for-MIPS.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0013-unit-use-weaker-dependencies-between-mount-and-devic.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0014-unit-When-stopping-due-to-BindsTo-log-which-unit-cau.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0015-sysctl-downgrade-message-about-sysctl-overrides-to-d.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0016-sysctl-add-some-hints-how-to-override-settings.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0017-core-rework-device-state-logic.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0018-core-fix-return-value-on-OOM.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0019-machined-use-x-machine-unix-prefix-for-the-container.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0020-shared-AFS-is-also-a-network-filesystem.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0021-core-downgrade-unit-type-not-supported-message.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0022-journal-remote-fix-saving-of-binary-fields.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-fix-Inappropriate-ioctl-for-device-on-ext4.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0024-sd-daemon-replace-VLA-with-alloca-to-make-llvm-happy.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0025-tmpfiles-quietly-ignore-ACLs-on-unsupported-filesyst.patch
>> >  create mode 100644 meta/recipes-core/systemd/systemd/0026-shared-util-assume-ac-when-sys-class-power_supply-is.patch
>> >
>> > --
>> > 1.9.1
>> >
>>
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

