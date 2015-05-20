Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD5A73223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:42:38 +0000 (UTC)
Received: by qget53 with SMTP id t53so24441073qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t7ZdO52LKDxaMwtNtgKsxkNZMetfF092WM9TpTIPJ4s=;
	b=YB0xErUy5cfdKH80SdRp6iYF5K0dXQmvZpaVIR+Tpi4tiMa10rWhBOjCM5yRbmTt++
	msdi7aysBdsFSj4Lvb/jDTxArZVFddcjhrcpot7pHlRmmky1IYXe21QxBjRR4qWziOM0
	LSL4J3ms3++nwcPAQedlY0ua35Lq5s9QWw3eemIalc+VwwTsgMqwfQSniMnSvVgoZWFr
	7XPRAT1DXL1hGRmksS+o5MbQKE3DH9B1Mrt+kavUD/Dp7hBGWQXHZ/dz7q69Kp3f5isg
	7PHX3/gdeGLEXVea5ZAZ2yEANYrwgUGUsq1tN0pL6EWFA3ANeYd3uNFdglAly6aJ7fZL
	fKyg==
X-Gm-Message-State: ALoCoQlN2+DR5LfrLkGuRextgxWej6fwZtsnaivs6bCukkX1EL4QL3WbACsZfEusWUZO4G9Q/FJI
X-Received: by 10.140.133.199 with SMTP id 190mr23552777qhf.17.1432132960054; 
	Wed, 20 May 2015 07:42:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 07:42:19 -0700 (PDT)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B0120D4B987@COSNADEXC13.usr.ingenico.loc>
References: <1430813641-24223-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B0120D4B987@COSNADEXC13.usr.ingenico.loc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 15:42:19 +0100
Message-ID: <CAJTo0LbG3evANWWUoR5kxU3JB=WJOPA8PW5sRhgMPTmuMw0KZg@mail.gmail.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib: minor symbolic link issue
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
X-List-Received-Date: Wed, 20 May 2015 14:42:43 -0000
Content-Type: multipart/alternative; boundary=001a113533905b03f50516847004

--001a113533905b03f50516847004
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 10:47, Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
wrote:

> Just tell me if something is wrong, I can provide a v2 patch.
>

No, it just slipped through the cracks.

That regex looked a bit obscure, and there's a Python function we provide
that uses the Python standard library to do the same thing, so I ended up
with this locally:

# Move zlib shared libraries for target builds to $base_libdir so the
library
# can be used in early boot before $prefix is mounted.
do_install_append_class-target() {
if [ ${base_libdir} != ${libdir} ]
then
mkdir -p ${D}/${base_libdir}
mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
libname=`readlink ${D}/${libdir}/libz.so`
ln -sf ${@oe.path.relative("${libdir}", "${base_libdir}")}/$libname
${D}${libdir}/libz.so
fi
}

Do you have any objections to this form instead?  I'm also thinking we
should rationalise the duplicated logic into a single implementation in
meta/classes/utils.bbclass...

Ross

--001a113533905b03f50516847004
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 10:47, Matthieu CRAPET <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Matthieu.CRAPET@ingenico.com" target=3D"_blank">Matthieu.CRAPET@ingen=
ico.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div style=3D"overflow:hi=
dden">Just tell me if something is wrong, I can provide a v2 patch.<br></di=
v></blockquote></div><br>No, it just slipped through the cracks.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">That regex looke=
d a bit obscure, and there&#39;s a Python function we provide that uses the=
 Python standard library to do the same thing, so I ended up with this loca=
lly:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><=
div class=3D"gmail_extra"># Move zlib shared libraries for target builds to=
 $base_libdir so the library</div><div class=3D"gmail_extra"># can be used =
in early boot before $prefix is mounted.</div><div class=3D"gmail_extra">do=
_install_append_class-target() {</div><div class=3D"gmail_extra"><span clas=
s=3D"" style=3D"white-space:pre">	</span>if [ ${base_libdir} !=3D ${libdir}=
 ]</div><div class=3D"gmail_extra"><span class=3D"" style=3D"white-space:pr=
e">	</span>then</div><div class=3D"gmail_extra"><span class=3D"" style=3D"w=
hite-space:pre">		</span>mkdir -p ${D}/${base_libdir}</div><div class=3D"gm=
ail_extra"><span class=3D"" style=3D"white-space:pre">		</span>mv ${D}/${li=
bdir}/libz.so.* ${D}/${base_libdir}</div><div class=3D"gmail_extra"><span c=
lass=3D"" style=3D"white-space:pre">		</span>libname=3D`readlink ${D}/${lib=
dir}/libz.so`</div><div class=3D"gmail_extra"><span class=3D"" style=3D"whi=
te-space:pre">		</span>ln -sf ${@oe.path.relative(&quot;${libdir}&quot;, &q=
uot;${base_libdir}&quot;)}/$libname ${D}${libdir}/libz.so</div><div class=
=3D"gmail_extra"><span class=3D"" style=3D"white-space:pre">	</span>fi</div=
><div class=3D"gmail_extra">}</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Do you have any objections to this form instead?=C2=
=A0 I&#39;m also thinking we should rationalise the duplicated logic into a=
 single implementation in meta/classes/utils.bbclass...</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113533905b03f50516847004--
