Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SU6ar-0008Ky-6f
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 03:30:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4F1KMxX028283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 May 2012 18:20:22 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 18:20:22 -0700
Message-ID: <4FB1AF54.1010905@windriver.com>
Date: Tue, 15 May 2012 09:20:20 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
References: <cover.1336983006.git.liezhi.yang@windriver.com>
	<b82a9a6f0dd12135e53eedc75b0833ce7dfb3eab.1336983006.git.liezhi.yang@windriver.com>
	<50E29635-2A3A-4D94-8826-EBF3846E3638@dominion.thruhere.net>
In-Reply-To: <50E29635-2A3A-4D94-8826-EBF3846E3638@dominion.thruhere.net>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/2] rootfs_rpm.bbclass: save rpmlib rather than remove it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 01:30:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/14/2012 05:44 PM, Koen Kooi wrote:
> Op 14 mei 2012, om 10:11 heeft Robert Yang het volgende geschreven:
>
>> The rpmlib was removed when core-image-minimal,
>
> Please replace 'core-image-minimal' with something like:
>
> 	images that add "remove_packaging_data_files ; " to  ROOTFS_POSTPROCESS_COMMAND
>
> That points out the actual problem instead of having to guess what core-image-minimal is doing 'wrong' to need this patch.
>

Thanks, I've updated the commit message and pushed to:

git://git.pokylinux.org/poky-contrib robert/inc_rpm
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_rpm

The current message is:

The rpmlib was removed when images that add
"remove_packaging_data_files" to ROOTFS_POSTPROCESS_COMMAND, which would
make the increment rpm image generation doesn't work in the second
build, since list_installed_packages would get incorrect value in the
second build, move the rpmlib to ${T} rather than remove it, and move it
back when INC_RPM_IMAGE_GEN =1.

// Robert

>
>> which would make the
>> increment rpm image generation doesn't work in the second build, since
>> list_installed_packages would get incorrect value in the second build,
>> move the rpmlib to ${T} rather than remove it, and move it back when
>> INC_RPM_IMAGE_GEN =1.
>>
>> [YOCTO #2440]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>> meta/classes/image.bbclass      |    6 ++++++
>> meta/classes/rootfs_rpm.bbclass |    6 +++++-
>> 2 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 4610731..b5fca32 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -142,6 +142,12 @@ fakeroot do_rootfs () {
>>      # When use the rpm incremental image generation, don't remove the rootfs
>>      if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
>>          rm -rf ${IMAGE_ROOTFS}
>> +    elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
>> +        # Move the rpmlib back
>> +        if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
>> +                mkdir -p ${IMAGE_ROOTFS}/var/lib/
>> +                mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
>> +        fi
>>      fi
>> 	rm -rf ${MULTILIB_TEMP_ROOTFS}
>> 	mkdir -p ${IMAGE_ROOTFS}
>> diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
>> index 9039b21..fbc46c0 100644
>> --- a/meta/classes/rootfs_rpm.bbclass
>> +++ b/meta/classes/rootfs_rpm.bbclass
>> @@ -154,7 +154,11 @@ EOF
>> }
>>
>> remove_packaging_data_files() {
>> -	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
>> +	# Save the rpmlib for increment rpm image generation
>> +	t="${T}/saved_rpmlib/var/lib"
>> +	rm -fr $t
>> +	mkdir -p $t
>> +	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
>> 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
>> }
>>
>> --
>> 1.7.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


