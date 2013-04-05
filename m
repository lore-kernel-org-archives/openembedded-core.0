Received: from mail-lb0-f178.google.com ([209.85.217.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UO7lp-0007M4-LV
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 16:37:39 +0200
Received: by mail-lb0-f178.google.com with SMTP id q13so3746274lbi.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0DVNVInh0jHchE1y5V+fJHaP1mEJdhEggrQr+NR1bfw=;
	b=ZpdSgyE5azkHq2IKkO41ASgtjgK/H3H2U++GJUJ7tTo57K2yaoU1qvwZoBsTon++Qv
	6T6clA328zQwBByA5yH/VbQyyQjsMq3VvUZV4HkdajUAu5ttiiU6QQevFlT89WxCMEsy
	HjinLf0/YRNhAHu8LPG/edBhkxhgdsR+crJIdZYUYHc7N2KD0IK2sUmu6mkTgIxGzsZt
	aWOyMcUYl+F2OI00V39z7HENM0zS+/H+gdcZXmBAiZImsAZk4Wn/EtLXnBr1/BQiwyY9
	/zHODtaCpX94NI7GRBD13VP2JUgnXFrcjfGhP5SUCHEDUooErVhodi2HJViyDKrmZd2+
	ZMQA==
X-Received: by 10.112.132.2 with SMTP id oq2mr6115573lbb.5.1365171623208; Fri,
	05 Apr 2013 07:20:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.125.38 with HTTP; Fri, 5 Apr 2013 07:20:03 -0700 (PDT)
In-Reply-To: <515ED7D5.6080308@windriver.com>
References: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
	<1365122683-17652-1-git-send-email-kergoth@gmail.com>
	<515ED7D5.6080308@windriver.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 5 Apr 2013 07:20:03 -0700
Message-ID: <CABcZANmero-tncAWaex6xe-1SPn_TYEN5JMdrzcPDdhxPxGwaQ@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] oe.terminal: add tmux classes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 14:37:45 -0000
Content-Type: multipart/alternative; boundary=047d7b3a823aa8af4504d99dc9fc

--047d7b3a823aa8af4504d99dc9fc
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 5, 2013 at 6:55 AM, Jason Wessel <jason.wessel@windriver.com>wrote:

> On 04/04/2013 07:44 PM, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This adds two new Terminal classes. It's separated into two, so that
> opening
> > a split inside a tmux window is preferred to the other terminal types,
> but
> > opening a tmux session is prioritized only slightly higher than screen.
> >
> > - tmuxrunning: Open a new pane in the current running tmux window.
> Requires
> >   that the TMUX variable be added to the env whitelist to use it.
> > - tmux: Open a new tmux session
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  meta/lib/oe/terminal.py | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> > index 2e23d59..e52863f 100644
> > --- a/meta/lib/oe/terminal.py
> > +++ b/meta/lib/oe/terminal.py
> > @@ -142,6 +142,44 @@ class TmuxNewSession(Terminal):
> >          else:
> >              logger.warn(msg)
> >
> > +class TmuxRunning(Terminal):
> > +    """Open a new pane in the current running tmux window"""
> > +    name = 'tmux-running'
> > +    command = 'tmux split-window {command}'
> > +    priority = 2.75
> > +
> > +    def __init__(self, sh_cmd, title=None, env=None, d=None):
> > +        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
> > +            raise UnsupportedTerminal('tmux is not installed')
> > +
> > +        if not os.getenv('TMUX'):
> > +            raise UnsupportedTerminal('tmux is not running')
> > +
> > +        Terminal.__init__(self, sh_cmd, title, env, d)
>
>
> When we chatted yesterday I didn't fully understand how the Tmux Running
> piece worked.   Now I get it, you run tmux and then start a build with in
> that session and just join back to it when the TMUX var is set because that
> is how TMUX does internal communications setup.  I have to admit that is
> pretty slick. :-)
>
> It seems to me we can just fold these two classes together and drive it
> off the TMUX variable.   This way we can just have one OE TERMINAL type,
> and if you don't want the behavior to engage of the "split" you just unset
> TMUX before you build.   I believe that this covers all the cases you care
> about, and would allow for the simplistic case I care about where I just
> set OE_TERMINAL=tmux to work for both cases. I would recommend we just
> patch up the bitbake.conf BBHASH pieces all in one shot with this patch so
> their is nothing special anyone has to do to make use of this.
>
> Would you be ok with that?
>
> Further work that I'll probably consider doing if no one else does it
> first is to add tmux-native so we always have it as the fall back for
> getting to patch failures and such on a remote build server.


The problem with combining them is they'd be stuck at the same priority,
which makes 'auto' less useful. In the case where DISPLAY and TMUX are both
set, I think it makes more sense to prefer to interact with the running
tmux session rather than spawning a new xterm, yet spawning a new tmux
session should be kept at the same priority as screen to meet user
expectations.

A decent compromise, to make the explicit OE_TERMINAL=tmux case more
useful, would be to merge the tmuxrunning bits into tmux, but still keep
the independent tmuxrunning class for the 'auto' case. Thoughts on that?
-- 
Christopher Larson

--047d7b3a823aa8af4504d99dc9fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Apr 5, 2013 at 6:55 AM, Jason Wessel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@windr=
iver.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 04/04/2013 07:44 PM, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; This adds two new Terminal classes. It&#39;s separated into two, so th=
at opening<br>
&gt; a split inside a tmux window is preferred to the other terminal types,=
 but<br>
&gt; opening a tmux session is prioritized only slightly higher than screen=
.<br>
&gt;<br>
&gt; - tmuxrunning: Open a new pane in the current running tmux window. Req=
uires<br>
&gt; =C2=A0 that the TMUX variable be added to the env whitelist to use it.=
<br>
&gt; - tmux: Open a new tmux session<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/terminal.py | 38 +++++++++++++++++++++++++++++++++++=
+++<br>
&gt; =C2=A01 file changed, 38 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py<br>
&gt; index 2e23d59..e52863f 100644<br>
&gt; --- a/meta/lib/oe/terminal.py<br>
&gt; +++ b/meta/lib/oe/terminal.py<br>
&gt; @@ -142,6 +142,44 @@ class TmuxNewSession(Terminal):<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.warn(msg)<br>
&gt;<br>
&gt; +class TmuxRunning(Terminal):<br>
&gt; + =C2=A0 =C2=A0&quot;&quot;&quot;Open a new pane in the current runnin=
g tmux window&quot;&quot;&quot;<br>
&gt; + =C2=A0 =C2=A0name =3D &#39;tmux-running&#39;<br>
&gt; + =C2=A0 =C2=A0command =3D &#39;tmux split-window {command}&#39;<br>
&gt; + =C2=A0 =C2=A0priority =3D 2.75<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0def __init__(self, sh_cmd, title=3DNone, env=3DNone, d=
=3DNone):<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bb.utils.which(os.getenv(&#39;PATH=
&#39;), &#39;tmux&#39;):<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise UnsupportedTerminal(&=
#39;tmux is not installed&#39;)<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.getenv(&#39;TMUX&#39;):<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise UnsupportedTerminal(&=
#39;tmux is not running&#39;)<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0Terminal.__init__(self, sh_cmd, title, en=
v, d)<br>
<br>
<br>
</div></div>When we chatted yesterday I didn&#39;t fully understand how the=
 Tmux Running piece worked. =C2=A0 Now I get it, you run tmux and then star=
t a build with in that session and just join back to it when the TMUX var i=
s set because that is how TMUX does internal communications setup. =C2=A0I =
have to admit that is pretty slick. :-)<br>


<br>
It seems to me we can just fold these two classes together and drive it off=
 the TMUX variable. =C2=A0 This way we can just have one OE TERMINAL type, =
and if you don&#39;t want the behavior to engage of the &quot;split&quot; y=
ou just unset TMUX before you build. =C2=A0 I believe that this covers all =
the cases you care about, and would allow for the simplistic case I care ab=
out where I just set OE_TERMINAL=3Dtmux to work for both cases. I would rec=
ommend we just patch up the bitbake.conf BBHASH pieces all in one shot with=
 this patch so their is nothing special anyone has to do to make use of thi=
s.<br>


<br>
Would you be ok with that?<br>
<br>
Further work that I&#39;ll probably consider doing if no one else does it f=
irst is to add tmux-native so we always have it as the fall back for gettin=
g to patch failures and such on a remote build server.</blockquote></div>

<br>The problem with combining them is they&#39;d be stuck at the same prio=
rity, which makes &#39;auto&#39; less useful. In the case where DISPLAY and=
 TMUX are both set, I think it makes more sense to prefer to interact with =
the running tmux session rather than spawning a new xterm, yet spawning a n=
ew tmux session should be kept at the same priority as screen to meet user =
expectations.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>A dec=
ent compromise, to make the explicit OE_TERMINAL=3Dtmux case more useful, w=
ould be to merge the tmuxrunning bits into tmux, but still keep the indepen=
dent tmuxrunning class for the &#39;auto&#39; case. Thoughts on that?</div>

<div class=3D"gmail_extra">-- <br>Christopher Larson</div></div>

--047d7b3a823aa8af4504d99dc9fc--
