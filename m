Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0EC78F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:23:50 +0000 (UTC)
IronPort-SDR: MdjKxjRA9Al9q2MivDpAqHUhbz7UdCMKneN/NvfHpurHpsI8j32LGMvDNRIWguQF6lH5cSw19N
	aJJdglcBf7FulRxoWNWaMIh8YLuTNEbg3esqs6nJju5nd6FPeUf/OoGfh7Sn+D5BfPtPanf/p0
	6mMlmS31P8E6DPkbrl+oGW5gRMONWywcoK94HVDbbpvQvTK0c5tBP4oCC03GpJX8kMr7YCwJ8Q
	ZaiirlaUSczIZKzkPIAHeoGoqplP5kH+JHRYNDUjUlzfa/hMtBZfYfpTEhXCE9w7c6rx6N0aRd
	1io=
X-IronPort-AV: E=Sophos;i="5.69,224,1571695200"; 
   d="scan'208";a="2763655"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Tom Hochstein <tom.hochstein@nxp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eVanuA
Date: Thu, 21 Nov 2019 10:23:50 +0000
Message-ID: <b280bb0077e641158e47c85dd6948540@XBOX03.axis.com>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
In-Reply-To: <20191120192419.7352-1-tom.hochstein@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Thu, 21 Nov 2019 10:23:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Tom Hochstein
> Sent: den 20 november 2019 20:26
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
> disable menuconfig logic
>=20
> u-boot.inc supports u-boot recipes with or without menuconfig [1].
> However, running devtool on a u-boot recipe that does not support
> menuconfig
> results in an error:
>=20
> cp: cannot stat '/home/r60874/upstream/fsl-xwayland/tmp/work/imx8mmevk-
> fsl-linux/u-boot-imx/2018.03-r0/u-boot-imx-2018.03//.config': No such fil=
e
> or directory
>=20
> The problem is the devtool logic assumes that any recipe with a
> do_menuconfig task
> will generate a .config in do_configure().
>=20
> Fix the problem by removing the assumption with a flag that the recipe ca=
n
> control,
> like this:
>=20
> do_configure() {
>     if [ menuconfig-supported ]; then
>         ...
>     else
>         DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
>     fi
> }
>=20
> [1] https://github.com/openembedded/openembedded-
> core/commit/11278e3b2c75be80645b9841763a97dbb35daadc
>=20
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  scripts/lib/devtool/standard.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 8d9c1a3022..66bd1415c3 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -940,8 +940,10 @@ def modify(args, config, basepath, workspace):
>                          '}\n')
>              if rd.getVarFlag('do_menuconfig','task'):
>                  f.write('\ndo_configure_append() {\n'
> -                '    cp ${B}/.config ${S}/.config.baseline\n'
> -                '    ln -sfT ${B}/.config ${S}/.config.new\n'
> +                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
> +                '        cp ${B}/.config ${S}/.config.baseline\n'
> +                '        ln -sfT ${B}/.config ${S}/.config.new\n'
> +                '    fi\n'

Why do you need the extra variable? Why not just check if the .config=20
file exists before copying it:

                '    if -e ${B}/.config; then\n'
                '        cp ${B}/.config ${S}/.config.baseline\n'
                '        ln -sfT ${B}/.config ${S}/.config.new\n'
                '    fi\n'

>                  '}\n')
>              if initial_rev:
>                  f.write('\n# initial_rev: %s\n' % initial_rev)
> --
> 2.17.1

//Peter


