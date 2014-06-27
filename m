Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A22FD62252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:11:38 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 19so2846291ykq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6VULoCZgZY/MFzMbDFMLpZ4tNPEhVhW4oie6R1E1jp4=;
	b=OOKw4jIWh3ISuWFfamCFXkYORKqf4LKm/1J3C321wZ/jCJ1sz+6upKjvcBWiew+mEa
	8x6Yy5rsWpkvtM1wWwtpuJRrCUL3w42cc5bIDNlmhR7QQdbUk4rXAIVS1mdZmmpcsWBk
	j2YO8+rMgqVdj85PFVWmsRwPcPdUIcGB9Xf/RMp/Ebk9aZXYqGQnyEO4mVWr73a2IGHG
	6Oe+AVUqT6nxEt0aJDT3vARaKGoOpioUORgS2ixVNksWtfKgoL83Kg3iPMDRTrzpiP3O
	0kaoaESBz5GPguM9GrZq0xXrlI+TlOI8GYNHzS+cOQHB6Cpcfii+2uiHbGkfqJsOLv6p
	DTPg==
MIME-Version: 1.0
X-Received: by 10.236.180.169 with SMTP id j29mr32179096yhm.47.1403874699563; 
	Fri, 27 Jun 2014 06:11:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.233.65 with HTTP; Fri, 27 Jun 2014 06:11:39 -0700 (PDT)
In-Reply-To: <20140627124209.GS9006@bill-the-cat>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
	<CAP9ODKopjX4Jg5rTDLunZnV4xioqP7dCP09o-GB0t4yJxE-L3Q@mail.gmail.com>
	<20140627124209.GS9006@bill-the-cat>
Date: Fri, 27 Jun 2014 10:11:39 -0300
X-Google-Sender-Auth: T6Z11z-mpgoBFpBM5NyOwZ8WdXM
Message-ID: <CAP9ODKpvmM4JeYFt9p=co-+ZD51FWn1vjzB_OUEAbURDZAQSQQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Rini <tom.rini@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Fri, 27 Jun 2014 13:11:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 27, 2014 at 9:42 AM, Tom Rini <tom.rini@gmail.com> wrote:
> On Thu, Jun 26, 2014 at 02:25:34PM -0300, Otavio Salvador wrote:
>> On Thu, Jun 26, 2014 at 9:27 AM, Tom Rini <tom.rini@gmail.com> wrote:
>> > Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
>> > that we evaluate it fully before performing the live and vmdk logic
>> > checks.
>> >
>> > Signed-off-by: Tom Rini <tom.rini@gmail.com>
>>
>> Do you have an example how it used to fail?
>
> Sure:
> diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
> index 7b70025..23bb02e 100644
> --- a/meta/recipes-core/images/build-appliance-image_8.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
> @@ -17,7 +17,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
>  APPEND += "quiet"
>
>  DEPENDS = "zip-native"
> -IMAGE_FSTYPES = "vmdk"
> +IMAGE_FSTYPES_x86-64 = "vmdk"
>
>  inherit core-image
>
> And now you won't get vmdk images on qemux86-64 (same for live, did the
> same proof-of-concept there when working up the patch).

Isn't it a bug in BitBake?

I'd expect it to work fine. Richard, can you provide some feedback?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

