Return-Path: <bero@lindev.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEF6C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 01:39:22 +0000 (UTC)
Subject: Re: [PATCH] gcc: Fix tm.h plugin header
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?QmVybmhhcmQgUm9zZW5rcsOkbnplcg==?= <bero@lindev.ch>
X-Originating-Location: =?utf-8?b?V8O8cnpidXJnLCBCYXZhcmlhLCBERSAoODcuMTIy?=
 =?utf-8?b?LjIwNC4yMTcp?=
X-Originating-Platform: Linux Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 19 Dec 2021 17:39:18 -0800
References: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
In-Reply-To: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
Message-ID: <28190.1639964358069173094@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7gsuJnOzocGRvs2zbsbo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 01:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159853

--7gsuJnOzocGRvs2zbsbo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:

>=20
> On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:
>=20
>> On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.com> wrote=
:
>>=20
>>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>>=20
>>> On x86-64, tm.h (needed to build gcc plugins) tries to include
>>> config/i386/linux64.h, which isn't installed. Fortunately it also isn't
>>> used, so simply removing the include statement is an ok fix.
>>=20
>> is it due to multilib support ? if so we might be ok since we may not
>> be using it
>> but really it will be good to check it with multilib builds of x86_64/x8=
6
>=20
> I don't think it is related to multilib but I'll give multilib a try. In
> my case, the issue was revealed when compiling a kernel plugin config. I
> can't remember right now which one but I can replicate it for logs.

Hi,
I've had a closer look at the problem, and can confirm the patch doesn't br=
eak even in multilib setups.

The problem is that in a non-multilib setup, the config/i386/linux64.h head=
er is not generated, but tm.h tries to include it nevertheless, causing any=
 gcc plugin that #includes tm.h (such as all the gcc plugins in the kernel =
-- tm.h is included by scripts/gcc-plugins/gcc-common.h) to fail to build.
An alternative fix would be adding
mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config/i386
touch=C2=A0${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config/i3=
86/linux64.h
(creating the file if it isn't there) instead. This would make sure that in=
 cases where config/i386/linux64.h does exist, it doesn't get removed from =
tm.h (potentially fixing plugins that reference any of the #defines in i386=
/linux64.h without including the file manually -- but I have yet to see any=
 such plugin).

I will try to get a better fix (not adding the include statement to tm.h in=
 the first place rather than having to remove it later in install scripts) =
upstream, but in the mean time, the patch fixes our builds before the bette=
r fix is ready/applied.

ttyl
bero

--7gsuJnOzocGRvs2zbsbo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:<br />
<blockquote>On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:<br />
<blockquote>On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan &lt;andrei@gherza=
n.com&gt; wrote:<br />
<blockquote>From: Andrei Gherzan &lt;andrei.gherzan@huawei.com&gt;<br /><br=
 />On x86-64, tm.h (needed to build gcc plugins) tries to include<br />conf=
ig/i386/linux64.h, which isn't installed. Fortunately it also isn't<br />us=
ed, so simply removing the include statement is an ok fix.</blockquote>
is it due to multilib support ? if so we might be ok since we may not<br />=
be using it<br />but really it will be good to check it with multilib build=
s of x86_64/x86</blockquote>
I don't think it is related to multilib but I'll give multilib a try. In my=
 case, the issue was revealed when compiling a kernel plugin config. I can'=
t remember right now which one but I can replicate it for logs.</blockquote=
>
Hi,<br />I've had a closer look at the problem, and can confirm the patch d=
oesn't break even in multilib setups.<br /><br />The problem is that in a n=
on-multilib setup, the config/i386/linux64.h header is not generated, but t=
m.h tries to include it nevertheless, causing any gcc plugin that #includes=
 tm.h (such as all the gcc plugins in the kernel -- tm.h is included by scr=
ipts/gcc-plugins/gcc-common.h) to fail to build.<br />An alternative fix wo=
uld be adding<br />mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/=
include/config/i386<br />touch&nbsp;${D}${libdir}/gcc/${TARGET_SYS}/${BINV}=
/plugin/include/config/i386/linux64.h<br />(creating the file if it isn't t=
here) instead. This would make sure that in cases where config/i386/linux64=
.h does exist, it doesn't get removed from tm.h (potentially fixing plugins=
 that reference any of the #defines in i386/linux64.h without including the=
 file manually -- but I have yet to see any such plugin).<br /><br />I will=
 try to get a better fix (not adding the include statement to tm.h in the f=
irst place rather than having to remove it later in install scripts) upstre=
am, but in the mean time, the patch fixes our builds before the better fix =
is ready/applied.<br /><br />ttyl<br />bero

--7gsuJnOzocGRvs2zbsbo--

