Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62387CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 11:13:40 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2] wic: Fix updating fstab for nvme0n1
To: openembedded-core@lists.openembedded.org
From: "Aleksandar Nikolic" <aleksandar.nikolic010@gmail.com>
X-Originating-Location: Munich, Bavaria, DE (95.90.192.165)
X-Originating-Platform: Linux Firefox 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 22 May 2026 04:13:38 -0700
References: <20260522045949.184811-1-aleksandar.nikolic22@pm.me> <bfdbf0b936f46fe745b3cccdcb4e3f2173e8c8c6.camel@pbarker.dev>
In-Reply-To: <bfdbf0b936f46fe745b3cccdcb4e3f2173e8c8c6.camel@pbarker.dev>
Message-ID: <1741463.1779448418650687513@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="l0H7tURuIZhr4VUpHs81"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 11:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237543

--l0H7tURuIZhr4VUpHs81
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 12:53 PM, Paul Barker wrote:

>=20
> On Fri, 2026-05-22 at 06:59 +0200, Aleksandar Nikolic via
> lists.openembedded.org wrote:
>=20
>> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>>=20
>> In case wks file references nvme0n1, update_fstab() function creates wro=
ng
>> entries
>> in /etc/fstab, as it is not adding prefix 'p' before the partition numbe=
r
>> (at the
>> moment this happens only for mmcblk). This leads that entries in
>> /etc/fstab start
>> with:
>>=20
>> /dev/nvme0n11
>> /dev/nvme0n13
>>=20
>> instead with:
>>=20
>> /dev/nvme0n1p1
>> /dev/nvme0n1p3
>>=20
>> The patch fixes this as it extends the if condition and adds prefix 'p'
>> for
>> both mmcblk and nvme0n1.
>=20
> This is an interesting case for our backport policy, as wic is no longer
> embedded within OE-core on wrynose or master. However, I think this
> should be submitted against the standalone wic repository first (see the
> readme [1] for contributing instructions) and we should get feedback
> from the maintainer.

Yes, makes sense. I'll post a patch there as soon as I have added your sugg=
estions. When/if it gets accepted we can backport it to scarthgap and whinl=
atter.

>=20
> [1]: https://git.yoctoproject.org/wic/tree/README.md?h=3Dmaster
>=20
> This should also handle other NVMe devices beyond the first, what about
> /dev/nvme1n1? Or an NVMe device with a second namespace /dev/nvme1n2?

Thanks, will add your suggestions in the patch for the wic repository.

Cheers,
Aleksandar
>=20
> Best regards,
>=20
> --
> Paul Barker

--l0H7tURuIZhr4VUpHs81
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, May 22, 2026 at 12:53 PM, Paul Barker wrote:</div>
<div>
<blockquote>On Fri, 2026-05-22 at 06:59 +0200, Aleksandar Nikolic via<br />=
lists.openembedded.org wrote:<br />
<blockquote>From: Aleksandar Nikolic &lt;aleksandar.nikolic@zeiss.com&gt;<b=
r /><br />In case wks file references nvme0n1, update_fstab() function crea=
tes wrong entries<br />in /etc/fstab, as it is not adding prefix 'p' before=
 the partition number (at the<br />moment this happens only for mmcblk). Th=
is leads that entries in /etc/fstab start<br />with:<br /><br />/dev/nvme0n=
11<br />/dev/nvme0n13<br /><br />instead with:<br /><br />/dev/nvme0n1p1<br=
 />/dev/nvme0n1p3<br /><br />The patch fixes this as it extends the if cond=
ition and adds prefix 'p' for<br />both mmcblk and nvme0n1.</blockquote>
This is an interesting case for our backport policy, as wic is no longer<br=
 />embedded within OE-core on wrynose or master. However, I think this<br /=
>should be submitted against the standalone wic repository first (see the<b=
r />readme [1] for contributing instructions) and we should get feedback<br=
 />from the maintainer.</blockquote>
</div>
<div>Yes, makes sense. I'll post a patch there as soon as I have added your=
 suggestions. When/if it gets accepted we can backport it to scarthgap and =
whinlatter.</div>
<div>
<blockquote>[1]: <a href=3D"https://git.yoctoproject.org/wic/tree/README.md=
?h=3Dmaster" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.or=
g/wic/tree/README.md?h=3Dmaster</a><br /><br />This should also handle othe=
r NVMe devices beyond the first, what about<br />/dev/nvme1n1? Or an NVMe d=
evice with a second namespace /dev/nvme1n2?</blockquote>
Thanks, will add your suggestions in the patch for the wic repository.</div=
>
<div>&nbsp;</div>
<div>Cheers,</div>
<div>Aleksandar
<blockquote>Best regards,<br /><br />-- <br />Paul Barker</blockquote>
</div>

--l0H7tURuIZhr4VUpHs81--

