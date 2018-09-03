Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0027914C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 06:49:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2018 23:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,323,1531810800"; d="scan'208";a="82498466"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.34])
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2018 23:49:06 -0700
User-Agent: Microsoft-MacOutlook/10.10.0.180812
Date: Mon, 03 Sep 2018 09:49:17 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: ChenQi <Qi.Chen@windriver.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <8F3C0D30-7FBD-468C-AE67-D190DB5EDB98@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
References: <cover.1535601148.git.raj.khem@gmail.com>
	<fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
	<c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
	<02ee117d-3465-62e9-00da-8dedf441d0f2@windriver.com>
In-Reply-To: <02ee117d-3465-62e9-00da-8dedf441d0f2@windriver.com>
Mime-version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] sysklogd: Use update-alternatives
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
X-List-Received-Date: Mon, 03 Sep 2018 06:49:07 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hi,

IIRC, the problem was that all the syslog packages were providing ${sysconf=
dir}/init.d/syslog which caused problems. And I don't think that has changed=
.

Why would you want to install two syslog daemons on the system? You should =
be able to install busybox after syslog as busybox-syslog is packaged in sep=
arate binary rpm.

Cheers,
  Markus

=EF=BB=BFOn 30/08/2018, 12.41, "ChenQi" <Qi.Chen@windriver.com> wrote:

    On 08/30/2018 03:44 PM, Peter Kjellerstedt wrote:
    >> -----Original Message-----
    >> From: openembedded-core-bounces@lists.openembedded.org <openembedded=
-
    >> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
    >> Sent: den 30 augusti 2018 05:56
    >> To: openembedded-core@lists.openembedded.org
    >> Subject: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
    >>
    >> busybox also provides klogd and syslogd, this change makes it coexis=
t
    >> peacefully. Currently rootfs fails in situations where both of them =
are
    >> providing these binaries and busybox postinsts fail
    >>
    >> update-alternatives: Error: not linking
    >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
    >> cmdline/1.0-r0/rootfs/sbin/klogd
    >> to /bin/busybox.nosuid since
    >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
    >> cmdline/1.0-r0/rootfs/sbin/klogd
    >> exists and is not a link
    >>
    >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
    >> ---
    >>   meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
    >>   1 file changed, 7 insertions(+), 1 deletion(-)
    >>
    >> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc
    >> b/meta/recipes-extended/sysklogd/sysklogd.inc
    >> index fc4e67c18e..2a8bed00f3 100644
    >> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
    >> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
    >> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842=
c2336e835926c2166c28b \
    >>                       file://klogd.c;beginline=3D2;endline=3D19;md5=3D7e87=
ed0ae6142de079bce738c10c899d \
    >>                      "
    >>
    >> -inherit update-rc.d systemd
    >> +inherit update-rc.d systemd update-alternatives
    >>
    >>   SRC_URI =3D "http://www.infodrom.org/projects/sysklogd/download/sysk=
logd-${PV}.tar.gz \
    >>              file://no-strip-install.patch \
    >> @@ -70,3 +70,9 @@ python () {
    >>       if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, =
False, d):
    >>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
    >>   }
    >> +
    >> +ALTERNATIVE_PRIORITY =3D "100"
    >> +ALTERNATIVE_${PN} =3D "klogd syslogd"
    >> +ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
    >> +ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
    >> +
    >> --
    >> 2.18.0
    > This is a (partial) revert of commit 988aad01b2 (sysklogd: don't use
    > update-alternatives). Can you come to an agreement regarding which is
    > the correct solution?
    >
    > //Peter
    >
   =20
   =20
    I think the previous commit (syslogd: don't use update-alternatives) is=
=20
    made because syslog daemon conflict with each other. I guess the author=
=20
    assumed that the 'syslogd' and 'klogd' alternatives entries are handled=
=20
    by busybox-syslog package.
   =20
    On the other hand, I think the patch is trying to solve the problem of=20
    busybox being installed after sysklogd.
    We are currently not seeing errors because busybox is likely to be=20
    installed before sysklogd. Even in this situation, the result is not al=
l=20
    correct, because the links busybox's postinstall creates are covered by=
=20
    the real binaries from sysklogd.
   =20
    I think the problem is about busybox's handling of alternatives.
   =20
    Khem, I've sent out a patch to fix busybox's alternatives logic. Could=20
    you please help review it?
   =20
    Best Regards,
    Chen Qi
   =20



