Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B4AC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 12:14:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.10900.1710418469076865091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 05:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMwuZ4Op;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dca3951ad9so6436475ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710418468; x=1711023268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=luPHQ8Rb1VyTNGNvDHKg+jnRed4OAxgZu/HSP9DCyZA=;
        b=cMwuZ4Op/+OeB5SbZmOqZx/8E1Y44Hlf9265bvQvAgLh9qiydzuOlFTwS5AwNfdWU1
         ukjfKpeQjhBypIceflDdcNGaRVCzYCbydtMy03/4oF2ohgAd6+r1XFTe6SAmddcXjJOS
         Li1HKqDYSz/Ic19h/QMa/Io9vJvXXqCi5L6RyPUyWTMuqcr/iGx+RYEa2l3JWY7+6Dla
         XKSPp0vveNjhrdp6oaIn3A3yGmmeVIz/vZBBWMPR+YEAEkEn/geZXBp31H8mqSGkOtCs
         n4OTrQN060HrZa/Bacul2LYxuy5vW34AtGHELQNG1o07DD20na18fRp0YQR7dt0g74hN
         BmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710418468; x=1711023268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luPHQ8Rb1VyTNGNvDHKg+jnRed4OAxgZu/HSP9DCyZA=;
        b=vONbb0ihNBkCQeNoqLTjyDOEz2l3uC0b5ehORvl3x5WZdGntpqbdQ89RHXw6qQxEv8
         pKjsDGnd0TYGGdTTIzf7jNo134t3RbUZbJN9xe56VRuQ2hcmqCx91R5pwKlsT7B8uil/
         6FER4B+LzGktWHQa98oLTfIdJOpGaVXs5bqCW8hgh/eW0ta2Wx+CQ3EziVnFu2WQL+R7
         UOFgksTVxFUKjCrQhKnXbMyu+jjyJZWW3yiHRNE7RcXD++h+lmph+s3W7OVHnuKHlYBN
         kn7yoTIBHs8ZzTd0hMw5WusfSCWBBnglK8XRqAqmRFU0ilATwB6n8PPpuj8L8IW2NF8t
         9BXg==
X-Gm-Message-State: AOJu0YzbLbLl2NpbKxW08VUJdHlIVR4JMuqcXXU1dbc9agr4A6lTrr2j
	s3aharWvh6xqJJtgstkXGwfYonI/q/RYOLr30jqKM9FoGHWEcpnyMWHoIV49GflNqSqDox/kupg
	/WopRMqgMim/IazGggJC0KfnJlpo=
X-Google-Smtp-Source: AGHT+IEg0JhjigQjGrOaG3xLjDniPpOD3T00mwTtud6/oe0Jp5+ZDL6i5NRdwIPTXp/vW4j+GpUq22pKppV4PEsAl+c=
X-Received: by 2002:a17:902:694c:b0:1dd:7163:b58e with SMTP id
 k12-20020a170902694c00b001dd7163b58emr1416153plt.41.1710418468283; Thu, 14
 Mar 2024 05:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240313151327.2123368-1-yoann.congal@smile.fr> <20240313151327.2123368-2-yoann.congal@smile.fr>
In-Reply-To: <20240313151327.2123368-2-yoann.congal@smile.fr>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 14 Mar 2024 13:14:12 +0100
Message-ID: <CAApg2=S9Gqg24bqwVgrGbCEBMa+h1ek2kq2nYJzLDA7JX0+89A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cve-update-nvd2-native: Add an age
 threshold for incremental update
To: Yoann Congal <yoann.congal@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003833a006139dd5e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 12:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197104

--0000000000003833a006139dd5e2
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Mar 2024, 16:15 Yoann Congal, <yoann.congal@smile.fr> wrote:

> Add a new variable "CVE_DB_INCR_UPDATE_AGE_THRES", which can be used to
> specify the maximum age of the database for doing an incremental update
> For older databases, a full re-download is done.
>
> With a value of "0", this forces a full-redownload.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  .../meta/cve-update-nvd2-native.bb            | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index f21c139aa5..d565887498 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -26,6 +26,12 @@ NVDCVE_API_KEY ?= ""
>  # Use a negative value to skip the update
>  CVE_DB_UPDATE_INTERVAL ?= "86400"
>
> +# CVE database incremental update age threshold, in seconds. If the
> database is
> +# older than this threshold, do a full re-download, else, do an
> incremental
> +# update. By default: the maximum allowed value from NVD: 120 days
> (120*24*60*60)
> +# Use 0 to force a full download.
> +CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
> +
>  # Number of attempts for each http query to nvd server before giving up
>  CVE_DB_UPDATE_ATTEMPTS ?= "5"
>
> @@ -172,18 +178,24 @@ def update_db_file(db_tmp_file, d, database_time):
>
>      req_args = {'startIndex' : 0}
>
> -    # The maximum range for time is 120 days
> -    # Force a complete update if our range is longer
> -    if (database_time != 0):
> +    incr_update_threshold = int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRES"))
> +    if database_time != 0:
>          database_date = datetime.datetime.fromtimestamp(database_time,
> tz=datetime.timezone.utc)
>          today_date = datetime.datetime.now(tz=datetime.timezone.utc)
>          delta = today_date - database_date
> -        if delta.days < 120:
> +        if incr_update_threshold == 0:
> +            bb.note("CVE database: forced full update")
> +        elif delta < datetime.timedelta(seconds=incr_update_threshold):
>              bb.note("CVE database: performing partial update")
> +            # The maximum range for time is 120 days
> +            if delta > datetime.timedelta(days=120):
> +                bb.error("CVE database: Trying to do an incremental
> update on a larger than supported range")
>              req_args['lastModStartDate'] = database_date.isoformat()
>              req_args['lastModEndDate'] = today_date.isoformat()
>          else:
>              bb.note("CVE database: file too old, forcing a full update")
> +    else:
> +        bb.note("CVE database: no preexisting database, do a full
> download")
>
>      with bb.progress.ProgressHandler(d) as ph,
> open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
>
> --
>

I find naming of the variable misleading, sourcing like FORCE_FULL_DOWNLOAD
would be more obvious. Also, I'm not sure we need a variable if the user
can just delete the database file and force the download this way. The 120
days case is special, because its a limit set in the spec.

Regards,
Marta

>

--0000000000003833a006139dd5e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 13 Mar 2024, 16:15 Yoann Congal, &lt;<a href=
=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Add a new variable &quot;CVE_DB_INCR_UP=
DATE_AGE_THRES&quot;, which can be used to<br>
specify the maximum age of the database for doing an incremental update<br>
For older databases, a full re-download is done.<br>
<br>
With a value of &quot;0&quot;, this forces a full-redownload.<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
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
--<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">I find naming of the variable misleading, sourcing like FORCE_FULL_DOWNLO=
AD would be more obvious. Also, I&#39;m not sure we need a variable if the =
user can just delete the database file and force the download this way. The=
 120 days case is special, because its a limit set in the spec.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Mar=
ta</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
</blockquote></div></div></div>

--0000000000003833a006139dd5e2--

