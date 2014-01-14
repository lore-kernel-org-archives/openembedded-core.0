Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 588716DDF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 10:22:12 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id e9so7426952qcy.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 02:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UQxF60Bqp0SBApyWX3J+tuzhNPnCbBdRHVt9mEmh9NQ=;
	b=VNLrU22PucDUb0qpB3Se5KN0/8KS9f2mhdInp39AjcvHcDuUfn3G5SA92DOdkpH0J0
	kzS0VG8aPTAHLt+S60afHNweFiUi1Ga2O7KbRCGViyIm8WIw/4myiQC/17Z/2CFStUH+
	Xgr6pSoy9EPWCS5QT7RLg6GySIWu5ZSO/nUGMZORZrX5P/TlUSKFs1PPOVmiC9LZyxvK
	JBntrAG5bB3knEoXTzMKiPpE+AbLNsFt0MveRHB7cgNHzHaObNSn5/6zmeaQ0mAT9tDV
	fRW5JNyGtmt33YDxUVqz18LN2Yz6zqMndIp1LCQEjkEF1uQ9ZQZxt4adrereaudA1oeO
	atwQ==
X-Gm-Message-State: ALoCoQnJuc3I6VA0V79LBKJLdbdzxMdxPXo5NieEVMGCWWDNIQ+ZDC5fAoWk7o7sMNt0gRuBag2t
X-Received: by 10.229.179.69 with SMTP id bp5mr1279545qcb.17.1389694932658;
	Tue, 14 Jan 2014 02:22:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Tue, 14 Jan 2014 02:21:52 -0800 (PST)
In-Reply-To: <52D50ED6.3020507@windriver.com>
References: <1389692997-5088-1-git-send-email-b28495@freescale.com>
	<1389692997-5088-2-git-send-email-b28495@freescale.com>
	<52D50ED6.3020507@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jan 2014 10:21:52 +0000
Message-ID: <CAJTo0La-CCG5rO96SbWpii4JkCAZ6SaA3L3ri1CFb8qRoBQM1Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] kmod-native: Only use O_CLOEXEC if it is defined
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
X-List-Received-Date: Tue, 14 Jan 2014 10:22:14 -0000
Content-Type: text/plain; charset=UTF-8

On 14 January 2014 10:17, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> On 01/14/2014 05:49 PM, b28495@freescale.com wrote:
>>
>> From: Ting Liu <b28495@freescale.com>
>>
>> O_CLOEXEC is not available on some distro, such as centos 5.x
>>
>
> Hi Ting,
>
> Missing the Upstream-Status here, and for the O_CLOEXEC, how about:
>
> #ifdef O_CLOEXEC
> #define O_RDONLY_O_CLOEXEC      O_RDONLY|O_CLOEXEC
> #else
> #define O_RDONLY_O_CLOEXEC      O_RDONLY
> #endif
>
> or something like this, so you don't have to use the "#ifdef" everywhere.

Or to be even less invasive:

#ifndef O_CLOEXEC
#define O_CLOEXEC 0
#endif

Have you verified that it's safe to drop O_CLOEXEC and it doesn't need
to be replaced with fnctl(FD_CLOEXEC) calls?

Ross

