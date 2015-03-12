Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6666AC3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 12:09:05 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so17243588qgf.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 05:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uEzLgarb+v+j6OPRGeyZwRbQVUr/182Tc/oFveGrHks=;
	b=efi8J/mNd3FKMcT0kCafnnFh68NVMKnHGjM2wfl2f0kDsX1t2+bCPsNSEcfg3s9CW2
	M2JtZWbO7vIPo8Ffon+OxkckO7bM9hVSVMV44AdAjIGScwGL03piIRTvkl+4p7lb0Zvq
	29CeZY4Z4zo6c1VxPDqok88dV4B3EGpWoZuSSKzTmJGXv/qtL72UwOFvnHYmMO6Cz3rr
	9eIBBCRrR/bov4MI817CQxfH5+tsFtIBavp2quMuBJx1GfEjcCHpgn254XJNWKeKkOUD
	HrhqVrS8mTsmxGrjDY+De0gUJKDK782No0eiWusuzC+nFlxAKFvrSvJ9Ldj442xAVo6O
	Kg0g==
X-Gm-Message-State: ALoCoQmbrXe82YqRWhAPKUWKry4Cf7SFVvICYARk/2CXpzVLYXGvG03HZUUiCUceHN3UfANvq945
X-Received: by 10.55.18.8 with SMTP id c8mr31167883qkh.25.1426162146772; Thu,
	12 Mar 2015 05:09:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 12 Mar 2015 05:08:46 -0700 (PDT)
In-Reply-To: <1426147044-31359-1-git-send-email-fabrice.coulon@axis.com>
References: <1426147044-31359-1-git-send-email-fabrice.coulon@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Mar 2015 12:08:46 +0000
Message-ID: <CAJTo0LapTGk+BhrE5s0SDFWs5_9EeZFtETePK07d2pW=nZgfCA@mail.gmail.com>
To: Fabrice Coulon <fabrice.coulon@axis.com>
Cc: Fabrice Coulon <fabrice@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/lib/oe/package.py: Fix for bug 7428
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
X-List-Received-Date: Thu, 12 Mar 2015 12:09:06 -0000
Content-Type: multipart/alternative; boundary=001a11475ccc269b74051116400c

--001a11475ccc269b74051116400c
Content-Type: text/plain; charset=UTF-8

Please change the commit summary to describe what the problem/fix is,
instead of just linking to the bug number.  Then at the end of the commit
message, refer to the bug like [YOCTO #7428].

Ross

On 12 March 2015 at 07:57, Fabrice Coulon <fabrice.coulon@axis.com> wrote:

> This fix solves the problem with the ownership of files in packages.
> The do_install task was producing correct and expected output but when
> the files were being put in, e.g. a rpm package, the ownership could
> be different than that in the do_install task.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
> ---
>  meta/lib/oe/package.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 7c728fc..8bc56c6 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -31,7 +31,7 @@ def runstrip(arg):
>          extraflags = "--remove-section=.comment --remove-section=.note"
>
>      # Use mv to break hardlinks
> -    stripcmd = "'%s' %s '%s' -o '%s.tmp' && mv '%s.tmp' '%s'" % (strip,
> extraflags, file, file, file, file)
> +    stripcmd = "'%s' %s '%s' -o '%s.tmp' && chown --reference='%s'
> '%s.tmp' && mv '%s.tmp' '%s'" % (strip, extraflags, file, file, file, file,
> file, file)
>      bb.debug(1, "runstrip: %s" % stripcmd)
>
>      ret = subprocess.call(stripcmd, shell=True)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11475ccc269b74051116400c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please change the commit summary to describe what the prob=
lem/fix is, instead of just linking to the bug number.=C2=A0 Then at the en=
d of the commit message, refer to the bug like [YOCTO #7428].<div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 12 March 2015 at 07:57, Fabrice Coulon <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:fabrice.coulon@axis.com" target=3D"_blank">fabrice.coulon@axis.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This fix solves=
 the problem with the ownership of files in packages.<br>
The do_install task was producing correct and expected output but when<br>
the files were being put in, e.g. a rpm package, the ownership could<br>
be different than that in the do_install task.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
Signed-off-by: Fabrice Coulon &lt;<a href=3D"mailto:fabrice.coulon@axis.com=
">fabrice.coulon@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index 7c728fc..8bc56c6 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -31,7 +31,7 @@ def runstrip(arg):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extraflags =3D &quot;--remove-section=3D.=
comment --remove-section=3D.note&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Use mv to break hardlinks<br>
-=C2=A0 =C2=A0 stripcmd =3D &quot;&#39;%s&#39; %s &#39;%s&#39; -o &#39;%s.t=
mp&#39; &amp;&amp; mv &#39;%s.tmp&#39; &#39;%s&#39;&quot; % (strip, extrafl=
ags, file, file, file, file)<br>
+=C2=A0 =C2=A0 stripcmd =3D &quot;&#39;%s&#39; %s &#39;%s&#39; -o &#39;%s.t=
mp&#39; &amp;&amp; chown --reference=3D&#39;%s&#39; &#39;%s.tmp&#39; &amp;&=
amp; mv &#39;%s.tmp&#39; &#39;%s&#39;&quot; % (strip, extraflags, file, fil=
e, file, file, file, file)<br>
=C2=A0 =C2=A0 =C2=A0bb.debug(1, &quot;runstrip: %s&quot; % stripcmd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D subprocess.call(stripcmd, shell=3DTrue)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11475ccc269b74051116400c--
