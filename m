Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.8126.1589251832816630264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 19:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04C2oU0Q022591
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 11 May 2020 19:50:30 -0700 (PDT)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 11 May 2020
 19:50:29 -0700
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add nativesdk-glibc
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20200506015447.13003-1-kai.kang@windriver.com>
 <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
 <f35dd49c-f52b-6d35-9d1b-56775e065bbd@windriver.com>
 <38eed4f8-2fb6-0853-19f7-845e988b2fe2@mvista.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <d8911cb6-0337-11c9-5bd9-950939299379@windriver.com>
Date: Tue, 12 May 2020 10:49:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <38eed4f8-2fb6-0853-19f7-845e988b2fe2@mvista.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 04C2oU0Q022591
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020/5/12 =E4=B8=8A=E5=8D=8810:47, Jeremy A. Puhlman wrote:
>
>
> On 5/11/2020 7:30 PM, Kang Kai wrote:
>> On 2020/5/10 =E4=B8=8B=E5=8D=889:40, Richard Purdie wrote:
>>> On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
>>>> version is too low then it has to build with buildtools-extended-
>>>> tarball
>>>> which provides nativesdk-gcc.
>>>>
>>>> But it fails to build nspr-native:
>>>>
>>>>> gcc=C2=A0=C2=A0 abstract.o -Xlinker -L../../dist/lib -lplc4 -L../..=
/dist/lib
>>>>> -lnspr4 -lpthread -o abstract
>>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>>> undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>>> undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>>> undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>>>> undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>>>> collect2: error: ld returned 1 exit status
>>>>> make: *** [Makefile:379: abstract] Error 1
>>>> Add nativesdk-glibc to buildtools-extended-tarball. And it increases
>>>> size of buildtools-extended-tarball about 3K from 48356989 to
>>>> 48360329.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>> =C2=A0 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>> This doesn't make sense. Does it mean we need a new uninative version
>>> instead?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>> ```This works in dunfell, as of right now. This should have been=20
>> fixed with:
>>
>> ```https://patchwork.openembedded.org/patch/171584/
>>
>> Hi Jeremy,
>>
>> I can't receive mails from maillist for now. So reply here.
>>
>> I suppose when I build oe-core master on ubunu 16.04, it already=20
>> contains the commit. I'll double=C2=A0 check it.
> Yeah it is in master right now. I am not entirely sure why you would=20
> be seeing it. There was some discussion on
> the list about twiddling with the location of /etc/ld.so.conf and=20
> relocating it in the generation of sdks in general, but
> I have not been able to poke at it today. If that went in, it might=20
> have caused the issue. Basically what I saw when I was
> looking in to it, was the sdk ld.so.conf was not getting loaded(in the=20
> case of the patch because it was looking for etc/etc), but
> if it got moved or something similar, it might cause a similar issue.
>
> If you are still seeing the issue on master, strace the link of the=20
> file with -f and look at what is going on with the load of ld.so.conf a=
nd
> that might explain what is going on. Also make sure that ld.so.conf is=20
> still there and has reasonable content.


Thank you very much for your detailed comment. I'll try it.


>
>

--=20
Kai Kang
Wind River Linux

