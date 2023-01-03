Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACBFC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 09:30:40 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.60185.1672738237966197180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 01:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8REEMVQ;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id p30so25534170vsr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 01:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yfoQ7ZMN0gl5+AcECrCufWfu/7lrKpWuGFOdtR7W6Mo=;
        b=o8REEMVQIV4ZVtM5lwQBEYo0vD2Dbz3eg88Cce9qGNehci3gsG8TA6jl9vS4RP5UBc
         9oZJH26L0q8FNDFd0SGeT+PxQ/DQ6wzsINqaEsEh07MzKDtvBpFqrCUCe0gn4vVA2GT6
         Rvwg9H8FqCYvWpM9pphOu+wSnoWEcdZm5/cCZy16EYVnhXENZegQ8CgunbAM93CHw9No
         IL8yNVKX/sDILud08NfQea9qZnF2bw7Bqy3x4S5i0Vl000KZXAS0iNCS9NYISfdyfGjb
         Rb1OsVLNjWNjB4U/Tp4FnvPOXvtz/8duMMAEZzPE5G3VhG6/Aa4iOh6VPF7dyebvtA+G
         RUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfoQ7ZMN0gl5+AcECrCufWfu/7lrKpWuGFOdtR7W6Mo=;
        b=x7trrUofT8khQ2dGi74z00s+Cn2iONtCs9AGjlUwVSXVk4pXUGtFT9Zh0Lp03kfgFU
         V67P9rmiv4jFf2cMyk3cnyo9xEkrNjjmuG1giF72Wc5CqZBxzCEifR/26CnrYWYwjoqt
         VGlgm5PGy8m5sJhsdmfU/lZLuvmxZP4yL1yrcbMeCLvBRwqcHmfN8TxQY/+c2vea45gQ
         GrKYeYtkMkwkPompo24iK6ED/eNUojtqhdgIA5iRBq0I6p++UFlY0qHItHLDQGgz2svw
         /7WI2XbdxUldkcijnRAUcHW+2e961LOL+tOme7dqxCH3KkNBM79FAYnzPNJd3c/+tKsI
         O4Kw==
X-Gm-Message-State: AFqh2kpH/W4rOrLqiovOZleKXbj775PlIFVJ4YUj45BeAJqGkUWtl0sp
	UB5dEGzCj1v4adm1vT/LXx6h0jrMLkbLZ8/fUdw=
X-Google-Smtp-Source: AMrXdXvemDxjBLPp++hMJDqhjztylRyRiSnVQ+6CV2Cjva9q4YaSj3DJNtozGQZ+V5bOgxyfT+mK7GaMZnM92E2omB4=
X-Received: by 2002:a05:6102:22fb:b0:3cb:ba4:3831 with SMTP id
 b27-20020a05610222fb00b003cb0ba43831mr2713676vsh.87.1672738236954; Tue, 03
 Jan 2023 01:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
 <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com> <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com>
In-Reply-To: <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 3 Jan 2023 09:30:21 +0000
Message-ID: <CANPvuRk51aAcDyXkeN28fkpbb8XHPEJYRoAihEBM=_oYTggW_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006a7c6a05f158b8f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 09:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175339

--0000000000006a7c6a05f158b8f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda, 2/01/2023
=C3=A0(s) 16:38:

>
>
> On Mon, Jan 2, 2023 at 2:14 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> Hi Marta,
>>
>> Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda,
>> 2/01/2023 =C3=A0(s) 07:03:
>>
>>> The database update has been done on the original file. In case of
>>> network connection issues, temporary outage of the NVD server or
>>> a similar situation, the function could exit with incomplete data
>>> in the database. This patch solves the issue by performing the update
>>> on a copy of the database. It replaces the main one only if the whole
>>> update was successful.
>>>
>>> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929
>>>
>>> Reported-by: Alberto Pianon <alberto@pianon.eu>
>>> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
>>> ---
>>>  .../recipes-core/meta/cve-update-db-native.bb | 81 +++++++++++++------
>>>  1 file changed, 56 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
>>> b/meta/recipes-core/meta/cve-update-db-native.bb
>>> index 642fda5395..89804b9e5c 100644
>>> --- a/meta/recipes-core/meta/cve-update-db-native.bb
>>> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>>> @@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>>>  # Timeout for blocking socket operations, such as the connection
>>> attempt.
>>>  CVE_SOCKET_TIMEOUT ?=3D "60"
>>>
>>> +CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
>>> +
>>>  python () {
>>>      if not bb.data.inherits_class("cve-check", d):
>>>          raise bb.parse.SkipRecipe("Skip recipe when cve-check class is
>>> not loaded.")
>>> @@ -32,19 +34,15 @@ python do_fetch() {
>>>      """
>>>      import bb.utils
>>>      import bb.progress
>>> -    import sqlite3, urllib, urllib.parse, gzip
>>> -    from datetime import date
>>> +    import shutil
>>>
>>>      bb.utils.export_proxies(d)
>>>
>>> -    YEAR_START =3D 2002
>>> -
>>>      db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>>>      db_dir =3D os.path.dirname(db_file)
>>> +    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
>>>
>>> -    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
>>> -
>>> -    cleanup_db_download(db_file)
>>> +    cleanup_db_download(db_file, db_tmp_file)
>>>
>>>      # The NVD database changes once a day, so no need to update more
>>> frequently
>>>      # Allow the user to force-update
>>> @@ -62,9 +60,55 @@ python do_fetch() {
>>>          pass
>>>
>>>      bb.utils.mkdirhier(db_dir)
>>> +    if os.path.exists(db_file):
>>> +        shutil.copy2(db_file, db_tmp_file)
>>> +
>>> +    if update_db_file(db_tmp_file, d) =3D=3D True:
>>> +        # Update downloaded correctly, can swap files
>>> +        shutil.move(db_tmp_file, db_file)
>>> +    else:
>>> +        # Update failed, do not modify the database
>>> +        bb.note("CVE database update failed")
>>> +        os.remove(db_tmp_file)
>>> +}
>>> +
>>> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
>>> +do_fetch[file-checksums] =3D ""
>>> +do_fetch[vardeps] =3D ""
>>> +
>>> +def cleanup_db_download(db_file, db_tmp_file):
>>> +    """
>>> +    Cleanup the download space from possible failed downloads
>>> +    """
>>> +    if os.path.exists("{0}-journal".format(db_file)):
>>> +        # If a journal is present the last update might have been
>>> interrupted. In that case,
>>> +        # just wipe any leftovers and force the DB to be recreated.
>>> +        os.remove("{0}-journal".format(db_file))
>>> +
>>> +        if os.path.exists(db_file):
>>> +            os.remove(db_file)
>>> +
>>> +    if os.path.exists("{0}-journal".format(db_tmp_file)):
>>> +        # If a journal is present the last update might have been
>>> interrupted. In that case,
>>> +        # just wipe any leftovers and force the DB to be recreated.
>>> +        os.remove("{0}-journal".format(db_tmp_file))
>>> +
>>> +    if os.path.exists(db_tmp_file):
>>> +        os.remove(db_tmp_file)
>>> +
>>>
>>
>> It seems to me that this function is a duplication of the old version
>> with an extra argument.
>> So I think that using the old function version and call it with the
>> proper argument does the same:
>>
>> cleanup_db_download(db_file)
>> cleanup_db_download(db_tmp_file)
>>
>>
> Hi Jose,
> Thanks for looking into that. The function is not a total duplicate: the
> difference is that
> the it always removes the db_tmp_file, not only if the journal file
> exists (Python code
> formatting!).
>

Don't see on the first time that the db_tmp_file is always removed, I need
new glasses :)


>
> I was hesitating on this part a bit, because with the old path could be
> taken only in some
> specific situations: at the code update and if you share the DL_DIR and
> some of the builds
> use the old code, some the new version. I think we should keep both for
> now for safety.
>

makes sense, thanks for your explanation.

Jose


>
> Kind regards,
> Marta
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006a7c6a05f158b8f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a href=3D"mailt=
o:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; escreveu no dia segund=
a, 2/01/2023 =C3=A0(s) 16:38:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 2, 2023 at =
2:14 PM Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=
=A0Marta,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" targe=
t=3D"_blank">rybczynska@gmail.com</a>&gt; escreveu no dia segunda, 2/01/202=
3 =C3=A0(s) 07:03:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">The database update has been done on the original file. In case of<br>
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
e=3D"background:none 0% 0% repeat scroll rgba(0,0,0,0)">the it</span> alway=
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
e, thanks for your explanation.<br><br>Jose<br>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div><br></div><div>Kind regards,</div><div>Marta<br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000006a7c6a05f158b8f5--

