Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S52Zg-0001pX-To
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 23:09:41 +0100
Received: by lagw12 with SMTP id w12so6842515lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 14:01:04 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.111.229 as permitted sender) client-ip=10.152.111.229; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.111.229 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.111.229])
	by 10.152.111.229 with SMTP id il5mr23460490lab.19.1331071264661
	(num_hops = 1); Tue, 06 Mar 2012 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Y2PchpZh6jLLuRLfMzFBmHa8aTOvveAWNGkIwsB4s8s=;
	b=EdgQzF2RxWjj0QPe7aVY5qq5WDLL27X7/CZqwSt6I5bUoJkshgzhT1hkJwlozJ328o
	ypV5KaDu7hscsPXQV0bdFDI9On/L1KWqOjmH7ckTpQ2hprpKW7E5LttIDpUGV/Kkgxv3
	7W5HSrJCtzsilKk8xFD3UD3rcsB60Wff5lH2HqIjFmrgzo5kRJHJWzGsVbX2BjqXqRGI
	c9X+cb8FRxEoJHDibQZ9TzkS8b9lJPgTXgZyM3yzqDgNXZnVVr06KHxnoKkfEKukSlRn
	53wWW0j+mHqXCO4GhlIiu+oxuAf6PS5ChZYYmmn1D9a88OkyoQ3DQwA+iASLyscp1N8b
	6NBw==
Received: by 10.152.111.229 with SMTP id il5mr19223260lab.19.1331071264516;
	Tue, 06 Mar 2012 14:01:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 6 Mar 2012 14:00:34 -0800 (PST)
In-Reply-To: <4F567B1E.5060003@opendreambox.org>
References: <cover.1331053126.git.sgw@linux.intel.com>
	<b00d6f957a3ac9bcdab9dda1e887ad36b3bab852.1331053126.git.sgw@linux.intel.com>
	<4F567B1E.5060003@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Mar 2012 14:00:34 -0800
Message-ID: <CAMKF1sqUrHRtimHT8fH38zJKoE0_0XtKi5Q8apLudM7K5nKmOA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 17/20] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Tue, 06 Mar 2012 22:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 1:01 PM, Andreas Oberritter <obi@opendreambox.org> w=
rote:
> On 06.03.2012 18:03, Saul Wold wrote:
>> From: Koen Kooi <koen@dominion.thruhere.net>
>>
>> As usual, this creates problems for upgrade paths, but splitting out the=
 lib is worth the short term hassle
>
> Sorry, if I'm missing the obvious, but how is this different than the
> patch I submitted to do the same thing with bzip2 and libbz2, which got
> rejected by Koen?
>
> See http://patches.openembedded.org/patch/22015/ .
>

yes they are doing same things for different recipes. I think
now that we use OEBasicHash it should do rebuilds of dependencies
but for feeds it still needs the PR bumps that holds true for
both the recipes. It could be that one has less dependencies
than the other.

> Regards,
> Andreas
>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> =C2=A0meta/recipes-extended/xz/xz_5.0.3.bb | =C2=A0 =C2=A09 ++++++++-
>> =C2=A01 files changed, 8 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extende=
d/xz/xz_5.0.3.bb
>> index bae71ec..e8f96b6 100644
>> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
>> +++ b/meta/recipes-extended/xz/xz_5.0.3.bb
>> @@ -14,8 +14,15 @@ SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
>> =C2=A0SRC_URI[md5sum] =3D "fefe52f9ecd521de2a8ce38c21a27574"
>> =C2=A0SRC_URI[sha256sum] =3D "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee=
3908a8e5b392b8f09681bf"
>>
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =C2=A0inherit autotools gettext
>>
>> +PACKAGES =3D+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
>> +
>> +FILES_liblzma =3D "${libdir}/liblzma*${SOLIBS}"
>> +FILES_liblzma-dev =3D "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDE=
V} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
>> +FILES_liblzma-staticdev =3D "${libdir}/liblzma.a"
>> +FILES_liblzma-dbg =3D "${libdir}/.debug/liblzma*"
>> +
>> =C2=A0BBCLASSEXTEND =3D "native"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


