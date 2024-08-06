Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDC3C3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:17:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6960.1722950212622560256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lo8b+CJ2;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc56fd4de1so6131105ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722950212; x=1723555012; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Md9WEbZuwrNkgABCyg4k/AMvnTzaO9PWbTMKaDhDp68=;
        b=Lo8b+CJ2SaD86/YsNJYdRGaoOtazFyimQTX8bV6YLxRJpThl5oi+CZdFFKCmQBwwn4
         wBDzRIlpGJr5z0MXlRoGnixtQGWo8SIQmtmGd4VKZx5xT4EA1G38AXv5YBhWA/gQ9WJZ
         Izm2hPCRjjoAy2RpW3XoSirOr4syiXBAS02xNY+8YyVuXaHsiDFZQEuu4V8OC1rjduW5
         Li6Sgz93y4yM1A4ydA//UtT32TLH2qUwDwoL+0IFxbeJ9KhXeC+jqUO5dBXObw4zjkEg
         zHx3DDDDR03Q3LdMVL7ELBTOLwfaQgNWabQhjYVPBnK/M3dzgFPQkFINBuISzdgIpPzo
         mu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722950212; x=1723555012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md9WEbZuwrNkgABCyg4k/AMvnTzaO9PWbTMKaDhDp68=;
        b=A5yMSH1vi/2RftcLIPfc3WqsOtHEvHtDzE0fB2lHZub0ThU1nF3xAOBvxnY1FSp18t
         p6jL8lDhdgBv8WJ3c5KyBm+K5qV9FchJBbQtoTFwMfTRCZhwLj3R8dVPaP4WHSDfQDo7
         B0+wymCNs9HoZ+/D/gLo45OPQ1dAzsje46c0GZ1rPFGGkTo/0kN8GtlvgapovudHyX22
         FnMBNFyW3vsQoYW7CU9HDojvPrrlcHD6dAUII8NabIoLDm68UfkwH6uV892weZC90UE7
         /FYmA0rwYc4Gzye2pf8ZmHf9Eol5WR9QImizblIs79L7l9M+cU78L3+OpjEzdesqmA0S
         ERCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt3Hv3pyASnitA2V3g6mTBepULeSpo3cYO88kr011ZYdFWD1rpPofsA1Z3XCk++Lb9Qj+dkuG25e96X2TufNKFoh5kbt0AmYeCWrX/tdlAreVbcXtiw5XW
X-Gm-Message-State: AOJu0Yy6FyFpw1b/7hL4UGiVt5u1+/VOfm+rReeQFTv9SsO64xhT5SNk
	4sC6nG4nbvsjEweWAtiPcCa35YJ3bSsC6DQ6OXgPOSRtyMdBJ5OqXLDbkMDyHBBCoVJkKd6pFQH
	m+pwO+nrz/9dfW2c2Vy2HPvpbL8o=
X-Google-Smtp-Source: AGHT+IHQ4p/FIMCptv9JCdYK8pqXxnOQ3C+k/eSxLSPiHtJORhRP39+mOSiyYeY6+xfcoDR4LMMfwZUI3PWENqNRmMk=
X-Received: by 2002:a17:902:ea02:b0:1fd:6581:93c5 with SMTP id
 d9443c01a7336-1ff524afe2bmr262285915ad.27.1722950211815; Tue, 06 Aug 2024
 06:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-5-marta.rybczynska@syslinbit.com> <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
 <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
 <606d5852aec8e7bb29350cfb27aa3df8f706dc72.camel@linuxfoundation.org>
 <CAApg2=QPTmm6Y-r-oWS2PfP-DZ-t1NRfm7rKqcBnuFmkXRdC2w@mail.gmail.com> <9d33f694d08c91ef31c49c0c549f17d272358476.camel@linuxfoundation.org>
In-Reply-To: <9d33f694d08c91ef31c49c0c549f17d272358476.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 6 Aug 2024 15:16:39 +0200
Message-ID: <CAApg2=Rxy8G1BL6vLTshD7CPARkvoC4+C_sK2Q1QjtssH0e0cA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add deprecation notice
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="00000000000057533a061f039b66"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203023

--00000000000057533a061f039b66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:08=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-08-01 at 15:58 +0200, Marta Rybczynska wrote:
> > On Thu, Aug 1, 2024 at 3:47=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2024-07-26 at 14:28 +0200, Marta Rybczynska via
> > > lists.openembedded.org wrote:
> > > > On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton <Ross.Burton@ar=
m.com>
> > > > wrote:
> > > > > On 24 Jul 2024, at 16:25, Marta Rybczynska via
> > > > > lists.openembedded.org
> > > > > <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > This file contains CVE_STATUS without machine-readable
> > > > > > information on which
> > > > > > recipe it applies to. All entries should be verified and, if
> > > > > > appropriate,
> > > > > > moved to their corresponding recipes.
> > > > >
> > > > > The point of this file was to be an opt-in for more exclusions
> > > > > where we didn=E2=80=99t feel 100% confident asserting the issues =
could be
> > > > > ignored.
> > > > >
> > > > > How much of a problem is it if this file contains a a limited
> > > > > number of CVEs?  We can review what is in there and move/remove a=
s
> > > > > needed to cut it down.
> > > >
> > > > With the vex class (and with SPDX too, I think) they end up copied
> > > > present in every single package of the build. This brings enormous
> > > > confusion.
> > > > Impossible to filter them out as there is no information about the
> > > > affected recipe/package.
> > >
> > > Difficult, yes, impossible, no.
> > >
> > > Surely we know which recipes a given CVE apply to?
> >
> > Without having the CVE data at the same time, no.
>
> I thought we had the CVE data?
>

When we do vex only, we have the CVE data only in the external tool. The
file that comes
out from the build contains additional entries. We can filter them out, but
only in the tool.

However, if we filter out in the tool (with a rule like: if this CVE does
not apply to the package,
remove it), we remove the feature of the VEX of being able to specify that
your package is
not affected by a widely known vulnerability. For example, you can say "I'm
not affected by
log4shell because I do not include log4j". This is a feature that has its
use, it avoids
responding to multiple procurement questions, where they all want the same
information.
You just say it once, in the VEX.


>
> >  Also, a CVE might apply to multiple
> > recipes at the same time - and this could be dangerous. Imagine a
> situation where
> > the CPE is incorrect and is pointing to the wrong package. It gets adde=
d
> to .inc.
> > But then someone in their layer adds the package the CVE really applies
> to...
>
> We can't cover every possible scenario and if the data is wrong, we
> identify and fix it.
>

I think we need to distinguish between two cases:
- the data is wrong and we fix it (and we're sure of the fix) - typically a
CPE fix
- the resolution depends on a configuration, typically
"not-applicable-config" - if someone adds a bbappend to the recipe, they
MUST review impact on all related vulnerabilities
- we make an assumption. All of "upstream-wontfix" are of this category.
The YP user MUST make their own assessment here.


>
> > If we keep the .inc file, I think the most correct way would be to add =
a
> field marking
> >  which recipe it should be applied to.
> >
> > What do you think?
>
> How do we mark up a CVE as applying to gcc-cross-*/gcc-cross-canadian-
> */gcc-runtime/libgcc and so on?
>

We do not have any gcc entries in cve-extra-exclusions.



>
> How do we convert "bash" to "nativesdk-bash" and "bash-native"?
>

We do not have anything related to bash either.

What is in there in cve-extra-exclusions are mostly very old CVEs, the
biggest part belonging to bdb.
Kernel ones can go to kernel includes etc.

With the directions the CVE programme is going, I do not *expect* a need
for new entries.


>
> There are ways we could do such markup but I don't think it is going to
> work well.
>
> I guess the key question is what we're trying to achieve and where
> we're expecting the data to be processed?
>
> Could we write a common exclusion file out once as part of the CVE
> fetch recipe and avoid putting it into the individual recipe output?
>

Yes, we can do that and additionally allow each vendor to have their own
file, with their own assessment. "upstream-wontfix" can be mapped to
"code-not-reached" or similar, when confirmed this is not explotable.

Autobuilder can have its own removing entries we don't want to see on CVE
list (if we really think it is a good idea).

Regards,
Marta

>
>
>

--00000000000057533a061f039b66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 1, 2024 at 4:08=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, 2024-08-01 at 15:58 +0200, Marta =
Rybczynska wrote:<br>
&gt; On Thu, Aug 1, 2024 at 3:47=E2=80=AFPM Richard Purdie &lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Fri, 2024-07-26 at 14:28 +0200, Marta Rybczynska via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton &lt;<a h=
ref=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a=
>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; On 24 Jul 2024, at 16:25, Marta Rybczynska via<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This file contains CVE_STATUS without machine-read=
able<br>
&gt; &gt; &gt; &gt; &gt; information on which<br>
&gt; &gt; &gt; &gt; &gt; recipe it applies to. All entries should be verifi=
ed and, if<br>
&gt; &gt; &gt; &gt; &gt; appropriate,<br>
&gt; &gt; &gt; &gt; &gt; moved to their corresponding recipes.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The point of this file was to be an opt-in for more exc=
lusions<br>
&gt; &gt; &gt; &gt; where we didn=E2=80=99t feel 100% confident asserting t=
he issues could be<br>
&gt; &gt; &gt; &gt; ignored.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; How much of a problem is it if this file contains a a l=
imited<br>
&gt; &gt; &gt; &gt; number of CVEs?=C2=A0 We can review what is in there an=
d move/remove as<br>
&gt; &gt; &gt; &gt; needed to cut it down.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; With the vex class (and with SPDX too, I think) they end up =
copied<br>
&gt; &gt; &gt; present in every single package of the build. This brings en=
ormous<br>
&gt; &gt; &gt; confusion.<br>
&gt; &gt; &gt; Impossible to filter them out as there is no information abo=
ut the<br>
&gt; &gt; &gt; affected recipe/package.<br>
&gt; &gt; <br>
&gt; &gt; Difficult, yes, impossible, no.<br>
&gt; &gt; <br>
&gt; &gt; Surely we know which recipes a given CVE apply to?<br>
&gt; <br>
&gt; Without having the CVE data at the same time, no.<br>
<br>
I thought we had the CVE data?<br></blockquote><div><br></div><div>When we =
do vex only, we have the CVE data only in the external tool. The file that =
comes</div><div>out from the build contains additional entries. We can filt=
er them out, but only in the tool.</div><div><br></div><div>However, if we =
filter out in the tool (with a rule like: if this CVE does not apply to the=
 package,</div><div>remove it), we remove the feature of the VEX of being a=
ble to specify that your package is</div><div>not affected by a widely know=
n vulnerability. For example, you can say &quot;I&#39;m not affected by</di=
v><div>log4shell because I do not include log4j&quot;. This is a feature th=
at has its use, it avoids</div><div>responding to multiple procurement ques=
tions, where they all want the same information.</div><div>You just say it =
once, in the VEX.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt;=C2=A0 Also, a CVE might apply to multiple<br>
&gt; recipes at the same time - and this could be dangerous. Imagine a situ=
ation where<br>
&gt; the CPE is incorrect and is pointing to the wrong package. It gets add=
ed to .inc.<br>
&gt; But then someone in their layer adds the package the CVE really applie=
s to...<br>
<br>
We can&#39;t cover every possible scenario and if the data is wrong, we<br>
identify and fix it.<br></blockquote><div><br></div><div>I think we need to=
 distinguish between two cases:</div><div>- the data is wrong and we fix it=
 (and we&#39;re sure of the fix) - typically a CPE fix</div><div>- the reso=
lution depends on a configuration, typically &quot;not-applicable-config&qu=
ot; - if someone adds a bbappend to the recipe, they MUST review impact on =
all related vulnerabilities<br></div><div>- we make an assumption. All of &=
quot;upstream-wontfix&quot; are of this category. The YP user MUST make the=
ir own assessment here.<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt; If we keep the .inc file, I think the most correct way would be to add=
 a field marking<br>
&gt; =C2=A0which recipe it should be applied to. <br>
&gt; <br>
&gt; What do you think?<br>
<br>
How do we mark up a CVE as applying to gcc-cross-*/gcc-cross-canadian-<br>
*/gcc-runtime/libgcc and so on?<br></blockquote><div><br></div><div>We do n=
ot have any gcc entries in cve-extra-exclusions.<br></div><div><br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
How do we convert &quot;bash&quot; to &quot;nativesdk-bash&quot; and &quot;=
bash-native&quot;?<br></blockquote><div><br></div><div>We do not have anyth=
ing related to bash either.</div><div><br></div><div>What is in there in cv=
e-extra-exclusions are mostly very old CVEs, the biggest part belonging to =
bdb.</div><div>Kernel ones can go to kernel includes etc.</div><div><br></d=
iv><div>With the directions the CVE programme is going, I do not *expect* a=
 need for new entries.<br></div><div>=C2=A0<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
There are ways we could do such markup but I don&#39;t think it is going to=
<br>
work well.=C2=A0<br>
<br>
I guess the key question is what we&#39;re trying to achieve and where<br>
we&#39;re expecting the data to be processed?<br>
<br>
Could we write a common exclusion file out once as part of the CVE<br>
fetch recipe and avoid putting it into the individual recipe output?<br></b=
lockquote><div><br></div><div>Yes, we can do that and additionally allow ea=
ch vendor to have their own</div><div>file, with their own assessment. &quo=
t;upstream-wontfix&quot; can be mapped to</div><div>&quot;code-not-reached&=
quot; or similar, when confirmed this is not explotable.<br></div><div><br>=
</div><div>Autobuilder can have its own removing entries we don&#39;t want =
to see on CVE</div><div>list (if we really think it is a good idea).<br></d=
iv><div><br></div><div>Regards,</div><div>Marta<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
<br>
</blockquote></div></div>

--00000000000057533a061f039b66--

