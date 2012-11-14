Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TYj2T-0002Pf-2W
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 20:54:21 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 11:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="242264990"
Received: from elitebook.jf.intel.com (HELO [10.7.202.56]) ([10.7.202.56])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2012 11:39:15 -0800
Message-ID: <50A3F364.1010509@intel.com>
Date: Wed, 14 Nov 2012 21:39:16 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
	<50A2D2BD.9090703@linux.intel.com>
In-Reply-To: <50A2D2BD.9090703@linux.intel.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Wed, 14 Nov 2012 19:54:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2012 01:07 AM, Saul Wold wrote:
> On 11/13/2012 01:12 PM, Radu Moisan wrote:
>> Allows you to use as root a partition instead of the rootfs.img
>> for recovering an old install, and fails safe when no rootfs is
>> found, dropping the user to a shell if something goes wrong.
>>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
>> ---
>>   meta/recipes-core/initrdscripts/files/init-live.sh |   44 
>> +++++++++++++++++++-
>>   1 file changed, 42 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh 
>> b/meta/recipes-core/initrdscripts/files/init-live.sh
>> index 5682fd1..81686b9 100644
>> --- a/meta/recipes-core/initrdscripts/files/init-live.sh
>> +++ b/meta/recipes-core/initrdscripts/files/init-live.sh
>> @@ -68,13 +68,49 @@ fatal() {
>>
>>   early_setup
>>
>> +# wait for the udevd to settle
>> +echo "Waiting for udev to settle..."
>> +udevadm settle --timeout=3
>> +
> Why are you still adding in the timeout?  This still could have 
> adverse affects on some machines, just let settle do it's job.
>
> Sau!
>
Well, I didn't see any side effects. If there are side effects I'll 
remove the timeout but please point out to me some of those. Anyway, I 
thought about this more like a safety net because I've noticed "settle" 
has some history with hanging the system boot more that it should in 
some circumstances.

Radu


