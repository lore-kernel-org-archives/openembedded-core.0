Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40860C54E68
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 12:31:56 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.11252.1710419513919690725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 05:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=KCevbTYn;
 spf=pass (domain: smile.fr, ip: 209.85.208.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so1101241a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710419512; x=1711024312; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RbndgJOEaiSTaB85hH6RK9MSK1q4sH/G3vGi8MJ8SdI=;
        b=KCevbTYnHNbEnVdmjqP2/y+Dx6zuF/O0wTM2q/mSm7sWz3lJQBFtAJx4RJSnHC+eG1
         VzbIBsm/mn9xnQAzpSi+jYizcgh2yxYzJfF9ciYVOTo4ntorcjoNMZUlFdhHGXlTe0Qv
         yfVnt+KeZyD9TWROuhmyJqxQiRDz8qmI0qAp4NKzwu+7tYX6+pfIyPzVpqpo9D8mppaM
         aktnefNRpIbZVpl9i2LHsxTptZIfKSvT5NqdLOKVbMBdbvwOIsHLg4aLgu5vGpy/o66x
         gu1m2Y9tHTi09gEKDbLwGlAn39e0wT73LmIt7Q0gxFhrtE+68HO/HD4CzBaRUH0bTzYJ
         CdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710419512; x=1711024312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbndgJOEaiSTaB85hH6RK9MSK1q4sH/G3vGi8MJ8SdI=;
        b=vup8sNrsJexnGY1mW/WT4sqFVVqm3eSrSrsRUoVvUvJqp91zV1bwzh5ZYZCm8TZ1EP
         Eiw2pxqRfya2W7GwaXrqcayv6ZMZLEzPsioLUV1FHRd0pPlwkq38/32WBNy3qfeRLB6V
         eRFvjRbwsJ2HBLgeKGVFoz7YyZOsvXAs2jEEbu1VPk4FJG3eM7A7uGyg6b+4Qtz0Clly
         UJpyt5iTc1S7qADU6e0luqmDbzSvLQmFzJSX4MIYvgCiq5YlXQs/AJFmWudgJ0aaKhfD
         P5x1wvMUJ0xjI46SS9YHkDuHSXWeOaUyp0S5iutCMwN4XxI2RxW0X6VJtoB2+qV8ejRW
         1RNw==
X-Gm-Message-State: AOJu0YwZBn2eiHeZVYTb7cBevb+UpaHk91AOnXHySVpcUyZlb+cBp/fS
	eoT0pLasZUaqTkiYHQnzX3BjdqLamlD7xyFHccg+f1e4HQgOCm0KS5TRMEzOQphh1fXMGHLMP7o
	PamizRIShoScaVso/YRcJXE4MpKUB9dExORMr4Q==
X-Google-Smtp-Source: AGHT+IGbWCMfIOxXD7V0nEcPZWIxJgUb8OyoqC0ujVF7brZiTtK4nRVQ1YgzI/FGNx+pYcT2VRUoiMcdKIBww1qKL8w=
X-Received: by 2002:a17:906:a389:b0:a44:9fe3:d7d1 with SMTP id
 k9-20020a170906a38900b00a449fe3d7d1mr1178957ejz.43.1710419512104; Thu, 14 Mar
 2024 05:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240313151327.2123368-1-yoann.congal@smile.fr>
 <20240313151327.2123368-2-yoann.congal@smile.fr> <CAApg2=S9Gqg24bqwVgrGbCEBMa+h1ek2kq2nYJzLDA7JX0+89A@mail.gmail.com>
In-Reply-To: <CAApg2=S9Gqg24bqwVgrGbCEBMa+h1ek2kq2nYJzLDA7JX0+89A@mail.gmail.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 14 Mar 2024 13:31:26 +0100
Message-ID: <CAMSfU+7uCjqHiofeAcXjNj2VZhvYce20G+ea2is3EyqJuXgq7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-nvd2-native: Add an age
 threshold for incremental update
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006fb1cf06139e1324"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 12:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197105

--0000000000006fb1cf06139e1324
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 14 mars 2024 =C3=A0 13:14, Marta Rybczynska <rybczynska@gmail.com> =
a
=C3=A9crit :

>
>
> On Wed, 13 Mar 2024, 16:15 Yoann Congal, <yoann.congal@smile.fr> wrote:
>
>> Add a new variable "CVE_DB_INCR_UPDATE_AGE_THRES", which can be used to
>> specify the maximum age of the database for doing an incremental update
>> For older databases, a full re-download is done.
>>
>> With a value of "0", this forces a full-redownload.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  .../meta/cve-update-nvd2-native.bb            | 20 +++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> index f21c139aa5..d565887498 100644
>> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> @@ -26,6 +26,12 @@ NVDCVE_API_KEY ?=3D ""
>>  # Use a negative value to skip the update
>>  CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>>
>> +# CVE database incremental update age threshold, in seconds. If the
>> database is
>> +# older than this threshold, do a full re-download, else, do an
>> incremental
>> +# update. By default: the maximum allowed value from NVD: 120 days
>> (120*24*60*60)
>> +# Use 0 to force a full download.
>> +CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>> +
>>  # Number of attempts for each http query to nvd server before giving up
>>  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
>>
>> @@ -172,18 +178,24 @@ def update_db_file(db_tmp_file, d, database_time):
>>
>>      req_args =3D {'startIndex' : 0}
>>
>> -    # The maximum range for time is 120 days
>> -    # Force a complete update if our range is longer
>> -    if (database_time !=3D 0):
>> +    incr_update_threshold =3D int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRE=
S"))
>> +    if database_time !=3D 0:
>>          database_date =3D datetime.datetime.fromtimestamp(database_time=
,
>> tz=3Ddatetime.timezone.utc)
>>          today_date =3D datetime.datetime.now(tz=3Ddatetime.timezone.utc=
)
>>          delta =3D today_date - database_date
>> -        if delta.days < 120:
>> +        if incr_update_threshold =3D=3D 0:
>> +            bb.note("CVE database: forced full update")
>> +        elif delta < datetime.timedelta(seconds=3Dincr_update_threshold=
):
>>              bb.note("CVE database: performing partial update")
>> +            # The maximum range for time is 120 days
>> +            if delta > datetime.timedelta(days=3D120):
>> +                bb.error("CVE database: Trying to do an incremental
>> update on a larger than supported range")
>>              req_args['lastModStartDate'] =3D database_date.isoformat()
>>              req_args['lastModEndDate'] =3D today_date.isoformat()
>>          else:
>>              bb.note("CVE database: file too old, forcing a full update"=
)
>> +    else:
>> +        bb.note("CVE database: no preexisting database, do a full
>> download")
>>
>>      with bb.progress.ProgressHandler(d) as ph,
>> open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
>>
>> --
>>
>
>
Hi Marta,

Thanks for your review!

If you had not noticed, this patch has been merged here
https://git.yoctoproject.org/poky/commit/?id=3D19f27037b2b785673c8f68f19ea7=
83856f732e4d
And was used this morning by AB
https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/1326 =3D=
>
It does not work as expected, I'm working on it.

I find naming of the variable misleading, sourcing like FORCE_FULL_DOWNLOAD
> would be more obvious.
>
I agree FORCE_FULL_DOWNLOAD is more obvious. But, I've chosen a more
nuanced variable to allow a customised workflow like the one we want on AB:
fulldownload once a day, no update for other daily cve-check runs.


> Also, I'm not sure we need a variable if the user can just delete the
> database file and force the download this way.
>

It is not usually expected of users to manually modify the content of
DL_DIR. Here, I feel like a variable is cleaner and (once documented), will
be more easy for users.


> The 120 days case is special, because its a limit set in the spec.
>

Yes, that what this hunk test:
+            # The maximum range for time is 120 days
+            if delta > datetime.timedelta(days=3D120):
+                bb.error("CVE database: Trying to do an incremental update
on a larger than supported range")
maybe the error message is not clear enough?

Regards,
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000006fb1cf06139e1324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 14 mars 2024 =C3=A0=C2=
=A013:14, Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com">rybc=
zynska@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 13 Mar 2024, 16:1=
5 Yoann Congal, &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_bla=
nk">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Add a new variable &quot;CVE_DB_INCR_UPDATE_AGE_TH=
RES&quot;, which can be used to<br>
specify the maximum age of the database for doing an incremental update<br>
For older databases, a full re-download is done.<br>
<br>
With a value of &quot;0&quot;, this forces a full-redownload.<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" re=
l=3D"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 +++++++++++++++----<br>
=C2=A01 file changed, 16 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-nativ=
e.bb</a> b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.=
bb</a><br>
index f21c139aa5..d565887498 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a=
><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a=
><br>
@@ -26,6 +26,12 @@ NVDCVE_API_KEY ?=3D &quot;&quot;<br>
=C2=A0# Use a negative value to skip the update<br>
=C2=A0CVE_DB_UPDATE_INTERVAL ?=3D &quot;86400&quot;<br>
<br>
+# CVE database incremental update age threshold, in seconds. If the databa=
se is<br>
+# older than this threshold, do a full re-download, else, do an incrementa=
l<br>
+# update. By default: the maximum allowed value from NVD: 120 days (120*24=
*60*60)<br>
+# Use 0 to force a full download.<br>
+CVE_DB_INCR_UPDATE_AGE_THRES ?=3D &quot;10368000&quot;<br>
+<br>
=C2=A0# Number of attempts for each http query to nvd server before giving =
up<br>
=C2=A0CVE_DB_UPDATE_ATTEMPTS ?=3D &quot;5&quot;<br>
<br>
@@ -172,18 +178,24 @@ def update_db_file(db_tmp_file, d, database_time):<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0req_args =3D {&#39;startIndex&#39; : 0}<br>
<br>
-=C2=A0 =C2=A0 # The maximum range for time is 120 days<br>
-=C2=A0 =C2=A0 # Force a complete update if our range is longer<br>
-=C2=A0 =C2=A0 if (database_time !=3D 0):<br>
+=C2=A0 =C2=A0 incr_update_threshold =3D int(d.getVar(&quot;CVE_DB_INCR_UPD=
ATE_AGE_THRES&quot;))<br>
+=C2=A0 =C2=A0 if database_time !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0database_date =3D datetime.datetime.fromt=
imestamp(database_time, tz=3Ddatetime.timezone.utc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0today_date =3D datetime.datetime.now(tz=
=3Ddatetime.timezone.utc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delta =3D today_date - database_date<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if delta.days &lt; 120:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if incr_update_threshold =3D=3D 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;CVE database: forc=
ed full update&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif delta &lt; datetime.timedelta(seconds=3Di=
ncr_update_threshold):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;CVE database:=
 performing partial update&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The maximum range for time is =
120 days<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if delta &gt; datetime.timedelta=
(days=3D120):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;CVE=
 database: Trying to do an incremental update on a larger than supported ra=
nge&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req_args[&#39;lastModStartD=
ate&#39;] =3D database_date.isoformat()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req_args[&#39;lastModEndDat=
e&#39;] =3D today_date.isoformat()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;CVE database:=
 file too old, forcing a full update&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;CVE database: no preexisting dat=
abase, do a full download&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0with bb.progress.ProgressHandler(d) as ph, open(os.path=
.join(d.getVar(&quot;TMPDIR&quot;), &#39;cve_check&#39;), &#39;a&#39;) as c=
ve_f:<br>
<br>
--<br></blockquote></div></div><div dir=3D"auto"><br></div></div></blockquo=
te><div><br></div><div>Hi Marta,</div><div><br></div><div>Thanks for your r=
eview!</div><div><br></div><div>If you had not noticed, this patch has been=
 merged here <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D19f2=
7037b2b785673c8f68f19ea783856f732e4d">https://git.yoctoproject.org/poky/com=
mit/?id=3D19f27037b2b785673c8f68f19ea783856f732e4d</a></div><div>And was us=
ed this morning by AB <a href=3D"https://autobuilder.yoctoproject.org/typho=
on/#/builders/138/builds/1326">https://autobuilder.yoctoproject.org/typhoon=
/#/builders/138/builds/1326</a> =3D&gt; It does not work as expected, I&#39=
;m working on it.<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto=
">I find naming of the variable misleading, sourcing like FORCE_FULL_DOWNLO=
AD would be more obvious. </div></div></blockquote><div>I agree FORCE_FULL_=
DOWNLOAD is more obvious. But, I&#39;ve chosen a more nuanced variable to a=
llow a customised workflow like the one we want on AB: fulldownload once a =
day, no update for other daily cve-check runs.<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=
=3D"auto">Also, I&#39;m not sure we need a variable if the user can just de=
lete the database file and force the download this way.</div></div></blockq=
uote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
It is not usually expected of users to manually modify the content of DL_DI=
R. Here, I feel like a variable is cleaner and (once documented), will be m=
ore easy for users.<br></div><div class=3D"gmail_quote"><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><div dir=
=3D"auto">The 120 days case is special, because its a limit set in the spec=
.</div></div></blockquote><div><br></div><div>Yes, that what this hunk test=
:<br></div><div>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The maximum range for time is =
120 days<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if delta &gt; datetime.timedelta=
(days=3D120):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;CVE=
 database: Trying to do an incremental update on a larger than supported ra=
nge&quot;)</div><div>maybe the error message is not clear enough?<br></div>=
<div><br></div><div>Regards,<br></div><div><span class=3D"gmail_signature_p=
refix">-- </span><br></div></div><div dir=3D"ltr" class=3D"gmail_signature"=
><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><=
font face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></di=
v></div></div>

--0000000000006fb1cf06139e1324--

