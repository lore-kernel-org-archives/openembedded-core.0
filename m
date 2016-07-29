Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F1FF96080F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 10:18:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bT4sX-0002y7-No from Awais_Belal@mentor.com ;
	Fri, 29 Jul 2016 03:18:54 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.210]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Fri, 29 Jul 2016 11:18:52 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] init-install*: /etc/mtab make a link rather
	than a copy
Thread-Index: AQHR6RMRLjAozuXzdUau8/xFjbL1TaAvMsCi
Date: Fri, 29 Jul 2016 10:18:51 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FCD60CB@EU-MBX-03.mgc.mentorg.com>
References: <1469695788-12904-1-git-send-email-awais_belal@mentor.com>,
	<CAJ86T=UuFqo=AfB_TSzPXQMZ5pRErv-otyxbcjQui2Qc3y+_1g@mail.gmail.com>
In-Reply-To: <CAJ86T=UuFqo=AfB_TSzPXQMZ5pRErv-otyxbcjQui2Qc3y+_1g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-install*: /etc/mtab make a link rather than a copy
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
X-List-Received-Date: Fri, 29 Jul 2016 10:18:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good catch Andre... I did a local update but forgot to send the v2. I'll do=
 so now.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Andre McCurdy [armccurdy@gmail.com]=0A=
Sent: Friday, July 29, 2016 2:00 AM=0A=
To: Belal, Awais=0A=
Cc: OE Core mailing list=0A=
Subject: Re: [OE-core] [PATCH] init-install*: /etc/mtab make a link rather =
than a copy=0A=
=0A=
On Thu, Jul 28, 2016 at 1:49 AM, Awais Belal <awais_belal@mentor.com> wrote=
:=0A=
> Using a copy would only make management of devices erroneous=0A=
> and makes the system unstable in some scenarios as tools will=0A=
> have to manipulate both files separately. A link ensures that=0A=
> both files /proc/mounts and /etc/mtab will have the same=0A=
> information at all times and this is how it is handled=0A=
> on newer systems where there is such a need. Same is=0A=
> suggested by busybox.=0A=
>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>  meta/recipes-core/initrdscripts/files/init-install-efi.sh | 2 +-=0A=
>  meta/recipes-core/initrdscripts/files/init-install.sh     | 2 +-=0A=
>  2 files changed, 2 insertions(+), 2 deletions(-)=0A=
>=0A=
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/=
meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> index f564f4e..53f6508 100644=0A=
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
> @@ -123,7 +123,7 @@ mkdir -p /tmp=0A=
>=0A=
>  # Create /etc/mtab if not present=0A=
>  if [ ! -e /etc/mtab ]; then=0A=
> -    cat /proc/mounts > /etc/mtab=0A=
> +    ln -sf /etc/mtab /proc/mounts=0A=
=0A=
Did you mean:=0A=
=0A=
  ln -sf /proc/mounts /etc/mtab=0A=
=0A=
?=0A=
=0A=
>  fi=0A=
>=0A=
>  disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | c=
ut -d" " -f 3 | sed -e "s/MB//")=0A=
> diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta=
/recipes-core/initrdscripts/files/init-install.sh=0A=
> index 72ce92b..21ae0a6 100644=0A=
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
> @@ -119,7 +119,7 @@ fi=0A=
>=0A=
>  mkdir -p /tmp=0A=
>  if [ ! -L /etc/mtab ]; then=0A=
> -    cat /proc/mounts > /etc/mtab=0A=
> +    ln -sf /etc/mtab /proc/mounts=0A=
>  fi=0A=
>=0A=
>  disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | c=
ut -d" " -f 3 | sed -e "s/MB//")=0A=
> --=0A=
> 1.9.1=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

