Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 993306C37E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 15:59:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r3so3358675wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=AnjpngKiS6Xyo/tiFvX3dbyaYMNMp2jOxjGAPEDOgf4=;
	b=e5OzjQI+AH32cUkoKqgA2/wRH5DEL8aI9/ok93ngbDXCA9y7CBYYB8feL/tiUiKox2
	mjU9DAuQ/GoK4ejBa2rOwLp8noGr+ugE3e10V39ErFKG+pWYXWOCikmhJeMOQ6yxLdcq
	LInIAnwlzVtlWfmnZemPMwawmQQaXYFS/R6Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AnjpngKiS6Xyo/tiFvX3dbyaYMNMp2jOxjGAPEDOgf4=;
	b=deLGBs+g1c6hbdOsHY9RjqIzlmvHbA5kg9G6C9CLIVfD72wt6FwdEhtxJqz8zObrDt
	iOvAQ5TTK3YYcsVT4uXnNDHTA9HzKY0PUKZmx0s0/ZG/Z0mb58iQiKXLoPD6Bd9dDiUG
	Nl0DonPds1qqc4E9WKB6dzfzcjLrzt2CMKMorr1UBkppM3HMB1Tl5t0P0l+spc+mgN31
	XX1sC+5MHxbpogRf8dOrZw8tp/r7jtbM/70glc9XQntL5npnVMSWQD+AETR9vOQ82HeB
	CeOBKiYycoNQvt4Ya6PQ/GhJrI+Z71cR9Cwh/T43c4nmKtaDih504hFSSWP9qUeHdYFu
	i8pQ==
X-Gm-Message-State: APjAAAWK+Ilvo6bndVpYKEfVNWC8zIKWFk8rDLmAyOtAygWJY3jcapb+
	FIAMoNtVEIn/rucT5be5WPWBIw==
X-Google-Smtp-Source: APXvYqwrjdcyRE97xhn/z2FnPR5yBqkZn9ElMe3qJuRsMyAK+hQxVpBanJ8sh/dM3GE+MEmVruXSXA==
X-Received: by 2002:a5d:6a4b:: with SMTP id t11mr6776262wrw.24.1570118387226; 
	Thu, 03 Oct 2019 08:59:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16sm3556272wrt.12.2019.10.03.08.59.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 08:59:46 -0700 (PDT)
Message-ID: <daf8cfafd4e22a8a2e91cbf8f53d134281aed2d5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Cooper <michaelcooper81@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Oct 2019 16:59:45 +0100
In-Reply-To: <CAEaKURdr0+G66Nm4-nOMVn_3yFUBJJAqxdgzovNuf4o9PyZL4A@mail.gmail.com>
References: <CAEaKURdr0+G66Nm4-nOMVn_3yFUBJJAqxdgzovNuf4o9PyZL4A@mail.gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] Fix #13560 - Partition numbering is broken for MBR primary partition #4
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
X-List-Received-Date: Thu, 03 Oct 2019 15:59:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-03 at 18:36 +0300, Michael Cooper wrote:
> Bug: When wks describes extra partitions that aren't in the partition
> table (e.g. boot loader) and exactly four primary MBR partitions, the
> last partition gets added to fstab as partition #5 instead of #4.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13560
> 
> Signed-off-by: Michael Cooper <michaelcooper81@gmail.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, I've queued this.

For reference, your patch arrived line wrapped. It was simple enough I
could edit that out by hand (been doing this too long, clearly!).

I also tweaked the shortlog to match our guidelines and tweaked the bug
number reference to the standard [YOCTO #13560]. I just mention these
so you can sort next time, thanks for the patch!

Cheers,

Richard


