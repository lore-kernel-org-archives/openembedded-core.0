Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2297E26B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 08:08:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v19so1258931wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YVEIlzNYs99qxZBNOInU3Y4tZ8Opk9l67g2jKQ90ZE8=;
	b=H9avpBTJZKNvZWxwogNgC7JVd9//Iv7Vxf6uc0Tm0YGuMbGqZrT1qEVKzTZIM4aEMm
	nYIrCvbnYU77s3zPCZx6zesMfQdQcKVdPF2qrFFG69QEmeL3M4uNxLQ1TdcFE5r4SiWt
	uPUkNhKAhNOj0U8kWkxbT9KDi5jMDis8qoxY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YVEIlzNYs99qxZBNOInU3Y4tZ8Opk9l67g2jKQ90ZE8=;
	b=LabeBCFE7QOz4VffoiX33RzdR7OaVf+N358BznXDFexiO43TJe3qRL9dUbQloU9Tcg
	msq0lU3In0ZNESATueNwiPp3NhumKQogQRmDdNgqbIOukr3+h8pBAIG3y3K5A20hdbvG
	RpMSWi5ynkE/bzQE7SXXdQxVnAAB3cr7eiokIzhS73DaDQ9vIcp/6gCLbECy3DNEO9gb
	lpQbz+nyRnsu25fErCzcZ0KjVVWr0jIkXnRL20Mp1Huux8cKhRdYeXee0m+D/Mqo4EVt
	CbZ9KBkB64hIFBPx3Jqy/QlgilazsswkDpsd1OiFFx/JAdb+/HsZpdi9nYu+mxpIsAyF
	f2uQ==
X-Gm-Message-State: APjAAAVmyPet4RRxEYQlx99YsihMoEsJIQoD1wE6ug+mkg3Ds/pAs21o
	zyODGfycCHZHiXd6blf7KMoKDrhjuow=
X-Google-Smtp-Source: APXvYqxmvRsCekS+W9xy789+wL6SXFIzoGL0cW8dSVCZmGe+UKXeOTPuBRWaQDnvea57DgFPVIQzUQ==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr7181028wmb.81.1562141324914; 
	Wed, 03 Jul 2019 01:08:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b203sm1735150wmd.41.2019.07.03.01.08.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 01:08:44 -0700 (PDT)
Message-ID: <84dceda550ae94d4a899ea42dd0f59c5462baeda.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2019 09:08:43 +0100
In-Reply-To: <20190702152248.13678-2-ross.burton@intel.com>
References: <20190702152248.13678-1-ross.burton@intel.com>
	<20190702152248.13678-2-ross.burton@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] multilib_script: use MLPREFIX instead of libdir when renaming
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
X-List-Received-Date: Wed, 03 Jul 2019 08:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-02 at 16:22 +0100, Ross Burton wrote:
> Instead of using part of ${base_libdir} to rename scripts, use
> MLPREFIX.  This
> is more obvious as MLPREFIX is a common prefix in package names, and
> as these
> filenames are hidden behind alternatives they're rarely used
> directly.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/multilib_script.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

This appears to have some issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/794

Cheers,

Richard


