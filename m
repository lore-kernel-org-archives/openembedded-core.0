Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 822C36E20E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:54:21 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ld13so3809750vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 11:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hcbJQpYlnmjxGAPxF8QFQYDhwdiWbG33XDyIpigM1/w=;
	b=WG2CkCO/YXc1nW/whhqUOgHoaCL3UhHGtOlocnM2Ge2dnjiQBbz1R5nDVdz6SZWVUu
	xcgZEL7iUohOsCay2yN414ld9vQsduFY7PQUSccyghMEE4J9OrEELfaLu8sEXdA5FaOQ
	8x7qKNKaQShDkd/q7y3nFZ/dSzYoM/WzL98g1J11Xe3lNCtvS3OUo7atrTZQkvHTgTS9
	WjISq4Pw+JXezRySYdUp6mAbKPofa8MwCIQ6pyAQbbBFFp2JgMAtKjuNF9mWcTpJSThb
	sEZhDrGzrKph00CiRlEodiO4HKO2edS2JJhPDeudxdT+E2/xP4lSezRNWxIcF9RCfenb
	vljg==
X-Gm-Message-State: ALoCoQmSp3zkfI2+q/qKCPIoy7PI4XGxZJsaWZh8LiwKg2871o7t00zjzv5fchF/9d+fxcNJDij7
X-Received: by 10.52.28.6 with SMTP id x6mr9903793vdg.3.1386618860533; Mon, 09
	Dec 2013 11:54:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Dec 2013 11:53:59 -0800 (PST)
In-Reply-To: <20131209173551.GC3713@jama>
References: <1386608307-4348-1-git-send-email-ross.burton@intel.com>
	<20131209173551.GC3713@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Dec 2013 19:53:59 +0000
Message-ID: <CAJTo0LYB97A6=-OUgKo-7gjL3CHXHt8eBFMGuvZod4TA=VL-SA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcb: fix rebuild when MACHINE changes
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
X-List-Received-Date: Mon, 09 Dec 2013 19:54:23 -0000
Content-Type: text/plain; charset=UTF-8

On 9 December 2013 17:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Dec 09, 2013 at 04:58:27PM +0000, Ross Burton wrote:
>> This recipe was patching the sysroot path directly into configure.ac, which
>> fails when the same source tree is re-used for another machine.
>>
>> Instead, patch in $PKG_CONFIG_SYSROOT_DIR which is already exported for use by
>> pkg-config.
>
> Does it make libxcb signature MACHINE-specific or is sysroot path
> excluded from PKG_CONFIG_SYSROOT_DIR like with STAGING_DIR_HOST?
>
> Maybe I fail to see how it fixes the issue with re-used configured
> directory.

At configure time the current sysroot is used (variable expansion
happens by the configure execution).  The signature doesn't become
machine-specific, as the logic is just replicating what pkg-config
does when reporting include paths inside the .pc files (prepending the
sysroot to them).

Ross

