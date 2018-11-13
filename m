Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id D91626BF35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 11:10:43 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id w7so899859iom.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 03:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B1zsNL29aeMgFL91D/JqnnxmGPK0DPomips5Jdf59SA=;
	b=H7xXp7kwILKkop+Q1p43PIEOK2gWYxLbe3hlrpyAB8LT4URgs2ULNxpdbTgec8GC8E
	qbnOkDVVZXbigCD0V1JX3CImzrKhXhyGP/U9jiE1aFsKOvif9VdWKXLBJqCrcBvsYe+/
	ye89fO3og90K3nhGIHh9BzMySvVesVW7zgzLEjv46veZpcbss1nO/LJ5CcvXbbugL+kr
	C5HuJprk1oNf+9XawKsxkZpJlB+tZ+RSMZcIpn4Jy/SUnsZI0ocdi8vHk9WK3jan4YAR
	EzmekcqIXnt5jkDonaxrnwFFIqsQIaqv/neC+xfdgk/pAOadSW1K9Al4AGiRwNBQeQ7Z
	u2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B1zsNL29aeMgFL91D/JqnnxmGPK0DPomips5Jdf59SA=;
	b=g2PB8D/q+UWkSw4WwnNrUUSc4OOnF2/FQk3B/cMuq0fSFcJwkAGuFCfbuFrpeKQadR
	+FDhxlts6CWQHR7MM6xx/uGB3jy1bYgVm6CE44jNvQDnA/onTC5vqgNpsAckulaxpDK8
	yLtc8pNG4npmCVzCAInOltEQ85wis0ofb2JIzzdQqstgMcHudnosiGfXwBp2h1XhX0Wa
	Zi5D330sQvH4aTNKTd4kcD92F5t7PNqovdBYaekYQqXxASfa3abKvGTcLPOGweF4LUIk
	+pNGeN/qXZFKToJvqYQB/TT9i92llHsfNtmRCyv/Dq5tp90IxCa20ht1vNnib3ZkJWgV
	jKsQ==
X-Gm-Message-State: AGRZ1gLKGrsb97JdhUbU6z3VcZQKKAzL+XA4UVtgGXtDmmMxCSS0d4g/
	Bf5rB19c+oGW0F+pAB9C+Xt7YXJhyglvJ7WB0BC6oQ==
X-Google-Smtp-Source: AJdET5fuf2I9yLY7EpKib73VPMyC/2F07s1VS4B7yvVpTr7VVL4FKOBIE0Z1Q4pPmr0N+sgetuwpEJPXzry9JccwcLw=
X-Received: by 2002:a6b:b844:: with SMTP id i65mr3591669iof.20.1542107444795; 
	Tue, 13 Nov 2018 03:10:44 -0800 (PST)
MIME-Version: 1.0
References: <1542099878-266444-1-git-send-email-changqing.li@windriver.com>
	<54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
In-Reply-To: <54ebce2e5465961129b4740cba726f52c9e7d726.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Nov 2018 11:10:33 +0000
Message-ID: <CAJTo0LbGi3k7ASx1SzGkagJABKVUz182S2_G_d1paLhPgNab9A@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oepydevshell-internal.py: decode only when readdata is valid
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
X-List-Received-Date: Tue, 13 Nov 2018 11:10:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Nov 2018 at 10:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Usually you'd write this as:
>
> if readdata:
>     i = i + readdata.decode('utf-8')
>
> Is there a reason not to do that here?

Whilst this code is being changed, is there a chance of getting a
partial read that has half of a utf-8 byte sequence?

Ross

