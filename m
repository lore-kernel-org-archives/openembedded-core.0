Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 70EA9731CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 19:59:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 12:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,546,1464678000"; d="scan'208";a="1044389509"
Received: from jzhang80-mac02.jf.intel.com ([10.24.1.231])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2016 12:59:44 -0700
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
In-Reply-To: <1471620578.16712.45.camel@linuxfoundation.org>
Date: Fri, 19 Aug 2016 12:59:42 -0700
Message-Id: <2EA0E17F-9402-4909-9017-B83DB2C525FA@linux.intel.com>
References: <1471620578.16712.45.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: "Zhang, Jianxun" <jianxun.zhang@intel.com>,
	"saul.wold" <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parselogs: Ignore uvesafb timeouts
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
X-List-Received-Date: Fri, 19 Aug 2016 19:59:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Aug 19, 2016, at 8:29 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> We're periodically seeing uvesafb timeouts on the autobuilder. =
Whitelist these
> errors as there is little it seems we can do about them and we =
therefore
> choose to ignore them rather than fail the builds.
>=20
> [YOCTO #8245]
>=20
> There is a better solution proposed in the bug with a -1 timeout =
however
> this avoids failed builds until such times as that is implemented.
I am working on the -1 timeout patch. It could take another several days =
for dev and validation in next week.

Please just go ahead to merge this for any urgency. Refer to my inline =
clarification too.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/lib/oeqa/runtime/parselogs.py =
b/meta/lib/oeqa/runtime/parselogs.py
> index 1cfe804..777af57 100644
> --- a/meta/lib/oeqa/runtime/parselogs.py
> +++ b/meta/lib/oeqa/runtime/parselogs.py
> @@ -63,6 +63,9 @@ qemux86_common =3D [
>     "fail to add MMCONFIG information, can't access extended PCI =
configuration space under this bridge.",
>     "can't claim BAR ",
>     'amd_nb: Cannot enumerate AMD northbridges',
> +    'uvesafb: 5000 ms task timeout error=E2=80=99,
This line will be whitelisted even when the -1 timeout patch is in =
because we cannot fix bandwidth issue on AB server and still wanna keep =
this log visible as heads up.
> +    'detected fb_set_par error, error code: -22',
> +    'uvesafb: mode switch failed=E2=80=99\
These errors from callers should not be whitelisted with the -1 timeout =
patch. Once we have that patch merged, they are still valid errors to =
indicate a non-timeout root case, or that patch doesn=E2=80=99t do the =
expected job. The problem of whitelisting  is we could miss other cases =
in call chains, or cover other root causes of a same error. This is =
another variant:

[  126.670550] uvesafb: 5000 ms task timeout error
[  126.673310] uvesafb: Getting VBE info block failed (eax=3D0x4f00, =
err=3D1)
[  126.673684] uvesafb: vbe_init() failed with -22

(bz8245 comment #23)

You may want to add =E2=80=9CGetting VBE..=E2=80=9D lines in this patch =
too, just don=E2=80=99t be confused when seeing another new uncaught =
variant.



> ] + common_errors
>=20
> ignore_errors =3D {=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


