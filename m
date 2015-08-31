Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id C351E76D6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:38:59 +0000 (UTC)
Received: by qkfs65 with SMTP id s65so3062552qkf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 06:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7/npDZmaiEf/Q4YI1fX9FXX3S2p8v9a3Mg7ynS745oI=;
	b=Q9y8GBwURQdyYrJuz7UkAKkFiYqgTPnYUNV/ghe+7pz6+xRHjAV3nrv/TovEl/2/Q/
	E13UBgh3WZ+gzyolWnPslRwcO3KqAipFSLmBtHXhxiKIKCpmrF5f5yaE5CI5Yo+k4pjU
	Hs18nd8+syvF/ey0mOFqLgrpb1s+kj1TxXkZlXNvjvnVE9YUYYEO7UgLe7VjazjxTIQ9
	uWIS0EM39YdZrkzpmWCf0ZA+ZDTyKQ0fDh+gGMxNmv2WyZ8jAlycd3GcEh67ooymeK21
	lNT/nBIOcDFqTJHhld57g/Nh9YZuSBMvZez3U/WqaYeKPuhmjx5vvm3cmP/ZbJKtV28O
	YwBQ==
X-Gm-Message-State: ALoCoQmhnvy5ct5wCZFTmg3mVkqWmSZgYFT1yln5SHIpR1WCeRl2ccZMWbeghRIpRGbl42xT1mYX
X-Received: by 10.55.192.130 with SMTP id v2mr8979951qkv.82.1441028339177;
	Mon, 31 Aug 2015 06:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Mon, 31 Aug 2015 06:38:39 -0700 (PDT)
In-Reply-To: <1440851805.32588.9.camel@linuxfoundation.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-2-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LYdwRnzLUr9egN1JSj+G8iWKmeaTyghh4amBXcBs0-Uhg@mail.gmail.com>
	<1440851805.32588.9.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 31 Aug 2015 15:38:39 +0200
Message-ID: <CAP71Wjy_i=DQOtJUL=NVbfK6jXgO8=+CYsG7LU2fATM=UX=TLQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] android-tools: import android-tools from meta-smartphone into oe-core
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
X-List-Received-Date: Mon, 31 Aug 2015 13:39:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 29, 2015 at 2:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>>
>> Assuming that make_ext4fs is a tool to create an ext4 file system,
>> what's the difference between that and our mke2fs which is used to
>> create ext4 file systems?
>>
> We've worked quite hard to land the ext4 rootfs creation code into
> upstream e2fsprogs. I'd like to understand if we're missing anything for
> that to work with fastboot. If we are, I suspect it wouldn't be hard to
> add and should save maintenance of a separate tool (support in e2fsprogs
> means we get any other ext* improvements for free).

thanks for the feedback.

I sent this as RFC , because I wanted to initiate a discussion... I
decided to simply move existing recipes from meta-smartphone/android
for that purpose.

compared to 'regular' ext4 images , fastboot added the (convenient)
ability to support sparse images, to reduce the size of what is
transmitted over the USB, when flashing (and reduce the size of
writting to eMMC). For devices with 8GB+ eMMC that is a big deal
whether we flash a raw ext4 image, or its sparse'd version. More info
about fastboot sparse format at [1].

Unfortunately I haven't found any tool to 'sparse' an existing image,
make_ext4fs is doing the FS as well, so as you noticed it duplicates
what mke2fs does. make_ext4fs generates sparse image optionally (with
-s flag), but I don't know precisely what's the difference between the
generated image vs what mke2fs would do. The non sparse image from
make_ext4fs doesn't have the sparse header, and as far as I can tell
it is a valid 'ext4' image, which I can mount with mount -o loop, for
example (or inspect with dumpe2fs).

I've looked further into that today, and :

* when transferring an image to be flashed over USB, the target uses a
RAM buffer. if the image file size is smaller than the RAM buffer,
then our standard ext4 image can be flashed just fine.

* when transferring an image larger than the internal target RAM
buffer, then the host side fastboot program will split the images into
chunks that can be individually transferred and flashed. In that case
I am able to load a standard OE ext4 image *only* if I round/pad the
image to 4096 bytes, otherwise fastboot fails (with cryptic assertion
which I don't quite understand for now). If anyone has experience with
that, please let us know.

* Of course images from make_ext4fs whether they are sparse, non
sparse, large or not, always work.

* the size if this intermediate buffer is platform specific, the host
side fastboot queries the target to know the size of this buffer.

so in short.. OE ext4 image seems to be working fine (with the file
size limitation), but we are missing the specific sparse support.
Maybe that's good enough for OE core, and we can keep the
customization/optimizations in BSP layers..


[1] http://www.2net.co.uk/tutorial/android-sparse-image-format

