Return-Path: <omar.ocampo.coronado@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BC44D74601
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 20:40:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Aug 2018 13:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,439,1526367600"; d="scan'208";a="78200221"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2018 13:40:21 -0700
Received: from FMSMSX109.amr.corp.intel.com ([169.254.15.226]) by
	FMSMSX106.amr.corp.intel.com ([169.254.5.64]) with mapi id
	14.03.0319.002; Fri, 3 Aug 2018 13:40:20 -0700
From: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
To: Victor Kamensky <kamensky@cisco.com>, Andre McCurdy <armccurdy@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] package: skip strip on signed kernel modules
Thread-Index: AQHUK2a+3CJiVfx/AE2rN8L3VHpQcaSu710A//+MB5A=
Date: Fri, 3 Aug 2018 20:40:20 +0000
Message-ID: <0D62475714C01347BCA118AE7A61400376B38D06@FMSMSX109.amr.corp.intel.com>
References: <20180803230955.104596-1-omar.ocampo.coronado@intel.com>
	<alpine.LRH.2.00.1808031320270.50550@sjc-ads-6991.cisco.com>
In-Reply-To: <alpine.LRH.2.00.1808031320270.50550@sjc-ads-6991.cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjRjNDVhMmYtZTc1Mi00YThkLWFiNTUtNDg4M2I3NzY5NzUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUFZ4dDVMelA5QUV4Wjdmc2h3Z0p6Y1hIWUV4OHpsS2JnODlZXC8remhPbTNRZ2FRcjdPN3M3MDBFbEMrdWhnb0YifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: skip strip on signed kernel modules
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
X-List-Received-Date: Fri, 03 Aug 2018 20:40:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, we would like to keep the symbols on a signed kernel module.

Andre shared this link:  https://www.kernel.org/doc/html/v4.17/admin-guide/=
module-signing.html#signed-modules-and-stripping , from conversation topic:=
 Re: [OE-core] Strip kernel modules and signatures

-28 are the last 28 bytes of the file. The same amount of bytes are being r=
ead by dracut to check if a module is signed.
And you are correct Victor, I'm unsure if this would work outside x86 arch.=
=20

Two pending fixes:
    1) This patch also needs to fix the mode of the file as the original ma=
y not be preserved. =20
    2)  Seems like 'return' is not accepted by oe.utils.multiprocess, still=
 getting familiar with OE

-----Original Message-----
From: Victor Kamensky [mailto:kamensky@cisco.com]=20
Sent: Friday, August 3, 2018 3:28 PM
To: Ocampo Coronado, Omar <omar.ocampo.coronado@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] package: skip strip on signed kernel modules



On Fri, 3 Aug 2018, omar.ocampo.coronado@intel.com wrote:

> From: foocampo <omar.ocampo.coronado@intel.com>
>
> Executing strip action on kernel modules removes the signature.
> Is not possible to strip and keep the signature, therefore avoid strip=20
> signed kernel modules.
>
> Signed-off-by: foocampo <omar.ocampo.coronado@intel.com>
> ---
> meta/lib/oe/package.py | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py index=20
> fa3428ad61..f7d2d3b7c4 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -24,6 +24,9 @@ def runstrip(arg):
>
>     # kernel module
>     if elftype & 16:
> +        if is_kernel_module_signed(file):
> +            bb.debug(1, "Skip strip on signed module %s" % file)
> +            return

It does not look right to me. Above means that signed KLM will go into imag=
e with symbols. Or I don't read code correctly?

Where is signature stored? Is it some kind of an ELF NOTE? In this case you=
 would just need to drop only "--remove-section=3D.note"
from strip command. Wondering why .notes were stripped in the first place.

>         stripcmd.extend(["--strip-debug", "--remove-section=3D.comment",
>             "--remove-section=3D.note", "--preserve-dates"])

I suggest split above into two invocations and do second
stripcmd.extend(["--remove-section=3D.note"]) only for non signed modules.
Assuming that signature is in the .note section. If it is not .comment, do =
that with "--remove-section=3D.comment" instead.

>     # .so and shared library
> @@ -46,6 +49,13 @@ def is_kernel_module(path):
>     with open(path) as f:
>         return mmap.mmap(f.fileno(), 0,=20
> prot=3Dmmap.PROT_READ).find(b"vermagic=3D") >=3D 0
>
> +# Detect if .ko module is signed
> +def is_kernel_module_signed(path):
> +    with open(path, "rb") as f:
> +        f.seek(-28, 2)

Where magic -28 comes from? Is it true for all cases, all CPU arches?
I think it could be done more cleanly here.

Thanks,
Victor

> +        module_tail =3D f.read()
> +        return "Module signature appended" in "".join(chr(c) for c in=20
> + bytearray(module_tail))
> +
> # Return type (bits):
> # 0 - not elf
> # 1 - ELF
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

