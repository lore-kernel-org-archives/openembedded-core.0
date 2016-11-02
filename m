Return-Path: <pidge@toganlabs.com>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Nov 2016 18:44:37 UTC
Received: from burlywood.maple.relay.mailchannels.net
	(burlywood.maple.relay.mailchannels.net [23.83.214.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8938D719D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 18:44:36 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A844421116;
	Wed,  2 Nov 2016 18:37:50 +0000 (UTC)
Received: from hp181.hostpapa.com (ip-10-120-4-226.us-west-2.compute.internal
	[10.120.4.226])
	by relay.mailchannels.net (Postfix) with ESMTPA id 9CE8021E90;
	Wed,  2 Nov 2016 18:37:45 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com ([TEMPUNAVAIL]. [10.95.17.29])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.8); Wed, 02 Nov 2016 18:37:50 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-MC-Loop-Signature: 1478111865956:38508874
X-MC-Ingress-Time: 1478111865955
Received: from [37.228.247.203] (port=27338 helo=[192.168.0.60])
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1c20Pr-003pDb-DQ; Wed, 02 Nov 2016 19:37:40 +0100
Message-ID: <1478111855.32080.20.camel@toganlabs.com>
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Reply-To: pidge@toganlabs.com
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Nov 2016 18:37:35 +0000
In-Reply-To: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
References: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
Organization: toganlabs.com
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: pidge@toganlabs.com
Subject: Re: [PATCH] classes/license: copy licenses even if there are no checksummed files
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
X-List-Received-Date: Wed, 02 Nov 2016 18:44:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-02 at 15:07 +0000, Ross Burton wrote:
> Previously do_populate_lic would bail writing the license files (such
> as the MIT
> license text) to deploy/licenses/${PN}/ if there were no files listed
> in
> LIC_FILES_CHKSUM.
>=20
> However this means that recipes that generate their content (such as
> os-release)
> or are otherwise "interesting" (such as perf) don't have their
> license files
> copied over, resulting in warnings from do_rootfs.
>=20

It's been a bit since I've looked at license.bbclass, but I guess my
question here is this seems to take out all notification that a recipe
doesn't have a LIC_FILES_CHKSUM, correct?

I'd rather we maybe kept the note in and maybe whitelisted recipes that
did interesting things so that didn't appear than just ignored when a
recipe was missing it.=C2=A0

Because if we don't at least bb.note it, I can see people just ignoring
it entirely (which would be bad in a lot of ways)

-b

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> =C2=A0meta/classes/license.bbclass | 8 +-------
> =C2=A01 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/meta/classes/license.bbclass
> b/meta/classes/license.bbclass
> index 660b85f..afcfbfc 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -390,7 +390,7 @@ def find_license_files(d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from collections import defaultdict, Orde=
redDict
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# All the license files for the package
> -=C2=A0=C2=A0=C2=A0=C2=A0lic_files =3D d.getVar('LIC_FILES_CHKSUM', Tru=
e)
> +=C2=A0=C2=A0=C2=A0=C2=A0lic_files =3D d.getVar('LIC_FILES_CHKSUM', Tru=
e) or ""
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pn =3D d.getVar('PN', True)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# The license files are located in S/LIC_=
FILE_CHECKSUM.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0srcdir =3D d.getVar('S', True)
> @@ -469,12 +469,6 @@ def find_license_files(d):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not generic_directory:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb.fatal("COMMON_=
LICENSE_DIR is unset. Please set this in
> your distro config")
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0if not lic_files:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# No recipe should hav=
e an invalid license file. This is
> checked else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0# where, but let's be =
pedantic
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bb.note(pn + ": Recipe=
 file does not have license file
> information.")
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return lic_files_paths
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for url in lic_files.split():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0try:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0(type, host, path, user, pswd, parm) =3D
> bb.fetch.decodeurl(url)

