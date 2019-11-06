Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA277E093
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 13:26:53 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 0BAE35C05EA;
	Wed,  6 Nov 2019 14:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1573046814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=WpTNruJR1zmdJiW7Oh0Cfk2cOYQnPGDDNIkYp+eg88w=;
	b=F76HQrnx7PyJsb2H2yPikE3/BeTuAH96EaRHlfmWD7dsek3sjY+JwYDYXkaisflHP4NM67
	LU98txDD3/AQNEjsEigZ8eQsSWXK+gHKXTpS8P85KuveMimEDcdDh8wAwhc4hTRnmyz0Rb
	rD0IjllLw7TwAu6gXZbF/S+/ZW8GcwQ=
MIME-Version: 1.0
Date: Wed, 06 Nov 2019 14:26:53 +0100
From: Stefan Agner <stefan@agner.ch>
To: Andre McCurdy <armccurdy@gmail.com>
In-Reply-To: <CAJ86T=U5v4cgVpR9x+x=+kwXKg4X6Z4zxeS0ACddxg3xXgk8jg@mail.gmail.com>
References: <20191105231253.15448-1-stefan@agner.ch>
	<CAJ86T=U5v4cgVpR9x+x=+kwXKg4X6Z4zxeS0ACddxg3xXgk8jg@mail.gmail.com>
Message-ID: <496d30aa3eed1337ec91c61a53c3d11e@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: add Zstandard conversion support
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
X-List-Received-Date: Wed, 06 Nov 2019 13:26:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Andre,

On 2019-11-06 02:25, Andre McCurdy wrote:
> On Tue, Nov 5, 2019 at 3:13 PM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Add Zstandard (or just Zstd) compression support. This allows to
>> create Zstd compressed tarballs by using tar.zst as IMAGE_FSTYPES.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  meta/classes/image_types.bbclass | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 2eeffbb366..eeae652e02 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -269,7 +269,7 @@ IMAGE_TYPES = " \
>>      hddimg \
>>      squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
>>      ubi ubifs multiubi \
>> -    tar tar.gz tar.bz2 tar.xz tar.lz4 \
>> +    tar tar.gz tar.bz2 tar.xz tar.lz4 tar.zst \
>>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>>      wic wic.gz wic.bz2 wic.lzma \
>>      container \
>> @@ -282,7 +282,7 @@ IMAGE_TYPES = " \
>>  # CONVERSION_CMD/DEPENDS.
>>  COMPRESSIONTYPES ?= ""
>>
>> -CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>> +CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
>>  CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>  CONVERSION_CMD_gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>>  CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> @@ -290,6 +290,7 @@ CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=
>>  CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
>>  CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>>  CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>> +CONVERSION_CMD_zst = "zstd -f -k -c ${ZSTD_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zst"
> 
> Where is ZSTD_COMPRESSION_LEVEL defined?
> 

Oh good catch, I got distracted halfway during the implementation it
seem :-)

I guess since it was not defined it did not break...

Will send a v2.

--
Stefan

>>  CONVERSION_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>>  CONVERSION_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
>>  CONVERSION_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
>> @@ -310,6 +311,7 @@ CONVERSION_DEPENDS_xz = "xz-native"
>>  CONVERSION_DEPENDS_lz4 = "lz4-native"
>>  CONVERSION_DEPENDS_lzo = "lzop-native"
>>  CONVERSION_DEPENDS_zip = "zip-native"
>> +CONVERSION_DEPENDS_zst = "zstd-native"
>>  CONVERSION_DEPENDS_sum = "mtd-utils-native"
>>  CONVERSION_DEPENDS_bmap = "bmap-tools-native"
>>  CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

