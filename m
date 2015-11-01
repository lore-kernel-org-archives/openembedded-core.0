Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 335E1608B7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Nov 2015 15:39:32 +0000 (UTC)
Received: by iody8 with SMTP id y8so122091736iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Nov 2015 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5htdBcgm4X2uGkT5pBJaX0cGizBlzTxmJXsxlqZF8Mg=;
	b=l7stD/nozLqM/puQ+rRugW0Fe+osojD5SADTQxq0WmqY9uXQiUW9cb/LQfsWLoVfHQ
	vO3jhiox2kNWaA4p4mR6JZNAMi4TTLczx4G9meeGTJPYLd3dbDGOVIwasxY1txh0RFUS
	lj0mRPeUwbyfNV+2VGnoILqnyh9PQZaO2gjF5FRD0DP7PZgJIeKmEDKElGOwBnF+JCLL
	fXXaIPAlnvs0Os+In5EXpVWM3Q85AnsoHEhXCRi/tv13/BeXNhnpliu52frnsi7AWdn6
	WeYJg8qgBuUbe2UX7ofYEukY+jQJnU78F728sJyJ7k4X4zrR+nsYJT3wm3viDDxowxEJ
	gLBg==
X-Received: by 10.107.4.3 with SMTP id 3mr21410049ioe.195.1446392372606; Sun,
	01 Nov 2015 07:39:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Sun, 1 Nov 2015 07:39:03 -0800 (PST)
In-Reply-To: <20151101085726.GA23281@linux.intel.com>
References: <1446329656-21330-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAMKF1srj2xDX_v4YYQ3q5XzO2UedvLLpxbhxYbExP2ufcEZx1A@mail.gmail.com>
	<20151101085726.GA23281@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Nov 2015 07:39:03 -0800
Message-ID: <CAMKF1soLGChcYXThX18YOrLe+Oj4Nxs_Aoa7cc-d3pa1GWHeMA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: upgrade to 1.10.2
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
X-List-Received-Date: Sun, 01 Nov 2015 15:39:35 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 1, 2015 at 1:57 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Sat, Oct 31, 2015 at 04:45:16PM -0700, Khem Raj wrote:
>> On Oct 31, 2015 3:15 PM, "Ed Bartosh" <ed.bartosh@linux.intel.com> wrote:
>> >
>> > This upgrade should fix qemu build failure on Ubuntu 1.5.10
>>
>> Typo
> Thanks. I'll fix it in v2.
>
>>
>> > caused by system pulseaudio requirement for newer libdbus.
>> >
>> > qemu-native build with old dbus breaks on configure step
>> > with a lot of errors similar to this:
>> > libpulsecommon-6.0.so: undefined reference to
>> > `dbus_watch_get_enabled@LIBDBUS_1_3'
>>
>> It's a Dbus ABI issue. It is better to have pulseaudio-native to solve the
>> underlying issue. Upgrade while fine in itself is really hiding the
>> underlying issue
> Exactly my opinion. The reason of this is caused by the way qemu is
> built in oe. It's linked with host sdl, which is potential cause for
> all kinds of similar issues. You can see more details in the bug #8553.
>
> However, considering that we're about to release 2.0 I'd suggest to
> accept this change as we just don't have time and ideas how to fix it
> properly.

dbus is a core library, While I would like to have 1.10 upgrade, it
will need some serious testing
for which there might not be enough cycles left in this release cycle
and it has potential to destabilize the release
and is against the policies that are set for package upgrades.
On top dbus changes APIs and ABIs between major releases  e.g. 1.8,
1.10 and so on. So I would
suggest to try alternate fix would be much better. Secondly you could
do some analysis between
1.8 and 1.10 how the consumers might be affected. I dont think this
patch should go in without
detailed look and analysis.

>
> Regards,
> Ed
>
>> >
>> > [YOCTO #8553]
>> >
>> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>> > ---
>> >  .../{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb}    |  4 ++--
>> >  meta/recipes-core/dbus/dbus.inc                     |  6 ++++--
>> >  meta/recipes-core/dbus/dbus/python-config.patch     | 21
>> ++++++---------------
>> >  meta/recipes-core/dbus/dbus_1.10.2.bb               |  4 ++++
>> >  meta/recipes-core/dbus/dbus_1.8.20.bb               |  4 ----
>> >  5 files changed, 16 insertions(+), 23 deletions(-)
>> >  rename meta/recipes-core/dbus/{dbus-test_1.8.20.bb => dbus-test_1.10.2.bb}
>> (93%)
>> >  create mode 100644 meta/recipes-core/dbus/dbus_1.10.2.bb
>> >  delete mode 100644 meta/recipes-core/dbus/dbus_1.8.20.bb
>> >
>> > diff --git a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
>> b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
>> > similarity index 93%
>> > rename from meta/recipes-core/dbus/dbus-test_1.8.20.bb
>> > rename to meta/recipes-core/dbus/dbus-test_1.10.2.bb
>> > index 704070b..1e05f54 100644
>> > --- a/meta/recipes-core/dbus/dbus-test_1.8.20.bb
>> > +++ b/meta/recipes-core/dbus/dbus-test_1.10.2.bb
>> > @@ -18,8 +18,8 @@ SRC_URI = "
>> http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>> >             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>> >             "
>> >
>> > -SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
>> > -SRC_URI[sha256sum] =
>> "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
>> > +SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
>> > +SRC_URI[sha256sum] =
>> "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
>> >
>> >  S="${WORKDIR}/dbus-${PV}"
>> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
>> > diff --git a/meta/recipes-core/dbus/dbus.inc
>> b/meta/recipes-core/dbus/dbus.inc
>> > index 3971081..bfb7bee 100644
>> > --- a/meta/recipes-core/dbus/dbus.inc
>> > +++ b/meta/recipes-core/dbus/dbus.inc
>> > @@ -55,9 +55,12 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
>> >                 ${bindir}/dbus-monitor \
>> >                 ${bindir}/dbus-launch \
>> >                 ${bindir}/dbus-run-session \
>> > +               ${bindir}/dbus-test-tool \
>> > +               ${bindir}/dbus-update-activation-environment \
>> >                 ${libexecdir}/dbus* \
>> >                 ${sysconfdir} \
>> >                 ${localstatedir} \
>> > +               ${datadir}/dbus-1 \
>> >                 ${datadir}/dbus-1/services \
>> >                 ${datadir}/dbus-1/system-services \
>> >                 ${systemd_unitdir}/system/"
>> > @@ -83,8 +86,7 @@ EXTRA_OECONF = "--disable-tests \
>> >                  --disable-xml-docs \
>> >                  --disable-doxygen-docs \
>> >                  --disable-libaudit \
>> > -                --disable-systemd \
>> > -                --without-dbus-glib"
>> > +                --disable-systemd"
>> >
>> >  EXTRA_OECONF_append_class-native = " --disable-selinux"
>> >
>> > diff --git a/meta/recipes-core/dbus/dbus/python-config.patch
>> b/meta/recipes-core/dbus/dbus/python-config.patch
>> > index 2944002..c8393e5 100644
>> > --- a/meta/recipes-core/dbus/dbus/python-config.patch
>> > +++ b/meta/recipes-core/dbus/dbus/python-config.patch
>> > @@ -1,24 +1,15 @@
>> > -When building the dbus-ptest package, we have to enable python.  However
>> > -checking if the host-system python has the necessary library isn't
>> useful.
>> > -
>> > -Disable the python module check for cross compiling.
>> > -
>> > -Upstream-Status: Inappropriate [oe specific]
>> > -
>> > -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> > -
>> > ---- dbus-1.6.8/configure.ac.orig       2013-07-11 14:15:58.834554799
>> -0500
>> > -+++ dbus-1.6.8/configure.ac    2013-07-11 14:14:40.969554848 -0500
>> > -@@ -257,13 +257,6 @@
>> > +--- dbus-1.10.2/configure.ac.orig      2015-10-31 21:19:38.046633745
>> +0200
>> > ++++ dbus-1.10.2/configure.ac   2015-10-31 21:38:57.080231733 +0200
>> > +@@ -279,13 +279,6 @@
>> >     # full test coverage is required, Python is a hard dependency
>> > -   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires
>> Python, dbus-python, pygobject])
>> > +   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires
>> Python, dbus-python, pygi])
>> >     AM_PATH_PYTHON([2.6])
>> >  -  AC_MSG_CHECKING([for Python modules for full test coverage])
>> > --  if "$PYTHON" -c "import dbus, gobject, dbus.mainloop.glib"; then
>> > +-  if "$PYTHON" -c "import dbus, gi.repository.GObject,
>> dbus.mainloop.glib"; then
>> >  -    AC_MSG_RESULT([yes])
>> >  -  else
>> >  -    AC_MSG_RESULT([no])
>> > --    AC_MSG_ERROR([cannot import dbus, gobject, dbus.mainloop.glib
>> Python modules])
>> > +-    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject,
>> dbus.mainloop.glib Python modules])
>> >  -  fi
>> >   else
>> >     # --enable-tests not given: do not abort if Python is missing
>> > diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb
>> b/meta/recipes-core/dbus/dbus_1.10.2.bb
>> > new file mode 100644
>> > index 0000000..03a7877
>> > --- /dev/null
>> > +++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
>> > @@ -0,0 +1,4 @@
>> > +include dbus.inc
>> > +
>> > +SRC_URI[md5sum] = "2428919cc77b8d0028d65ee4d5dbef31"
>> > +SRC_URI[sha256sum] =
>> "aef3f49595df09b0824433ee993cda748ede93693a719a831562ae1616b6bb9e"
>> > diff --git a/meta/recipes-core/dbus/dbus_1.8.20.bb
>> b/meta/recipes-core/dbus/dbus_1.8.20.bb
>> > deleted file mode 100644
>> > index a8f2094..0000000
>> > --- a/meta/recipes-core/dbus/dbus_1.8.20.bb
>> > +++ /dev/null
>> > @@ -1,4 +0,0 @@
>> > -include dbus.inc
>> > -
>> > -SRC_URI[md5sum] = "b49890bbabedab3a1c3f4f73c7ff8b2b"
>> > -SRC_URI[sha256sum] =
>> "5c4fbf4c64621c96e871da91d2b729a5b00536e116d3c4612a469d924b1b703a"
>> > --
>> > 2.1.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> --
> Regards,
> Ed

