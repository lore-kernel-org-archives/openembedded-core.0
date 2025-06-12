Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E710C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:37:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.7961.1749717446888437543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5Gkph16;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so7743325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 01:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749717445; x=1750322245; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvWnULhkxppEmiK2R7xFcY4dx8dd7M8v9SAYr24n9gw=;
        b=S5Gkph16K2zmv6EHS6pMax15TCk0GN8mWJifjp5qmJiiKEKpn42t7fi1SEgdMPCOT6
         j0OmAav1iQb8EWzc52gsJhVFjbKyqPbDeNwLseR6Nmk4tzt26Lekq2CpNaCdbb6ghsje
         COvg9lJpFyudFAOlk1vsyFdzR8lvH8upDGJsHEtzr260Zbx4dXFix50+1AN0K/FZ4Xbc
         /aGWGN3gFefQYvFoNvYxbfCqnAyCDwIF9C5CmtW4vKtMOnZRTwMSETm3H29MWJAoxGUK
         ZVpZdoMi7qoQtKpYtyEUPhoUUhOJaqrBOxdGzFFXew/1LrvLw2BBGOzdqjJAIrj8we8v
         60dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717445; x=1750322245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cvWnULhkxppEmiK2R7xFcY4dx8dd7M8v9SAYr24n9gw=;
        b=Vp8mKrsQWkI+Moigf6mMiVJnd1kHjx5dI7xbBvu83NRXnbXCdr63WUDbfUhieUcm2Y
         cK4Yhv/1YnCMWks4VHcj0SNXQ//yEO4e69l6cVmdZkq/R6azXKglyTSKs0P44Jh2jpRq
         96OTMYHOyiwA2EOjhgzbBMo+Y5MqdGxUmRstxO/tD7Wch07gJYnsjogDua776Lsid3cZ
         M7AjIzGCAS0r1cnpdi2lmwlVFJ+JnUxDEZF+J3H2uv+1n2rBjSqux94yEipI9dT9UKga
         Gsi3mIs2OuOBClOUtQW6Mpxgkb63YybkOgtODP6QaTsyv/seE+xHzStNqTaC/jyjuG8N
         SoAA==
X-Forwarded-Encrypted: i=1; AJvYcCXfflQqzCOhoj/LzK/s7Ms+IOdZ324smkziijPy/VFG2+vMCelIlI26dz4DNSqt/HaWdb7R2AjGF/H9/0T2clmYJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdQwBvsVUwLxr14uHsxX0PSrVixpNLDfkF3WwWj6LWa2qlJArK
	wIjmjLWoqdJtvj5yGIIOFjyeHEctdiD2MbGO82jsBerQwEwFsizFyskU
X-Gm-Gg: ASbGncuvKaHJaavECvMJUWGBt+SiUmv071I0H1DQ//t3V+Xhxu2zdf3Hjd6yRtJ4aDB
	6SETDEJG3LKSXD6Fzj6L3xg1uXfOE1jGA0Ass2/67TnkBN7MotxwgzAXHdHfaRS994HvtYtGGMK
	sOpgrSh7UjwqB2M70rzD7P97+7NP3x9KBvdqXoelB8GePb7PJhjT+QnB7JpkXUiO6Av/Cho6tqQ
	eRmlNzimwGexgUAy/zaifX8tndlL/dUqZoi0Bl57FT1KJVhjxPrMqJwMrJ1SO9P8AxRiXAGmndo
	DQhzHTUsUPx2mKla/QsS8TWOBZb15yqtdf6B8IVhxP54uQvfspEO7ZAZmw==
X-Google-Smtp-Source: AGHT+IFi1jsjTB0AvEMDzTIF4OiiU9IiRzq26khavxgoeR3NrGL6prAclbO/MG/XAiEsSzkcpZL0Hw==
X-Received: by 2002:a05:600c:810a:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4532d2ed80cmr20928735e9.13.1749717444918;
        Thu, 12 Jun 2025 01:37:24 -0700 (PDT)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c187sm13495805e9.23.2025.06.12.01.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:37:24 -0700 (PDT)
Message-ID: <fb47a8cd-10af-4065-baaf-4471243fb24f@gmail.com>
Date: Thu, 12 Jun 2025 09:37:23 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] classes-recipe/image: Add variable to create
 rootfs with a exact size
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250602213004.2123954-1-fbberton@gmail.com>
 <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <31284b0f55e3c18957c9340cc399f1c0c9a8410a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218486

Hi Richard,

I agree that it's not easy to understand what the variable does without reading the documentation. The idea is to set the image size explicitly and ignore values set by other variables, such as IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE, creating an image with the exact size specified by this variable.

It wasn’t straightforward to understand why setting IMAGE_ROOTFS_SIZE to a specific value still resulted in a final image that was larger than expected. Maybe I'm missing something, but it took me a while to realize the issue is from the directory_size() function [1], which uses a hardcoded 4K block size. In my case, the size of the IMAGE_ROOTFS directory does not match the final image size on the target. With this new variable the image size will be what was defined.

I can move the logic into get_rootfs_size(), but first I want to check whether this variable will be accepted or if there's another way to handle this.

To set the block size, we could modify directory_size() [1] to use the `-b` option from EXTRA_IMAGECMD to specify the block size. When `-b` is not used, the block size change depending on the filesystem size, maybe the 4k can be default if the `-b` option it's not explicitly add. Also, I'm not sure if there are other options that could affect the final filesystem size.

1 - https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/utils.py#n491


On 6/2/25 22:37, Richard Purdie wrote:
> On Mon, 2025-06-02 at 22:30 +0100, Fabio Berton via lists.openembedded.org wrote:
>> From: Fabio Berton <fabio.berton@criticaltechworks.com>
>>
>> Add the IMAGE_ROOTFS_EXACT_SIZE variable to allow the creation of a root
>> filesystem with an exact size as specified by the user. This bypasses
>> the default size calculation done by the get_rootfs_size function.
>>
>> This feature is useful for creating a small ext4 filesystem with a block
>> size of 1k. The get_rootfs_size function uses a block size of 4k to
>> determine the size of IMAGE_ROOTFS, which may be larger than the value
>> set in IMAGE_ROOTFS_SIZE. If an ext4 rootfs with a block size of 1K is
>> nearly full, the .ext4 file generated by Yocto will be larger than
>> expected due to the way get_rootfs_size calculates the size.
>>
>> By using IMAGE_ROOTFS_EXACT_SIZE, users can specify the exact size
>> required. Users should ensure that the size is set correctly according
>> to the filesystem requirements. It is not easy to predict the block size
>> that is used by a filesystem because it can be set by a parameter or it
>> can be added automatically by the tool that creates the file system.
>>
>> Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
>> ---
>>  meta/classes-recipe/image.bbclass | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
>> index 24a19fce1a..2df0a5c30d 100644
>> --- a/meta/classes-recipe/image.bbclass
>> +++ b/meta/classes-recipe/image.bbclass
>> @@ -132,7 +132,7 @@ python () {
>>  
>>  def rootfs_variables(d):
>>      from oe.rootfs import variable_depends
>> -    variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
>> +    variables = ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE', 'IMAGE_ROOTFS_EXACT_SIZE', 'IMAGE_ROOTFS_EXTRA_SPACE',
>>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOCALES_ARCHIVE',
>>                   'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>>                   'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
>> @@ -594,9 +594,14 @@ def get_rootfs_size(d):
>>      return base_size
>>  
>>  python set_image_size () {
>> -        rootfs_size = get_rootfs_size(d)
>> -        d.setVar('ROOTFS_SIZE', str(rootfs_size))
>> -        d.setVarFlag('ROOTFS_SIZE', 'export', '1')
>> +    rootfs_size = d.getVar('IMAGE_ROOTFS_EXACT_SIZE')
>> +    # If IMAGE_ROOTFS_EXACT_SIZE variable is not set, use the result of
>> +    # get_rootfs_size as ROOTFS_SIZE.
>> +    if not rootfs_size:
>> +        rootfs_size = str(get_rootfs_size(d))
>> +
>> +    d.setVar('ROOTFS_SIZE', rootfs_size)
>> +    d.setVarFlag('ROOTFS_SIZE', 'export', '1')
>>  }
>>
> 
> I am loathed to add yet another rootfs size variable. This is like
> having variables like:
> 
> IMAGE_ROOTFS_SIZE
> IMAGE_ROOTFS_REALLY_THIS_SIZE
> IMAGE_ROOTFS_REALLY_REALLY_THIS_SIZE
> IMAGE_ROOTFS_REALLY_THIS_EXACT_SIZE
> 
> and then you don't know if "really really" wins compared to "really
> this exact" or not without looking at the docs. It isn't a good
> interface.
> 
> If we were to add one, shouldn't it be in the get_rootfs_size()
> function along with the rest of the logic? Would it be better to set
> the block size somewhere instead?
> 
> I'd also point out there are no tests for it.
> 
> Cheers,
> 
> Richard


