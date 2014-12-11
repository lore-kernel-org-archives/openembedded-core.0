Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4C365D59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 10:45:58 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so2040547ykp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=XEkJoom8QMhuZPtBMDxQYc+kF9I3+cEKL/UOjE0D/YE=;
	b=lNpvydpqVuJyqNLd8N6L0ip4buY182IXkJM77mwI2jJOQ4BkiDQp5EKo6vCznkP01q
	Qr6iIlpcHCrU68vnZlHi29uN1eNeY2kKaadknZti4hKTJbCQivXHihHDMK1B38LqGkJj
	5hdJqZfpfrf2bigHKHOFxj7QWiUIrpr0GftF/NF+ld/yJjQX335mO0k+mFzdSjUmaI28
	r2zRf4r9iTJs/G53RktROAtldBuUr5Ingi2yvvCWUyGhJ5pWb7hwoiClEKPiQG1NcTnx
	ceOnKgJ+BPLP3emSL8lOPZbURphWHHAX+NrahKpo7t3fBS0Ff4a4w2C5RUEf/DGHcMR0
	F2vQ==
MIME-Version: 1.0
X-Received: by 10.236.39.139 with SMTP id d11mr6715452yhb.90.1418294759188;
	Thu, 11 Dec 2014 02:45:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 11 Dec 2014 02:45:59 -0800 (PST)
In-Reply-To: <BY2PR03MB44187D33B5EB91410C3C74C84630@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1417672165-6155-1-git-send-email-B40290@freescale.com>
	<CAP9ODKpHKqsGyss0VaHzr9sAV-LqELrVBDW-o49Lv5EO0rPuHQ@mail.gmail.com>
	<BY2PR03MB44187D33B5EB91410C3C74C84630@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Thu, 11 Dec 2014 08:45:59 -0200
X-Google-Sender-Auth: s34cibKSyozX27_JiuNxW6tqmvs
Message-ID: <CAP9ODKqnvTR+OPA27Fsir1bj7C3yiw-kvhxRTS_i39K3qyeGwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] u-boot.inc : add compile multiple u-boot feature
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
X-List-Received-Date: Thu, 11 Dec 2014 10:45:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 11, 2014 at 1:34 AM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Hello Otavio,
> Sorry for my late reply.
> Thanks  for  your review .
> I have submitted  v4  of  the  patchest.
>
...

Comments below...

>>      if [ "x${UBOOT_ENV}" != "x" ]
>>      then
>> @@ -93,21 +100,36 @@ do_install () {
>>  FILES_${PN} = "/boot ${sysconfdir}"
>>
>>  do_deploy () {
>> -    install -d ${DEPLOYDIR}
>> -    install ${S}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>> -
>> -    cd ${DEPLOYDIR}
>> -    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
>> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
>> -    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
>> -
>> -    if [ "x${SPL_BINARY}" != "x" ]
>> -    then
>> -        install ${S}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
>> -        rm -f ${DEPLOYDIR}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_SYMLINK}
>> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARY}
>> -        ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
>> -    fi
>> +    for type in ${UBOOT_MACHINE}; do
>> +        for imagetype in in ${UBOOT_CONFIG}; do
>> +            if [ "${imagetype}"x = "in"x ]
>> +            then
>> +                continue
>> +            fi
>> +            if [ -d "${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}"]
>> +            then
>> +                break
>> +            else
>> +                install -d ${DEPLOYDIR}
>> +                install ${S}/${type}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}
>> +                if [ "${imagetype}"x = "sd"x ] || [ "${imagetype}"x = "mfgtool"x ]
>> +                then
>> +                    cp  ${DEPLOYDIR}/u-boot-${imagetype}.${UBOOT_SUFFIX}  ${DEPLOYDIR}/u-boot-${MACHINE}.${UBOOT_SUFFIX}
>> +                fi
>> +            fi
>
> Way nicer (and should have some similar code on the install and compile tasks) however I didn't get why you're adding the 'sd' or 'mfgtool' specific case here. This is a FSL specific thing and shouldn't be part of OE-Core.
>
> [ I use default link of last type uboot  of "UBOOT_CONFIG"   to fix the following error:
>
> * difficulty to figure the binary when generating the rootfs: in meta-fsl-arm, for example, we generate the .sdcard rootfs and using the patch we now have...
>
> ERROR: Error: The image creation script
> '.../tmp/work/imx6qsabresd-oel-linux-gnueabi/core-image-minimal/1.0-r0/temp/create_image.sdcard'
>
> ]

Right I am wondering if we ought to do this or not. This is a FSL
specific code and I will try to think in a way to improve it at
meta-fsl-arm side ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

