Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3C77B60053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 22:50:50 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so29814675wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kkK/15eq37JA0hwaqMNmf4s9xDpH9zpDkUt8Cd9gZqk=;
	b=UVjvjYE93i7PMv7yyOFQlpRmoBMQFSl8pixD9rB90w6eAM109K4vqKqTN2rm0MrV4R
	0Sw0ZsD4o3tYSzkyFjY7YqzIXWyynYFJpLzGYxujFtJ+doPKKBFRTptIksfVs88OQRce
	mUYYURCv3E8D/b24BkeUobAz/FVecSxxENxZuwVU7cwDEv2Q/uDWDUyfmIkny+XGM77E
	hIR7CcaKVAifWz3YE4Vw6JlORfBZKfmsHmtAqxsKtBJcqLM/qGla+EXwy/zR0Eb0l8ab
	IZew/X61IDabDpyt6BQhVbMF+2B9uuAp9WqujWjPBW2nJSbgbvzYlxDYEPWbmXiRprjI
	bufg==
X-Gm-Message-State: ALoCoQnpobyo+B1H/ImQlCveYySQSWwhK/4OozNSo6R1HmtQo5FFE2lIYAWZOoXPuZrRgemccZ/g
X-Received: by 10.194.250.40 with SMTP id yz8mr8905066wjc.103.1435704650969;
	Tue, 30 Jun 2015 15:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.57.9 with HTTP; Tue, 30 Jun 2015 15:50:21 -0700 (PDT)
In-Reply-To: <CAD1M060jUQOR4XQZvNTtkZyscV3O-+e5D5mdEiN=5UXNErDwLg@mail.gmail.com>
References: <1429921386-17007-1-git-send-email-psidhu@gateworks.com>
	<1429921386-17007-2-git-send-email-psidhu@gateworks.com>
	<CAD1M060jUQOR4XQZvNTtkZyscV3O-+e5D5mdEiN=5UXNErDwLg@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Tue, 30 Jun 2015 15:50:21 -0700
Message-ID: <CAD1M061y-fAmn+d0HLoMmK0yMj4Y8obk4yy6FQY0Ph9Zzms+jg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: add support for multiple ubi sizes
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
X-List-Received-Date: Tue, 30 Jun 2015 22:50:54 -0000
Content-Type: text/plain; charset=UTF-8

ping

- Pushpal

On Mon, May 18, 2015 at 4:05 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> Richard,
>
> Can I get some feedback/consumption on this?
>
> - Pushpal
>
> On Fri, Apr 24, 2015 at 5:23 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>> Add new FSTYPE called 'multiubi'. This new type has the ability to
>> create multple ubi's, something that's extremely useful on boards that
>> can include varying flash sizes (e.g. 256MB vs 2GB).
>>
>> Because we don't want to reuse code, I extracted the mkfs and ubinize
>> commands out to a new function that will handle the creation of both
>> multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
>> boards).
>>
>> Due to the single processes nature of the OE when doing it's
>> 'create_image', this new multiubi_mkfs function also creates it's own
>> symlinks as well as cleans up it's own cfg file.
>>
>> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
>> ---
>>  meta/classes/image_types.bbclass | 55 +++++++++++++++++++++++++++++++---------
>>  1 file changed, 43 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index 72c7337..b250dbd 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -97,18 +97,48 @@ IMAGE_TYPEDEP_elf = "cpio.gz"
>>
>>  UBI_VOLNAME ?= "${MACHINE}-rootfs"
>>
>> -IMAGE_CMD_ubi () {
>> -       echo \[ubifs\] > ubinize.cfg
>> -       echo mode=ubi >> ubinize.cfg
>> -       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg
>> -       echo vol_id=0 >> ubinize.cfg
>> -       echo vol_type=dynamic >> ubinize.cfg
>> -       echo vol_name=${UBI_VOLNAME} >> ubinize.cfg
>> -       echo vol_flags=autoresize >> ubinize.cfg
>> -       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
>> -       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
>> +multiubi_mkfs() {
>> +       local mkubifs_args="$1"
>> +       local ubinize_args="$2"
>> +       local vname="_$3"
>> +
>> +       echo \[ubifs\] > ubinize${vname}.cfg
>> +       echo mode=ubi >> ubinize${vname}.cfg
>> +       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}.cfg
>> +       echo vol_id=0 >> ubinize${vname}.cfg
>> +       echo vol_type=dynamic >> ubinize${vname}.cfg
>> +       echo vol_name=${UBI_VOLNAME} >> ubinize${vname}.cfg
>> +       echo vol_flags=autoresize >> ubinize${vname}.cfg
>> +       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
>> +       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}.cfg
>> +
>> +       # Cleanup cfg file
>> +       mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
>> +
>> +       # Create own symlink
>> +       cd ${DEPLOY_DIR_IMAGE}
>> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
>> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
>> +               ${IMAGE_LINK_NAME}${vname}.ubifs
>> +       fi
>> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
>> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
>> +               ${IMAGE_LINK_NAME}${vname}.ubi
>> +       fi
>> +       cd -
>> +}
>> +
>> +IMAGE_CMD_multiubi () {
>> +       # Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
>> +       for name in ${MULTIUBI_BUILD}; do
>> +               eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
>> +               eval local ubinize_args=\"\$UBINIZE_ARGS_${name}\"
>> +
>> +               multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
>> +       done
>>  }
>> -IMAGE_TYPEDEP_ubi = "ubifs"
>> +
>> +IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAME}""
>>
>>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>>
>> @@ -139,6 +169,7 @@ IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
>>  IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>> +IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>>
>>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>>  IMAGE_TYPES = " \
>> @@ -151,7 +182,7 @@ IMAGE_TYPES = " \
>>      iso \
>>      hddimg \
>>      squashfs squashfs-xz squashfs-lzo \
>> -    ubi ubifs \
>> +    ubi ubifs multiubi \
>>      tar tar.gz tar.bz2 tar.xz tar.lz4 \
>>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>>      vmdk \
>> --
>> 2.3.5
>>

