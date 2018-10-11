Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA4360801
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 18:55:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 61-v6so10846380wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wxZ+Fr/Wnc02sNaiT758G8mOlyd7OhTgnGEJ4e7bPJc=;
	b=DDvM5WeOFhxmi2c+Df0Scv5BrfK14vStPX/SsnoLwf75CHNSkqpoHBh6ABkbfVPI4O
	z40hpLpaV7dEaFZOkH9VJENd6BkCPp3OPRiufZo58GcS26i8I26OPvKwI3z9NzGq/6uE
	Y2G6z7o5menyFby86nfC+0h7uSujNMdJWX9AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wxZ+Fr/Wnc02sNaiT758G8mOlyd7OhTgnGEJ4e7bPJc=;
	b=jhjU/Vo4CcMMgs7oKB/ejctm91T+30ceQwREWNqZUiukhiiaZYgAMnZCXzZkteekUm
	y4LAeow9RiHB7UEqkQE05eM+IFoHAkT4WQ6TcWfrUKSuS3MjKDLJpc5uCt01DRm4+3oi
	bPjKlzkEqiXUfpRNHHDaVWBrUHiI2v+wq12Zhmd1mYe8ZfCz5j7dQ0K7cqpUhx46lzXe
	sD5T/uy0LytOX9bRm8YhkK2nGORLkPHz9lqieGKPW5cdqF8lXmxNZyifxfG4f3UxjXEn
	HJO8/CA1zLXzwWv2hj6qkswvFOoT59gtYpGN1ByRRx5NNLntPqRH+QOXI4oUrriEhp5a
	Bp+w==
X-Gm-Message-State: ABuFfog/T54YdvKxoza1EQaVWTLuHZfDsJwL35z8k7pF+JAsnQZW7xwS
	nd8HQJzHKZZBkV41r9eGTUeWwA==
X-Google-Smtp-Source: ACcGV61bMrFvuel+Or0uIv0qIH3qnidiWvLum0VwetvksyMtFS9gPB24fM9t/wjFmu+7o3LxHcNFTg==
X-Received: by 2002:adf:a144:: with SMTP id
	r4-v6mr2610963wrr.169.1539284135634; 
	Thu, 11 Oct 2018 11:55:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm23357041wmd.41.2018.10.11.11.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 11:55:34 -0700 (PDT)
Message-ID: <ae1bccd3a002637aef132d5cee1316bfe717e018.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Thu, 11 Oct 2018 19:55:33 +0100
In-Reply-To: <eedd956a3e7af4d2c64033d1b06944036c5d6536.1539267480.git.kai.kang@windriver.com>
References: <cover.1539267480.git.kai.kang@windriver.com>
	<eedd956a3e7af4d2c64033d1b06944036c5d6536.1539267480.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] nss: fix non-determinism when create blank certificate
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
X-List-Received-Date: Thu, 11 Oct 2018 18:55:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 22:24 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It uses tool certutil from nss to create a blank certificate. But the
> checksum of output file key4.db changes every time:
> 
> $ certutil -N -d sql:. --empty-password
> $ md5sum *
> f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
> b892c5ff7c1977d4728240b0cf628377  key4.db
> 7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt
> $ rm *
> 
> $ certutil -N -d sql:. --empty-password
> $ md5sum *
> f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
> 405d55178e866a115c1aa975fccfa764  key4.db
> 7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt
> 
> Provide pre-created blank database files to fix non-determinism
> issue.
> And these files are from nss qemux86-64 build.

I agree with this however can we leave a comment in the recipe about
why we're including these and instructions on how to rebuild them
please?

Cheers,

Richard


