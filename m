Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 12BC46A8BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 16:21:34 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so5008219obc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3PwHk2R6upUXoTXpzvXr47ehF0vw18ZVSiHQ0wb2Few=;
	b=EHbnl2UBnCWbhBnvq6cIzyzcmENhXX0/6/R9IFqEyP4Vi3dUeSjsRwzQGPWokdjEGr
	ppwKfPVpX5P3DSLLSU2OF+dGpSOmg4bUx0hdDljXILutUCfWeewmQgOzbj20tAoZY+nN
	VzGSsCV9PhBXlZT9QG9LgPkiPoGloAFKmJzynoef96kn9TqTNT4oeZCgbWug7OcWwh5I
	PDVQa2qnNjw8g5gDNEYFAjNQhjJF87AaXYpfZ4l9OJsDwP1IzXfmAmfS09yfl2mjxT2z
	JEN6pr5Avnk878hJ2V7Ij+RFLD4sP5oBqnglsysf+lpE87B8T1PC1OqewSUO7JLarcY4
	0sTA==
MIME-Version: 1.0
X-Received: by 10.182.247.100 with SMTP id yd4mr11129846obc.46.1370535694580; 
	Thu, 06 Jun 2013 09:21:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Thu, 6 Jun 2013 09:21:34 -0700 (PDT)
In-Reply-To: <CABcZAN=aMd0trknVT6r=omgrUeJ2hYDE3nUwBLiV65-gavPhug@mail.gmail.com>
References: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
	<4045582.lhqZLrdHub@helios>
	<CABcZAN=aMd0trknVT6r=omgrUeJ2hYDE3nUwBLiV65-gavPhug@mail.gmail.com>
Date: Thu, 6 Jun 2013 13:21:34 -0300
X-Google-Sender-Auth: 11SaIyAOc67sz6_CKG6sFRu97A4
Message-ID: <CAP9ODKorLm01A+z0d+OoLE_hHbP9sntP26txPXxDXcVr+b0ogg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linux kernel build dependency of 'bc'
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
X-List-Received-Date: Thu, 06 Jun 2013 16:21:34 -0000
Content-Type: multipart/alternative; boundary=089e01537dc63a933f04de7eb51f

--089e01537dc63a933f04de7eb51f
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 6, 2013 at 1:12 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Jun 6, 2013 at 9:08 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
>
>> On Thursday 06 June 2013 12:11:04 Otavio Salvador wrote:
>> > I got a build failure in my auto builder; it has a very lean system
>> install
>> > and it spot something it is new for me. It seems the kernel now depends
>> on
>> > 'bc' util.
>> >
>> > I tried to find a 'bc-native'  and couldn't find so I'd like to know if
>> it
>> > is a known issue and if someone is already working in a 'bc-native'
>> recipe
>> > to proper fix the issue.
>>
>> We used to have bc in our list of required host packages in the Yocto
>> Project
>> quick start guide, but after some testing a few versions ago I removed it
>> because it didn't seem to be needed. FWIW I don't have it installed on my
>> primary build machine and I haven't noticed any problems as a result.
>>
>> Rather than creating bc-native I think we should find out where the
>> dependency
>> on bc exists and try to patch it out (if practical); if it really is
>> needed
>> and too hard to remove, we can just add bc to the list of required host
>> packages. I hope that's not the case though.
>>
>
> Apparently Peter Anvin added use of bc to avoid the dependency on perl.
> Multiple other distros got bit by this added dep (gentoo, linux from
> scratch, etc). Rob Landley was not too happy about it (he had perl removal
> patches for the kernel which didn't require bc):
>
> "The perl removal patches are finally upstream! But Peter Anvin's quest to
> unnecessarily complicate the kernel build continues, he replaced one with
> "bc" which is a turing-complete programming language that's so seldom used
> busybox hasn't got it. His patch broke Linux From Scratch (they had to add
> bc to chapter 5; in the past 12 years it's never been there). I have no
> idea _why_ he did this since the C implementation I contributed was
> actually smaller and simpler than what he wrote. Oh well."
>

I think it is easier to have bc-native;  this avoids one host dependency
and allow for update on it if need.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e01537dc63a933f04de7eb51f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jun 6, 2013 at 1:12 PM, Chris Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div><div class=3D"h5"><div class=3D"gmail_quote">On Thu, Jun 6, 2013 at 9:=
08 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@=
linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</s=
pan> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden"><div>On Thursday 06 June 20=
13 12:11:04 Otavio Salvador wrote:<br>



&gt; I got a build failure in my auto builder; it has a very lean system in=
stall<br>
&gt; and it spot something it is new for me. It seems the kernel now depend=
s on<br>
&gt; &#39;bc&#39; util.<br>
&gt;<br>
&gt; I tried to find a &#39;bc-native&#39; =A0and couldn&#39;t find so I&#3=
9;d like to know if it<br>
&gt; is a known issue and if someone is already working in a &#39;bc-native=
&#39; recipe<br>
&gt; to proper fix the issue.<br>
<br>
</div>We used to have bc in our list of required host packages in the Yocto=
 Project<br>
quick start guide, but after some testing a few versions ago I removed it<b=
r>
because it didn&#39;t seem to be needed. FWIW I don&#39;t have it installed=
 on my<br>
primary build machine and I haven&#39;t noticed any problems as a result.<b=
r>
<br>
Rather than creating bc-native I think we should find out where the depende=
ncy<br>
on bc exists and try to patch it out (if practical); if it really is needed=
<br>
and too hard to remove, we can just add bc to the list of required host<br>
packages. I hope that&#39;s not the case though.</div></blockquote></div><b=
r></div></div>Apparently Peter Anvin added use of bc to avoid the dependenc=
y on perl. Multiple other distros got bit by this added dep (gentoo, linux =
from scratch, etc). Rob Landley was not too happy about it (he had perl rem=
oval patches for the kernel which didn&#39;t require bc):</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">&quot;The p=
erl removal patches are finally upstream! But Peter Anvin&#39;s quest to un=
necessarily complicate the kernel build continues, he replaced one with &qu=
ot;bc&quot; which is a turing-complete programming language that&#39;s so s=
eldom used busybox hasn&#39;t got it. His patch broke Linux From Scratch (t=
hey had to add bc to chapter 5; in the past 12 years it&#39;s never been th=
ere). I have no idea _why_ he did this since the C implementation I contrib=
uted was actually smaller and simpler than what he wrote. Oh well.&quot;</d=
iv>
</div></blockquote><div><br></div><div style>I think it is easier to have b=
c-native; =A0this avoids one host dependency and allow for update on it if =
need.</div><div>=A0</div></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--089e01537dc63a933f04de7eb51f--
