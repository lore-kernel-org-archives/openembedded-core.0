Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA4FC3A589
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web08.9602.1649256194383780184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 07:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 46A2D24096;
	Wed,  6 Apr 2022 16:43:13 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------jXB25ZBZE0XQZ5zi8G1EwpeB"
Message-ID: <c0325b11-7db5-2a1e-9da8-edcc6abfc2a6@gmail.com>
Date: Wed, 6 Apr 2022 16:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] apt: add apt selftest to test signed package feeds
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>,
 Alexander Kanavin <alex@linutronix.de>, Ferry Toth <ftoth@exalondelft.nl>
References: <20220403195046.7060-1-fntoth@gmail.com>
 <20220403195046.7060-5-fntoth@gmail.com>
 <694f4b0519a5365015c7eb561767b27f3a07e975.camel@linuxfoundation.org>
 <369e2108-34a9-dbfc-eb09-817a1eee4604@gmail.com>
 <add235b4921d1a7e7e87ea718624904c1f7b6af2.camel@linuxfoundation.org>
 <9c8771c5-1b2a-0d6f-0658-ba08dd9ad5fa@gmail.com>
 <afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164083

This is a multi-part message in MIME format.
--------------jXB25ZBZE0XQZ5zi8G1EwpeB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Op 06-04-2022 om 13:40 schreef Richard Purdie:
> On Tue, 2022-04-05 at 17:23 +0200, Ferry Toth wrote:
>> Op 04-04-2022 om 22:39 schreef Richard Purdie:
>>  =C2=A0On Mon, 2022-04-04 at 19:35 +0200, Ferry Toth wrote:
>>>  =C2=A0Op 04-04-2022 om 15:58 schreef Richard Purdie:
>>>>> On Sun, 2022-04-03 at 21:50 +0200, Ferry Toth wrote:
>>>>> Looking at the patches I wondered if this would break testimage and
>>>>> unfortunately it does:
>>>>>
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/5=
013/s
>>>>> teps/12/logs/stdio
>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/4=
975
>>>> That is weird, do I understand correctly that it fails on:
>>>>  =C2=A0=C2=A0apt-get remove --yes run-postinsts-dev
>>>> Reading package lists...
>>>> Building dependency tree...
>>>> E: Unable to locate package run-postinsts-dev
>>>>
>>>> That is actually *) one line I didn't touch. I did note while testin=
g
>>>> that I saw this exact message, however that was not counted as a fai=
l.
>>>>
>>>> What could cause this? Because the complaint is it can't remove the
>>>> package because it was not installed.
>>>>
>>>> It would be trivial to remove the line
>>>>
>>>> *) self.pkg('remove --yes run-postinsts-dev')
>>>>
>>>> but how could it have passed the test before?
>>> I think the issue is you edited testimage which is a different set of=
 tests
>>> which aren't just called by oe-selftest but by things like
>> That would be my first thought too, but...
>> because the failure seems to be on the line self.pkg('remove --yes run=
-
>> postinsts-dev'),=C2=A0 that would mean the line self.pkg('update') pas=
sed.
>> And that should only pass if it finds a signed repository and has the =
key
>> installed (and believe me, I saw a log of that in the last week).
>> So, there may be a second thing wrong?
> I was easily able to reproduce this locally and it shows the
> setup_source_config_for_package_install() step fails and hence the sour=
ces
> aren't setup correctly, hence the update probably works.
not correct, hence works. You lost me here, but I'll try to reproduce.
>> Do you know where I can find the log files referred to:
>> <..>tmp/work/qemux86-poky-linux/core-image-sato/1.0-
>> r0/temp/log.do_testimage.35553
>> <..>tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-
>> r0/temp/log.do_testimage.35362
> We can get them off the autobuilder if needed but someone would have to=
 manually
No, that would be too much work. I'll try to reproduce myself.
> go in and find/share them. The issue does locally reproduce for me with=
 a
> "bitbake core-image-sato -c testimage" with package_deb set as the back=
end.

..in conf. But without PACKAGE_CLASSES, PACKAGE_FEED_GPG_NAME,=20
PACKAGE_FEED_GPG_PASSPHRASE_FILE?

>> or could we do a 'quick' check by changing
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('update')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('remove --ye=
s run-postinsts-dev')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('install --y=
es run-postinsts-dev')
>> to
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('update')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('install --y=
es run-postinsts-dev')
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('remove --ye=
s run-postinsts-dev')
>> ?
> I'm not convinced that would help us...
I'll try locally.
>>  =20
>>> "bitbake core-image-sato -c testimage"
>>>
>>> as well. I'd suggest making the changes in testimage conditional on s=
igning
>>> being configured.
>> Yes, regardless the above, we need to either make signing always enabl=
ed in
>> all test cases or detect whether signing is used.
>> Do you have a hint if there is a variable to test in class AptRepoTest=
 if
>> PACKAGE_FEED_GPG_NAME has been set?
>> Otherwise I could just duplicate code and create
>> apt.AptRepoTest.test_apt_install_from_repo_signed.
>> What would you prefer?
>>
> We should be able to test self.tc.td.get('PACKAGE_FEED_GPG_NAME') in th=
e test
> and handle accordingly?
>
> I did merge the base changes into the release since I thought it was fa=
ir to get
> the fixes in before it was built. We just need to get the test sorted n=
ow, I
> think it is close.

Thanks for merging.

I'll fix the test, that's only fair.

One thing, the test "test_testimage_apt" is new. It needs to be=20
scheduled somewhere (where "test_testimage_dnf" is called i guess), I=20
didn't add that. Is that correct?

>
> Cheers,
>
> Richard
>
>
>
--------------jXB25ZBZE0XQZ5zi8G1EwpeB
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
    <div class=3D"moz-cite-prefix">Op 06-04-2022 om 13:40 schreef Richard
      Purdie:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, 2022-04-05 at 17:23 =
+0200, Ferry Toth wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Op 04-04-2022 om 22:39 sch=
reef Richard Purdie:
=C2=A0On Mon, 2022-04-04 at 19:35 +0200, Ferry Toth wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">=C2=A0Op 04-04-2022 om 1=
5:58 schreef Richard Purdie:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">On Sun, 2022-04-03 a=
t 21:50 +0200, Ferry Toth wrote:
Looking at the patches I wondered if this would break testimage and
unfortunately it does:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/50/builds/5013/s">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/50/builds/5013/s</a>
teps/12/logs/stdio
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/76/builds/4975">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/76/builds/4975</a>
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">That is weird, do I un=
derstand correctly that it fails on:
=C2=A0=C2=A0apt-get remove --yes run-postinsts-dev
Reading package lists...
Building dependency tree...
E: Unable to locate package run-postinsts-dev

That is actually *) one line I didn't touch. I did note while testing=20
that I saw this exact message, however that was not counted as a fail.

What could cause this? Because the complaint is it can't remove the=20
package because it was not installed.

It would be trivial to remove the line

*) self.pkg('remove --yes run-postinsts-dev')

but how could it have passed the test before?
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
I think the issue is you edited testimage which is a different set of tes=
ts
which aren't just called by oe-selftest but by things like=C2=A0
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">That would be my first tho=
ught too, but...
because the failure seems to be on the line self.pkg('remove --yes run-
postinsts-dev'),=C2=A0 that would mean the line self.pkg('update') passed=
.
And that should only pass if it finds a signed repository and has the key
installed (and believe me, I saw a log of that in the last week).
So, there may be a second thing wrong?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I was easily able to reproduce this locally and it shows the
setup_source_config_for_package_install() step fails and hence the source=
s
aren't setup correctly, hence the update probably works.
</pre>
    </blockquote>
    not correct, hence works. You lost me here, but I'll try to
    reproduce.<br>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Do you know where I can fi=
nd the log files referred to:
&lt;..&gt;tmp/work/qemux86-poky-linux/core-image-sato/1.0-
r0/temp/log.do_testimage.35553
&lt;..&gt;tmp/work/qemux86-poky-linux/core-image-sato-sdk/1.0-
r0/temp/log.do_testimage.35362
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
We can get them off the autobuilder if needed but someone would have to m=
anually</pre>
    </blockquote>
    No, that would be too much work. I'll try to reproduce myself.<br>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
go in and find/share them. The issue does locally reproduce for me with a
"bitbake core-image-sato -c testimage" with package_deb set as the backen=
d.
</pre>
    </blockquote>
    <p>..in conf. But without PACKAGE_CLASSES, PACKAGE_FEED_GPG_NAME,
      PACKAGE_FEED_GPG_PASSPHRASE_FILE?</p>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">or could we do a 'quick' c=
heck by changing
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('update')
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('remove --yes ru=
n-postinsts-dev')
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('install --yes r=
un-postinsts-dev')
to=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('update')
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('install --yes r=
un-postinsts-dev')
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self.pkg('remove --yes ru=
n-postinsts-dev')
?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm not convinced that would help us...
</pre>
    </blockquote>
    I'll try locally.<br>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">=C2=A0
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
"bitbake core-image-sato -c testimage"

as well. I'd suggest making the changes in testimage conditional on signi=
ng
being configured.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">Yes, regardless the above,=
 we need to either make signing always enabled in
all test cases or detect whether signing is used.
Do you have a hint if there is a variable to test in class AptRepoTest if
PACKAGE_FEED_GPG_NAME has been set?
Otherwise I could just duplicate code and create
apt.AptRepoTest.test_apt_install_from_repo_signed.
What would you prefer?

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
We should be able to test self.tc.td.get('PACKAGE_FEED_GPG_NAME') in the =
test
and handle accordingly?

I did merge the base changes into the release since I thought it was fair=
 to get
the fixes in before it was built. We just need to get the test sorted now=
, I
think it is close.</pre>
    </blockquote>
    <p>Thanks for merging.</p>
    <p>I'll fix the test, that's only fair. <br>
    </p>
    <p>One thing, the test "test_testimage_apt" is new. It needs to be
      scheduled somewhere (where "test_testimage_dnf" is called i
      guess), I didn't add that. Is that correct?<br>
    </p>
    <blockquote type=3D"cite"
cite=3D"mid:afcc7bdc350eff203b217e8fb1c542bb1a5c2a9d.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Cheers,

Richard



</pre>
    </blockquote>
  </body>
</html>

--------------jXB25ZBZE0XQZ5zi8G1EwpeB--

