Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U0ecA-0007Kh-7e
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 21:50:41 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so1447178lab.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 12:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=kra913q1HifVy0GYv5sAiYP8bg0SM5BzuXw6/GBq3fI=;
	b=mPz0yAjOfXi3AI3Ntkw8/oT7XLhb6GMimI3UXMfHWc+xkZO83p4t6hQHxI+sSlJOrJ
	E+/KtT/IJerZ0Y9KtIxtRfFi+hiln1HqjYQvH6KJW3+iAh+95Rk5Zx5Odqawu/uVHaOM
	RJEEJBE5H5aFUPlv0vXgJDHp4crEPNEOsR9xu2eRDMKHoDoR1aZa4SDdadT+/b9Cu9vv
	hGlk9TiRXR9j50Anl62fAgzF5ROecHOmQFKkUanaWqXhGdb48FQJ+C4jUA/xR6Ch9qYq
	GoSre2sRkGo0nMk63J6bpnrq6AlNiwMA1RmHsief+Z5cK2oWB1SLtIa7ojdnwIY5y/xX
	8izg==
X-Received: by 10.112.28.65 with SMTP id z1mr2406911lbg.119.1359578096272;
	Wed, 30 Jan 2013 12:34:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 30 Jan 2013 12:34:34 -0800 (PST)
In-Reply-To: <CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 30 Jan 2013 13:34:34 -0700
X-Google-Sender-Auth: 1XqwYchvAbFtc5ZjP1efdOhZ1X4
Message-ID: <CABcZAN=urVqvHFj_EkRXfkDUpbNb51Lr7taPWiPYXqqU__Cigw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 20:50:42 -0000
Content-Type: multipart/alternative; boundary=bcaec554d9d679069b04d48771d4

--bcaec554d9d679069b04d48771d4
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 30, 2013 at 1:34 PM, Chris Larson <clarson@kergoth.com> wrote:

>
> On Wed, Jan 30, 2013 at 1:27 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:
>
>> On Tue, 29 Jan 2013, Martin Jansa wrote:
>>
>> ... snip ...
>>
>> > It would be better to change SRCREV to hash corresponding to that
>> > tag and move tag only to comment above SRCREV. Such patch could be
>> > applied in upstream...
>>
>>   which brings up a larger issue ... what is the *preferred* way of
>> doing this if one was writing a style guide?  i understand developers
>> might like to set git SRCREV variables to meaningful tag names but, as
>> i've learned, that really screws up the possibility of building with
>> no network.  as it is, quite a few recipes set SRCREV to a hash ID for
>> *precisely* that reason and, in a short comment above (as you say),
>> mention the tag it corresponds to.
>>
>>   which brings me to what caused this annoyance in the first place --
>> the meta-ti layer, which has only four recipes that use
>>
>>   SRCREV = <tag name>
>>
>> so it wouldn't be that hard to submit a patch to adjust those, but
>> then there's this in
>> meta-ti/recipes-kernel/linux/linux-keystone_3.6.6.bb:
>>
>> # The tree tends to rebase, use literal stable tags
>> SRCREV = "DEV.MCSDK-03.06.06.07"
>>
>>   uh ... correct me if i'm wrong but isn't it in unspeakably bad taste
>> to rebase commits that have already been published?
>>
>>   in any event, can it be considered bad form to set SRCREV to git tag
>> names?  thoughts?
>>
>
> It's worth bringing up the SRCREV_POLICY variable, which lets you control
> how bitbake handles caching of srcrevs. By default, it figures it needs to
> get the mapping every time (value == clear, or unset), which can make sense
> in certain cases. But you can tell it to go ahead and use the values it has
> cached from a previous run, as well (value == cache). This can be useful if
> you know you're moving into an offline state and want to prepare for it
> above and beyond the -c fetchall.


Erm, s/SRCREV_POLICY/BB_SRCREV_POLICY/
-- 
Christopher Larson

--bcaec554d9d679069b04d48771d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 30, 2013 at 1:34 PM, Chris Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"adM"><div class=3D"h5"><br><di=
v class=3D"gmail_quote">On Wed, Jan 30, 2013 at 1:27 PM, Robert P. J. Day <=
span dir=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_bl=
ank">rpjday@crashcourse.ca</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Tue, 29 Jan 2013, Martin Jansa wrote=
:<br>
<br>
</div>... snip ...<br>
<div><br>
&gt; It would be better to change SRCREV to hash corresponding to that<br>
&gt; tag and move tag only to comment above SRCREV. Such patch could be<br>
&gt; applied in upstream...<br>
<br>
</div>=C2=A0 which brings up a larger issue ... what is the *preferred* way=
 of<br>
doing this if one was writing a style guide? =C2=A0i understand developers<=
br>
might like to set git SRCREV variables to meaningful tag names but, as<br>
i&#39;ve learned, that really screws up the possibility of building with<br=
>
no network. =C2=A0as it is, quite a few recipes set SRCREV to a hash ID for=
<br>
*precisely* that reason and, in a short comment above (as you say),<br>
mention the tag it corresponds to.<br>
<br>
=C2=A0 which brings me to what caused this annoyance in the first place --<=
br>
the meta-ti layer, which has only four recipes that use<br>
<br>
=C2=A0 SRCREV =3D &lt;tag name&gt;<br>
<br>
so it wouldn&#39;t be that hard to submit a patch to adjust those, but<br>
then there&#39;s this in<br>
meta-ti/recipes-kernel/linux/<a href=3D"http://linux-keystone_3.6.6.bb" tar=
get=3D"_blank">linux-keystone_3.6.6.bb</a>:<br>
<br>
# The tree tends to rebase, use literal stable tags<br>
SRCREV =3D &quot;DEV.MCSDK-03.06.06.07&quot;<br>
<br>
=C2=A0 uh ... correct me if i&#39;m wrong but isn&#39;t it in unspeakably b=
ad taste<br>
to rebase commits that have already been published?<br>
<br>
=C2=A0 in any event, can it be considered bad form to set SRCREV to git tag=
<br>
names? =C2=A0thoughts?<div><div></div></div></blockquote></div><br></div></=
div>It&#39;s worth bringing up the SRCREV_POLICY variable, which lets you c=
ontrol how bitbake handles caching of srcrevs. By default, it figures it ne=
eds to get the mapping every time (value =3D=3D clear, or unset), which can=
 make sense in certain cases. But you can tell it to go ahead and use the v=
alues it has cached from a previous run, as well (value =3D=3D cache). This=
 can be useful if you know you&#39;re moving into an offline state and want=
 to prepare for it above and beyond the -c fetchall.</blockquote>

</div><br>Erm, s/SRCREV_POLICY/BB_SRCREV_POLICY/<br>-- <br>Christopher Lars=
on</div></div>

--bcaec554d9d679069b04d48771d4--
