Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0351A7E845
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 15:52:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h19so277514wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=a4HrzvxgUFCttfaTANkh9yATkzIvbJ68kDaXokTzNmo=;
	b=SzyhaZ9CqAMnoM9WoEYyyILmLKNB+Rqw00J/BLw1GqOrZ+fHayyl1VFBCcgVDGEO6y
	x9bofPT50zJeFwj9F0R7yLyhAfVvQK7an8LpIIMtvn8yJ7bW1e5T0l2N7MdPAOvEyMeV
	K9PYXgfqHxbX6hP8eR2Kl/LkvRKQtSsWE946o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=a4HrzvxgUFCttfaTANkh9yATkzIvbJ68kDaXokTzNmo=;
	b=R9Abh1FiDW3VJsWkMrOsfqDgSOtfUUmqAMHWNyOodAqosFuc+JgxYwauUAmVxev/91
	TcnfjikqQ5mbFeQcm4OPDsPlxHFmkVE3ajo3HAKW+KyPeQ0GvaRgvrCvjwlObiKcdRlt
	7S0WXrg/Qm6/UAaPZHckPGjrT4RWZFFRx8DDBIXp6ckTJQv0zG/Aayc2qwBDhT0icp86
	nCx8e2aW5rjo6O5/JIGKlKV7LOc6x4LlVqDJ0l0LWR1nUF9pBCRpEIjpwK058QRRrNTR
	4xtwPM9Z5wEs/t2++zI37CvsP8Pwl0MfgtuKQMd88qfM3olPUhVuKS4l43lBhL4Kff8t
	vaBw==
X-Gm-Message-State: APjAAAWksRat5iPq5cn/LbCh93u7YWfkwKNHoEZZavtIG25chqI/ISEm
	BtEhsAwFqsrSA5qamH9Ofb8Yvw==
X-Google-Smtp-Source: APXvYqwGY3RqlYRulSNMVlDAXyFQb9McivyXgXYZq5AAB05ixl8JlKyRcEWDnvqSQrvJAxiRMsy0Aw==
X-Received: by 2002:a1c:6154:: with SMTP id v81mr19097730wmb.92.1560786759764; 
	Mon, 17 Jun 2019 08:52:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h90sm26001203wrh.15.2019.06.17.08.52.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 08:52:39 -0700 (PDT)
Message-ID: <60e36e067e68c71b46e0df85fd1fb927d3ea9321.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhixiong Chi <zhixiong.chi@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 16:52:38 +0100
In-Reply-To: <20190617083951.62368-1-zhixiong.chi@windriver.com>
References: <20190617083951.62368-1-zhixiong.chi@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] inetutils: Fix the rcp couldn't copy subdirectory issue
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
X-List-Received-Date: Mon, 17 Jun 2019 15:52:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-17 at 01:39 -0700, Zhixiong Chi wrote:
> Since snprintf doesn't support the same src and dst address, it will get
> the wrong result.
> In the sink second recursive call env, the argv and the namebuf will point
> the same address, after free operation for namebuf.
> So the last change for this is wrong, now we just drop the free function
> in the recursive loop to get the correct path of file and directory.
> Even though there will be memory leak, the allocated static area memory
> will be released after process exited.

Has this been submitted upstream? This looks like the kind of issues
which would be best fixed upstream rather than us just carrying a
patch...

Cheers,

Richard


