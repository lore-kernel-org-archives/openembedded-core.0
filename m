Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0158460069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:29:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 00:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,427,1534834800"; d="scan'208";a="102829981"
Received: from myang3-mobl.amr.corp.intel.com (HELO [10.252.18.29])
	([10.252.18.29])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2018 00:29:50 -0700
User-Agent: Microsoft-MacOutlook/10.10.3.181015
Date: Fri, 26 Oct 2018 10:29:49 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Victor Kamensky <kamensky@cisco.com>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <445EEF2D-ABF2-4822-A390-D6D7DECAC6B9@linux.intel.com>
Thread-Topic: [PATCH] sysklogd: add alternatives for klogd and syslogd
References: <20181026045303.10592-1-kamensky@cisco.com>
In-Reply-To: <20181026045303.10592-1-kamensky@cisco.com>
Mime-version: 1.0
Subject: Re: [PATCH] sysklogd: add alternatives for klogd and syslogd
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
X-List-Received-Date: Fri, 26 Oct 2018 07:29:51 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

'why would you want to have multiple, alternative syslog daemons on the sys=
tem? Wouldn't a better fix be to move the syslogd and klogd symlinks to the =
busybox-syslog package? It doesn't seem to make much sense to have a syslogd=
 binary on the system without an init script(?)

The original problem really was related to managing init scripts with alter=
natives (and I think that problem still persists, and, it shouldn't be done)=
. So, using alternatives for the binaries wouldn't cause any problems. The q=
uestion is just why to do this, instead of "fixing" the (binary) package con=
tent so that existing rconflicts would handle it.

Cheers,
  Markus

=EF=BB=BFOn 26/10/2018, 7.55, "Victor Kamensky" <kamensky@cisco.com> wrote:

    Otherwise when used in presense of busybox that provides
    its own version of klogd and syslogd, image packaging
    complains that klogd exists and it is not syymbolic link.
    Failure happens only if image packaging script install
    sysklogd package first followed by installtion of busybox
    package. If during packaging reverse installtion order
    happens, busybox first followed by sysklogd, packaging
    succeed.
   =20
    Note this fix along with recently committed
    55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
    effectively reverts this commit
    988aad01b2 sysklogd: don't use update-alternatives
   =20
    Signed-off-by: Victor Kamensky <kamensky@cisco.com>
    ---
    Hi Guys,
   =20
    Here is more details. Example of failure that I observe:
   =20
    update-alternatives: Error: not linking /home/wd8/oe/20181021/build/tmp=
-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootf=
s/sbin/klogd to /usr/lib/busybox/sbin/klogd since /home/wd8/oe/20181021/buil=
d/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/=
rootfs/sbin/klogd exists and is not a link
   =20
    Also 988aad01b2 says:
   =20
    > Using update-alternatives for managing init scripts has proved to be
    > problematic. And, sysklogd rconflicts with other syslog daemons so th=
ere
    > is no point in using update-alternatives from this perspective, eithe=
r.
   =20
    I am not sure why "managing init scripts has proved to be problematic" =
and
    syslogd and klogd are not really init script per se, aren't they? Also
    klogd and syslogd actually come from busybox, not busybox-syslog as lis=
ted
    in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
    busybox-syslog now contains only init script for syslog and its
    configuration.
   =20
    Adding Markus for further comments.
   =20
     meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
     1 file changed, 5 insertions(+)
   =20
    diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes=
-extended/sysklogd/sysklogd.inc
    index f151dd87f7..4393a39180 100644
    --- a/meta/recipes-extended/sysklogd/sysklogd.inc
    +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
    @@ -60,9 +60,14 @@ FILES_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURE=
S','systemd','${exec_prefix}
    =20
     ALTERNATIVE_PRIORITY =3D "100"
    =20
    +ALTERNATIVE_${PN} =3D "syslogd klogd"
    +
     ALTERNATIVE_${PN}-doc =3D "syslogd.8"
     ALTERNATIVE_LINK_NAME[syslogd.8] =3D "${mandir}/man8/syslogd.8"
    =20
    +ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
    +ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
    +
     pkg_prerm_${PN} () {
     	if test "x$D" =3D "x"; then
     	if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
    --=20
    2.17.2
   =20
   =20



