Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9EDB777FF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 06:21:10 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id j11so2381739ywa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fcUM2HtkeGiCht0Ml9wjSEBFBeM/xcIyItFfw6kj3cU=;
	b=EGNTT/vl80SXVazTVY/f74cBC1ydpnaZffLL2GkloafPrn/9in3rFs546vMDNuSQG1
	WlbppaPFw2Qm78cxbQp09ORUVQa+9Mxtkp+EVGfTsQQ2zuA1tgEUl3iRFeZ50RdkYPrz
	RDZjw7yCvHF4gyn1H5M0pv4fZ/coPVGIf1FoZLxMZOSPmB4M8gYjPcG5Ij/Vh6qoAl8K
	1T4YfKhwRAO7rQgh3Z0E88BrZ0VhnpT/4xvXBxuo5r/BIsVr3MUm8unGfyKbrqdgPTf0
	0vn4R4FvwD7rrTREkCc6A0GcJjcgUseQAVHjbXV50qq1Z6xWrmjANQozYomnPNXocZ7m
	0osQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fcUM2HtkeGiCht0Ml9wjSEBFBeM/xcIyItFfw6kj3cU=;
	b=bup9UH32N0J2sfpMD0FDOANK20gACCaB1ZYwff7qCkxzRq09YkC00+1y9uaVEfHLGd
	3VTxgSdEU5168F7/NZ2Eo5poss1+tEhLDFAT9hqd827GIbbyuQm3fyMMzezRuTQEIi25
	S7y2JMEoo5Rz77POnWciOBPrbuyLu5R1x3shLFC+J5eP8vsPxiU7F3pOZVNWp/S+4c1s
	FjflePQUeM8ZnuWOfPyYCigJ08Q3oH4sX3dPkt62PwkSx2U6rJMBlDdLzWeORm4cFrI9
	rWYzxVhYZvR0OXYBfWNZ0z2TZmbcOlJm9Qi/ORPlv6iL+4qPfGjs4FKapEPxYP2pobC2
	EPFQ==
X-Gm-Message-State: AKS2vOyoa9wNh+J1FOO2uIO3zAvdNn/VwYHkM228ZbXMq4Pm4366ZA47
	iLehIqmTtZTK7/49uqcbNaWZCXHDHg==
X-Received: by 10.129.0.198 with SMTP id 189mr1891738ywa.193.1497334871967;
	Mon, 12 Jun 2017 23:21:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Mon, 12 Jun 2017 23:21:11 -0700 (PDT)
In-Reply-To: <d5b89969-7833-d1a7-8685-71468968b93f@gmail.com>
References: <1490031500-38242-1-git-send-email-denis@denix.org>
	<20170421231816.GC20419@denix.org>
	<0fa0e630-137b-73ba-f212-0049b92e5199@gmail.com>
	<20170516215021.GO28053@denix.org>
	<d5b89969-7833-d1a7-8685-71468968b93f@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 13 Jun 2017 08:21:11 +0200
Message-ID: <CA+chaQeLNdfn5piAtuXnpEsO=z=qz=Vh-=_P10xOgBw1fZPxpg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Tue, 13 Jun 2017 06:21:12 -0000
Content-Type: multipart/alternative; boundary="001a11405446274ebd0551d1717a"

--001a11405446274ebd0551d1717a
Content-Type: text/plain; charset="UTF-8"

Unfortunately this nice change breaks quite common scenario when developers
have read-only mount of sstate mirror and this touch causes all _setscene
tasks to fail, because they fail to update atime on symlink which points to
read-only mount.

Please backport the fix for this as well ASAP:
http://git.openembedded.org/openembedded-core/commit/meta/classes/sstate.bbclass?id=b8f26c011d5ed888d85fef040bd821400d54c8fe

On Wed, May 17, 2017 at 1:05 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 05/16/2017 02:50 PM, Denys Dmytriyenko wrote:
>
>> On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:
>>
>>> On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:
>>>
>>>> Ping. It's been over a month now...
>>>>
>>> its in my stagging since 4/1.  The AB has been failing with my
>>> current changes.
>>>
>> Is morty now dead?
>>
>
> No. why do you say that? I just sent a pull request over the weekend for
> both Krogoth and Morty. Krogoth is the one heading to community supported
> now that Pyro is out.
>
> this changes is in the pull request
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commi
> t/meta/classes/sstate.bbclass?h=akuster/morty-next&id=838580
> 431a8923bf38820f10963aca4af51f6f97
>
> - armin
>
>
>
>>
>> On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:
>>>>
>>>>> From: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>>
>>>>> .siginfo files are not being accessed from local or NFS-mounted
>>>>> sstate mirrors when sstate package is installed, so their atime
>>>>> is not updated. If sstate mirror is cleaned based on access time,
>>>>> they get deleted, even though they are still being used.
>>>>>
>>>>> Updated atime of .siginfo symlinks with 'touch -a'. This command
>>>>> dereferences symlinks pointing to the local mirror and updates
>>>>> atime of the .siginfo file on the mirror.
>>>>>
>>>>> [YOCTO #10857]
>>>>>
>>>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>> ---
>>>>>   meta/classes/sstate.bbclass | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>>>>> index 8643f3d..4fdfcc8 100644
>>>>> --- a/meta/classes/sstate.bbclass
>>>>> +++ b/meta/classes/sstate.bbclass
>>>>> @@ -724,6 +724,8 @@ python sstate_sign_package () {
>>>>>   #
>>>>>   sstate_unpack_package () {
>>>>>         tar -xvzf ${SSTATE_PKG}
>>>>> +       # update .siginfo atime on local/NFS mirror
>>>>> +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>>>>>         # Use "! -w ||" to return true for read only files
>>>>>         [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
>>>>>         [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] ||
>>>>> touch --no-dereference ${SSTATE_PKG}.sig
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11405446274ebd0551d1717a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Unfortunately this nice change breaks quite common scenari=
o when developers have read-only mount of sstate mirror and this touch caus=
es all _setscene tasks to fail, because they fail to update atime on symlin=
k which points to read-only mount.<div><br></div><div>Please backport the f=
ix for this as well ASAP:<br><div><a href=3D"http://git.openembedded.org/op=
enembedded-core/commit/meta/classes/sstate.bbclass?id=3Db8f26c011d5ed888d85=
fef040bd821400d54c8fe">http://git.openembedded.org/openembedded-core/commit=
/meta/classes/sstate.bbclass?id=3Db8f26c011d5ed888d85fef040bd821400d54c8fe<=
/a><br></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Wed, May 17, 2017 at 1:05 AM, akuster808 <span dir=3D"ltr">&lt;<=
a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 05/16/2017 02:50 PM, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, Apr 24, 2017 at 09:08:55AM -0700, akuster808 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/21/2017 04:18 PM, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Ping. It&#39;s been over a month now...<br>
</blockquote>
its in my stagging since 4/1.=C2=A0 The AB has been failing with my<br>
current changes.<br>
</blockquote>
Is morty now dead?<br>
</blockquote>
<br>
No. why do you say that? I just sent a pull request over the weekend for bo=
th Krogoth and Morty. Krogoth is the one heading to community supported now=
 that Pyro is out.<br>
<br>
this changes is in the pull request<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/me=
ta/classes/sstate.bbclass?h=3Dakuster/morty-next&amp;id=3D838580431a8923bf3=
8820f10963aca4af51f6f97" rel=3D"noreferrer" target=3D"_blank">http://git.yo=
ctoproject.org/cg<wbr>it/cgit.cgi/poky-contrib/commi<wbr>t/meta/classes/sst=
ate.bbclass?<wbr>h=3Dakuster/morty-next&amp;id=3D838580<wbr>431a8923bf38820=
f10963aca4af51f<wbr>6f97</a><br>
<br>
- armin<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Mon, Mar 20, 2017 at 01:38:20PM -0400, Denys Dmytriyenko wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=
=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
<br>
.siginfo files are not being accessed from local or NFS-mounted<br>
sstate mirrors when sstate package is installed, so their atime<br>
is not updated. If sstate mirror is cleaned based on access time,<br>
they get deleted, even though they are still being used.<br>
<br>
Updated atime of .siginfo symlinks with &#39;touch -a&#39;. This command<br=
>
dereferences symlinks pointing to the local mirror and updates<br>
atime of the .siginfo file on the mirror.<br>
<br>
[YOCTO #10857]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
 target=3D"_blank">ed.bartosh@linux.intel.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=
=3D"_blank">denys@ti.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/sstate.bbclass | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 8643f3d..4fdfcc8 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -724,6 +724,8 @@ python sstate_sign_package () {<br>
=C2=A0 #<br>
=C2=A0 sstate_unpack_package () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tar -xvzf ${SSTATE_PKG}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS mirror<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; touch -=
a ${SSTATE_PKG}.siginfo<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use &quot;! -w ||&quot; to return true for re=
ad only files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -w ${SSTATE_PKG} ] || touch --no-dereferenc=
e ${SSTATE_PKG}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_P=
KG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig<br>
-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><span class=3D"HOEnZb"><font colo=
r=3D"#888888"><br>
</font></span></blockquote></blockquote><span class=3D"HOEnZb"><font color=
=3D"#888888">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></blockquote><span class=3D"HOEnZb"><font color=
=3D"#888888">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a11405446274ebd0551d1717a--
