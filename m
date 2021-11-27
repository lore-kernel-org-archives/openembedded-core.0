Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E0FC433EF
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 06:10:36 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.33085.1637993435398087684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 22:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout12.t-online.de (Postfix) with SMTP id 7558B8811
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 07:09:33 +0100 (CET)
Received: from [192.168.178.83] ([79.219.231.118]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mqqtj-2AY8hd0; Sat, 27 Nov 2021 07:09:19 +0100
Subject: Re: [yocto] [OE-core] How to create connman_1.40.bbappend to enable
 and to build connman with iwd?
To: openembedded-core@lists.openembedded.org
References: <16BAEC7B11896AEA.23256@lists.yoctoproject.org>
 <CAA=hcWSA8-8TCJDD8_Zib11Vaizok-xZvQMqSevjKJLrQ+GuhA@mail.gmail.com>
 <16BB4412EB9EABB0.15594@lists.yoctoproject.org>
 <CANx9H-BczVumN8LwcH6+4SmobRJz=Hxmand2soVyfuoYZVmMQw@mail.gmail.com>
 <CAA=hcWTwe9WM2CoaMyrxWX3zHRRa3QyzgMQd5AC5QPGE61o3rA@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
Message-ID: <2d0e2e1b-543b-59fa-ae92-f8a8d508cd6f@t-online.de>
Date: Sat, 27 Nov 2021 07:09:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAA=hcWTwe9WM2CoaMyrxWX3zHRRa3QyzgMQd5AC5QPGE61o3rA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F75B14BDB7AF06B2D5205E6F"
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1637993359-00001441-A95C7E7B/0/0 CLEAN NORMAL
X-TOI-MSGID: 8984678b-92a1-49c4-a3b4-033dea65a54c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 06:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158848

This is a multi-part message in MIME format.
--------------F75B14BDB7AF06B2D5205E6F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

i tried this a while ago and for me the iwd.service failed to start.

Manually executing /usr/libexec/iwd from terminal told me, that

my Kernel config was missing a bunch of CONFIG_CRYPTO_ entries

enabled. After rebuilding the kernel the iwd service started properly

and iwd was basically set up for connman. But to my knowledge

even upstream connman is not able to scan wifi with iwd. That is

quite a showstopper. You cant completely remove wpa-supplicant

because you would still need it to set up your network. So this is not

ready for productive use i'd say.


Am 27.11.21 um 06:50 schrieb JH:
> Thanks Tim for the link, I have built the iwd.
>
> According to Daniel's advice to configure with "--disable-wifi,
> --enable-iwd", I added PACKAGECONFIG[wifi] =3D "--disable-wifi,
> --enable-iwd", to override PACKAGECONFIG[wifi] in oe-core
> connman_1.40.bb. The intention is to remove wpa-supplicant and to add
> iwd to connman_1.40.bbappend, it built the image without error, I
> believe that the syntax is OK, but the wpa-supplicant was still built
> and packaged. Any idea from OE/Yocto insiders why PACKAGECONFIG[wifi]
> in bbappend is not effective?
>
> Daniel, how can I verify in the Linux console if the connmand is
> running with iwd or with wpa_supplicant? I have disabled
> wpa_supplicant.service, and I'll remove wpa_supplicant completely when
> I find a way to do it.
>
> Thank you.
>
> Kind regards,
>
> - jh
> On 11/27/21, Tim Orling <ticotimo@gmail.com> wrote:
>> On Fri, Nov 26, 2021 at 5:48 PM Tim Orling via lists.yoctoproject.org
>> <ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>>
>>> On Thu, Nov 25, 2021 at 10:26 PM JH <jupiter.hce@gmail.com> wrote:
>>>
>>>> Hi,
>>>>
>>>> Given the high profile of iwd and advocating connman with iwd, I
>>>> believe someone have already built Yocto connman and iwd,
>>>> surprisingly, I could not even find an iwd recipe in
>>>> https://github.com/openembedded/openembedded/tree/master/recipes, no=
r
>>>> can I find connman document and instructions to replace wpa_supplica=
nt
>>>> by iwd, what could I be missing here?
>>>>
>>> Please look at the layer index for recipes:
>>> https://layers.openembedded.org/layerindex/branch/master/layers/
>>>
>>> I don=E2=80=99t have any advice for building it however.
>>>
>> I forgot to include the recipe link:
>> https://layers.openembedded.org/layerindex/recipe/89268/
>>
>>
>>>> Appreciate your kind advice.
>>>>
>>>> Thank you.
>>>>
>>>> Kind regards,
>>>>
>>>> - jh
>>>>
>>>>
>>>> On 11/26/21, JH via lists.yoctoproject.org
>>>> <jupiter.hce=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>> Hi,
>>>>>
>>>>> Please correct me, but it seems to me the connman is moving to a
>>>>> direction to ditch out wpa_supplicant and to use iwd, but the Honis=
ter
>>>>> still configure connman with wpa_supplicant by default, appreciate
>>>>> your advice:
>>>>>
>>>>> - Is connman with iwd stable enough?
>>>>>
>>>>> - How can I create a connman_1.40.bbappend  to replace wpa_supplica=
nt
>>>>> by iwd configure?
>>>>>
>>>>> - Where are the documents for configuring and building connman with
>>>>> iwd? Where is the operational guidance to run connman with iwd? Can=
 I
>>>>> use the same connman dbus APIs or are there any dbus API changes to
>>>>> run connman with iwd?
>>>>>
>>>>> My apology for FAQs.
>>>>>
>>>>> Thank you very much.
>>>>>
>>>>> Kind regards,
>>>>>
>>>>> - JH
>>>>>
>>>>
>>>> --
>>>> "A man can fail many times, but he isn't a failure until he begins t=
o
>>>> blame somebody else."
>>>> -- John Burroughs
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>
> --
> "A man can fail many times, but he isn't a failure until he begins to
> blame somebody else."
> -- John Burroughs
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158847): https://lists.openembedded.org/g/openembed=
ded-core/message/158847
> Mute This Topic: https://lists.openembedded.org/mt/87331164/3618223
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------F75B14BDB7AF06B2D5205E6F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>i tried this a while ago and for me the iwd.service failed to
      start.</p>
    <p>Manually executing /usr/libexec/iwd from terminal told me, that</p=
>
    <p>my Kernel config was missing a bunch of CONFIG_CRYPTO_ entries</p>
    <p>enabled. After rebuilding the kernel the iwd service started
      properly</p>
    <p>and iwd was basically set up for connman. But to my knowledge <br>
    </p>
    <p>even upstream connman is not able to scan wifi with iwd. That is</=
p>
    <p>quite a showstopper. You cant completely remove wpa-supplicant</p>
    <p>because you would still need it to set up your network. So this
      is not</p>
    <p>ready for productive use i'd say.</p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">Am 27.11.21 um 06:50 schrieb JH:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAA=3DhcWTwe9WM2CoaMyrxWX3zHRRa3QyzgMQd5AC5QPGE61o3rA@mail.gm=
ail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Thanks Tim for the link, I h=
ave built the iwd.

According to Daniel's advice to configure with "--disable-wifi,
--enable-iwd", I added PACKAGECONFIG[wifi] =3D "--disable-wifi,
--enable-iwd", to override PACKAGECONFIG[wifi] in oe-core
connman_1.40.bb. The intention is to remove wpa-supplicant and to add
iwd to connman_1.40.bbappend, it built the image without error, I
believe that the syntax is OK, but the wpa-supplicant was still built
and packaged. Any idea from OE/Yocto insiders why PACKAGECONFIG[wifi]
in bbappend is not effective?

Daniel, how can I verify in the Linux console if the connmand is
running with iwd or with wpa_supplicant? I have disabled
wpa_supplicant.service, and I'll remove wpa_supplicant completely when
I find a way to do it.

Thank you.

Kind regards,

- jh
On 11/27/21, Tim Orling <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Nov 26, 2021 at 5:=
48 PM Tim Orling via lists.yoctoproject.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ticotimo=3Dgmail.com@li=
sts.yoctoproject.org">&lt;ticotimo=3Dgmail.com@lists.yoctoproject.org&gt;=
</a> wrote:

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">

On Thu, Nov 25, 2021 at 10:26 PM JH <a class=3D"moz-txt-link-rfc2396E" hr=
ef=3D"mailto:jupiter.hce@gmail.com">&lt;jupiter.hce@gmail.com&gt;</a> wro=
te:

</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

Given the high profile of iwd and advocating connman with iwd, I
believe someone have already built Yocto connman and iwd,
surprisingly, I could not even find an iwd recipe in
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openembedde=
d/openembedded/tree/master/recipes">https://github.com/openembedded/opene=
mbedded/tree/master/recipes</a>, nor
can I find connman document and instructions to replace wpa_supplicant
by iwd, what could I be missing here?

</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">
Please look at the layer index for recipes:
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/master/layers/">https://layers.openembedded.org/layer=
index/branch/master/layers/</a>

I don=E2=80=99t have any advice for building it however.

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
I forgot to include the recipe link:
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/recipe/89268/">https://layers.openembedded.org/layerindex/re=
cipe/89268/</a>


</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">Appreciate your kind a=
dvice.

Thank you.

Kind regards,

- jh


On 11/26/21, JH via lists.yoctoproject.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jupiter.hce=3Dgmail.com=
@lists.yoctoproject.org">&lt;jupiter.hce=3Dgmail.com@lists.yoctoproject.o=
rg&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

Please correct me, but it seems to me the connman is moving to a
direction to ditch out wpa_supplicant and to use iwd, but the Honister
still configure connman with wpa_supplicant by default, appreciate
your advice:

- Is connman with iwd stable enough?

- How can I create a connman_1.40.bbappend  to replace wpa_supplicant
by iwd configure?

- Where are the documents for configuring and building connman with
iwd? Where is the operational guidance to run connman with iwd? Can I
use the same connman dbus APIs or are there any dbus API changes to
run connman with iwd?

My apology for FAQs.

Thank you very much.

Kind regards,

- JH

</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">

--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs




</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">

--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#158847): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/158847">https:/=
/lists.openembedded.org/g/openembedded-core/message/158847</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/87331164/3618223">https://lists.openembedded.org/mt/=
87331164/3618223</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------F75B14BDB7AF06B2D5205E6F--

