Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1U5DCb-0006Xu-4Z
	for Openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 11:35:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1CAJ2AK021684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Feb 2013 02:19:02 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 02:19:00 -0800
Message-ID: <511A1714.7090205@windriver.com>
Date: Tue, 12 Feb 2013 04:19:00 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <1360624949-43859-1-git-send-email-jason.wessel@windriver.com>
	<5119F8A9.8080603@intel.com>
In-Reply-To: <5119F8A9.8080603@intel.com>
X-Enigmail-Version: 1.5
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] relocate_sdk.py: improvements
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
X-List-Received-Date: Tue, 12 Feb 2013 10:35:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 02/12/2013 02:09 AM, Laurentiu Palcu wrote:
>
>
> On 02/12/2013 01:22 AM, Jason Wessel wrote:
>> Now that I have had to debug the SDK relocator on multiple occasions
>> I figure it might be nice to get the patches upstreamed.
> But, before that, did you see my comments on the previous patchset? It
> looks like they went unnoticed as they were not addressed.
>
> Here is what I replied to your previous patches:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034868.html
> http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/034869.html

For what ever reason I never received the original mails, else I absolutely would have responded.  This is the first response I have received from the oe-core list in months in fact.

To answer your question you posed in the threads above, I'll do it right here due to the lack of the originals.

>> - dl_path = new_dl_path + "\0" * (p_filesz - len(new_dl_path))
> Personally, I would prefer you left the zero padding in place.
> Otherwise, if installing in a location like /opt/test the .interp
> section would look like below. Technically, the dynamic loader would not
> care but it would be nice to have a clean .interp section, without
> leftover strings in it...
>
> This is how it would look like after relocation:
> $ readelf -p .interp qemu-arm
>
> String dump of section '.interp':
> [ 0] /opt/test/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
> [ 41] -x86-64.so.2


I completely agree with you.  This will be fixed in v3.

>> +echo "#!/bin/bash" > ${env_setup_script%/*}/relocate_sdk.sh
>> +echo exec $SUDO_EXEC ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl_path $executable_files >> ${env_setup_script%/*}/relocate_sdk.sh
>> +chmod 755 ${env_setup_script%/*}/relocate_sdk.sh
> The last 3 lines will certainly fail if installation takes place in a
> location you don't have rights... So, you'll end up with no
> relocate_sdk.sh script.

Easy enough to fix, I'll fix this shortly.  Many thanks for your comments.

Cheers,
Jason.




