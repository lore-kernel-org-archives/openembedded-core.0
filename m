Return-Path: <a.manache@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C7AEA6C132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 14:19:52 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b72so20387086edf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 06:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Jl1uKy+nnnO7bPCYE4LQFUqVTJ2XKFOG7SMSU6c2oqs=;
	b=Fa/4xiLkQlRbhzPc0DJVA+FFP6PPzQvyO1NFtfhWJYSi4u2zKTwEynaUXnLub5PPRk
	1RHbL2k5vnx9ZwttbjyZ9V3oONOOm+g1fpq4X25aNefIKlfLvxS8/tw+kBkUG+XY6ZmR
	zhJAn4ckKKBUzi1TrhuyfGflC95S0j29+tSHY3iyKgmjXCuvVgVCv9TroOMcYKbc/yqu
	TRPE1f2KT+M7lOTURGw6sCqHfrBBt04csoSUaXg79PnvkBRn7UZIgvlPQTU9tlcMD209
	7mWtYJqO5tlGwvOwfQeUou1CoCGUsUapfBPmQ/DLE+94vxwq3JcdbmInrd3WLRil6UHy
	qGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Jl1uKy+nnnO7bPCYE4LQFUqVTJ2XKFOG7SMSU6c2oqs=;
	b=hMrBjaMXyC2GoDQR1Czc5oYltdEy0bQR99XXqPCfR6FB7eqx2cVV+wpmBtqDJWCOPq
	8rEjecPhxqfsCY5tHyCxQUSlQFU6uSF7qSLfzGg7vf9E/sBtVIeuDWz8SLF8J55A2ZXv
	OiEAVAQDMpP5tVwONkahTUB34rzpDBrBCxQ0tsjPDTAtHr5nFAMT2FksDxaBOsGLjrI3
	UFV0EPpBELW8Tv8HgTPRxpZxyp4DaEUno0X9sqm8nGVajsOuDCgBGnT03OyDaEYqbD35
	IYqwccjROBvEKs6bwOiQ5YUY7LTXWj+QcNze8uf54g/lAFv5oVQjezpnj5F8MiSOnGTf
	zJBw==
X-Gm-Message-State: APjAAAUjs/T0S+IOuHqUp/bEwW4dwn+QgJZ9P7WeEv/+LiMReXXwG7g/
	Hjw4MEG7BDUPvUUdvLbcfQe/RZqRbrfo3z0cMvy7HQ==
X-Google-Smtp-Source: APXvYqwBklhGbse153zu34IBIyuk8TqRM+Vw9Rot+cX30YC1AWXrbeFcSKZ9I7UK+oweuN86dVnH0uYPA9SG90dm2N4=
X-Received: by 2002:a17:906:3602:: with SMTP id
	q2mr5778016ejb.167.1574259593134; 
	Wed, 20 Nov 2019 06:19:53 -0800 (PST)
MIME-Version: 1.0
From: Antoine Manache <a.manache@gmail.com>
Date: Wed, 20 Nov 2019 15:19:40 +0100
Message-ID: <CAMu9SpJ9QwdnjDHtS59jXzEhDg8XWQwb3LuOof1QFYfTM-pVXg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [yocto] [PATCH] SDK environment script doesn't set security options in CC and LDFLAGS variables
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
X-List-Received-Date: Wed, 20 Nov 2019 14:19:53 -0000
Content-Type: multipart/alternative; boundary="000000000000d548de0597c7df94"

--000000000000d548de0597c7df94
Content-Type: text/plain; charset="UTF-8"

When building a SDK from a DISTRO with security flags enabled, options
added to
CC and LDFLAGS are not replicated in the SDK environment script.
This could lead to some situations where an application compiled with
the SDK and having some security weaknesses correctly runs on target but
crashes once integrated to the core image built with the full Yocto
stack.

Signed-off-by: Antoine Manache <a.manache@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc
b/meta/conf/distro/include/security_flags.inc
index 620978a8ed..329482bfa3 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -56,7 +56,9 @@ SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""

 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
+TARGET_CC_ARCH_append_class-cross-canadian = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
+TARGET_LDFLAGS_append_class-cross-canadian = " ${SECURITY_LDFLAGS}"

 SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR_pn-glibc = ""

--
2.11.0

--000000000000d548de0597c7df94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p style=3D"margin-top:0px;margin-bottom:0px;font-family:=
calibri,arial,helvetica,sans-serif;font-size:16px"><span style=3D"font-fami=
ly:&#39;consolas&#39;,monospace;font-size:10pt">When building a SDK from a =
DISTRO with security flags enabled, options added to</span><br style=3D"fon=
t-family:&#39;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-f=
amily:&#39;consolas&#39;,monospace;font-size:10pt">CC and LDFLAGS are not r=
eplicated in the SDK environment script.</span><br style=3D"font-family:&#3=
9;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;c=
onsolas&#39;,monospace;font-size:10pt">This could lead to some situations w=
here an application compiled with</span><br style=3D"font-family:&#39;conso=
las&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas=
&#39;,monospace;font-size:10pt">the SDK and having some security weaknesses=
 correctly runs on target but</span><br style=3D"font-family:&#39;consolas&=
#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39=
;,monospace;font-size:10pt">crashes once integrated to the core image built=
 with the full Yocto</span><br style=3D"font-family:&#39;consolas&#39;,mono=
space;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospa=
ce;font-size:10pt">stack.</span><br style=3D"font-family:&#39;consolas&#39;=
,monospace;font-size:10pt"><br style=3D"font-family:&#39;consolas&#39;,mono=
space;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospa=
ce;font-size:10pt">Signed-off-by: Antoine Manache &lt;<a href=3D"mailto:a.m=
anache@gmail.com" style=3D"text-decoration-line:none;color:rgb(66,133,244)"=
>a.manache@gmail.com</a>&gt;</span><br style=3D"font-family:&#39;consolas&#=
39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;=
,monospace;font-size:10pt">---</span><br style=3D"font-family:&#39;consolas=
&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#3=
9;,monospace;font-size:10pt">=C2=A0meta/conf/distro/include/security_flags.=
inc | 2 ++</span><br style=3D"font-family:&#39;consolas&#39;,monospace;font=
-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospace;font-si=
ze:10pt">=C2=A01 file changed, 2 insertions(+)</span><br style=3D"font-fami=
ly:&#39;consolas&#39;,monospace;font-size:10pt"><br style=3D"font-family:&#=
39;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;=
consolas&#39;,monospace;font-size:10pt">diff --git a/meta/conf/distro/inclu=
de/security_flags.inc b/meta/conf/distro/include/security_flags.inc</span><=
br style=3D"font-family:&#39;consolas&#39;,monospace;font-size:10pt"><span =
style=3D"font-family:&#39;consolas&#39;,monospace;font-size:10pt">index 620=
978a8ed..329482bfa3 100644</span><br style=3D"font-family:&#39;consolas&#39=
;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,m=
onospace;font-size:10pt">--- a/meta/conf/distro/include/security_flags.inc<=
/span><br style=3D"font-family:&#39;consolas&#39;,monospace;font-size:10pt"=
><span style=3D"font-family:&#39;consolas&#39;,monospace;font-size:10pt">++=
+ b/meta/conf/distro/include/security_flags.inc</span><br style=3D"font-fam=
ily:&#39;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family=
:&#39;consolas&#39;,monospace;font-size:10pt">@@ -56,7 +56,9 @@ SECURITY_ST=
RINGFORMAT_pn-busybox =3D &quot;&quot;</span><br style=3D"font-family:&#39;=
consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;con=
solas&#39;,monospace;font-size:10pt">=C2=A0SECURITY_STRINGFORMAT_pn-gcc =3D=
 &quot;&quot;</span><br style=3D"font-family:&#39;consolas&#39;,monospace;f=
ont-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospace;font=
-size:10pt">=C2=A0</span><br style=3D"font-family:&#39;consolas&#39;,monosp=
ace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospace=
;font-size:10pt">=C2=A0TARGET_CC_ARCH_append_class-target =3D &quot; ${SECU=
RITY_CFLAGS}&quot;</span><br style=3D"font-family:&#39;consolas&#39;,monosp=
ace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospace=
;font-size:10pt">+TARGET_CC_ARCH_append_class-cross-canadian =3D &quot; ${S=
ECURITY_CFLAGS}&quot;</span><br style=3D"font-family:&#39;consolas&#39;,mon=
ospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monosp=
ace;font-size:10pt">=C2=A0TARGET_LDFLAGS_append_class-target =3D &quot; ${S=
ECURITY_LDFLAGS}&quot;</span><br style=3D"font-family:&#39;consolas&#39;,mo=
nospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monos=
pace;font-size:10pt">+TARGET_LDFLAGS_append_class-cross-canadian =3D &quot;=
 ${SECURITY_LDFLAGS}&quot;</span><br style=3D"font-family:&#39;consolas&#39=
;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,m=
onospace;font-size:10pt">=C2=A0</span><br style=3D"font-family:&#39;consola=
s&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;consolas&#=
39;,monospace;font-size:10pt">=C2=A0SECURITY_STACK_PROTECTOR_pn-gcc-runtime=
 =3D &quot;&quot;</span><br style=3D"font-family:&#39;consolas&#39;,monospa=
ce;font-size:10pt"><span style=3D"font-family:&#39;consolas&#39;,monospace;=
font-size:10pt">=C2=A0SECURITY_STACK_PROTECTOR_pn-glibc =3D &quot;&quot;</s=
pan></p><div style=3D"color:rgb(136,136,136);font-family:calibri,arial,helv=
etica,sans-serif;font-size:16px" dir=3D"auto"><br style=3D"font-family:&#39=
;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;co=
nsolas&#39;,monospace;font-size:10pt">--</span><br style=3D"font-family:&#3=
9;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;c=
onsolas&#39;,monospace;font-size:10pt">2.11.0</span><br style=3D"font-famil=
y:&#39;consolas&#39;,monospace;font-size:10pt"></div></div>

--000000000000d548de0597c7df94--
