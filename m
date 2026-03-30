Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD07A1061B14
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 16:21:42 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55534.1774887694684950620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 09:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 62UGLTgD3416249;
	Mon, 30 Mar 2026 11:21:30 -0500
Received: from [192.168.2.236] ([192.168.2.236])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 62UGLSh8012327;
	Mon, 30 Mar 2026 11:21:28 -0500
Message-ID: <761a6394-36bf-4900-ac23-2253c3d63b01@kernel.crashing.org>
Date: Mon, 30 Mar 2026 11:21:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
To: JPEWhacker@gmail.com, charles-antoine.couret@mind.be
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
 <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org>
 <8619f67e-d274-4d99-9290-ad36ba61c054@mind.be>
 <CAJdd5GbTvj==_77VaLLNkU69Ti06tw2-8X5jLmzEESZNN6D_Xg@mail.gmail.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAJdd5GbTvj==_77VaLLNkU69Ti06tw2-8X5jLmzEESZNN6D_Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 62UGLTgD3416249
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 16:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234251



On 3/30/26 11:01 AM, Joshua Watt via lists.openembedded.org wrote:
> On Sun, Mar 29, 2026 at 11:12=E2=80=AFAM Charles-Antoine Couret via
> lists.openembedded.org
> <charles-antoine.couret=3Dmind.be@lists.openembedded.org> wrote:
>>
>> Le 29/03/26 =C3=A0 18:15, Richard Purdie a =C3=A9crit :
>>> For context, these previous versions were in 2023. I think the genera=
l
>>> concern is we already have a lot of rootfs size related variables and
>>> adding more of them complicates the user interface. It isn't clear
>>> which ones "win" when multiple conflicting settings are made.
>>>
>>> In this case the max size "wins" above any of the others.
>>
>> IMHO this makes sense because it's more specific and related to the re=
al
>> filesystem size.
>>
>> But indeed if you want to change the design behind, I'm open to it.
>>
>>> It does
>>> appear that it isn't just a max size but a fixed size in that it will
>>> pad the filesystems to this size? That makes the name a bit
>>> confusing/misleading and was one of the concerns last time.
>>
>> In fact I realize that I've not read your previous answer last time, t=
oo
>> focus on the CI error. Sorry, my mistake. That's why I've not taken th=
is
>> into account for my recent changes.
>>
>> Yes, this variable is doing both (fixed + max size of the filesystem),
>> due to how filesystem tools are working. Maybe by having a more
>> "intrusive" change, we can improve it.
>>
>>
>> What I can suggest is:
>>
>> * IMAGE_ROOTFS_MAXSIZE would be used against filesystem sizes, and not
>> against precomputed rootfs sizes as done today, it's likely not really
>> relevant to keep current behavior as it. I don't know if we would be
>> able to customize the value per filesystem type as done in my proposal
>> or if a global setting is good enough.
>>
>> * if IMAGE_ROOTFS_EXTRA_SPACE is set to 0 and IMAGE_OVERHEAD_FACTOR se=
t
>> to 1.0, don't provide size parameter to mkfs to create a dynamic and
>> minimal filesystem, to avoid the need to always provide manually extra
>> margin just for filesystem overhead
>>
>> * Then introduce a new variable like IMAGE_ROOTFS_FIXED_SIZE which can
>> be provided (if set) to mkfs tool to have a fixed partition size
>> whatever are the other settings related to rootfs size. If unset (by
>> default), previous logic can be used instead.
>=20
>=20
> Perhaps a better option would be some sort of
> "IMAGE_ROOTFS_ALLOW_GROW" variable that controls if an image can
> actually grow beyond the IMAGE_ROOTFS_SIZE + overhead amount? The
> current code basically takes the max of IMAGE_ROOTFS_SIZE & the actual
> install size to determine the size, but this variable could supress
> that to make it only look at IMAGE_ROOTFS_SIZE. It could also set
> IMAGE_ROOTFS_MAXSIZE to the sum for additional checks?

This makes more sense to me.

Looking at the existing variables:


IMAGE_ROOTFS_SIZE - Defines the size in Kbytes for the generated image.

Really this is the minimum size, computed with actual filesystem needs.


IMAGE_OVERHEAD_FACTOR - Defines a multiplier that the build system applie=
s to=20
the initial image size for cases when the multiplier times the returned d=
isk=20
usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE an=
d=20
IMAGE_ROOTFS_EXTRA_SPACE.


IMAGE_ROOTFS_EXTRA_SPACE - Defines additional free disk space created in =
the=20
image in Kbytes. By default, this variable is set to '0'.


IMAGE_ROOTFS_MAXSIZE - (not in the documentation.conf but...) This value =
is a QA=20
check to ensure that the filesystem does not exceed a specific size after=
=20
factoring in filesystem size, extra space and overhead factor.

(this should be added to the docs!)


Adding an additional boolean of "IMAGE_ROOTFS_ALLOW_GROW" would then allo=
w those=20
variables to be used "as-is" without the automatic growing.  (I would ass=
ume=20
existing behavior means ALLOW_GROW =3D 1 by default.)

As far as I can tell, in this patch set that would mean:

IMAGE_ROOTFS_ALLOW_GROW =3D "0"

IMAGE_ROOTFS_SIZE =3D _the_ size of filesystem you want
IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
IMAGE_OVERHEAD_FACTOR =3D "1"

Then a patch similar to:

def get_rootfs_size(d):
     import subprocess, oe.utils

     rootfs_alignment =3D int(d.getVar('IMAGE_ROOTFS_ALIGNMENT'))
     overhead_factor =3D float(d.getVar('IMAGE_OVERHEAD_FACTOR'))
     rootfs_req_size =3D int(d.getVar('IMAGE_ROOTFS_SIZE'))
     rootfs_extra_space =3D eval(d.getVar('IMAGE_ROOTFS_EXTRA_SPACE'))
     rootfs_maxsize =3D d.getVar('IMAGE_ROOTFS_MAXSIZE')
     rootfs_allow_grow =3D d.getVar('IMAGE_ROOTFS_ALLOW_GROW') or "1"
     ...

     size_kb =3D oe.utils.directory_size(d.getVar("IMAGE_ROOTFS")) / 1024

     if rootfs_allow_grow:
         base_size =3D size_kb * overhead_factor
         bb.debug(1, '%f =3D %d * %f' % (base_size, size_kb, overhead_fac=
tor))
         base_size2 =3D max(base_size, rootfs_req_size) + rootfs_extra_sp=
ace
         bb.debug(1, '%f =3D max(%f, %d)[%f] + %d' % (base_size2, base_si=
ze,
                  rootfs_req_size, max(base_size, rootfs_req_size),
                  rootfs_extra_space))
     else:
         base_size2 =3D rootfs_req_size + rootfs_extra_space

     ...

(Maybe allow_grow is a bad name for the boolean, since effectively we wan=
t to=20
affirmatively tell the system to ignore the actual files in the filesyste=
m..  So=20
perhaps reversing the boolean to:

IMAGE_ROOTFS_USE_FILE_SIZES  (not sure I like this name any better)

but the overall change is MUCH smaller and easier to fit in and QA with t=
he=20
existing code (as well as document).

> I think this would fit into the current model of how these size
> variables work without needing to introduce a completely new variable
> that does different math?
>=20

I agree, avoid additional math, just having a variable to determine if we=
 do the=20
'max' logic or not makes more sense to me and would be a smaller patch se=
t.

--Mark

>>
>>
>> I'm not an expert of all filesystems so maybe this suggestion can
>> introduce problems. I don't see potential regressions for current user=
s
>> as well.
>>
>> What do you think? Another ideas?
>>
>>
>> Thank you for your feedback.
>>
>> Regards,
>>
>> --
>>
>> Charles-Antoine Couret
>>
>> Embedded Software Developer
>>
>> +32 488 27 56 40
>> Website <https://mind.be> =E2=80=A2 LinkedIn
>> <https://www.linkedin.com/company/mind_essensium/> =E2=80=A2 Newslette=
r
>> <http://eepurl.com/h-gy7v>
>>
>> <https://mind.be> logo
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#234250): https://lists.openembedded.org/g/openembe=
dded-core/message/234250
>> Mute This Topic: https://lists.openembedded.org/mt/118563509/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[mark.hatle@kernel.crashing.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

