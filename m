Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com [115.124.28.76])
 by mx.groups.io with SMTP id smtpd.web12.6089.1593480866140621309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: eswin.com, ip: 115.124.28.76, mailfrom: maochenxi@eswin.com)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.05621811|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0127686-0.00690651-0.980325;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03278;MF=maochenxi@eswin.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.HurpNdl_1593480861;
Received: from 10.1.56.17(mailfrom:maochenxi@eswin.com fp:SMTPD_---.HurpNdl_1593480861)
          by smtp.aliyun-inc.com(10.194.97.246);
          Tue, 30 Jun 2020 09:34:21 +0800
Subject: Re: [OE-core] [PATCH] [dunfell][master]: don't select vulkan if directfb enabled.
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 chenxi.mao2013@gmail.com
References: <20200628033328.653958-1-maochenxi@eswin.com>
 <20200628033328.653958-2-maochenxi@eswin.com>
 <CAJ86T=Ur51tgYNgjn94feaXcVxeT1uA2t8aSXkPgD5x0DuZaLg@mail.gmail.com>
From: "Chenxi Mao" <maochenxi@eswin.com>
Message-ID: <29344369-e841-f8aa-278f-4332889d0d8e@eswin.com>
Date: Tue, 30 Jun 2020 09:34:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Ur51tgYNgjn94feaXcVxeT1uA2t8aSXkPgD5x0DuZaLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Andre:

My reproduce step as below:


I enable directfb and vulkan id DISTRO_FEATURES with QT5.15

Then during vulkan build, it has error message show that the vulkan didn't support directfb.

If I remove vulkan in DISTRO_FEATURES, the build will be passed.


Chenxi


On 2020/6/30 上午12:47, Andre McCurdy wrote:
> On Sat, Jun 27, 2020 at 8:33 PM Chenxi Mao <maochenxi@eswin.com> wrote:
>> vulkan didn't support directfb at all.
>> So remove this configuration if directfb enabled.
> This change doesn't look right. Passing two values to
> bb.utils.filter() doesn't imply any dependency between them.
>
> Can you explain what problem you have seen and how to reproduce it?
>
>> Change-Id: Ia0af5d944e858fbb99a07fcd5f10ab831a93b2d0
>> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
>> ---
>>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb                | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
>> index 7a227fed51..aee001e641 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
>> @@ -24,7 +24,7 @@ inherit gobject-introspection
>>  PACKAGECONFIG ??= " \
>>      ${GSTREAMER_ORC} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
>> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>>      bz2 closedcaption curl dash dtls hls rsvg sbc smoothstreaming sndfile \
>> --
>> 2.25.1
>>
>> 
