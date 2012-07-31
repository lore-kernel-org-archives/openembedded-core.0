Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1SwHZT-0008Lz-4c
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:53:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2012 11:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128939753"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2012 11:41:52 -0700
Received: from orsmsx106.amr.corp.intel.com (10.22.225.133) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 31 Jul 2012 11:41:52 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.93]) by
	ORSMSX106.amr.corp.intel.com ([169.254.5.44]) with mapi id
	14.01.0355.002; Tue, 31 Jul 2012 11:41:51 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 0/6] relocatable SDK
Thread-Index: AQHNbvmEFESVSsw17E6Fv0T9BHZoVpdDuCKA
Date: Tue, 31 Jul 2012 18:41:50 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46ABCF1E@ORSMSX101.amr.corp.intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] relocatable SDK
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
X-List-Received-Date: Tue, 31 Jul 2012 18:53:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Laurentiu,

Seems there's some issue with your branch.  I cloned it and when I tried to=
 do source oe-init-build-env, it complains the bitbake directory doesn't ex=
isting which is true and there're whole bunch of other directories also mis=
sing.  Can you take a look since I want to do some testing against it regar=
ding relocatable SDK feature?

Thanks,
Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Laurentiu Palcu
Sent: Tuesday, July 31, 2012 1:50 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2 0/6] relocatable SDK

Changes in v2:
        - addressed Saul's comments: added Upstream-Status for patches, sig=
ned-off-by
          and patches description;
        - addressed Philip's comment about default installation directory: =
now the
          default installation directory is the same as SDKPATH variable;
        - added patch for eglibc-2.16;


Hi,

This patchset adds relocatable SDK functionality. Instead of a tarball, the=
 output of "bitbake meta-toolchain/meta-toolchain-sdk" will be a self extra=
cting archive.

The user will then execute the .sh script and give it the target directory =
for SDK installation (default is /opt/poky). The installer will then extrac=
t the embedded tarball to the user provided location and will set up the
SDK: change the paths in the environment script, change the dynamic loader =
path in all binaries and, also, change the ls.so.cache path in the dynamic =
loader itself, together with the SYSDIR paths/lengths.

With that, no more root privileges are needed in order to install the SDK.

Thanks,
Laurentiu

The following changes since commit e12df2ca5c71ad672ebbfefbc47cabbac3333d61=
:

  lib/oe/lsb.py: Map unknown distributions to 'Unknown' (2012-07-31 08:01:2=
8 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_sdk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dlpalcu/relocat=
able_sdk

Laurentiu Palcu (6):
  eglibc: relocatable SDK changes
  binutils: relocatable SDK: change PT_INTERP section size
  scripts: add script for relocating the SDK
  populate_sdk_base.bbclass: create self-extracting archive
  relocatable.bbclass: split it up, to reuse code
  package.bbclass: change RPATHs for nativesdk packages

 meta/classes/chrpath.bbclass                       |   89 +++++++++
 meta/classes/package.bbclass                       |    5 +
 meta/classes/populate_sdk_base.bbclass             |   86 +++++++++
 meta/classes/relocatable.bbclass                   |   91 +--------
 .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   81 ++++++++
 .../eglibc/eglibc-2.16/relocatable_sdk.patch       |  108 +++++++++++
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    6 +-
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    6 +-
 .../binutils/binutils-crosssdk_2.22.bb             |    5 +
 .../binutils/binutils/relocatable_sdk.patch        |   22 +++
 scripts/relocate_sdk.py                            |  200 ++++++++++++++++=
++++
 11 files changed, 606 insertions(+), 93 deletions(-)  create mode 100644 m=
eta/classes/chrpath.bbclass  create mode 100644 meta/recipes-core/eglibc/eg=
libc-2.15/relocatable_sdk.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/relocatable_sdk.pa=
tch
 create mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk=
.patch
 create mode 100755 scripts/relocate_sdk.py

--
1.7.9.5


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


