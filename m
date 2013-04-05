Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UOF6h-0001pJ-2A
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 00:27:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r35MALxN028245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Apr 2013 15:10:21 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 5 Apr 2013 15:10:21 -0700
Message-ID: <515F4BCB.6040806@windriver.com>
Date: Fri, 5 Apr 2013 17:10:19 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Chris Larson <kergoth@gmail.com>
References: <1365101122-15705-1-git-send-email-kergoth@gmail.com>
	<1365122683-17652-1-git-send-email-kergoth@gmail.com>
	<515ED7D5.6080308@windriver.com>
	<CABcZANmero-tncAWaex6xe-1SPn_TYEN5JMdrzcPDdhxPxGwaQ@mail.gmail.com>
In-Reply-To: <CABcZANmero-tncAWaex6xe-1SPn_TYEN5JMdrzcPDdhxPxGwaQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
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
X-List-Received-Date: Fri, 05 Apr 2013 22:27:46 -0000
Content-Type: multipart/alternative;
	boundary="------------020809080903070805010201"

--------------020809080903070805010201
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 04/05/2013 09:20 AM, Chris Larson wrote:
>
> On Fri, Apr 5, 2013 at 6:55 AM, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     On 04/04/2013 07:44 PM, Christopher Larson wrote:
>     > From: Christopher Larson <chris_larson@mentor.com <mailto:chris_larson@mentor.com>>
>     >
>     > This adds two new Terminal classes. It's separated into two, so that opening
>     > a split inside a tmux window is preferred to the other terminal types, but
>     > opening a tmux session is prioritized only slightly higher than screen.
>     >
>     > - tmuxrunning: Open a new pane in the current running tmux window. Requires
>     >   that the TMUX variable be added to the env whitelist to use it.
>     > - tmux: Open a new tmux session
>     >
>     > Signed-off-by: Christopher Larson <chris_larson@mentor.com <mailto:chris_larson@mentor.com>>
>     > ---
>     >  meta/lib/oe/terminal.py | 38 ++++++++++++++++++++++++++++++++++++++
>     >  1 file changed, 38 insertions(+)
>     >
>     > diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>     > index 2e23d59..e52863f 100644
>     > --- a/meta/lib/oe/terminal.py
>     > +++ b/meta/lib/oe/terminal.py
>     > @@ -142,6 +142,44 @@ class TmuxNewSession(Terminal):
>     >          else:
>     >              logger.warn(msg)
>     >
>     > +class TmuxRunning(Terminal):
>     > +    """Open a new pane in the current running tmux window"""
>     > +    name = 'tmux-running'
>     > +    command = 'tmux split-window {command}'
>     > +    priority = 2.75
>     > +
>     > +    def __init__(self, sh_cmd, title=None, env=None, d=None):
>     > +        if not bb.utils.which(os.getenv('PATH'), 'tmux'):
>     > +            raise UnsupportedTerminal('tmux is not installed')
>     > +
>     > +        if not os.getenv('TMUX'):
>     > +            raise UnsupportedTerminal('tmux is not running')
>     > +
>     > +        Terminal.__init__(self, sh_cmd, title, env, d)
>
>
>     When we chatted yesterday I didn't fully understand how the Tmux Running piece worked.   Now I get it, you run tmux and then start a build with in that session and just join back to it when the TMUX var is set because that is how TMUX does internal communications setup.  I have to admit that is pretty slick. :-)
>
>     It seems to me we can just fold these two classes together and drive it off the TMUX variable.   This way we can just have one OE TERMINAL type, and if you don't want the behavior to engage of the "split" you just unset TMUX before you build.   I believe that this covers all the cases you care about, and would allow for the simplistic case I care about where I just set OE_TERMINAL=tmux to work for both cases. I would recommend we just patch up the bitbake.conf BBHASH pieces all in one shot with this patch so their is nothing special anyone has to do to make use of this.
>
>     Would you be ok with that?
>
>     Further work that I'll probably consider doing if no one else does it first is to add tmux-native so we always have it as the fall back for getting to patch failures and such on a remote build server.
>
>
> The problem with combining them is they'd be stuck at the same priority, which makes 'auto' less useful. In the case where DISPLAY and TMUX are both set, I think it makes more sense to prefer to interact with the running tmux session rather than spawning a new xterm, yet spawning a new tmux session should be kept at the same priority as screen to meet user expectations.
>
> A decent compromise, to make the explicit OE_TERMINAL=tmux case more useful, would be to merge the tmuxrunning bits into tmux, but still keep the independent tmuxrunning class for the 'auto' case. Thoughts on that?


Based on how the auto list processing works your latest proposed solution seems like the most reasonable choice.

Thanks,
Jason.

--------------020809080903070805010201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id r35MALxN028245

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 04/05/2013 09:20 AM, Chris Larson
      wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CABcZANmero-tncAWaex6xe-1SPn_TYEN5JMdrzcPDdhxPxGwaQ@mail.gmai=
l.com"
      type=3D"cite">
      <meta http-equiv=3D"Context-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Fri, Apr 5, 2013 at 6:55 AM, Jaso=
n
            Wessel <span dir=3D"ltr">&lt;<a moz-do-not-send=3D"true"
                href=3D"mailto:jason.wessel@windriver.com" target=3D"_bla=
nk">jason.wessel@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote">
              <div class=3D"HOEnZb adM">
                <div class=3D"h5">On 04/04/2013 07:44 PM, Christopher
                  Larson wrote:<br>
                  &gt; From: Christopher Larson &lt;<a
                    moz-do-not-send=3D"true"
                    href=3D"mailto:chris_larson@mentor.com">chris_larson@=
mentor.com</a>&gt;<br>
                  &gt;<br>
                  &gt; This adds two new Terminal classes. It's
                  separated into two, so that opening<br>
                  &gt; a split inside a tmux window is preferred to the
                  other terminal types, but<br>
                  &gt; opening a tmux session is prioritized only
                  slightly higher than screen.<br>
                  &gt;<br>
                  &gt; - tmuxrunning: Open a new pane in the current
                  running tmux window. Requires<br>
                  &gt; =C2=A0 that the TMUX variable be added to the env
                  whitelist to use it.<br>
                  &gt; - tmux: Open a new tmux session<br>
                  &gt;<br>
                  &gt; Signed-off-by: Christopher Larson &lt;<a
                    moz-do-not-send=3D"true"
                    href=3D"mailto:chris_larson@mentor.com">chris_larson@=
mentor.com</a>&gt;<br>
                  &gt; ---<br>
                  &gt; =C2=A0meta/lib/oe/terminal.py | 38
                  ++++++++++++++++++++++++++++++++++++++<br>
                  &gt; =C2=A01 file changed, 38 insertions(+)<br>
                  &gt;<br>
                  &gt; diff --git a/meta/lib/oe/terminal.py
                  b/meta/lib/oe/terminal.py<br>
                  &gt; index 2e23d59..e52863f 100644<br>
                  &gt; --- a/meta/lib/oe/terminal.py<br>
                  &gt; +++ b/meta/lib/oe/terminal.py<br>
                  &gt; @@ -142,6 +142,44 @@ class
                  TmuxNewSession(Terminal):<br>
                  &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
                  &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo=
gger.warn(msg)<br>
                  &gt;<br>
                  &gt; +class TmuxRunning(Terminal):<br>
                  &gt; + =C2=A0 =C2=A0"""Open a new pane in the current r=
unning
                  tmux window"""<br>
                  &gt; + =C2=A0 =C2=A0name =3D 'tmux-running'<br>
                  &gt; + =C2=A0 =C2=A0command =3D 'tmux split-window {com=
mand}'<br>
                  &gt; + =C2=A0 =C2=A0priority =3D 2.75<br>
                  &gt; +<br>
                  &gt; + =C2=A0 =C2=A0def __init__(self, sh_cmd, title=3D=
None,
                  env=3DNone, d=3DNone):<br>
                  &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if not bb.utils.which=
(os.getenv('PATH'),
                  'tmux'):<br>
                  &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise U=
nsupportedTerminal('tmux is
                  not installed')<br>
                  &gt; +<br>
                  &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.getenv('TMU=
X'):<br>
                  &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise U=
nsupportedTerminal('tmux is
                  not running')<br>
                  &gt; +<br>
                  &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0Terminal.__init__(sel=
f, sh_cmd, title,
                  env, d)<br>
                  <br>
                  <br>
                </div>
              </div>
              When we chatted yesterday I didn't fully understand how
              the Tmux Running piece worked. =C2=A0 Now I get it, you run
              tmux and then start a build with in that session and just
              join back to it when the TMUX var is set because that is
              how TMUX does internal communications setup. =C2=A0I have t=
o
              admit that is pretty slick. :-)<br>
              <br>
              It seems to me we can just fold these two classes together
              and drive it off the TMUX variable. =C2=A0 This way we can =
just
              have one OE TERMINAL type, and if you don't want the
              behavior to engage of the "split" you just unset TMUX
              before you build. =C2=A0 I believe that this covers all the
              cases you care about, and would allow for the simplistic
              case I care about where I just set OE_TERMINAL=3Dtmux to
              work for both cases. I would recommend we just patch up
              the bitbake.conf BBHASH pieces all in one shot with this
              patch so their is nothing special anyone has to do to make
              use of this.<br>
              <br>
              Would you be ok with that?<br>
              <br>
              Further work that I'll probably consider doing if no one
              else does it first is to add tmux-native so we always have
              it as the fall back for getting to patch failures and such
              on a remote build server.</blockquote>
          </div>
          <br>
          The problem with combining them is they'd be stuck at the same
          priority, which makes 'auto' less useful. In the case where
          DISPLAY and TMUX are both set, I think it makes more sense to
          prefer to interact with the running tmux session rather than
          spawning a new xterm, yet spawning a new tmux session should
          be kept at the same priority as screen to meet user
          expectations.</div>
        <div class=3D"gmail_extra"><br>
        </div>
        <div class=3D"gmail_extra">A decent compromise, to make the
          explicit OE_TERMINAL=3Dtmux case more useful, would be to merge
          the tmuxrunning bits into tmux, but still keep the independent
          tmuxrunning class for the 'auto' case. Thoughts on that?</div>
      </div>
    </blockquote>
    <br>
    <br>
    Based on how the auto list processing works your latest proposed
    solution seems like the most reasonable choice.<br>
    <br>
    Thanks,<br>
    Jason.<br>
  </body>
</html>

--------------020809080903070805010201--
