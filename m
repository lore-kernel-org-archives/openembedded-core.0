Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D357C60EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D1r72M000150
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 18:53:07 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 12 Sep 2013 18:53:07 -0700
Message-ID: <5232702F.5070701@windriver.com>
Date: Fri, 13 Sep 2013 09:53:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1378978986.git.Qi.Chen@windriver.com>
	<4802511117bc648d9cd10d8262645069d9db1317.1378978986.git.Qi.Chen@windriver.com>
	<20130912102503.GY11500@jama> <5231A2F4.7070107@windriver.com>
	<20130912121823.GZ11500@jama>
In-Reply-To: <20130912121823.GZ11500@jama>
X-Originating-IP: [128.224.162.233]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] update-rc.d.bbclass: change RRECOMMENDS to RDEPENDS
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
X-List-Received-Date: Fri, 13 Sep 2013 01:53:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2013 08:18 PM, Martin Jansa wrote:
> On Thu, Sep 12, 2013 at 07:18:12PM +0800, ChenQi wrote:
>> On 09/12/2013 06:25 PM, Martin Jansa wrote:
>>> On Thu, Sep 12, 2013 at 05:43:55PM +0800, Qi.Chen@windriver.com wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> If a package inherits update-rc.d.bbclass, it actually needs it to
>>>> update the symlinks under /etc/rc?.d/ directories. This is a runtime
>>>> dependency. For example, if we try to upgrade the dropbear on target,
>>>> its postinst process will need the update-rc.d utility available,
>>>> otherwise, the upgrade process will fail.
>>>>
>>>> Besides, if we only recommend update-rc.d, the do_rootfs process will
>>>> fail once NO_RRECOMMENDATIONS is enabled. Because in OE, we try to do
>>>> the postinsts at rootfs time.
>>> IIRC it was changed to allow systemd images to be built completely
>>> without update-rc.d (with BAD_RECOMMENDATIONS += "update-rc.d") and it's
>>> IMHO still valid use-case as update-rc.d is inherited even when systemd
>>> is used.
>>>
>> Now that the 'rm_sysvinit_initdir' function has been added to the
>> systemd.bbclass, I think we can safely use RDEPENDS here. Because
>> 1) If the /etc/init is removed, update-rc.d command in postinst has no
>> real effect.
>> 2) If the /etc/init is not removed, that means symlinks under
>> /etc/rc?.d/ should be set up.
>>
>> So I think there's no negative effect if update-rc.d is installed in
>> case of a systemd system.
>>
>> Also, I don't think adding update-rc.d to BAD_RECOMMENDATIONS is a good
>> idea.
>> For example, we have a systemd based image running and we are installing
>> a new package to that image. That package has an init script but no
>> corresponding service file. If we only recommend update-rc.d and it's in
>> BAD_RECOMMENDATIONS, the install process will fail. This is not what
>> user might expect.
>>
>> So I'd like to suggest that we change it back to RDEPENDS.
> commit 2c403979c03898c679c5a1e1092aec784dbeb77c
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Tue Mar 5 11:57:00 2013 +0000
>
> update-rcd: drop depends to recommends, check for update-rcd in scripts
>
> This class is still checking if update-rc.d is installed before using
> it, so nothing should fail terribly if image developer decides that he
> want's image without any sysvinit related stuff.
>
> If you want image which supports both you can add runtime dependency on
> update-rc.d somewhere else - it doesn't need to be pulled by every
> recipe which inherits update-rc.d bbclass.

Thanks, Martin.

I think I made a mistake.
The real cause is that in image.bbclass, the rootfs_uninstall_unneeded 
function tries to remove the update-rc.d package but it's not installed 
because NO_RECOMMENDATIONS is enabled.
I'm gonna remove update-rc.d from the uninstall list in that function.
Patch will be sent out soon.

Thanks a lot,
Chen Qi


>> Best Regards,
>> Chen Qi
>>
>>>> This patch fixes this problem by changing the RRECOMMENDS to RDEPENDS
>>>> to let the packages actually rdepend on update-rc.d.
>>>>
>>>> [YOCTO #5169]
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    meta/classes/update-rc.d.bbclass |    2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
>>>> index 5588569..3dee13a 100644
>>>> --- a/meta/classes/update-rc.d.bbclass
>>>> +++ b/meta/classes/update-rc.d.bbclass
>>>> @@ -6,7 +6,7 @@ UPDATERCD_virtclass-cross = ""
>>>>    UPDATERCD_class-native = ""
>>>>    UPDATERCD_class-nativesdk = ""
>>>>    
>>>> -RRECOMMENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
>>>> +RDEPENDS_${UPDATERCPN}_append = " ${UPDATERCD}"
>>>>    
>>>>    INITSCRIPT_PARAMS ?= "defaults"
>>>>    
>>>> -- 
>>>> 1.7.9.5
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


