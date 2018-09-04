Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E444D7459B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 06:15:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2018 23:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,328,1531810800"; d="scan'208";a="85799596"
Received: from dgiandus-mobl1.amr.corp.intel.com (HELO [10.237.66.35])
	([10.237.66.35])
	by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2018 23:15:56 -0700
User-Agent: Microsoft-MacOutlook/10.10.0.180812
Date: Tue, 04 Sep 2018 09:15:57 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <03A27417-8FA9-40A5-94AB-2E4D51A424E8@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
References: <cover.1535601148.git.raj.khem@gmail.com>
	<fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
	<c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
	<02ee117d-3465-62e9-00da-8dedf441d0f2@windriver.com>
	<8F3C0D30-7FBD-468C-AE67-D190DB5EDB98@linux.intel.com>
	<CAMKF1sq5M90z1X8nLgHFj1jppoTcoH-2tqj=h7He7BXEmjaH0Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq5M90z1X8nLgHFj1jppoTcoH-2tqj=h7He7BXEmjaH0Q@mail.gmail.com>
Mime-version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 04 Sep 2018 06:15:57 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hmm,

There should be rconflicts in place, in both way =E2=80=93 i.e. busybox-syslog rc=
onflicts with sysklogd and the other way around. Isn't there(?)
  - Markus

=EF=BB=BFOn 03/09/2018, 19.34, "Khem Raj" <raj.khem@gmail.com> wrote:

    On Sun, Sep 2, 2018 at 11:49 PM Markus Lehtonen
    <markus.lehtonen@linux.intel.com> wrote:
    >
    > Hi,
    >
    > IIRC, the problem was that all the syslog packages were providing ${s=
ysconfdir}/init.d/syslog which caused problems. And I don't think that has c=
hanged.
    >
    > Why would you want to install two syslog daemons on the system? You s=
hould be able to install busybox after syslog as busybox-syslog is packaged =
in separate binary rpm.
    >
   =20
    thats fine, we need to have a RCONFLICTS statement to catch these
    issues explicitly during packaging.
   =20
    > Cheers,
    >   Markus
    >
    > =EF=BB=BFOn 30/08/2018, 12.41, "ChenQi" <Qi.Chen@windriver.com> wrote:
    >
    >     On 08/30/2018 03:44 PM, Peter Kjellerstedt wrote:
    >     >> -----Original Message-----
    >     >> From: openembedded-core-bounces@lists.openembedded.org <openem=
bedded-
    >     >> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
    >     >> Sent: den 30 augusti 2018 05:56
    >     >> To: openembedded-core@lists.openembedded.org
    >     >> Subject: [OE-core] [PATCH 3/7] sysklogd: Use update-alternativ=
es
    >     >>
    >     >> busybox also provides klogd and syslogd, this change makes it =
coexist
    >     >> peacefully. Currently rootfs fails in situations where both of=
 them are
    >     >> providing these binaries and busybox postinsts fail
    >     >>
    >     >> update-alternatives: Error: not linking
    >     >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full=
-
    >     >> cmdline/1.0-r0/rootfs/sbin/klogd
    >     >> to /bin/busybox.nosuid since
    >     >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full=
-
    >     >> cmdline/1.0-r0/rootfs/sbin/klogd
    >     >> exists and is not a link
    >     >>
    >     >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
    >     >> ---
    >     >>   meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
    >     >>   1 file changed, 7 insertions(+), 1 deletion(-)
    >     >>
    >     >> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc
    >     >> b/meta/recipes-extended/sysklogd/sysklogd.inc
    >     >> index fc4e67c18e..2a8bed00f3 100644
    >     >> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
    >     >> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
    >     >> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43=
cbc842c2336e835926c2166c28b \
    >     >>                       file://klogd.c;beginline=3D2;endline=3D19;md=
5=3D7e87ed0ae6142de079bce738c10c899d \
    >     >>                      "
    >     >>
    >     >> -inherit update-rc.d systemd
    >     >> +inherit update-rc.d systemd update-alternatives
    >     >>
    >     >>   SRC_URI =3D "http://www.infodrom.org/projects/sysklogd/downloa=
d/sysklogd-${PV}.tar.gz \
    >     >>              file://no-strip-install.patch \
    >     >> @@ -70,3 +70,9 @@ python () {
    >     >>       if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', =
True, False, d):
    >     >>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
    >     >>   }
    >     >> +
    >     >> +ALTERNATIVE_PRIORITY =3D "100"
    >     >> +ALTERNATIVE_${PN} =3D "klogd syslogd"
    >     >> +ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
    >     >> +ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
    >     >> +
    >     >> --
    >     >> 2.18.0
    >     > This is a (partial) revert of commit 988aad01b2 (sysklogd: don'=
t use
    >     > update-alternatives). Can you come to an agreement regarding wh=
ich is
    >     > the correct solution?
    >     >
    >     > //Peter
    >     >
    >
    >
    >     I think the previous commit (syslogd: don't use update-alternativ=
es) is
    >     made because syslog daemon conflict with each other. I guess the =
author
    >     assumed that the 'syslogd' and 'klogd' alternatives entries are h=
andled
    >     by busybox-syslog package.
    >
    >     On the other hand, I think the patch is trying to solve the probl=
em of
    >     busybox being installed after sysklogd.
    >     We are currently not seeing errors because busybox is likely to b=
e
    >     installed before sysklogd. Even in this situation, the result is =
not all
    >     correct, because the links busybox's postinstall creates are cove=
red by
    >     the real binaries from sysklogd.
    >
    >     I think the problem is about busybox's handling of alternatives.
    >
    >     Khem, I've sent out a patch to fix busybox's alternatives logic. =
Could
    >     you please help review it?
    >
    >     Best Regards,
    >     Chen Qi
    >
    >
    >
   =20



