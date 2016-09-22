Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id ABD2A605C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:05:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m79so80634738ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N+3lO803MoN4NdownDoweDdKnqVwTal/PllRzygqEB0=;
	b=hsjbxKV6izXVVjE/ZGYApCGGN2vv8H7DqPsUmdKtMGFX6d4cr9U4JIkYRKyo17dpmY
	k8qvKQjSxp+vY5a2SUyeoTlzGjPX0bNuahlMbAsBfyRseIO5Nuj/pHHu7CL4iRiAevop
	WZ2Avj6rZr9mptDubAH4NdbnVl/poyASGdQ3AbprxrZ5om+CTGjvO4CB4uZuO9WR2RQ2
	co7QDfYI6Jppdql4n6zujJUvcpQWKrtRLA3kTF7mFdNwsCUq8jHtG8aAkjqwDMDQvhsj
	b7th2rA9EfG7sIbwiWnQRc/xgEKWAYmdNuhKLu+kKzuZZaSrXzVeIE9wl+tNjaD5Ixk/
	WezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N+3lO803MoN4NdownDoweDdKnqVwTal/PllRzygqEB0=;
	b=ehClJ3OPydSgAlqVvrn61K8dDIit9dEuESH0cW4bZBs2d9xHjT5BgMnpH468xjt3wk
	f4dMXauecyHpdO7nXrEulQZrykPZ+ekzK0TBopdMv7K+4cTBX1GXEaf0tE/sjM0XxBMj
	Xb/cgcvfw0gptB+UN52A4a5ndZU19V2y1t6nkWaOq3r0pQChj+C6XL7rgQ8GT0FCwGaT
	THA080jotwI1eYMNPQfslx/gGQOolhjLkKBJs5rwWesUVmnbXfVA0w3zRW4xMYubnT7h
	lB0/MTTX+tu8s3/IDEXdPF3Cjr4ry+ZFoTpBPrHWpGMC/7Obkm+T4WGrjjwi65W5C8xN
	q0DQ==
X-Gm-Message-State: AE9vXwNmAhP2yX9g4hVSZ/TVnFWF30tlr7PD9TIUUx5giAcNG2n66Rn0EZLgigQMXKFDe8H+UD4TO6/1bcmwSA6O
X-Received: by 10.107.47.227 with SMTP id v96mr1723469iov.172.1474538715724;
	Thu, 22 Sep 2016 03:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 22 Sep 2016 03:04:55 -0700 (PDT)
In-Reply-To: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
References: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Sep 2016 11:04:55 +0100
Message-ID: <CAJTo0LaxDWsNoY6Ds8W6V+Vjtr8H+-HpO24KHH-Ej-5ogrS_MA@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Remove bashisms
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
X-List-Received-Date: Thu, 22 Sep 2016 10:05:16 -0000
Content-Type: multipart/alternative; boundary=001a11c168fa5bd2bc053d15cc0f

--001a11c168fa5bd2bc053d15cc0f
Content-Type: text/plain; charset=UTF-8

On 22 September 2016 at 10:33, <zhe.he@windriver.com> wrote:

> -if type systemctl >/dev/null 2>/dev/null; then
> +if command -p systemctl >/dev/null 2>/dev/null; then


This doesn't do what you want:

$ type whoami ; echo $?
whoami is /usr/bin/whoami
0
$ type foobar; echo $?
-bash: type: foobar: not found
1

'type' when used with a binary prints the full path (thus the redirect) and
returns success if it was found, error if it wasn't.

$ command -p whoami ; echo $?
ross
0

$ which applyotron
/home/ross/bin/applyotron
$ command -p applyotron
-bash: applyotron: command not found

'command -p' searches for a binary (ignoring any aliases or builtins) in a
hardcoded set of paths as you pass -p (not $PATH, so will fail at rootfs
time) for a binary and executes it if found.  We don't want to look in a
hard-coded set of paths, and we don't want to run the binary, so these
changes are bad.

bash, dash and ash all support type, which is why verify-bashisms has them
on the whitelist as the simplest way of saying "does this binary exist".


        # Remove unpackaged files (based on list in rpm.spec)
> -       rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,
> rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
> +       rm -f ${D}/${libdir}/rpm/Specfile.pm
> +       rm -f ${D}/${libdir}/rpm/cpanflute
> +       rm -f ${D}/${libdir}/rpm/cpanflute2
> +       rm -f ${D}/${libdir}/rpm/rpmdiff
> +       rm -f ${D}/${libdir}/rpm/rpmdiff.cgi
> +       rm -f ${D}/${libdir}/rpm/sql.prov
> +       rm -f ${D}/${libdir}/rpm/sql.req
> +       rm -f ${D}/${libdir}/rpm/tcl.req
> +       rm -f ${D}/${libdir}/rpm/trpm
>

I deleted these in "rpm: remove redundant removals" when doing a similar
sweep, so please rebase to master.

I think all thats left is the guile cleanup, so can you submit just that
with a rewritten commit message.

Ross

--001a11c168fa5bd2bc053d15cc0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 22 September 2016 at 10:33, =
 <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe.he@windriver.com" target=3D"_b=
lank">zhe.he@windriver.com</a>&gt;</span> wrote:</div><div class=3D"gmail_e=
xtra"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><span style=3D"font-size:12.800000190734863px">-if t=
ype systemctl &gt;/dev/null 2&gt;/dev/null; then<br></span><span style=3D"f=
ont-size:12.800000190734863px">+if command -p systemctl &gt;/dev/null 2&gt;=
/dev/null; then</span></blockquote><div><br></div><div>This doesn&#39;t do =
what you want:</div><div><br></div><div><div>$ type whoami ; echo $?</div><=
div>whoami is /usr/bin/whoami</div></div><div>0</div><div><div>$ type fooba=
r; echo $?</div><div>-bash: type: foobar: not found</div><div>1</div></div>=
<div><br></div><div>&#39;type&#39; when used with a binary prints the full =
path (thus the redirect) and returns success if it was found, error if it w=
asn&#39;t.</div><div><br></div><div>$ command -p whoami ; echo $?</div><div=
>ross</div><div>0</div><div><br></div><div><div><div>$ which applyotron<br>=
</div><div>/home/ross/bin/applyotron</div></div><div>$ command -p applyotro=
n</div><div>-bash: applyotron: command not found</div><div><br></div></div>=
<div>&#39;command -p&#39; searches for a binary (ignoring any aliases or bu=
iltins) in a hardcoded set of paths as you pass -p (not $PATH, so will fail=
 at rootfs time) for a binary and executes it if found.=C2=A0 We don&#39;t =
want to look in a hard-coded set of paths, and we don&#39;t want to run the=
 binary, so these changes are bad.</div><div><br></div><div>bash, dash and =
ash all support type, which is why verify-bashisms has them on the whitelis=
t as the simplest way of saying &quot;does this binary exist&quot;.</div><d=
iv><br></div><div><br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><di=
v id=3D"gmail-:3va" class=3D"gmail-a3s gmail-aXjCH gmail-m157513fd5001a357"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove unpackaged files (based on list in rp=
m.spec)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/{Specfile.<wbr>pm,cpan=
flute,cpanflute2,<wbr>rpmdiff,rpmdiff.cgi,sql.prov,<wbr>sql.req,tcl.req,trp=
m}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/Specfile.pm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/cpanflute<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/cpanflute2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/rpmdiff<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/rpmdiff.cgi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/sql.prov<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/sql.req<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/tcl.req<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}/${libdir}/rpm/trpm</div></blockquote=
></div><br>I deleted these in &quot;rpm: remove redundant removals&quot; wh=
en doing a similar sweep, so please rebase to master.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">I think all thats left is t=
he guile cleanup, so can you submit just that with a rewritten commit messa=
ge.</div><div class=3D"gmail_extra"><br></div><div>Ross</div></div>

--001a11c168fa5bd2bc053d15cc0f--
