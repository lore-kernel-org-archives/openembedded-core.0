Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web12.245.1623968201656666298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 15:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=M7heeDlm;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==802c75fb84e==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1623968200-0fb3b02bd7d5ad0001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 1xDIpoFGZYRpQ4mr; Thu, 17 Jun 2021 18:16:40 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=+VevNNqwyskwZT+bFbQ2d8GWAZm4IYC4kbIn0tN3aio=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=M7heeDlmyNYfrC6Q43
	RKzTr9USIiIh1FnBiNOMlSjFgGJWtMdoAmNN6iRpO6z4hRaZApV9xCkINSapTKtXEyqnTCZjbYlpE
	aZN28Ru4RhGTfU0COUJ007W+l6wCdgubxlopepl0mmUp1u4cAfn9dXyFY5av1sLVr+GcsHmxhnsk=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 10920427; Thu, 17 Jun 2021 18:16:39 -0400
Subject: Re: [OE-core] [PATCH] glibc: fix path to place zdump in the tzcode package
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
X-ASG-Orig-Subj: Re: [OE-core] [PATCH] glibc: fix path to place zdump in the tzcode
 package
References: <e28daac3-9131-6f27-f8cc-577b821323d1@cybernetics.com>
 <c60f1f1c-a16b-d850-72c9-f87a04b42aef@gmail.com>
From: "Tony Battersby" <tonyb@cybernetics.com>
Message-ID: <df353805-0ac9-f1a6-a6ab-5494ca886516@cybernetics.com>
Date: Thu, 17 Jun 2021 18:16:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c60f1f1c-a16b-d850-72c9-f87a04b42aef@gmail.com>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1623968200
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 2313
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I just looked up the history to see if backporting is appropriate.=C2=A0 Th=
is
patch should only be applied to glibc-2.33 and later.=C2=A0 See glibc comm=
it
b4f020c9b408fb3d1d3d4901c4a71839145f8791 ("timezone: Change zdump
installation to bin directory").=C2=A0 Applying the patch to glibc-2.32 an=
d
older will introduce the bug rather than fixing it.

Tony Battersby
Cybernetics


On 6/17/21 5:25 PM, Khem Raj wrote:
> Thanks, I think this needs to be backported to dunfell and other=20
> maintained releases too.
>
> On 6/17/21 12:06 PM, Tony Battersby wrote:
>> zdump should be included in the tzcode package but is instead included
>> in the glibc-utils package due to an incorrect path in the recipe.
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14427
>>
>> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
>> ---
>>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-c=
ore/glibc/glibc-package.inc
>> index 8d0cc8047f..8841c5e3ca 100644
>> --- a/meta/recipes-core/glibc/glibc-package.inc
>> +++ b/meta/recipes-core/glibc/glibc-package.inc
>> @@ -43,7 +43,7 @@ FILES_${PN}-staticdev +=3D "${libdir}/*.a ${base_libd=
ir}/*.a"
>>   FILES_nscd =3D "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_=
unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
>>                 ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles=
/98_nscd ${localstatedir}/db/nscd"
>>   FILES_${PN}-mtrace =3D "${bindir}/mtrace"
>> -FILES_tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
>> +FILES_tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
>>   FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
>>   FILES_catchsegv =3D "${bindir}/catchsegv"
>>   RDEPENDS_catchsegv =3D "libsegfault"
>>
>>
>>
>>=20
>>

