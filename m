Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EFA166E7CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 15:04:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 07:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,861,1384329600"; d="scan'208";a="484737513"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 07:04:43 -0800
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 17 Feb 2014 15:04:42 +0000
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.84]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.202]) with mapi id
	14.03.0123.003; Mon, 17 Feb 2014 15:04:42 +0000
From: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] oe-selftest: Fixed "test_rm_old_image" that was outdated
Thread-Index: AQHPK/DdjpchUvkzhUOFUcZpmAR+nZq5iqpA
Date: Mon, 17 Feb 2014 15:04:41 +0000
Message-ID: <33115ABC4887814E8A92A08FBC93416B0A1DDC98@IRSMSX103.ger.corp.intel.com>
References: <1392653353-3395-1-git-send-email-corneliux.stoicescu@intel.com>
In-Reply-To: <1392653353-3395-1-git-send-email-corneliux.stoicescu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: Fixed "test_rm_old_image" that was outdated
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
X-List-Received-Date: Mon, 17 Feb 2014 15:04:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After a second look, this test case will always pass because the DATETIME v=
ariable will not give the correct date+time for the core-image-minimal that=
 was already built, so it will never find the image that it's looking for. =
Please ignore this patch, I will send an update as soon as I can.

Regards,
Corneliu

> -----Original Message-----
> From: Stoicescu, CorneliuX
> Sent: Monday, February 17, 2014 6:09 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Stoicescu, CorneliuX
> Subject: [PATCH] oe-selftest: Fixed "test_rm_old_image" that was outdated
>=20
> This test used the old format of IMAGE_LINK_NAME that used to contain
> DATETIME information.
> Now it uses IMAGE_LINK_NAME and DATETIME variables to determine the
> path to the image.
>=20
> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py
> index ef6579b..9a22c06 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -26,7 +26,8 @@ class ImageOptionsTests(oeSelfTest):
>          bitbake("core-image-minimal")
>          deploydir =3D get_bb_var("DEPLOY_DIR_IMAGE", target=3D"core-imag=
e-
> minimal")
>          imagename =3D get_bb_var("IMAGE_LINK_NAME", target=3D"core-image=
-
> minimal")
> -        oldimgpath =3D os.path.realpath(os.path.join(deploydir, imagenam=
e +
> ".ext3"))
> +        datetime =3D get_bb_var("DATETIME", target=3D"core-image-minimal=
")
> +        oldimgpath =3D os.path.realpath(os.path.join(deploydir, imagenam=
e + '-'
> + datetime + ".rootfs.ext3"))
>          self.append_config("RM_OLD_IMAGE =3D \"1\"")
>          bitbake("core-image-minimal")
>          self.assertFalse(os.path.exists(oldimgpath), msg=3D"Old image pa=
th still
> exists: %s" % oldimgpath)
> --
> 1.7.9.5


