Return-Path: <tonyb@cybernetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02366D13C2E
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:04:48 +0000 (UTC)
Received: from mail.cybernetics.com (mail.cybernetics.com [72.215.153.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21526.1769439878188723648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 07:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=bHGioeqf;
 spf=pass (domain: cybernetics.com, ip: 72.215.153.18, mailfrom: tonyb@cybernetics.com)
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id 0EJhbDNSLkcLatRB; Mon, 26 Jan 2026 10:04:35 -0500 (EST)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=Oni9yOEgu9cVETvDK+pXafXUExPvOt2LT2Le9/1BZ1s=;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID; b=bHGioeqfA0N5VmTLLkhj
	v5AHn9AlZHFurI4QeCOKapycf3ieToh1Wb8x+KML7idxtAkOYs+U2tCK9GlIcaYk5E9XDtaUV3lC4
	VWtX39UstUPoW3S8UahurxWHYWbtJZRplg5+jnGD04h+kNHEKkUiZqv/l86+XBNYhxvEBeMqEA=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate SPEC SMTP 8.0.5)
  with ESMTPS id 14372079; Mon, 26 Jan 2026 10:04:35 -0500
Message-ID: <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
Date: Mon, 26 Jan 2026 10:04:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
To: Changqing Li <changqing.li@windriver.com>, rs@ti.com,
 richard.purdie@linuxfoundation.org, mathieu.dubois-briand@bootlin.com,
 alex@linutronix.de, otavio@ossystems.com.br, kexin.hao@windriver.com
X-ASG-Orig-Subj: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from
 TARGET_LDFLAGS
Cc: afd@ti.com, detheridge@ti.com, denis@denix.org, reatmon@ti.com,
 openembedded-core@lists.openembedded.org, vijayp@ti.com
References: <20260122194959.13457-2-rs@ti.com>
 <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
Content-Language: en-US
From: Tony Battersby <tonyb@cybernetics.com>
In-Reply-To: <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1769439875
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 3149
X-Barracuda-BRTS-Status: 0
X-ASG-Debug-ID: 1769439875-1cf43928501b1c60002-7zcVdP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 15:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230010

On 1/26/26 03:39, Changqing Li wrote:
>
>
> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> From: Randolph Sapp <rs@ti.com>
>>
>> Now that the previous bug affecting binary reproducibility has been
>> addressed [1], we can revert this patch. This will resolve issues with
>> cgo applications becoming unreprodcible.
>>
>> Currently go considers link arguments to be sacred, meaning any change
>> should produce a different binary output. They ensure this by baking
>> link arguments into the intermediary output, changing the content ID o=
f
>> that step. As such, the marco prefixes inadvertently end up adding bui=
ld
>> paths to the output binary instead of removing them if they are passed
>> as link arguments to cgo applications.
>>
>> These paths are later stripped out again, but at this point the conten=
t
>> ID of the dependency has changed and thus the build ID of the end
>> application will be affected by the cascade of hash changes. See the
>> upstream bug for more information [2].
>>
>> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
>> [2] https://github.com/golang/go/issues/77218
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>
>> This resolves the previously reported emptty issues:
>> https://lists.openembedded.org/g/openembedded-core/message/228549
>>
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 88f4d0df69..da873c3f4e 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${@['-Wl,--hash-style=
=3Dgnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D "-Wl,--as-needed"
>>
>>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
>> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${D=
EBUG_PREFIX_MAP}"
>> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
>
> Hi,
>
> After check the related gcc bug and yocto bug,=C2=A0 gcc bug comments 2=
1
> ([1])=C2=A0 and yocto bug comments 13 ([2]),
>
> my understanding is that,=C2=A0 when lto is enabled,=C2=A0 even with gc=
c fix
> [3],=C2=A0 we still need DEBUG_PREFIX_MAP in LDFLAGS
>
> to make bin reproducible. Also seems Tony's commit [4] is after gcc
> fix [3].
>
> [1]=C2=A0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
>
> [2]=C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
>
> [3]=C2=A0 https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619=
c
>
> [4]=C2=A0
> https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc8897=
9967d0e00e2fafdbaaabec030da9f
>
>
> @Tony, @Randolph, Could please correct me if my understanding is not
> right, Thanks.
>
>
Yes,=C2=A0LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
unless something else has changed since 2021 to make it unnecessary. I
have not kept up with the issue.

Tony


