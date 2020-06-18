Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web11.4295.1592474967636699411
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 03:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
IronPort-SDR: WP9x0sRjHQgCxD0PvNv+7onSWpWc2QEDqyV0K2HvV828+ztQaq5xeEP79FT2nnHzRNNn5LZ1da
 /i7HTcrVMmZ1LcmYfE9kHha6A/3siJXPCalmTjY5G2mrKZC/120pFFN3HUh52v7+ntEOXesHl5
 cFmt+d20sWkpAQxl63BiRaw3ESUBIGGo2JpgOm0Q7yu9on+gPeLRXlY5nbbSiyCFRNMdLdZpVN
 du9IG6NPT/ikD7mwt17ZwGY45cQyFh4b0fQdkyhuP3K4ngdcrV008pCxPFWLL/Ss/+MdQw2jNY
 ky4=
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="50069442"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 18 Jun 2020 02:09:26 -0800
IronPort-SDR: fI/YSxv/gdPxJ2susRnA2tIL6DQo8N1yP/FPraIbjFdgjOgfiFHRwyFKYFgy/C6Uiqdh5Er0+x
 xcKxkpbgy9tKMsOzSH/u8/XUmfM/77SEQ4gfxR0eSaNnYm2wnpC3XjUcR9WyJqtxoyS4zdEaq3
 YB1e/sriBwETfpbHf9xFo8ibXz7FPb3uJSPzKcr8qB4/gA6IyCwVoY/POLtKVfSqi6EZDn/w5p
 kUkGrowu3+0hs5p/NNer2WDlK+v8cUOYvnfK1Y/Fo4SgquRsZgK6gli+FzqINogAqQ+pd9WP7F
 Hrk=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
Thread-Topic: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for
 environment-setup beforehand
Thread-Index: AQHWRUUddxOCLY7HF0GrveLW59pfn6jeJjrU
Date: Thu, 18 Jun 2020 10:09:22 +0000
Message-ID: <1592474961770.16010@mentor.com>
References: <20200617204739.22441-1-awais_belal@mentor.com>,<CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
In-Reply-To: <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> That sort of error would typically be caused by the variable being=0A=
> unset rather than the variable being set to the path of a nonexistent=0A=
> file. I don't know much about the context this script runs in though=0A=
> so I may be missing something obvious.=0A=
=0A=
You're right but a "! -f" takes care of both the cases where the var is uns=
et of the file isn't present.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Thursday, June 18, 2020 12:50 PM=0A=
To: Belal, Awais=0A=
Cc: openembedded-core=0A=
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for enviro=
nment-setup beforehand=0A=
=0A=
On Wed, 17 Jun 2020 at 21:48, Awais Belal <Awais_Belal@mentor.com> wrote:=
=0A=
>=0A=
> The script runs a 'cat' on the script and if it isn't present in the=0A=
> sdk the cat command waits on the std input and hence the installation=0A=
> process simply sits there.=0A=
=0A=
That sort of error would typically be caused by the variable being=0A=
unset rather than the variable being set to the path of a nonexistent=0A=
file. I don't know much about the context this script runs in though=0A=
so I may be missing something obvious.=0A=
=0A=
>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>  meta/files/toolchain-shar-relocate.sh | 6 ++++++=0A=
>  1 file changed, 6 insertions(+)=0A=
>=0A=
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain=
-shar-relocate.sh=0A=
> index e3c10018ef..02a05664c6 100644=0A=
> --- a/meta/files/toolchain-shar-relocate.sh=0A=
> +++ b/meta/files/toolchain-shar-relocate.sh=0A=
> @@ -3,6 +3,12 @@ if ! xargs --version > /dev/null 2>&1; then=0A=
>         exit 1=0A=
>  fi=0A=
>=0A=
> +# check if we have a valid env-setup script=0A=
> +if [ ! -f "$env_setup_script" ]; then=0A=
> +       echo "Main environment-setup file not found. Abort!"=0A=
> +       exit 1=0A=
> +fi=0A=
> +=0A=
>  # fix dynamic loader paths in all ELF SDK binaries=0A=
>  native_sysroot=3D$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE=
_SYSROOT=3D'|cut -d'=3D' -f2|tr -d '"')=0A=
>  dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")=0A=
> --=0A=
> 2.17.1=0A=
=0A=
=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
