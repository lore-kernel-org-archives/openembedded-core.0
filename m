Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C008B107527D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 08:59:14 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6597.1773910751857890668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 01:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAVnWrJJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-128d2e3074fso487780c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 01:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773910751; cv=none;
        d=google.com; s=arc-20240605;
        b=RTKMO0xQVQes/Mt3O49RsNNfubbhxkgHmeo41EBNh6h7kHHxBduPM8XN+hhhB8lDV7
         2CYhzdnG/GxmRelabtxY1mx7A+9WdX8IKE9OWo41u3JfmldINZZVU7+Ahrx0R8UFo+2H
         4VXN8SvbkFr45h87QSIcAlXUR//NLkyQb2e8wblSKoWR/q6OHOuUMSLTodW8iXFRJfTt
         BrtowWQ3xYP7aWn9m6VcJx7/779bsF0px1VowDDuAieT366T4rQWdJ+WH6BZygOAbd9r
         C/cgqUwBpm7FA3t+kNMcvApW9Vm0itiMHiFgV/DaMQahY/3jPpwLfQeaQw4P48ksZT19
         fg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ubYAjllEBi4W1td3Qskt7qPQo1mNaskf4ouqDdHXU4=;
        fh=F+nh2zYzudNrvOrh6A1fjaNQepBSkLq90mZ/3+sEMY0=;
        b=kSd+h2QkQOtrWl8BxeXg/YiIua21FJQCAIUO0nkRYQpYn8lC2GO2iYc7CkYHUUmMYZ
         /WfkCWUw1W5S+M1W04IFPkV/i62Aoa62i5tf3h03ytlhdpL9x6RnYj3nOBXTMM5mIg01
         S6hxUGDg9287RoSwY1o1W0oC4JB0ccNTm5d8HcrWkYCA1/6UruLwKmxt0SMXpf0DJLB2
         320L+NSAioiXvw+f8Ymf5k0Eoep4+DAKh1JxD9NrYv3IDKewj6hppB78XaRuzu4HqU40
         8okFPmAZ0A0HhBw1AUuWr9YSJO3Mlq62rKxAOtw5LAcHvhtlGICAHSt1Um1KLRNtZryE
         iKIQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773910751; x=1774515551; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ubYAjllEBi4W1td3Qskt7qPQo1mNaskf4ouqDdHXU4=;
        b=XAVnWrJJf6Md7PrglsQRloM45xkkm8kiidYNP8N49Y62ivcReooN81Zuch98u9KFGI
         ny8EYfgXt224sl8wrPgeO+pfS30V+A9R6aCBgcIHNUSiY1CQCo4iGm6F84MMOvtCefee
         J6MVlANAOUixUCFA35bQotX1py8t2UxLy03WrGqVIN7GrvqzBYEWqVOFyfovtz1bfBPf
         NHq1Dip9rqDj//gfP34X5Mr7YaoPtsQHM6yxjou56/vkrwF9Rb4v+OpdHr/Ln6niZArd
         gpGIpa4+JbCnWuAptg3HXiHKjY7A59Qh8qLvF3OM9tCeIigeEIefEjZnZn7pDieiIWHQ
         VRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910751; x=1774515551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ubYAjllEBi4W1td3Qskt7qPQo1mNaskf4ouqDdHXU4=;
        b=J2Ybkbqtarbsr5FgcLtdVvlijUrwwod0nsJuAIDZn0nJLZwl414F04eBejf1x7r6IB
         /rP7fInjsOdhfRy/JS8IsFukTEK+6PvRtlM1iuwzAbRVkgylc3i9iaS/ciWFC/Ycs/O+
         +fnV8nuhpaasyRhG7aNk/P0qT3rupR2Y5va0fbWR0NmIoIwDQxiry5289IIfAHvwnFzo
         6AYRgoFpih0rNIBacgAZxnHrnkCzKE1T65N00SaYubbjkMzsa5Btsv8VKFJLcWBcK0Y5
         yekwxqNPhmLXACImsktHmUCaZuIXuESygrzyG8SZML2HuZjrP+Eg+ifkN8quNCJ6prv4
         ir6A==
X-Gm-Message-State: AOJu0Yx0r70PX/rLGsyrDMfGbGapNYgx0KHXl/eMdt8lTaBrcSuabY1Z
	lQVfqbQS/H3CI00DPctqvQmASeWbsWT+QWaFqZViQDPF+Azeqq46sTibZIZgmlZ6Lf/RlX3R3Lg
	nJ+qGozw/Dyf3bYZravIgDpyFjV6t25Y=
X-Gm-Gg: ATEYQzwtPV7x8LfvaQwY65r5sUidsB19rE2SSWWCXrJnKx1TRztyvWXefWfgi36ok9d
	qOVC8OaygqyyS4jtlpXSSnh7vKgww966z1FdmjMOHa3aMrho4lm2JcA6gDIQxwGGNKT2OTvyjij
	0q5M1s8FP1caLrx7v3ly4GZzx4MA9x83KQ7mwjmcIKieI7jqjDk+xEJljchHtiNdmGJVRH63+4a
	k0EJM92DZUp8QG2Fs07a0AHagPUgwObQT2KsLUPUVMtvjLv9tr3mNUuLg+YaHX93L4FxNmxopCn
	f5uYVk3TFxlS5Q9nqATISG2kjWuAexukmoGSrv3j
X-Received: by 2002:a05:7022:7a7:b0:128:d786:8ac8 with SMTP id
 a92af1059eb24-1299b9d05cdmr3257700c88.0.1773910751037; Thu, 19 Mar 2026
 01:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org> <8711656.T7Z3S40VBb@brobin-bootlin>
In-Reply-To: <8711656.T7Z3S40VBb@brobin-bootlin>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Mar 2026 09:58:58 +0100
X-Gm-Features: AaiRm52-xYqC_wbM9CiaEKE2E68FckWOvWYkw-gOaS7t-xOpOgwwRd6JXSBWORI
Message-ID: <CAApg2=SHFU13o9EwuAe+NepU1CqEy2zO-xnBYoSmn2YaktXfxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using
 BitBake fetcher
To: benjamin.robin@bootlin.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com, 
	peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
	antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000002dcc77064d5cc89a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 08:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233469

--0000000000002dcc77064d5cc89a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 9:45=E2=80=AFAM Benjamin Robin via lists.openembedd=
ed.org
<benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello Richard,
>
> On Wednesday, March 18, 2026 at 6:45=E2=80=AFPM, Richard Purdie wrote:
> > I've just been trying to work out where we're at with this coming up to
> > release and we need to get this resolved.
> >
> > I feel quite strongly that we need to use the fetcher for obtaining
> > this data. "fetching" isn't trivial and is full of
> > license/auditing/sbom issues. Making any exception to that, even for
> > cve data tends to become problematic later.
>
> I have just a slight implementation "detail" if we are using BitBake
> fetcher. What is the license that we should use for the sources?
> How to declare that in the recipes?
>
> Because the license of the repositories:
>  - https://github.com/CVEProject/cvelistV5 : Their is none
>  - https://github.com/fkie-cad/nvd-json-data-feeds/tree/main/LICENSES
>    It looks like custom license.
>

The CVE project repo does not have a licence included, but it is covered by
https://www.cve.org/legal/termsofuse (the usage part). It is basically MIT.

NVD has the specific,  licence, the one that is in the repo. A warning on
the
needed disclosure sentence in all documentation.

>
> cve-update-db-native.bb is specifying MIT but this is kind of a lie.
> I have done the same on my recipes for now...
>
> > The existing approach was only done as it was a sqlite database and we
> > didn't have fetcher support for such a thing.
>
> The recipes used to download the CVE databases for the cve-check class
> are downloading tarballs. Yes these recipes are going to create a sqlite
> database from that. But these recipes implements there own fetcher to
> simply download a tarball.
> That is why I thought I could implement my own fetcher, which is way
> simpler than the update_db_file() in cve-update-db-native.bb which is
> quite complex.
>

They implement the fetcher to feed into sqlite. Which was an error to use,
in my opinion.


>
> > If we need to improve the
> > git fetcher in some way to better support this use case (e.g. shallow
> > clone update efficiency), that is something we can work on.
>
> Well that was my plan, but for the LTS release this was going to be too
> short. So in the meantime I preferred to used a custom fetcher which
> was implemented in the other RFC (or in the v4 of the original series).
>
> > As such, I was wondering if you had never versions of these patches?
>
> I sent 2 RFCs, one using my own fetcher, and one using the internal
> fetcher (this series). And I sent a v4 of the original series.
>
> > I'd note that we can't set AUTOREV by default, we'll need to specify a
> > revision, and document how the user can enable AUTOREV in their config
> > (maybe even a config fragment?). Whilst it is annoying to do that, it
> > is a requirement that the system doesn't touch the network outside
> > mirrors unless configured to.
>
> If we can't use AUTOREV by default, which I understand, a config fragment
> is the way to go (I think), with sane default to enable sbom-cve-check.
> If the user want specific configuration, they can create their own
> configuration. The config fragment would set:
>  - IMAGE_CLASSES +=3D "sbom-cve-check"
>  - SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
>  - SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
>  - SPDX_INCLUDE_VEX =3D "all"
>  - SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
>
> Also, what do you think about the deployment of the CVE databases
> done using rsync? Do you have a better idea?
>

AUTOREV isn't great here because it will re-fetch for each build. So if
you're
building multiple images or platforms (in CI or so), you will get
potentially different
results. cve-check has a set of variable to handle such use cases. You pin
to one specific release and do the whole checking with one single common
version.

Regards,
Marta

--0000000000002dcc77064d5cc89a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19,=
 2026 at 9:45=E2=80=AFAM Benjamin Robin via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;benjamin.robin=3D<a href=3D"mailt=
o:bootlin.com@lists.openembedded.org">bootlin.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hel=
lo Richard,<br>
<br>
On Wednesday, March 18, 2026 at 6:45=E2=80=AFPM, Richard Purdie wrote:<br>
&gt; I&#39;ve just been trying to work out where we&#39;re at with this com=
ing up to<br>
&gt; release and we need to get this resolved.<br>
&gt; <br>
&gt; I feel quite strongly that we need to use the fetcher for obtaining<br=
>
&gt; this data. &quot;fetching&quot; isn&#39;t trivial and is full of<br>
&gt; license/auditing/sbom issues. Making any exception to that, even for<b=
r>
&gt; cve data tends to become problematic later.<br>
<br>
I have just a slight implementation &quot;detail&quot; if we are using BitB=
ake<br>
fetcher. What is the license that we should use for the sources?<br>
How to declare that in the recipes?<br>
<br>
Because the license of the repositories:<br>
=C2=A0- <a href=3D"https://github.com/CVEProject/cvelistV5" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/CVEProject/cvelistV5</a> : Their i=
s none<br>
=C2=A0- <a href=3D"https://github.com/fkie-cad/nvd-json-data-feeds/tree/mai=
n/LICENSES" rel=3D"noreferrer" target=3D"_blank">https://github.com/fkie-ca=
d/nvd-json-data-feeds/tree/main/LICENSES</a><br>
=C2=A0 =C2=A0It looks like custom license.<br></blockquote><div><br></div><=
div>The CVE project repo does not have a licence included, but it is covere=
d by</div><div><a href=3D"https://www.cve.org/legal/termsofuse">https://www=
.cve.org/legal/termsofuse</a> (the usage part). It is basically MIT.</div><=
div><br></div><div>NVD has the specific,=C2=A0 licence, the one that is in =
the repo. A warning on the</div><div>needed disclosure sentence in all docu=
mentation.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"http://cve-update-db-native.bb" rel=3D"noreferrer" target=3D"_bl=
ank">cve-update-db-native.bb</a> is specifying MIT but this is kind of a li=
e.<br>
I have done the same on my recipes for now...<br>
<br>
&gt; The existing approach was only done as it was a sqlite database and we=
<br>
&gt; didn&#39;t have fetcher support for such a thing.<br>
<br>
The recipes used to download the CVE databases for the cve-check class<br>
are downloading tarballs. Yes these recipes are going to create a sqlite<br=
>
database from that. But these recipes implements there own fetcher to<br>
simply download a tarball.<br>
That is why I thought I could implement my own fetcher, which is way<br>
simpler than the update_db_file() in <a href=3D"http://cve-update-db-native=
.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> which=
 is<br>
quite complex.<br></blockquote><div><br></div><div>They implement the fetch=
er to feed into sqlite. Which was an error to use,</div><div>in my opinion.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; If we need to improve the<br>
&gt; git fetcher in some way to better support this use case (e.g. shallow<=
br>
&gt; clone update efficiency), that is something we can work on.<br>
<br>
Well that was my plan, but for the LTS release this was going to be too<br>
short. So in the meantime I preferred to used a custom fetcher which<br>
was implemented in the other RFC (or in the v4 of the original series).<br>
<br>
&gt; As such, I was wondering if you had never versions of these patches?<b=
r>
<br>
I sent 2 RFCs, one using my own fetcher, and one using the internal<br>
fetcher (this series). And I sent a v4 of the original series.<br>
<br>
&gt; I&#39;d note that we can&#39;t set AUTOREV by default, we&#39;ll need =
to specify a<br>
&gt; revision, and document how the user can enable AUTOREV in their config=
<br>
&gt; (maybe even a config fragment?). Whilst it is annoying to do that, it<=
br>
&gt; is a requirement that the system doesn&#39;t touch the network outside=
<br>
&gt; mirrors unless configured to.<br>
<br>
If we can&#39;t use AUTOREV by default, which I understand, a config fragme=
nt<br>
is the way to go (I think), with sane default to enable sbom-cve-check.<br>
If the user want specific configuration, they can create their own<br>
configuration. The config fragment would set:<br>
=C2=A0- IMAGE_CLASSES +=3D &quot;sbom-cve-check&quot;<br>
=C2=A0- SRCREV:pn-sbom-cve-check-update-nvd-native =3D &quot;${AUTOREV}&quo=
t;<br>
=C2=A0- SRCREV:pn-sbom-cve-check-update-cvelist-native =3D &quot;${AUTOREV}=
&quot;<br>
=C2=A0- SPDX_INCLUDE_VEX =3D &quot;all&quot;<br>
=C2=A0- SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D &quot;1&quot;<br>
<br>
Also, what do you think about the deployment of the CVE databases<br>
done using rsync? Do you have a better idea?<br></blockquote><div><br></div=
>AUTOREV isn&#39;t great here because it will re-fetch for each build. So i=
f you&#39;re</div><div class=3D"gmail_quote gmail_quote_container">building=
 multiple images or platforms (in CI or so), you will get potentially diffe=
rent</div><div class=3D"gmail_quote gmail_quote_container">results. cve-che=
ck has a set of variable to handle such use cases. You pin</div><div class=
=3D"gmail_quote gmail_quote_container">to one specific release and do the w=
hole checking with one single common version.</div><div class=3D"gmail_quot=
e gmail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote_co=
ntainer">Regards,</div><div class=3D"gmail_quote gmail_quote_container">Mar=
ta</div></div>

--0000000000002dcc77064d5cc89a--

