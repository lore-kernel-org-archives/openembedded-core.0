Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F480C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 11:48:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.13976.1706269717159803794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 03:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoNLv8Xv;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33922d2cb92so394159f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706269715; x=1706874515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkl+J8RaJTqepn7jXHO1mls2nVWo7nDuD5kVX+0mjnU=;
        b=CoNLv8Xv+uWxbWPgoq0pvF6ZiYJatUIOVNYOzpvQIKVCulppIiWwEfpa2rbi8hYOs+
         a0z6/UvsoK+RjNvcYm/zMyBl8DTUuRyNrGmqGd8Hj99uWNrU0tnCFeMRHLrlibuUwsD2
         AJo3c9BnTzJF+0DSPz0uE9pkBqOlzFzGqlpnAmrTb1RxGuIosLlNL/+kNvSbh6MzWqEh
         s1pTu55P77hm52sGf6+u8/BfEx/VeD6x3JWFB+btvpaup9U5m/V+8A2sa+o2V26gGpK6
         F7qGKUUggaPbMb+KSQLi9g8lWOnRtGKmNdFB8Zy7LXnYb32AvfoeoZmo8iGdPe9BG7Wg
         NRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706269715; x=1706874515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vkl+J8RaJTqepn7jXHO1mls2nVWo7nDuD5kVX+0mjnU=;
        b=eQU7cH/LVWpmijakeCtJv2Mt5yppoUJ/ISng/z73kfTL+zHsw0+94b0BfqLkixgxXp
         6uHb13FcJa2GgkDVrLY/3umAKiKPAUDP21H/ZMl7Ckrdkhu8Nb3oOdzVPqQEpgE6AlNk
         Q4GY5Os+fOp4tiemR/Aj8Rr68P8MIUH8CHKSbirco41HD3FV0N3MmQXf/T+myteSh2kN
         g4ZbDWYdrntMAAXS5UlWADtzVbo/0vrQEJ8sUvgEyb0veUT3KGAI9cQlPK4Hlee3te1v
         7+YYQsTkfggcuQ24JbFAuEbt17mVqhXpT/A3pBlFIRmMK+FTLb7Y5qzYYeU727pQIE/I
         kAXA==
X-Gm-Message-State: AOJu0Yz9Xluy8i3SWTDz6dWRG/acxWD0TAkTtL9rbJXvAzhufbgn4hTm
	VA1yG+rh0KWv0zrq37WxxXxUgRrWlJecA7+g7XS1SrXh3uLK2tXBLfKlYupQWOamamv0ckFahcB
	fnkHaiouIyfKoFPYFC7AyNocpD3Y=
X-Google-Smtp-Source: AGHT+IEvvSHI0s7yJDTDywlqyIq72E+5UWlu4UpCHFMSXlI+HkvCTXZKGQ/42rRjepeqXxlhH0rMCH7yAcTClkWlEVU=
X-Received: by 2002:a05:6000:18cf:b0:339:58e4:7f6f with SMTP id
 w15-20020a05600018cf00b0033958e47f6fmr420463wrq.195.1706269715188; Fri, 26
 Jan 2024 03:48:35 -0800 (PST)
MIME-Version: 1.0
References: <4ed80c78-5940-454d-b4a7-a820f04f0f08@gmail.com>
 <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com> <fdb4acea-aa26-402c-929e-5a2a789884f5@gmail.com>
In-Reply-To: <fdb4acea-aa26-402c-929e-5a2a789884f5@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 Jan 2024 12:48:20 +0100
Message-ID: <CA+chaQcb8GkLOWvKkPjKWmsfeLm5nB=-sFZLMt0Ev6nK_9CjDQ@mail.gmail.com>
Subject: Re: [OE-core] bb.utils.vercmp_string_op() vs Python 3.12
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000043d2aa060fd7e0df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 11:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194354

--00000000000043d2aa060fd7e0df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 12:14=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com>
wrote:

> 2024. 01. 26. 11:53 keltez=C3=A9ssel, Martin Jansa =C3=ADrta:
> > > I copied vercmp_string_op() and all others called by it from
> bitbake/lib/bb/utils.py
> > into a new python script.
> >
> > It's not an issue in vercmp_string_op itself,
>
> I already know this.
> Apparently you haven't read my mail fully for the conclusion.
>

I did and you said that you were testing vercmp_string_op in jack, instead
of looking at waf --version.

> but the version value it gets from waf --version isn't just the version
> itself but also
> > SyntaxWarning from waf.
>
> That is not a problem in itself as the preceding call only collects the
> stdout:
>
> result =3D subprocess.check_output([python, wafbin, '--version'],
> cwd=3Dsubsrcdir,
> stderr=3Dsubprocess.STDOUT)
>
> SyntaxWarning goes (or should go) to stderr.
>

Which goes to stdout as configured in this call.

After applying
https://gitlab.com/ita1024/waf/-/commit/d2060dfd8af4edb5824153ff24e207b39ec=
d67a2.patch
to fix:
| DEBUG: Executing shell function do_configure
| Traceback (most recent call last):
|   File
"/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/./waf",
line 166, in <module>
|     from waflib import Scripting
|   File
"/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/=
Scripting.py",
line 10, in <module>
|     from waflib import Utils, Configure, Logs, Options, ConfigSet,
Context, Errors, Build, Node
|   File
"/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/=
Configure.py",
line 16, in <module>
|     from waflib import ConfigSet, Utils, Options, Logs, Context, Build,
Errors
|   File
"/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/=
Options.py",
line 14, in <module>
|     from waflib import Logs, Utils, Context, Errors
|   File
"/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/=
Context.py",
line 9, in <module>
|     import os, re, imp, sys
| ModuleNotFoundError: No module named 'imp'

martin@jama
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git $ git
diff
diff --git a/waflib/Context.py b/waflib/Context.py
index 761b521f..38ab03f1 100644
--- a/waflib/Context.py
+++ b/waflib/Context.py
@@ -6,10 +6,17 @@
 Classes and functions enabling the command system
 """

-import os, re, imp, sys
+import os, re, sys
 from waflib import Utils, Errors, Logs
 import waflib.Node

+if sys.hexversion > 0x3040000:
+ import types
+ class imp(object):
+         new_module =3D lambda x: types.ModuleType(x)
+else:
+ import imp
+
 # the following 3 constants are updated on each new release (do not touch)
 HEXVERSION=3D0x2000c00
 """Constant updated on new releases"""

The SyntaxWarning is easily reproducible:

martin@jama
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git $
python3 waf --version
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/C=
ontext.py:617:
SyntaxWarning: invalid escape sequence '\_'
  """
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/B=
uild.py:107:
SyntaxWarning: invalid escape sequence '\*'
  """List of targets to build (default: \*)"""
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/T=
ask.py:1047:
SyntaxWarning: invalid escape sequence '\w'
  re_cond =3D re.compile('(?P<var>\w+)|(?P<or>\|)|(?P<and>&)')
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/T=
askGen.py:730:
SyntaxWarning: invalid escape sequence '\w'
  re_m4 =3D re.compile('@(\w+)@', re.M)
waf 2.0.12 (54841218840ffa34fddf834680a5a17db69caa12)

martin@jama
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git $
python3 --version
Python 3.12.1

When this part is moved into a minimal test case, there is no error at all.
>
> The error only happens inside bitbake and there was no such problem
> with Python 3.11.x or earlier.
>
> Ergo, the problem must be a Python 3.12 issue.
> The actual version here is python3-3.12.1-2.fc39.x86_64 for me.
>
> > So you need to update waf in jack not to trigger SyntaxWarning when waf
> --version is called.
> >
> > On Fri, Jan 26, 2024 at 10:17=E2=80=AFAM Zoltan Boszormenyi <zboszor@gm=
ail.com>
> wrote:
> >
> >     Hi,
> >
> >     Just a FYI.
> >
> >     After the bitbake-server getting stuck after bitbake exited
> >     with Python 3.12 issue was fixed, here's another one.
> >
> >     This time it's semi-reliably triggered by the jack recipe
> >     in meta-openembedded:
> >
> >     ERROR: jack-1.19.22-r0 do_configure: Error executing a python
> function in
> >     exec_func_python() autogenerated:
> >
> >     The stack trace of python calls that resulted in this
> exception/failure was:
> >     File: 'exec_func_python() autogenerated', lineno: 2, function:
> <module>
> >           0001:
> >       *** 0002:waf_preconfigure(d)
> >           0003:
> >     File:
> >
>  '/home/zozo/test-yocto-4.3-gh/conf/../layers/openembedded-core/meta/clas=
ses-recipe/waf.bbclass',
> >
> >     lineno: 58, function: waf_preconfigure
> >           0054:    wafbin =3D os.path.join(subsrcdir, 'waf')
> >           0055:    try:
> >           0056:        result =3D subprocess.check_output([python, wafb=
in,
> '--version'],
> >     cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
> >           0057:        version =3D result.decode('utf-8').split()[1]
> >       *** 0058:        if bb.utils.vercmp_string_op(version, "1.8.7",
> ">=3D"):
> >           0059:            d.setVar("WAF_EXTRA_CONF", "--bindir=3D${bin=
dir}
> >     --libdir=3D${libdir}")
> >           0060:    except subprocess.CalledProcessError as e:
> >           0061:        bb.warn("Unable to execute waf --version, exit
> code %d. Assuming waf
> >     version without bindir/libdir support." % e.returncode)
> >           0062:    except FileNotFoundError:
> >     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py',
> lineno: 150, function:
> >     vercmp_string_op
> >           0146:    Compare two versions and check if the specified
> comparison operator
> >     matches
> >     the result of the comparison.
> >           0147:    This function is fairly liberal about what operators
> it will accept
> >     since
> >     there are a variety of styles
> >           0148:    depending on the context.
> >           0149:    """
> >       *** 0150:    res =3D vercmp_string(a, b)
> >           0151:    if op in ('=3D', '=3D=3D'):
> >           0152:        return res =3D=3D 0
> >           0153:    elif op =3D=3D '<=3D':
> >           0154:        return res <=3D 0
> >     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py',
> lineno: 140, function:
> >     vercmp_string
> >           0136:    return r
> >           0137:
> >           0138:def vercmp_string(a, b):
> >           0139:    """ Split version strings and compare them """
> >       *** 0140:    ta =3D split_version(a)
> >           0141:    tb =3D split_version(b)
> >           0142:    return vercmp(ta, tb)
> >           0143:
> >           0144:def vercmp_string_op(a, b, op):
> >     File: '/home/zozo/test-yocto-4.3-gh/bitbake/lib/bb/utils.py',
> lineno: 91, function:
> >     split_version
> >           0087:    """Split a version string into its constituent parts
> (PE, PV, PR)"""
> >           0088:    s =3D s.strip(" <>=3D")
> >           0089:    e =3D 0
> >           0090:    if s.count(':'):
> >       *** 0091:        e =3D int(s.split(":")[0])
> >           0092:        s =3D s.split(":")[1]
> >           0093:    r =3D ""
> >           0094:    if s.count('-'):
> >           0095:        r =3D s.rsplit("-", 1)[1]
> >     Exception: ValueError: invalid literal for int() with base 10:
> 'SyntaxWarning'
> >
> >     ERROR: Logfile of failure stored in:
> >
>  /home/zozo/test-yocto-4.3-gh/tmp-sicom-glibc/work/corei7-64-oe-linux/jac=
k/1.19.22/temp/log.do_configure.1709417
> >
> >     "Semi-reliably", i.e. about 50-50 or 60-40 percent failure vs
> success rate.
> >     Usually the second run succeeds after a failure.
> >
> >     I copied vercmp_string_op() and all others called by it
> >     from bitbake/lib/bb/utils.py into a new python script as a
> >     minimum test case. Running this script inside a locally
> >     cloned jack git repository has 100% success rate.
> >
> >     It looks like an internal Python "flake" issue.
> >
> >     Best regards,
> >     Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#194348):
> >     https://lists.openembedded.org/g/openembedded-core/message/194348
> >     Mute This Topic: https://lists.openembedded.org/mt/103973063/361715=
6
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> >     [martin.jansa@gmail.com]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000043d2aa060fd7e0df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 26, 2024 at 12:14=E2=80=
=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@=
gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">2024. 01. 26. 11:53 keltez=C3=A9ssel, Martin Ja=
nsa =C3=ADrta:<br>
&gt; &gt; I copied=C2=A0vercmp_string_op() and all others called by it from=
 bitbake/lib/bb/utils.py <br>
&gt; into a new python script.<br>
&gt;<br>
&gt; It&#39;s not an issue in vercmp_string_op itself,<br>
<br>
I already know this.<br>
Apparently you haven&#39;t read my mail fully for the conclusion.<br></bloc=
kquote><div><br></div><div>I did and you said that you were testing vercmp_=
string_op in jack, instead of looking at waf --version.</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; but the version value it gets from waf --version isn&#39;t just the ve=
rsion itself but also <br>
&gt; SyntaxWarning from waf.<br>
<br>
That is not a problem in itself as the preceding call only collects the std=
out:<br>
<br>
result =3D subprocess.check_output([python, wafbin, &#39;--version&#39;], c=
wd=3Dsubsrcdir, <br>
stderr=3Dsubprocess.STDOUT)<br>
<br>
SyntaxWarning goes (or should go) to stderr.<br></blockquote><div><br></div=
><div>Which goes to stdout as configured in this call.</div><div><br></div>=
<div>After applying=C2=A0<a href=3D"https://gitlab.com/ita1024/waf/-/commit=
/d2060dfd8af4edb5824153ff24e207b39ecd67a2.patch">https://gitlab.com/ita1024=
/waf/-/commit/d2060dfd8af4edb5824153ff24e207b39ecd67a2.patch</a> to fix:</d=
iv><div>| DEBUG: Executing shell function do_configure<br>| Traceback (most=
 recent call last):<br>| =C2=A0 File &quot;/OE/build/oe-core/tmp-glibc/work=
/core2-64-oe-linux/jack/1.9.22/git/./waf&quot;, line 166, in &lt;module&gt;=
<br>| =C2=A0 =C2=A0 from waflib import Scripting<br>| =C2=A0 File &quot;/OE=
/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Scri=
pting.py&quot;, line 10, in &lt;module&gt;<br>| =C2=A0 =C2=A0 from waflib i=
mport Utils, Configure, Logs, Options, ConfigSet, Context, Errors, Build, N=
ode<br>| =C2=A0 File &quot;/OE/build/oe-core/tmp-glibc/work/core2-64-oe-lin=
ux/jack/1.9.22/git/waflib/Configure.py&quot;, line 16, in &lt;module&gt;<br=
>| =C2=A0 =C2=A0 from waflib import ConfigSet, Utils, Options, Logs, Contex=
t, Build, Errors<br>| =C2=A0 File &quot;/OE/build/oe-core/tmp-glibc/work/co=
re2-64-oe-linux/jack/1.9.22/git/waflib/Options.py&quot;, line 14, in &lt;mo=
dule&gt;<br>| =C2=A0 =C2=A0 from waflib import Logs, Utils, Context, Errors=
<br>| =C2=A0 File &quot;/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/=
jack/1.9.22/git/waflib/Context.py&quot;, line 9, in &lt;module&gt;<br>| =C2=
=A0 =C2=A0 import os, re, imp, sys<br>| ModuleNotFoundError: No module name=
d &#39;imp&#39;<br></div><div><br></div><div>martin@jama /OE/build/oe-core/=
tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git $ git diff<br>diff --git a=
/waflib/Context.py b/waflib/Context.py<br>index 761b521f..38ab03f1 100644<b=
r>--- a/waflib/Context.py<br>+++ b/waflib/Context.py<br>@@ -6,10 +6,17 @@<b=
r>=C2=A0Classes and functions enabling the command system<br>=C2=A0&quot;&q=
uot;&quot;<br>=C2=A0<br>-import os, re, imp, sys<br>+import os, re, sys<br>=
=C2=A0from waflib import Utils, Errors, Logs<br>=C2=A0import waflib.Node<br=
>=C2=A0<br>+if sys.hexversion &gt; 0x3040000:<br>+ import types<br>+ class =
imp(object):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_module =3D lambda x: type=
s.ModuleType(x)<br>+else:<br>+ import imp<br>+<br>=C2=A0# the following 3 c=
onstants are updated on each new release (do not touch)<br>=C2=A0HEXVERSION=
=3D0x2000c00<br>=C2=A0&quot;&quot;&quot;Constant updated on new releases&qu=
ot;&quot;&quot;</div><div><br></div><div>The SyntaxWarning is easily reprod=
ucible:</div><div><br>martin@jama /OE/build/oe-core/tmp-glibc/work/core2-64=
-oe-linux/jack/1.9.22/git $ python3 waf --version<br>/OE/build/oe-core/tmp-=
glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib/Context.py:617: SyntaxW=
arning: invalid escape sequence &#39;\_&#39;<br>=C2=A0 &quot;&quot;&quot;<b=
r>/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/waflib=
/Build.py:107: SyntaxWarning: invalid escape sequence &#39;\*&#39;<br>=C2=
=A0 &quot;&quot;&quot;List of targets to build (default: \*)&quot;&quot;&qu=
ot;<br>/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/jack/1.9.22/git/w=
aflib/Task.py:1047: SyntaxWarning: invalid escape sequence &#39;\w&#39;<br>=
=C2=A0 re_cond =3D re.compile(&#39;(?P&lt;var&gt;\w+)|(?P&lt;or&gt;\|)|(?P&=
lt;and&gt;&amp;)&#39;)<br>/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linu=
x/jack/1.9.22/git/waflib/TaskGen.py:730: SyntaxWarning: invalid escape sequ=
ence &#39;\w&#39;<br>=C2=A0 re_m4 =3D re.compile(&#39;@(\w+)@&#39;, re.M)<b=
r>waf 2.0.12 (54841218840ffa34fddf834680a5a17db69caa12)<br></div><div><br><=
/div><div>martin@jama /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/ja=
ck/1.9.22/git $ python3 --version<br>Python 3.12.1<br></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
When this part is moved into a minimal test case, there is no error at all.=
<br>
<br>
The error only happens inside bitbake and there was no such problem<br>
with Python 3.11.x or earlier.<br>
<br>
Ergo, the problem must be a Python 3.12 issue.<br>
The actual version here is python3-3.12.1-2.fc39.x86_64 for me.<br>
<br>
&gt; So you need to update waf in jack not to trigger SyntaxWarning when wa=
f --version is called.<br>
&gt;<br>
&gt; On Fri, Jan 26, 2024 at 10:17=E2=80=AFAM Zoltan Boszormenyi &lt;<a hre=
f=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt; =
wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Just a FYI.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0After the bitbake-server getting stuck after bitbak=
e exited<br>
&gt;=C2=A0 =C2=A0 =C2=A0with Python 3.12 issue was fixed, here&#39;s anothe=
r one.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This time it&#39;s semi-reliably triggered by the j=
ack recipe<br>
&gt;=C2=A0 =C2=A0 =C2=A0in meta-openembedded:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: jack-1.19.22-r0 do_configure: Error executin=
g a python function in<br>
&gt;=C2=A0 =C2=A0 =C2=A0exec_func_python() autogenerated:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The stack trace of python calls that resulted in th=
is exception/failure was:<br>
&gt;=C2=A0 =C2=A0 =C2=A0File: &#39;exec_func_python() autogenerated&#39;, l=
ineno: 2, function: &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0001:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0*** 0002:waf_preconfigure(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0003:<br>
&gt;=C2=A0 =C2=A0 =C2=A0File:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/home/zozo/test-yocto-4.3-gh/conf/../layers/op=
enembedded-core/meta/classes-recipe/waf.bbclass&#39;,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0lineno: 58, function: waf_preconfigure<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0054:=C2=A0=C2=A0=C2=
=A0 wafbin =3D os.path.join(subsrcdir, &#39;waf&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0055:=C2=A0=C2=A0=C2=
=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0056:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D subprocess.check_output([python, waf=
bin, &#39;--version&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0057:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 version =3D result.decode(&#39;utf-8&#39;).spli=
t()[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0*** 0058:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if bb.utils.vercmp_string_op(version, &quot;1.8.7&quot;, &quot=
;&gt;=3D&quot;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0059:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar(&quot;WAF_EXTR=
A_CONF&quot;, &quot;--bindir=3D${bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0--libdir=3D${libdir}&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0060:=C2=A0=C2=A0=C2=
=A0 except subprocess.CalledProcessError as e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0061:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(&quot;Unable to execute waf --version, =
exit code %d. Assuming waf<br>
&gt;=C2=A0 =C2=A0 =C2=A0version without bindir/libdir support.&quot; % e.re=
turncode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0062:=C2=A0=C2=A0=C2=
=A0 except FileNotFoundError:<br>
&gt;=C2=A0 =C2=A0 =C2=A0File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib=
/bb/utils.py&#39;, lineno: 150, function:<br>
&gt;=C2=A0 =C2=A0 =C2=A0vercmp_string_op<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0146:=C2=A0=C2=A0=C2=
=A0 Compare two versions and check if the specified comparison operator<br>
&gt;=C2=A0 =C2=A0 =C2=A0matches<br>
&gt;=C2=A0 =C2=A0 =C2=A0the result of the comparison.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0147:=C2=A0=C2=A0=C2=
=A0 This function is fairly liberal about what operators it will accept<br>
&gt;=C2=A0 =C2=A0 =C2=A0since<br>
&gt;=C2=A0 =C2=A0 =C2=A0there are a variety of styles<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0148:=C2=A0=C2=A0=C2=
=A0 depending on the context.<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0149:=C2=A0=C2=A0=C2=
=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0*** 0150:=C2=A0=C2=A0=C2=A0 res =3D ver=
cmp_string(a, b)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0151:=C2=A0=C2=A0=C2=
=A0 if op in (&#39;=3D&#39;, &#39;=3D=3D&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0152:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return res =3D=3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0153:=C2=A0=C2=A0=C2=
=A0 elif op =3D=3D &#39;&lt;=3D&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0154:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 return res &lt;=3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib=
/bb/utils.py&#39;, lineno: 140, function:<br>
&gt;=C2=A0 =C2=A0 =C2=A0vercmp_string<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0136:=C2=A0=C2=A0=C2=
=A0 return r<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0137:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0138:def vercmp_stri=
ng(a, b):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0139:=C2=A0=C2=A0=C2=
=A0 &quot;&quot;&quot; Split version strings and compare them &quot;&quot;&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0*** 0140:=C2=A0=C2=A0=C2=A0 ta =3D spli=
t_version(a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0141:=C2=A0=C2=A0=C2=
=A0 tb =3D split_version(b)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0142:=C2=A0=C2=A0=C2=
=A0 return vercmp(ta, tb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0143:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0144:def vercmp_stri=
ng_op(a, b, op):<br>
&gt;=C2=A0 =C2=A0 =C2=A0File: &#39;/home/zozo/test-yocto-4.3-gh/bitbake/lib=
/bb/utils.py&#39;, lineno: 91, function:<br>
&gt;=C2=A0 =C2=A0 =C2=A0split_version<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0087:=C2=A0=C2=A0=C2=
=A0 &quot;&quot;&quot;Split a version string into its constituent parts (PE=
, PV, PR)&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=
=A0 s =3D s.strip(&quot; &lt;&gt;=3D&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=
=A0 e =3D 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0090:=C2=A0=C2=A0=C2=
=A0 if s.count(&#39;:&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0*** 0091:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 e =3D int(s.split(&quot;:&quot;)[0])<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0092:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 s =3D s.split(&quot;:&quot;)[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0093:=C2=A0=C2=A0=C2=
=A0 r =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0094:=C2=A0=C2=A0=C2=
=A0 if s.count(&#39;-&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0095:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D s.rsplit(&quot;-&quot;, 1)[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0Exception: ValueError: invalid literal for int() wi=
th base 10: &#39;SyntaxWarning&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ERROR: Logfile of failure stored in:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/zozo/test-yocto-4.3-gh/tmp-sicom-glibc/work/c=
orei7-64-oe-linux/jack/1.19.22/temp/log.do_configure.1709417<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;Semi-reliably&quot;, i.e. about 50-50 or 60-4=
0 percent failure vs success rate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Usually the second run succeeds after a failure.<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I copied=C2=A0vercmp_string_op() and all others cal=
led by it<br>
&gt;=C2=A0 =C2=A0 =C2=A0from bitbake/lib/bb/utils.py into a new python scri=
pt as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0minimum test case. Running this script inside a loc=
ally<br>
&gt;=C2=A0 =C2=A0 =C2=A0cloned jack git repository has 100% success rate.<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It looks like an internal Python &quot;flake&quot; =
issue.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#194348):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/194348" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/194348</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/103973063/3617156" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/103973063/3617156</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"https://lists.openembedded.=
org/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000043d2aa060fd7e0df--

