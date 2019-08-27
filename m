Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4BA7D5C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 20:57:40 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id j25so363873vsq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 13:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=T/hTSmNDuDRWoHyN3szA7dXZ6UGtwzRzggOJQSkGG3A=;
	b=ZNhdUN/tkOLOwXIHA9e2Zaf5N9IUxsNFiV6YEnXESBKtvagQdpP82oRW2DFaFqLIBX
	ildQNCWhtOTsO/srwPrxYIRXAoJ8Led/egcZi9d8hIDUh9Dy+PuxjZ9WRzwX1SDMkImw
	xogKHma/A2fkGJDEGPF4qWApwFLFNcUjj45ie52b6n83EJfq3QCCHqahfhIwA0sJPQCa
	QbOblAGxQMeosHPoDLB0bsUVyol+lJYYHj2xilOaYypCmKvnN0j5T2D24zzHi8yAV3P9
	dQn1McfPJtSvh1z7vJV3UJAFqHD35WegAoc/GDI8xMpBsAlmFrHZJOqWAF8Fbx24jLQd
	tqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=T/hTSmNDuDRWoHyN3szA7dXZ6UGtwzRzggOJQSkGG3A=;
	b=QFyJUapn2COj3mlnjsSlWeYZuhvJYUv8IwBqx/38ge6WD5mRLUIey0IYXF+4UKnNIa
	8dxxSUx+Xh4adpp7A/JGuzmd5cByyN68V6hN3Fg2rkza3uZD9iGGrygGSi8JJgNgREsl
	3e6vEInE8hCJOJqOWw4WHFTmIrLH+W5qK0r90mNCXVaCmouFGlFvoCFq4syVjKGNNXUr
	vzLLUQPXbS5Bqr0noWmH/c62tduFCkMK7Evjdj8U5jKj5PlAYtYtAs9p9XpOH9IQWNZe
	6go9DTRx59+fIF2lMvHA+pUvRJ+Yd21vLCz/J+P3MAjqBIVuyNTlhFsETars0o+lCKsr
	/jpA==
X-Gm-Message-State: APjAAAUZzeNDxR98aqrWnrV+1flzpidZeu/EVj4pfwmDTbXok1yijh7K
	xmfcHGiqCXhdafJgAao5N6uUD7AJF3x2vRXu4+s=
X-Google-Smtp-Source: APXvYqxc9qITqRwSE8+Bl7MMXEHcG5w0W2tX3leSbNZeutwI/c/1cni+jlGEu5bPa9mN24CnwzknnegdLta0hh2TSCQ=
X-Received: by 2002:a67:ec50:: with SMTP id z16mr357159vso.137.1566939460965; 
	Tue, 27 Aug 2019 13:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190321123042.2947-1-ross.burton@intel.com>
In-Reply-To: <20190321123042.2947-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 27 Aug 2019 13:57:29 -0700
Message-ID: <CAJ86T=VdYKJ_Z0SvmRZYMoh3GfHk0kTMUVPAxZK6X3WcwAu+LQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: improve license checksumming logic
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
X-List-Received-Date: Tue, 27 Aug 2019 20:57:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 21, 2019 at 5:30 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Instead of opening files as bytes and battling decoding to UTF-8 which can throw
> exceptions, open directly as strings and replace invalid codepoints.  This
> handles licenses in encodings which are not UTF-8 but are based on ASCII much
> better.
>
> Also instead of extracting the license lines, writing them to a file, and then
> hashing the file, hash the lines directly.

This change seems to cause a regression in the debug output generated
if LIC_FILES_CHKSUM is wrong. If endline is set incorrectly to include
an empty line beyond the end of the intended license text then that
empty line will no longer be shown between the "vvv" and "^^^" lines
in the debug output... even though the extra line is included in the
md5 calculation.

