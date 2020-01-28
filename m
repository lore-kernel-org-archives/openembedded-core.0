Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C5AEE7D3AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 10:07:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so15277949wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 02:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=FxeGWWAgsRX3YcGCq2zJWjslTo2zZdRvff9b/o6sizw=;
	b=U4Y/CFB+QiHz0EH+y+qdibpqhT6wqtsoffO0Vn1tuToH4hthqGI2olKyd2I5+77Hes
	soN2Mv408pwjwaWf480fTEfP4Q5kr3L6cFPfQ+e7YrF/6rrPROVKV1p0tdo6alr3UdfI
	uGPhABld0M8NkuConUDTie1zV6Zt2g05B8xZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FxeGWWAgsRX3YcGCq2zJWjslTo2zZdRvff9b/o6sizw=;
	b=anyHhWMn2oSSE2aQ6Ar8EkCdgCxwkFWMup3MZXQlAxeWfkRHhEaPrE4AhxMELyEIdJ
	M+ywaeJC5kEiNATYenHnDLj9T/Few+CGQSaXFCcjAs+CzSHEHZOby3TKEODmgx7NtfKp
	EKfrxCKGnjvPdrcHrRib7b2MG7Z1BvGhDehPfMs+XT7b3OC7uUQOAZQGcg1KIjBYlr53
	QYKh7F8cXIhyimnLPgxozkk4TobCZxsASOerJzlbQ6HJJENONuIpbTc6lRAnbUkOeuA9
	xakoLzcA8VajXYTntk79bGQ7cBwiVobpec257LwI23NdurKX/g9ojhHKPmQkTwObzaW9
	QADw==
X-Gm-Message-State: APjAAAVgUxCYKb2gtTGBfzgMfa3DeDuaBbb7YqZEWrCxUhAeyxm37Jms
	CcjFAvsCpxlHJ0GUUxThGkinPg==
X-Google-Smtp-Source: APXvYqwBh1bzKVIShjiIpWcGxUQGumDoM9s+ojbOPXXoQrWjDKx8JWqqyAW5HZustHbygkxQTGH0TA==
X-Received: by 2002:adf:f484:: with SMTP id l4mr29115029wro.207.1580206054356; 
	Tue, 28 Jan 2020 02:07:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7sm24816510wrq.41.2020.01.28.02.07.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 02:07:33 -0800 (PST)
Message-ID: <4eb4ce6425a3cc96d9500ddc54eb9e34cc4df57c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 10:07:31 +0000
In-Reply-To: <A678FC67-6C95-4B81-8DC0-28446111D1CE@gmail.com>
References: <20200128035850.2629175-1-raj.khem@gmail.com>
	<A678FC67-6C95-4B81-8DC0-28446111D1CE@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] valgrind: Fix ptest builds on musl
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
X-List-Received-Date: Tue, 28 Jan 2020 10:07:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-01-28 at 09:09 +0100, Alexander Kanavin wrote:
> The reason I dropped the previous version of this is that with the
> patch the test failed, without the patch it passed. If you can
> confirm that the new version doesn’t regress the test I would
> appreciate. You can edit run-ptest prior to running it to include
> only the test suite with this test to make it quicker.

valgrind fails to build on musl without a patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1499
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1503

Cheers,

Richard


