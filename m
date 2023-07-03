Return-Path: <yogish.sanjeeva@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67C4EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 11:17:01 +0000 (UTC)
Subject: Regarding overiding of file permissions using  fs-perms.txt in distro layer. #bitbake
To: openembedded-core@lists.openembedded.org
From: "yogish sanjeeva" <yogish.sanjeeva@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (103.5.134.169)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Jul 2023 04:17:00 -0700
Message-ID: <T5qN.1688383020139950389.Xkaa@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="E7Ll9zr95HMWxaXKbLdd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 11:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183800

--E7Ll9zr95HMWxaXKbLdd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Team,

We have modified base-passwd recipe and we have added couple of new UID/GID=
 for eg., shell.
Our fs-perms.txt is similar to https://github.com/openembedded/openembedded=
-core/blob/master/meta/files/fs-perms.txt, with extra entries as below

${base_bindir}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00751 =C2=A0 =C2=A0root =C2=
=A0 =C2=A0shell =C2=A0 true =C2=A0 =C2=A00655 =C2=A0 =C2=A0root =C2=A0 =C2=
=A0shell
${base_sbindir}=C2=A0 =C2=A0 =C2=A0 =C2=A00751 =C2=A0 =C2=A0root =C2=A0 =C2=
=A0shell =C2=A0 true =C2=A0 =C2=A00655 =C2=A0 =C2=A0root =C2=A0 =C2=A0shell
${base_libdir} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00751 =C2=A0 =C2=A0root =C2=
=A0 =C2=A0system =C2=A0true =C2=A0 =C2=A00644 =C2=A0 =C2=A0root =C2=A0 =C2=
=A0system
${prefix}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 075=
1 =C2=A0 =C2=A0root =C2=A0 =C2=A0system =C2=A0true =C2=A0 =C2=A00644 =C2=A0=
 =C2=A0root =C2=A0 =C2=A0system
${bindir}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 075=
1 =C2=A0 =C2=A0root =C2=A0 =C2=A0system =C2=A0true =C2=A0 =C2=A00655 =C2=A0=
 =C2=A0root =C2=A0 =C2=A0system

We had tried overlaying fs-perms.txt using FILESYSTEM_PERMS_TABLES(meta/ fi=
les/fs-perms.txt) macro,But we have encountered below error as it was not r=
eferring the target file /etc/passwd.

File: '/oe-core/meta/classes/ package.bbclass', lineno: 953, function: _pro=
cgid

0949: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1
0950: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif gid.isdigit():
0951: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return int(gid=
)
0952: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
*** 0953: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return grp=
.getgrnam(gid).gr_gid0954: 0955:
# Use for debugging the entries0956:
def str(self):0957:
if self.link:Exception:
*KeyError: "getgrnam(): name not found: 'shell'"*
*Question:

* Why packagegroup recipes are not able to find the *shell* user, even thou=
gh we added base-passwd as depends in those modules?

--E7Ll9zr95HMWxaXKbLdd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;">Dear Team,<br /></span><br /><span style=3D"color: #22222=
2; font-family: Arial, Helvetica, sans-serif; font-size: small;">We have mo=
dified base-passwd recipe and we have added couple of new UID/GID for eg., =
shell.</span><br /><span style=3D"color: #222222; font-family: Arial, Helve=
tica, sans-serif; font-size: small;">Our fs-perms.txt is similar to&nbsp; <=
a href=3D"https://github.com/openembedded/openembedded-core/blob/master/met=
a/files/fs-perms.txt," target=3D"_blank" rel=3D"noopener">https://github.co=
m/openembedded/openembedded-core/blob/master/meta/files/fs-perms.txt,</a>&n=
bsp;with extra entries as below</span><br /><span style=3D"color: #222222; =
font-family: Arial, Helvetica, sans-serif; font-size: small;"><br />${base_=
bindir}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0751 &nbsp; &nbsp;root &nbsp; &nbs=
p;shell &nbsp; true &nbsp; &nbsp;0655 &nbsp; &nbsp;root &nbsp; &nbsp;shell<=
/span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-seri=
f; font-size: small;" /><span style=3D"color: #222222; font-family: Arial, =
Helvetica, sans-serif; font-size: small;">${base_sbindir}&nbsp; &nbsp; &nbs=
p; &nbsp;0751 &nbsp; &nbsp;root &nbsp; &nbsp;shell &nbsp; true &nbsp; &nbsp=
;0655 &nbsp; &nbsp;root &nbsp; &nbsp;shell</span><br style=3D"color: #22222=
2; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><span st=
yle=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size=
: small;">${base_libdir} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0751 &nbsp; &nbs=
p;root &nbsp; &nbsp;system &nbsp;true &nbsp; &nbsp;0644 &nbsp; &nbsp;root &=
nbsp; &nbsp;system</span><br style=3D"color: #222222; font-family: Arial, H=
elvetica, sans-serif; font-size: small;" /><span style=3D"color: #222222; f=
ont-family: Arial, Helvetica, sans-serif; font-size: small;">${prefix}&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0751 &nbsp; &nbsp=
;root &nbsp; &nbsp;system &nbsp;true &nbsp; &nbsp;0644 &nbsp; &nbsp;root &n=
bsp; &nbsp;system</span><br style=3D"color: #222222; font-family: Arial, He=
lvetica, sans-serif; font-size: small;" /><span style=3D"color: #222222; fo=
nt-family: Arial, Helvetica, sans-serif; font-size: small;">${bindir}&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0751 &nbsp; &nbsp;=
root &nbsp; &nbsp;system &nbsp;true &nbsp; &nbsp;0655 &nbsp; &nbsp;root &nb=
sp; &nbsp;system</span><br style=3D"color: #222222; font-family: Arial, Hel=
vetica, sans-serif; font-size: small;" /><span style=3D"color: #222222; fon=
t-family: Arial, Helvetica, sans-serif; font-size: small;"><br />&nbsp; &nb=
sp;We had tried overlaying fs-perms.txt using FILESYSTEM_PERMS_TABLES(meta/=
</span><wbr style=3D"color: #222222; font-family: Arial, Helvetica, sans-se=
rif; font-size: small;" /><span style=3D"color: #222222; font-family: Arial=
, Helvetica, sans-serif; font-size: small;">files/fs-perms.txt) macro,But w=
e have encountered below error as it was not referring the target file /etc=
/passwd.</span><br style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;" /><br style=3D"color: #222222; font-family: =
Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #2=
22222; font-family: Arial, Helvetica, sans-serif; font-size: small;">File: =
'/oe-core/meta/classes/</span><wbr style=3D"color: #222222; font-family: Ar=
ial, Helvetica, sans-serif; font-size: small;" /><span style=3D"color: #222=
222; font-family: Arial, Helvetica, sans-serif; font-size: small;">package.=
bbclass', lineno: 953, function: _procgid</span><br style=3D"color: #222222=
; font-family: Arial, Helvetica, sans-serif; font-size: small;" /><br style=
=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: s=
mall;" /><em><span style=3D"color: #222222; font-family: Arial, Helvetica, =
sans-serif; font-size: small;">&nbsp;0949: &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return -1</span></em><br style=3D"color: #222222; fo=
nt-family: Arial, Helvetica, sans-serif; font-size: small;" /><em><span sty=
le=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-size:=
 small;">&nbsp;0950: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;elif gid.isdi=
git():</span></em><br style=3D"color: #222222; font-family: Arial, Helvetic=
a, sans-serif; font-size: small;" /><em><span style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;">&nbsp;0951: &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return int(gid)</span></e=
m><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;" /><em><span style=3D"color: #222222; font-family: Arial, =
Helvetica, sans-serif; font-size: small;">&nbsp;0952: &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;else:</span></em><br style=3D"color: #222222; font-fami=
ly: Arial, Helvetica, sans-serif; font-size: small;" /><em><span style=3D"c=
olor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small;=
">&nbsp;*** 0953: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
turn grp.getgrnam(gid).gr_gid0954:</span><wbr style=3D"color: #222222; font=
-family: Arial, Helvetica, sans-serif; font-size: small;" /><span style=3D"=
color: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small=
;">0955:&nbsp;&nbsp;<br /># Use for debugging the entries0956: &nbsp; &nbsp=
; &nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;def str(self):0957: &nbsp; &nbsp; &nbsp; &nbsp;<br />&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if self.link=
:Exception: <br /><strong>KeyError: "getgrnam(): name not found: 'shell'"</=
strong></span></em><br style=3D"color: #222222; font-family: Arial, Helveti=
ca, sans-serif; font-size: small;" />
<h5><strong>Question:<br /><br /></strong>Why packagegroup recipes are not =
able to find the <strong>shell</strong> user, even though we added base-pas=
swd as depends in those modules?</h5>
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;"><br /></span>

--E7Ll9zr95HMWxaXKbLdd--

