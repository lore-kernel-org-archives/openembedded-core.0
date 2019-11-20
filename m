Return-Path: <a.manache@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 51D6C7EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:44:40 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b72so20623674edf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MNS0zNeK/iGA8GwxHuju6+Z0/R6ngE5MF2majo/V2Hs=;
	b=Be+gJY9/lQd8yyNaCPyATAyqD0SmD8BRrbEyezTlxPTAKgHm+K3j8/HgJT9dj1zE1U
	bxjpkQDcwdc7/fmQkZYaScRmbHwEziuWeUMVhQF37uspa3TF9J1N3MtFPq0P0JBR2NER
	SZffct5DqTloZS2wwziqIb5Ehim2NYRe4eLmUvsq0ArofNejjGQMaxcUo79oYkC+npgA
	KpOokqa1Y02u9cSRUdvRxCVcrUiUendtL2mkWbfiFhj8kSiCfOZfjX4s5a+X2CqaH1E3
	IBGv1jCDM8IiuBHR9OuXou9q2i7TTblmU6AieT9j+J9voP231cwglss09/uKJ18Azz7E
	H/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MNS0zNeK/iGA8GwxHuju6+Z0/R6ngE5MF2majo/V2Hs=;
	b=XJvwgOHNNmapHpcEAQK20xEULLWGC9cXVljVkyQWNU+CLRAuNxhB9sbhyomcTtMKeK
	pH8z33jFYP07mGOycza+rCvWs199DksXHYUPhCq2Q7DGBdXJKSzmHwS0IWUuNm6bRZOW
	piD778thoMmrsl10JIQKdeiKKR8eSrGq/aqi92jXIwkNP0QvYg0q5cB9L1F1F/INwWFw
	wCzb4aDQafLv94/inPjg2TQemDGoU6A8431Tb1ZWyefBHsb6PX5+zYpfKVYaL6IRdN2O
	1e/wE3dU9GMe0Cp4SWTvY96Zd6hTToScU7YMc5AOHQ7rJiBVMBpzrjMSIVw/LDH+R7L2
	w2xQ==
X-Gm-Message-State: APjAAAXRk459ooYDkjOts0AiVD19Z1Q/NKrOXTtLzf/7aAiqYAz1jrGr
	L/KT0oepfbsmwY8MM/2NZHL7XmYU8+ji7tUclnLALg==
X-Google-Smtp-Source: APXvYqzuibtWzLtvTjY4uclrOegrmnGv0sWjDxMRvitMapAHrcwJ8Yluu9b21cTc2htEW6MufFCG4d05j8Pwf0ijoUw=
X-Received: by 2002:a17:906:3602:: with SMTP id
	q2mr6226276ejb.167.1574264680742; 
	Wed, 20 Nov 2019 07:44:40 -0800 (PST)
MIME-Version: 1.0
From: Antoine Manache <a.manache@gmail.com>
Date: Wed, 20 Nov 2019 16:44:28 +0100
Message-ID: <CAMu9SpKKpqvmU4+kP1Bxh8F4_zJmat49n1br3OC=aBHwk-idtQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] sdk: environment script doesn't set security options in CC and LDFLAGS variables
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
X-List-Received-Date: Wed, 20 Nov 2019 15:44:40 -0000
Content-Type: multipart/alternative; boundary="0000000000001404400597c90fbb"

--0000000000001404400597c90fbb
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

--0000000000001404400597c90fbb
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
pan></p><div dir=3D"auto" style=3D"color:rgb(136,136,136);font-family:calib=
ri,arial,helvetica,sans-serif;font-size:16px"><br style=3D"font-family:&#39=
;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;co=
nsolas&#39;,monospace;font-size:10pt">--</span><br style=3D"font-family:&#3=
9;consolas&#39;,monospace;font-size:10pt"><span style=3D"font-family:&#39;c=
onsolas&#39;,monospace;font-size:10pt">2.11.0</span></div><div dir=3D"auto"=
 style=3D"color:rgb(136,136,136);font-family:calibri,arial,helvetica,sans-s=
erif;font-size:16px"><span style=3D"font-family:&#39;consolas&#39;,monospac=
e;font-size:10pt"><br></span></div></div>

--0000000000001404400597c90fbb--
