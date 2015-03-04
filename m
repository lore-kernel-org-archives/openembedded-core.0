Return-Path: <naresh.bhat@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA7465C88
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 06:57:39 +0000 (UTC)
Received: by lbiv13 with SMTP id v13so23583421lbi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 22:57:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tHhOt3q91dghljOOLFeWS0sLbWfdfR9NR6/hZr8vU00=;
	b=l5eNi+/Fdr2ZxjWmmiYc8G5dUTkXdp9IYsuuZMJPBDjyYI5EQJKUpoQwzAR69OxCeX
	ykHTOUTGFpAP6LSzJiQ+la15ZwyftnrhnCthcLhb/gEyCIDBg4gfeuz6Ouh+saVdia4a
	uKkji6G5kZ6SURQS7hWsK9PSa04aTwQv06ZaaSQZOLNzVr2GlSGecxATEVBWqNZtaEfW
	rCjDqud0RrMf4gn2AmLXXhn4nXnD2iWg0UYHjOPyk8vLVZ7z6j2FckPc5yH8Mp1+JXOB
	wbddaqGpzJIccx1h90/QYpKTi5BU2PkHE+4KxGF88qcHIQ4T6gusBL5Ll/g71YIBVKzJ
	xmGA==
X-Gm-Message-State: ALoCoQn8jJxb+q+IDv2JQu4/+7eYOyVHoRDP6iuu3Or17VH1Dy+xhfTZh5mT9u/YAy7LmBZJqg1i
MIME-Version: 1.0
X-Received: by 10.112.126.98 with SMTP id mx2mr2138243lbb.52.1425452260108;
	Tue, 03 Mar 2015 22:57:40 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Tue, 3 Mar 2015 22:57:40 -0800 (PST)
In-Reply-To: <CAC1BbcQhpMtqn8vFWC2ko3DSQ3g2uNuSR9xY3aWvyWKxche74g@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-3-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcQhpMtqn8vFWC2ko3DSQ3g2uNuSR9xY3aWvyWKxche74g@mail.gmail.com>
Date: Wed, 4 Mar 2015 12:27:40 +0530
Message-ID: <CAFoFrHY04=JzGaNCCHrjK6wfL6FcNSz+8YQiWKX9vQQRJYSTTw@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 2/4] bootimg: Add support to install Image
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
X-List-Received-Date: Wed, 04 Mar 2015 06:57:43 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 23:17, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On 3 March 2015 at 16:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> Add support to install kernel image for aarch64
>>
>> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
>> ---
>>  meta/classes/bootimg.bbclass |   10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> index b1c03ba..a8e0c19 100644
>> --- a/meta/classes/bootimg.bbclass
>> +++ b/meta/classes/bootimg.bbclass
>> @@ -66,8 +66,16 @@ populate() {
>>         DEST=$1
>>         install -d ${DEST}
>>
>> +       SRC_KERNEL_IMAGE=bzImage
>> +       DEST_KERNEL_IMAGE=vmlinuz
>> +
>> +       if [ "${TARGET_ARCH}" = "aarch64" ]; then
>> +               SRC_KERNEL_IMAGE=Image
>> +               DEST_KERNEL_IMAGE=Image
>> +       fi
>> +
>>         # Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
>> -       install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage ${DEST}/vmlinuz
>> +       install -m 0644 ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE} ${DEST}/${DEST_KERNEL_IMAGE}
>
> while you touch this, I'd remove the -d above and instead -D, like:
> install -m 0644 -D ${STAGING_KERNEL_DIR}/${SRC_KERNEL_IMAGE}
> ${DEST}/${DEST_KERNEL_IMAGE}
>
> thanks,
ok,  Thank you very much.  That's a good suggestion.  I will make the
necessary changes.

