Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7AC7C346
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 11:02:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d18so5830769wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aEHnYh4eQrBnRGRGk/rdctjDEgd4soxqf+WL1kPZkpM=;
	b=dtR7MS7hXFFwxQPBVAQCHgZUgwDlAxgeep3Tf1TKSPRWo4Qov56fKSuhinM3D186tz
	V9wi4MPQJ4v5PUv3zu1GZQI/9Ub7aA9AU+2hSodKQS2ns1HRzjCCnYLivDJoUs6j1HiC
	reEYfAgT2sgjfeQySQtlt/sC4jgAxWgOwouEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aEHnYh4eQrBnRGRGk/rdctjDEgd4soxqf+WL1kPZkpM=;
	b=hQfSMf09KuE1P3cmsltBBrEbXakrieLQ4ZLBqJDjgXlnWFgc8ckNaHgRNx7xKzDvdL
	urqw5XhdCs4YrkULDzoMMg0uQW9eZgCa6G1Bok5WwqhMefSPwzvJP1h9U4HfQx28QlXl
	SNJMBJttqqso3DfE2o5cqJIQ0SY3MdayXqEznu0uFDT2K6xXeaG5ofggZjqlWQ/KECra
	rg2VDI/Jmzp9r8oVvPYmdtFSSWAsyDt470vCaEAqS8tdj4Ct4okjRrZcJBhBG+7LQiaL
	RQg8rp7/TJTyXMafb8srzbZLsBG7fqmkmm0e6FMWUenfZVACxxqWx+dwdda+Rz0loEyK
	BPEg==
X-Gm-Message-State: APjAAAVtPPLVEAZICxYzMVNDEuTwa2NxLx4jujR2pjeaisBO4cDdhTQo
	OyNrfn+NmSYs+zviUtV3AiRRHA==
X-Google-Smtp-Source: APXvYqx61qSsDXeCUVdcgrgZLgrDbkEQvFZUBG8KklSwwKbjMyv+0h7Q14RfFqkLNAK8AMi3HfWCUg==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr7756254wrt.84.1561719735021;
	Fri, 28 Jun 2019 04:02:15 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r79sm1587012wme.2.2019.06.28.04.02.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 04:02:14 -0700 (PDT)
Message-ID: <9b5dca23cf1d8a90466bc084236599487726f4b6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org, 
	matt@madison.systems
Date: Fri, 28 Jun 2019 12:02:13 +0100
In-Reply-To: <20190628075701.78128-1-mingli.yu@windriver.com>
References: <20190628075701.78128-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] go-dep: disable PTEST_ENABLED
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
X-List-Received-Date: Fri, 28 Jun 2019 11:02:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-28 at 00:57 -0700, mingli.yu@windriver.com wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The run-ptest logic for go-dep actually runs the
> /usr/lib64/go-dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose
> source file is 
> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go.
> 
> That dep_test.go starts by rebuilding the dep program
> from source, then runs the tests using that copy of the
> program, so it's assuming that we're still in a development
> environment where we can run a full go build.
> 
> Considering it not being designed for a cross-build setup,
> so disable PTEST_ENABLED.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/go/go-dep_0.5.0.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-
> devtools/go/go-dep_0.5.0.bb
> index a4d631f8ea..e9fc12fa5a 100644
> --- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
> +++ b/meta/recipes-devtools/go/go-dep_0.5.0.bb
> @@ -21,5 +21,6 @@ BBCLASSEXTEND = "native nativesdk"
>  
>  # For compiling ptest on mips and mips64, the current go-dep version
> fails with the go 1.11 toolchain.
>  # error message: vet config not found
> -PTEST_ENABLED_mips = "0"
> -PTEST_ENABLED_mips64 = "0"
> +# disable PTEST_ENABLED as the run-ptest script for go-dep actually
> runs the /usr/lib64/go-
> dep/ptest/github.com/golang/dep/cmd/dep/dep.test whose source file is
> https://github.com/golang/dep/blob/master/cmd/dep/dep_test.go not
> being designed for a cross-build setup.
> +PTEST_ENABLED = "0"
> +PTEST_ENABLED = "0"

Setting it twice looks wrong.

If we're disabling it, why would we inherit the ptest class at all as
its not going to work anywhere?

Upstream not considering cross test usecases isn't a reason to disable
a test, we have many tests enabled where upstream haven't considered a
cross use case, we just tend to patch as needed and start a discussion
with them.

It sounds like its actually a network access problem from the image
you're running into anyway?

Cheers,

Richard



