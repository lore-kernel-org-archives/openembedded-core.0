Return-Path: <lee.nipper@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id B3F777391A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 18:40:12 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so7995425qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fwQHrZktWvucb35dbjxJ9blB0i9aYbzUuxLdTWBxOEk=;
	b=L/U2698eEKWSv3TOdADea+civRarvuC3lkyuV0He7oXa0f0u8Zvhf3/qHoR/bB+CkR
	cmi28RPe3LbfdV4vECVJqbri9YxT0nlRvsHW8uUCMkpOy9ZXpz5MbjqsLi848ghatjSU
	yJdSNxUZ7kHsD4XyQpILMeml5pfQ8QJGOTR8hvjOyy0tSz8iiKt/NWJ3yMhkHWdY4Dvz
	iUrfdnApFbeYV09b+eNSlSrY4esYhV6LCwzghqwpQLE3R6hy0NzHofWNjArbeAQ8fAHb
	2fNC8rVlpwRbI+lwPqE6isvAi/TlrEEPID0w0c16Lxh/ggom9loCKmEpo2SxcNF//Npg
	CMQQ==
X-Received: by 10.55.204.10 with SMTP id r10mr32072752qki.55.1442947212523;
	Tue, 22 Sep 2015 11:40:12 -0700 (PDT)
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com.
	[209.85.192.54])
	by smtp.gmail.com with ESMTPSA id b104sm54774qga.7.2015.09.22.11.40.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 11:40:12 -0700 (PDT)
Received: by qgx61 with SMTP id 61so1041127qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:40:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.140.91.109 with SMTP id y100mr30472608qgd.48.1442947211949; 
	Tue, 22 Sep 2015 11:40:11 -0700 (PDT)
Received: by 10.55.20.148 with HTTP; Tue, 22 Sep 2015 11:40:11 -0700 (PDT)
In-Reply-To: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
Date: Tue, 22 Sep 2015 13:40:11 -0500
Message-ID: <CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
From: Lee Nipper <lee.nipper@linux.com>
To: =?UTF-8?Q?Marcus_M=C3=BCller?= <marcus.mueller@ettus.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Tue, 22 Sep 2015 18:40:13 -0000
Content-Type: multipart/alternative; boundary=001a113a75b2ff9a7405205a5344

--001a113a75b2ff9a7405205a5344
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 12:44 PM, Marcus M=C3=BCller <marcus.mueller@ettus.=
com>
wrote:

> ---
>  oe-init-build-env | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/oe-init-build-env b/oe-init-build-env
> index 6fee5f7..b7e2918 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -45,7 +45,7 @@ fi
>  OEROOT=3D`readlink -f "$OEROOT"`
>  export OEROOT
>  . $OEROOT/scripts/oe-buildenv-internal && \
> -     $OEROOT/scripts/oe-setup-builddir && \
> +     TEMPLATECONF=3D"$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir &&=
 \
>       [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
>  unset OEROOT
>  unset BBPATH
>
>
I think this patch is a good candidate for back-porting to the fido branch.
If I understand correctly it allows a user prepared $TEMPLATECONF directory
to be used by oe-setup-builddir.

--001a113a75b2ff9a7405205a5344
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Sep 22, 2015 at 12:44 PM, Marcus M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:marcus.mueller@ettus.com" target=3D"_blank">marcus.mueller@et=
tus.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">---<br>
=C2=A0oe-init-build-env | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/oe-init-build-env b/oe-init-build-env<br>
index 6fee5f7..b7e2918 100755<br>
--- a/oe-init-build-env<br>
+++ b/oe-init-build-env<br>
@@ -45,7 +45,7 @@ fi<br>
=C2=A0OEROOT=3D`readlink -f &quot;$OEROOT&quot;`<br>
=C2=A0export OEROOT<br>
=C2=A0. $OEROOT/scripts/oe-buildenv-internal &amp;&amp; \<br>
-=C2=A0 =C2=A0 =C2=A0$OEROOT/scripts/oe-setup-builddir &amp;&amp; \<br>
+=C2=A0 =C2=A0 =C2=A0TEMPLATECONF=3D&quot;$TEMPLATECONF&quot; $OEROOT/scrip=
ts/oe-setup-builddir &amp;&amp; \<br>
=C2=A0 =C2=A0 =C2=A0 [ -n &quot;$BUILDDIR&quot; ] &amp;&amp; cd &quot;$BUIL=
DDIR&quot;<br>
=C2=A0unset OEROOT<br>
=C2=A0unset BBPATH<br><span class=3D""><font color=3D"#888888"><br></font><=
/span></blockquote><div><br></div><div>I think this patch is a good candida=
te for back-porting to the fido branch.</div><div>If I understand correctly=
 it allows a user prepared $TEMPLATECONF directory</div><div>to be used by =
oe-setup-builddir.</div><div><br></div></div><br></div></div>

--001a113a75b2ff9a7405205a5344--
