Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B44AC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 06:25:55 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.3639.1645856754079966211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 22:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 2F8F4147BF
	for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:25:52 +0100 (CET)
Received: from [192.168.178.83] ([79.219.229.144]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nNqWU-1rC7Gr0; Sat, 26 Feb 2022 07:25:42 +0100
Message-ID: <617cce8b-b939-5b8b-dcfe-4d89f3fcc4fb@t-online.de>
Date: Sat, 26 Feb 2022 07:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][PATCH] bitbake.conf: add ssh-keygen to
 HOSTTOOLS_NONFATAL
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220218073535.5097-1-f_l_k@t-online.de>
 <272916479ebe54e8874bf172a4ec70e6f675b0c3.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <272916479ebe54e8874bf172a4ec70e6f675b0c3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1645856742-0000C4DD-14248CF0/0/0 CLEAN NORMAL
X-TOI-MSGID: d243f57a-6889-4d69-a5cb-1173b2791258
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 06:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162420


Am 25.02.22 um 16:47 schrieb Richard Purdie:
> On Fri, 2022-02-18 at 08:35 +0100, Markus Volk wrote:
>> Gnome Seahorse needs an external ssh-keygen to build and there is no p=
rovider
>> for it in yocto/oe. openssh-native is not allowed to build and if allo=
wed there
>> are problems building it with '--enable-pam'.
>>
>> 'ssh' is already set to be added as a HOSTTOOL when it is found.
>> This commit also adds ssh-keygen.
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/conf/bitbake.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index fba99e8f0c..15ea0bc29e 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -499,7 +499,7 @@ HOSTTOOLS +=3D " \
>>   HOSTTOOLS +=3D "${@'ip ping ps scp ssh stty' if (bb.utils.contains_a=
ny('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.g=
etVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclas=
s"])) else ''}"
>>  =20
>>   # Link to these if present
>> -HOSTTOOLS_NONFATAL +=3D "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc p=
igz sftp socat ssh sudo"
>> +HOSTTOOLS_NONFATAL +=3D "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc p=
igz sftp socat ssh ssh-keygen sudo"
>>  =20
> Does it actually need to generate keys or is it just checking for the p=
resence
> of the tool? I'm not a big fan of adding new tools like this, particula=
rly as
> this could still cause a deterministic build issue...

It looks like there is no need to generate keys. ssh-keygen is only=20
looked for to get SSH_KEYGEN_PATH.

https://gitlab.gnome.org/GNOME/seahorse/-/blob/master/meson.build#L48

https://gitlab.gnome.org/GNOME/seahorse/-/blob/master/meson.build#L126

If that Path isn't set compile fails like this:

d -o ssh/libseahorse-ssh.a.p/meson-generated_operation.c.o -c=20
ssh/libseahorse-ssh.a.p/operation.c
| ssh/libseahorse-ssh.a.p/operation.c: In function=20
'seahorse_ssh_change_passphrase_operation_change_passphrase_async_co':
| ssh/libseahorse-ssh.a.p/operation.c:1834:61: error: 'SSH_KEYGEN_PATH'=20
undeclared (first use in this function)
|=C2=A0 1834 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _data_->_t=
mp15_ =3D g_strdup_printf ("%s -p -f '%s'",=20
SSH_KEYGEN_PATH, _data_->_tmp14_);
| | ^~~~~~~~~~~~~~~
| ssh/libseahorse-ssh.a.p/operation.c:1834:61: note: each undeclared=20
identifier is reported only once for each function it appears in
| ssh/libseahorse-ssh.a.p/operation.c: In function=20
'seahorse_ssh_generate_operation_generate_async_co':
| ssh/libseahorse-ssh.a.p/operation.c:2032:75: error: 'SSH_KEYGEN_PATH'=20
undeclared (first use in this function)
|=C2=A0 2032 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _data_->_t=
mp12_ =3D g_strdup_printf ("%s %s -t '%s' -C=20
%s -f '%s'", SSH_KEYGEN_PATH, _data_->bits_str, _data_->_tmp11_,=20
_data_->comment, _data_->filename);
| | ^~~~~~~~~~~~~~~
| ssh/libseahorse-ssh.a.p/operation.c: In function=20
'seahorse_ssh_private_import_operation_import_private_async_co':
| ssh/libseahorse-ssh.a.p/operation.c:2299:61: error: 'SSH_KEYGEN_PATH'=20
undeclared (first use in this function)
|=C2=A0 2299 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _data_->_t=
mp25_ =3D g_strdup_printf ("%s -y -f '%s'",=20
SSH_KEYGEN_PATH, _data_->_tmp24_);

Actually it is not really ideal to derive that=C2=A0 from hosts path. But=
=20
what would be best to do here?

Hack it like this in seahorse.bb?

do_configure:prepend() {
 =C2=A0=C2=A0=C2=A0 sed -i "s|ssh_keygen =3D find_program('ssh-keygen')|#=
ssh_keygen =3D=20
find_program('ssh-keygen')|" ${S}/meson.build
 =C2=A0=C2=A0=C2=A0 sed -i "s|ssh_keygen.path()|'${bindir}/ssh-keygen'|" =
${S}/meson.build
}


