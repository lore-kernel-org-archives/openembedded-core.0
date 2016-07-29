Return-Path: <ncrypticus@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 946DD607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 17:48:14 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id x130so59517123vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 10:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=6cMqqxshkpDtjflYFCo+ThJurwwViq6WUfRhqkEyDRY=;
	b=Pg5YUnHB4t8fTrETFuyJtSSrN/tvMlkwhIN4cvevxoRndrj7Vgqb96C3naD2T1NWc0
	6CHXynqRojsUtTKMhh3nAXFcjMbEBp92eypNWVspP9P6WFIiKrblOFiAgoG33pzrSi3P
	MLejbH48tlVpn+bIeaprnkIRmIpoVWVmozgJL2tJfHMD1VVA4ZH06vu/fuyGQfdQ4Pc9
	mwnfU6pT7OC3v3gMOUbFoPmg+TaXuo8yic323PgyN474oDSNSZp1m1tezJxsMN8VSU0f
	B7ySLLA+a6Peyf9IL0NN7S7D8SpQLvgrkbb7hSvhzq97cG4XN5vpYm02e2erTbNhl9GG
	08/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6cMqqxshkpDtjflYFCo+ThJurwwViq6WUfRhqkEyDRY=;
	b=SEroZ7/DTmsHnNWb9Umjd9BRYMLFp7g/QXF6Yc92nkmHvut0Scmnpwv7VNwzfAYX4H
	BULXnBAGpIjePTZfqWFCarvZRlOhWtdZMNkO74x+jnILnGGcliYANVrvShfE2lOGhuBJ
	77orW3V+5tuQiMTxu7W7r9eJBHPAowR9DQJ2KM9hkISY8m7mUuC1zhuTWOSrGyXeSU7k
	yCxCdpX4CfxPsTlGmOgmkliZnoX8NPZAu/ZFCMA3Ifuy33nWjvSn9t9g+nrCbJmZKKjc
	q/MbWVrRdO0vK1S0v5idaxxMbE7YlImncOnAiTWd1BqGkJFHWelhWZuleddkDMlbVBme
	2tag==
X-Gm-Message-State: AEkooutTcWS+e1EL2L18mgKMfJQap1c0HU5zzP/wXz0BPVbrvbviIwrSN3AFpE9qTzz34e1IAk2i139oJpUTMQ==
X-Received: by 10.31.171.72 with SMTP id u69mr19742380vke.119.1469814494635;
	Fri, 29 Jul 2016 10:48:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.112.2 with HTTP; Fri, 29 Jul 2016 10:48:14 -0700 (PDT)
From: Nemicolopterus Crypticus <ncrypticus@gmail.com>
Date: Fri, 29 Jul 2016 10:48:14 -0700
Message-ID: <CAMSG=xVPrR7peULZh4Ng+EVrjo5SXWwRBU2+o2XjFJGb_F-Xyw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: multilib support on Jethro: populate_sdk help
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
X-List-Received-Date: Fri, 29 Jul 2016 17:48:14 -0000
Content-Type: multipart/alternative; boundary=001a114403fad6aae60538c9da8b

--001a114403fad6aae60538c9da8b
Content-Type: text/plain; charset=UTF-8

Hello all,

We are having issues with our generated SDK files. We're using the jethro
branch, and have enabled multilib (see relevant portion of local.conf
below).

I can succesfully run the command to generate the SDK:
$ bitbake <recipe name> -c populate_sdk

But the output is incorrect. *While the aarch sysroots look good, the
sysroots for arm are completely missing. The environment setup script ends
up pointing to non-existent compilers. *Please let me know if you need more
information!

Steps to reproduce:
$ bitbake <recipe name> -c populate_sdk
$ cp tmp/deploy/sdk/<sdk-script>.sh /test/directory
$ cd /test/directory
$ bash <sdk-script>.sh
$ ls sysroots/
aarch64-poky-linux/   x86_64-pokysdk-linux/

Note the missing ARM directories.

Also, the setup script for arm sets this as the command for compiler:
 12 export CC="arm-pokymllib32-linux-gnueabi-gcc

But that compiler doesn't exist anywhere in the folder where I installed
everything, or environment!

So it appears that it's not completely or correctly packaging everything
for ARMv7.

The documentation does mention some environment variables
<http://www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-dev-environment>,
but it's not clear how those related to multilib.

For instance, none of our recipes have "SDKIMAGE_FEATURES" defined, but
clearly the aarch64 sysroots are getting populated correctly (we
succesfully compiled and ran a simple hello world).

*Can anyone point me to an example, or discuss a successful use of
"multilib" on the Jethro branch (given desparate brainstorming below),
share some more verbose documentation, or ask follow-up questions?*


_____________________________________________________________
Desperate brainstorming below:
I did find this years-old patch:
https://patchwork.openembedded.org/patch/30941/
Notably, the do_populate_sdk method in
poky/meta/classes/populate_sdk_base.bbclass iterates over the values listed
in the MULTILIB_VARIANTS variable:

+	variants = d.getVar("MULTILIB_VARIANTS", True) or ""+	for item in
variants.split():+		# Load overrides from 'd' to avoid having to reset
the value...+		overrides = d.getVar("OVERRIDES", False) +
":virtclass-multilib-" + item+		localdata.setVar("OVERRIDES",
overrides)+		bb.data.update_data(localdata)+		bb.build.exec_func("create_sdk_files",
localdata)



The latest version in Jethro does not have anything equivalent to that, but
I did not dig deeply into the code or the commit history.




______________________________________________________________
More data:

local.conf relevant section:
#
# Multilib configuration
#
# This sets any packages preprended with lib32- to be built with
# the armv7a tuning (32 bit) instead of 64 bit aarch.
#
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

--001a114403fad6aae60538c9da8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello all,<br><br></div>We are having issues wit=
h our=20
generated SDK files. We&#39;re using the jethro branch, and have enabled=20
multilib (see relevant portion of local.conf below).<br><br></div><div>I ca=
n succesfully run the command to generate the SDK:<br></div><div>$ bitbake =
&lt;recipe name&gt; -c populate_sdk<br><br></div><div>But the output is inc=
orrect. <b>While
 the aarch sysroots look good, the sysroots for arm are completely=20
missing. The environment setup script ends up pointing to non-existent=20
compilers. </b>Please let me know if you need more information!<br><br></di=
v><div>Steps to reproduce:<br></div><div>$ bitbake &lt;recipe name&gt; -c p=
opulate_sdk<br></div><div>$ cp tmp/deploy/sdk/&lt;sdk-script&gt;.sh /test/d=
irectory<br></div><div>$ cd /test/directory<br></div><div>$ bash &lt;sdk-sc=
ript&gt;.sh<br></div><div>$ ls sysroots/<br>aarch64-poky-linux/=C2=A0=C2=A0=
 x86_64-pokysdk-linux/ <br><br></div><div>Note the missing ARM directories.=
<br><br></div><div>Also, the setup script for arm sets this as the command =
for compiler:<br>=C2=A012 export CC=3D&quot;arm-pokymllib32-linux-gnueabi-g=
cc<br><br></div><div>But that compiler doesn&#39;t exist anywhere in the fo=
lder where I installed everything, or environment!<br><br></div><div>So it =
appears that it&#39;s not completely or correctly packaging everything for =
ARMv7.<br></div><div><br></div><div>The <a target=3D"_blank" href=3D"http:/=
/www.yoctoproject.org/docs/2.0/mega-manual/mega-manual.html#sdk-dev-environ=
ment">documentation does mention some environment variables</a>, but it&#39=
;s not clear how those related to multilib.<br><br></div><div>For
 instance, none of our recipes have &quot;SDKIMAGE_FEATURES&quot; defined, =
but=20
clearly the aarch64 sysroots are getting populated correctly (we=20
succesfully compiled and ran a simple hello world).<br><br></div><div><b>Ca=
n
 anyone point me to an example, or discuss a successful use of=20
&quot;multilib&quot; on the Jethro branch (given desparate brainstorming be=
low),=20
share some more verbose documentation, or ask follow-up questions?</b><br><=
/div><div><br></div><div><br>______________________________________________=
_______________<br></div><div>Desperate brainstorming below:<br></div><div>=
I did find this years-old patch: <a target=3D"_blank" href=3D"https://patch=
work.openembedded.org/patch/30941/">https://patchwork.openembedded.org/patc=
h/30941/</a><br></div><div>Notably, the do_populate_sdk method in poky/meta=
/classes/populate_sdk_base.bbclass iterates over the values listed in the M=
ULTILIB_VARIANTS variable:<br><br><pre><span>+	variants =3D d.getVar(&quot;=
MULTILIB_VARIANTS&quot;, True) or &quot;&quot;</span>
<span>+	for item in variants.split():</span>
<span>+		# Load overrides from &#39;d&#39; to avoid having to reset the val=
ue...</span>
<span>+		overrides =3D d.getVar(&quot;OVERRIDES&quot;, False) + &quot;:virt=
class-multilib-&quot; + item</span>
<span>+		localdata.setVar(&quot;OVERRIDES&quot;, overrides)</span>
<span>+		bb.data.update_data(localdata)</span>
<span>+		bb.build.exec_func(&quot;create_sdk_files&quot;, localdata)</span>=
</pre><br></div><div><br></div><div>The latest version in Jethro does not h=
ave anything equivalent to that, but I did not dig deeply into the code or =
the commit history.<br></div><div><br><br><br><br>_________________________=
_____________________________________<br></div><div>More data:<br></div><di=
v><br></div>local.conf relevant section:<br>#<br># Multilib configuration<b=
r>#<br># This sets any packages preprended with lib32- to be built with<br>=
# the armv7a tuning (32 bit) instead of 64 bit aarch.<br>#<br>require conf/=
multilib.conf<br>MULTILIBS =3D &quot;multilib:lib32&quot;<br>DEFAULTTUNE_vi=
rtclass-multilib-lib32 =3D &quot;armv7at-neon&quot;</div>

--001a114403fad6aae60538c9da8b--
