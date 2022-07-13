Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F3AC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 21:21:17 +0000 (UTC)
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by mx.groups.io with SMTP id smtpd.web09.125.1657747267741635097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 14:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Em4HDFY6;
 spf=pass (domain: email.de, ip: 217.72.192.78,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657747265;
	bh=fFm39L0jj8iatBkZRI2ISXfAZvm6NUcPvco+p4AF9nA=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=Em4HDFY6v5BqBr5drN9jJhYDzppN1qNHOrvHwM0RrIHsD7M8emUalSo5UuyNUFlUb
	 UcSJKaz79Zjd7+fGcNRsUThhlzp2qbdktEvCQFrkdZEBA1YPF+uOW/gxQGE122jQaG
	 i9KEr7zGSusVKtHlVeTaqi8pW6gOAo47JBFigV6o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.0.166] ([178.251.90.190]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHEbq-1oOsxF1Mem-00DTsl for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 23:21:05 +0200
Message-ID: <702c42c3-ef3a-e9db-f26e-e51a55578492@email.de>
Date: Wed, 13 Jul 2022 23:21:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v2] package.bbclass: Avoid stripping signed
 kernel modules in splitdebuginfo
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220712222937.62542-1-christoph.lauer@email.de>
 <e29b5fb39a9901db4176b4055ae82530a523d5a1.camel@linuxfoundation.org>
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: 
 <e29b5fb39a9901db4176b4055ae82530a523d5a1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZZGlSnDgFFTLv/mxlXIUjySEult27/fR1J5eh5Ul6Ma4HYlTVJh
 3uo40i667k2vlPGUizO5cPWdtRtcWYI3exIbG07Qp+zpC4bjVD4ABX5cTOJigTvpaDGI+1C
 lCcSnYwlLHGIPLG1UkDUzfRyO6vijUujubDXSDuA//K7p5mDZsd7HADDb9Oz3GpcL5YZMxr
 3dsUOaZ7FHk4zu/JZcJSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/uGviCSgHS4=:00VmBKV8O2eRF9evliWQup
 9xsveggYdfa5aX9jBdJKrfbLG9V/MP7ENfgY8sqxB5TShVkMVR5+FB2n5ZGW81A6V8/xy4q4S
 efASrRG09Ge70z7yQ4lqq25ARDNhyovsZbipzKyzEcOHQp47TKTAEIDStcXN22g+DJhl7bRIW
 0vV5PT+OaBGs04j8XKfaljEja//HG/3XGp+JvbLY8+Mxxmn4h1i5+0mDqCo3aJ8l1bejjI5sv
 fkH+hZ08hFl/frofae2saMOI6XQ9dZSxXgDj9UblKaegNQYQSR3i5HX/vD6lRus7OpcDA02yL
 1n52aYWyk0G5gkoKx6d+NpBihxQLGqllFgiIjgd9Ypq9+iqNwkiOnw+DQcWwcE4AHvQkkFnKD
 euJTVAeuLK1x1MLadK3I+cdMS1Smsd6ki+tmM5lD7veaeBMFJZCzgCwrGjYCx7ToTjy/5sE6+
 0s7Yr3SO90Xo86s+OTA94RIPFlkIkYbuS44YJfEVGT/uHBjnXCHBybfdx6rgpTVyQydS36Pjo
 lv+yq2PIWUWBDz0qs5LuHIbYcPXNSseqiwwg+cS3F0oSG/hzInJxUxMdhga1Fv4dlGr+qq/e6
 RFdc3T6L3sUnbXTwAaCPkCLD2844IDdnjIsUZuLYF2fR2zVlMuizRt9Lwb4oBhNFDL+rzJ9nq
 9NwxKLg+3qFhkUVUzHt12F5tFv8eQjgx0HGhUBC3IDa2+yNINiU3xOmb0z8pm+akjqpcb9t1C
 A5oDqKdimExttbxGehPhI9XX815jD5FYJszz2F8gygOQes4s5ep3OW59z+ScXbZ7flaruy5gI
 ahJ+7aSRMO0KgLDf0T8cNiV5K/pxuR6mRZklGp19IBqaDJa4zDKe4UHJc089PoZ7NJRW8li9R
 NA+kd3etHgERsbBj5SoyaR+5wwxzlE5oesYTm5uoQdTuZYS/jlLuptoNcYcfLHNlkd3S5P6e0
 uQjYVNgyF3NDd5i52rc07IDSdRge5svYL4BIRVIHvrs8NECCwY7WLP2yeE3w+go+iMpR8SLAR
 bKsMMZJsULeJXcLhZRSb5d79bVVssrmLWt8AHXzfgtBSU9RtfPz4v/ITQf8V2ODReG06s53/M
 h6KsdREwx3A6sanpAo/zds82G4WVxIXoLb+hJNE3u9oVXXwXwo3SOMgGw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 21:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167993


Am 13.07.22 um 00:37 schrieb Richard Purdie:
> On Wed, 2022-07-13 at 00:29 +0200, Christoph Lauer wrote:
>> From: Christoph Lauer <christoph.lauer@xtronic.de>
>>
>> Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules ar=
e stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed module=
s must not be stripped. Function 'runstrip' avoids this by running is_kern=
el_module_signed. Apply the same check to splitdebuginfo.
>>
>> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
>> ---
>>   meta/classes/package.bbclass | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
>> index 4850134022..78ec96df85 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
>>       debugfile =3D dvar + dest
>>       sources =3D []
>>
>> +    if oe.package.is_elf(file)[1] & 16:
>> +        if oe.package.is_kernel_module_signed(file):
>> +            bb.debug(1, "Skip strip on signed module %s" % file)
>> +            return (file, sources)
>> +
>>       # Split the file...
>>       bb.utils.mkdirhier(os.path.dirname(debugfile))
>>       #bb.note("Split %s -> %s" % (file, debugfile))
>
> That is better but I think we can do better still. splitdebuginfo is
> called as:
>
> results =3D oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles),=
 d, extraargs=3D(dvar, dv, d))
>
> and earlier in the function there is also:
>
> results =3D oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.key=
s(), d)
>
> i.e. we already probably called is_elf() which isn't a cheap operation e=
ither.
>
> I think we can tweak things so we reuse that data?
>
> Cheers,
>
> Richard
>
>
>
Sorry for double-posting, my last mail did not reply to this conversation:
You're correct that oe.package.is_elf already ran on the file before
splitdebuginfo is called, but the result is currently not available to
splitdebuginfo AFAIS. It could be by extending the parameters and what
not, but I'm too lazy to do that for what was meant to be a rather small
change. Instead I'll follow your first suggestion to check on file
extension and file location (as is_elf does too). That should cover all
kernel modules and is specific enough to avoid false positives.

