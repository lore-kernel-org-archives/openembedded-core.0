Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00FA07E3E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:38:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v22so3627356wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=K2ialeDi38IJluv7NSY4bQ+Ko0fQ4FTcMGXa3Ez3T/c=;
	b=alKSQZYn+FUQc9GV4dAraGakGu2sCoKp9fxVElWX2a+3se4geCLIBO2ttIuhiFAhu3
	Sq+HnF2tVwcVY68MCpVuMHX80B2habCA0a7AfIbzdzhLWR9DkfxEqPMXypi+aT2bAjd9
	ryo7gcdzuadOZVlY7BvyN6m7fgUZj3PShwpRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K2ialeDi38IJluv7NSY4bQ+Ko0fQ4FTcMGXa3Ez3T/c=;
	b=QqsAnWUJix1LrxG2hCm0MFvWoidxFupwiPLqKbefQtkwBxGcyjyeNVYUkNcOn8yjoG
	o8TCpcgCdOa72PYgUNT0TA7GRzxoZFCXT3bZY/5YGM+l/I+qj7odCvbfIx+x7B/2kicg
	GjXb5ORHM3jv+E9+Y6XcloYY7N1g7qKOHYITEVNEF4k9u1RE0LdHmJYP3wqDDRWSXjx9
	sB8nqQgylx4pMOVqO4QEWBV1GsI/UOGdfqLDVKhD/at84JftE1S0djtDNZG4qOyqhOSS
	jxHSq9VM0v0doWyWkASDT/wK/7gFHLQ3/W+WmkVssUePdQSNHTGyNx2XIfQIXY/K7wSM
	jzUQ==
X-Gm-Message-State: APjAAAXkumyDrSavlabI8WjHljezxpCkfcATguiFz3xH+pgGvlyV46+O
	uN1Po6AumAHaKr1pebyTHpkwExVtHZo=
X-Google-Smtp-Source: APXvYqxOKXMYZfElpi0td62JW8R9nlHmjnMc7kJhDo3Us+2GNesjW6B5pqDNcs3M+rEePCkS/XDiRQ==
X-Received: by 2002:a7b:c356:: with SMTP id l22mr1996402wmj.97.1559216305673; 
	Thu, 30 May 2019 04:38:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t15sm2673455wmt.2.2019.05.30.04.38.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 04:38:25 -0700 (PDT)
Message-ID: <9891ffe8291ac7ac5d5e5be5289436b7290160c4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philippe Normand <philn@igalia.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 12:38:24 +0100
In-Reply-To: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
References: <4952ef2f1e236b563f400ead537f8e7bba373bc1.camel@igalia.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gnutls: Add a config option to enable the pkcs11 trust store
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
X-List-Received-Date: Thu, 30 May 2019 11:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 11:12 +0100, Philippe Normand wrote:
> Since version 2.60 the glib-networking TLS database relies on GnuTLS's system
> trust store, so not enabling it leads to TLS errors in applications depending on
> glib-networking. The raised runtime warning is:
>
> process:500): GLib-Net-WARNING **: 09:14:09.321: Failed to load TLS database: Failed to load system trust store: GnuTLS was not configured with a system trust
> (app:490): ... TLS Error: TLS certificate  has unknown CA.

Doesn't this mean we should enable it by default as well?

Cheers,

Richard


