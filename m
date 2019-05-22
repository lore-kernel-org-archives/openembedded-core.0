Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE957E38A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:28:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i8so1556887oth.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7hll9qiVmyx9oUR6A3USwT72Un4xrSXdIFPmHraCHwY=;
	b=EukX9t4iqnwE9POjWAog/AD0lUTvgZmzNHBCjE9Js/HKx5Pb5Y2SHGwKv30mzgzTwr
	ihpPKVlNFN8L1YyewnGOe3bNKvZO0NrWcVkCTYSxP5nUi+4qyOskCpMQkFqNZLC04VHN
	IAaKXv4VMLqNFpR3JPiKa++orvGCUDpaV99Lxeg9CQbcZsPlgGLJ07Q2sFoG998fBGCB
	hqqpwDWPkhtX3UIOUtWm5WjCTSm2LDChsogXbtGPbL1PyYdI4kD00ank6oiF/maW0oxG
	cua64BOvC4HscLDF5ps/YhKgAhuV2p1g+9ndAHyHMPCHrUT828ZLITsH3axprINtWKTy
	r1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7hll9qiVmyx9oUR6A3USwT72Un4xrSXdIFPmHraCHwY=;
	b=rIQsG5OjXmKcNP/mitJQFr28XzGCpRbNvta+egKbtNjCyzOe8td+lilMER3TQfjzz5
	DHZaUb5kOErO+4AZ1Zqm74uYISih7GO86Ni8lN0SmbI7CzlO+9OXYMQ1ZS+D1RE2S1lw
	i0w6wRdp2tOPgoEmSAOahkt5yJeanVSwvIMcEjlW4kQ3LMLTibL+h/vOnV65OSK2sSrS
	AnYZ5mpqf+aaeQpC0vfzuPtienXBKm2H7TjYEjetO5GFjK7dDod1YGxFOCNxoqsLsY8s
	sCp/JcT1X/N1oCsVhIookRceoFntwNA89Ch8yb3Z2Opy5U7PWhHaYbvSGOLafT86dTHW
	mkBg==
X-Gm-Message-State: APjAAAW/ScgRLb1/7EHPsO5BUJDUx78nUaxO47vDBKhLGcf5NCdWy8qU
	VGMBVdDrTNuqC3Mvxj/ASyS4k9cfwZw80WI6dlg=
X-Google-Smtp-Source: APXvYqzLJ4szOysPu6nqfDg5sT9WiLDk6Zi3FzJ6H7lkaQ4zyjNFdMo8ODw+FRCwVJWdY0WHbG/hSWk6iHUo+sfnEgU=
X-Received: by 2002:a05:6830:1541:: with SMTP id
	l1mr24618461otp.350.1558520899464; 
	Wed, 22 May 2019 03:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190521161158.45329-1-alex.kanavin@gmail.com>
	<CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
In-Reply-To: <CAMKF1so7ASfBEknz4t727WGHvSOvJ2z=v87m0o=iZW4VdqFztw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2019 12:28:08 +0200
Message-ID: <CANNYZj8cSb0_7fRhG=bbizctTnaQg53hVwSzOu5WoWr9ywbMKQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodulemd: fix erroneous linking against v2 library when v1 was requested
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
X-List-Received-Date: Wed, 22 May 2019 10:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2019 at 04:04, Khem Raj <raj.khem@gmail.com> wrote:
> > +
> > + pkg.generate(
> > +-    libraries : modulemd_v1_lib,
> > ++    libraries : '-l:libmodulemd.so.1',
>
> shouldn't it be generating a separate package for v1 ?
> hardcoding linker paths seems a bit hackish here, is it going
> to generate a .pc file with .so.1 version ?

The problem is that both v2 and v1 are installed into the sysroot; we
don't have a mechanism to choose one or the other via DEPENDS (unlike
desktop distros where you can install -v1-dev or -v2-dev package for
your build).
Then both v2 and v1 .pc files (without this patch) refer to
'-lmodulemd' which in our case always resolves to v2 library.

Wth the patch the generated v1 .pc will look like this, while v2
continues to use the original '-lmodlulemd' in Libs:

prefix=${pcfiledir}/../../../usr
libdir=${prefix}/lib
includedir=${prefix}/include

Name: modulemd
Description: Module metadata manipulation library
Version: 1.8.10
Requires: glib-2.0, gobject-2.0
Libs: -l:libmodulemd.so.1
Cflags: -I${includedir}/modulemd


Alex

