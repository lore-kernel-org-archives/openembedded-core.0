Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZfcD-00019t-8z
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:59:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r47AfNP9008235
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 03:41:24 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 03:41:22 -0700
Message-ID: <5188DA4E.8050603@windriver.com>
Date: Tue, 7 May 2013 18:41:18 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1367921762.git.liezhi.yang@windriver.com>
	<7d839cdf354d6851be9c20c391344ce21413cf45.1367921762.git.liezhi.yang@windriver.com>
	<3028968.i58Z539hxi@helios>
In-Reply-To: <3028968.i58Z539hxi@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image_types.bbclass: remove the obsolete images
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
X-List-Received-Date: Tue, 07 May 2013 10:59:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/07/2013 06:32 PM, Paul Eggleton wrote:
> On Tuesday 07 May 2013 18:26:59 Robert Yang wrote:
>> Remove the obsolete image before the new one generated to save disk
>> space when RM_OBSOLETE_IMAGE is set to 1, this is an easy way to keep
>> the DEPLOY_DIR_IMAGE clean.
>>
>> [YOCTO #4391]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/image_types.bbclass     | 6 +++++-
>>   meta/conf/local.conf.sample.extended | 3 +++
>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass index 94837ae..27f232e 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -51,7 +51,11 @@ def get_imagecmds(d):
>>           types.remove("live")
>>
>>       if d.getVar('IMAGE_LINK_NAME', True):
>> -        cmds += "\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
>> +        if d.getVar('RM_OBSOLETE_IMAGE', True) == "1":
>> +            # Remove the obsolete image
>> +            cmds += "\trm -f `find ${DEPLOY_DIR_IMAGE} -maxdepth 1 -type l
>> -name ${IMAGE_LINK_NAME}'.*' -exec readlink -f {} \;`" +        # Remove
>> the symlink
>> +        cmds += "\n\trm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
>>
>>       for type in types:
>>           ccmd = []
>> diff --git a/meta/conf/local.conf.sample.extended
>> b/meta/conf/local.conf.sample.extended index 1d1a8ec..efe0804 100644
>> --- a/meta/conf/local.conf.sample.extended
>> +++ b/meta/conf/local.conf.sample.extended
>> @@ -207,3 +207,6 @@
>>   #ARCHIVER_MODE[filter] ?= "no"
>>   #ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE !=
>> 'none' else ''}" #INHERIT += "${ARCHIVER_CLASS}"
>> +
>> +# Remove the obsolete image before the new one generated to save disk space
>> +#RM_OBSOLETE_IMAGE = "1"
>
> Rather than "obsolete" I would have said "old" would be the preferred
> terminology here, i.e. RM_OLD_IMAGE.
>

Thanks, I've updated the git repo:

   git://git.pokylinux.org/poky-contrib robert/rm_old
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rm_old

// Robert


> Cheers,
> Paul
>


