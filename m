Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoB4r-0005ST-Ty
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 12:20:26 +0200
Received: by ggnp4 with SMTP id p4so9202672ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=fKtg3hQSbrCbMHqtXz/wwxLSWrNmqR1TIVUt1dGNuR8=;
	b=TrWbdHyxV0+DN7RQ2QdFRpU++TTLiDQJM2AKxYPgeZzyAg8q/EX2exQDzGhDb9CdL5
	de/zb7uqEUqojMHfKZ/Uw+JBeUJClAKlZrCUXNGWLSwX8vk6Do0Qay1gqlxNkNfO65A8
	fCvytWef8TTa0i1O2YdNPU8Yq0Fp0Oa/kkyiCGMYJKdkAuxPe04MTZc1lr5fh1FTiui0
	MjfAYXiPNAYJS2DBRF0aASvQ/MSlMMd2uQ506MfESmKBkYSoJBTDCGSTBXtAUKT01z3H
	4ZDGnichl7gLy2fRcxnOvQGNm7Qi/s6dHX+DZc8rPSqMdKa5hWzoedK6g9oGvazb+GKV
	WeEg==
Received: by 10.50.40.193 with SMTP id z1mr8057309igk.0.1341828556134; Mon, 09
	Jul 2012 03:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 03:08:55 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FF5CFC2.9090700@intel.com>
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
	<alpine.DEB.2.02.1207040615500.23821@oneiric>
	<1341401390.3906.12.camel@ted> <4FF5289C.80107@gmail.com>
	<alpine.DEB.2.02.1207050607040.3303@oneiric>
	<4FF5CFC2.9090700@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 13:08:55 +0300
Message-ID: <CAK18fxGUJemnTiB8LmMn5br6Zj1=WAjnnP9iCJbjaa6U93=CZA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnHNCIVK/CyBq4spRpnVM6L+QtyJ1hz1TVZBQu0fhnw/rlh4KmkD6RhCpkJDC+qwyskfqwF
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Mon, 09 Jul 2012 10:20:26 -0000
Content-Type: multipart/alternative; boundary=14dae9340c4170180404c462ce1e

--14dae9340c4170180404c462ce1e
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 5, 2012 at 8:32 PM, Scott Garman <scott.a.garman@intel.com>wrote:

> On 07/05/2012 03:14 AM, Robert P. J. Day wrote:
>
>> On Wed, 4 Jul 2012, Khem Raj wrote:
>>
>>  -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 7/4/2012 4:29 AM, Richard Purdie wrote:
>>>
>>>>  AFAICT, you can't override an append. Both appends, the
>>>>>>>> original and the bbappended, would get executed.
>>>>>>>>
>>>>>>>
>>>>>> ok, now i *definitely* want to know whether this would work or
>>>>>> not since there are a few recipes that define both do_install()
>>>>>> and do_install_append().
>>>>>>
>>>>> Andreas is correct, you can't override a do_install_append (),
>>>> both would just get appended.
>>>>
>>>
>>> yes thats true. I was thinking about having appends which are
>>> recipe-class specific but that case wont apply to a normal _append
>>> like above
>>>
>>
>>    so, in the end. there's really no compelling rationale for a recipe
>> defining both a do_install() and do_install_append() back to back, is
>> that correct?  because there are a small number of OE recipes that do
>> just that:
>>
>> $ grep -wl do_install $(grep -rlw do_install_append *)
>> meta/recipes-support/libcap/**libcap.inc
>> meta/recipes-devtools/**e2fsprogs/e2fsprogs_1.42.1.bb
>> meta/recipes-core/tinylogin/ti**nylogin_1.4.bb <http://tinylogin_1.4.bb>
>> meta/recipes-core/eglibc/**eglibc-package.inc
>> meta/recipes-kernel/linux/**linux-yocto.inc
>> meta/recipes-extended/lsb/lsb_**1.4.bb <http://lsb_1.4.bb>
>> meta/recipes-extended/man/man_**1.6f.bb <http://man_1.6f.bb>
>> meta/recipes-extended/**logrotate/logrotate_3.8.1.bb
>> $
>>
>>    obviously, it doesn't hurt, it just seems unnecessary.
>>
>
> I wrote the do_install_append() in e2fsprogs, and it was no doubt due to
> the fact that I was moving libraries around in a number of recipes, and
> wanted to logically separate this operation into the _append step in a
> consistent manner. It was just a mindset I was in, and as you point out, it
> wasn't necessary, nor did it do much harm.
>
>
In my opinion this behavior makes sense for stuff that are
just temporary pulled in / aka workarounds.

@g

--14dae9340c4170180404c462ce1e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 5, 2012 at 8:32 PM, Scott Garman <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:scott.a.garman@intel.com" target=3D"_b=
lank">scott.a.garman@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

On 07/05/2012 03:14 AM, Robert P. J. Day wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, 4 Jul 2012, Khem Raj wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<br>
On 7/4/2012 4:29 AM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
AFAICT, you can&#39;t override an append. Both appends, the<br>
original and the bbappended, would get executed.<br>
</blockquote></blockquote>
<br>
ok, now i *definitely* want to know whether this would work or<br>
not since there are a few recipes that define both do_install()<br>
and do_install_append().<br>
</blockquote></blockquote>
Andreas is correct, you can&#39;t override a do_install_append (),<br>
both would just get appended.<br>
</blockquote>
<br>
yes thats true. I was thinking about having appends which are<br>
recipe-class specific but that case wont apply to a normal _append<br>
like above<br>
</blockquote>
<br>
=A0 =A0so, in the end. there&#39;s really no compelling rationale for a rec=
ipe<br>
defining both a do_install() and do_install_append() back to back, is<br>
that correct? =A0because there are a small number of OE recipes that do<br>
just that:<br>
<br>
$ grep -wl do_install $(grep -rlw do_install_append *)<br>
meta/recipes-support/libcap/<u></u>libcap.inc<br>
meta/recipes-devtools/<u></u>e2fsprogs/<a href=3D"http://e2fsprogs_1.42.1.b=
b" target=3D"_blank">e2fsprogs_1.42.1.bb</a><br>
meta/recipes-core/tinylogin/<a href=3D"http://tinylogin_1.4.bb" target=3D"_=
blank">ti<u></u>nylogin_1.4.bb</a><br>
meta/recipes-core/eglibc/<u></u>eglibc-package.inc<br>
meta/recipes-kernel/linux/<u></u>linux-yocto.inc<br>
meta/recipes-extended/lsb/<a href=3D"http://lsb_1.4.bb" target=3D"_blank">l=
sb_<u></u>1.4.bb</a><br>
meta/recipes-extended/man/<a href=3D"http://man_1.6f.bb" target=3D"_blank">=
man_<u></u>1.6f.bb</a><br>
meta/recipes-extended/<u></u>logrotate/<a href=3D"http://logrotate_3.8.1.bb=
" target=3D"_blank">logrotate_3.8.1.bb</a><br>
$<br>
<br>
=A0 =A0obviously, it doesn&#39;t hurt, it just seems unnecessary.<br>
</blockquote>
<br>
I wrote the do_install_append() in e2fsprogs, and it was no doubt due to th=
e fact that I was moving libraries around in a number of recipes, and wante=
d to logically separate this operation into the _append step in a consisten=
t manner. It was just a mindset I was in, and as you point out, it wasn&#39=
;t necessary, nor did it do much harm.<span class=3D"HOEnZb"><font color=3D=
"#888888"><br>

<br></font></span></blockquote><div><br></div><div>In my opinion this=A0beh=
avior=A0makes=A0sense=A0for stuff that are just=A0temporary=A0pulled in / a=
ka workarounds.=A0</div><div><br></div><div>@g</div></div>

--14dae9340c4170180404c462ce1e--
