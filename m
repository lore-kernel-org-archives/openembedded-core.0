Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPl6U-0003Gv-3g
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 02:40:38 +0200
Received: by eye27 with SMTP id 27so503188eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=JkkJniAshtuIbv6QZIWBDqgHo8FAeJjykoeI6tQaoXM=;
	b=ePHQVKvbUfw2IrfY49qlTYGTVVCa4JIE7/PnpXQd/UZUDCM1S985BYVDtWVrCdOgHW
	MieOqYcYpMAjfeoiyoq6S53DbdOGzRJwRHOJQLNZXK26+26AQxXQkiP3A4M8/KWjPcmd
	lVQFWzI+nRo9PtenPouP96/1oDLPUAXdoC6VA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=AJlGU9dvzq19DN6sJKhG02/s2jmWAle+uGUvC5T7tu6Ijavvtlp78pI1Ok9nwlVDx2
	G+Smk1l0AccODUc1zpWgJQnx7ok6QipztjJ9Iz1SL6zY3jrgULrFjopLajpr4eqBnIuT
	AgM/Wv1SW7TRwuhOT/3ATnzY4HTjEUZPc2Iok=
Received: by 10.14.10.18 with SMTP id 18mr565039eeu.172.1306456653227; Thu, 26
	May 2011 17:37:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Thu, 26 May 2011 17:37:03 -0700 (PDT)
In-Reply-To: <1306452822.27470.220.camel@rex>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 May 2011 17:37:03 -0700
Message-ID: <BANLkTinP=ioZdAqSffASK6X2RUhkpdcR6w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 00:40:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2011 at 4:33 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-05-26 at 13:41 -0700, nitin.a.kamble@intel.com wrote:
>
>> ---
>> =C2=A0meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb | =C2=A0 =C2=A03 ++=
+
>> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recip=
es-graphics/mesa/mesa-xlib_7.10.2.bb
>> index b77df2c..051bd72 100644
>> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
>> @@ -17,3 +17,6 @@ PE =3D "1"
>> =C2=A0PR =3D "r0"
>>
>> =C2=A0EXTRA_OECONF +=3D "--with-driver=3Dxlib"
>> +
>> +# nullify -O2
>> +CFLAGS_append +=3D " -O"
>
> I talked about this on IRC but simply put, no way.
>
> The problem is:
>
> a) Arm specific
> b) determined now to be armv7 specific
> c) gcc version specific
>
> and the fix should reflect this.
>
> So ideally when we select gcc 4.6 in tcmode-default.inc we should add
> something there which adds a work around for mesa-xlib.
>
> I've suggested something like:
>
> TARGET_CC_ARCH_arm_pn-mesa-xlib :=3D "${@'${TARGET_CC_ARCH}'.replace('arm=
v7','armv5')}"
>
> which whilst ugly, should do what we need it to.
>

I agree with this solution however ugly it may look like. We may
document it to explain
the ugliness

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


