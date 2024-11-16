Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0664ED68BE5
	for <webhook@archiver.kernel.org>; Sat, 16 Nov 2024 10:56:05 +0000 (UTC)
Subject: Re: [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 02:55:58 -0800
References: <18918.1731589075220106911@lists.openembedded.org>
In-Reply-To: <18918.1731589075220106911@lists.openembedded.org>
Message-ID: <921.1731754558740077385@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yMgux93Q1ThpYARXkKj4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 10:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207188

--yMgux93Q1ThpYARXkKj4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've thought some more about this issue. I think it is best to remove these=
 two patches I submitted from master-next if you haven't done so already. U=
sing bluez5-native is wrong, I was misunderstanding the 'native' part a lit=
tle bit.

Moving forward I think there are really only two possible ways to resolve t=
his (both seem quite cumbersome):

1. Build BlueZ, and it dependencies by using a 'target' Python 3. Then afte=
r BlueZ is done building,=C2=A0 Python should somehow be re-configured and =
re-built in order to compile with bluetooth support.
2. Create a new recipe called libbluetooth which modifies BlueZ such that o=
nly the lib folder is built. This recipe only packages the library. In this=
 case, we need to create a custom Makefile and a target which only builds t=
he bluetooth library. It should have minimal dependencies. The goal with th=
is approach is to avoid depending on Python at all such that we can avoid b=
uilding it until we have libbluetooth available for the target build.

In my opinion I prefer option 2. I am thinking if it is worth it to push a =
patch to upstream BlueZ to better support only building the library. I'll w=
ork on this weekend to build the library locally and see what dependencies =
it needs. If it doesn't depend on glib and dbus, then that's perfect.

For option 1, I am not sure how this can be done. I'm open to any ideas.

This could take me a few weeks to implement as I don't have much free time =
except on weekends. But I feel this is an important issue to resolve and th=
e pybluez library is no longer being maintained. Having native bluetooth su=
pport in Python really helps when developing Bluetooth scripts for developm=
ent purposes or even for released products.

--yMgux93Q1ThpYARXkKj4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>I've thought some more about this issue. I think it is best to remove =
these two patches I submitted from master-next if you haven't done so alrea=
dy. Using bluez5-native is wrong, I was misunderstanding the 'native' part =
a little bit.</div>
<div>&nbsp;</div>
<div>Moving forward I think there are really only two possible ways to reso=
lve this (both seem quite cumbersome):</div>
<div>&nbsp;</div>
<div>1. Build BlueZ, and it dependencies by using a 'target' Python 3. Then=
 after BlueZ is done building,&nbsp; Python should somehow be re-configured=
 and re-built in order to compile with bluetooth support.</div>
<div>2. Create a new recipe called libbluetooth which <em>modifies</em> Blu=
eZ such that only the lib folder is built. This recipe only packages the li=
brary. In this case, we need to create a custom Makefile and a target which=
 only builds the bluetooth library. It should have minimal dependencies. Th=
e goal with this approach is to avoid depending on Python at all such that =
we can avoid building it until we have libbluetooth available for the targe=
t build.</div>
<div>&nbsp;</div>
<div>In my opinion I prefer option 2. I am thinking if it is worth it to pu=
sh a patch to upstream BlueZ to better support only building the library. I=
'll work on this weekend to build the library locally and see what dependen=
cies it needs. If it doesn't depend on glib and dbus, then that's perfect.<=
/div>
<div>&nbsp;</div>
<div>For option 1, I am not sure how this can be done. I'm open to any idea=
s.</div>
<div>&nbsp;</div>
<div>This could take me a few weeks to implement as I don't have much free =
time except on weekends. But I feel this is an important issue to resolve a=
nd the pybluez library is no longer being maintained. Having native bluetoo=
th support in Python really helps when developing Bluetooth scripts for dev=
elopment purposes or even for released products.</div>

--yMgux93Q1ThpYARXkKj4--

