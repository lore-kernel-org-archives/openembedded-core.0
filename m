Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 821C572F0A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 20:13:14 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id 72so128022330uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qm8lwCPmOZr5HAN9q6AujS2T3NUFw4Is+HULRctb95c=;
	b=H5uZLdLm2Ad/4+3u3nSH13G17qVRBrIH5Y04EiR9Jl0v2iMCHqvmlRdHdKH0euNTQK
	6G2Q7nVS3F0YsWaNFpjBlSEwTARCsS1pYnAiXMxMe/Qann5x88uxRpskjLtyIFcWjQ3G
	VEY9ScW1i/gzS48puiWxMTRBR8Hr/JF9gPnGCxsheSYvq03eoNIv/7KhPrOIzBI2uS9y
	fMhGuaZ/6wiKK3dxj6vQ/eSchL0eKku7JlG5WeTrzXjgrH6GTMeJpvK6jnJ6wfUpgl+s
	+q+HcbsV+Eu9ss1PZpEDbLLqbCzQsJNAUziNZpUDqROZ4a3BP5wI6PpiE8S7aMT61iGQ
	9uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qm8lwCPmOZr5HAN9q6AujS2T3NUFw4Is+HULRctb95c=;
	b=QJu285XJsMVYLvqSRpmJ6h381ELMjHudn+Bd4bPZUScLEmFUf4zGoZVpw8r1aEz2qK
	Za7DBEbH7EBRbBxgBx49fD1Qp76apgNOSdWfTNsptHXgz1QRBbAeesJGje/S5e66cgCy
	D/4c4SC1SGUn+YXj9d7sbqRcc4ps6Dw9LV6sVDkrZ8qYROZwOOfAq4tMfUCA0Uy/XFwE
	PqmArebCqHPkIHZuoPAISwOA3IBvxxxi0/HN/pUksd1ne1M6gFC1ycLpONbeZlxg3/On
	PGs1X+TiQgYfA8hDir4n78ayr64Jb+e/nVaU9gJDJSFx51MFnBb3c1lSUWEl6OdPxGey
	HUCw==
X-Gm-Message-State: AMke39l0LZ7P9n7yKsnNVC2WHiFTLwTWDWJB6/YMVPOBYN8rpOnIRjSQMNpuq94wnoHEokf6uYsrVeYzKIgZtA==
X-Received: by 10.176.70.66 with SMTP id z2mr1634909uab.69.1488571996115; Fri,
	03 Mar 2017 12:13:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Fri, 3 Mar 2017 12:12:45 -0800 (PST)
In-Reply-To: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
References: <119c985a-4527-9ced-6cfe-46ccdecbba67@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Mar 2017 12:12:45 -0800
Message-ID: <CAMKF1spQU9cmk22_Q7VtwKqJ+vVji-YfOHewUr8sz7ykkJaG3Q@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] clang/LLVM versioning
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
X-List-Received-Date: Fri, 03 Mar 2017 20:13:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 10:44 AM, Martin Kelly <mkelly@xevo.com> wrote:
> Hi,
>
> I'm attempting to build a recipe using the LLVM/clang cross toolchain
> provided in meta-clang. However, I'm hitting issues with the llvm-config
> wrapper in llvm-common. Specifically, it looks like the wrapper was copied
> over from the LLVM recipe in meta-oe, but the versioning logic was not
> updated, so when the wrapper attempts to exec the versioned
> llvm-config-${WANT_LLVM_RELEASE}, it fails. Notably, LLVM_RELEASE is not set
> in meta-clang/recipes-devtools/clang/clang.inc.
>
> I'm looking into fixing the wrapper, but before I go too far down that path,
> I wanted to get clarification as to the intention of how versioning is
> handled in meta-clang. Specifically, the original LLVM recipe was clearly
> built to support multiple side-by-side LLVM versions on the same system. Do
> we have the same goal for meta-clang? IOW, should I make sure that the
> versioning logic works for meta-clang, or should we instead just abandon the
> versioning (and the wrapper) and support a single version of clang/LLVM?
>
with  meta-clang there is no desire to support multiple versions of
llvm and thats why versioning was dropped however, I would still like
to fix the versioning if that makes it more useful.

> Thanks,
> Martin

