Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.9185.1585956143036486143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 16:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.151, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: Gez9speEnwOsmTPNzGO9PvDh4LvR/A/+8vi6KYFWFfHNGROLEUmto+OQXiStO3XpHdEeQjAAnN
 N19bsvy6b6pQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 16:22:22 -0700
IronPort-SDR: QGZhcNy0ket72lZzYwyr3oOgztAe6098UpZfW+iUgR3SCqPB0Ec+AtCOnRITmMvxddakrRz3Gb
 ilRQIDQgo+mQ==
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; 
   d="scan'208,217";a="250310974"
Received: from amspicke-mobl.amr.corp.intel.com ([10.255.230.64])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2020 16:22:21 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
Message-Id: <CA7CE9BB-3AFE-40B8-B1A6-22BBB43A23F5@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core] [PATCH 1/4] scripts/install-buildtools: improvements
Date: Fri, 3 Apr 2020 16:22:20 -0700
In-Reply-To: <9bd493e6c0a4117b04e636bc0f3200e84ab30cbd.camel@linuxfoundation.org>
Cc: Tim Orling <ticotimo@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andre McCurdy <armccurdy@gmail.com>
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
 <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
 <1601CF873C42565A.6346@lists.openembedded.org>
 <CANx9H-BNf9ubLHJr3V_2ZAHcpucYooRtXkA9bOJ8_Q1_aPQmjw@mail.gmail.com>
 <CAJ86T=WwkHPTyi4K7jg0=XOV4OgSGAjN8NcYhQ8JvUY5JY7jxw@mail.gmail.com>
 <9bd493e6c0a4117b04e636bc0f3200e84ab30cbd.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_54294D89-DAFE-4E48-9885-88A9D1E6DEEC"

--Apple-Mail=_54294D89-DAFE-4E48-9885-88A9D1E6DEEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Apr 1, 2020, at 3:16 PM, Richard Purdie <richard.purdie@linuxfoundati=
on.org> wrote:
>=20
> On Wed, 2020-04-01 at 15:09 -0700, Andre McCurdy wrote:
>> On Wed, Apr 1, 2020 at 3:02 PM Tim Orling <ticotimo@gmail.com> wrote:
>>> On Wed, Apr 1, 2020 at 2:32 PM Tim Orling via
>>> lists.openembedded.org <ticotimo=3Dgmail.com@lists.openembedded.org>
>>> wrote:
>>>> On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy <armccurdy@gmail.com
>>>>> wrote:
>>>>> It looks like there are some assumptions about the minimum
>>>>> version of
>>>>> python3 on the host in order to even be able to run
>>>>> install-buildtools. Should that be checked explicitly?
>>>>=20
>>>> To be honest, everything was written on CentOS-7, where =E2=80=98pyth=
on3=E2=80=99
>>>> is now python36.
>>>>=20
>>>> The remaining supported holdout for 3.4 is Debian-8 (Jessie).
>>>> Which also happens to have tar 1.27. At least it has git 2.1.4,
>>>> so it=E2=80=99s not a complete mess.
>>>>=20
>>>> Python 3.4 is already EOL. We should not support it for the
>>>> complete build system, but I can see that the install-buildtools
>>>> script should ideally still run on python34. The whole point is
>>>> to make it easier to install the pre-built buildtools.
>>>=20
>>> Python 3.5 is now required in bitbake/lib/bb/__init__.py
>>> Which is needed for bb.utils.md5sum_file and sha256_file to check
>>> the checksum of the download. I=E2=80=99d rather not have to rewrite t=
hose
>>> functions.
>>=20
>> Looks like copy and pasting ~30 lines? Maybe not even much of a net
>> increase in code size if you can remove the existing code to check
>> that bitbake libs are available...
>>=20
>> def _hasher(method, filename):
>>    import mmap
>>=20
>>    with open(filename, "rb") as f:
>>        try:
>>            with mmap.mmap(f.fileno(), 0, access=3Dmmap.ACCESS_READ) as
>> mm:
>>                for chunk in iter(lambda: mm.read(8192), b''):
>>                    method.update(chunk)
>>        except ValueError:
>>            # You can't mmap() an empty file so silence this
>> exception
>>            pass
>>    return method.hexdigest()
>>=20
>> def md5_file(filename):
>>    """
>>    Return the hex string representation of the MD5 checksum of
>> filename.
>>    """
>>    import hashlib
>>    return _hasher(hashlib.md5(), filename)
>>=20
>> def sha256_file(filename):
>>    """
>>    Return the hex string representation of the 256-bit SHA checksum
>> of
>>    filename.
>>    """
>>    import hashlib
>>    return _hasher(hashlib.sha256(), filename)
>=20
> Can you send a patch against master-next please? The buildtools
> installer is one place we probably do want to support older pythons and
> it shouldn't be too onnerous.
>=20

Submitted. The check for whether the install worked or not was the hardest=
 part.
After many iterations, I just could not get subprocess.Popen to work as ex=
pected on python 3.4.
https://patchwork.openembedded.org/patch/171593/ <https://patchwork.openem=
bedded.org/patch/171593/>

Thank you Andre for the testing and input. It takes a village to make a go=
od release.

> Cheers,
>=20
> Richard
>=20
>=20


--Apple-Mail=_54294D89-DAFE-4E48-9885-88A9D1E6DEEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><br class=3D""><div><br c=
lass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Apr 1, 20=
20, at 3:16 PM, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" class=3D"">richard.purdie@linuxfoundation.org</a>&gt; wrote:<=
/div><br class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"=
">On Wed, 2020-04-01 at 15:09 -0700, Andre McCurdy wrote:<br class=3D""><bl=
ockquote type=3D"cite" class=3D"">On Wed, Apr 1, 2020 at 3:02 PM Tim Orling=
 &lt;<a href=3D"mailto:ticotimo@gmail.com" class=3D"">ticotimo@gmail.com</a=
>&gt; wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On Wed, Apr=
 1, 2020 at 2:32 PM Tim Orling via<br class=3D""><a href=3D"http://lists.op=
enembedded.org" class=3D"">lists.openembedded.org</a> &lt;<a href=3D"mailto=
:ticotimo=3Dgmail.com@lists.openembedded.org" class=3D"">ticotimo=3Dgmail.c=
om@lists.openembedded.org</a>&gt;<br class=3D"">wrote:<br class=3D""><block=
quote type=3D"cite" class=3D"">On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy=
 &lt;<a href=3D"mailto:armccurdy@gmail.com" class=3D"">armccurdy@gmail.com<=
/a><br class=3D""><blockquote type=3D"cite" class=3D"">wrote:<br class=3D""=
>It looks like there are some assumptions about the minimum<br class=3D"">v=
ersion of<br class=3D"">python3 on the host in order to even be able to run=
<br class=3D"">install-buildtools. Should that be checked explicitly?<br cl=
ass=3D""></blockquote><br class=3D"">To be honest, everything was written o=
n CentOS-7, where =E2=80=98python3=E2=80=99<br class=3D"">is now python36.<=
br class=3D""><br class=3D"">The remaining supported holdout for 3.4 is Deb=
ian-8 (Jessie).<br class=3D"">Which also happens to have tar 1.27. At least=
 it has git 2.1.4,<br class=3D"">so it=E2=80=99s not a complete mess.<br cl=
ass=3D""><br class=3D"">Python 3.4 is already EOL. We should not support it=
 for the<br class=3D"">complete build system, but I can see that the instal=
l-buildtools<br class=3D"">script should ideally still run on python34. The=
 whole point is<br class=3D"">to make it easier to install the pre-built bu=
ildtools.<br class=3D""></blockquote><br class=3D"">Python 3.5 is now requi=
red in bitbake/lib/bb/__init__.py<br class=3D"">Which is needed for bb.util=
s.md5sum_file and sha256_file to check<br class=3D"">the checksum of the do=
wnload. I=E2=80=99d rather not have to rewrite those<br class=3D"">function=
s.<br class=3D""></blockquote><br class=3D"">Looks like copy and pasting ~3=
0 lines? Maybe not even much of a net<br class=3D"">increase in code size i=
f you can remove the existing code to check<br class=3D"">that bitbake libs=
 are available...<br class=3D""><br class=3D"">def _hasher(method, filename=
):<br class=3D""> &nbsp;&nbsp;&nbsp;import mmap<br class=3D""><br class=3D"=
"> &nbsp;&nbsp;&nbsp;with open(filename, "rb") as f:<br class=3D""> &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:<br class=3D""> &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;with mmap.mmap(f.fileno(), 0,=
 access=3Dmmap.ACCESS_READ) as<br class=3D"">mm:<br class=3D""> &nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;for chunk in iter(lambda: mm.read(8192), b''):<br class=3D""> &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;method.update(chunk)<br class=3D""> &nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except ValueError:<br class=3D""> &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# You can't mmap(=
) an empty file so silence this<br class=3D"">exception<br class=3D""> &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pass<br class=
=
=3D""> &nbsp;&nbsp;&nbsp;return method.hexdigest()<br class=3D""><br class=
=
=3D"">def md5_file(filename):<br class=3D""> &nbsp;&nbsp;&nbsp;"""<br clas=
s=3D""> &nbsp;&nbsp;&nbsp;Return the hex string representation of the MD5 c=
hecksum of<br class=3D"">filename.<br class=3D""> &nbsp;&nbsp;&nbsp;"""<br =
class=3D""> &nbsp;&nbsp;&nbsp;import hashlib<br class=3D""> &nbsp;&nbsp;&nb=
sp;return _hasher(hashlib.md5(), filename)<br class=3D""><br class=3D"">def=
 sha256_file(filename):<br class=3D""> &nbsp;&nbsp;&nbsp;"""<br class=3D"">=
 &nbsp;&nbsp;&nbsp;Return the hex string representation of the 256-bit SHA =
checksum<br class=3D"">of<br class=3D""> &nbsp;&nbsp;&nbsp;filename.<br cla=
ss=3D""> &nbsp;&nbsp;&nbsp;"""<br class=3D""> &nbsp;&nbsp;&nbsp;import hash=
lib<br class=3D""> &nbsp;&nbsp;&nbsp;return _hasher(hashlib.sha256(), filen=
ame)<br class=3D""></blockquote><br class=3D"">Can you send a patch against=
 master-next please? The buildtools<br class=3D"">installer is one place we=
 probably do want to support older pythons and<br class=3D"">it shouldn't b=
e too onnerous.<br class=3D""><br class=3D""></div></div></blockquote><div>=
<br class=3D""></div><div>Submitted. The check for whether the install work=
ed or not was the hardest part.</div><div>After many iterations, I just cou=
ld not get subprocess.Popen to work as expected on python 3.4.</div><a href=
=
=3D"https://patchwork.openembedded.org/patch/171593/" class=3D"">https://p=
atchwork.openembedded.org/patch/171593/</a></div><div><br class=3D""></div>=
<div>Thank you Andre for the testing and input. It takes a village to make =
a good release.</div><div><br class=3D""><blockquote type=3D"cite" class=3D=
""><div class=3D""><div class=3D"">Cheers,<br class=3D""><br class=3D"">Ric=
hard<br class=3D""><br class=3D""><br class=3D""></div></div></blockquote><=
/div><br class=3D""></body></html>

--Apple-Mail=_54294D89-DAFE-4E48-9885-88A9D1E6DEEC--
