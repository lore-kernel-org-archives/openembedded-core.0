Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9200D731C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 17:52:59 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id p186so112197323qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 10:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2clfcD3CMEXkwWncfKnoZMVa2wOhTJt/tnTMPT82f0U=;
	b=Kev0w7o/gTKUHkKVx4lgm8nEpci1x77sB4sdI7dkfja6JUAkF9PzIDrJk/YzLeq8Oe
	u5yRTLDUp1w02rC9Lx1SZP5L5RGEy6w9EyABifv+2uP75OzGTADMHzNJk1PGJW6s+T1l
	FhkxFNlRcc/YjGNfuFUwNplD3FkKcAmVP5Pe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2clfcD3CMEXkwWncfKnoZMVa2wOhTJt/tnTMPT82f0U=;
	b=C231o08DjcwIAuuybUSgcVHtfqRqu3l145bhCfGBrZFv9K5v1lA/zSD6tbGRVPGp1w
	mXPXrck+EINNAzPOAkZ3ixLGraO1G4n8wpHNKQdCEVR8AndoH+ANkonAoGM7MrOAMEMS
	F37bQy1hr+ItcWoue4FSIZlYS9KxsdcL4pClCRokXxV4cdEHtFySrlfF/mzvtmV/g9u7
	c6wROvmsk/oqfTjFuvzx5SiYWXTF/OUvhPS6Qf4RWv2hUDf+ogROPQ60StR8kmLoDQRC
	9dWwNzmt71IMtPfARITSAmWnJeQrrphgGhziCFxT1IuubsEenRM2K5Lwc60CZrogeUQD
	25ZQ==
X-Gm-Message-State: AEkoouvuQSyEcfaOIgduxveAnTsxZbF5z3oYoBErE8M+9iBwziLwBY3L1hD8mu9HBGYI5Q==
X-Received: by 10.55.23.152 with SMTP id 24mr8198129qkx.241.1470333179976;
	Thu, 04 Aug 2016 10:52:59 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-70AD-A915-8898-B875.dyn6.twc.com.
	[2606:a000:1407:c0e8:70ad:a915:8898:b875])
	by smtp.gmail.com with ESMTPSA id
	r29sm7450596qte.48.2016.08.04.10.52.58
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 04 Aug 2016 10:52:59 -0700 (PDT)
Date: Thu, 4 Aug 2016 13:53:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Andrew Bradford <andrew@bradfordembedded.com>
Message-ID: <20160804175317.GK9942@bill-the-cat>
References: <1470332440-25417-1-git-send-email-andrew@bradfordembedded.com>
MIME-Version: 1.0
In-Reply-To: <1470332440-25417-1-git-send-email-andrew@bradfordembedded.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
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
X-List-Received-Date: Thu, 04 Aug 2016 17:53:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2016 at 01:40:40PM -0400, Andrew Bradford wrote:

> From: Andrew Bradford <andrew.bradford@kodakalaris.com>
> 
> Prior to assembling the fitimage, ensure that $B is the cwd due to
> bitbake commit 67a7b8b021badc17d8fdf447c250e79d291e75f7 "build: don't
> use $B as the default cwd for functions".
> 
> Without this change, do_assemble_fitimage() fails like:
> 
> Log data follows:
> | DEBUG: Executing shell function do_assemble_fitimage
> | arm-ka-linux-gnueabi-objcopy: 'vmlinux': No such file
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_assemble_fitimage
> 
> Signed-off-by: Andrew Bradford <andrew.bradford@kodakalaris.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

