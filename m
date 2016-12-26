Return-Path: <skrishnakar@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 06B2E605BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 09:42:14 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c85so56355590wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 01:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=gOMUl1RdFV7N5uxwDEZ7f3pBWN3hvUvM799QS0hvW7w=;
	b=uDYjrZrCHfWroEfsWIwxxodL5i9L7J+JTcUZ92wwpnZKCpSTseZ2mv/i+7dSxqCLae
	LuK2h+Yo2dFEjcU6kCRwpE2nSV9kdR+lqjUmw+BJWn498BcfpCG1OU/+yE0/sZ5kZXYs
	8dWB1XwOxyahQ22jQyykuoGeRiBJLGrjPtMaNNlEwGYfd3wwSU3d55Qj9BEiBtzroH75
	Z5z0FXpAJ6Kj66iRtRyt3hcjkXim7cvy0C6S9Hdpgvu8FqKeDrK+xIIk+rd90ftP3h7z
	f4qpXoWwdd8dAXfk6zyBMdFa0wKTFlW8UDLvnsMRztyePGkgpj8IYPP6YepDYbNcKXSj
	WU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gOMUl1RdFV7N5uxwDEZ7f3pBWN3hvUvM799QS0hvW7w=;
	b=Z8LfL78ZF2P0RNtStu+++1faKWbN4oe+rx9EESfyfZ0v7BbN8mxRpW/LTK+bp8XXyd
	5USo665aIR2RpXVP+HFKZ/xFtrIy0YczN2MpZzgE853EJ5KdjQufuH3imken726Ha7N4
	w9uAs23mKT3xA79CdL59go5JyGunLNhTsN3UGaIiPplMXRrcVvB6D9V5cqOhpcUy8tCT
	2AUD5NVe1jq321dXmwoVin8fSBtJVx36OeKBgGufHUsoEqpIiWBAIvDUqjh5Vezj2gFX
	gvFE/F1PrH+/6G/7ZV1zNxYGzP7KAZtTSyJK+aPTXQ35L2kRQqDIdM7SsYvlQc5nRXsK
	muyA==
X-Gm-Message-State: AIkVDXJgX8r/NC/UkL+x3yqtKv7zWV6Ju8/WkUjBcbGf24ciOTYzacg5xcoRx2y2B4eGTXov6WwpgPejZaslRQ==
X-Received: by 10.28.136.198 with SMTP id k189mr22236759wmd.24.1482745335038; 
	Mon, 26 Dec 2016 01:42:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.134.9 with HTTP; Mon, 26 Dec 2016 01:41:34 -0800 (PST)
From: srikanth krishnakar <skrishnakar@gmail.com>
Date: Mon, 26 Dec 2016 15:11:34 +0530
Message-ID: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Mon, 26 Dec 2016 09:42:15 -0000
Content-Type: multipart/alternative; boundary=001a11443a8afcc7aa05448c8c01

--001a11443a8afcc7aa05448c8c01
Content-Type: text/plain; charset=UTF-8

Hello,

Environment: Ubuntu-14.04.5/16.04.1 (64-bit)
Yocto build: qemuarm
Target image: core-image-sato
Error nature: The lightdm restarts on its own and logs out by killing
processes running and brings up a login UI.


We have been observing yocto-2.2 build failures on Ubuntu 14.04.5 and
Ubuntu-16.04.1 hosts due to restart of "lightdm" (Light Desktop Manager)
 that is triggered by crash of "unity-settings-daemon", we couldn't figure
out any workaround so far to overcome the issue. The build goes fine in the
beginning but eventually the unity desktop logs out and kills all the
processes running in the user session (including bitbake) and lands us into
"Login screen" and when we login its a new session where as the bitbake
running in previous session is killed and we need to continue the build.
This is happening consistently when the user logs into desktop via lightdm
and triggers a build.

Another interesting thing to notice is the build goes fine if we connect to
host via. SSH session and invoke a bitbake build. We are suspecting on
unity-settings-daemon that is crashing consistently and is evident from the
".xsession-errors" log file as shown below:

builder@ubuntu:~$ cat .xsession-errors.old
Script for ibus started at run_im.
Script for auto started at run_im.
Script for default started at run_im.
init: Disconnected from notified D-Bus bus
init:"unity-settings-daemon main process (2076) terminated with status 1"
init: indicator-bluetooth main process (2212) killed by TERM signal
init: indicator-power main process (2214) killed by TERM signal
init: indicator-datetime main process (2215) killed by TERM signal
init: indicator-printers main process (2222) killed by TERM signal
init: indicator-session main process (2245) killed by TERM signal
init: indicator-application main process (2270) killed by TERM signal


Corresponding unity-settings-daemon bug reported in Launchpad:

https://bugs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/1546641

Would anyone kindly confirm the logout behaviour during bitbake process on
Ubuntu-14.04.5 & Ubuntu-16.04.1 ? Since Yocto 2.2 mentions both
Ubuntu-14.04 & 16.04 as supported distributions this blocker issue must be
resolved at earliest.

Appreciate your Inputs !

Thanks in Advance.
-Srikant

--001a11443a8afcc7aa05448c8c01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace">Hello,</font><div><fon=
t face=3D"monospace, monospace"><br></font></div><div><font face=3D"monospa=
ce, monospace">Environment: Ubuntu-14.04.5/16.04.1 (64-bit)</font></div><di=
v><font face=3D"monospace, monospace">Yocto build: qemuarm</font></div><div=
><font face=3D"monospace, monospace">Target image: core-image-sato</font></=
div><div><font face=3D"monospace, monospace">Error nature: The lightdm rest=
arts on its own and logs out by killing processes running and brings up a l=
ogin UI.=C2=A0</font></div><div><br></div><div><font face=3D"monospace, mon=
ospace"><br></font></div><div><font face=3D"monospace, monospace">We have b=
een observing yocto-2.2 build failures on Ubuntu 14.04.5 and Ubuntu-16.04.1=
 hosts due to restart of &quot;lightdm&quot; (Light Desktop Manager) =C2=A0=
that is triggered by crash of &quot;unity-settings-daemon&quot;, we couldn&=
#39;t figure out any workaround so far to overcome the issue. The build goe=
s fine in the beginning but eventually the unity desktop logs out and kills=
 all the processes running in the user session (including bitbake) and land=
s us into &quot;Login screen&quot; and when we login its a new session wher=
e as the bitbake running in previous session is killed and we need to conti=
nue the build. This is happening consistently when the user logs into deskt=
op via lightdm and triggers a build.=C2=A0</font></div><div><font face=3D"m=
onospace, monospace"><br></font></div><div><font face=3D"monospace, monospa=
ce">Another interesting thing to notice is the build goes fine if we connec=
t to host via. SSH session and invoke a bitbake build. We are suspecting on=
 unity-settings-daemon that is crashing consistently and is evident from th=
e &quot;.xsession-errors&quot; log file as shown below:</font></div><div><f=
ont face=3D"monospace, monospace"><br></font></div><div><pre class=3D"gmail=
-code-java" style=3D"margin-top:0px;margin-bottom:0px;padding:0px;max-heigh=
t:30em;overflow:auto;white-space:pre-wrap;word-wrap:normal;color:rgb(51,51,=
51);font-size:12px;background-color:rgb(245,245,245)">builder@ubuntu:~$ cat=
 .xsession-errors.old
Script <span class=3D"gmail-code-keyword" style=3D"color:rgb(0,0,145)">for<=
/span> ibus started at run_im.
Script <span class=3D"gmail-code-keyword" style=3D"color:rgb(0,0,145)">for<=
/span> auto started at run_im.
Script <span class=3D"gmail-code-keyword" style=3D"color:rgb(0,0,145)">for<=
/span> <span class=3D"gmail-code-keyword" style=3D"color:rgb(0,0,145)">defa=
ult</span> started at run_im.
init: Disconnected from notified D-Bus bus
init:<span class=3D"gmail-code-quote" style=3D"color:rgb(0,145,0)">&quot;un=
ity-settings-daemon main process (2076) terminated with status 1&quot;</spa=
n>
init: indicator-bluetooth main process (2212) killed by TERM signal
init: indicator-power main process (2214) killed by TERM signal
init: indicator-datetime main process (2215) killed by TERM signal
init: indicator-printers main process (2222) killed by TERM signal
init: indicator-session main process (2245) killed by TERM signal
init: indicator-application main process (2270) killed by TERM signal</pre>=
</div><div><font face=3D"monospace, monospace"><br></font></div><div><font =
face=3D"monospace, monospace">Corresponding unity-settings-daemon bug repor=
ted in Launchpad:</font></div><div><font face=3D"monospace, monospace"><br>=
</font></div><div><font face=3D"monospace, monospace"><a href=3D"https://bu=
gs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/1546641">https:/=
/bugs.launchpad.net/ubuntu/+source/unity-settings-daemon/+bug/1546641</a><b=
r></font></div><div><font face=3D"monospace, monospace"><br></font></div><d=
iv><font face=3D"monospace, monospace">Would anyone kindly confirm the logo=
ut behaviour during bitbake process on Ubuntu-14.04.5 &amp; Ubuntu-16.04.1 =
? Since Yocto 2.2 mentions both Ubuntu-14.04 &amp; 16.04 as supported distr=
ibutions this blocker issue must be resolved at earliest.=C2=A0</font></div=
><div><font face=3D"monospace, monospace"><br></font></div><div><font face=
=3D"monospace, monospace">Appreciate your Inputs !</font></div><div><font f=
ace=3D"monospace, monospace"><br></font></div><div><font face=3D"monospace,=
 monospace">Thanks in Advance.</font></div><div><font face=3D"monospace, mo=
nospace">-Srikant</font></div><div><font face=3D"monospace, monospace"><br>=
</font></div><div><pre class=3D"gmail-code-java" style=3D"margin-top:0px;ma=
rgin-bottom:0px;padding:0px;max-height:30em;overflow:auto;white-space:pre-w=
rap;word-wrap:normal;color:rgb(51,51,51);font-size:12px;background-color:rg=
b(245,245,245)"><br></pre></div></div>

--001a11443a8afcc7aa05448c8c01--
