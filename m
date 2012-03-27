Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCepg-0001ph-PJ
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 00:25:41 +0200
Received: by qao25 with SMTP id 25so532330qao.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 15:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Os587QeyFB+YUhJILzho9XqBMfxFIHLrOdCzKyVxeTA=;
	b=uwsSDBARW4Cuc6HE94SapvOZnjN9fjVvc5fgNbRrEZTzfkxLLVBJhpMju7KOs3ZJHE
	bySRE66Qfko2AGb1hvMLeRsX7NZ9APYSZxYjavPOv5WaOadKEtPl5fnFkWaHpwHJQUyg
	zzrQpB5Eyw8V22x0xmp0yMRGET41zOE1Z8lhlbzQbx9reIze4F9wisnr4rBvCXFF0mhV
	HAIRTDqoFiASEwzra3p+nlm74Xh1l+IcbJO12M/TWzhP2A/GII3e2PucDqXEvp+H27XB
	qzMjXXuPqjf1+Bnmk2wuKaIZwcF/E7SC1uaUggz0v43i8/iIiy80hT4ncI3ALyZkhheX
	03ag==
Received: by 10.224.182.201 with SMTP id cd9mr35205208qab.92.1332886599156;
	Tue, 27 Mar 2012 15:16:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 15:16:17 -0700 (PDT)
In-Reply-To: <4F723B78.2060308@windriver.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
	<CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
	<4F723618.6060104@windriver.com>
	<F4FE715B8B374104BDAF129362EBDD00@gmail.com>
	<4F723B78.2060308@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 15:16:17 -0700
X-Google-Sender-Auth: 7lpgwNsddT71LTBXFkzykvYYZ_I
Message-ID: <CABcZAN=-uE0_UkROO_abncN3m17Qxy=_kqo-Qg=L_pLNKJ99Hg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
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
X-List-Received-Date: Tue, 27 Mar 2012 22:25:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 3:13 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/27/12 4:57 PM, Christopher Larson wrote:
>>
>> On Tuesday, March 27, 2012 at 2:50 PM, Mark Hatle wrote:
>>>
>>> On 3/27/12 4:05 PM, Chris Larson wrote:
>>>
>>> On PowerPC TUNE_PKGARCH should be set to powerpc (or overriden by the
>>> machines).
>>> On PowerPC64, it should be set to powerpc64. If this is not happening
>>> that is
>>> the bug, lack of the default TUNE_PKGARCH. (based on the original
>>> implementation.)
>>
>>
>> I don't think your point of view is covering all the issues.
>>
>> The default TUNE_PKGARCH is
>> TUNE_PKGARCH_${TUNE_PKGARCH_tune-${DEFAULTTUNE}. If
>> arch-powerpc.inc sets TUNE_PKGARCH directly, as it used to, then all the
>> more
>> specific tunings won't have their TUNE_PKGARCH_tune-<tune> obeyed, which
>> was the
>> behavior prior to my submitting a patch which removed the explicit
>> TUNE_PKGARCH
>> override in arch-powerpc.inc.
>
>
> TUNE_PKGARCH_[override] should always replace TUNE_PKGARCH shouldn't it?
> =C2=A0Why isn't the override being obeyed is my issue. =C2=A0I really don=
't care much
> about the implementation other then originally I was told not to do that
> during various reviews.. and that the tuning (override) would always repl=
ace
> TUNE_PKGARCH.

No, it isn't an override. The way it obeys is through default values
in bitbake.conf. As arch-powerpc.inc would override that default
value, it would no longer obey it. To do what you want, you'd have to
rework how the tune-<tune> specific values are applied in the
implementation.

>> So we have two options. Either we override TUNE_PKGARCH directly in
>> arch-powerpc.inc again, thereby making powerpc tune- files like
>> tune-ppce500v2
>> not have their TUNE_PKGARCH_tune-<tune> obeyed (or those tune- files hav=
e
>> to
>> override TUNE_PKGARCH as well, which seems counter to the whole design o=
f
>> the
>> tuning implementation), or we add TUNE_PKGARCH_tune-<tune> definitions f=
or
>> the
>> generic tunings also.
>
>
> We need to be consistent as far as I'm concerned. =C2=A0If we want to add
> TUNE_PKGARCH_tune-<tune> to all of the tunings, and base architecture
> definitions that is fine. =C2=A0What I don't want is a mix of different w=
ays this
> stuff is implemented. =C2=A0It's already complicated enough for people to=
 look at
> and identify what is going on today with subtle differences between the
> files.
>
> If you can explain why the override isn't overriding the default
> TUNE_PKGARCH (and it's intentional and not a bug), and we can consistentl=
y
> modify all of the elements... I'm happy to accept the changes to all of t=
he
> tunings.

See above. It's not an override. And plenty of files already specify
TUNE_PKGARCH_tune-<tune>, so I don't see how it'd be inconsistent to
do so for the defaults, personally.
--=20
Christopher Larson


