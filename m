Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id B4F6C76903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:09:57 +0000 (UTC)
Received: by vkgd64 with SMTP id d64so29456159vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=cieaxtkl/0kIKV3+o/3nnoK4x/P5y3HKJidQ2SQKfkg=;
	b=a08qXyERX3SmYuPoAviRX8CPP3iLPeC516bVmyq+DWi3VRxyNyNh/O1D1QD7xvjEZ9
	sP1HMWZZ2lVL/+oHRAGmAS5H/1Y+e21PIlj6XUVlvrO6YrGCkL7zWAy8e3GdpiDl4Ktr
	lvx44jmpe5QSLvAIpGfJ9vGIFJcFs0Ve2H80uPxTcdEqz5Ct81FsDT2Os5I0tideRPW9
	3YFJqYMymsJka4dyXuQ+ceXf0yrQ48m5KQMucQ0Z74MXaNkw50yQCSRUg+uZ2AXeD7wP
	XrrLjsXG6kAJ0/GEVZwKPepdj+mja0gRXmVgH9BBzJbV/i3JYOWfxBNG/cVFbddgYAkV
	BZ1A==
X-Received: by 10.31.181.10 with SMTP id e10mr20605782vkf.39.1443020997142;
	Wed, 23 Sep 2015 08:09:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Wed, 23 Sep 2015 08:09:37 -0700 (PDT)
In-Reply-To: <4f3ba0dba496671c2d229be52debce6ab01a6b71.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
	<4f3ba0dba496671c2d229be52debce6ab01a6b71.1443002672.git.paul.eggleton@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Sep 2015 08:09:37 -0700
X-Google-Sender-Auth: Vpgq6IdIvVl7L6jV33054DsSCtc
Message-ID: <CABcZANnYmSQeh9YtOs+4k6XmiybG+5dLW+8HRpQX8mnTh-s96A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] devtool: second fix for running from a different directory
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
X-List-Received-Date: Wed, 23 Sep 2015 15:09:57 -0000
Content-Type: multipart/alternative; boundary=001a1143806cf0309f05206b81ee

--001a1143806cf0309f05206b81ee
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 3:05 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> -def setup_tinfoil(config_only=False):
> +def setup_tinfoil(config_only=False, basepath=None):
>      """Initialize tinfoil api from bitbake"""
>      import scriptpath
> +    orig_cwd = os.path.abspath(os.curdir)
> +    if basepath:
> +        os.chdir(basepath)
>      bitbakepath = scriptpath.add_bitbake_lib_path()
>      if not bitbakepath:
>          logger.error("Unable to find bitbake by searching parent
> directory of this script or PATH")
> @@ -108,6 +111,7 @@ def setup_tinfoil(config_only=False):
>      tinfoil = bb.tinfoil.Tinfoil()
>      tinfoil.prepare(config_only)
>      tinfoil.logger.setLevel(logger.getEffectiveLevel())
> +    os.chdir(orig_cwd)
>      return tinfoil
>

Just from a correctness standpoint, this will not go back to orig_cwd if an
exception is raised. We should be using a try/finally block for things like
this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143806cf0309f05206b81ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Sep 23, 2015 at 3:05 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":1h4" class=3D"a3s" style=3D"overflow:hidden">-def setup_tinfoil(co=
nfig_only=3DFalse):<br>
+def setup_tinfoil(config_only=3DFalse, basepath=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Initialize tinfoil api from <span cla=
ss=3D"il">bitbake</span>&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0import scriptpath<br>
+=C2=A0 =C2=A0 orig_cwd =3D os.path.abspath(os.curdir)<br>
+=C2=A0 =C2=A0 if basepath:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(basepath)<br>
=C2=A0 =C2=A0 =C2=A0bitbakepath =3D scriptpath.add_bitbake_lib_path()<br>
=C2=A0 =C2=A0 =C2=A0if not bitbakepath:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.error(&quot;Unable to find <span c=
lass=3D"il">bitbake</span> by searching parent directory of this script or =
PATH&quot;)<br>
@@ -108,6 +111,7 @@ def setup_tinfoil(config_only=3DFalse):<br>
=C2=A0 =C2=A0 =C2=A0tinfoil =3D <span class=3D"il">bb</span>.tinfoil.Tinfoi=
l()<br>
=C2=A0 =C2=A0 =C2=A0tinfoil.prepare(config_only)<br>
=C2=A0 =C2=A0 =C2=A0tinfoil.logger.setLevel(logger.getEffectiveLevel())<br>
+=C2=A0 =C2=A0 os.chdir(orig_cwd)<br>
=C2=A0 =C2=A0 =C2=A0return tinfoil</div></blockquote></div><br>Just from a =
correctness standpoint, this will not go back to orig_cwd if an exception i=
s raised. We should be using a try/finally block for things like this.<br>-=
- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergo=
th dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - T=
slib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1143806cf0309f05206b81ee--
