Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC42BC55175
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:42:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35037.1771580513485269680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xzuGXHRb;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48379a42f76so14406985e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771580512; x=1772185312; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P7fqGHMATzrzbsNZRfGGx40E8nPeu01dPdXYOUV7FE=;
        b=xzuGXHRbwgcfPJ4tiZRxPkevCc6nHmtXufwcl6UUAVHFtR+B7srKPHHNiQ3Nq6W0xp
         R+OkYkGd0cgV8pbEuYiYpeqHgH6kqAfZQyXbDzHdyd49Fp6yssiWIr7noNwLukSogP+k
         G1eMGPaLkgkyxXZ1JW2btjthHfAjVHo2HgPDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580512; x=1772185312;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3P7fqGHMATzrzbsNZRfGGx40E8nPeu01dPdXYOUV7FE=;
        b=rXgW4NiRd5SLvuumIoWNW2dPNYe0nfpY6BtqwixAmJigQihDfbDpGxk0xbXb9SbfLq
         kWin5Y1QEWs5Qpra9ZNS/Dk+w1kBerOJKHvoTUS5Nho6dYPcxj4FErlBhGLvCoNkcSm9
         lJGdzQH9x2KsQn2tt6OAgmN2PEDMiqP4pLzXEcX9fhgW2df4UJET38eETM6+gjEZSRZ+
         7ubPCp8Mr8znfHxII8tHflxjZwWQ77Kxpcj6vbf+mHViR+Zi8Mk3RqlczMeRZRWwmjXf
         YhClsxoK+LWZk0uqJ+ODxVaDCceclpVULfflRPIbFWUL4bsyunsGYhq0CP95FxQrGnwA
         Ec+Q==
X-Gm-Message-State: AOJu0Ywq45YSftDY9gnwrXJf63qVxPUhkV2BkoLPJnGodzOcGP9ecGd+
	gx7CSkc5gR3FqUkoLpU6yvxh+W/STJGppruVoB8K5BN+L9Sizu2Sy6miUjOaiDUPRGM=
X-Gm-Gg: AZuq6aLVP9E6sIdiSfJtGVSsixv+8WVirRlLryNHHVNeZy86UH5OyiwjDxZ9EZ686SO
	R2fDOiX45f82npkZqSXIza2hMd1MRtbyD7PUQZ3YXw/yznGhq0cHbYTHJ9fVUdxsxb7CYcjVF1L
	FAP3CYQEfhSpPMRX/U7Lvhxwek/lmQgEwBkKKrSu/YuM4v77S8sEtJilYU0P6W2WBGEFytCGL80
	2wJN0tVMYtP70L0qa7LV4G9U6K4qmt4Rh7AUELTFQt2JLjwnRWGnut9aVIUlnBXhVTlnloLvk50
	O8Nv2d8OUwidRF99H2BRRN1b7U90GSBDtKHSnfzQKfVJci/dzm6YTew+E9OLNrVQM1pbmKmpiVE
	fSNtNqz6xPRvtWr+qQ/ccEG2Hjwje5BR/BR9DglEbEOseAPQb5CiOcbGJUnBSTjXL8Z1XOGxLF/
	xlbl443abEuD/vS8vum5RbMzPL6gov6IeOTNdmmj2g5jvEanqoq1GEWP859Mas3DtveltV9FGUh
	+nU3GbUo/bCLjPoRHmxFYYxFQ==
X-Received: by 2002:a05:600d:108:20b0:483:80b0:b245 with SMTP id 5b1f17b1804b1-48380b0b344mr269079485e9.9.1771580511731;
        Fri, 20 Feb 2026 01:41:51 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm62126095e9.15.2026.02.20.01.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:41:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:41:51 +0100
Message-Id: <DGJOVNF1UK81.79JKSE6L6FWI@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying directories
 into wic image with ext* partition
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
To: <daniel.dragomir@windriver.com>, "Steve Sakoman" <steve@sakoman.com>
X-Mailer: aerc 0.20.0
References: <20251001163457.49114-1-daniel.dragomir@windriver.com>
 <CAOSpxdas1e33jheu0ELXgQQf9e9+8ccwbFTkffhPPYObAnjJRA@mail.gmail.com>
 <BY1PR11MB79813ED8D397932BA1178D36F7E4A@BY1PR11MB7981.namprd11.prod.outlook.com> <CAOSpxdZwfQG_8JUbmvqnpGg=0oTimNv2q=XOc4iW71rX8G04zA@mail.gmail.com> <ab832338-75c4-44e7-b649-ba6251045a86@windriver.com> <2e67e180-73b9-49c1-b3fc-99ce82ad6c38@windriver.com>
In-Reply-To: <2e67e180-73b9-49c1-b3fc-99ce82ad6c38@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231500

On Fri Feb 20, 2026 at 10:19 AM CET, Daniel via lists.openembedded.org Drag=
omir wrote:
>
>
> On 1/23/26 00:48, Daniel Dragomir wrote:
>>=20
>>=20
>> On 10/3/25 19:43, Steve Sakoman wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender=
=20
>>> and know the content is safe.
>>>
>>> On Fri, Oct 3, 2025 at 12:13=E2=80=AFAM Dragomir, Daniel
>>> <Daniel.Dragomir@windriver.com> wrote:
>>>>
>>>> Yes, this is an issue on master/master-next too.
>>>> I tested and the same patch can be applied fine on both master and=20
>>>> scarthgap branches.
>>>
>>> Thanks for checking.
>>>
>>> Please submit the patch for the master branch.=C2=A0 It would be helpfu=
l if
>>> you would then ping me when you see that it has been accepted.=C2=A0 I'=
ll
>>> try to remember to watch for it, but a ping would ensure I don't miss
>>> it :-)
>>=20
>> Hi Steve,
>>=20
>> Those changes were accepted in master branch. I created also a selftest=
=20
>> for this scenario.
>> Could you please back-port the commits to scarthgap branch? I tried=20
>> locally and there is a minor merge conflict on one of the commits. If=20
>> you want me to send again a scarthgap version of the commits on the=20
>> mailing list, let me know.
>>=20
>> Commits from master branch are:
>> 6de3d2602f oeqa/selftest/wic: test recursive dir copy on ext partitions
>> 1ed38aff5f wic/engine: fix copying directories into wic image with ext*=
=20
>> partition
>>=20
>
> Hi Steve and Yoann,

Hello,

> Can you please help with a back-port on scarthgap for the commits bellow=
=20
> which were accepted in master?
>
> 6de3d2602f oeqa/selftest/wic: test recursive dir copy on ext partitions
> 1ed38aff5f wic/engine: fix copying directories into wic image with ext*=
=20
> partition
I reviewed those 2 and they will be in my next series.

> cb536737be wic/engine: error on old host debugfs for standalone directory=
 copy
For this one, can you send backport patches to scarthgap and whinlatter?


>
> Thank you!
> Daniel
>
>> Regards,
>> Daniel
>>=20
>>>
>>> Steve
>>>
>>>>
>>>> Regards,
>>>> Daniel
>>>>
>>>> ________________________________
>>>> From: Steve Sakoman <steve@sakoman.com>
>>>> Sent: Thursday, October 2, 2025 5:55 PM
>>>> To: Dragomir, Daniel <Daniel.Dragomir@windriver.com>
>>>> Cc: openembedded-core@lists.openembedded.org=20
>>>> <openembedded-core@lists.openembedded.org>
>>>> Subject: Re: [OE-core][scarthgap][PATCH] wic/engine: fix copying=20
>>>> directories into wic image with ext* partition
>>>>
>>>> Is this also an issue on master?=C2=A0 If so, you will need to submit =
this
>>>> patch for master before I can take it for scarthgap.=C2=A0 If not, can=
 you
>>>> explain why it isn't needed there?
>>>>
>>>> Thanks,
>>>>
>>>> Steve
>>>>
>>>> On Wed, Oct 1, 2025 at 2:25=E2=80=AFPM Dragomir, Daniel via
>>>> lists.openembedded.org
>>>> <daniel.dragomir=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>
>>>>> wic uses debugfs to write on ext* partitions, but debugfs can only
>>>>> write to the current working directory and it cannot copy complete
>>>>> directory trees. Running 'wic ls' on a copied directory show this:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 -l: Ext2 inode is not a directory
>>>>>
>>>>> Fix this by creating a command list for debugfs (-f parameter) when
>>>>> recursive parsing the host directory in order to create a similar
>>>>> directory structure (mkdir) and copy files (write) on each level
>>>>> into the destination directory from the wic's ext* partition.
>>>>>
>>>>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>>>>> ---
>>>>> =C2=A0 scripts/lib/wic/engine.py | 63=20
>>>>> ++++++++++++++++++++++++++++++---------
>>>>> =C2=A0 1 file changed, 49 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
>>>>> index b9e60cbe4e..9d596be3a7 100644
>>>>> --- a/scripts/lib/wic/engine.py
>>>>> +++ b/scripts/lib/wic/engine.py
>>>>> @@ -345,29 +345,64 @@ class Disk:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 path))
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def copy(self, src, dest):
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Copy partition image i=
nto wic image."""
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pnum =3D=C2=A0 dest.part =
if isinstance(src, str) else src.part
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Copy files or director=
ies to/from the vfat or ext*=20
>>>>> partition."""
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pnum =3D dest.part if isi=
nstance(src, str) else src.part
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 partimg =3D self._get_par=
t_image(pnum)
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.partit=
ions[pnum].fstype.startswith('ext'):
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f isinstance(src, str):
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "printf 'cd {}\nwrite {} {}\n' | {} -w {}"=
.\
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 format(os.path=
.dirname(dest.path), src,=20
>>>>> os.path.basename(src),
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.debugfs, self._get_part_image(pnum))
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
lse: # copy from wic
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # run both dump and rdump to support both files an=
d=20
>>>>> directory
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f isinstance(src, str): # host to image case
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.isdir(src):
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base =3D os.path.abspath(s=
rc)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base_parent =3D os.path.di=
rname(base)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmds =3D []
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 made =3D set()
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for root, dirs, files in o=
s.walk(base):
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
r fname in files:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 host_file =3D os.path.join(root, fname)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rel =3D os.path.relpath(host_file,=20
>>>>> base_parent)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dest_file =3D os.path.join(dest.path, rel)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 dest_dir =3D os.path.dirname(dest_file)
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # create dir structure (mkdir -p)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 parts =3D dest_dir.strip('/').split('/')
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cur =3D ''
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 for p in parts:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cur =3D cur + '/' + p
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if cur not in made:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmds.=
append(f'mkdir "{cur}"')
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 made.=
add(cur)
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cmds.append(f'write "{host_file}"=20
>>>>> "{dest_file}"')
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # write script to a temp f=
ile
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with tempfile.NamedTempora=
ryFile(mode=3D'w',=20
>>>>> delete=3DFalse,
>>>>> +                                                    =20
>>>>> prefix=3D'wic-debugfs-') as tf:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
r line in cmds:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 tf.write(line + '\n')
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc=
riptname =3D tf.name
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D f"{self.debugfs} -=
w -f {scriptname}=20
>>>>> {partimg}"
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else: # single file
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "printf 'cd {}\nwr=
ite {} {}\n' | {} -w {}".\
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 format(os.path.dirname(dest.path), src,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.path.basename(src),=
=20
>>>>> self.debugfs, partimg)
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e=
lse: # image to host case
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "printf 'cd {}\ndump /{} {}\nrdum=
p /{} {}\n'=20
>>>>> | {} {}".\
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 forma=
t(os.path.dirname(src.path), src.path,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest, src.path, dest, self.debugfs,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._get_part_image(pnum))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dest, src.path, dest, self.debugfs,=20
>>>>> partimg)
>>>>> +
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else: # fat
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if isinstance(src, str):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "{} -i {} -snop {} ::{}".format(s=
elf.mcopy,
>>>>> -                                                 =20
>>>>> self._get_part_image(pnum),
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 src, dest.path)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 partimg,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 src, dest.path)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D "{} -i {} -snop ::{} {}".format(s=
elf.mcopy,
>>>>> -                                                 =20
>>>>> self._get_part_image(pnum),
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 src.path, dest)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 partimg,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 src.path, dest)
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_cmd(cmd, =
as_shell=3DTrue)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self._put_part=
_image(pnum)
>>>>> --=20
>>>>> 2.39.5
>>>>>
>>>>>
>>>>>=20
>>>>>


--=20
Yoann Congal
Smile ECS


