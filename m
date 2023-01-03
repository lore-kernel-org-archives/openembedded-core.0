Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C02C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 12:27:11 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.62005.1672748823658984886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 04:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dEtDGhH9;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id p2so16055445ljn.7
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+EePhYTsKBvmkotjSTvtMb+055orlno8odCnjDfdCU=;
        b=dEtDGhH95UY9Pj/hUQb7DMUewFocdOrpm4Z/Mfz/8vvDD8gVqqNjpMfa3zxg2+S+TD
         K6oWERXo8rc0ghUee44bYT0Nuh9HxtBrK00TDF3C9r/40dazQSv5heorArc/G4ugwjTs
         sS80oxJNEXIee8p1Gq1MYNivzPhCQJt6x+n8W+4p5b9wEQvbu0CLYA+B8C/GXA0s1lRf
         0LgIaZ7D7LSYvhFH0T/vLOAIuXRwPvXMWor5beWhax5rlBwGkCKN+o7RUh5n9fU5vIIb
         HPqujD+Df2PVUrrm6U4GFMXKXrbGZit+dxHBOuPyBy38mnOYBwY3lqjk9YvacvADE2sH
         x4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+EePhYTsKBvmkotjSTvtMb+055orlno8odCnjDfdCU=;
        b=mWOEYEzD9NZH4x7CJ85R24UOfpFrWzL/F0Ps/JorNrW9vgUueZjqdB7kokhUBYxOkS
         xG9vpRLQJDRwpp3rFKSq3Z01xCHMkxRBmugyq2EPxlKL29/HMDoiuh2z+CnrOBt7+/rW
         Q4XispMAR1PahkEiY8wHuY7rUiVu80li7qWSna++fn8Q1JS0xLKvZzoAp9bFo1N1B1GQ
         g5b+tFTJaBuSjIOcBzBervE8A1aqHKYrLe8f5ZgyURBhUzldE2gfJG9siGNgvr1acwU/
         OidOrdrNPUBuoNoA8saI4FWCEjATgKJBE8/o5+PW/s67mgFNR9xEoy21HsQ6PLsqd2e1
         WdDQ==
X-Gm-Message-State: AFqh2kpEY3/BxxBvaHGVG9okIKrHiaEhKHgKVmz2lZfG0FC+4S7u3aNd
	oSiCOHS46jvFj39LfTYMj4gyQrrljB0Pkyo/jMA=
X-Google-Smtp-Source: AMrXdXuWyfLRYOasrXZ0O9TmHbKcm7LAT6HDOQb4vWX3vumTfy/f+grjwNTON37xRQO83xY/nlOlrIE0OgJs7UD3ixc=
X-Received: by 2002:a2e:a722:0:b0:27f:46eb:19aa with SMTP id
 s34-20020a2ea722000000b0027f46eb19aamr1672798lje.337.1672748821680; Tue, 03
 Jan 2023 04:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
 <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
 <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com> <CANPvuRk51aAcDyXkeN28fkpbb8XHPEJYRoAihEBM=_oYTggW_w@mail.gmail.com>
In-Reply-To: <CANPvuRk51aAcDyXkeN28fkpbb8XHPEJYRoAihEBM=_oYTggW_w@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 3 Jan 2023 13:26:50 +0100
Message-ID: <CAApg2=R+Z-d_R=av4zHygitPXiHvqdXdzKJ7HWY4Q3a-K171vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000050988405f15b2fbf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175341

--00000000000050988405f15b2fbf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2023 at 10:30 AM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

>
>
> Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda,
> 2/01/2023 =C3=A0(s) 16:38:
>
>>
>>
>> On Mon, Jan 2, 2023 at 2:14 PM Jose Quaresma <quaresma.jose@gmail.com>
>> wrote:
>>
>>> Hi Marta,
>>>
>>> Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda,
>>> 2/01/2023 =C3=A0(s) 07:03:
>>>
>>>> The database update has been done on the original file. In case of
>>>> network connection issues, temporary outage of the NVD server or
>>>> a similar situation, the function could exit with incomplete data
>>>> in the database. This patch solves the issue by performing the update
>>>> on a copy of the database. It replaces the main one only if the whole
>>>> update was successful.
>>>>
>>>> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929
>>>>
>>>> Reported-by: Alberto Pianon <alberto@pianon.eu>
>>>> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
>>>> ---
>>>>  .../recipes-core/meta/cve-update-db-native.bb | 81 +++++++++++++-----=
-
>>>>  1 file changed, 56 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
>>>> b/meta/recipes-core/meta/cve-update-db-native.bb
>>>> index 642fda5395..89804b9e5c 100644
>>>> --- a/meta/recipes-core/meta/cve-update-db-native.bb
>>>> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>>>> @@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>>>>  # Timeout for blocking socket operations, such as the connection
>>>> attempt.
>>>>  CVE_SOCKET_TIMEOUT ?=3D "60"
>>>>
>>>> +CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
>>>> +
>>>>  python () {
>>>>      if not bb.data.inherits_class("cve-check", d):
>>>>          raise bb.parse.SkipRecipe("Skip recipe when cve-check class i=
s
>>>> not loaded.")
>>>> @@ -32,19 +34,15 @@ python do_fetch() {
>>>>      """
>>>>      import bb.utils
>>>>      import bb.progress
>>>> -    import sqlite3, urllib, urllib.parse, gzip
>>>> -    from datetime import date
>>>> +    import shutil
>>>>
>>>>      bb.utils.export_proxies(d)
>>>>
>>>> -    YEAR_START =3D 2002
>>>> -
>>>>      db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>>>>      db_dir =3D os.path.dirname(db_file)
>>>> +    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
>>>>
>>>> -    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
>>>> -
>>>> -    cleanup_db_download(db_file)
>>>> +    cleanup_db_download(db_file, db_tmp_file)
>>>>
>>>>      # The NVD database changes once a day, so no need to update more
>>>> frequently
>>>>      # Allow the user to force-update
>>>> @@ -62,9 +60,55 @@ python do_fetch() {
>>>>          pass
>>>>
>>>>      bb.utils.mkdirhier(db_dir)
>>>> +    if os.path.exists(db_file):
>>>> +        shutil.copy2(db_file, db_tmp_file)
>>>> +
>>>> +    if update_db_file(db_tmp_file, d) =3D=3D True:
>>>> +        # Update downloaded correctly, can swap files
>>>> +        shutil.move(db_tmp_file, db_file)
>>>> +    else:
>>>> +        # Update failed, do not modify the database
>>>> +        bb.note("CVE database update failed")
>>>> +        os.remove(db_tmp_file)
>>>> +}
>>>> +
>>>> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
>>>> +do_fetch[file-checksums] =3D ""
>>>> +do_fetch[vardeps] =3D ""
>>>> +
>>>> +def cleanup_db_download(db_file, db_tmp_file):
>>>> +    """
>>>> +    Cleanup the download space from possible failed downloads
>>>> +    """
>>>> +    if os.path.exists("{0}-journal".format(db_file)):
>>>> +        # If a journal is present the last update might have been
>>>> interrupted. In that case,
>>>> +        # just wipe any leftovers and force the DB to be recreated.
>>>> +        os.remove("{0}-journal".format(db_file))
>>>> +
>>>> +        if os.path.exists(db_file):
>>>> +            os.remove(db_file)
>>>> +
>>>> +    if os.path.exists("{0}-journal".format(db_tmp_file)):
>>>> +        # If a journal is present the last update might have been
>>>> interrupted. In that case,
>>>> +        # just wipe any leftovers and force the DB to be recreated.
>>>> +        os.remove("{0}-journal".format(db_tmp_file))
>>>> +
>>>> +    if os.path.exists(db_tmp_file):
>>>> +        os.remove(db_tmp_file)
>>>> +
>>>>
>>>
>>> It seems to me that this function is a duplication of the old version
>>> with an extra argument.
>>> So I think that using the old function version and call it with the
>>> proper argument does the same:
>>>
>>> cleanup_db_download(db_file)
>>> cleanup_db_download(db_tmp_file)
>>>
>>>
>> Hi Jose,
>> Thanks for looking into that. The function is not a total duplicate: the
>> difference is that
>> the it always removes the db_tmp_file, not only if the journal file
>> exists (Python code
>> formatting!).
>>
>
> Don't see on the first time that the db_tmp_file is always removed, I nee=
d
> new glasses :)
>
>
>>
>> I was hesitating on this part a bit, because with the old path could be
>> taken only in some
>> specific situations: at the code update and if you share the DL_DIR and
>> some of the builds
>> use the old code, some the new version. I think we should keep both for
>> now for safety.
>>
>
> makes sense, thanks for your explanation.
>
>
Well... I'll submit a v2 with comments to make sure nobody tries to
optimize that piece :)

Regards,
Marta

--00000000000050988405f15b2fbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 10:30 AM Jose =
Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a href=3D"m=
ailto:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; =
escreveu no dia segunda, 2/01/2023 =C3=A0(s) 16:38:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Jan 2, 2023 at 2:14 PM Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr">Hi=C2=A0Marta,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a href=3D"mailto:rybczy=
nska@gmail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; escreveu no =
dia segunda, 2/01/2023 =C3=A0(s) 07:03:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">The database update has been done on the original f=
ile. In case of<br>
network connection issues, temporary outage of the NVD server or<br>
a similar situation, the function could exit with incomplete data<br>
in the database. This patch solves the issue by performing the update<br>
on a copy of the database. It replaces the main one only if the whole<br>
update was successful.<br>
<br>
See <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929" r=
el=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D14929</a><br>
<br>
Reported-by: Alberto Pianon &lt;<a href=3D"mailto:alberto@pianon.eu" target=
=3D"_blank">alberto@pianon.eu</a>&gt;<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@lina=
ro.org" target=3D"_blank">marta.rybczynska@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> | 81 ++++++++=
+++++------<br>
=C2=A01 file changed, 56 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> b/meta=
/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">cve-update-db-native.bb</a><br>
index 642fda5395..89804b9e5c 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
@@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D &quot;86400&quot;<br>
=C2=A0# Timeout for blocking socket operations, such as the connection atte=
mpt.<br>
=C2=A0CVE_SOCKET_TIMEOUT ?=3D &quot;60&quot;<br>
<br>
+CVE_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db&quot;<b=
r>
+<br>
=C2=A0python () {<br>
=C2=A0 =C2=A0 =C2=A0if not bb.data.inherits_class(&quot;cve-check&quot;, d)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Skip reci=
pe when cve-check class is not loaded.&quot;)<br>
@@ -32,19 +34,15 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0import bb.utils<br>
=C2=A0 =C2=A0 =C2=A0import bb.progress<br>
-=C2=A0 =C2=A0 import sqlite3, urllib, urllib.parse, gzip<br>
-=C2=A0 =C2=A0 from datetime import date<br>
+=C2=A0 =C2=A0 import shutil<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.export_proxies(d)<br>
<br>
-=C2=A0 =C2=A0 YEAR_START =3D 2002<br>
-<br>
=C2=A0 =C2=A0 =C2=A0db_file =3D d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0db_dir =3D os.path.dirname(db_file)<br>
+=C2=A0 =C2=A0 db_tmp_file =3D d.getVar(&quot;CVE_DB_TEMP_FILE&quot;)<br>
<br>
-=C2=A0 =C2=A0 cve_socket_timeout =3D int(d.getVar(&quot;CVE_SOCKET_TIMEOUT=
&quot;))<br>
-<br>
-=C2=A0 =C2=A0 cleanup_db_download(db_file)<br>
+=C2=A0 =C2=A0 cleanup_db_download(db_file, db_tmp_file)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# The NVD database changes once a day, so no need to up=
date more frequently<br>
=C2=A0 =C2=A0 =C2=A0# Allow the user to force-update<br>
@@ -62,9 +60,55 @@ python do_fetch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(db_dir)<br>
+=C2=A0 =C2=A0 if os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(db_file, db_tmp_file)<br>
+<br>
+=C2=A0 =C2=A0 if update_db_file(db_tmp_file, d) =3D=3D True:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update downloaded correctly, can swap files<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(db_tmp_file, db_file)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update failed, do not modify the database<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;CVE database update failed&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_tmp_file)<br>
+}<br>
+<br>
+do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_FILE_LOCK}&quot;<br>
+do_fetch[file-checksums] =3D &quot;&quot;<br>
+do_fetch[vardeps] =3D &quot;&quot;<br>
+<br>
+def cleanup_db_download(db_file, db_tmp_file):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Cleanup the download space from possible failed downloads<br=
>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_file)):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_fi=
le))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_file)<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_tmp_file=
)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_tm=
p_file))<br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(db_tmp_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_tmp_file)<br>
+<br></blockquote><div><br></div><div>It seems to me that this function is =
a duplication of the old version with an extra argument.</div><div>So I thi=
nk that using the old function version and call it with the proper argument=
 does the same:</div><div><br><span style=3D"color:rgb(0,0,0)">cleanup_db_d=
ownload(db_file)</span><br></div><div><span style=3D"color:rgb(0,0,0)">clea=
nup_db_download(db_tmp_file)</span><br></div></div><br></div></blockquote><=
div><br></div><div>Hi Jose,</div><div>Thanks for looking into that. The fun=
ction is not a total duplicate: the difference is that</div><div><span styl=
e=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%">the it</span> alway=
s removes the db_tmp_file, not only if the journal file exists (Python code=
</div><div>formatting!).<br></div></div></div></blockquote><div><br></div><=
div>Don&#39;t see on the first time that the db_tmp_file is always=C2=A0rem=
oved,=C2=A0I need new glasses :)</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><=
div></div><div><br></div><div>I was hesitating on this part a bit, because =
with the old path could be taken only in some</div><div>specific situations=
: at the code update and if you share the DL_DIR and some of the builds</di=
v><div>use the old code, some the new version. I think we should keep both =
for now for safety.=C2=A0</div></div></div></blockquote><div><br>makes sens=
e, thanks for your explanation.<br><br></div></div></div></blockquote><div>=
<br></div><div>Well... I&#39;ll submit a v2 with comments to make sure nobo=
dy tries to optimize that piece :)</div><div><br></div><div>Regards,</div><=
div>Marta <br></div></div></div>

--00000000000050988405f15b2fbf--

