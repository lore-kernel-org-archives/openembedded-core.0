Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329CDC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 07:48:38 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com
 [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web09.27997.1647848915530298082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 00:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=HH8IzCT8;
 spf=pass (domain: bmw.de, ip: 207.54.65.242,
 mailfrom: prvs=0727fcc33=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1647848915; x=1679384915;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tpE+3ZtYHvgafiJSuZ3GpcJHpZGCMakjHKYB/x0lnCQ=;
  b=HH8IzCT8rkh2VmMIIaD7IQVCZmI2vO2fkldwDaWzWdgjd7ONnq7YnIrc
   l2kBtaBZzFM6SMIa2T66ihD1+tM7P9J+WM9bfmY0DGIxFl8AwdXV4NvVn
   ghllr/RYAi9Avi4UWsVexJVMu5WWBHrC1ehMB3RdlxTlvgkdvy6P1uQB6
   c=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 21 Mar 2022 08:48:33 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw5.muc with ESMTP/TLS;
 21 Mar 2022 08:48:32 +0100
Received: from smucm33k.bmwgroup.net (HELO smucm33k.europe.bmw.corp)
 ([160.46.167.67])
 by esabb4.muc with ESMTP/TLS; 21 Mar 2022 08:48:33 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33k.europe.bmw.corp
 (160.46.167.67) with Microsoft SMTP Server (TLS;
 Mon, 21 Mar 2022 08:48:32 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.028; Mon,
 21 Mar 2022 08:48:32 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>,
	<paul.gortmaker@windriver.com>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to help
 monitor kernel CVEs
Thread-Topic: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to
 help monitor kernel CVEs
Thread-Index: AQHYO8czXO//1u43XUy+sZAONA//lazJZ8yA
Date: Mon, 21 Mar 2022 07:48:32 +0000
Message-ID: <Yjgtzy+HeQfaEOqQ@korppu>
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD6C7D50BC8F2A4BAC69F7189CD32392@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 07:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163494

Hi,

Thanks for the interesting patch!

On Sat, Mar 19, 2022 at 07:25:55PM +0000, Richard Purdie wrote:
> This adds support for a random kernel CVE monitoring tool which can be
> run as a specific task against a kernel:
>=20
> $ bitbake linux-yocto -c checkcves
> [...]
> Sstate summary: Wanted 3 Local 3 Mirrors 0 Missed 0 Current 135 (100% mat=
ch, 100% complete)
> NOTE: Executing Tasks
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for be80a1d3f9dbe5aee79a325964f7037fe2d92=
f30:CVE-2021-4204 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for 20b2aff4bc15bda809f994761d5719827d66c=
0b4:CVE-2022-0500 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for 55749769fe608fa3f4a075e42e89d237c8e37=
637:CVE-2021-4095 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for 4fbcc1a4cb20fe26ad0225679c536c80f1648=
221:CVE-2022-26490 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for dbbf2d1e4077bab0c65ece2765d3fc69cf7d6=
10f:CVE-2019-15239 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for 89f3594d0de58e8a57d92d497dea9fee3d4b9=
cda:CVE-2022-24958 (NOT FOR THIS VERSION)
> WARNING: linux-yocto-5.15.26+gitAUTOINC+ea948a0983_5bd4bda819-r0 do_check=
cves: Should consider cherry-pick for 1bfba2f4270c64c912756fc76621bbce959dd=
f2e:CVE-2020-25220 (NOT FOR THIS VERSION)
> NOTE: Tasks Summary: Attempted 627 tasks of which 626 didn't need to be r=
erun and all succeeded.
>=20
> Posted as an RFC to see what people think of this. I make no claims
> on how useful it is/isn't but wanted to show integration isn't difficult
> and provide some inspiration for ideas.
>=20
> Details on the tool in question: https://github.com/madisongh/kernel-cve-=
tool
>=20
> I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel.bbclass                   | 10 ++++++++++
>  .../kernel-cve-tool/kernel-cve-tool_git.bb    | 20 +++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_g=
it.bb
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4f304eb9c7a..a842747b9d9 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -753,6 +753,16 @@ addtask sizecheck before do_install after do_strip
> =20
>  inherit kernel-artifact-names
> =20
> +do_checkcves () {
> +	cd ${S}
> +	kernel-cve-tool -P ${STAGING_DATADIR_NATIVE}/kernel-cvedb
> +	while read -r line; do=20
> +		bbwarn "Should consider cherry-pick for $line";=20

cherry-picking isn't recommended. Instead, stable releases should be merged
fully into product trees to fix CVE and other critical bugs.

cherry-picking will miss bugs which don't yet have CVEs or exploits.
cherry-picking will also miss non-obvious patch dependencies.

Kernel community including Android documentation strongly recommends
stable tree merges.

https://source.android.com/devices/architecture/kernel/releases#keeping-a-s=
ecure-system

"When deploying a device that uses Linux, it is strongly recommended that a=
ll LTS kernel updates be taken by the manufacturer and pushed out to their =
users after proper testing shows the update works well"

http://kroah.com/log/blog/2018/02/05/linux-kernel-release-model/

"When deploying a device that uses Linux, it is strongly recommended that a=
ll LTS kernel updates be taken by the manufacturer and pushed out to their =
users after proper testing shows the update works well. As was described ab=
ove, it is not wise to try to pick and choose various patches from the LTS =
releases..."

I think the cherry-pick status is not useful, but the list of CVEs and patc=
hes
to various subsystems is useful to users. IMO the tool should ask for a poi=
nt
release merge from upstream instead.

> +	done < ${S}/cherry-picks.list
> +}
> +do_checkcves[depends] =3D "kernel-cve-tool-native:do_populate_sysroot"
> +addtask checkcves after do_configure
> +
>  kernel_do_deploy() {
>  	deployDir=3D"${DEPLOYDIR}"
>  	if [ -n "${KERNEL_DEPLOYSUBDIR}" ]; then
> diff --git a/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb b=
/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> new file mode 100644
> index 00000000000..d2402bae052
> --- /dev/null
> +++ b/meta/recipes-kernel/kernel-cve-tool/kernel-cve-tool_git.bb
> @@ -0,0 +1,20 @@
> +HOMEPAGE =3D "https://github.com/madisongh/kernel-cve-tool/"
> +SRC_URI =3D "git://github.com/madisongh/kernel-cve-tool;protocol=3Dhttps=
;branch=3Dmaster;name=3Dtool \
> +           git://github.com/nluedtke/linux_kernel_cves.git;protocol=3Dht=
tps;branch=3Dmaster;destsuffix=3Dcvedb;name=3Ddata"

Could the 'data' be handled like the CVE database and updated regularly/aut=
omatically?

Cheers,

-Mikko

> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D850b17d75c13807fada69140cf7ca=
cc5"
> +
> +SRCREV_FORMAT ?=3D "tool_data"
> +SRCREV_tool =3D "eb177abea3745d8576a725646effcce25f34302e"
> +SRCREV_data =3D "b51a576dfbbd4d343b33bed0aa1fc4e095911938"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools_build_meta
> +
> +do_install:append () {
> +	install -d ${D}${datadir}/kernel-cvedb
> +	cp -r ${WORKDIR}/cvedb/* ${D}${datadir}/kernel-cvedb
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.32.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163476): https://lists.openembedded.org/g/openembedde=
d-core/message/163476
> Mute This Topic: https://lists.openembedded.org/mt/89894789/3616751
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
kko.rapeli@bmw.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

