Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web08.21737.1629926312305984906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 14:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from [91.216.112.25] (helo=[127.0.0.1])
	by pbcl.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1mJ0Hz-0007HP-6c; Wed, 25 Aug 2021 23:18:29 +0200
Date: Wed, 25 Aug 2021 22:18:19 +0100
From: "Phil Blundell" <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [OE-core] what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
User-Agent: K-9 Mail for Android
In-Reply-To: <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
References: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca> <CANNYZj-PJQTLydecmn9EpWdci5wWce_9Tkw_QkOGkProY6t_fQ@mail.gmail.com> <20210825171222.Horde.pjbNvErvPswYBwDudrNTUaM@crashcourse.ca>
Message-ID: <3FDCF22A-7038-4B36-B15D-D59C31F61C86@pbcl.net>
MIME-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software, running on the system "hetzner.pbcl.net",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 postmaster@pbcl.net for details.
 
 Content preview:  That's testing for offline installation. If $D is not set,
    it's running on the target. p. On 25 August 2021 22:12:22 BST, "Robert P.
    J. Day" <rpjday@crashcourse.ca> wrote: > >Quoting Alexander Kanavin <alex.kanavin@gmail.com>:
    > >> If you show the confusing examples, we could try to figure [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 HTML_MESSAGE           BODY: HTML included in message
Content-Type: multipart/alternative;
 boundary=----SZNHV1YDU0OTQ2KNRVNPIUJLXCMJIM
Content-Transfer-Encoding: 7bit

------SZNHV1YDU0OTQ2KNRVNPIUJLXCMJIM
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

That's testing for offline installation=2E If $D is not set, it's running o=
n the target=2E

p=2E


On 25 August 2021 22:12:22 BST, "Robert P=2E J=2E Day" <rpjday@crashcourse=
=2Eca> wrote:
>
>Quoting Alexander Kanavin <alex=2Ekanavin@gmail=2Ecom>:
>
>> If you show the confusing examples, we could try to figure it out=2E
>>
>> Alex
>>
>> On Wed, 25 Aug 2021 at 22:35, Robert P=2E J=2E Day <rpjday@crashcourse=
=2Eca>
>> wrote:
>>
>>>
>>> there will be many more questions about pkg_postinst (and related)
>>> routines shortly, but digging into these for the first time, i
>>> thought that that test checked whether the routine was being run
>>> at image creation time, or at first-time boot=2E now i'm not quite
>>> sure what to think after seeing several examples=2E
>>>
>>> what does the test for null or non-null variable "D" mean in
>>> a pkg_postinst routine? and once i figure all this out, i may
>>> very well contribute some enhanced docs for the next confused
>>> person=2E
>
>   there's no shortage of examples =2E=2E=2E here's just one from
>recipes-bsp/alsa-state/alsa-state=2Ebb:
>
>
>pkg_postinst:${PN}() {
>         if test -z "$D"       <=3D=3D=3D=3D=3D=3D=3D=3D
>         then
>                 if test -x ${sbindir}/alsactl
>                 then
>                         ${sbindir}/alsactl -g -f =20
>${localstatedir}/lib/alsa/asound=2Estate restore
>                 fi
>         fi
>}
>
>
>there's plenty more =2E=2E=2E recipes-bsp/keymaps/keymaps_1=2E0=2Ebb:
>
>
>pkg_postinst:${PN} () {
>         if ${@bb=2Eutils=2Econtains('DISTRO_FEATURES','systemd =20
>sysvinit','true','false',d)}; then
>                 if [ -n "$D" ]; then        <=3D=3D=3D=3D=3D=3D=3D=3D
>                         OPTS=3D"--root=3D$D"
>                 fi
>                 systemctl $OPTS mask keymap=2Eservice
>         fi
>}
>
>
>rday
>

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

------SZNHV1YDU0OTQ2KNRVNPIUJLXCMJIM
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>That's testing for offline installation=2E If $D i=
s not set, it's running on the target=2E<br><br>p=2E<br><br><br><div class=
=3D"gmail_quote">On 25 August 2021 22:12:22 BST, "Robert P=2E J=2E Day" &lt=
;rpjday@crashcourse=2Eca&gt; wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<pre dir=3D"auto" class=3D"k9mail"><br>Quoting Alexander Kanavin &lt;alex=
=2Ekanavin@gmail=2Ecom&gt;:<br><br><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-le=
ft: 1ex;"> If you show the confusing examples, we could try to figure it ou=
t=2E<br><br> Alex<br><br> On Wed, 25 Aug 2021 at 22:35, Robert P=2E J=2E Da=
y &lt;rpjday@crashcourse=2Eca&gt;<br> wrote:<br><br><blockquote class=3D"gm=
ail_quote" style=3D"margin: 0pt 0pt 1ex 0=2E8ex; border-left: 1px solid #ad=
7fa8; padding-left: 1ex;"><br> there will be many more questions about pkg_=
postinst (and related)<br> routines shortly, but digging into these for the=
 first time, i<br> thought that that test checked whether the routine was b=
eing run<br> at image creation time, or at first-time boot=2E now i'm not q=
uite<br> sure what to think after seeing several examples=2E<br><br> what d=
oes the test for null or non-null variable "D" mean in<br> a pkg_postinst r=
outine? and once i figure all this out, i may<br> very well contribute some=
 enhanced docs for the next confused<br> person=2E<br></blockquote></blockq=
uote><br>   there's no shortage of examples =2E=2E=2E here's just one from<=
br>recipes-bsp/alsa-state/alsa-state=2Ebb:<br><br><br>pkg_postinst:${PN}() =
{<br>         if test -z "$D"       &lt;=3D=3D=3D=3D=3D=3D=3D=3D<br>       =
  then<br>                 if test -x ${sbindir}/alsactl<br>               =
  then<br>                         ${sbindir}/alsactl -g -f  <br>${localsta=
tedir}/lib/alsa/asound=2Estate restore<br>                 fi<br>         f=
i<br>}<br><br><br>there's plenty more =2E=2E=2E recipes-bsp/keymaps/keymaps=
_1=2E0=2Ebb:<br><br><br>pkg_postinst:${PN} () {<br>         if ${@bb=2Eutil=
s=2Econtains('DISTRO_FEATURES','systemd  <br>sysvinit','true','false',d)}; =
then<br>                 if [ -n "$D" ]; then        &lt;=3D=3D=3D=3D=3D=3D=
=3D=3D<br>                         OPTS=3D"--root=3D$D"<br>                =
 fi<br>                 systemctl $OPTS mask keymap=2Eservice<br>         f=
i<br>}<br><br><br>rday<br><br></pre></blockquote></div><div style=3D'white-=
space: pre-wrap'><div class=3D'k9mail-signature'>-- <br>Sent from my Androi=
d device with K-9 Mail=2E Please excuse my brevity=2E</div></div></body></h=
tml>

------SZNHV1YDU0OTQ2KNRVNPIUJLXCMJIM--
