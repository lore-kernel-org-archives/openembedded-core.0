Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <3be0df41af485685253bd0ed79396fd136c210e6.camel@linuxfoundation.org>
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 24 Mar 2022 22:20:37 +0000
In-Reply-To: <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
References: <20220322211949.7423-1-fntoth@gmail.com>
	 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
	 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
	 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
	 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
	 <9c616e34-d31b-dcab-657a-268698d34150@gmail.com>
	 <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-EVJiuUdYIZHFm4Hs02LU"
List-id: <openembedded-core.lists.openembedded.org>
To: Ferry Toth <fntoth@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>

--=-EVJiuUdYIZHFm4Hs02LU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 2022-03-24 at 23:11 +0100, Ferry Toth wrote:
> Op 24-03-2022 om 16:36 schreef Ferry Toth:
> > Op 24-03-2022 om 13:03 schreef Richard Purdie:
> > > On Thu, 2022-03-24 at 12:23 +0100, Ferry Toth wrote:
> > > > > On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
> > > > > > I forgot to add a cover letter, sorry for that. The 2 patches  together
> > > > > > implement DEB repository signing.
> > > > > > 
> > > > > > This is necessary since Gatesgarth |apt| (1.8.2) has become more strict
> > > > > > and doesn’t allow unsigned repositories by default.
> > > > > > 
> > > > > > It is possible to override this behavior |but||| is more work then to
> > > > > > enable signed DEB repositories. These patches makes DEB a first class
> > > > > > citizen as IPK and RPM.
> > > > > > 
> > > > > > Patches have been in use in meta-intel-edison since Gatesgarth, see
> > > > > > https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-
> > > > > > repository.html\
> > > > > What puzzles me is that we can build root filesystems using apt, we test
> > > > > this on
> > > > > the autobuilder. Saying repositories are broken since gatesgarth therefore
> > > > > seems
> > > > > confusing in the commit message.
> 
> The Development Task manual in 3.22.4.3.3 names it a repository, as I 
> believe is common for a distributions server holding pre-built packages. 
> But I could change the name to package feed if that would be better.
> 
> What I meant to say is that apt requires signed package feeds since 
> 1.8.2 and disabling that is a workaround.

I mean to distinguish between the use of repositories at rootfs creation time
compared to repositories used later to update an image. Since I know
repositories are used to build the rootfs, the commit message did confuse me at
first since rootfs construction works.



> 
> > > > Good question. When I (meta-intel-edison) build the rootfs using DEB's it just
> > > > works.
> > > > Could it be that during rootfs build dpkg is used and not apt? I think I have
> > > > seen that in the logs.
> > > It definitely uses apt.
> Checking logs I see you are correct.
> > > > Of course apt uses dpkg to install a package as well, but it refuses to
> > > > download the package from a repo when it's not signed.
> > > Perhaps the difference is the packages are local and not remote?
> 
> No, for generating the rootfs it appears the sources list file has:
> 
> deb [trusted=yes] file:/path.../oe-rootfs-repo/edison/ ./
> 
> So apparently has been taken care by disabling the signing requirement. 
> [trusted=yes] is part of that workaround.

That does give another way to work around this then...


> 
> > > > > I guess we must configure apt to override that during the rootfs process and
> > > > > likely an end user with a remote feed could do the same, possibly with a
> > > > > warning
> > > > > from apt?
> Yes. But it is a pain to google to find how to do that.
> > > >   I believe there is no issue during rootfs generation.
> > > >   
> > > > > I'm also worried that there isn't any automated testing of this change. The
> > > > > reason I worry is that since we don't show any testing failures right now,
> > > > > there
> > > > > is clearly a hole in our automated testing coverage and there is no
> > > > > guarantee
> > > > > that this feature will keep working. It is these smaller corner case issues
> > > > > which tend to make or break the project's experience as if a feature is
> > > > > present,
> > > > > people expect it to work. Can we improve the testing situation?
> > > > It doesn't seem to be a particularly volatile area in the code. I refreshed
> > > > Xavier's patches for Gatesgarth, and am actively using unchanged patch on
> > > > Honisiter.
> > > > I don't know how the automated testing is working but I guess for RPM a repo
> > > > is generated using a small layer? And then tested on a qemu running the
> > > > rootfs?
> > > > Should be almost same for deb/apt, maybe could be modified from rpm test?
> > > I think the rpm test is test_testimage_dnf in
> > > meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:
> > > 
> > > oe-selftest -r runtime_test.TestImage.test_testimage_dnf
> > I'll have a look.
> 
> Pfff. These tests are O(1) more then the signing code they test. I'm 
> trying this original test (on rpm) now to see if I can get that to run 
> and understand how it works.

What you're asking to work is a complex scenario so the test isn't going to be
simple.

FWIW there is also oeqa/runtime/cases/apt.py. That test checks if a package can
be installed from a remote package feed (no signing). It is doing:

echo deb [ allow-insecure=yes ] %s ./ > sources.list

to work around the signing issue.

> Am I right that meta/lib/oeqa/selftest/cases/signing.py tests the actual 
> package feed signing?

No. That tests that signed packages in rpm works rather than a signed remote
repository which is different.

Cheers,

Richard

--=-EVJiuUdYIZHFm4Hs02LU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Thu, 2022-03-24 at 23:11 +0100, Ferry Toth=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><pre>Op 24-03-2022 om 16:36 schreef=
 Ferry Toth:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bor=
der-left:2px #729fcf solid;padding-left:1ex"><pre>Op 24-03-2022 om 13:03 sc=
hreef Richard Purdie:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>On Thu, 2022-03-=
24 at 12:23 +0100, Ferry Toth wrote:</pre><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><pre>On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth w=
rote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><pre>I forgot to add a cover letter, =
sorry for that. The 2 patches&nbsp; together</pre><pre>implement DEB reposi=
tory signing.</pre><pre><br></pre><pre>This is necessary since Gatesgarth |=
apt| (1.8.2) has become more strict</pre><pre>and doesn=E2=80=99t allow uns=
igned repositories by default.</pre><pre><br></pre><pre>It is possible to o=
verride this behavior |but||| is more work then to</pre><pre>enable signed =
DEB repositories. These patches makes DEB a first class</pre><pre>citizen a=
s IPK and RPM.</pre><pre><br></pre><pre>Patches have been in use in meta-in=
tel-edison since Gatesgarth, see</pre><pre><a href=3D"https://edison-fw.git=
hub.io/meta-intel-edison/5.0-Creating-a-deb">https://edison-fw.github.io/me=
ta-intel-edison/5.0-Creating-a-deb</a>-</pre><pre>repository.html\</pre></b=
lockquote><pre>What puzzles me is that we can build root filesystems using =
apt, we test</pre><pre>this on</pre><pre>the autobuilder. Saying repositori=
es are broken since gatesgarth therefore</pre><pre>seems</pre><pre>confusin=
g in the commit message.</pre></blockquote></blockquote></blockquote></bloc=
kquote><pre><br></pre><pre>The Development Task manual in 3.22.4.3.3 names =
it a repository, as I </pre><pre>believe is common for a distributions serv=
er holding pre-built packages. </pre><pre>But I could change the name to pa=
ckage feed if that would be better.</pre><pre><br></pre><pre>What I meant t=
o say is that apt requires signed package feeds since </pre><pre>1.8.2 and =
disabling that is a workaround.</pre></blockquote><div><br></div><div>I mea=
n to distinguish between the use of repositories at rootfs creation time co=
mpared to repositories used later to update an image. Since I know reposito=
ries are used to build the rootfs, the commit message did confuse me at fir=
st since rootfs construction works.</div><div><br></div><div><br></div><div=
><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><pre><br></pre><blockquote type=3D"ci=
te" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:=
1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px =
#729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>Good questi=
on. When I (meta-intel-edison) build the rootfs using DEB's it just</pre><p=
re>works.</pre><pre>Could it be that during rootfs build dpkg is used and n=
ot apt? I think I have</pre><pre>seen that in the logs.</pre></blockquote><=
pre>It definitely uses apt.</pre></blockquote></blockquote><pre>Checking lo=
gs I see you are correct.</pre><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><pre>Of course apt uses dpkg to insta=
ll a package as well, but it refuses to</pre><pre>download the package from=
 a repo when it's not signed.</pre></blockquote><pre>Perhaps the difference=
 is the packages are local and not remote?</pre></blockquote></blockquote><=
pre><br></pre><pre>No, for generating the rootfs it appears the sources lis=
t file has:</pre><pre><br></pre><pre>deb [trusted=3Dyes] file:/path.../oe-r=
ootfs-repo/edison/ ./</pre><pre><br></pre><pre>So apparently has been taken=
 care by disabling the signing requirement. </pre><pre>[trusted=3Dyes] is p=
art of that workaround.</pre></blockquote><div><br></div><div>That does giv=
e another way to work around this then...</div><div><br></div><div><br></di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><pre><br></pre><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><pre>I guess we must configure apt to override that during the rootfs pro=
cess and</pre><pre>likely an end user with a remote feed could do the same,=
 possibly with a</pre><pre>warning</pre><pre>from apt?</pre></blockquote></=
blockquote></blockquote></blockquote><pre>Yes. But it is a pain to google t=
o find how to do that.</pre><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"=
cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-lef=
t:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><pre> &nbsp;I believe there is no issue d=
uring rootfs generation.</pre><pre>  </pre><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><pre=
>I'm also worried that there isn't any automated testing of this change. Th=
e</pre><pre>reason I worry is that since we don't show any testing failures=
 right now,</pre><pre>there</pre><pre>is clearly a hole in our automated te=
sting coverage and there is no</pre><pre>guarantee</pre><pre>that this feat=
ure will keep working. It is these smaller corner case issues</pre><pre>whi=
ch tend to make or break the project's experience as if a feature is</pre><=
pre>present,</pre><pre>people expect it to work. Can we improve the testing=
 situation?</pre></blockquote><pre>It doesn't seem to be a particularly vol=
atile area in the code. I refreshed</pre><pre>Xavier's patches for Gatesgar=
th, and am actively using unchanged patch on</pre><pre>Honisiter.</pre><pre=
>I don't know how the automated testing is working but I guess for RPM a re=
po</pre><pre>is generated using a small layer? And then tested on a qemu ru=
nning the</pre><pre>rootfs?</pre><pre>Should be almost same for deb/apt, ma=
ybe could be modified from rpm test?</pre></blockquote><pre>I think the rpm=
 test is test_testimage_dnf in</pre><pre>meta/lib/oeqa/selftest/cases/runti=
me_test.py. You'd run it with:</pre><pre><br></pre><pre>oe-selftest -r runt=
ime_test.TestImage.test_testimage_dnf</pre></blockquote><pre>I'll have a lo=
ok.</pre></blockquote><pre><br></pre><pre>Pfff. These tests are O(1) more t=
hen the signing code they test. I'm </pre><pre>trying this original test (o=
n rpm) now to see if I can get that to run </pre><pre>and understand how it=
 works.</pre></blockquote><div><br></div><div>What you're asking to work is=
 a complex scenario so the test isn't going to be simple.</div><div><br></d=
iv><div>FWIW there is also oeqa/runtime/cases/apt.py. That test checks if a=
 package can be installed from a remote package feed (no signing). It is do=
ing:</div><div><br></div><div>echo deb [ allow-insecure=3Dyes ] %s ./ &gt; =
sources.list</div><div><br></div><div>to work around the signing issue.</di=
v><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><pre>Am I right that meta/lib/o=
eqa/selftest/cases/signing.py tests the actual </pre><pre>package feed sign=
ing?</pre></blockquote><div><br></div><div>No. That tests that signed packa=
ges in rpm works rather than a signed remote repository which is different.=
</div><div><br></div><div>Cheers,</div><div><br></div><div>Richard</div></b=
ody></html>

--=-EVJiuUdYIZHFm4Hs02LU--
