Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id C66FE766DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 04:20:03 +0000 (UTC)
Received: by igr7 with SMTP id 7so24292168igr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 21:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=JEUpF4rwX503Dd7nzaUnUhFf60WiXTERZ7PU40vGdow=;
	b=A1O+6iwkpgiNi+z7TKGe6OVlFuygSG4zr3ltPz5NPr0Nc/V58Ev9anOWvFy+gPQHdm
	FEiQjLBAUwpMank4rHmMhVwWb9Q7andDRPrO8wHCY5NWUkiCKaIMzOtM/W4+T4Npth3v
	CEOaBwAsC9mSbhNySe2VJcX6IjHXy0cwuRvC3dgI2nWXEVY/zs7GV6O78nsgmdDNTHxN
	FwbTqcP3c6jAljWIEnUkdhKQGCAd7OUM7QH43wV2j9B1cjzDVrUUVJZiDmtkFDIlZ0+t
	opgZJwClwXLfCCNb9Am1Evecf846hd6rchsZYE9yeedDnEhh0i1yhR5sxxyZnK/y+Lht
	ZE/A==
X-Received: by 10.50.78.99 with SMTP id a3mr1197190igx.29.1438921203741; Thu,
	06 Aug 2015 21:20:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Thu, 6 Aug 2015 21:19:44 -0700 (PDT)
In-Reply-To: <A0A03D4442F2EC4DBF5A0F72D4A3DA01B7E361@SHSMSX103.ccr.corp.intel.com>
References: <1438759076-9075-1-git-send-email-sharron.liu@intel.com>
	<CABcZAN=aXnNDLvJZW0wmP9AkssWjn1HxYPhFm07ZqaR_j-OTHA@mail.gmail.com>
	<A0A03D4442F2EC4DBF5A0F72D4A3DA01B7E361@SHSMSX103.ccr.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 6 Aug 2015 21:19:44 -0700
X-Google-Sender-Auth: D8FlKdYQ2igovPrJdQgTnWVJhlA
Message-ID: <CABcZANn2sVJ3p6M0Z-XneNFD-fJ9HQ7bdOrjG9T+fUJM4G3epA@mail.gmail.com>
To: "Liu, Sharron" <sharron.liu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-selftest: support selftests from other layers
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
X-List-Received-Date: Fri, 07 Aug 2015 04:20:07 -0000
Content-Type: multipart/alternative; boundary=089e0122f7a8357f55051cb0f3db

--089e0122f7a8357f55051cb0f3db
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2015 at 8:43 PM, Liu, Sharron <sharron.liu@intel.com> wrote:

> Thanks for your inputs. I tested my case with poky master which includes
> the two commitments you mentioned:
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd2023c34e4c3=
735d919c35d80daf991aab579500
>
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D51d760e2a7e2=
2f1b07608fc925da343e56a9ae74
>
> In my observation it still failed at my case.
>
>
>
> In my test case I have:
>
> poky_root/meta-mylayer/lib/oeqa/selftest/subdirs/mytest.py
>
>
>
> I type:
>
> "oe-selftest --list-modules"
>
> And I expect =E2=80=9Csubdirs.mytest=E2=80=9D being listed.
>
>
>
> I type:
>
> "oe-selftest --run-tests subdirs.mytest"
>
> And I expect =E2=80=9Cmytest=E2=80=9D being run.
>
>
>
> This case still failed without my patch. Attached the log file for your
> ref.
>

Sounds like you didn't properly set up your python packages. It has to be
possible to import your tests from python, which is not the case unless
__init__.py exists at the root of each python package.

oeqa.selftest is a python namespace package. Copy
poky/meta/lib/oeqa/selftest/__init__.py
to poky_root/meta-mylayer/lib/oeqa/selftest/, and either also copy it
to poky_root/meta-mylayer/lib/oeqa/selftest/subdirs/ or
touch poky_root/meta-mylayer/lib/oeqa/selftest/subdirs/__init__.py.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0122f7a8357f55051cb0f3db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 6, 2015 at 8:43 PM, Liu, Sharron <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sharron.liu@intel.com" target=3D"_blank">sharron.liu@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"MsoNorma=
l"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Calibri=
&quot;,sans-serif;color:#1f497d">Thanks for your inputs. I tested my case w=
ith poky master which includes the two commitments you mentioned:<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0 =C2=A0=C2=A0<a href=3D"h=
ttps://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dd2023c34e4c3735=
d919c35d80daf991aab579500" target=3D"_blank">https://git.yoctoproject.org/c=
git/cgit.cgi/poky/commit/?id=3Dd2023c34e4c3735d919c35d80daf991aab579500</a>=
<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:42.0pt"><span lang=3D"EN-US"><a=
 href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D51d76=
0e2a7e22f1b07608fc925da343e56a9ae74" target=3D"_blank">https://git.yoctopro=
ject.org/cgit/cgit.cgi/poky/commit/?id=3D51d760e2a7e22f1b07608fc925da343e56=
a9ae74</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">In my observation it s=
till failed at my case.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">In my test case I have=
:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">poky_root/meta-mylayer=
/lib/oeqa/selftest/subdirs/mytest.py<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">I type:<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">&quot;oe-selftest --li=
st-modules&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">And I expect =E2=80=9C=
subdirs.mytest=E2=80=9D being listed.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">I type:<u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">&quot;oe-selftest --ru=
n-tests subdirs.mytest&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">And I expect =E2=80=9C=
mytest=E2=80=9D being run.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">This case still failed=
 without my patch. Attached the log file for your ref.</span></p></blockquo=
te></div><br>Sounds like you didn&#39;t properly set up your python package=
s. It has to be possible to import your tests from python, which is not the=
 case unless __init__.py exists at the root of each python package.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">oeqa.selftest=
 is a python namespace package. Copy poky/meta/lib/oeqa/selftest/__init__.p=
y to=C2=A0poky_root/meta-mylayer/lib/oeqa/selftest/, and either also copy i=
t to=C2=A0poky_root/meta-mylayer/lib/oeqa/selftest/subdirs/ or touch=C2=A0p=
oky_root/meta-mylayer/lib/oeqa/selftest/subdirs/__init__.py.<br>-- <br><div=
 class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com=
<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Se=
nior Software Engineer, Mentor Graphics</div>
</div></div>

--089e0122f7a8357f55051cb0f3db--
