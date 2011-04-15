Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QAjxj-0001SN-61
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 16:25:32 +0200
Received: by fxm19 with SMTP id 19so2198217fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2011 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Qy6dfmU8Td3fXpaz6r2+5I2YkwM8N0Ftls4nfj2d0lA=;
	b=o+P30642yQVQUwcxN7hWbVNhzTfATH4+jv61BLNsKNVPNeMhMCaNaqi1gYVgoW5Lgp
	W2dtInYHHKVk4B2TVMJGsRR4ak8UVBtCGc0th/iHQ2BiPcMxsLqgAoonNCMZrLMz6PJU
	48Tiwy5oI+duI5RsEBZAxt1/TVVYenIwaQaz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=G34MxDG5Ptf/BKIpMloV/62mSRIDAsRyL/IuF/rI4+tMDYd13+y9yzn+Bx/B4dRGee
	0ybr43YstdZRWsrFFh42X1Z8Fi+WRjJHvw/jisralVm1TeCUYMfWCjOYWU9nEIEFf2Fd
	zA7qdnaUKND5cdyGI1qyrK3xcqPVtH4Z6gXFQ=
Received: by 10.223.127.210 with SMTP id h18mr2158055fas.73.1302877389235;
	Fri, 15 Apr 2011 07:23:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Fri, 15 Apr 2011 07:22:38 -0700 (PDT)
In-Reply-To: <20110415091905.GC21398@qhe2-db>
References: <cover.1302686656.git.qing.he@intel.com>
	<b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
	<BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
	<20110414020059.GA21398@qhe2-db>
	<BANLkTi=Y454r0KQuorJM2HxUafA+Gkzmag@mail.gmail.com>
	<20110415091905.GC21398@qhe2-db>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Apr 2011 07:22:38 -0700
Message-ID: <BANLkTi=49f_wgzoB=rC23bJPC552s4jXrg@mail.gmail.com>
To: Qing He <qing.he@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Fri, 15 Apr 2011 14:25:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2011 at 2:19 AM, Qing He <qing.he@intel.com> wrote:
> On Thu, 2011-04-14 at 23:23 +0800, Khem Raj wrote:
>> > The reason to touch this part of code is that the test itself doesn't
>> > work for newer versions of GNU patch, see:
>> > ??http://lists.nongnu.org/archive/html/quilt-dev/2010-06/msg00002.html
>> > This surely fixes the configure error, but is logically not suitable f=
or
>> > cross compiling.
>>
>> As I understand you are trying to fix quilt target recipe. Then may it
>> will be better to take the above
>> patch for both target and native but apply this
>> workaround conditionally only for target recipe
>
> This was once backported, but subsequently reverted, see:
> =C2=A0http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3Dec740ac770=
d2124cbae1ab936d85b8343076c53b
>
> autoconf-native is not available at the point of quilt-native, so
> autoreconf is not desirable. This is also the reason for separation
> of quilt and quilt-native from the very beginning.


So you regenerate configure and add that to patch too along with .ac
file and then it should not regenerate it.

>
> Apart from that, the workaround is solely for target recipe.
>
>>
>> there are options --with-patch --with-diff also
>> there to point these utilities
>
> The problem still lies in cross building:
> =C2=A0--with-patch=3D${bindir}/patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at=
 build time, it's /usr/bin/patch
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which is =
host utility, if target
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}=
 /=3D /usr/bin, the file
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0may not e=
xist.
>
> =C2=A0--with-patch=3D${STAGING_BINDIR}/patch =C2=A0causes runtime error a=
s
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING=
_BINDIR} leaks into target scripts
>
> =C2=A0--with-patch=3Dpatch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0this may work, but may fail (in case
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the targe=
t scripts unset PATH)
>
> This is the problem of such tests without the concept of a target
> sysroot.
>


this is fine we can apply this conditionally for target recipe.

> Thanks,
> Qing
>


