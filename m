Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id DA0857D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 06:55:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id w10so14910034wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9stAm3K34sOqafO4lMoqlY+FiU4C77S4jM/5soIxwGM=;
	b=LP1EfC9O3JE8rJuY6LN05UWXsJ86PGxXQ3PNvpulmzeHxdUilAv4K88JI7scvO1UL4
	pVugAnsv6jWCX8IZlU2UFFVVnanvlFFXHLBNk0w6/h58ZJwcKt26l2x2eAg1ZXQeocoW
	hr3XDqSJWY5ADatUpGID/rzRn0txKcWVrmXe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9stAm3K34sOqafO4lMoqlY+FiU4C77S4jM/5soIxwGM=;
	b=kZo7F0Q0gNn9OiZY1u+fp1b6thDoBY+775fkg/SKjqN2BRQ1bmpwOw8SUxAZR3RmgK
	/FuqAcBBPCAeseonELJtr0iS3QZZtl5N4W2fX5qvS0zmRhPb0Ll8bPqsZ/jkJvbMg05F
	aPkfE6Er75UkTmj0nAfQTDjDgo8kR3RfB6OQRUw8kIfTY0siNnrYZn2eZJJbVSJYCMTj
	EofL4dWSFXBspj2++kIcNa+GxuVzMYXG61RvvMIc6nSvqe4aGkNXKnVoqb2EEgv+NrGh
	ahgTT3vveD2uKQOo/Qlb0NuynbwviE7e8NaeFi8KywjooyrujSiUipi4SqxWJqGXnXeF
	/iTw==
X-Gm-Message-State: APjAAAXJ4XXkwNwWlSfbN0w1Sk44TcKjDwgQjugh+8cSiQIZfYXr+Sqc
	5o0gcucrqzepN8uVUZx7qAy/Ax8BwxE=
X-Google-Smtp-Source: APXvYqy/yC3WUMjYmpx1xNdJ/kt6+kCPBC/NllAFrhU4LibFMrXf13zmW8rKl96HEyn/pg90usRlJg==
X-Received: by 2002:a5d:63c5:: with SMTP id c5mr18194302wrw.82.1554706536507; 
	Sun, 07 Apr 2019 23:55:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o1sm10694651wmh.47.2019.04.07.23.55.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Apr 2019 23:55:35 -0700 (PDT)
Message-ID: <1cde16c3b778fe783faa1e93f2004ba392e2387f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Date: Mon, 08 Apr 2019 07:55:33 +0100
In-Reply-To: <58b4bdc8-f722-41f4-8c0b-7671b44397e0@email.android.com>
References: <58b4bdc8-f722-41f4-8c0b-7671b44397e0@email.android.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Circular dependency of do_populate_sysroot
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
X-List-Received-Date: Mon, 08 Apr 2019 06:55:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-08 at 07:43 +0200, Stefan Herbrechtsmeier wrote:
> Am 07.04.2019 23:35 schrieb richard.purdie@linuxfoundation.org:
> > You're saying A runtime depends on B and B runtime depends on A.
> 
> Yes, only the run time depends on each other. This means the
> dependency doesn't exist during a native build of a or b.

In which case this is easy, simply set:

RDEPENDS_${PN}_class-native = ""

By default the system assumes that native packages have the same
dependencies as target.

Its complicated by PACKAGES being empty for native but the code knows
to look at "${PN}" for rdepends.

Cheers,

Richard



