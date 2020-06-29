Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
 by mx.groups.io with SMTP id smtpd.web11.13951.1593416053705721793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 00:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: eswin.com, ip: 115.124.28.219, mailfrom: maochenxi@eswin.com)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.04468779|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0170444-0.00895224-0.974003;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16367;MF=maochenxi@eswin.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.HuQcJ.u_1593416048;
Received: from 10.1.56.17(mailfrom:maochenxi@eswin.com fp:SMTPD_---.HuQcJ.u_1593416048)
          by smtp.aliyun-inc.com(10.194.97.171);
          Mon, 29 Jun 2020 15:34:09 +0800
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-bad: don't select vulkan if directfb enabled.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>, chenxi.mao2013@gmail.com
References: <20200628053943.906548-1-maochenxi@eswin.com>
 <20200628053943.906548-2-maochenxi@eswin.com>
 <27f412b9914cfc57e36f34fd6e4e7d3119db4b76.camel@linuxfoundation.org>
 <79dd22e5-fd7b-c878-8598-a4064b818eaf@eswin.com>
 <CANNYZj8Vq0ZcDtufrGyjrY6cRfsMb1HbuFWJYqhWHtRrGtiACQ@mail.gmail.com>
From: "Chenxi Mao" <maochenxi@eswin.com>
Message-ID: <b9880d6a-4f72-b64d-7165-018637c34616@eswin.com>
Date: Mon, 29 Jun 2020 15:34:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Vq0ZcDtufrGyjrY6cRfsMb1HbuFWJYqhWHtRrGtiACQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Alex, Richard:

Thanks for your information, hints and suggestion.

After remove vulkan in DISTRO_FEATURES configuration,  it works fine.

We don't need this commit any more. Please abandon this commit.

Thanks.


Chenxi


On 2020/6/28 下午5:40, Alexander Kanavin wrote:
> bb.utils.filter() makes sets out of DISTRO_FEATURES and the second
> argument, and returns an intersection of the two. So the line shouldn't
> need any fixing.
>
> Are you sure you do not have vulkan in your DISTRO_FEATURES? How are you
> setting it? What does 'bitbake -e gstreamer1.0-plugins-bad' say?
>
> Alex
>
> On Sun, 28 Jun 2020 at 10:39, Chenxi Mao <maochenxi@eswin.com> wrote:
>
>> Hi Richard:
>>
>> If I set directfb only in DISTRO_FEATURES, the vulkan will be enabled
>> in gstreamer, that will cause the build break.
>> The root cause is the vulkan didn't support directfb.
>> So I remove this vulkan if directfb enabled.
>>
>> Another solution is separate the directfb with directfb. Like below:
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
>>
>> Chenxi
>>
>> On 2020/6/28 下午3:54, Richard Purdie wrote:
>>> On Sun, 2020-06-28 at 13:39 +0800, Chenxi Mao wrote:
>>>> vulkan didn't support directfb at all.
>>>> So remove this configuration if directfb enabled.
>>>>
>>>> Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
>>>> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
>>>> ---
>>>>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.16.2.bb
>>>> index 7a227fed51..aee001e641 100644
>>>> --- a/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.16.2.bb
>>>> +++ b/meta/recipes-multimedia/gstreamer/
>> gstreamer1.0-plugins-bad_1.16.2.bb
>>>> @@ -24,7 +24,7 @@ inherit gobject-introspection
>>>>  PACKAGECONFIG ??= " \
>>>>      ${GSTREAMER_ORC} \
>>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
>> d)} \
>>>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
>>>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '',
>> d)} \
>>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>>>>      bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming
>> sndfile \
>>> This doesn't look right since what if DISTRO_FEATURES contains just
>>> vulkan? This patch would stop vulkan being enabled when directfb isn't
>>> enabled if I read it correctly?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>> 
>>
