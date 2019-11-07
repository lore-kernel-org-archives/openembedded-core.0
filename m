Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id D465D7F844
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:32:00 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id C43F15C0B0C;
	Thu,  7 Nov 2019 09:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573115520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=N23D3pYEn7WFN3twifO3psmEI7BcLQnxWM2Xan91YXE=;
	b=LamLVGuz46WMgcSJnZPRRQuD3ovpvSXw/RVkmTXh+haSHZByVEfrN4c1CzLSGy748qJWUQ
	LueX1/PMbxK7q9Q3Id0Zfcq3RwyF7azDUSHlVNov2s6xiPK2NSsHe7sf6YJQhg+Roat5uZ
	kvP8N+ATsy6yFhGkDvaM1MRwWgSjFeM=
MIME-Version: 1.0
Date: Thu, 07 Nov 2019 09:32:00 +0100
From: Stefan Agner <stefan@agner.ch>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <ae023dca562212e71e4d9c6279a439936514be4f.camel@linuxfoundation.org>
References: <20191106134305.12109-1-stefan@agner.ch>
	<ae023dca562212e71e4d9c6279a439936514be4f.camel@linuxfoundation.org>
Message-ID: <0dc7de5c5f200f1f146db2405846ee23@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Thu, 07 Nov 2019 08:32:01 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-11-07 09:01, Richard Purdie wrote:
> On Wed, 2019-11-06 at 13:43 +0000, Stefan Agner wrote:
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Add Zstandard (or just Zstd) compression support. This allows to
>> create Zstd compressed tarballs by using tar.zst as IMAGE_FSTYPES.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  meta/classes/image_types.bbclass | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 2eeffbb366..d29b9c5787 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -59,6 +59,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>>
>>  ZIP_COMPRESSION_LEVEL ?= "-9"
>>
>> +ZSTD_COMPRESSION_LEVEL ?= "-3"
>> +
>>  JFFS2_SUM_EXTRA_ARGS ?= ""
>>  IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.jffs2 ${EXTRA_IMAGECMD}"
>>
>> @@ -269,7 +271,7 @@ IMAGE_TYPES = " \
>>      hddimg \
>>      squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>>      ubi ubifs multiubi \
>> -    tar tar.gz tar.bz2 tar.xz tar.lz4 \
>> +    tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>>      wic wic.gz wic.bz2 wic.lzma \
>>      container \
>> @@ -282,7 +284,7 @@ IMAGE_TYPES = " \
>>  # CONVERSION_CMD/DEPENDS.
>>  COMPRESSIONTYPES ?= ""
>>
>> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>  CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> @@ -290,6 +292,7 @@ CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> +CONVERSION_CMD_zst = "zstd -f -k -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
>>  CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>>  CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
>>  CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
>> @@ -310,6 +313,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>>  CONVERSION_DEPENDS_lzo = "lzop-native"
>>  CONVERSION_DEPENDS_zip = "zip-native"
>> +CONVERSION_DEPENDS_zst = "zstd-native"
>>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
> 
> I was ok with this despite not having zstd-native in OE-Core however
> our automated testing is cleverer than I remembered:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/467
> 
> so we may need to skip this option in the test...
> 
> (oe-selftest -r imagefeatures.ImageFeatures.test_image_fstypes should
> reproduce)

Hm, I see, so we could fix that test.

However, how about moving zstd into core? There are already several
recipe in core making use of Zstd (optionally): mtd-utils, btrfs-tools
and squashfs-tools...

--
Stefan

