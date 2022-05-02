Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62BAC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:12:59 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web09.11062.1651500773923903235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VgKPeoS6;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e1so7956834ile.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MAJ1BsSgsmyd5aSNfpN1RhC7VyU7dhY8E93+8yhTyyk=;
        b=VgKPeoS6PLEGvY46x6vSi/vM3tOq9fVo4tmhBIMvwXpHc8g2gl/bTj1AEgNvO26FOK
         lIYpbQUaSZUxw0mdAeoSZ5xUiWbax8Lu7DLWaEoMhuIVAEuVwS7PFTWzebMsff2/A0Wh
         kjd97wQP/lSWEmm6c8ttI7gJla2vMd4HnHJbbJADrb17MEf1BRLgDSw4P8AFN+sedQmw
         A/I1MjHQ+44b84RwTdRZRlHGobf0EDsEdpjcRtPWNhsSQHZvXVrczvd547IkwtI5/c+W
         5X15Lds7fPmqTmFg5tosvAWoX3UivpDCAJ3nGUt5B5fQyS9IvHb1K/pL3Qbs6P23dZEY
         iLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MAJ1BsSgsmyd5aSNfpN1RhC7VyU7dhY8E93+8yhTyyk=;
        b=Qoij70zxtv3yRz2/DAG1+qXWSVCvGZTgbQXU2nzsIUgZ4hF6aAPVLaWVTrPH28xpFi
         vTlaZE97LGjP0j+a55hexzB4FuC+SwZ6gJMtET9uMjGYWjm+7JZ53txOXqeFfZ6NRetF
         8goMoAIr+qF+WIxdQpHR6wPInk+yqAQHYU0Tvm5O+xpgeuM/SVCZCmq7eVH1/l0d7sGb
         fG+6H1mq3I8RCYpD9QKXUkP/x70HGFe0yG3W63EET8iVsfUxK23XLQoUOz9gkizTUL6A
         9IvKNbnzrBcmZgmmrbcC2ZwfK34DDFfiDqfrSvZ5337MtyyDC/crmWkXMehbuD3HU4QW
         W4jw==
X-Gm-Message-State: AOAM532ZIAE8JmuAt8DaRG2CCKHmo+BdRtalzgTAbzHAsHllYgZKwMqT
	WfEMNutaiq2PnXUKEJ+pcvXPV8jN4EOAFm+h7iY=
X-Google-Smtp-Source: 
 ABdhPJyUOMIMaZWAz+cJXNcaxNVf7QcghClB3bPFeqTx0M4rfdILo+pX7tsl2ZQ3f9mn2lLBIs7FEpHe2RP/M6lavgM=
X-Received: by 2002:a05:6e02:1d8d:b0:2cf:2112:2267 with SMTP id
 h13-20020a056e021d8d00b002cf21122267mr912476ila.239.1651500773244; Mon, 02
 May 2022 07:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220502074317.6470-1-davide.gardenal@huawei.com>
 <CANPvuRk-V6T6m1xWgmw6JQu7QgV8AdeFPjj6Xe3UHRt-Wzsavw@mail.gmail.com>
In-Reply-To: 
 <CANPvuRk-V6T6m1xWgmw6JQu7QgV8AdeFPjj6Xe3UHRt-Wzsavw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 2 May 2022 04:12:42 -1000
Message-ID: 
 <CAGDS+n=UP35M_gxC_0c7Nvje7nrT3gaGN9JaAE_a=RPqCzqAow@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] cve-check: add JSON format
 to summary output
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Davide Gardenal <davidegarde2000@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 14:12:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165168

On Sun, May 1, 2022 at 11:08 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
> Hi Davide,
>
> This patch needs to be sent first for the master branch and backported fo=
r kirkstone only after that.

He's tagged [master] in the subject in addition to [kirkstone], so
this is fine.  I appreciate the heads up that I should keep an eye out
for the master commit.

Steve

> Davide Gardenal <davidegarde2000@gmail.com> escreveu no dia segunda, 2/05=
/2022 =C3=A0(s) 08:43:
>>
>> Create generate_json_report including all the code used to generate the =
JSON
>> manifest file.
>> Add to cve_save_summary_handler the ability to create the summary in JSO=
N format.
>>
>> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
>> ---
>>  meta/classes/cve-check.bbclass | 50 +++++++++++++-------
>>  1 file changed, 32 insertions(+), 18 deletions(-)
>>
>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbc=
lass
>> index 78516d0..64875d7 100644
>> --- a/meta/classes/cve-check.bbclass
>> +++ b/meta/classes/cve-check.bbclass
>> @@ -79,6 +79,29 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>>  # set to "alphabetical" for version using single alphabetical character=
 as increment release
>>  CVE_VERSION_SUFFIX ??=3D ""
>>
>> +def generate_json_report(out_path, link_path):
>> +    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>> +        import json
>> +        from oe.cve_check import cve_check_merge_jsons
>> +
>> +        bb.note("Generating JSON CVE summary")
>> +        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
>> +        summary =3D {"version":"1", "package": []}
>> +        with open(index_file) as f:
>> +            filename =3D f.readline()
>> +            while filename:
>> +                with open(filename.rstrip()) as j:
>> +                    data =3D json.load(j)
>> +                    cve_check_merge_jsons(summary, data)
>> +                filename =3D f.readline()
>> +
>> +        with open(out_path, "w") as f:
>> +            json.dump(summary, f, indent=3D2)
>> +
>> +        if os.path.exists(os.path.realpath(link_path)):
>> +            os.remove(link_path)
>> +        os.symlink(os.path.basename(out_path), link_path)
>> +
>>  python cve_save_summary_handler () {
>>      import shutil
>>      import datetime
>> @@ -101,6 +124,11 @@ python cve_save_summary_handler () {
>>              if os.path.exists(os.path.realpath(cvefile_link)):
>>                  os.remove(cvefile_link)
>>              os.symlink(os.path.basename(cve_summary_file), cvefile_link=
)
>> +
>> +        json_summary_link_name =3D os.path.join(cvelogpath, d.getVar("C=
VE_CHECK_SUMMARY_FILE_NAME_JSON"))
>> +        json_summary_name =3D os.path.join(cvelogpath, "%s-%s.json" % (=
cve_summary_name, timestamp))
>> +        generate_json_report(json_summary_name, json_summary_link_name)
>> +        bb.plain("CVE report summary created at: %s" % json_summary_lin=
k_name)
>>  }
>>
>>  addhandler cve_save_summary_handler
>> @@ -175,25 +203,11 @@ python cve_check_write_rootfs_manifest () {
>>              os.symlink(os.path.basename(manifest_name), manifest_link)
>>              bb.plain("Image CVE report stored in: %s" % manifest_name)
>>
>> -    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>> -        import json
>> +        link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
>> +        manifest_path =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
>>          bb.note("Generating JSON CVE manifest")
>> -        deploy_dir =3D d.getVar("DEPLOY_DIR_IMAGE")
>> -        link_name =3D d.getVar("IMAGE_LINK_NAME")
>> -        manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
>> -        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
>> -        manifest =3D {"version":"1", "package": []}
>> -        with open(index_file) as f:
>> -            filename =3D f.readline()
>> -            while filename:
>> -                with open(filename.rstrip()) as j:
>> -                    data =3D json.load(j)
>> -                    cve_check_merge_jsons(manifest, data)
>> -                filename =3D f.readline()
>> -
>> -        with open(manifest_name, "w") as f:
>> -            json.dump(manifest, f, indent=3D2)
>> -        bb.plain("Image CVE report stored in: %s" % manifest_name)
>> +        generate_json_report(json_summary_name, json_summary_link_name)
>> +        bb.plain("Image CVE JSON report stored in: %s" % link_path)
>>  }
>>
>>  ROOTFS_POSTPROCESS_COMMAND:prepend =3D "${@'cve_check_write_rootfs_mani=
fest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
>> --
>> 2.32.0
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165162): https://lists.openembedded.org/g/openembedde=
d-core/message/165162
> Mute This Topic: https://lists.openembedded.org/mt/90830880/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sa=
koman@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

