Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
 by mx.groups.io with SMTP id smtpd.web09.3411.1614144979641501221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 21:36:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=NyDCL1HT;
 spf=pass (domain: pr.hu, ip: 87.242.0.7, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1lEmqN-0003Wq-6K; Wed, 24 Feb 2021 06:36:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FdAeov6aleld6sC5NLIznviMXesFS2MFoFL/T+sbMJs=; b=NyDCL1HTBr8d1aQf9kd+LcJ7pB
	e3hhI+NFgL0zEc6kJPHy3a39xN69M2YcHCK0hgfEGOi7WX9tRIiK5dHSlTWgR6TbcEQ4secXbKdpd
	CLd+BALtpiPTUiROodUrJNIRxU4dCbOFPWPxRLlW9BMVZmkCmz5pQf4qNMn8U7dYQRIZvaAtEX3lT
	vfajTB8/YFeNppXfcX8wCeiB7o0+TwKMqof7dMhqBJFBB8L3gx46SynqokApvU3aq7KteDlNoY/q5
	OFSWZoaDZ+DHdPYtXei2dj02X8Te441RVuXC/neCF59xLmsfu3ieRMu6BuUsebDX6O6eEvBOXUTjE
	+OAAJdDA==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1lEmqI-0004ju-Lh; Wed, 24 Feb 2021 06:36:13 +0100
Subject: Re: [OE-core][PATCH] mesa: Allow building the iris driver
To: Yongxin Liu <yongxin.liu@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <1664CBDF366E1544.31496@lists.openembedded.org>
 <PH0PR11MB517551B295DA5D06BAD7A144E59F9@PH0PR11MB5175.namprd11.prod.outlook.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <3a1b9a3d-2a57-2ced-2a1d-77293a14b6b4@pr.hu>
Date: Wed, 24 Feb 2021 06:36:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB517551B295DA5D06BAD7A144E59F9@PH0PR11MB5175.namprd11.prod.outlook.com>
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 89785d021493d0bbdcf3f583b5839e9c
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210224053613Z
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

2021. 02. 24. 1:31 keltezéssel, Yongxin Liu írta:
> 
> Iris driver supports Broadwell and newer (Gen8+) for very low CPU overhead.
> 
> With this patch, user can add PACKAGECONFIG_append = " iris" in their bbappend file.
> 
> And then iris will be added in build options, like "-Dgallium-drivers=swrast,virgl,iris".
> You can check mesa/2_20.3.2-r0/build/meson-logs/meson-log.txt for this.
> 
> The driver can be found in build directory: mesa/2_20.3.2-r0/image/usr/lib64/dri/iris_dri.so
> 
> 
> Thanks,
> Yongxin

Since VAR_append can appear multiple times,
bbappend files can equally do

GALLIUMDRIVERS_append_x86_class-target = ",iris"
GALLIUMDRIVERS_append_x86-64_class-target = ",iris"

instead of this PACKAGECONFIG.

Anyway, since this MR exists in Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/8015
after a certain point this will have to be used in the
upstream recipe (pseudo-patch follows):

...
-DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
...
+GALLIUMDRIVERS_append_x86_class-target = ",nouveau,i915,iris"
+GALLIUMDRIVERS_append_x86-64_class-target = ",nouveau,i915,iris"
...

Best regards,
Zoltán Böszörményi

> 
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yongxin Liu
>> Sent: Thursday, February 18, 2021 16:56
>> To: openembedded-core@lists.openembedded.org;
>> richard.purdie@linuxfoundation.org
>> Subject: [OE-core][PATCH] mesa: Allow building the iris driver
>>
>> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
>> graphics/mesa/mesa.inc
>> index cb075a8b89..72e22d654e 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -168,6 +168,9 @@ GALLIUMDRIVERS_append
>> ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
>>   PACKAGECONFIG[panfrost] = ""
>>   GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost',
>> ',panfrost', '', d)}"
>>
>> +PACKAGECONFIG[iris] = ""
>> +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'iris',
>> ',iris', '', d)}"
>> +
>>   OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium',
>> 'classic', d)}"
>>   PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
>>
>> --
>> 2.14.5
> 
> 
> 
> 
> 

