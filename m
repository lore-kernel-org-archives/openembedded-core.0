Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F801C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 11:23:37 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web08.9505.1648121015507979571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 04:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 53EC52406A;
	Thu, 24 Mar 2022 12:23:34 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------YdDa4ci10k4RxpwDjCL6hb7l"
Message-ID: <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
Date: Thu, 24 Mar 2022 12:23:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>
References: <20220322211949.7423-1-fntoth@gmail.com>
 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 11:23:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163604

This is a multi-part message in MIME format.
--------------YdDa4ci10k4RxpwDjCL6hb7l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Op 24-03-2022 om 09:12 schreef Richard Purdie:
> On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
>> Hi Richard,
>>
>> I forgot to add a cover letter, sorry for that. The 2 patches=C2=A0 to=
gether
>> implement DEB repository signing.
>>
>> This is necessary since Gatesgarth |apt| (1.8.2) has become more stric=
t
>> and doesn=E2=80=99t allow unsigned repositories by default.
>>
>> It is possible to override this behavior |but||| is more work then to
>> enable signed DEB repositories. These patches makes DEB a first class
>> citizen as IPK and RPM.
>>
>> Patches have been in use in meta-intel-edison since Gatesgarth, see
>> https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-repos=
itory.html\
> What puzzles me is that we can build root filesystems using apt, we tes=
t this on
> the autobuilder. Saying repositories are broken since gatesgarth theref=
ore seems
> confusing in the commit message.

Good question. When I (meta-intel-edison) build the rootfs using DEB's=20
it just works.

Could it be that during rootfs build dpkg is used and not apt? I think I=20
have seen that in the logs.

Of course apt uses dpkg to install a package as well, but it refuses to=20
download the package from a repo when it's not signed.

> I guess we must configure apt to override that during the rootfs proces=
s and
> likely an end user with a remote feed could do the same, possibly with =
a warning
> from apt?
I believe there is no issue during rootfs generation.
> I'm also worried that there isn't any automated testing of this change.=
 The
> reason I worry is that since we don't show any testing failures right n=
ow, there
> is clearly a hole in our automated testing coverage and there is no gua=
rantee
> that this feature will keep working. It is these smaller corner case is=
sues
> which tend to make or break the project's experience as if a feature is=
 present,
> people expect it to work. Can we improve the testing situation?

It doesn't seem to be a particularly volatile area in the code. I=20
refreshed Xavier's patches for Gatesgarth, and am actively using=20
unchanged patch on Honisiter.

I don't know how the automated testing is working but I guess for RPM a=20
repo is generated using a small layer? And then tested on a qemu running=20
the rootfs?

Should be almost same for deb/apt, maybe could be modified from rpm test?

Point is: currently deb is documented as a feasible package format to=20
generate a repo. But it really is not without these signing patches. So=20
we could either deprecate deb's (no, no please don't) or fix it.

These patches fix it. With or without automated testing, it is already=20
better then the current situation.

> Cheers,
>
> Richard
>
>
>
--------------YdDa4ci10k4RxpwDjCL6hb7l
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Noto Sans">Hi,</font><br>
    </p>
    <div class=3D"moz-cite-prefix">Op 24-03-2022 om 09:12 schreef Richard
      Purdie:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 2022-03-23 at 19:34 =
+0100, Ferry Toth wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi Richard,

I forgot to add a cover letter, sorry for that. The 2 patches=C2=A0 toget=
her=20
implement DEB repository signing.

This is necessary since Gatesgarth |apt| (1.8.2) has become more strict=20
and doesn=E2=80=99t allow unsigned repositories by default.

It is possible to override this behavior |but||| is more work then to=20
enable signed DEB repositories. These patches makes DEB a first class=20
citizen as IPK and RPM.

Patches have been in use in meta-intel-edison since Gatesgarth, see=20
<a class=3D"moz-txt-link-freetext" href=3D"https://edison-fw.github.io/me=
ta-intel-edison/5.0-Creating-a-deb-repository.html\">https://edison-fw.gi=
thub.io/meta-intel-edison/5.0-Creating-a-deb-repository.html\</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
What puzzles me is that we can build root filesystems using apt, we test =
this on
the autobuilder. Saying repositories are broken since gatesgarth therefor=
e seems
confusing in the commit message.
</pre>
    </blockquote>
    <p>Good question. When I (meta-intel-edison) build the rootfs using
      DEB's it just works.</p>
    <p>Could it be that during rootfs build dpkg is used and not apt? I
      think I have seen that in the logs.</p>
    <p>Of course apt uses dpkg to install a package as well, but it
      refuses to download the package from a repo when it's not signed.
      <br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
I guess we must configure apt to override that during the rootfs process =
and
likely an end user with a remote feed could do the same, possibly with a =
warning
from apt?
</pre>
    </blockquote>
    I believe there is no issue during rootfs generation.<br>
    <blockquote type=3D"cite"
cite=3D"mid:e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm also worried that there isn't any automated testing of this change. T=
he
reason I worry is that since we don't show any testing failures right now=
, there
is clearly a hole in our automated testing coverage and there is no guara=
ntee
that this feature will keep working. It is these smaller corner case issu=
es
which tend to make or break the project's experience as if a feature is p=
resent,
people expect it to work. Can we improve the testing situation?
</pre>
    </blockquote>
    <p>It doesn't seem to be a particularly volatile area in the code. I
      refreshed Xavier's patches for Gatesgarth, and am actively using
      unchanged patch on Honisiter.</p>
    <p>I don't know how the automated testing is working but I guess for
      RPM a repo is generated using a small layer? And then tested on a
      qemu running the rootfs?</p>
    <p>Should be almost same for deb/apt, maybe could be modified from
      rpm test?</p>
    <p>Point is: currently deb is documented as a feasible package
      format to generate a repo. But it really is not without these
      signing patches. So we could either deprecate deb's (no, no please
      don't) or fix it.</p>
    <p>These patches fix it. With or without automated testing, it is
      already better then the current situation.<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Cheers,

Richard



</pre>
    </blockquote>
  </body>
</html>

--------------YdDa4ci10k4RxpwDjCL6hb7l--

