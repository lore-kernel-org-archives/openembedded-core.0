Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFC99C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:36:16 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web08.12380.1648136175806476194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 2D4A224065;
	Thu, 24 Mar 2022 16:36:14 +0100 (CET)
Content-Type: multipart/alternative;
 boundary="------------JmrQsM3SRtw203F9XZxlwJFo"
Message-ID: <9c616e34-d31b-dcab-657a-268698d34150@gmail.com>
Date: Thu, 24 Mar 2022 16:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>
References: <20220322211949.7423-1-fntoth@gmail.com>
 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 15:36:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163617

This is a multi-part message in MIME format.
--------------JmrQsM3SRtw203F9XZxlwJFo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Op 24-03-2022 om 13:03 schreef Richard Purdie:
> On Thu, 2022-03-24 at 12:23 +0100, Ferry Toth wrote:
>>> On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
>>>> I forgot to add a cover letter, sorry for that. The 2 patches=C2=A0 =
together
>>>> implement DEB repository signing.
>>>>
>>>> This is necessary since Gatesgarth |apt| (1.8.2) has become more str=
ict
>>>> and doesn=E2=80=99t allow unsigned repositories by default.
>>>>
>>>> It is possible to override this behavior |but||| is more work then t=
o
>>>> enable signed DEB repositories. These patches makes DEB a first clas=
s
>>>> citizen as IPK and RPM.
>>>>
>>>> Patches have been in use in meta-intel-edison since Gatesgarth, see
>>>> https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-
>>>> repository.html\
>>> What puzzles me is that we can build root filesystems using apt, we t=
est
>>> this on
>>> the autobuilder. Saying repositories are broken since gatesgarth ther=
efore
>>> seems
>>> confusing in the commit message.
>> Good question. When I (meta-intel-edison) build the rootfs using DEB's=
 it just
>> works.
>> Could it be that during rootfs build dpkg is used and not apt? I think=
 I have
>> seen that in the logs.
> It definitely uses apt.
>
>> Of course apt uses dpkg to install a package as well, but it refuses t=
o
>> download the package from a repo when it's not signed.
> Perhaps the difference is the packages are local and not remote?
>
>>> I guess we must configure apt to override that during the rootfs proc=
ess and
>>> likely an end user with a remote feed could do the same, possibly wit=
h a
>>> warning
>>> from apt?
>>  =C2=A0I believe there is no issue during rootfs generation.
>>  =20
>>> I'm also worried that there isn't any automated testing of this chang=
e. The
>>> reason I worry is that since we don't show any testing failures right=
 now,
>>> there
>>> is clearly a hole in our automated testing coverage and there is no
>>> guarantee
>>> that this feature will keep working. It is these smaller corner case =
issues
>>> which tend to make or break the project's experience as if a feature =
is
>>> present,
>>> people expect it to work. Can we improve the testing situation?
>> It doesn't seem to be a particularly volatile area in the code. I refr=
eshed
>> Xavier's patches for Gatesgarth, and am actively using unchanged patch=
 on
>> Honisiter.
>> I don't know how the automated testing is working but I guess for RPM =
a repo
>> is generated using a small layer? And then tested on a qemu running th=
e
>> rootfs?
>> Should be almost same for deb/apt, maybe could be modified from rpm te=
st?
> I think the rpm test is test_testimage_dnf in
> meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:
>
> oe-selftest -r runtime_test.TestImage.test_testimage_dnf
I'll have a look.
>> Point is: currently deb is documented as a feasible package format to =
generate
>> a repo. But it really is not without these signing patches. So we coul=
d either
>> deprecate deb's (no, no please don't) or fix it.
>> These patches fix it. With or without automated testing, it is already=
 better
>> then the current situation.
> I'm not sure it is. The project gains yet another set of config options=
 which we
> don't have tests for and the maintainer stress levels in trying to keep=
 it all
> working just get worse.
>
> We have a huge number of ways people can configure the builds. The only=
 way the
> project manages to keep all of this working is through automated testin=
g, there
> is simply no other way to do it. I appreciate adding tests is a pain an=
d nobody
> likes doing it. It does however let the project stay functional for eve=
ryone's
> diverse use cases.
>
> There are all kinds of patches I could take because the improve some co=
rner
> case. In most cases we don't know what else they might break or whether=
 that
> code continues to be used or stays working. I therefore do really want =
tests for
> new configurations.
It's not an improvement but a fix for an existing config. Even if it=20
would break in the future it can't be worse then it is now.
> Who should write those tests? If you don't/can't as some actively using=
 the
> feature, it means someone else has to, but who?
I do understand.
> I've not decided what to do with the patches to be honest but the merge=
 and not
> bother with tests argument doesn't sit well with me.
>
> Cheers,
>
> Richard
>
--------------JmrQsM3SRtw203F9XZxlwJFo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Noto Sans">Hi</font><br>
    </p>
    <div class=3D"moz-cite-prefix">Op 24-03-2022 om 13:03 schreef Richard
      Purdie:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Thu, 2022-03-24 at 12:23 =
+0100, Ferry Toth wrote:
</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 2022-03-23 at 19=
:34 +0100, Ferry Toth wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
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
ta-intel-edison/5.0-Creating-a-deb">https://edison-fw.github.io/meta-inte=
l-edison/5.0-Creating-a-deb</a>-
repository.html\
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">What puzzles me is that =
we can build root filesystems using apt, we test
this on
the autobuilder. Saying repositories are broken since gatesgarth therefor=
e
seems
confusing in the commit message.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Good question. When I (met=
a-intel-edison) build the rootfs using DEB's it just
works.
Could it be that during rootfs build dpkg is used and not apt? I think I =
have
seen that in the logs.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
It definitely uses apt.

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Of course apt uses dpkg to=
 install a package as well, but it refuses to
download the package from a repo when it's not signed.=20
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Perhaps the difference is the packages are local and not remote?

</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">I guess we must configur=
e apt to override that during the rootfs process and
likely an end user with a remote feed could do the same, possibly with a
warning
from apt?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">=C2=A0I believe there is n=
o issue during rootfs generation.
=C2=A0
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">I'm also worried that th=
ere isn't any automated testing of this change. The
reason I worry is that since we don't show any testing failures right now=
,
there
is clearly a hole in our automated testing coverage and there is no
guarantee
that this feature will keep working. It is these smaller corner case issu=
es
which tend to make or break the project's experience as if a feature is
present,
people expect it to work. Can we improve the testing situation?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">It doesn't seem to be a pa=
rticularly volatile area in the code. I refreshed
Xavier's patches for Gatesgarth, and am actively using unchanged patch on
Honisiter.
I don't know how the automated testing is working but I guess for RPM a r=
epo
is generated using a small layer? And then tested on a qemu running the
rootfs?
Should be almost same for deb/apt, maybe could be modified from rpm test?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I think the rpm test is test_testimage_dnf in
meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:

oe-selftest -r runtime_test.TestImage.test_testimage_dnf
</pre>
    </blockquote>
    I'll have a look.<br>
    <blockquote type=3D"cite"
cite=3D"mid:6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Point is: currently deb is=
 documented as a feasible package format to generate
a repo. But it really is not without these signing patches. So we could e=
ither
deprecate deb's (no, no please don't) or fix it.
These patches fix it. With or without automated testing, it is already be=
tter
then the current situation.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm not sure it is. The project gains yet another set of config options w=
hich we
don't have tests for and the maintainer stress levels in trying to keep i=
t all
working just get worse.

We have a huge number of ways people can configure the builds. The only w=
ay the
project manages to keep all of this working is through automated testing,=
 there
is simply no other way to do it. I appreciate adding tests is a pain and =
nobody
likes doing it. It does however let the project stay functional for every=
one's
diverse use cases.

There are all kinds of patches I could take because the improve some corn=
er
case. In most cases we don't know what else they might break or whether t=
hat
code continues to be used or stays working. I therefore do really want te=
sts for
new configurations.
</pre>
    </blockquote>
    It's not an improvement but a fix for an existing config. Even if it
    would break in the future it can't be worse then it is now.<br>
    <blockquote type=3D"cite"
cite=3D"mid:6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Who should write those tests? If you don't/can't as some actively using t=
he
feature, it means someone else has to, but who?
</pre>
    </blockquote>
    I do understand.<br>
    <blockquote type=3D"cite"
cite=3D"mid:6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
I've not decided what to do with the patches to be honest but the merge a=
nd not
bother with tests argument doesn't sit well with me.

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------JmrQsM3SRtw203F9XZxlwJFo--

