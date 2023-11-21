Return-Path: <tobias.jakobi@compleo-cs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00BCC5ACB3
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 10:23:18 +0000 (UTC)
Subject: [Kirkstone] joe editor broken with current ncurses
To: openembedded-core@lists.openembedded.org
From: tobias.jakobi@compleo-cs.com
X-Originating-Location: Dortmund, North Rhine-Westphalia, DE (84.60.164.225)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 02:23:15 -0800
Message-ID: <DjZK.1700562195995684156.aksX@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Pl629kzpJKNOTld2wQ4m"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 10:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190962

--Pl629kzpJKNOTld2wQ4m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm currently facing some problems with seem to originate from version bump=
 of ncurses done in May this year. The problem manifests itself in applicat=
ions using ncurses rendering garbage and "destroying" the terminal. I.e. yo=
u need to issue a terminal reset afterwards to make it usable again. The ed=
itor joe is affected, but according to other reports tmux as well.

It seems like this problem is known. E.g. the Gentoo bugtracker has some en=
tries that analyse the problem, see here:
https://bugs.gentoo.org/904247
https://bugs.gentoo.org/904263

Gentoo currently provides two ncurses version in their repo, 6.4_p20230401 =
and 6.4_p20230527, where the latter one is masked because of this issue.

It appears that openembedded-core/kirkstone suffers from the same problem (=
even though only A 6.3 version of ncurses is used). I'm currently using com=
mit 56503e3e80603de3b69acef2f6d32836bc9e5e5d of the layer (from end of Octo=
ber, so faily recent).

As a test I have reverted the following commits:
4d79b1cc4178ba88830bab59a45163bbddf586ce (ncurses: fix CVE-2023-29491)
862c1b109cf8f31522a250cc9ff4146fe526450c (ncurses: update to patchlevel 202=
20423)

This restore functionality of joe, but of course leaves the system vulnerab=
le to the corresponding CVEs. I'm not sure on how to proceed here. joe is a=
 commonly used editor on our systems and I really don't want to leave it in=
 a broken state (as some developers in our team depend on it). At the same =
time I don't want to leave known CVEs unpatched.

I'm thinking about bumping ncurses to the (apparently unaffected?) 6.4 vers=
ion that Gentoo currently ships and put the .bb in our custom layer for the=
 time being. I don't know how well that would work though.

Are there any plans for a version bump in the Kirkstone branch?

With best wishes,
Tobias

--Pl629kzpJKNOTld2wQ4m
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I'm currently facing some problems with seem to originate=
 from version bump of ncurses done in May this year. The problem manifests =
itself in applications using ncurses rendering garbage and "destroying" the=
 terminal. I.e. you need to issue a terminal reset afterwards to make it us=
able again. The editor joe is affected, but according to other reports tmux=
 as well.<br /><br />It seems like this problem is known. E.g. the Gentoo b=
ugtracker has some entries that analyse the problem, see here:<br /><a href=
=3D"https://bugs.gentoo.org/904247" target=3D"_blank" rel=3D"noopener">http=
s://bugs.gentoo.org/904247</a><br /><a href=3D"https://bugs.gentoo.org/9042=
63" target=3D"_blank" rel=3D"noopener">https://bugs.gentoo.org/904263</a><b=
r /><br />Gentoo currently provides two ncurses version in their repo, 6.4_=
p20230401 and 6.4_p20230527, where the latter one is masked because of this=
 issue.<br /><br />It appears that openembedded-core/kirkstone suffers from=
 the same problem (even though only A 6.3 version of ncurses is used). I'm =
currently using commit 56503e3e80603de3b69acef2f6d32836bc9e5e5d of the laye=
r (from end of October, so faily recent).<br /><br />As a test I have rever=
ted the following commits:<br />4d79b1cc4178ba88830bab59a45163bbddf586ce (n=
curses: fix CVE-2023-29491)<br />862c1b109cf8f31522a250cc9ff4146fe526450c (=
ncurses: update to patchlevel 20220423)<br /><br />This restore functionali=
ty of joe, but of course leaves the system vulnerable to the corresponding =
CVEs. I'm not sure on how to proceed here. joe is a commonly used editor on=
 our systems and I really don't want to leave it in a broken state (as some=
 developers in our team depend on it). At the same time I don't want to lea=
ve known CVEs unpatched.<br /><br />I'm thinking about bumping ncurses to t=
he (apparently unaffected?) 6.4 version that Gentoo currently ships and put=
 the .bb in our custom layer for the time being. I don't know how well that=
 would work though.<br /><br />Are there any plans for a version bump in th=
e Kirkstone branch?<br /><br />With best wishes,<br />Tobias

--Pl629kzpJKNOTld2wQ4m--

