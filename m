Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 87D6F6B7B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2014 16:01:29 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VyOEc-0004dB-8M from Fahad_Arslan@mentor.com ;
	Wed, 01 Jan 2014 08:01:30 -0800
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Jan 2014 08:01:30 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.02.0247.003; Wed, 1 Jan 2014 16:00:30 +0000
From: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
To: Saul Wold <sgw@linux.intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] pulseaudio: rescale input being passed to
	float method of speex
Thread-Index: AQHPALXAcs6RXqPcQEiQqEFDYqrdcJpjkBUAgAxA634=
Date: Wed, 1 Jan 2014 16:01:27 +0000
Message-ID: <2B9C97B395470A40B9E9E5D469BCD9FA015601C3@EU-MBX-03.mgc.mentorg.com>
References: <1387895862-15110-1-git-send-email-fahad_arslan@mentor.com>,
	<52B9BC2C.7080709@linux.intel.com>
In-Reply-To: <52B9BC2C.7080709@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Jan 2014 16:01:30.0244 (UTC)
	FILETIME=[BC036440:01CF070A]
Subject: Re: [PATCH] pulseaudio: rescale input being passed to float method of speex
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
X-List-Received-Date: Wed, 01 Jan 2014 16:01:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Pulseaudio upstream says that this patch breaks speex-float if =0A=
it isn't compiled with FIXED_POINT defined, which is valid concern. =0A=
So what is the best option now to avoid the no sound issue:=0A=
a. replace --enable-fixed-point and --disable-float-api with --enable-float=
-api in Speex's recipe=0A=
b. replace default resampler (speex-float-1) used by Pulseaudio to speex-fi=
xed-1=0A=
=0A=
In my opinion option (a) above is better. Thoughts/suggestions? =0A=
=0A=
Thanks,=0A=
Fahad=0A=
=0A=
________________________________________=0A=
From: Saul Wold [sgw@linux.intel.com]=0A=
Sent: Tuesday, December 24, 2013 9:54 PM=0A=
To: Arslan, Fahad; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] pulseaudio: rescale input being passed to fl=
oat method of speex=0A=
=0A=
On 12/24/2013 06:37 AM, Fahad Arslan wrote:=0A=
> From: Fahad Arslan <Fahad_Arslan@mentor.com>=0A=
>=0A=
> Pulseaudio uses Speex to do resampling. Default Pulseaudio resampler=0A=
> is speex-float-1. However, Speex recipe in poky configures speex in=0A=
> fixed point. This scenario creates a situation in which audio streams=0A=
> that need to be resampled are not playedback since input to speex is=0A=
> zeroed out when flaot input in range of +/-1 is converted to int.=0A=
> So we are rescaling the input before invoking speex flaot method.=0A=
>=0A=
> Upstream-Status: Submitted [pulseaudio-discuss@lists.freedesktop.org]=0A=
>=0A=
> Signed-off-by: Fahad Arslan <Fahad_Arslan@mentor.com>=0A=
> ---=0A=
>   .../pulseaudio/rescale_input_to_speex_float.patch  |   24 +++++++++++++=
+++++++=0A=
>   .../pulseaudio/pulseaudio_4.0.bb                   |    3 ++-=0A=
>   2 files changed, 26 insertions(+), 1 deletion(-)=0A=
>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/rescal=
e_input_to_speex_float.patch=0A=
>=0A=
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_=
to_speex_float.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescal=
e_input_to_speex_float.patch=0A=
> new file mode 100644=0A=
> index 0000000..fe5e6a7=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/rescale_input_to_spee=
x_float.patch=0A=
=0A=
Fahad,=0A=
=0A=
The patch itself is missing the Upstream-Status: and Signed-off-by:=0A=
Tags, I know you included them in the commit message above, but they=0A=
need to be in this patch file also.=0A=
=0A=
Thanks=0A=
        Sau!=0A=
=0A=
> @@ -0,0 +1,24 @@=0A=
> +diff -Naur a/src/pulsecore/resampler.c b/src/pulsecore/resampler.c=0A=
> +--- a/src/pulsecore/resampler.c      2013-12-24 18:25:08.164787401 +0500=
=0A=
> ++++ b/src/pulsecore/resampler.c      2013-12-24 18:24:43.056787026 +0500=
=0A=
> +@@ -1347,7 +1347,7 @@=0A=
> +=0A=
> + static void speex_resample_float(pa_resampler *r, const pa_memchunk *in=
put, unsigned in_n_frames, pa_memchunk *output, unsigned *out_n_frames) {=
=0A=
> +     float *in, *out;=0A=
> +-    uint32_t inf =3D in_n_frames, outf =3D *out_n_frames;=0A=
> ++    uint32_t inf =3D in_n_frames, outf =3D *out_n_frames, i;=0A=
> +=0A=
> +     pa_assert(r);=0A=
> +     pa_assert(input);=0A=
> +@@ -1357,6 +1357,11 @@=0A=
> +     in =3D pa_memblock_acquire_chunk(input);=0A=
> +     out =3D pa_memblock_acquire_chunk(output);=0A=
> +=0A=
> ++    /* Speex float API scale range is +/-32768 instead of +/-1.=0A=
> ++       So rescale input before passing it to Speex. */=0A=
> ++    for (i =3D 0; i < inf; i++)=0A=
> ++        in[i] =3D 32768.*in[i];=0A=
> ++=0A=
> +     pa_assert_se(speex_resampler_process_interleaved_float(r->speex.sta=
te, in, &inf, out, &outf) =3D=3D 0);=0A=
> +=0A=
> +     pa_memblock_release(input->memblock);=0A=
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/=
recipes-multimedia/pulseaudio/pulseaudio_4.0.bb=0A=
> index b419c54..5afa20b 100644=0A=
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb=0A=
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb=0A=
> @@ -1,7 +1,8 @@=0A=
>   require pulseaudio.inc=0A=
>=0A=
>   SRC_URI =3D "http://freedesktop.org/software/pulseaudio/releases/pulsea=
udio-${PV}.tar.xz \=0A=
> -           file://volatiles.04_pulse"=0A=
> +           file://volatiles.04_pulse \=0A=
> +           file://rescale_input_to_speex_float.patch"=0A=
>=0A=
>   SRC_URI[md5sum] =3D "591f211db2790a7e4d222f2dc6858db3"=0A=
>   SRC_URI[sha256sum] =3D "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f=
01fd8778928f9cdae"=0A=
>=0A=

