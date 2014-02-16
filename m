Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6717B6E6F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 11:48:06 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so10651472lab.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 03:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zd40RTbHk0X8MjXWf/9xW/pAuC58rm28MvozQbNjajw=;
	b=wY6zfvNzZs+NF4lE0Ys0KnaM5Ma92lzm39Sb6sEPQL4iTEthunUS6ZYmijdOKRabm+
	nmciBg/u6AKf62eoNH1tJ5WptP3GvlBTtJ0RsQR4Oqv5BOfYfGP2lXhnNevtos1uJuHJ
	QSNtrrtGXG63uH2JMX/pVbkalCykxLuW0Sl/YgJV+qwVQDaC9lpm6fgMdoFjSSJmmb8m
	uZXo6Lxd90i4iY4DF9PE6/I7StkWnWx+zzUbV/CEQuG9cra+HSkpu/fj8eBnLDlta3d7
	80fSt1ldfPnqH0kYoQFM2iV1+7jm8yKSFa1TDeyR4Wy95W1G3iP1KXo/0R17v7eoovMf
	RwsQ==
MIME-Version: 1.0
X-Received: by 10.152.164.199 with SMTP id ys7mr13152501lab.31.1392551286320; 
	Sun, 16 Feb 2014 03:48:06 -0800 (PST)
Received: by 10.114.68.133 with HTTP; Sun, 16 Feb 2014 03:48:06 -0800 (PST)
Received: by 10.114.68.133 with HTTP; Sun, 16 Feb 2014 03:48:06 -0800 (PST)
In-Reply-To: <1392449004-2212-1-git-send-email-raj.khem@gmail.com>
References: <1392449004-2212-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 16 Feb 2014 12:48:06 +0100
Message-ID: <CAC1BbcS+tq0QfRRrBUwdDi5t-ZRDHQPZKbeC8mVUNnfub=jN3Q@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs.py: Check for LDCONFIGDEPEND being empty string
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
X-List-Received-Date: Sun, 16 Feb 2014 11:48:06 -0000
Content-Type: multipart/alternative; boundary=001a11349626c0b1c904f2849ccd

--001a11349626c0b1c904f2849ccd
Content-Type: text/plain; charset=ISO-8859-1

On 15 Feb 2014 08:22, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> We override LDCONFIGDEPEND to be empty string for uclibc
> however the current check is for it being None as a result
> the function is still executed but ldconfig-native is not
> built as dependency for rootfs when building with uclibc
>
> Fixes errors like below
>
> File:
>
'/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/oe/rootfs.py',
> lineno: 191, function: _run_ldconfig
>      0187:    def _run_ldconfig(self):
>      0188:        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
>      0189:            bb.note("Executing: ldconfig -r" +
> self.image_rootfs + "-c new -v")
>      0190:            self._exec_shell_cmd(['ldconfig', '-r',
> self.image_rootfs, '-c',
>  *** 0191:                                  'new', '-v'])
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 6114f56..285c769 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -185,7 +185,7 @@ class Rootfs(object):
>                          self._handle_intercept_failure(registered_pkgs)
>
>      def _run_ldconfig(self):
> -        if self.d.getVar('LDCONFIGDEPEND', True) is not None:
> +        if self.d.getVar('LDCONFIGDEPEND', True) != "":

Why not just
if self.d.getVar('LDCONFIGDEPEND', True):

That ought to DTRT for all content evaluating to false.
Thanks,

--001a11349626c0b1c904f2849ccd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 15 Feb 2014 08:22, &quot;Khem Raj&quot; &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We override LDCONFIGDEPEND to be empty string for uclibc<br>
&gt; however the current check is for it being None as a result<br>
&gt; the function is still executed but ldconfig-native is not<br>
&gt; built as dependency for rootfs when building with uclibc<br>
&gt;<br>
&gt; Fixes errors like below<br>
&gt;<br>
&gt; File:<br>
&gt; &#39;/home/kraj/work/angstrom-repo/sources/openembedded-core/meta/lib/=
oe/rootfs.py&#39;,<br>
&gt; lineno: 191, function: _run_ldconfig<br>
&gt; =A0 =A0 =A00187: =A0 =A0def _run_ldconfig(self):<br>
&gt; =A0 =A0 =A00188: =A0 =A0 =A0 =A0if self.d.getVar(&#39;LDCONFIGDEPEND&#=
39;, True) is not None:<br>
&gt; =A0 =A0 =A00189: =A0 =A0 =A0 =A0 =A0 =A0bb.note(&quot;Executing: ldcon=
fig -r&quot; +<br>
&gt; self.image_rootfs + &quot;-c new -v&quot;)<br>
&gt; =A0 =A0 =A00190: =A0 =A0 =A0 =A0 =A0 =A0self._exec_shell_cmd([&#39;ldc=
onfig&#39;, &#39;-r&#39;,<br>
&gt; self.image_rootfs, &#39;-c&#39;,<br>
&gt; =A0*** 0191: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0&#39;new&#39;, &#39;-v&#39;])<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/lib/oe/rootfs.py | 2 +-<br>
&gt; =A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
&gt; index 6114f56..285c769 100644<br>
&gt; --- a/meta/lib/oe/rootfs.py<br>
&gt; +++ b/meta/lib/oe/rootfs.py<br>
&gt; @@ -185,7 +185,7 @@ class Rootfs(object):<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0self._handle_interc=
ept_failure(registered_pkgs)<br>
&gt;<br>
&gt; =A0 =A0 =A0def _run_ldconfig(self):<br>
&gt; - =A0 =A0 =A0 =A0if self.d.getVar(&#39;LDCONFIGDEPEND&#39;, True) is n=
ot None:<br>
&gt; + =A0 =A0 =A0 =A0if self.d.getVar(&#39;LDCONFIGDEPEND&#39;, True) !=3D=
 &quot;&quot;:</p>
<p dir=3D"ltr">Why not just<br>
if self.d.getVar(&#39;LDCONFIGDEPEND&#39;, True):</p>
<p dir=3D"ltr">That ought to DTRT for all content evaluating to false.<br>
Thanks,</p>

--001a11349626c0b1c904f2849ccd--
