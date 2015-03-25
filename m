Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id E2D7A72B1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 20:45:17 +0000 (UTC)
Received: by qgh3 with SMTP id 3so51165964qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 13:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sPBbRba3Okg1idVeSxC31sFGBioZ+VLvxzccA1qliXc=;
	b=NP08iakQ9lEIVUcVU+bxukmBmQche0qcTvBkG4X5Rq2q0HysGgQo/6cHDHaK62Ty0G
	91ggb5FdY+cqi+vKCqEf71x2NUAMUGvMw/3K/n/nxnxkhf+oED+4P/21wxb2SNqMlzzp
	Wp388ykPW3Se9t8M+FumLVwdSVdNm7ph86ah1Pk2tGV89nqX1dW2O9g2KM/iRYjHeUrY
	0atfpbz/gsoBJYYIYFc9mmONKGzgQIb+l/DFZrBPSMb88cOiJymaPdvRzDhn+t/PTLou
	lxH9FbFzKrfwZSyPPW0vK0VT0OYK63ffaQ+QlPvQ0l0DJusPDvLOAwzbEvLa7JcRik5b
	q+sg==
X-Gm-Message-State: ALoCoQkTGUnZKqXFMiUe+mO/nMNmqnmmDqdCW9s2sgHK2U5HrCvYsZ/NIp02bf4FaWt6chehKnN9
X-Received: by 10.55.31.32 with SMTP id f32mr22844869qkf.41.1427316318091;
	Wed, 25 Mar 2015 13:45:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 25 Mar 2015 13:44:57 -0700 (PDT)
In-Reply-To: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
References: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Mar 2015 20:44:57 +0000
Message-ID: <CAJTo0LbqKtrxavRkmi=hxQAPGvGPzrwK-AJGnqDybSHup_puZw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: add a vardeps for configure on libdir
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
X-List-Received-Date: Wed, 25 Mar 2015 20:45:18 -0000
Content-Type: multipart/alternative; boundary=001a1147b0dc1f523d051222fae2

--001a1147b0dc1f523d051222fae2
Content-Type: text/plain; charset=UTF-8

On 25 March 2015 at 16:28, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> For target builds libdir is not something that changes and for -native
> builds unless you move your builds around you will see no issue with
> the current implementation. If you do update libdir or if you move
> your build or reuse sstate by copying it to a new build you will start
> to see errors. These will be seen when you use the 'openssl' tool and
> look like the following:
>
> WARNING: can't open config file: /home/build/bitbake_build/tmp/
>                         sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf
>

We don't generally require that native sstate is rebuilt when the build
directory changes, as otherwise you wouldn't be able to share native sstate
between builds and users.  Instead, paths are munged where possible when
using sstate and wrapper scripts used to "fix" binaries.  Indeed
openssl.inc does this:

do_install_append_virtclass-native() {
        create_wrapper ${D}${bindir}/openssl \
            OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
            SSL_CERT_DIR=${libdir}/ssl/certs \
            SSL_CERT_FILE=${libdir}/ssl/cert.pem \
            OPENSSL_ENGINES=${libdir}/ssl/engines
}

Is it possible that the binary isn't respecting the OPENSSL_CONF
environment variable since that wrapper was written? (or the wrapper wasn't
tested well enough)

Ross

--001a1147b0dc1f523d051222fae2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2015 at 16:28, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":e1" class=
=3D"" style=3D"overflow:hidden">For target builds libdir is not something t=
hat changes and for -native<br>
builds unless you move your builds around you will see no issue with<br>
the current implementation. If you do update libdir or if you move<br>
your build or reuse sstate by copying it to a new build you will start<br>
to see errors. These will be seen when you use the &#39;openssl&#39; tool a=
nd<br>
look like the following:<br>
<br>
WARNING: can&#39;t open config file: /home/build/bitbake_build/tmp/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf</div></blockquote>=
</div><div class=3D"gmail_extra"><br></div>We don&#39;t generally require t=
hat native sstate is rebuilt when the build directory changes, as otherwise=
 you wouldn&#39;t be able to share native sstate between builds and users.=
=C2=A0 Instead, paths are munged where possible when using sstate and wrapp=
er scripts used to &quot;fix&quot; binaries.=C2=A0 Indeed openssl.inc does =
this:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
<div class=3D"gmail_extra">do_install_append_virtclass-native() {</div><div=
 class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_wrapper ${D}${bin=
dir}/openssl \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 OPENSSL_CONF=3D${libdir}/ssl/openssl.cnf \</div><div class=3D=
"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSL_CERT_DIR=3D${li=
bdir}/ssl/certs \</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SSL_CERT_FILE=3D${libdir}/ssl/cert.pem \</div><div class=
=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_ENGINES=
=3D${libdir}/ssl/engines</div><div class=3D"gmail_extra">}</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Is it possible that t=
he binary isn&#39;t respecting the OPENSSL_CONF environment variable since =
that wrapper was written? (or the wrapper wasn&#39;t tested well enough)</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div></div>

--001a1147b0dc1f523d051222fae2--
