Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1D56AB99;
	Tue, 19 May 2015 21:24:48 +0000 (UTC)
Received: by pdea3 with SMTP id a3so41226302pde.2;
	Tue, 19 May 2015 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=s36zc2pc2GpJ8gguDyxOCQBn5y+dIc4ISN9qn06S240=;
	b=DAe1JVthoQKhNPpf+h0Bylul7DAuPfAfyNCJQuJjD+seagKxPweb+GZnGMGsGpP6pZ
	29989sZZZy4CAgVlS7HsItOaj1xJw1yjWA0xx6mQSuTFvrVpnGrH0e67SX+lHaiX7jaI
	Y3r9aaai0QzKHqghZjVN4kT47bynja0GFt0Zw+GK8DtyVcbdyssGqnW70Se/EElYnX4c
	XRgY7Hxl790vYAkkzTXYXCe2hSTo8PIByBzcV7az4EmCYFARxOg6T+gd4Id0stEQISw3
	3jcJ71IGFdE0Goz93b3c8V2v1IzZLGNEEm+X9gnRv+FLDPXDdzs9FJ4KgbUMvBxZPbfn
	0wOA==
MIME-Version: 1.0
X-Received: by 10.66.233.132 with SMTP id tw4mr57398472pac.80.1432070689781;
	Tue, 19 May 2015 14:24:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 19 May 2015 14:24:49 -0700 (PDT)
In-Reply-To: <1432069635.28910.43.camel@linuxfoundation.org>
References: <1432044868-9170-1-git-send-email-ldnunes@ossystems.com.br>
	<1432069635.28910.43.camel@linuxfoundation.org>
Date: Tue, 19 May 2015 18:24:49 -0300
X-Google-Sender-Auth: tCPWvetKPThpL4_EvsALL2BZcfs
Message-ID: <CAP9ODKo2hE6PtjnOZtgYJP7=OiF8ZEr0Hi0YDZoBrXVwVq7gtw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bitbake-devel-request@lists.openembedded.org,
	Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cooker: release lockfile on process exit
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
X-List-Received-Date: Tue, 19 May 2015 21:24:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 6:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> So having thought more about this, my proposal is actually that rather
> than fix this and cause all kinds of other potential problems, we just
> make memory resident bitbake the default which is something we'd like to
> ideally do in the 1.9 timeframe anyway.

I understand your background ideas here however the non-deterministic
lock release is driving us crazy at the autobuilder management. The
sstate cleanup script, workdir cleanup script and in-house scripts all
need to be teach to deal with this and this is far from optimal.

Would be acceptable for you a command line option to 'wait' it to
release the lock before exit? This could be done easily and we avoid
side effects. This also provide a solution which is isolated enough to
be safely backported for previous releases and provide more
deterministic script output.

How does it sounds?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

