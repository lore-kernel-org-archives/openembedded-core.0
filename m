Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BECB7F7E1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jan 2020 14:52:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so46882427wro.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jan 2020 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8uh1GwN1JSl/PXmtrTuBcbebQS+y4apSSeaBmXe6YWQ=;
	b=JZeqKLqJuj1gibzVr8T4byH8OIxnGy5pQ+yGzmCfwajx2ZGpEjs4oyEaJkWGVU6TKa
	q/6WmB0kBJjEReY5SyNfekmi+qJtYz35Z1S/lr1YgHefxx5ppkOWuJrvkC6mDQv+mP7y
	1QEXdGZTDaJDkfL3e+3A635AIODOJagjQdmdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8uh1GwN1JSl/PXmtrTuBcbebQS+y4apSSeaBmXe6YWQ=;
	b=uJ1dEaSSf6xCNfWGtlUG1nmGSFn6NHz0pRwDWwYciK2IPnKIy4FUqaY6Gni0CKzh9I
	cXevCvms8j+2OeHsLtTdZjYAKiC6hfrFAIocctcAkxvl7nporQ/y0VTrX2YI532ZjvMp
	YliYSbfKOMj29jEK/VW/199h1u4sEtu5nYQ+o4WwCijR8kfLCMno3o/a0S9PsMxziVNw
	L/AbgmyV0L/1SVMUuFUuldbUV9Bu4aLN0iJBslhm9TxsP4SRRuDl496mDTq8/3Ql1ruY
	ssS/opsRjHcYGh/D9pH/2JP6JNu/wVhaprHzIH8GvzwLUvha2GGuSutB8pNLQ0afM/wi
	FvJQ==
X-Gm-Message-State: APjAAAXfRls4Vr3TSNGEPAj528WmCViDCQhqNVK8TUTLotDZPXTRnRSM
	x17knLauRqQXFOpyKJspEfc23w==
X-Google-Smtp-Source: APXvYqxdP8tVqsJ838eX1670WdRWVk5TsLmQNcTeJWD/deLyd2I1/pRH79AJk4+Oqi9gWX9ufllhlg==
X-Received: by 2002:a05:6000:1288:: with SMTP id
	f8mr98279050wrx.66.1578235957775; 
	Sun, 05 Jan 2020 06:52:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z124sm20516109wmc.20.2020.01.05.06.52.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Jan 2020 06:52:37 -0800 (PST)
Message-ID: <8b3eab92db8c79d69bff5eee95f1b9498bc96d65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maxim Uvarov <maxim.uvarov@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 05 Jan 2020 14:52:35 +0000
In-Reply-To: <20200104200703.6758-1-maxim.uvarov@linaro.org>
References: <20200104200703.6758-1-maxim.uvarov@linaro.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Sun, 05 Jan 2020 14:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-04 at 23:07 +0300, Maxim Uvarov wrote:
> Linux kernel can be compiled as UEFI stub and loaded directly
> with UEFI firmware without grub or other UEFI shell.
> 
> Tested with wic file:
> bootloader  --ptable gpt --timeout=0  --append="rootwait"
> part /boot --source bootimg-efi --sourceparams="loader=kernel" \
>  --ondisk sda  --fstype=vfat --label bootfs \
>   --active --align 1024 --use-uuid
> part / --source rootfs --fstype=ext4 --label rootfs \
>   --align 1024 --exclude-path boot/ --use-label
> The same wic file for armv7, armv8 and x86_64.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 27
> +++++++++++++++++++
>  1 file changed, 27 insertions(+)

wic has fairly complete tests, do we need to add a test for the new
functionality?

("oe-selftest -r wic")

Cheers,

Richard


