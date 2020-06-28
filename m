Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com [115.124.28.76])
 by mx.groups.io with SMTP id smtpd.web10.24785.1593333538343908322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 01:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: eswin.com, ip: 115.124.28.76, mailfrom: maochenxi@eswin.com)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.05358547|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0176129-0.0112261-0.971161;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03306;MF=maochenxi@eswin.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.HtsORxB_1593333532;
Received: from 10.1.56.17(mailfrom:maochenxi@eswin.com fp:SMTPD_---.HtsORxB_1593333532)
          by smtp.aliyun-inc.com(10.194.97.171);
          Sun, 28 Jun 2020 16:38:53 +0800
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-bad: don't select vulkan if directfb enabled.
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: chenxi.mao2013@gmail.com
References: <20200628053943.906548-1-maochenxi@eswin.com>
 <20200628053943.906548-2-maochenxi@eswin.com>
 <27f412b9914cfc57e36f34fd6e4e7d3119db4b76.camel@linuxfoundation.org>
From: "Chenxi Mao" <maochenxi@eswin.com>
Message-ID: <79dd22e5-fd7b-c878-8598-a4064b818eaf@eswin.com>
Date: Sun, 28 Jun 2020 16:38:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <27f412b9914cfc57e36f34fd6e4e7d3119db4b76.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard:

If I set directfb only in DISTRO_FEATURES, the vulkan will be enabled
in gstreamer, that will cause the build break.
The root cause is the vulkan didn't support directfb.
So I remove this vulkan if directfb enabled.

Another solution is separate the directfb with directfb. Like below:
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \

Chenxi

On 2020/6/28 下午3:54, Richard Purdie wrote:
> On Sun, 2020-06-28 at 13:39 +0800, Chenxi Mao wrote:
>> vulkan didn't support directfb at all.
>> So remove this configuration if directfb enabled.
>>
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
> This doesn't look right since what if DISTRO_FEATURES contains just
> vulkan? This patch would stop vulkan being enabled when directfb isn't
> enabled if I read it correctly?
>
> Cheers,
>
> Richard
>
>
> 
