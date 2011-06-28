Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbS6W-0002cI-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 08:49:00 +0200
Received: by wwi18 with SMTP id 18so275210wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 23:45:19 -0700 (PDT)
Received: by 10.227.177.12 with SMTP id bg12mr6285139wbb.59.1309243517648;
	Mon, 27 Jun 2011 23:45:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gf6sm4602812wbb.58.2011.06.27.23.45.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 23:45:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
Date: Tue, 28 Jun 2011 08:45:09 +0200
Message-Id: <3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>
	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 06:49:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 07:37 heeft Dexuan Cui het volgende geschreven:

> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
> meta/classes/base.bbclass |   14 +++++++++++++-
> 1 files changed, 13 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 119b052..4766c77 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -165,9 +165,21 @@ python base_eventhandler() {
> 			note(msg)
>=20
> 	if name.startswith("BuildStarted"):
> +		corebase =3D data.getVar("COREBASE", e.data, 1)
> +		corelayers =3D [corebase + "/meta", corebase + =
"/meta-yocto"]
> +		layers =3D (data.getVar("BBLAYERS", e.data, 1) or =
"").split()
> +		layers =3D [i for i in layers if i not in corelayers]
> +		fmt_str =3D "%-27s =3D \"%s\""
> +		layer_branches =3D [fmt_str % =
(os.path.basename(i)+"_BRANCH", \
> +			base_get_metadata_git_branch(i, None).strip()) =
for i in layers]
> +		layer_revisions =3D [fmt_str % =
(os.path.basename(i)+"_REVISION", \
> +			base_get_metadata_git_revision(i, None)) for i =
in layers]
> 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
> 		statusvars =3D ['BB_VERSION', 'METADATA_BRANCH', =
'METADATA_REVISION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', =
'DISTRO_VERSION','TARGET_FPU']
> -		statuslines =3D ["%-17s =3D \"%s\"" % (i, =
bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
> +		statuslines =3D [fmt_str % (i, bb.data.getVar(i, e.data, =
1) or '') for i in statusvars]
> +		for i in range(len(layer_branches)):
> +			statuslines.insert(3+2*i, layer_branches[i])
> +			statuslines.insert(3+2*i+1, layer_revisions[i])
> 		statusmsg =3D "\nOE Build Configuration:\n%s\n" % =
'\n'.join(statuslines)
> 		print statusmsg

I tried this patch and I get:

OE Build Configuration:
BB_VERSION                  =3D "1.13.1"
METADATA_BRANCH             =3D "master"
METADATA_REVISION           =3D =
"364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
meta-angstrom_BRANCH        =3D "master"
meta-angstrom_REVISION      =3D =
"c19c342c62416752117c2dce4696840bc864f647"
meta-oe_BRANCH              =3D "master"
meta-oe_REVISION            =3D =
"9e3f9dddd2d498a603c0e9eb8bf77d3476a21940"
meta-efl_BRANCH             =3D "master"
meta-efl_REVISION           =3D =
"9e3f9dddd2d498a603c0e9eb8bf77d3476a21940"
meta-gpe_BRANCH             =3D "master"
meta-gpe_REVISION           =3D =
"9e3f9dddd2d498a603c0e9eb8bf77d3476a21940"
meta-gnome_BRANCH           =3D "master"
meta-gnome_REVISION         =3D =
"9e3f9dddd2d498a603c0e9eb8bf77d3476a21940"
meta-texasinstruments_BRANCH =3D "master"
meta-texasinstruments_REVISION =3D =
"04f274735bfc4aab757d25490df52641523bad5e"
meta-efikamx_BRANCH         =3D "master"
meta-efikamx_REVISION       =3D =
"70cff8742d629fd32463e3ef1bddb83f04d08dc5"
meta-nslu2_BRANCH           =3D "master"
meta-nslu2_REVISION         =3D =
"aaf918b85d7a8155d6e7c0ff042808346998fbea"
meta-htc_BRANCH             =3D "master"
meta-htc_REVISION           =3D =
"f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-nokia_BRANCH           =3D "master"
meta-nokia_REVISION         =3D =
"f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-openmoko_BRANCH        =3D "master"
meta-openmoko_REVISION      =3D =
"f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-palm_BRANCH            =3D "master"
meta-palm_REVISION          =3D =
"f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-zaurus_BRANCH          =3D "master"
meta-zaurus_REVISION        =3D =
"f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-sugarbay_BRANCH        =3D "master"
meta-sugarbay_REVISION      =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-crownbay_BRANCH        =3D "master"
meta-crownbay_REVISION      =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-emenlow_BRANCH         =3D "master"
meta-emenlow_REVISION       =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-fishriver_BRANCH       =3D "master"
meta-fishriver_REVISION     =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-jasperforest_BRANCH    =3D "master"
meta-jasperforest_REVISION  =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-n450_BRANCH            =3D "master"
meta-n450_REVISION          =3D =
"50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-ettus_BRANCH           =3D "master"
meta-ettus_REVISION         =3D =
"c34c30fa29f7ab484cc90efb9713325da8e01460"
meta-openpandora_BRANCH     =3D "master"
meta-openpandora_REVISION   =3D =
"edaf6e751f873ed7a82c1116d3d58b9a070052dc"
meta-archos_BRANCH          =3D "master"
meta-archos_REVISION        =3D =
"413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
TARGET_ARCH                 =3D "arm"
TARGET_OS                   =3D "linux-gnueabi"
MACHINE                     =3D "beagleboard"
DISTRO                      =3D "angstrom"
DISTRO_VERSION              =3D "v2011.06-core"
TARGET_FPU                  =3D "hard"

So it works as expected, but the output is a bit confusing. I have a few =
(conflicting) suggestions:

1) replace _BRANCH and _REVISION with ' branch' and ' revision', e.g.:

	meta-archos branch          =3D "master"
	meta-archos revision        =3D =
"413933fb5f62574e38a9a1e38905ba6e9c1be4ad"

2) for the extra layers put branch and revision on a single line:

	meta-archos          =3D =
"master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"

3) Move the revision info down, e..g

OE Build Configuration:
BB_VERSION                  =3D "1.13.1"
TARGET_ARCH                 =3D "arm"
TARGET_OS                   =3D "linux-gnueabi"
MACHINE                     =3D "beagleboard"
DISTRO                      =3D "angstrom"
DISTRO_VERSION              =3D "v2011.06-core"
TARGET_FPU                  =3D "hard"
METADATA_BRANCH             =3D "master"
METADATA_REVISION           =3D =
"364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
meta-angstrom_BRANCH        =3D "master"
meta-angstrom_REVISION      =3D =
"c19c342c62416752117c2dce4696840bc864f647"

etc.

What do you think about that?

regards,

Koen=


