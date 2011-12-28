Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RfsYE-0000w5-OF
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 13:24:10 +0100
Received: from STOEXMBXC01.domain01.net
	([fe80:0000:0000:0000:8caa:b43d:115.41.221.224]) by
	stoexhubfe02.domain01.net
	([10.12.10.7]) with mapi; Wed, 28 Dec 2011 13:16:56 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Dec 2011 13:16:24 +0100
Thread-Topic: [OE-core] [PATCH 2/2] u-boot: added generating the env utils
	(fixes	bug 1800)
Thread-Index: AczFWpbL1rmV97BJQbaoXm3My25onw==
Message-ID: <38A62FB9-6B22-4DC6-AC66-23F5806ED8BA@chargestorm.se>
References: <1325018118-30223-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1325018118-30223-2-git-send-email-fransmeulenbroeks@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH 2/2] u-boot: added generating the env utils (fixes	bug 1800)
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
X-List-Received-Date: Wed, 28 Dec 2011 12:24:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 27 dec 2011, at 21:35, "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com=
> wrote:

> This adds building the u-boot tools for target.
> (fw_printenv, fw_setenv).
> They are put into a separate package
> With these files it becomes possible to modify
> the u-boot environment when linux is booted
>=20
> The #ifdef's in fw_env.h were needed to avoid compilation issues
> The constants have been changed to more meaningful defaults
> (as 128k flash pages are much more common than 4k pages)
> but can be overridden using a configuration file.
>=20
> This resolves bug 1800
>=20
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>=20
> ---
> Note: development and testing was done under openembedded classic.
> I've tested it there quite heavily (for mpc8313 if that matters).
> I was requested to provide a patch for oe-core too (to resolve bug 1800)
> so here it is, although at the moment I am unable to test the patch for o=
e-core.
> I suggest that this is carefully reviewed and tested before being merged.


> create mode 100644 meta/recipes-bsp/u-boot/files/tools_fwenv.patch
>=20
> diff --git a/meta/recipes-bsp/u-boot/files/tools_fwenv.patch b/meta/recip=
es-bsp/u-boot/files/tools_fwenv.patch
> new file mode 100644
> index 0000000..8e87800
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/tools_fwenv.patch
> @@ -0,0 +1,48 @@
> +Index: u-boot-2011.03/tools/env/fw_env.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- u-boot-2011.03.orig/tools/env/fw_env.h    2011-03-31 23:45:36.000000=
000 +0200++++ u-boot-2011.03/tools/env/fw_env.h    2011-12-02 13:55:24.6672=
78362 +0100
> +@@ -27,25 +27,35 @@
> +  * See included "fw_env.config" sample file (TRAB board)
> +  * for notes on configuration.
> +  */
> +-#define CONFIG_FILE     "/etc/fw_env.config"
> ++//#define CONFIG_FILE     "/etc/fw_env.config"

Why do you remove the default for CONFIG_FILE?
I haven't the u-boot code here, but isn't there a check for the configurati=
on file in the code? Thus, you would still get compiled in defaults if no c=
onfig file is found?

> ++
> ++#include "config.h"
> +=20
> + #define HAVE_REDUND /* For systems with 2 env sectors */
> +-#define DEVICE1_NAME      "/dev/mtd1"
> +-#define DEVICE2_NAME      "/dev/mtd2"
> ++#define DEVICE1_NAME      "/dev/mtd0"
> ++#define DEVICE2_NAME      "/dev/mtd0"

Would this really be a more comman case than he original defines? (Personal=
ly, I'm usually using the config file, so this doesn't really matter. But I=
'd still question changing these to mtd0...)

> + #define DEVICE1_OFFSET    0x0000
> +-#define ENV1_SIZE         0x4000
> +-#define DEVICE1_ESIZE     0x4000
> +-#define DEVICE2_OFFSET    0x0000
> +-#define ENV2_SIZE         0x4000
> +-#define DEVICE2_ESIZE     0x4000
> ++#define ENV1_SIZE         0x2000
> ++#define DEVICE1_ESIZE     0x20000
> ++#define DEVICE1_ENVSECTORS     1
> ++#define DEVICE2_OFFSET    0x20000
> ++#define ENV2_SIZE         0x2000
> ++#define DEVICE2_ESIZE     0x20000
> ++#define DEVICE2_ENVSECTORS     1

Ok, I can agree with you that 128k pages are more common, thus that could b=
e a sensible default.

I can also see a few reasons for changing the size of the environments, ENV=
1_SIZE and ENV2_SIZE, but there is no reason given in the commit log.

Cheers,
Anders=


