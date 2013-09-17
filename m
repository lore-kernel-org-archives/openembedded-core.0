Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0B8460A88
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:08:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8HB85Oc025875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 04:08:05 -0700 (PDT)
Received: from [128.224.22.106] (128.224.22.106) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 17 Sep 2013 04:08:05 -0700
Message-ID: <52383813.90404@windriver.com>
Date: Tue, 17 Sep 2013 06:08:03 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-6-git-send-email-jason.wessel@windriver.com>
	<1379352638.1285.154.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379352638.1285.154.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 5/7] bootimage.bbclass, grub-efi.bbclass: Improve EFI & PCBIOS+EFI ISO support
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
X-List-Received-Date: Tue, 17 Sep 2013 11:08:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/16/2013 12:30 PM, Darren Hart wrote:
> On Fri, 2013-09-13 at 19:09 -0500, Jason Wessel wrote:
>> -	if [ "${PCBIOS}" = "1" ]; then
>> +	# EFI only
>> +	if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
>> +		mkdir -p ${ISODIR}/${ISOLINUXDIR}
>> +		install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> 
> If it's EFI-only, we copy isolinux.bin over? I was under the impression
> isolinux.bin was a PCBIOS thing (specifically an executable that
> wouldn't even work in an EFI environment). How is this used with an
> EFI-only image? What am I missing?


There is a bug/feature in the isohybrid that requires it to be in the catalog.  I couldn't figure out how to work around it, so I left it in there.  The EFI firmware skips right over it anyway.  I can add a comment to the bbclass to this effect.



> 
>> +	fi
>> +
>> +	if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
>> +		# PCBIOS only media
>>  		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>>  		        -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.iso \
>>  			-b ${ISO_BOOTIMG} -c ${ISO_BOOTCAT} -r \
>>  			${MKISOFS_OPTIONS} ${ISODIR}
>>  	else
>> -		bbnote "EFI-only ISO images are untested, please provide feedback."
>> -		mkisofs -V ${BOOTIMG_VOLUME_ID} \
>> +		# EFI only OR EFI+PCIBIOS
> 
> Nit: s/PCIBIOS/PCBIOS/


Oops, all fixed in v3. :-)

Jason.


