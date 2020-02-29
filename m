Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 859E560984
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 21:39:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r7so7744897wro.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mL9LcGy5MuQAd+hFsV4o3aN9N+RIJ/g7iX5fITX3om4=;
	b=CXf7Dru38VDi7NWB4853tuzv/I55cowMsFsJ2R4wrXVnMEwJ48EzH5szfN6lDli5cu
	Wyv+/dL5QAcEt44rKhp3Zk1eBy0evk3FMz9M4pQopG7AV+VCJbhp3JmUL4kOsgmecKPR
	91Aip3gqmeRXatarlumUjZO4MEAwWCu7K19GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mL9LcGy5MuQAd+hFsV4o3aN9N+RIJ/g7iX5fITX3om4=;
	b=UIgf8ncz/ee117WxUtODKiqdg64H14oq7YX7cb6UySqhSSYDqK1bU5xR/VdUVVMUQt
	SJ3Crag68ao00OIV6fCbtmiCtHh/c+ne12DBfTBClBaLB6SaJPuNc7z8nHkCmCp+zRHr
	6bFM6naN0X6CzYKLMFrcR81wqlBZZfKphvoJm5flNu0PhEghx/J/rIsstgXU2ZXdrlyq
	dtq6l/hXLpbe65VuhLjoQV3W4xXM7N3YcuGBFVPlcjhDbcW5AVEV+PI6yGrPErimnP4q
	lvJwRPy2YEfIsml3ZXwubs+Bu6gkifhbaeSBHREsqtGTJhAsa/QnZKsqy99r/LGtxXET
	TsMA==
X-Gm-Message-State: APjAAAVwSS5ep1WZoAD7lDaHgjy1t/pvhWBEhOKcOk+917AMaYTBTicj
	F81PJtY0iNg3UqEMv1zj6qJZdg==
X-Google-Smtp-Source: APXvYqxf6ZqBMzN9DiUBNqNv4nORvxnhqVubzm+8THnMxjhZIj8BWqKqyvZWiHFDxbhFKzDHSMFI8g==
X-Received: by 2002:a5d:6891:: with SMTP id h17mr11949599wru.259.1583012370987;
	Sat, 29 Feb 2020 13:39:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u20sm30701wmj.14.2020.02.29.13.39.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 13:39:30 -0800 (PST)
Message-ID: <e4f0cc01dd0ed40905d8b8e2ed4b972215f94b67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 21:39:29 +0000
In-Reply-To: <20200229194707.14400-1-alex.kanavin@gmail.com>
References: <20200229194707.14400-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] selftest/tinfoil: fix a race condition
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
X-List-Received-Date: Sat, 29 Feb 2020 21:39:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-29 at 20:47 +0100, Alexander Kanavin wrote:
> Both test_parse_recipe_initial_datastore and the preceding test
> operate on the same recipe, and both change recipe metadata and re-
> parse
> it. In some situations bitbake backend from the first test is
> catching the change done by the second test and interprets it as
> non-deterministic metadata (not sure if this sentence is entirely
> technically correct though :).
> 
> The easiest way to avoid is to make the tests operate on two
> different recipes.
> 
> [YOCTO #13812]

I'm not sure its this simple unfortunately.

The big question is whether injected changes from the first "session"
should persist into the second "session" or whether things should be
reset to a consistent state between them.

Yes, this will fix the test but I'm not sure its fixing the underlying
problem :(

Cheers,

Richard

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/tinfoil.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py
> b/meta/lib/oeqa/selftest/cases/tinfoil.py
> index 42a1b6b4f4..1bbb7eeec7 100644
> --- a/meta/lib/oeqa/selftest/cases/tinfoil.py
> +++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
> @@ -68,7 +68,7 @@ class TinfoilTests(OESelftestTestCase):
>      def test_parse_recipe_initial_datastore(self):
>          with bb.tinfoil.Tinfoil() as tinfoil:
>              tinfoil.prepare(config_only=False, quiet=2)
> -            testrecipe = 'mdadm'
> +            testrecipe = 'psplash'
>              best = tinfoil.find_best_provider(testrecipe)
>              if not best:
>                  self.fail('Unable to find recipe providing %s' %
> testrecipe)
> -- 
> 2.25.1
> 


