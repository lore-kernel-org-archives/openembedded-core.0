Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBFD66125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 13:52:11 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VvSP5-0005Vz-70 from Fahad_Arslan@mentor.com ;
	Tue, 24 Dec 2013 05:52:11 -0800
Received: from SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 24 Dec 2013 05:52:11 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.02.0247.003; Tue, 24 Dec 2013 13:52:09 +0000
From: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] speex: Scale float input when FIXED_POINT is
	defined
Thread-Index: AQHO/Z17sWJVnBxWu0e5nWviRb/FY5pdQdgAgAYQ/Ng=
Date: Tue, 24 Dec 2013 13:52:08 +0000
Message-ID: <2B9C97B395470A40B9E9E5D469BCD9FA0155F773@EU-MBX-03.mgc.mentorg.com>
References: <1387555576-9567-1-git-send-email-fahad_arslan@mentor.com>,
	<52B46CDC.40003@linux.intel.com>
In-Reply-To: <52B46CDC.40003@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Dec 2013 13:52:11.0160 (UTC)
	FILETIME=[57EF2180:01CF00AF]
Subject: Re: [PATCH] speex: Scale float input when FIXED_POINT is defined
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
X-List-Received-Date: Tue, 24 Dec 2013 13:52:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Patch to Speex upstream has been denied with reason that fixing this will b=
reak other =0A=
applications using it. =0A=
=0A=
I think appropriate place to fix the issue is Pulseaudio code. I've submitt=
ed patch =0A=
upstream for that and sending a new patch for that to oe-core as well and t=
his speex =0A=
patch may be dropped. =0A=
=0A=
Fahad=0A=
________________________________________=0A=
From: Saul Wold [sgw@linux.intel.com]=0A=
Sent: Friday, December 20, 2013 9:14 PM=0A=
To: Arslan, Fahad; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] speex: Scale float input when FIXED_POINT is=
 defined=0A=
=0A=
On 12/20/2013 08:06 AM, Fahad Arslan wrote:=0A=
> From: Fahad Arslan <Fahad_Arslan@mentor.com>=0A=
>=0A=
> When Speex is compiled with FIXED_POINT defined, it scales float=0A=
> input to +/-32768 instead of +/-1. This was being missed at one=0A=
> point causing the input to the resampler to be zeroed. As a result=0A=
> there was no audio output.=0A=
>=0A=
> Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>=0A=
> ---=0A=
>   .../speex/speex/scaling_fix.patch                  |   12 ++++++++++++=
=0A=
>   meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    3 ++-=0A=
>   2 files changed, 14 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/meta/recipes-multimedia/speex/speex/scaling_fix.patch b/meta=
/recipes-multimedia/speex/speex/scaling_fix.patch=0A=
> new file mode 100644=0A=
> index 0000000..a6340d7=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-multimedia/speex/speex/scaling_fix.patch=0A=
=0A=
The patch needs Upstream-Status: and Signed-off-by: tags please=0A=
=0A=
Sau!=0A=
=0A=
> @@ -0,0 +1,12 @@=0A=
> +diff -NaurbB a/libspeex/resample.c b/libspeex/resample.c=0A=
> +--- a/libspeex/resample.c    2013-12-20 19:47:49.154454769 +0500=0A=
> ++++ b/libspeex/resample.c    2013-12-20 19:48:16.558454331 +0500=0A=
> +@@ -915,7 +915,7 @@=0A=
> +        if (in) {=0A=
> +          for(j=3D0;j<ichunk;++j)=0A=
> + #ifdef FIXED_POINT=0A=
> +-           x[j+st->filt_len-1]=3DWORD2INT(in[j*istride_save]);=0A=
> ++           x[j+st->filt_len-1]=3DWORD2INT(32768.*in[j*istride_save]);=
=0A=
> + #else=0A=
> +            x[j+st->filt_len-1]=3Din[j*istride_save];=0A=
> + #endif=0A=
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes=
-multimedia/speex/speex_1.2rc1.bb=0A=
> index faf63b0..0fea51e 100644=0A=
> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb=0A=
> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb=0A=
> @@ -9,7 +9,8 @@ DEPENDS =3D "libogg"=0A=
>=0A=
>   PR =3D "r2"=0A=
>=0A=
> -SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.ta=
r.gz"=0A=
> +SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.ta=
r.gz \=0A=
> +           file://scaling_fix.patch"=0A=
>=0A=
>   SRC_URI[md5sum] =3D "c4438b22c08e5811ff10e2b06ee9b9ae"=0A=
>   SRC_URI[sha256sum] =3D "342f30dc57bd4a6dad41398365baaa690429660b10d866b=
7d508e8f1179cb7a6"=0A=
>=0A=

