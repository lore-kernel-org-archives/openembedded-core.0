Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A6EED600AC;
	Fri, 10 Jan 2014 01:53:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0A1rWBi008395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Jan 2014 17:53:32 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 9 Jan 2014 17:53:32 -0800
Message-ID: <52CF52B4.6030104@windriver.com>
Date: Fri, 10 Jan 2014 09:53:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20140106221511.568935049A@opal> <20140109115419.GE3709@jama>
In-Reply-To: <20140109115419.GE3709@jama>
X-Originating-IP: [128.224.162.164]
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : initscripts: split the functions script into a separate package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 01:53:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2014 07:54 PM, Martin Jansa wrote:
> On Mon, Jan 06, 2014 at 10:15:11PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 736dd8380f41d6ff1d3d0e4fe33cc01e2e873ef6
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=736dd8380f41d6ff1d3d0e4fe33cc01e2e873ef6
>>
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Mon Jan  6 15:27:34 2014 +0800
>>
>> initscripts: split the functions script into a separate package
>>
>> Many SysV init scripts need the /etc/init.d/functions script. But
>> this script is part of the initscripts package. As a result, the
>> initscripts package should always be installed into the system to
>> avoid errors when starting daemons. However, it makes no sense to
>> install the initscripts package into a systemd based image, because
>> what the init scripts provide has already been provided by the systemd.
>> On the other hand, the functions script might be still needed in a
>> systemd based image because other init scripts such as distcc might need
>> it.
>>
>> The above situation leads to a natural separation of the functions script
>> from the initscripts package. And this patch does so. It separates the
>> functions script into initscripts-functions packages.
> FYI: In cases where alternative initscripts are used (and
> VIRTUAL-RUNTIME_initscripts) respected, these alternatives also need to
> rprovide initscripts-functions (or at least u-a for functions), otherwise
> u-a fails in do_rootfs which is fatal for read-only:
>
> | ERROR: The following packages could not be configured offline and
> rootfs is read-only: initscripts-functions
>

Thanks a lot for your information.

Best Regards,
Chen Qi

>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-core/initscripts/initscripts_1.0.bb | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> index 5951e0c..d1644a3 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -42,8 +42,12 @@ KERNEL_VERSION = ""
>>   inherit update-alternatives
>>   DEPENDS_append = " update-rc.d-native"
>>   
>> -ALTERNATIVE_PRIORITY = "90"
>> -ALTERNATIVE_${PN} = "functions"
>> +PACKAGES =+ "${PN}-functions"
>> +RDEPENDS_${PN} = "${PN}-functions"
>> +FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
>> +
>> +ALTERNATIVE_PRIORITY_${PN}-functions = "90"
>> +ALTERNATIVE_${PN}-functions = "functions"
>>   ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>>   
>>   HALTARGS ?= "-d -f"
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits


