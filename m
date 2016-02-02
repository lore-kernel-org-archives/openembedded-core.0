Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9283F7714F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:03:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 14:03:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="904214715"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 14:03:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 11:03:45 +1300
Message-ID: <3666142.Q8On7yAzEZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <388d73eeea1fedcf2630488658dc8aa684a24c33.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
	<388d73eeea1fedcf2630488658dc8aa684a24c33.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, benjamin.esquivel@intel.com,
	=?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>
Subject: Re: [PATCH 19/20] oeqa/sdkext: Add devtool basic tests for eSDK.
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
X-List-Received-Date: Tue, 02 Feb 2016 22:03:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 09:14:22 An=EDbal Lim=F3n wrote:
> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>=20
> Add simple myapp application is a C app that prints hello world
> and exit.
>=20
> Add devtool test for that this app to the workspace, build and
> reset it.
>=20
> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> ---
>  meta/lib/oeqa/sdkext/devtool.py           | 25 +++++++++++++++++++++=
++++
>  meta/lib/oeqa/sdkext/files/myapp/Makefile | 10 ++++++++++
>  meta/lib/oeqa/sdkext/files/myapp/myapp.c  |  9 +++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 meta/lib/oeqa/sdkext/devtool.py
>  create mode 100644 meta/lib/oeqa/sdkext/files/myapp/Makefile
>  create mode 100644 meta/lib/oeqa/sdkext/files/myapp/myapp.c
>=20
> diff --git a/meta/lib/oeqa/sdkext/devtool.py
> b/meta/lib/oeqa/sdkext/devtool.py new file mode 100644
> index 0000000..0262ed3
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/devtool.py
> @@ -0,0 +1,25 @@
> +import shutil
> +
> +from oeqa.oetest import oeSDKExtTest
> +from oeqa.utils.decorators import *
> +
> +class DevtoolTest(oeSDKExtTest):
> +
> +    @classmethod
> +    def setUpClass(self):
> +        self.myapp_src =3D os.path.join(self.tc.sdkextfilesdir, "mya=
pp")
> +        self.myapp_dst =3D os.path.join(self.tc.sdktestdir, "myapp")=

> +        shutil.copytree(self.myapp_src, self.myapp_dst)
> +
> +    def test_devtool_add_reset(self):
> +        self._run('devtool add myapp %s' % self.myapp_dst)
> +        self._run('devtool reset myapp')
> +
> +    def test_devtool_build(self):
> +        self._run('devtool add myapp %s' % self.myapp_dst)
> +        self._run('devtool build myapp')
> +        self._run('devtool reset myapp')
> +
> +    @classmethod
> +    def tearDownClass(self):
> +        shutil.rmtree(self.myapp_dst)
> diff --git a/meta/lib/oeqa/sdkext/files/myapp/Makefile
> b/meta/lib/oeqa/sdkext/files/myapp/Makefile new file mode 100644
> index 0000000..abd91be
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/files/myapp/Makefile
> @@ -0,0 +1,10 @@
> +all: myapp
> +
> +myapp: myapp.o
> +=09$(CC) $(LDFLAGS) $< -o $@
> +
> +myapp.o: myapp.c
> +=09$(CC) $(CFLAGS) -c $< -o $@
> +
> +clean:
> +=09rm -rf myapp.o myapp
> diff --git a/meta/lib/oeqa/sdkext/files/myapp/myapp.c
> b/meta/lib/oeqa/sdkext/files/myapp/myapp.c new file mode 100644
> index 0000000..f0b63f0
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/files/myapp/myapp.c
> @@ -0,0 +1,9 @@
> +#include <stdio.h>
> +
> +int
> +main(int argc, char *argv[])
> +{
> +=09printf("Hello world\n");
> +
> +=09return 0;
> +}

I guess we'll probably want to extend this test so it also looks at the=
=20
binaries produced by the build to see if they're reasonable, but we can=
 do=20
that later.

One thing though - could you add a check to see that the 'devtool' comm=
and=20
we're executing is definitely from the SDK and not the outer build envi=
ronment=20
(or elsewhere)? Presumably you could just do "which devtool" and check =
the=20
output.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

