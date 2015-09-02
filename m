Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 65BBF76F8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:28:40 +0000 (UTC)
Received: by igbut12 with SMTP id ut12so18233206igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=v8ZFvOAeSu/Z+kOZ5n0UAihI4OgPtbgFqOlT/e4943s=;
	b=l1WiRcN0Zr9ObsJirJeXNpTtIMviyzVlA6NV4R+XqM9WkXCzvqKKV78YCFDtXGNm17
	pymbbsynpS9Ix8mzJ6jHrUnmk+s7lR3CtX4C0eX0jqLBRzmuPElCLylXOyhHPudf5Xph
	aH/HxBxzz3UC8qG4CAWvbvrIocUi55b/LclcXADf5jkXQAGCQpMQpQ3xT0004xiGLG1D
	enOrZOY2N5YjIEgKFNnMxCimvbpu6thXkIhQGlbjGIGq1Kn5hPn+GjXZCTC0GF7ZlGZm
	YEQiTEmZTFFvp1Yl9KkMH8z4mn4urXXjJsbJbAufooHU7jurDLrD1TnEveTHAhzyzh3N
	J7ZA==
X-Gm-Message-State: ALoCoQlIIT325owYIgPydVXXJa9Izmo91DBNxhtSLPkZWgF1XTNFxU5zEkOPdnmUEKWwof1av2mw
X-Received: by 10.50.3.37 with SMTP id 5mr4176760igz.96.1441211320209;
	Wed, 02 Sep 2015 09:28:40 -0700 (PDT)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com.
	[209.85.223.172])
	by smtp.gmail.com with ESMTPSA id j13sm2542958igf.6.2015.09.02.09.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:28:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so26295758ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:28:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr4406215ioi.28.1441211318648;
	Wed, 02 Sep 2015 09:28:38 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:28:38 -0700 (PDT)
In-Reply-To: <cover.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
Date: Wed, 2 Sep 2015 13:28:38 -0300
Message-ID: <CAP9ODKp38yLobz3CeV+27=mTMfn59R8NeVNHpSuZcTVTTu5ELg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] enhancing images, booting and runqemu
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
X-List-Received-Date: Wed, 02 Sep 2015 16:28:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> I've spent some time lately on building custom full-disk images with a
> custom initramfs based on the initramfs-framework. The ultimate goal
> is to initialize IMA in a initramfs-framework module.
>
> As part of that work, I enhanced runqemu such that it can boot
> full-disk images more easily, made those images more versatile (no
> more hard-coded root=/dev/sda2), and solved a kernel panic that only
> seems to appear under qemu (the /dev/console issue).
>
> Only a few patches are really important (because I'd probably not be
> able to achieve the same effect with setting variables elsewhere):
>    boot loader: support root=UUID
>    initramfs-framework: handle kernel parameters with . inside
>    initramfs-framework: add separate init_verbose log level parameter
>    initramfs-framework: support mounting rootfs in modules
>    runqemu: support full-disk images
>
> But I think the rest might also be relevant for others and thus
> worthwile including.
>
> Note that the mechanism for root=UUID is separated from actually
> making that default. Changing the default this late in the development
> cycle might be a bit risky, so I'd be fine with leaving out the last
> patch which changes the default. On the other hand, it solves one
> potential snag for users of these images, so it might be better to
> include it - your choice.

I would like to thank you to work on this. This extends the use of the
initramfs-framework as we wished since we designed it and it allows
for the removal of the live specific recipes for more metadata
polishment.

This is indeed a step on the right direction.

I provided some feedback; hope it helps.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

