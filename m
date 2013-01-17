Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvmBd-00021X-RV
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 10:55:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0H9dfHr009068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2013 01:39:41 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 17 Jan 2013 01:39:40 -0800
Message-ID: <50F7C6DA.9030502@windriver.com>
Date: Thu, 17 Jan 2013 17:39:38 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<4dc1347ed4057656a542263878aeeadf768dd2e9.1358406049.git.hongxu.jia@windriver.com>
	<50F7C020.8090505@intel.com>
In-Reply-To: <50F7C020.8090505@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gtk-icon-cache.bbclass:fix support postrm at image creation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 09:55:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2013 05:10 PM, Laurentiu Palcu wrote:
>
> On 01/17/2013 09:07 AM, Hongxu Jia wrote:
>>   gtk_icon_cache_postrm() {
>> +if [ "$D" != "" ]; then
>> +    for icondir in $D/usr/share/icons/* ; do
>> +        if [ -d $icondir ] ; then
>> +            gtk-update-icon-cache -qt  $icondir
>> +        fi
>> +    done
>> +    exit 0
>> +fi
> I think you can just exit 0 here and let the hook in intercept-scripts
> directory do the rest. The hook was added in the postinst and it will
> properly call gtk-update-icon-cache. If you look in the log.do_rootfs
> you'll see that the intercept scripts are run at the end (just look for
> "Running intercept scripts"). So, I don't think you need to do this loop
> here. Besides, it will be called for every postrm and running
> gtk-update-icon-cache is not cheap...
>
> Thanks,
> Laurentiu
Ok, I will work on it to let the hook in intercept-scripts do the rest.

Thanks,
Hongxu


