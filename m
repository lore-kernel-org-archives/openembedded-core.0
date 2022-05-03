Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C954CC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 09:46:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.9053.1651571194541615670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 02:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eIEj+gHA;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id i27so32369775ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=idDMupC58PJxmXJyg2TW9VjbvVraRwYihpjwg2cDNBk=;
        b=eIEj+gHAk1UoluKQqwni7LaYUvL9YG3FRZlGEOUOc5PWgR3KlpPjJvABs7jQYcCUWn
         T8FjT0vCYl0RTlBYeDnm4kB5BKbyH/g2LuD4NPhfswKvXLf+tf2tiuNrG8X+hocqXQ6I
         Ek4oju09iWB3q5DmhGNyE09NrWXsh3OXk+OqfqMCCaP1J72KRY6W5UY617+Jdih9IG2P
         mZaYjcsSu0w8G9jmktOlmXCWeWNOyb21Xg8I8ADVzVfViO9IiujhuDTdlTG7sOxR0FO9
         M5DTi+eO2ApkQzX9QhIX6wnJ4H1woqjL+BPjMV4YxhHVtY/EDcGCHTJTnmpLVCiAucWs
         dY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=idDMupC58PJxmXJyg2TW9VjbvVraRwYihpjwg2cDNBk=;
        b=MQw3Jnq+pkkBi1p63F8ZCgF0N4zRdRYOyvDPHvTiCppb1KQyCPwZeXK/XrmGVdvZ6G
         2z7XTVCgRbJMRyYxU7/yNQcgE3ZJJ2nfQix4U3QzbBV+HwHFEJY7v49ZitXGshJ3ylPS
         XJ3psoheCVdNphxx3TTQtkpqrSXpus58OMcs8J3meqYZQdHNRkI1Wcj2bTkD9P+MuUzA
         mUHmDCWcRtXCMl3rH3wFagqHWUg/9C4g8hQoJCEI+xsLur8xLlfDVsR4SbmLpcaVE+Iy
         qdwFe0PNu2OBoO6YA1eaNl0GYeoJ7eSVrdUE+7nsxwVBsYVT3cqMC3OcnLhBLjSEX3ax
         +qhg==
X-Gm-Message-State: AOAM530F5crxG2FAYpdo1pzObTV3kiqgmoJq1NcvQQ+k8TP1xnum3Tuq
	Yehj9scs1jUzmK9YTba+1xo=
X-Google-Smtp-Source: 
 ABdhPJz7zUZ73yGixOtVtvWb6fgJlUlNqWqApYFN2nzd2/6fXSCW5w//beY9asd+zkECbN5gL0ihHQ==
X-Received: by 2002:a17:907:3f13:b0:6f3:ad46:be1f with SMTP id
 hq19-20020a1709073f1300b006f3ad46be1fmr14663720ejc.627.1651571192924;
        Tue, 03 May 2022 02:46:32 -0700 (PDT)
Received: from smtpclient.apple (host-87-5-19-163.retail.telecomitalia.it.
 [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 el8-20020a170907284800b006f3ef214e12sm4469112ejc.120.2022.05.03.02.46.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 May 2022 02:46:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [OE-core] [master][kirkstone][PATCH] rootfs-postcommands: fix
 symlinks where link and output path are equal
From: Davide Gardenal <davidegarde2000@gmail.com>
In-Reply-To: <20220503114304.6e43082b@melee>
Date: Tue, 3 May 2022 11:46:31 +0200
Cc: openembedded-core@lists.openembedded.org,
 Davide Gardenal <davide.gardenal@huawei.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3C7402C-F0A4-4CB0-9C94-F849E3B1C65C@gmail.com>
References: <20220503080309.9511-1-davide.gardenal@huawei.com>
 <20220503114304.6e43082b@melee>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 09:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165198

Yes, I don=E2=80=99t know how this happened...

> Il giorno 3 mag 2022, alle ore 11:43, Luca Ceresoli =
<luca.ceresoli@bootlin.com> ha scritto:
>=20
> Hi Davide,
>=20
> Il giorno Tue,  3 May 2022 10:03:09 +0200
> "Davide Gardenal" <davidegarde2000@gmail.com> ha scritto:
>=20
>> When creating the manifest and the testdata.json links, if the link
>> name is equal to the output name the link is not created, otherwise
>> it is. This prevents a link-to-self in the first case.
>>=20
>> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
>> ---
>> meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
>> 1 file changed, 8 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta/classes/rootfs-postcommands.bbclass
>> b/meta/classes/rootfs-postcommands.bbclass index
>> 7b92df69c5..c949115647 100644 ---
>> a/meta/classes/rootfs-postcommands.bbclass +++
>> b/meta/classes/rootfs-postcommands.bbclass @@ -267,9 +267,10 @@
>> python write_image_manifest () {=20
>>     if os.path.exists(manifest_name) and link_name:
>>         manifest_link =3D deploy_dir + "/" + link_name + ".manifest"
>> -        if os.path.lexists(manifest_link):
>> -            os.remove(manifest_link)
>> -        os.symlink(os.path.basename(manifest_name), manifest_link)
>> +		if manifest_link !=3D manifest_name
>> +			if os.path.lexists(manifest_link):
>> +				os.remove(manifest_link)
>> +			os.symlink(os.path.basename(manifest_name),
>=20
> This change is mixing tabs and spaces.
>=20
>> # Can be used to create /etc/timestamp during image construction to
>> give a reasonably @@ -339,9 +340,10 @@ python write_image_test_data()
>> {=20
>>     if os.path.exists(testdata_name) and link_name:
>>         testdata_link =3D os.path.join(deploy_dir, "%s.testdata.json"
>> % link_name)
>> -        if os.path.lexists(testdata_link):
>> -            os.remove(testdata_link)
>> -        os.symlink(os.path.basename(testdata_name), testdata_link)
>> +		if testdata_link !=3D testdata_name:
>> +			if os.path.lexists(testdata_link):
>> +				os.remove(testdata_link)
>> +			os.symlink(os.path.basename(testdata_name),
>=20
> And this as well.
>=20
> Can you send v2 with spaces-only indentation?
>=20
> Best regards,
> --=20
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


