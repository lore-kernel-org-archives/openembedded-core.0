Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E383060616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 15:29:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t8so18174345wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 07:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s3GO6GJp9EZrdF1yTzt/2W64okqvD4886uRqPTdNfcI=;
	b=RaA4e7vTQirBLb5p/2zC5uazPDE6nMLCPy1xQFOZPvlqvebo5X9OxhOUurtmU/2jS7
	FPHYkkyCVIlO8OpNt2yLkykJT7ZeJietZ5ELJQBLO8eSk3hxlutpUeo5249E1HY+/V1W
	TTDxZFEwz88nj9mi/Ab355CNVDEc4ufZUBuawaLZ2T/+SrFQ+WiCv+w76BvZTfvrCFGF
	JA60X5i7Y9v/xLa0ugz5Tj0rx8veuZzbl08d1/Ci05VHGSiomzk+2FgfiI8O/kDqPELE
	TUNjSIfi7oQixrH3CUx0DYG5VAeKTfYKDH+gHwIgJlNNQiD0AENkktgVMt04VZmPQjeO
	e48g==
X-Gm-Message-State: AKGB3mLZP330NDbz/xuuvIjwgQ/oXEBAA32WHngGX/3ua2wAlBjVaFQd
	YHG3S0J+AcBmwOs/+r7s2m2TFoOU
X-Google-Smtp-Source: ACJfBotYZx2EwbDRyvNhlkCNdJHlArGP4/UV849NgWd8BqI48QANkCKXZwm/aLrN2JCEUG1PvZNybw==
X-Received: by 10.80.173.56 with SMTP id y53mr17426314edc.202.1513351794250;
	Fri, 15 Dec 2017 07:29:54 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e25sm5690309edc.64.2017.12.15.07.29.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Dec 2017 07:29:53 -0800 (PST)
Message-ID: <1513351792.21903.53.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Dec 2017 15:29:52 +0000
In-Reply-To: <CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
X-Mailer: Evolution 3.26.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Fri, 15 Dec 2017 15:29:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-12-07 at 11:27 -0800, Andre McCurdy wrote:
> On Fri, Nov 17, 2017 at 4:02 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > +
> > +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be',
> > 'big', 'little', d)}"
> 
> SITEINFO_ENDIANNESS returns the endianness of the target, not the
> host.

Isn't the host what you call target? When cross-compiling, the host machine
normally refers to the system where the built programs will be run, and
target machine to where the a compiler will run, in case a compiler is being
(cross-)compiled.

${MESON_HOST_ENDIAN} is used inside the [host_machine] statement, so this
looks right.

> [...]

> 
> > +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES',
> > 'bigendian', 'big', 'little', d)}"
> 
> This won't work for all targets (e.g. PowerPC is big endian but
> doesn't include "bigendian" in TUNE_FEATURES). To determine the
> endianness of the target, use SITEINFO_ENDIANNESS instead.

${MESON_TARGET_ENDIAN} is used inside a [target_machine] statement, though.
Not sure about the naming and intention here...


Cheers,
Andre'


