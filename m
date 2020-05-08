Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2905.1588901644248392578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 18:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0481Y1mP001669
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 7 May 2020 18:34:01 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May
 2020 18:34:00 -0700
Subject: Re: [OE-core] [PATCH 2/2] encodings: RDEPEND on mkfontdir mkfontscale
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20200507074536.10631-1-yi.zhao@windriver.com>
 <20200507074536.10631-2-yi.zhao@windriver.com>
 <ed0808536320e40836ab5c90b842e32d97a0199f.camel@linuxfoundation.org>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <e3277848-6b7d-0db3-e5eb-a7986a6eee55@windriver.com>
Date: Fri, 8 May 2020 09:33:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ed0808536320e40836ab5c90b842e32d97a0199f.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/7/20 6:43 PM, Richard Purdie wrote:
> On Thu, 2020-05-07 at 15:45 +0800, Yi Zhao wrote:
>> Fix pkg_postinst error when install encodings via online repo:
>>
>> $ opkg install encodings
>> Installing encodings (1.0.5) on root
>> Configuring encodings.
>> /var/lib/opkg/info/encodings.postinst: line 7: mkfontdir: not found
>> Collected errors:
>> * pkg_run_script: package "encodings" postinst script returned status 127.
>> * opkg_configure: encodings.postinst returned 127.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> index a39609b5da..b161a46982 100644
>> --- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> +++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
>> @@ -10,7 +10,7 @@ PE = "1"
>>   PR = "${INC_PR}.1"
>>   
>>   DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
>> -RDEPENDS_${PN} = ""
>> +RDEPENDS_${PN} = "mkfontdir mkfontscale"
>>   
>>   SRC_URI += "file://nocompiler.patch"
>>   SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"
> I don't think these two patches are correct. encodings doesn't install
> these things so perhaps it shouldn't be running these postinst at all?

Yes, encdings doesn't need postinst at all.


//Yi


>
> I thought I remembered something about this change:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b8f089512f65a4a131c8096c281c4f3d9cf23718
>
> from 2013! Sadly the commit log is a bit sparse.
>
> Cheers,
>
> Richard
>
