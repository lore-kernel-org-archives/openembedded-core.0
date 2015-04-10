Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 88A1E729F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 00:22:23 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so4013182pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 17:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=vqa4Fj8bbuxvQOwpZtBNsPp2rqxBimraUONAzBmfcVA=;
	b=QotPWGOEdcaG4J6nylgKjeMXD6W5CHTFdpZez5rc5Q9oXjFa12wQSqo8LtI1uRZDh+
	82nsC962rAQUDMfV8+Y5T1XRCYdhw2/Xyav8nC6MU3+eywSBQiWUCvwX0agT86XobKBh
	po9iAM/76/ol7bh6UpHK0SX1wq3B0AOhqXHXaB7iVH4szY8RxQIu2h+KrWZnG4+oMUmn
	GUCNDz52KhcA7pCVZFNyGZsU8D3Fnv0HweZf2myemo350TKMs2x5FSrLzxul4CMrMwIN
	v7CxVEMBJiAVposhPJVt5/Ky1D/a/6TiV3ytpIrOT9oozZdsWdKijrWe7SKIZaWHpW2d
	xVpA==
X-Received: by 10.68.248.98 with SMTP id yl2mr58891237pbc.41.1428625345185;
	Thu, 09 Apr 2015 17:22:25 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id u5sm196110pdu.57.2015.04.09.17.22.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 17:22:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
Date: Thu, 9 Apr 2015 17:22:22 -0700
Message-Id: <DEF0B711-0C4D-4AFB-8057-E981A06E7DAC@gmail.com>
References: <1428563457-15238-1-git-send-email-yi.zhao@windriver.com>
To: Yi Zhao <yi.zhao@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oeqa/selftest/bblayers: improve test for add-layer and remove-layer
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
X-List-Received-Date: Fri, 10 Apr 2015 00:22:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 9, 2015, at 12:10 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>=20
> Use absolute path instead of relative path for meta-skeleton.
> Otherwise the case would fail if the builddir outside the poky source
> tree.

may be you should say =E2=80=98OE-Core=E2=80=99 sources instead here.

>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
> meta/lib/oeqa/selftest/bblayers.py |    9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/bblayers.py =
b/meta/lib/oeqa/selftest/bblayers.py
> index 5b046d0..3a18029 100644
> --- a/meta/lib/oeqa/selftest/bblayers.py
> +++ b/meta/lib/oeqa/selftest/bblayers.py
> @@ -6,7 +6,7 @@ import shutil
>=20
> import oeqa.utils.ftools as ftools
> from oeqa.selftest.base import oeSelfTest
> -from oeqa.utils.commands import runCmd
> +from oeqa.utils.commands import runCmd, get_bb_var
> from oeqa.utils.decorators import testcase
>=20
> class BitbakeLayers(oeSelfTest):
> @@ -44,15 +44,16 @@ class BitbakeLayers(oeSelfTest):
>         self.assertTrue(find_in_contents)
>=20
>     def test_bitbakelayers_add_remove(self):
> +        test_layer =3D os.path.join(get_bb_var('COREBASE'), =
'meta-skeleton')
>         result =3D runCmd('bitbake-layers show-layers')
>         self.assertNotIn('meta-skeleton', result.output, 'This test =
cannot run with meta-skeleton in bblayers.conf')
> -        result =3D runCmd('bitbake-layers add-layer =
../meta-skeleton')
> +        result =3D runCmd('bitbake-layers add-layer %s' % test_layer)
>         result =3D runCmd('bitbake-layers show-layers')
>         self.assertIn('meta-skeleton', result.output)
> -        result =3D runCmd('bitbake-layers remove-layer =
../meta-skeleton')
> +        result =3D runCmd('bitbake-layers remove-layer %s' % =
test_layer)
>         result =3D runCmd('bitbake-layers show-layers')
>         self.assertNotIn('meta-skeleton', result.output)
> -        result =3D runCmd('bitbake-layers add-layer =
../meta-skeleton')
> +        result =3D runCmd('bitbake-layers add-layer %s' % test_layer)
>         result =3D runCmd('bitbake-layers show-layers')
>         self.assertIn('meta-skeleton', result.output)
>         result =3D runCmd('bitbake-layers remove-layer =
*/meta-skeleton')
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


