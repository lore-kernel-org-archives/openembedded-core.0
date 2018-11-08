Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7C378C05
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 14:15:09 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id r12-v6so1715749ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 06:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B7Uu5vKa9hDeM74HacUvhcC6yCpjp4/vyhETOHRs1r0=;
	b=XT9+aJ02JolhmV/F7jeBr93ZvavjJSn69fvpyhlw8JxziDI5FD6+bIcDpxPCv0sFCh
	rn48aj3S7roC3FRtXkh4na2uH0iMs0WUzf+h7XfjDiv/NvVqFEe8w0B9e5+mdYYDw7hT
	+/6/Jpqr+H3zdBN6cg65y0PY0YJKMkT0uLcxeAktdYX92uPXPVa2W1ZI5kp76riasUmh
	h9kOfcyvX/8J5VDHThdALceL1MMSrgJLfkpPOuX3o7odKrYyJyr/zEchGcMUewuY0LxO
	r3LeaaHHEX+56EkE1tnAhsY3djeVdD6D6ucVzaoyC713XbzuVqPD6IfnT0RmTfLZt0x5
	xw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B7Uu5vKa9hDeM74HacUvhcC6yCpjp4/vyhETOHRs1r0=;
	b=U1L2qYfNV4dolm4/TOrnUOBWIfCvm1Sqfmqn277z2GD0LLL1VpwNCCIFLyOTe3j7hV
	rqhxKPSzNAqKIS6RVv6/aNxch6EyVd0op64aOtR1o70aJg3wHUEA1nkhfJ4P/KVXbs2E
	e6AM7Kyeuq0HWdxzkSsAboDRXoOAxace9t43pEdgKQoUBv0Rp11PSg3VLDbOKFpyQC34
	ieUkKfWYBqRlbEA3a4WrtCQBFo5b82RHvKnpE5Bpa/osmh+dTmfBFRkzKdgGIP2lWUPO
	VfuuYTGUBSvl2sKmDhkNDtPELzIG+foALyvYtmdzbNwqqApKyLbfFHwLAreqdDrNjEji
	vxCQ==
X-Gm-Message-State: AGRZ1gKUpwuSQVK/Uxnhhk2nU2eGjK4oSz2F+FSZ+RXSWAqJ00IQ99+C
	L5Wf5WmLufzb9AryCzUA3uhEOj3bnAQukizYaEYFHw==
X-Google-Smtp-Source: AJdET5eRZ1pT4lvJuZAfq2ycHwAlbN5I0q4CCLROHB/J7qJn6tIXaDEydeSuv08nzNf4FaaQMrhbr5SGNEE3UsHpIcs=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr1265474ite.130.1541686510957; 
	Thu, 08 Nov 2018 06:15:10 -0800 (PST)
MIME-Version: 1.0
References: <20181107175922.6631-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20181107175922.6631-1-Randy.MacLeod@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Nov 2018 14:14:59 +0000
Message-ID: <CAJTo0LaNF-q9Lj6-VZgnGbX154hO_XOx7KaKzxcAzys1WBBnPg@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: drop mips n32 support
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
X-List-Received-Date: Thu, 08 Nov 2018 14:15:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Nov 2018 at 18:00, Randy MacLeod <Randy.MacLeod@windriver.com> wrote:
> valgrind for qemumips64 multilib builds fails to configure
> for libn32 with the error:
>    configure:6190: checking for 32 bit build support
>    ...
>    fatal error: bits/long-double-32.h: No such file or directory
> It seems that the toolchain is producing:
>    tmp-glibc/sysroots-components/mips64-n32/libn32-glibc/usr/include/bits/long-double-n32.h
>
> Until the toolchain problem is resolved, skip valgrind for libn32.

Is there a bug filed for this?

Ross

