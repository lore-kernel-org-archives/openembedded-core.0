Return-Path: <m.salvini@koansoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED202C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:58:41 +0000 (UTC)
Received: from mail.koansoftware.com (mail.koansoftware.com [172.104.12.216])
 by mx.groups.io with SMTP id smtpd.web10.64945.1710169113128246179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 07:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: koansoftware.com, ip: 172.104.12.216, mailfrom: m.salvini@koansoftware.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.koansoftware.com (Postfix) with ESMTP id 5AB443D509;
	Mon, 11 Mar 2024 15:58:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail
Received: from mail.koansoftware.com ([127.0.0.1])
	by localhost (mail.koansoftware.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YY0m52TbJ0-2; Mon, 11 Mar 2024 15:58:31 +0100 (CET)
Message-ID: <43508590-9184-469a-983f-cdbdfc8a3f47@koansoftware.com>
Date: Mon, 11 Mar 2024 15:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types_wic.bbclass: remove .env file in
 do_clean
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240306163658.34188-1-m.salvini@koansoftware.com>
 <f770af549d52f72312358ea30d9f1c96b6151de0.camel@linuxfoundation.org>
Content-Language: en-US, it
Cc: openembedded-core@lists.openembedded.org
From: Mauro Salvini <m.salvini@koansoftware.com>
In-Reply-To: <f770af549d52f72312358ea30d9f1c96b6151de0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 14:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196944

On 06/03/24 17:57, Richard Purdie wrote:
> On Wed, 2024-03-06 at 08:37 -0800, Mauro wrote:
>> Before this commit, the .env file created in
>> tmp/sysroots/<machine>/imgdata/<image>.env was never cleaned,
>> but when the do_clean task is invoked on an image, the .env file
>> contains paths that are not valid anymore.
>> If another image wants to use the cleaned image fs to build a .wic,
>> the wic command fails because paths contained in .env are not found.
>> With this patch, the returned error is more clear:
>>
>>  =C2=A0 "File /.../tmp/sysroots/<machine>/imgdata/<image>.env doesn't
>> exist"
>>
>> Signed-off-by: Mauro Salvini <m.salvini@koansoftware.com>
>> ---
>>  =C2=A0meta/classes-recipe/image_types_wic.bbclass | 11 +++++++++++
>>  =C2=A01 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes-recipe/image_types_wic.bbclass
>> b/meta/classes-recipe/image_types_wic.bbclass
>> index cf3be909b3..b0b5691225 100644
>> --- a/meta/classes-recipe/image_types_wic.bbclass
>> +++ b/meta/classes-recipe/image_types_wic.bbclass
>> @@ -205,3 +205,14 @@ addtask do_flush_pseudodb after do_rootfs before
>> do_image do_image_qa
>>  =C2=A0addtask do_rootfs_wicenv after do_image before do_image_wic
>>  =C2=A0do_rootfs_wicenv[vardeps] +=3D "${WICVARS}"
>>  =C2=A0do_rootfs_wicenv[prefuncs] =3D 'set_image_size'
>> +
>> +#
>> +# Clean also .env file created in
>> tmp/sysroots/<machine>/imgdata/<image>.env
>> +# when a clean is invoked
>> +#
>> +do_clean:append() {
>> +=C2=A0=C2=A0=C2=A0 stdir =3D d.getVar('STAGING_DIR')
>> +=C2=A0=C2=A0=C2=A0 outdir =3D os.path.join(stdir, d.getVar('MACHINE')=
, 'imgdata')
>> +=C2=A0=C2=A0=C2=A0 basename =3D d.getVar('IMAGE_BASENAME')
>> +=C2=A0=C2=A0=C2=A0 bb.utils.remove(os.path.join(outdir, basename) + '=
.env')
>> +}
>=20
> This doesn't look right unfortunately.
>=20
> Things should not be being placed into the sysroots (STAGING_DIR) that
> aren't under the control of sstate. If things are, we need to fix that
> at the source of the problem.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

Hi Richard,

thank you.

What would be the correct directory where to put the .env files?
I don't know much about Yocto internals, but I can try do arrange a=20
patch to solve the problem at the source.

Thanks, regards

--=20
Mauro

