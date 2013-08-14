Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 18340600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:35:38 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id o17so12494174oag.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 23:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5bDreOwnl+MnQmbdNzNokTJiWnKIiClZWIfvWRLu5Kw=;
	b=aIQH/nqk1I7tPphSS0uiHRY9BfdUlAyLYw9ZxEzEpdTO4eTqGslhq7V5ht59gzRChV
	skDQxjn6mT0mczd3wtMFb/rO4GMoAVZHYMJBsoL/YvwyQ+2Duwh03w4wEU9ZjUFedRAR
	8JoghrSUg20VeFiXcQPAT5y4d7ZWaHaYq0fK1veCbyxT3CPyPzN9vagHsRKFJqR6aEfe
	5HMozAQ+2jYG1Aki4/YPd9dCpVFramhdCUlAyAcWkISBAqdlGnq0Ca7EwFrH27L6hCmm
	FIOLEFGX2PdwCPb261qIuEcU+M1MjVXaJOxcTcUh7AxivWOwV88f+UvCCVDX7fHotfSU
	wMWQ==
X-Gm-Message-State: ALoCoQndztC6+wXhIMgywml+2B8IyI/pM3xcMZ4IgnrUsYCLHJpK9mwGtDnuTtH7i7fb0vswKpdW
X-Received: by 10.60.133.233 with SMTP id pf9mr8199042oeb.46.1376462138729;
	Tue, 13 Aug 2013 23:35:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.172.4 with HTTP; Tue, 13 Aug 2013 23:35:18 -0700 (PDT)
In-Reply-To: <CAJ86T=UDy7FJWR735GcK3bWZxmwRrGPdinfb+f49Wc1dEmg+ZQ@mail.gmail.com>
References: <CAJ86T=UDy7FJWR735GcK3bWZxmwRrGPdinfb+f49Wc1dEmg+ZQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 14 Aug 2013 08:35:18 +0200
Message-ID: <CAP71Wjz1HsDcEQcV0MjXDiKLzo7OfE7H=DCuPBf_f0uwe3-+hw@mail.gmail.com>
To: Andre <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan]devshell: broken
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
X-List-Received-Date: Wed, 14 Aug 2013 06:35:38 -0000
Content-Type: multipart/alternative; boundary=047d7b472078d37bb204e3e2907f

--047d7b472078d37bb204e3e2907f
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 7:54 AM, Andre <armccurdy@gmail.com> wrote:

> bitbake -c devshell seems to have stopped working (tested with xterm
> and mate-terminal) in dylan since this commit:
>
>   a749f06 terminal: Run command using a wrapper script
>
> It looks like the run.do_devshell.<PID> script is generated but then
> fails to run when passed to a terminal.
>
> A possible clue is that after manually editing the do_devshell script
> to replace:
>
>   do_terminal() {
>   exec pseudo /bin/bash
>   }
>
> with:
>
>   do_terminal() {
>   exec /bin/bash
>   }
>
> the script runs OK when passed to a terminal manually, such as:
>
>   $ xterm -e tmp/work/.../temp/run.do_terminal.25789
>

I am observing the same issue here. I have tested 'devshell' against master
and dylan, and master seems to be working fine.

Here are the 2 generated run.do_terminal script for bitbake -c devshell
busybox

with dylan branch (failing) http://pastebin.com/jyBW2jEf

with master branch (working) http://pastebin.com/PHxJvj0k

 The problem when using the detault terminal (hence gnome-terminal in my
case), is that the gnome terminal windows shows up but very quickly
disappears. If I set OE_TERMINAL="screen", then i get something like that
in the failing case:
Currently 1 running tasks (67 of 67):
0: busybox-1.20.2-r8 do_devshell (pid 7566)
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded:
ignored.
There is no screen to be resumed matching devshell_7566.
Trying to run: screen -r devshell_7566
WARNING: Screen started. Please connect in another terminal with "screen -r
devshell_7566"
NOTE: Tasks Summary: Attempted 67 tasks of which 66 didn't need to be rerun
and all succeeded.

and it stops, and there is no screen session.

If I revert "a749f06 terminal: Run command using a wrapper script" from
oe-core dylan, it works again.

thx

--047d7b472078d37bb204e3e2907f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 14, 2013 at 7:54 AM, Andre <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"overflow:hidden">bitbake -c devshell seems t=
o have stopped working (tested with xterm<br>



and mate-terminal) in dylan since this commit:<br>
<br>
=A0 a749f06 terminal: Run command using a wrapper script<br>
<br>
It looks like the run.do_devshell.&lt;PID&gt; script is generated but then<=
br>
fails to run when passed to a terminal.<br>
<br>
A possible clue is that after manually editing the do_devshell script<br>
to replace:<br>
<br>
=A0 do_terminal() {<br>
=A0 exec pseudo /bin/bash<br>
=A0 }<br>
<br>
with:<br>
<br>
=A0 do_terminal() {<br>
=A0 exec /bin/bash<br>
=A0 }<br>
<br>
the script runs OK when passed to a terminal manually, such as:<br>
<br>
=A0 $ xterm -e tmp/work/.../temp/run.do_terminal.25789</div></blockquote></=
div><br>I am observing the same issue here. I have tested &#39;devshell&#39=
; against master and dylan, and master seems to be working fine.=A0</div><d=
iv class=3D"gmail_extra">


<br></div><div class=3D"gmail_extra">Here are the 2 generated run.do_termin=
al script for bitbake -c devshell busybox</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">with dylan branch (failing)=A0<a href=
=3D"http://pastebin.com/jyBW2jEf" target=3D"_blank">http://pastebin.com/jyB=
W2jEf</a><br>


</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">with =
master branch (working)=A0<a href=3D"http://pastebin.com/PHxJvj0k" target=
=3D"_blank">http://pastebin.com/PHxJvj0k</a></div><div class=3D"gmail_extra=
"><br></div>

<div class=3D"gmail_extra">
The problem when using the detault terminal (hence gnome-terminal in my cas=
e), is that the gnome terminal windows shows up but very quickly disappears=
. If I set OE_TERMINAL=3D&quot;screen&quot;, then i get something like that=
 in the failing case:</div>


<div class=3D"gmail_extra"><div class=3D"gmail_extra">Currently 1 running t=
asks (67 of 67):</div><div class=3D"gmail_extra">0: busybox-1.20.2-r8 do_de=
vshell (pid 7566)</div><div class=3D"gmail_extra">Trying to run: screen -r =
devshell_7566</div>

<div class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from=
 LD_PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">T=
here is no screen to be resumed matching devshell_7566.</div><div class=3D"=
gmail_extra">

Trying to run: screen -r devshell_7566</div><div class=3D"gmail_extra">ERRO=
R: ld.so: object &#39;libpseudo.so&#39; from LD_PRELOAD cannot be preloaded=
: ignored.</div><div class=3D"gmail_extra">There is no screen to be resumed=
 matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">ERROR: ld.so: object &#39;libpseudo.so&#39; from LD_=
PRELOAD cannot be preloaded: ignored.</div><div class=3D"gmail_extra">There=
 is no screen to be resumed matching devshell_7566.</div>

<div class=3D"gmail_extra">Trying to run: screen -r devshell_7566</div><div=
 class=3D"gmail_extra">WARNING: Screen started. Please connect in another t=
erminal with &quot;screen -r devshell_7566&quot;</div><div class=3D"gmail_e=
xtra">

NOTE: Tasks Summary: Attempted 67 tasks of which 66 didn&#39;t need to be r=
erun and all succeeded.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">and it stops, and there is no screen session.</div><div>
<br>
</div><div>If I revert &quot;a749f06 terminal: Run command using a wrapper =
script&quot; from oe-core dylan, it works again.</div><div><br></div><div>t=
hx</div></div><div class=3D"gmail_extra"><br></div></div>

--047d7b472078d37bb204e3e2907f--
