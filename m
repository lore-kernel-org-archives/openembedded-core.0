Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id D62DB757F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 17:06:24 +0000 (UTC)
Received: by igblr2 with SMTP id lr2so80554666igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Ts9Zlj8UDpXizOjwzYbDObJrzRTeEUf4NMkf89yxOkg=;
	b=XxRXiWECGy3GRYLRr7cYV0D46/PRhEY3zqZbJDtyML7nbs8WDwojj7OpPecegnNe1Y
	T2IOpha3Jnp0tlEMoIwLR/UYF/FzZKiL9SPrsI8p+tO0hPr2Cunh9PBfvhpnIMXFLDT3
	tJt/mOmqwvMdCaw3SIF/ANoVztyIM+ObHEux+ZcB0GxaBn1Xnt+wjQjMVOWxnQNLORKc
	COyiE0Or9nc/aIJ9yhKR5xScfJ8Yib2Jzvj80HH1N7AwRcgcrMQVWXzwHA+/zotgSU+1
	Yo5lipR0aGXo6tK9E5nSEDj86GFGQ8kELeM8M7jbUsUg0pfNwQjA5906d/lNRNgMOWu2
	Fu4Q==
MIME-Version: 1.0
X-Received: by 10.107.18.84 with SMTP id a81mr52687087ioj.14.1435943184549;
	Fri, 03 Jul 2015 10:06:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.36.218.7 with HTTP; Fri, 3 Jul 2015 10:06:24 -0700 (PDT)
In-Reply-To: <CAD1M061y-fAmn+d0HLoMmK0yMj4Y8obk4yy6FQY0Ph9Zzms+jg@mail.gmail.com>
References: <1429921386-17007-1-git-send-email-psidhu@gateworks.com>
	<1429921386-17007-2-git-send-email-psidhu@gateworks.com>
	<CAD1M060jUQOR4XQZvNTtkZyscV3O-+e5D5mdEiN=5UXNErDwLg@mail.gmail.com>
	<CAD1M061y-fAmn+d0HLoMmK0yMj4Y8obk4yy6FQY0Ph9Zzms+jg@mail.gmail.com>
Date: Fri, 3 Jul 2015 14:06:24 -0300
X-Google-Sender-Auth: Py2mpqPzIHl5ppai3WQogZb-xYI
Message-ID: <CAP9ODKrbi6PEN6+7Jeg1yJbHR_AwP_zHz8T+iEBw6MbWsx+Wcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 03 Jul 2015 17:06:25 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I really like this and it keeps the backward compatibility which is very good.

I think this should be merged as is, as it does improve the current
situation and new improvements can be done as new patches.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Tue, Jun 30, 2015 at 7:50 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> ping
>
> - Pushpal
>
> On Mon, May 18, 2015 at 4:05 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>> Richard,
>>
>> Can I get some feedback/consumption on this?
>>
>> - Pushpal
>>
>> On Fri, Apr 24, 2015 at 5:23 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>>> Add new FSTYPE called 'multiubi'. This new type has the ability to
>>> create multple ubi's, something that's extremely useful on boards that
>>> can include varying flash sizes (e.g. 256MB vs 2GB).
>>>
>>> Because we don't want to reuse code, I extracted the mkfs and ubinize
>>> commands out to a new function that will handle the creation of both
>>> multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
>>> boards).
>>>
>>> Due to the single processes nature of the OE when doing it's
>>> 'create_image', this new multiubi_mkfs function also creates it's own
>>> symlinks as well as cleans up it's own cfg file.
>>>
>>> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
>>> ---
>>>  meta/classes/image_types.bbclass | 55 +++++++++++++++++++++++++++++++---------
>>>  1 file changed, 43 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>>> index 72c7337..b250dbd 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -97,18 +97,48 @@ IMAGE_TYPEDEP_elf = "cpio.gz"
>>>
>>>  UBI_VOLNAME ?= "${MACHINE}-rootfs"
>>>
>>> -IMAGE_CMD_ubi () {
>>> -       echo \[ubifs\] > ubinize.cfg
>>> -       echo mode=ubi >> ubinize.cfg
>>> -       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg
>>> -       echo vol_id=0 >> ubinize.cfg
>>> -       echo vol_type=dynamic >> ubinize.cfg
>>> -       echo vol_name=${UBI_VOLNAME} >> ubinize.cfg
>>> -       echo vol_flags=autoresize >> ubinize.cfg
>>> -       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
>>> -       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
>>> +multiubi_mkfs() {
>>> +       local mkubifs_args="$1"
>>> +       local ubinize_args="$2"
>>> +       local vname="_$3"
>>> +
>>> +       echo \[ubifs\] > ubinize${vname}.cfg
>>> +       echo mode=ubi >> ubinize${vname}.cfg
>>> +       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}.cfg
>>> +       echo vol_id=0 >> ubinize${vname}.cfg
>>> +       echo vol_type=dynamic >> ubinize${vname}.cfg
>>> +       echo vol_name=${UBI_VOLNAME} >> ubinize${vname}.cfg
>>> +       echo vol_flags=autoresize >> ubinize${vname}.cfg
>>> +       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
>>> +       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}.cfg
>>> +
>>> +       # Cleanup cfg file
>>> +       mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
>>> +
>>> +       # Create own symlink
>>> +       cd ${DEPLOY_DIR_IMAGE}
>>> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
>>> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
>>> +               ${IMAGE_LINK_NAME}${vname}.ubifs
>>> +       fi
>>> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
>>> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
>>> +               ${IMAGE_LINK_NAME}${vname}.ubi
>>> +       fi
>>> +       cd -
>>> +}
>>> +
>>> +IMAGE_CMD_multiubi () {
>>> +       # Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
>>> +       for name in ${MULTIUBI_BUILD}; do
>>> +               eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
>>> +               eval local ubinize_args=\"\$UBINIZE_ARGS_${name}\"
>>> +
>>> +               multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
>>> +       done
>>>  }
>>> -IMAGE_TYPEDEP_ubi = "ubifs"
>>> +
>>> +IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAME}""
>>>
>>>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>>>
>>> @@ -139,6 +169,7 @@ IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
>>>  IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>>>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>> +IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>>>
>>>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>>>  IMAGE_TYPES = " \
>>> @@ -151,7 +182,7 @@ IMAGE_TYPES = " \
>>>      iso \
>>>      hddimg \
>>>      squashfs squashfs-xz squashfs-lzo \
>>> -    ubi ubifs \
>>> +    ubi ubifs multiubi \
>>>      tar tar.gz tar.bz2 tar.xz tar.lz4 \
>>>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>>>      vmdk \
>>> --
>>> 2.3.5
>>>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

