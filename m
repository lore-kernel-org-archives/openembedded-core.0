Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740C3C77B78
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 22:22:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.17715.1682202165880233518
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 15:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QYJRwBUl;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-95369921f8eso444929266b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682202164; x=1684794164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WAQdGHYIgJcPuuqjHUIi7o6Ag3vIytbgWuF88a+RGk=;
        b=QYJRwBUlt+bF+TwJM/mAjjbTR0zmsVb6Xkw75JIi2em65msVjmxS3aAYOg2f3e5fRY
         4jscPxnwm9cvkRxQ2bAYJcDB+hLyQ9pw5SJh+2g+K68oqrptZh3H5wE0hXGNhLTHQoI2
         +WMsFgPXFTzXkP773/XwQ/r4B1DuHMwSJ73r3NavdB/ISmDz8ORDgEgZUk7Jzxs2Afvd
         HTDzOeHDnDykOpknD/T7y+fIqMV0U1FoNHGSuliNR+mOnbc56uG7kW+I0CuG3hyVoElN
         i3jBxgGyvD5PWQeFGNpeeYpLeApjN0mexrHXHlvC8VTApTYnSknKqDOqjZDWX3uuVC3n
         eDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682202164; x=1684794164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WAQdGHYIgJcPuuqjHUIi7o6Ag3vIytbgWuF88a+RGk=;
        b=SbDiQNYQihYpdDjRAoUxvcuWk34eeHbOKdVhsTNimpdsYyxACsBDK6ktnTcZC1G5lJ
         isYp2Nj5fuP8dUUhM1Ztm34N/UXENBh5m5DKQ2ECOWNftohwz3xedMxBYEJkb3usdWB3
         WwEXHTOwWAfd2HewoaCEPjrmAwDQXfZp7Z08Bj9w+32dPJL1LBI9DpQ2UP24EvcBhc0d
         KNKGat+omfgKzhZ4hYdeQqjBK+Zas7u59dNca1pHMVspIRs/v+m1UPG13tlK9CEuaa+X
         3rp3+6cXeoCnFryMjui2TYqeFznkNvHm0U1NbDw6uI0NHAlltpgRHd0kufdqpr8+1VsV
         RKpQ==
X-Gm-Message-State: AAQBX9d2IvHiD4Ipqn9VdPWSzs68GeLp5HCx/kTnenqBWKM6wRtPxzg+
	6R71nev3cAFCwvr8GsVLehkLu4XUJyH7rgOmQ0auwJ+NC9FOuC0B
X-Google-Smtp-Source: AKy350bDILG5lMCeFbyCiP8xsvN2ZZXeJPL/J9GOXxSarFylBy/cBYmWJpbA4wjtcpcQp/dxUsFMqQUuJ56ASyxdAw4=
X-Received: by 2002:a17:906:d042:b0:94a:93f4:711d with SMTP id
 bo2-20020a170906d04200b0094a93f4711dmr6674482ejb.4.1682202164021; Sat, 22 Apr
 2023 15:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230421112447.21966-1-skulkarni@mvista.com> <CAKzga+z6NaV9QyyzQKFuAniM9VkZvuC4zm2xyQQaGaQPa+JJog@mail.gmail.com>
In-Reply-To: <CAKzga+z6NaV9QyyzQKFuAniM9VkZvuC4zm2xyQQaGaQPa+JJog@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 22 Apr 2023 12:22:33 -1000
Message-ID: <CAOSpxdZxCLXJWba62z7Js-y0sS3ax14mC26jcZvZZ3fRY7MHcQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] go: Ignore CVE-2022-1705
To: Shubham Kulkarni <skulkarni@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 22:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180325

I don't see the patch on this list or in patchworks.  Could you please rese=
nd?

Thanks,

Steve

On Sat, Apr 22, 2023 at 6:12=E2=80=AFAM Shubham Kulkarni <skulkarni@mvista.=
com> wrote:
>
> Hi Steve,
>
> Is there any issue with this patch? It's not included in the patch review=
 list email.
>
> Thanks,
> Shubham
>
> On Fri, 21 Apr, 2023, 4:54 pm Shubham Kulkarni, <skulkarni@mvista.com> wr=
ote:
>>
>> From: Shubham Kulkarni <skulkarni@mvista.com>
>>
>> The vulnerability was introduced in go1.15beta1 with commit d5734d4.
>> Dunfell uses go1.14 version which does not contain the affected code.
>>
>> Ref: https://security-tracker.debian.org/tracker/CVE-2022-1705
>>
>> Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
>> ---
>>  meta/recipes-devtools/go/go-1.14.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtool=
s/go/go-1.14.inc
>> index 8df9d62612..961e233fe6 100644
>> --- a/meta/recipes-devtools/go/go-1.14.inc
>> +++ b/meta/recipes-devtools/go/go-1.14.inc
>> @@ -85,3 +85,6 @@ CVE_CHECK_WHITELIST +=3D "CVE-2022-30630"
>>
>>  # This is specific to Microsoft Windows
>>  CVE_CHECK_WHITELIST +=3D "CVE-2022-41716"
>> +
>> +# Issue introduced in go1.15beta1, does not exist in 1.14
>> +CVE_CHECK_WHITELIST +=3D "CVE-2022-1705"
>> --
>> 2.40.0
>>

