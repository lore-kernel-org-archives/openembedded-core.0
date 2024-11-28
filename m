Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98110D6911C
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 15:58:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.98579.1732809523189471464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 07:58:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wvoMDq0M;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so8885295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 07:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732809521; x=1733414321; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfxfChU64tLKzK16Yu1/cfgxmYbQrn4lUILYzEwgL9Y=;
        b=wvoMDq0MwUCmlUjKqC77462tGiOUOdntX7YzwDvwQWzD8yWEQ9yEVgb8VBu/pS7sZd
         fMc1Q32XmbQOY6HCfpJ3q6lkq/5oPjwM9Dk0tIo9tA4lgth6p4YTloE3jlg1g0F4sYzZ
         hFLIR6KOEa95BppA9wGmeVx713ekTPX8lQwdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732809521; x=1733414321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfxfChU64tLKzK16Yu1/cfgxmYbQrn4lUILYzEwgL9Y=;
        b=a1qIIkNXcC3KLXZA6aULAkUbjvybUz+jGt32qO7+I4Q3vV+BkyAb76NzimYyw/zZGf
         FWEcf0DA5mlaA5ictIrYTxRzdOZhCQj3bpoxlhRpr7muRzifn4bQhMhm0FZtVcnGGm/y
         vrZFoYDO5JDT60M//tRoVWum4vkdLpVcg8ZthJ6tW5xn7gNlpP3A2ja5YFTYLi5Hji/R
         l/Ra5aTOdbTvi7oHTnAIUvh0KnDgp9maWieUygSUc8xRE3vmK7axBIGTKl1yoqzCfPYJ
         eXjwz31gfn3fubfEFRbyzoquwmYjEkNd5yn8E/2iwBp5k56NHV0aSMNZcbjsR/6yoqEl
         jIKA==
X-Forwarded-Encrypted: i=1; AJvYcCVKU6vgOrJ7izhZ4nUl2ga4jp96bZBuIJ80oSxw5DG2BXzcgX9f/OsGA/tB375EIvdZCxolz58N05YyhKTamthsrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyfYVnT0ieG+6nmIGwsic0kkj3hX3nM8c/dczQo3Yx33P0QDtXJ
	kO5QE40gNI2LebYonY3V20esNu3bUcUuD2uiiUyOFmfSHnh/57r85F8Ydrb+C9snIW1xI8q4Dgk
	nMEeI1/PrZsX5P1yThl5+UCiwjlVkzEVd6HXR2w==
X-Gm-Gg: ASbGnct3i6POq2QDJuVaih1Tgz/Gff9l9uHb3ocY4SsRRftUjYWwlkomimIs50xFgAP
	7pTGuxM8cCQcEKvDMO4mdu2eJYwdWphcXpw==
X-Google-Smtp-Source: AGHT+IG7KWOGnXCR9rEPzjwX+7DD/fMEcHhFq3uDu+WcXWIvnO7fKKAw2zStYBW/5TipDs6fl8aMV3ussSAxn+/4kW8=
X-Received: by 2002:a05:600c:3489:b0:434:a39b:5e44 with SMTP id
 5b1f17b1804b1-434a9dcff98mr77863125e9.17.1732809521371; Thu, 28 Nov 2024
 07:58:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730950520.git.steve@sakoman.com> <57de6545695ac11816d670959d9e63666de08e3d.1730950520.git.steve@sakoman.com>
 <CAB2nKc88-5F1mDe4G7ucA1W7u7rzQkCpuzwmA7Zmd2_n3qyqrA@mail.gmail.com> <CAMSfU+4GpAs1pDhxFcuS0Oa0WxATZG7shDvFKM8AZrmBOBsztQ@mail.gmail.com>
In-Reply-To: <CAMSfU+4GpAs1pDhxFcuS0Oa0WxATZG7shDvFKM8AZrmBOBsztQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Nov 2024 16:58:15 +0100
Message-ID: <CAMSfU+5d9Hi9PLp92T65rkgpifB-3euOuC=OZ97kGGOSueo6Ew@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 02/10] cve_check: Use a local copy of the
 database during builds
To: vincent.prince.fr@gmail.com
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc30670627fb27c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 15:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207993

--000000000000fc30670627fb27c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 26 nov. 2024 =C3=A0 14:18, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

>
>
> Le mar. 26 nov. 2024 =C3=A0 14:02, Vincent Prince via lists.openembedded.=
org <
> vincent.prince.fr=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
>
>> Hello,
>>
>> I'm wondering if I'm the only one who couldn't complete do_fetch of
>> cve-update-nvd2-native with maximum retries on CVE API?
>> I tried with or without API Key, from several different machines, I
>> also tried to increase retries number etc, without success.
>>
>
> I did a successful full download with a crazy retry number (100). It took
> a long time but it finished eventually.
>
> You can monitor the progress with
>   bitbake cve-update-nvd2-native -c fetch -v
>
>
>
>> I see on the NVD status page the following warning :
>> "Due to changes described below, a large number of CVE records have
>> recently been updated, resulting in a large increase in API requests.
>> We are aware of the issue and are working to mitigate it. Thank you
>> for your patience."
>>
>
> Thanks for the update, I did not think of checking the website -_-'
>
>
>> I see the Buildroot switched from NVD to alternative FKIE github
>> database due to that API 2.0 inconsistency :/
>>
>
> https://github.com/fkie-cad/nvd-json-data-feeds
>
> If the situation at NVD does not change we might have to also switch
>
> I'm not sure what are my options here, quite odd that cybersecurity
>> organisation get impacted by DDoS :D
>>
>
This is now tracked in the bugzilla :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15660


> Best regards,
>> Vincent
>>
>> Le jeu. 7 nov. 2024 =C3=A0 04:38, Steve Sakoman via lists.openembedded.o=
rg
>> <steve=3Dsakoman.com@lists.openembedded.org> a =C3=A9crit :
>> >
>> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > Rtaher than trying to use a sqlite database over NFS from DL_DIR, work
>> from
>> > a local copy in STAGING DIR after fetching.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (cherry picked from commit 03596904392d257572a905a182b92c780d636744)
>> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> > ---
>> >  meta/classes/cve-check.bbclass                 |  7 ++++---
>> >  .../meta/cve-update-nvd2-native.bb             | 18 +++++++++++++----=
-
>> >  2 files changed, 17 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/meta/classes/cve-check.bbclass
>> b/meta/classes/cve-check.bbclass
>> > index d287cf1457..ed219bf472 100644
>> > --- a/meta/classes/cve-check.bbclass
>> > +++ b/meta/classes/cve-check.bbclass
>> > @@ -31,8 +31,9 @@
>> >  CVE_PRODUCT ??=3D "${BPN}"
>> >  CVE_VERSION ??=3D "${PV}"
>> >
>> > -CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
>> > -CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2-2.db"
>> > +CVE_CHECK_DB_FILENAME ?=3D "nvdcve_2-2.db"
>> > +CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
>> > +CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
>> >  CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
>> >
>> >  CVE_CHECK_LOG ?=3D "${T}/cve.log"
>> > @@ -198,7 +199,7 @@ python do_cve_check () {
>> >  }
>> >
>> >  addtask cve_check before do_build
>> > -do_cve_check[depends] =3D "cve-update-nvd2-native:do_fetch"
>> > +do_cve_check[depends] =3D "cve-update-nvd2-native:do_unpack"
>> >  do_cve_check[nostamp] =3D "1"
>> >
>> >  python cve_check_cleanup () {
>> > diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > index 92177712dc..5fbe9095cc 100644
>> > --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>> > @@ -8,7 +8,6 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>> >
>> >  inherit native
>> >
>> > -deltask do_unpack
>> >  deltask do_patch
>> >  deltask do_configure
>> >  deltask do_compile
>> > @@ -35,7 +34,9 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
>> >  # Number of attempts for each http query to nvd server before giving =
up
>> >  CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
>> >
>> > -CVE_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
>> > +CVE_CHECK_DB_DLDIR_FILE ?=3D
>> "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
>> > +CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
>> > +CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
>> >
>> >  python () {
>> >      if not bb.data.inherits_class("cve-check", d):
>> > @@ -52,9 +53,9 @@ python do_fetch() {
>> >
>> >      bb.utils.export_proxies(d)
>> >
>> > -    db_file =3D d.getVar("CVE_CHECK_DB_FILE")
>> > +    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
>> >      db_dir =3D os.path.dirname(db_file)
>> > -    db_tmp_file =3D d.getVar("CVE_DB_TEMP_FILE")
>> > +    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
>> >
>> >      cleanup_db_download(db_file, db_tmp_file)
>> >      # By default let's update the whole database (since time 0)
>> > @@ -77,6 +78,7 @@ python do_fetch() {
>> >          pass
>> >
>> >      bb.utils.mkdirhier(db_dir)
>> > +    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
>> >      if os.path.exists(db_file):
>> >          shutil.copy2(db_file, db_tmp_file)
>> >
>> > @@ -89,10 +91,16 @@ python do_fetch() {
>> >          os.remove(db_tmp_file)
>> >  }
>> >
>> > -do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
>> > +do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
>> >  do_fetch[file-checksums] =3D ""
>> >  do_fetch[vardeps] =3D ""
>> >
>> > +python do_unpack() {
>> > +    import shutil
>> > +    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"),
>> d.getVar("CVE_CHECK_DB_FILE"))
>> > +}
>> > +do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}
>> ${CVE_CHECK_DB_FILE_LOCK}"
>> > +
>> >  def cleanup_db_download(db_file, db_tmp_file):
>> >      """
>> >      Cleanup the download space from possible failed downloads
>> > --
>> > 2.34.1
>> >
>> >
>> >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#207851):
>> https://lists.openembedded.org/g/openembedded-core/message/207851
>> Mute This Topic: https://lists.openembedded.org/mt/109438548/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS - Tech expert
>


--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000fc30670627fb27c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 26 nov. 2024 =C3=A0=C2=
=A014:18, Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.c=
ongal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ma=
r. 26 nov. 2024 =C3=A0=C2=A014:02, Vincent Prince via <a href=3D"http://lis=
ts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;<a hr=
ef=3D"http://vincent.prince.fr" target=3D"_blank">vincent.prince.fr</a>=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
I&#39;m wondering if I&#39;m the only one who couldn&#39;t complete do_fetc=
h of<br>
cve-update-nvd2-native with maximum retries on CVE API?<br>
I tried with or without API Key, from several different machines, I<br>
also tried to increase retries number etc, without success.<br></blockquote=
><div><br></div><div>I did a successful full download with a crazy retry nu=
mber (100). It took a long time but it finished eventually.</div><div><br><=
/div><div>You can monitor the progress with</div><div>=C2=A0 bitbake cve-up=
date-nvd2-native -c fetch -v</div><div><br></div><div>=C2=A0<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
I see on the NVD status page the following warning :<br>
&quot;Due to changes described below, a large number of CVE records have<br=
>
recently been updated, resulting in a large increase in API requests.<br>
We are aware of the issue and are working to mitigate it. Thank you<br>
for your patience.&quot;<br></blockquote><div><br></div><div>Thanks for the=
 update, I did not think of checking the website -_-&#39;<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I see the Buildroot switched from NVD to alternative FKIE github<br>
database due to that API 2.0 inconsistency :/<br></blockquote><div>=C2=A0</=
div><div><a href=3D"https://github.com/fkie-cad/nvd-json-data-feeds" target=
=3D"_blank">https://github.com/fkie-cad/nvd-json-data-feeds</a></div><div><=
br></div><div>If the situation at NVD does not change we might have to also=
 switch<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
I&#39;m not sure what are my options here, quite odd that cybersecurity<br>
organisation get impacted by DDoS :D<br></blockquote></div></div></blockquo=
te><div><br></div><div>This is now tracked in the bugzilla : <a href=3D"htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15660">https://bugzilla.yo=
ctoproject.org/show_bug.cgi?id=3D15660</a></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Vincent<br>
<br>
Le jeu. 7 nov. 2024 =C3=A0 04:38, Steve Sakoman via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&lt;steve=3D<a href=3D"mailto:sakoman.com@lists.openembedded.org" target=3D=
"_blank">sakoman.com@lists.openembedded.org</a>&gt; a =C3=A9crit :<br>
&gt;<br>
&gt; From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;<br>
&gt; Rtaher than trying to use a sqlite database over NFS from DL_DIR, work=
 from<br>
&gt; a local copy in STAGING DIR after fetching.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 03596904392d257572a905a182b92c780d636744)<b=
r>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++++---<br>
&gt;=C2=A0 .../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"nor=
eferrer" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++++++-----<br>
&gt;=C2=A0 2 files changed, 17 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index d287cf1457..ed219bf472 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -31,8 +31,9 @@<br>
&gt;=C2=A0 CVE_PRODUCT ??=3D &quot;${BPN}&quot;<br>
&gt;=C2=A0 CVE_VERSION ??=3D &quot;${PV}&quot;<br>
&gt;<br>
&gt; -CVE_CHECK_DB_DIR ?=3D &quot;${DL_DIR}/CVE_CHECK&quot;<br>
&gt; -CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/nvdcve_2-2.db&quot;<=
br>
&gt; +CVE_CHECK_DB_FILENAME ?=3D &quot;nvdcve_2-2.db&quot;<br>
&gt; +CVE_CHECK_DB_DIR ?=3D &quot;${STAGING_DIR}/CVE_CHECK&quot;<br>
&gt; +CVE_CHECK_DB_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILEN=
AME}&quot;<br>
&gt;=C2=A0 CVE_CHECK_DB_FILE_LOCK ?=3D &quot;${CVE_CHECK_DB_FILE}.lock&quot=
;<br>
&gt;<br>
&gt;=C2=A0 CVE_CHECK_LOG ?=3D &quot;${T}/cve.log&quot;<br>
&gt; @@ -198,7 +199,7 @@ python do_cve_check () {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 addtask cve_check before do_build<br>
&gt; -do_cve_check[depends] =3D &quot;cve-update-nvd2-native:do_fetch&quot;=
<br>
&gt; +do_cve_check[depends] =3D &quot;cve-update-nvd2-native:do_unpack&quot=
;<br>
&gt;=C2=A0 do_cve_check[nostamp] =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 python cve_check_cleanup () {<br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-=
native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</=
a> b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" re=
l=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; index 92177712dc..5fbe9095cc 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
&gt; @@ -8,7 +8,6 @@ INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit native<br>
&gt;<br>
&gt; -deltask do_unpack<br>
&gt;=C2=A0 deltask do_patch<br>
&gt;=C2=A0 deltask do_configure<br>
&gt;=C2=A0 deltask do_compile<br>
&gt; @@ -35,7 +34,9 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?=3D &quot;10368000&quo=
t;<br>
&gt;=C2=A0 # Number of attempts for each http query to nvd server before gi=
ving up<br>
&gt;=C2=A0 CVE_DB_UPDATE_ATTEMPTS ?=3D &quot;5&quot;<br>
&gt;<br>
&gt; -CVE_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db&quot=
;<br>
&gt; +CVE_CHECK_DB_DLDIR_FILE ?=3D &quot;${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB=
_FILENAME}&quot;<br>
&gt; +CVE_CHECK_DB_DLDIR_LOCK ?=3D &quot;${CVE_CHECK_DB_DLDIR_FILE}.lock&qu=
ot;<br>
&gt; +CVE_CHECK_DB_TEMP_FILE ?=3D &quot;${CVE_CHECK_DB_FILE}.tmp&quot;<br>
&gt;<br>
&gt;=C2=A0 python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not bb.data.inherits_class(&quot;cve-check&quot=
;, d):<br>
&gt; @@ -52,9 +53,9 @@ python do_fetch() {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.utils.export_proxies(d)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 db_file =3D d.getVar(&quot;CVE_CHECK_DB_FILE&quot;)<br>
&gt; +=C2=A0 =C2=A0 db_file =3D d.getVar(&quot;CVE_CHECK_DB_DLDIR_FILE&quot=
;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 db_dir =3D os.path.dirname(db_file)<br>
&gt; -=C2=A0 =C2=A0 db_tmp_file =3D d.getVar(&quot;CVE_DB_TEMP_FILE&quot;)<=
br>
&gt; +=C2=A0 =C2=A0 db_tmp_file =3D d.getVar(&quot;CVE_CHECK_DB_TEMP_FILE&q=
uot;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cleanup_db_download(db_file, db_tmp_file)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # By default let&#39;s update the whole database (=
since time 0)<br>
&gt; @@ -77,6 +78,7 @@ python do_fetch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(db_dir)<br>
&gt; +=C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(db_tmp_file))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy2(db_file, db_tmp_file)<b=
r>
&gt;<br>
&gt; @@ -89,10 +91,16 @@ python do_fetch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_tmp_file)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_FILE_LOCK}&quot;<br>
&gt; +do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_DLDIR_LOCK}&quot;<br>
&gt;=C2=A0 do_fetch[file-checksums] =3D &quot;&quot;<br>
&gt;=C2=A0 do_fetch[vardeps] =3D &quot;&quot;<br>
&gt;<br>
&gt; +python do_unpack() {<br>
&gt; +=C2=A0 =C2=A0 import shutil<br>
&gt; +=C2=A0 =C2=A0 shutil.copyfile(d.getVar(&quot;CVE_CHECK_DB_DLDIR_FILE&=
quot;), d.getVar(&quot;CVE_CHECK_DB_FILE&quot;))<br>
&gt; +}<br>
&gt; +do_unpack[lockfiles] +=3D &quot;${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHEC=
K_DB_FILE_LOCK}&quot;<br>
&gt; +<br>
&gt;=C2=A0 def cleanup_db_download(db_file, db_tmp_file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Cleanup the download space from possible failed do=
wnloads<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207851): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207851" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207851</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109438548/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109438548/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000fc30670627fb27c0--

