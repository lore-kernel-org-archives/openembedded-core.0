Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7E39265D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 16:01:47 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so154915324wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=AkxAYlTT9Gu5oxxnAWOicrIwLHZEPLtIywqoz/kIxkg=;
	b=A7QbIfjvX8+9NsFKLjE0dmOxyf5HdAyq43og5iWAZWMdhyzf+D3OnLHZsvrkQoh3RK
	PYNfBpQEorAzDy+ph+881F1UDGlerJBUn8CENcHdPVLYM8XmDzlg+uVI7J3SuqzKa4Sg
	mrfqr/jsk7mN4de+s1jzVxukVXbI9n3s0Muq9wg90CkUkRJWAuWZEnIYHbK8nqFvi6zc
	S0hfdo2vuo4jI2PbrzRImwzGSx2xwD3JolqAT/cAYj8bwMKix4sPL1D/sO97ukXFbNNs
	rCqGjJzW/FFVw+csk50x+qVNdSM01CfvyxVlC/FhbTsPu+apKuZBSdGMcUNdeZsA+Qx5
	SXUg==
X-Received: by 10.194.201.130 with SMTP id ka2mr31017438wjc.123.1444665707756; 
	Mon, 12 Oct 2015 09:01:47 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	qh12sm4949389wic.20.2015.10.12.09.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Oct 2015 09:01:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
Date: Mon, 12 Oct 2015 18:01:45 +0200
Message-Id: <6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Mon, 12 Oct 2015 16:01:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
>>=20
>> On Oct 8, 2015, at 9:07 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>>=20
>>> Am 08.10.2015 um 16:46 schrieb Khem Raj <raj.khem@gmail.com>:
>>>=20
>>>=20
>>>> On Oct 8, 2015, at 7:33 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>>=20
>>>>=20
>>>> [Icedtee Ticket #2153] -- see =
http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D2153
>>>>=20
>>>> This patch prevents gcc generate code on ARM5e accessing 64 bit =
values, because gcc doesn't ensure they're 64 bit aligned.
>>>> Accessing a 64 bit value from a 32 bit alignment causes =
segmentation faults.
>>>>=20
>>>> Patch is taken from =
https://github.com/archlinuxarm/PKGBUILDs/blob/master/core/gcc/0001-ARMv5-=
disable-LDRD-STRD.patch
>>>=20
>>> Can you try using -mfix-cortex-m3-ldrd, does that help ?
>>=20
>> Well, I have a marvel-kirkwood - I'll give it a shot but don't know =
whether it works at all.
>>=20
>>> The patch is a workaround to gcc, as it seems real problem is in =
defining instruction constraints
>>> please open a gcc bug for this.
>>=20
>> Dunno whether I want to have all that stress. When neither ARCH linux =
guys did that nor Icedtea
>> maintainers, how could I succeed there?
>>=20
>> Best I can do is (if -mfix-cortex-m3-ldrd doesn't help), keep it =
private. When -mfix-cortex-m3-ldrd
>> helps, is adding it to ./meta/conf/machine/include/tune-arm926ejs.inc =
a sane approach?
>=20
> This might be OK. Although I would like to see it fixed in right way =
in gcc, we don=E2=80=99t want to carry patches
> that are not accepted upstream. We already have 60 odd patches and we =
should reduce them if possible.

I tried the approach applying -mfix-cortex-m3-ldrd to TUNE_CCARGS for =
armv5+dsp - and it generates
ldrd instructions anyway. Accepted upstream or not, I have no time to =
get the right upstream fix.

So I keep it private.

During hacking on the fix in meta/conf/machine/ I recognized that the =
expected thump suffix in meta/conf/machine/include/tune-arm926ejs.inc
isn't there and modified the line as

diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
index 335e4e0..a310c9d 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"arm926ejs", " -mtune=3Darm9
 AVAILTUNES +=3D "arm926ejs"
 ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"

Want to have a patch for that or shall I keep it private, too?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


