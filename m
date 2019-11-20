Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 81C5F7F79D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 12:27:23 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9AF945C1EF6;
	Wed, 20 Nov 2019 13:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574252843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=vYSCCKvYAyQb4Aw8hnNA4sJxmiR0NGi8imkcUshyjnw=;
	b=EhNUjKrN5Bs8ZA6orfE6rCJvL63HQjZk+2bBLN/9H/wpgZpkbE8oK1sj7vTWRjyi1Sovl9
	kZl4mIebrCOE2KKZAsUzhAx6i2OQ8+woORUfw4jb0Ry7QfImdQ1cSafqQIuWV2QkWWOchj
	hb5XVlJEi93NUzLkEIuA6HkV/5UfZmo=
MIME-Version: 1.0
Date: Wed, 20 Nov 2019 13:27:23 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <CAO5Uq5QxwF+GQgFNndMZEWor3i08So4v2rO3JjXq4erg=TDLLw@mail.gmail.com>
References: <20191120091258.30350-1-stefan@agner.ch>
	<20191120091258.30350-2-stefan@agner.ch>
	<CAO5Uq5QxwF+GQgFNndMZEWor3i08So4v2rO3JjXq4erg=TDLLw@mail.gmail.com>
Message-ID: <3313d2525c034dd1f4b9f3b32d940a3f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] image_types: add Zstandard conversion support
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
X-List-Received-Date: Wed, 20 Nov 2019 12:27:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-11-20 11:49, Alex Kiernan wrote:
> On Wed, Nov 20, 2019 at 9:13 AM Stefan Agner <stefan@agner.ch> wrote:
>>
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
> 
> Add -T0 so we default to parallel?

Sensible, will send a v5.

--
Stefan

