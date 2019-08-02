Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5C78D7D65D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 16:17:23 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id y4so77770716wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+qEUrnDReSu8BZQ/dG8UZIytK58GFtueJ8lkrllx1AA=;
	b=X36pEpyxDuEc43euNCWi5PfFs0rPAkV04ebv1EIWL8uEL0kCHWteWZvijSOHVkKgNy
	FVKaqZ3MfevalFmDN8KkLmTMc7a6aEio2mVR8lcnGVMACidYPiMTODQqwnTgXSkGIluT
	VOI/S7HPEAPSQs0i2/vv3iHfY5yIVllirbZtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+qEUrnDReSu8BZQ/dG8UZIytK58GFtueJ8lkrllx1AA=;
	b=inHH4QOr8KRHK/XLXpk9OY6bHCvmSofq0kw8UNSA833+9jLZzal3F97IzUExbyYqwj
	t0j8AkcLmxJg6qzmc4ojJgGvjeh3HpLB1Ak5SluxIUzDjXEz76iuRgb+t5fkDKe95eAD
	s0N1CKS3XZ/jIso4yrcGMYZDEGla7WBiTmcQansPtMPbxx4abQcUJRbdFXSHPzSEhG0L
	OSlXADX4J5ZUeMxAnVkV2O3Ac0w3HhG+DBrvfCNb7zE9egyfGDKP/6PX98Z/oNCY2JuM
	5aY1f9B1MH5xs+VOY/EQK2TE9D76nJj6Qqen6LqwwWEQvDoRbHjPGwuTnde34hg9OxxF
	PsVQ==
X-Gm-Message-State: APjAAAWewWDBX5lbW2i3YpuSrJmVdGSgBxU/VLZ9A+8CEBHEi3zcvISj
	HWTJjtpROmGr8cXlLAnTk4XLN4FxhtA=
X-Google-Smtp-Source: APXvYqw6Sf5i2NmfRb5nwwUkvAIS6zLFD/+SqNj10+75GJOgPYFdbdMzJuaP8s6mx+L/kxLNK0F83g==
X-Received: by 2002:adf:f246:: with SMTP id b6mr26710317wrp.92.1564762643734; 
	Fri, 02 Aug 2019 09:17:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x83sm87909869wmb.42.2019.08.02.09.17.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 09:17:22 -0700 (PDT)
Message-ID: <a020143f53511171dc4d407e0d8dde259af3852a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Aug 2019 17:17:21 +0100
In-Reply-To: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Fri, 02 Aug 2019 16:17:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-02 at 16:53 +0100, Richard Purdie wrote:
> With the patches in master-next and this configuration in local.conf:
> 
> BB_HASHSERVE = "localhost:0"
> BB_SIGNATURE_HANDLER = "OEEquivHash"
> 
> $ bitbake core-image-sato
> $ bitbake m4-native -c install -f
> $ bitbake core-image-sato
> 
> will result in do_populate_sysroot of m4-native running, it will see
> the output matches the previous build and it will then skip to the
> rootfs generation pulling all the other pieces from sstate.
> 
> Note that for this to work, m4-native has to have previously built
> with the hashserv running, otherwise it has nothing to compare its
> output to.
> 
> I think this should be a "big deal" for many developers, reducing
> unneeded rebuilds and hence speeding up development.

I should have mentioned, this code relies on reproducibile builds as
its comparing the binary output. The more reproducibile builds are, the
more likely sstate reuse will happen.

This is one reason reproducibile builds are important!

We may want to look at more interesting comparison mechanisms in the
future like the APIs exposed by libraries. Having support for matching
"equivalent" binaries in the core is the key first step to these things
though.

Cheers,

Richard


