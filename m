Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F6AC3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 16:38:25 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.40176.1672677501960270710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 08:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EdqcLPD6;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id v23so19320195ljj.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 08:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NavVeOBTQ7JL4/2sPeip1KLxehd4YXXPfVfiiZ+ZBDA=;
        b=EdqcLPD698GRKjzrcz0pgZgN6She9D9NClluTXZLtglO1HvnQvPs7CMCAYq+h+ETn7
         MQwJsSiaHOI1KoW5XnpcapvHeTX6rVTSvjgH6xwjQ8UEq29EZ7i3cV6xAEG3c1IlGOqb
         I4fVnOCnkHpULm2Xoxz9iCTB/69J6lIZWxItR3esE2jRseKgwwbVhg4U99En/oV50zMb
         lc8w4AgzG9Xe1JMX7NPZ01lxTNqve87bzMRe/mMI1blXtNC5uVTUzqcJshEaqycnxtoS
         vb1uZUJ/zgW6E4T6Tvrl0CrBh/NtZlURXea9cG2bVx5BRVvTq41GEOO/f4LlG71bPXIG
         mUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NavVeOBTQ7JL4/2sPeip1KLxehd4YXXPfVfiiZ+ZBDA=;
        b=5igqqDfimB/cdiN35N/aWEFb8kcFm5Ya8+eMZ1nDT5ldu/v1tBjp41nO54FgnkisaS
         9JYIlLJXSaG42D9OMhv/U9si0hy/E8KyZZZbvBMCP0ZQO2ENSyGCzx7gCAYt9vz9w0R6
         GGDHWMKbenpRNFYGsdfQ37S8vlQzrLsrlDFLKfxpuDzNuOYAVz0WRugvqjZLKpMZi3zP
         uuEwnp9G3CYeIS7lAuzZYlGF7moIH0rU70W4HBGcgG/pkDNE1LpIgrFPiXQm3Fq0p/qm
         db7ZA/jizYAOxK7RMANyXXz8N2Mg0moxoXBTnDdHYaYckzmv/Eb0pjtYYvVmuSms6peI
         h1Ig==
X-Gm-Message-State: AFqh2kreB5jdzlrklCZFLRzCPmMfTbQ7e/a9fyM+PpkyQ3RdgkaIcTIU
	f4vCDB7kqYAI2H+KB0gloRnZBhH0x1bKuovj6vo=
X-Google-Smtp-Source: AMrXdXs5pXDXdkd/fQjaVE8lK5rO3s++7+UibWnAMKRFBt6B17mZF3ZocGL7knu6lIAiJrylBv4BJGbAGCZkr5UoXxA=
X-Received: by 2002:a05:651c:220d:b0:27f:d80a:b7c1 with SMTP id
 y13-20020a05651c220d00b0027fd80ab7c1mr960219ljq.87.1672677500101; Mon, 02 Jan
 2023 08:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com> <20230102070327.55373-2-rybczynska@gmail.com>
 <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
In-Reply-To: <CANPvuRkzZFCYEFXpECrf3d1ea3tcCajMdQmz0r=x7-PyBgXNCA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 2 Jan 2023 17:38:08 +0100
Message-ID: <CAApg2=RLRmbnMzYR6O+L=ob7Jp1d1uDXVrGo1Se9dEMzPq=QTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-db-native: avoid partial updates
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alberto Pianon <alberto@pianon.eu>, Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000037a89605f14a9458"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 16:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175322

--00000000000037a89605f14a9458
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 2, 2023 at 2:14 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Hi Marta,
>
> Marta Rybczynska <rybczynska@gmail.com> escreveu no dia segunda,
> 2/01/2023 =C3=A0(s) 07:03:
>
>> The database update has been done on the original file. In case of
>> network connection issues, temporary outage of the NVD server or
>> a similar situation, the function could exit with incomplete data
>> in the database. This patch solves the issue by performing the update
>> on a copy of the database. It replaces the main one only if the whole
>> update was successful.
>>
>> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14929
>>
>> Reported-by: Alberto Pianon <alberto@pianon.eu>
>> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
>> ---
>>  .../recipes-core/meta/cve-update-db-native.bb | 81 +++++++++++++------
>>  1 file changed, 56 insertions(+), 25 deletions(-)
>>
>> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
>> b/meta/recipes-core/meta/cve-update-db-native.bb
>> index 642fda5395..89804b9e5c 100644
>> --- a/meta/recipes-core/meta/cve-update-db-native.bb
>> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>> @@ -21,6 +21,8 @@ CVE_DB_UPDATE_INTERVAL ?=3D "86400"
>>  # Timeout for blocking socket operations, such as the connection attemp=
t.
>>  CVE_SOCKET_TIMEOUT ?=3D "60"
>>
>> +CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_1.1.db"
>> +
>>  python () {
>>      if not bb.data.inherits_class("cve-check", d):
>>          raise bb.parse.SkipRecipe("Skip recipe when cve-check class is
>> not loaded.")
>> @@ -32,19 +34,15 @@ python do_fetch() {
>>      """
>>      import bb.utils
>>      import bb.progress
>> -    import sqlite3, urllib, urllib.parse, gzip
>> -    from datetime import date
>> +    import shutil
>>
>>      bb.utils.export_proxies(d)
>>
>> -    YEAR_START =3D 2002
>> -
>>      db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>>      db_dir =3D os.path.dirname(db_file)
>> +    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
>>
>> -    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
>> -
>> -    cleanup_db_download(db_file)
>> +    cleanup_db_download(db_file, db_tmp_file)
>>
>>      # The NVD database changes once a day, so no need to update more
>> frequently
>>      # Allow the user to force-update
>> @@ -62,9 +60,55 @@ python do_fetch() {
>>          pass
>>
>>      bb.utils.mkdirhier(db_dir)
>> +    if os.path.exists(db_file):
>> +        shutil.copy2(db_file, db_tmp_file)
>> +
>> +    if update_db_file(db_tmp_file, d) =3D=3D True:
>> +        # Update downloaded correctly, can swap files
>> +        shutil.move(db_tmp_file, db_file)
>> +    else:
>> +        # Update failed, do not modify the database
>> +        bb.note("CVE database update failed")
>> +        os.remove(db_tmp_file)
>> +}
>> +
>> +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
>> +do_fetch[file-checksums] =3D ""
>> +do_fetch[vardeps] =3D ""
>> +
>> +def cleanup_db_download(db_file, db_tmp_file):
>> +    """
>> +    Cleanup the download space from possible failed downloads
>> +    """
>> +    if os.path.exists("{0}-journal".format(db_file)):
>> +        # If a journal is present the last update might have been
>> interrupted. In that case,
>> +        # just wipe any leftovers and force the DB to be recreated.
>> +        os.remove("{0}-journal".format(db_file))
>> +
>> +        if os.path.exists(db_file):
>> +            os.remove(db_file)
>> +
>> +    if os.path.exists("{0}-journal".format(db_tmp_file)):
>> +        # If a journal is present the last update might have been
>> interrupted. In that case,
>> +        # just wipe any leftovers and force the DB to be recreated.
>> +        os.remove("{0}-journal".format(db_tmp_file))
>> +
>> +    if os.path.exists(db_tmp_file):
>> +        os.remove(db_tmp_file)
>> +
>>
>
> It seems to me that this function is a duplication of the old version wit=
h
> an extra argument.
> So I think that using the old function version and call it with the prope=
r
> argument does the same:
>
> cleanup_db_download(db_file)
> cleanup_db_download(db_tmp_file)
>
>
Hi Jose,
Thanks for looking into that. The function is not a total duplicate: the
difference is that
the it always removes the db_tmp_file, not only if the journal file exists
(Python code
formatting!).

I was hesitating on this part a bit, because with the old path could be
taken only in some
specific situations: at the code update and if you share the DL_DIR and
some of the builds
use the old code, some the new version. I think we should keep both for now
for safety.

Kind regards,
Marta

--00000000000037a89605f14a9458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 2, 2023 at 2:14 PM Jose Q=
uaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jose@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Marta,</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Marta Rybczynska &lt;<a =
href=3D"mailto:rybczynska@gmail.com" target=3D"_blank">rybczynska@gmail.com=
</a>&gt; escreveu no dia segunda, 2/01/2023 =C3=A0(s) 07:03:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The database update has been d=
one on the original file. In case of<br>
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
ction is not a total duplicate: the difference is that</div><div><span clas=
s=3D"ng" style=3D"background:rgba(0,0,0,0) none repeat scroll 0% 0%!importa=
nt">the it</span> always removes the db_tmp_file, not only if the journal f=
ile exists (Python code</div><div>formatting!).<br></div><div><br></div><di=
v>I was hesitating on this part a bit, because with the old path could be t=
aken only in some</div><div>specific situations: at the code update and if =
you share the DL_DIR and some of the builds</div><div>use the old code, som=
e the new version. I think we should keep both for now for safety.=C2=A0</d=
iv><div><br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--00000000000037a89605f14a9458--

