Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED897F232
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 14:44:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so8078198wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 06:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=zayEX9oRIZvldmvmBMptBsnitb0CZ5r6xITErGRzQgQ=;
	b=hMYmib0LeMSV4CwDXeKv/DSjkH8NRi0TR8p1k0WQycICkofN3eTCkFS7KgSsBVtY9W
	i+GpVyyBUC/+KWyts1fRVPqpkw2+kbVr3AX1x0+rUljZn7DrQla5h4ZcD3NYUPTudV5H
	4Lpz37RNh2HmQH/xpXDe3aab7xbZk8cI5cCjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zayEX9oRIZvldmvmBMptBsnitb0CZ5r6xITErGRzQgQ=;
	b=ZVWHGOLa9P3k8EJdphUYY1fq4bVkR/g4OHaHb7QIA4r8bj9BY9DqIRMArEcZJ7tmwr
	erW80gKN8MEYldcl44P6Ju9FciEAuNKroqCIxV32nio04D+abG8+umKd21o9xX+hx9ms
	nMSWnbPAZytv5hIek+5Wx+5pn0zXwTdCpydiEiMZcslbNywm2UDH8nSm81oV+zbY2ebH
	pBxGTCBNMl1eNmJXBPNQjixf9ujEE+0usRmtNfZq8SdzS94ly1nf/I4toulFmAKlUra6
	nWQ6DDLcZU+pG4+piSptyCNmw1CkPGtThglf+eYaHXtKAEi3pTN73wCANLiEPmemq+xm
	asPA==
X-Gm-Message-State: APjAAAXtkBMrwRVDcnOgdI5VYIWW7woirBhkGrOwTCXgcmoSGC2Q/Rxc
	rj1YLhljH8PXKEm5DwnEh/XPhw==
X-Google-Smtp-Source: APXvYqxtnsyH2m2Two8XBRxunY5xqHjNOMJP9k8Y7QBEgrKfdQrJhHSCLyMzJ3COooz7XTlyOrJ+pw==
X-Received: by 2002:adf:e609:: with SMTP id p9mr15564041wrm.397.1575643452729; 
	Fri, 06 Dec 2019 06:44:12 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s65sm3682263wmf.48.2019.12.06.06.44.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 06:44:12 -0800 (PST)
Message-ID: <6a80ccde7c8e45b32fe916fe66ca02f01388f4e1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Dec 2019 14:44:07 +0000
In-Reply-To: <20191206015820.1839-1-akuster808@gmail.com>
References: <20191206015820.1839-1-akuster808@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/selftest/runtime_test: split systemd and sysvinit tests out
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
X-List-Received-Date: Fri, 06 Dec 2019 14:44:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-05 at 17:58 -0800, Armin Kuster wrote:
> This should help debug which part of this selftest is failing.
> We can not tell which outloop is failing so split the tests into
> systemd and sysvinit.
> 
> See [Yocto # 13650] for more details.
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 102 ++++++++++++++---
> --
>  1 file changed, 76 insertions(+), 26 deletions(-)

Rather than duplicating the code could we have a common function the
tests call please?

Cheers,

Richard


