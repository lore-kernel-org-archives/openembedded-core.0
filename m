Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8578377811
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 20:27:17 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c13so79742088qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SwYgvgBUU+OVu57ctqA9sCYtGpW1C6q7MoGy/0kPMdY=;
	b=Ym+in8r5TLW/vDK1nTERimo6jimms8zU7bSZI4KLPuthma7MPLeR6puO9f5TfMJdgB
	B3oCuUyB7Kyek3ecFddDzN2oOZHTaCQupyJLNDG1nxHV57KTxGeJDT4Oep4OPXUVVzWQ
	pPkMvoLEyMnzML42ANGiHrSAKcGSNiv99Bj+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SwYgvgBUU+OVu57ctqA9sCYtGpW1C6q7MoGy/0kPMdY=;
	b=auy2qZdtpVupd2wSW787Ircplk1RciaZ5F3gwCrcjc3ohNCxVEXifc2hquStqRq0Ik
	5NLWE3reTZdUTaBmFb5+mjkfZ2yJhPKn9n+YpXcQsSRXJykXMdBrPe6Y7hjSm9uOYb2Q
	E58+XMKbJzQH6zlEv653YSPEgC37pJ4HQcugYxVWCSC9+3+6zd7S0XHAx4JlqtmBa6NS
	YXlZDV8EAEI3wx1s47dhTACUwAR+W5U5Yj7CWTMFtRCZGck5upURVjPpEo0iiEe8AjiL
	20CCH+9YJPfA8WtLX1sRDHWtnjuLF0u2BMY/1MI/9I3Ogb09/bZLZLq1OVyy6Wdqv8PK
	G52A==
X-Gm-Message-State: AODbwcBrSJYLtVJQIaS/XVP5CBma+05tLZUoZnParVdebzrhWLYfRckK
	nYiWbGGeDgMOrTc+au7X8pjFhkVNB0Rz
X-Received: by 10.200.42.219 with SMTP id c27mr27567345qta.9.1496176038378;
	Tue, 30 May 2017 13:27:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Tue, 30 May 2017 13:26:57 -0700 (PDT)
In-Reply-To: <CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 30 May 2017 22:26:57 +0200
Message-ID: <CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Tue, 30 May 2017 20:27:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 7:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
>> It really sounds to me like something obvious is missing, i doubt I
>> would be the first one to try Image.gz..
>
> You may be the first to try for a non-MIPS machine.
>
> MIPS is a little special in that the MIPS kernel doesn't support self
> extracting compressed kernels (zImage, etc), so MIPS machines are the
> most likely to make use of a gzipped vmlinux image (which will then be
> decompressed by the bootloader) and KERNEL_IMAGETYPES="vmlinux.gz"
> works OK.
>
> If a compressed kernel is required, most non-MIPS machines use a self
> extracting image.

this piece of is coming from this old commit:

cb17b6c2a7 kernel.bbclass: support kernel image type of vmlinux.gz

It is clear that the goal of this logic is only to support vmlinux.gz
since the kernel build system does not create it (only vmlinux). It
almost looks to me like we should treat vmlinux.gz as a special case
instead of treating each .gz target as 'special'

-    typeformake = re.sub(r'\.gz', '', types)
+    typeformake = re.sub(r'vmlinux\.gz', '', types)

e.g. the special case should be used *only* when the kernel build
system is not capable to create the compressed file. e.g. on ARM ,
Image, Image.gz and vmlinux are valid image that the kernel build can
generate, so it probably doesn't make any sense to have vmlinux.gz in
KERNEL_IMAGETYPES anyways..

In fact , looking more closely at kernel makefiles (for arch/mips,
since you brought this one up), it looks like uImage (and compressed
vmlinux) was added in 2013 (commit
4defe4559e86e26545ab2f542656a4b966dcde53). So we might not need all
this logic at all anymore in kernel.bbclass and just get rid of it.

so, to backtrack a bit, i think it should be safe to only treat
vmlinux.gz as a 'special' case, and then it is there in
KERNEL_IMAGETYPE, then we do a "make vmlinux" and we manually compress
the file, otherwise we just trust that KERNEL_IMAGETYPE is a valid
type and give it to kernel make command line.  that should be enough
to fix the Image.gz cases on all platforms where it's relevant (like
arm).

then a second step might be to check if we even need that mechanism
anymore.. but that might be a more tricky change.

