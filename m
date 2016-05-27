Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE1A60767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 08:11:19 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id b65so162929117oia.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f5WBkOBYCvJg2LOusJrYRA/zVMUkt8SeYaHfLHxcs8I=;
	b=K6SML2EbXs9Ctn/1OxWXRuNBUN5m0S+PYLmFYiN7E6CvVBHdQVWLvtuaUurInlZ3bI
	xmySD7ngup/q0OHlXn+hyv+tShTW+Hyi9zT+9d0H/80h/FM4hblmyu9STBRAEpHVGZKM
	xZMYJOXXG2k7vp77zaYyn9tNkMAP1/UAj2h1+HmwbW6SmZI1gITta9PV8pqMHqFllX3P
	tgpcx14DIjGC8gBj5vRNi99IiM7BKadBMDcWi8TEfggsoLMebNhVd7FctT7NVbD+GL0j
	2FsZp6KKC4nEJF5SCJauyAD97Y/EZWr6AA6hiKSlHibtWtFVwQuCJga5M4h2LLsVdJ0q
	KH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f5WBkOBYCvJg2LOusJrYRA/zVMUkt8SeYaHfLHxcs8I=;
	b=UBTfhlN9GSUC63cttO9cq3bM6NqDXbgVLgW7YElIdYwd9fY4Gt+wkkTbV+EZ9a4QxM
	/Q2exIEtHfqg8TpKf6N9oBuWvhc0vpLRfpiqHDGPIvnSWenWQCPU8uVXSOYqagqPbNIB
	NUVgCMwbOZdA8JXb4wk8SW/WjqNHv8VZniUvAR1Kn+oc763Z3M0zrbdDziFdqs0xL9NG
	Zif6dbdxSvJRwsvKqpq5D380Vvxpg3NcnnugniGtv4oONi3iCMO8lkOolhuzXTR/6Ozv
	2aJIy+1W5XWDUMe3vgknh5Ijgr3iqwhL+vWtw/43lXG4os/v1cGcStZ3Ys+bMPgFMX51
	Robw==
X-Gm-Message-State: ALyK8tJP0mDlCIVZzUJJuc+/md0FEq6bpjEhDX3YsEEWpaPDkZLPGzqVczuCsWo2o4X8g1jbCEOLj4t/UZjgryDT
X-Received: by 10.157.5.210 with SMTP id 76mr8054130otd.161.1464336679960;
	Fri, 27 May 2016 01:11:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Fri, 27 May 2016 01:10:50 -0700 (PDT)
In-Reply-To: <5b3fdf4709cde6ecfbb88c1c79aa4d8a89aece5a.1464336009.git.jussi.kukkonen@intel.com>
References: <cover.1464336009.git.jussi.kukkonen@intel.com>
	<5b3fdf4709cde6ecfbb88c1c79aa4d8a89aece5a.1464336009.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 27 May 2016 11:10:50 +0300
Message-ID: <CAHiDW_GxYGxXGpGTENufMx1ffCy9+Nk=cQuPVW4EDeeZ2hBmVw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] image-live.bbclass: Tweak rounding up sector count
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
X-List-Received-Date: Fri, 27 May 2016 08:11:20 -0000
Content-Type: text/plain; charset=UTF-8

On 27 May 2016 at 11:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> New mkdosfs has changed the default sectors-per-track it sets on a
> new image: This number is useless in our use case but mcopy has
> sanity checks to make sure image size is an integral number of
> sectors-per-track.

Just to be on the safe side: this patch should _not_ be applied
without the dosfstools upgrade.

 - Jussi

> Make sure our sector count is always divisible by sectors-per-track.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/classes/image-live.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
> index ea6ced2..9b65753 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -199,14 +199,15 @@ build_fat_img() {
>         FAT_SECTORS=$(expr $(expr $(expr $FAT_BYTES + 511) / 512) \* 2)
>         SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
>
> -       # Determine the final size in blocks accounting for some padding
> -       BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
> +       # Determine the final size accounting for some padding
> +       SECTORS=$(expr $SECTORS + $(expr ${BOOTIMG_EXTRA_SPACE} \* 2))
>
>         # Ensure total sectors is an integral number of sectors per
> -       # track or mcopy will complain. Sectors are 512 bytes, and we
> -       # generate images with 32 sectors per track. This calculation is
> -       # done in blocks, thus the mod by 16 instead of 32.
> -       BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
> +       # track or mcopy will complain. Sectors are 512 bytes, and current
> +       # mkdosfs generates images with 63 sectors per track. Use 2*63
> +       # as the mod to ensure result is divisible by two.
> +       SECTORS=$(expr $SECTORS + $(expr 126 - $(expr $SECTORS % 126)))
> +       BLOCKS=$(expr $SECTORS / 2)
>
>         # mkdosfs will sometimes use FAT16 when it is not appropriate,
>         # resulting in a boot failure from SYSLINUX. Use FAT32 for
> --
> 2.1.4
>

