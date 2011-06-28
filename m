Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qba2S-0001DU-4V
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:17:20 +0200
Received: by wwi18 with SMTP id 18so275773wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:13:38 -0700 (PDT)
Received: by 10.216.231.198 with SMTP id l48mr7314968weq.54.1309274018117;
	Tue, 28 Jun 2011 08:13:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k49sm173143weq.31.2011.06.28.08.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 08:13:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E09E4E6.9040703@windriver.com>
Date: Tue, 28 Jun 2011 17:13:35 +0200
Message-Id: <CFD4C36D-0AE0-4705-BEC5-DE2932CBD550@dominion.thruhere.net>
References: <cover.1309239001.git.dexuan.cui@intel.com>	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>
	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<4E09E4E6.9040703@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] base.bbclass: show layer's	branches/revisions in the banner info
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
X-List-Received-Date: Tue, 28 Jun 2011 15:17:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 16:27 heeft Mark Hatle het volgende geschreven:

> On 6/28/11 1:45 AM, Koen Kooi wrote:
>>=20
>> Op 28 jun 2011, om 07:37 heeft Dexuan Cui het volgende geschreven:
>>=20
>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>> ---
>>> meta/classes/base.bbclass |   14 +++++++++++++-
>>> 1 files changed, 13 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index 119b052..4766c77 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -165,9 +165,21 @@ python base_eventhandler() {
>>> 			note(msg)
>>>=20
>>> 	if name.startswith("BuildStarted"):
>>> +		corebase =3D data.getVar("COREBASE", e.data, 1)
>>> +		corelayers =3D [corebase + "/meta", corebase + =
"/meta-yocto"]
>>> +		layers =3D (data.getVar("BBLAYERS", e.data, 1) or =
"").split()
>>> +		layers =3D [i for i in layers if i not in corelayers]
>>> +		fmt_str =3D "%-27s =3D \"%s\""
>>> +		layer_branches =3D [fmt_str % =
(os.path.basename(i)+"_BRANCH", \
>>> +			base_get_metadata_git_branch(i, None).strip()) =
for i in layers]
>>> +		layer_revisions =3D [fmt_str % =
(os.path.basename(i)+"_REVISION", \
>>> +			base_get_metadata_git_revision(i, None)) for i =
in layers]
>>> 		bb.data.setVar( 'BB_VERSION', bb.__version__, e.data )
>>> 		statusvars =3D ['BB_VERSION', 'METADATA_BRANCH', =
'METADATA_REVISION', 'TARGET_ARCH', 'TARGET_OS', 'MACHINE', 'DISTRO', =
'DISTRO_VERSION','TARGET_FPU']
>>> -		statuslines =3D ["%-17s =3D \"%s\"" % (i, =
bb.data.getVar(i, e.data, 1) or '') for i in statusvars]
>>> +		statuslines =3D [fmt_str % (i, bb.data.getVar(i, e.data, =
1) or '') for i in statusvars]
>>> +		for i in range(len(layer_branches)):
>>> +			statuslines.insert(3+2*i, layer_branches[i])
>>> +			statuslines.insert(3+2*i+1, layer_revisions[i])
>>> 		statusmsg =3D "\nOE Build Configuration:\n%s\n" % =
'\n'.join(statuslines)
>>> 		print statusmsg
>>=20
>> I tried this patch and I get:
>>=20
>> OE Build Configuration:
>> BB_VERSION                  =3D "1.13.1"
>> METADATA_BRANCH             =3D "master"
>> METADATA_REVISION           =3D =
"364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
>> meta-angstrom_BRANCH        =3D "master"
>> meta-angstrom_REVISION      =3D =
"c19c342c62416752117c2dce4696840bc864f647"
> ...
>> TARGET_ARCH                 =3D "arm"
>> TARGET_OS                   =3D "linux-gnueabi"
>> MACHINE                     =3D "beagleboard"
>> DISTRO                      =3D "angstrom"
>> DISTRO_VERSION              =3D "v2011.06-core"
>> TARGET_FPU                  =3D "hard"
>>=20
>> So it works as expected, but the output is a bit confusing. I have a =
few (conflicting) suggestions:
>>=20
>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision', =
e.g.:
>>=20
>> 	meta-archos branch          =3D "master"
>> 	meta-archos revision        =3D =
"413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
>>=20
>> 2) for the extra layers put branch and revision on a single line:
>>=20
>> 	meta-archos          =3D =
"master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
>>=20
>> 3) Move the revision info down, e..g
>>=20
>> OE Build Configuration:
>> BB_VERSION                  =3D "1.13.1"
>> TARGET_ARCH                 =3D "arm"
>> TARGET_OS                   =3D "linux-gnueabi"
>> MACHINE                     =3D "beagleboard"
>> DISTRO                      =3D "angstrom"
>> DISTRO_VERSION              =3D "v2011.06-core"
>> TARGET_FPU                  =3D "hard"
>> METADATA_BRANCH             =3D "master"
>> METADATA_REVISION           =3D =
"364ca0d2d0399c8cc6d3b3fc28308e1e14673544"
>> meta-angstrom_BRANCH        =3D "master"
>> meta-angstrom_REVISION      =3D =
"c19c342c62416752117c2dce4696840bc864f647"
>>=20
>> etc.
>>=20
>> What do you think about that?
>=20
> I think my preference is either 3 or a combination of 2 & 3.
>=20
> To me the important bits are the configuration settings, followed by =
the
> components that are being used as a secondary concern.  It will all =
help in
> debugging and issue, but if the target/distro isn't correct then it =
doesn't
> matter what the rest is.

The current patch outputs the following:

OE Build Configuration:
BB_VERSION                  =3D "1.13.2"
TARGET_ARCH                 =3D "arm"
TARGET_OS                   =3D "linux-gnueabi"
MACHINE                     =3D "beagleboard"
DISTRO                      =3D "angstrom"
DISTRO_VERSION              =3D "v2011.06-core"
TARGET_FPU                  =3D "hard"
METADATA_BRANCH             =3D "master"
METADATA_REVISION           =3D =
"f1c2bfb82e0d11955cb8dc6b2f7aca9e291e1269"
meta-angstrom               =3D =
"master:a3bb1d65ae008b32a20701f479dea59e8268f806"
meta-oe                     =3D =
"master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
meta-efl                    =3D =
"master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
meta-gpe                    =3D =
"master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
meta-gnome                  =3D =
"master:8a12ecca32766ecdceb72cae76e93f8aadcf3669"
meta-texasinstruments       =3D =
"master:2e16e2fbd93bc00bc0a0afaf86975da7778eaa43"
meta-efikamx                =3D =
"master:70cff8742d629fd32463e3ef1bddb83f04d08dc5"
meta-nslu2                  =3D =
"master:aaf918b85d7a8155d6e7c0ff042808346998fbea"
meta-htc                    =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-nokia                  =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-openmoko               =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-palm                   =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-zaurus                 =3D =
"master:f37d05ca7450f85642cea0e43a75df10663bd8f6"
meta-sugarbay               =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-crownbay               =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-emenlow                =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-fishriver              =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-jasperforest           =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-n450                   =3D =
"master:50661bf038a34702f3aa139c3ea0d67fbb0ce5db"
meta-ettus                  =3D =
"master:c34c30fa29f7ab484cc90efb9713325da8e01460"
meta-openpandora            =3D =
"master:edaf6e751f873ed7a82c1116d3d58b9a070052dc"
meta-archos                 =3D =
"master:413933fb5f62574e38a9a1e38905ba6e9c1be4ad"

Still a mouthfull, but easy to digest IMO=


