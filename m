Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4145976DBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 00:22:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2016 16:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,495,1449561600"; d="scan'208";a="923331276"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2016 16:22:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Thu, 25 Feb 2016 13:22:23 +1300
Message-ID: <3087554.BNl70PJfo3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.5-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <d796f5aefb56881a5d27585ff83474d4656c5581.1456165797.git.anibal.limon@linux.intel.com>
References: <cover.1456165797.git.anibal.limon@linux.intel.com>
	<d796f5aefb56881a5d27585ff83474d4656c5581.1456165797.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <limon.anibal@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 4/4] oeqa/sdkext: Add sdk_update.SDKUpdateTest class.
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
X-List-Received-Date: Thu, 25 Feb 2016 00:22:45 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi An=EDbal,

On Mon, 22 Feb 2016 12:31:33 An=EDbal Lim=F3n wrote:
> From: An=EDbal Lim=F3n <limon.anibal@gmail.com>
>=20
> The SDKUpdateTest class test devtool sdk-update mechanism inside
> eSDK.
>=20
> The SDKUpdateTest class search for new sdk if not found uses
> the main one then it publish the eSDK into known folder
> inside work and it starts a web server for serve the eSDK.
>=20
> Finally it executes sdk-update over http, the local test is
> commented due to bug [1].
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9043
>=20
> [YOCTO #9089]
>=20
> Signed-off-by: An=EDbal Lim=F3n <limon.anibal@gmail.com>
> ---
>  meta/lib/oeqa/sdkext/sdk_update.py | 39
> ++++++++++++++++++++++++++++++++++++++ 1 file changed, 39 insertions(=
+)
>  create mode 100644 meta/lib/oeqa/sdkext/sdk_update.py
>=20
> diff --git a/meta/lib/oeqa/sdkext/sdk_update.py
> b/meta/lib/oeqa/sdkext/sdk_update.py new file mode 100644
> index 0000000..16f5b10
> --- /dev/null
> +++ b/meta/lib/oeqa/sdkext/sdk_update.py
> @@ -0,0 +1,39 @@
> +import os
> +import shutil
> +import subprocess
> +
> +from oeqa.oetest import oeSDKExtTest
> +from oeqa.utils.httpserver import HTTPService
> +
> +class SdkUpdateTest(oeSDKExtTest):
> +
> +    @classmethod
> +    def setUpClass(self):
> +        self.publish_dir =3D os.path.join(self.tc.sdktestdir, 'esdk_=
publish')
> +        if os.path.exists(self.publish_dir):
> +            shutil.rmtree(self.publish_dir)
> +        os.mkdir(self.publish_dir)
> +
> +        tcname_new =3D self.tc.d.expand(
> +            "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}-new.sh")
> +        if not os.path.exists(tcname_new):
> +            tcname_new =3D self.tc.tcname
> +
> +        cmd =3D 'oe-publish-sdk %s %s' % (tcname_new, self.publish_d=
ir)
> +        subprocess.check_output(cmd, shell=3DTrue)
> +
> +        self.http_service =3D HTTPService(self.publish_dir)
> +        self.http_service.start()
> +
> +        self.http_url =3D "http://127.0.0.1:%d" % self.http_service.=
port
> +
> +    def test_sdk_update_http(self):
> +        output =3D self._run("devtool sdk-update \"%s\"" % self.http=
_url)
> +
> +#    def test_sdk_update_local(self):
> +#        output =3D self._run("devtool sdk-update \"%s\"" % self.pub=
lish_dir)
> +
> +    @classmethod
> +    def tearDownClass(self):
> +        self.http_service.stop()
> +        shutil.rmtree(self.publish_dir)

You're testing invocation of the sdk-update command, but nothing much b=
eyond=20
that - the update isn't going to be doing anything here since nothing w=
ill=20
have changed. However since this would involve modifying the metadata t=
hough I=20
guess that may have to be done as an oe-selftest test.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

