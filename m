Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B7EC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 10:47:20 +0000 (UTC)
Subject: Re: [PATCH] sstate: Consider .lock suffix for when loading sstate
 file from mirror
To: openembedded-core@lists.openembedded.org
From: "Manuel Leonhardt" <mleonhardt@arri.de>
X-Originating-Location: Munich, Bavaria, DE (88.217.121.203)
X-Originating-Platform: Mac Firefox 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Nov 2021 03:47:19 -0700
References: 
 <660173710f5a6356f152a2965134bbf0680c9927.camel@linuxfoundation.org>
In-Reply-To: 
 <660173710f5a6356f152a2965134bbf0680c9927.camel@linuxfoundation.org>
Message-ID: <14581.1635763639475667832@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="m1Gkq5xS080rMmn7YwjZ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 10:47:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157699

--m1Gkq5xS080rMmn7YwjZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I submitted a patch to fix bb.utils.lockfile to at least break the loop and=
 fail when a too long filename is passed with https://lists.openembedded.or=
g/g/bitbake-devel/message/12850

Nevertheless, you have a good point here: Fixing the code that constructs t=
he filename of the lock files would be the better solution. For the sstate =
files only lockfiles of .siginfo files can overlap, because the filename of=
 the actual sstate file is already 8 characters shorter than 255 characters=
. I have one though on that:

From what I have seen, the filename of lockfiles is mostly constructed by a=
ppending ".lock" without any further check. Truncating the filename of the =
lockfile inside bb.utils.lockfile could be confusing however, since the fun=
ction would not use the filename that is was explicitly passed. Hence, I gu=
ess bb.utils.lockfile should fail when a too long filename was passed, and =
the function building the lockfile's filename should ensure to keep it limi=
ted; that's bb.fetch2.FetchData.__init__ then if I'm not mistaken. Would yo=
u agree? Or would you say, changing the filename inside bb.utils.lockfile i=
s ok, as long as the function is working?

The drive-by fix I made with using limit instead of 254 when shortening the=
 filename is still correct and necessary, right?

Best,

Manuel

May I suggest two solutions here:

a) Let bb.utils.lockfile

--m1Gkq5xS080rMmn7YwjZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I submitted a patch to fix bb.utils.lockfile to at least break the loop and=
 fail when a too long filename is passed with <a href=3D"https://lists.open=
embedded.org/g/bitbake-devel/message/12850" target=3D"_blank" rel=3D"noopen=
er">https://lists.openembedded.org/g/bitbake-devel/message/12850</a><br /><=
br />Nevertheless, you have a good point here: Fixing the code that constru=
cts the filename of the lock files would be the better solution. For the ss=
tate files only lockfiles of .siginfo files can overlap, because the filena=
me of the actual sstate file is already 8 characters shorter than 255 chara=
cters. I have one though on that:<br /><br />From what I have seen, the fil=
ename of lockfiles is mostly constructed by appending ".lock" without any f=
urther check. Truncating the filename of the lockfile inside bb.utils.lockf=
ile could be confusing however, since the function would not use the filena=
me that is was explicitly passed. Hence, I guess bb.utils.lockfile should f=
ail when a too long filename was passed, and the function building the lock=
file's filename should ensure to keep it limited; that's bb.fetch2.FetchDat=
a.__init__ then if I'm not mistaken. Would you agree? Or would you say, cha=
nging the filename inside bb.utils.lockfile is ok, as long as the function =
is working?<br /><br />The drive-by fix I made with using limit instead of =
254 when shortening the filename is still correct and necessary, right?<br =
/><br />Best,<br /><br />Manuel<br /><br /><br />May I suggest two solution=
s here:<br /><br />a) Let bb.utils.lockfile

--m1Gkq5xS080rMmn7YwjZ--

