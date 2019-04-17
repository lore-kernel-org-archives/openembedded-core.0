Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 030CF7D209
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 22:01:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y13so313446wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=v03BsXHSi4D5Wuvbc18H5vbvMuho7uc8LUG4DAgAlcU=;
	b=bqT72dsMF8A5JBw3ffHCeaU9FJXcinm1PKxP8ZFEpUwy3GdbT6SOGJ/vnNKpDAikEP
	8vZZDzb6OGF1QMpIWE7D/tA4IaoTdbWC6wfeUXurZGQt6I8JLfBmpkG9qgiSVHrA7BqU
	iIoBoS0mbCKF4z68ziWVMIK4iSR8FjuObHehk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=v03BsXHSi4D5Wuvbc18H5vbvMuho7uc8LUG4DAgAlcU=;
	b=A+iUmqtq3E4e+dn7Ksv+FupSznTPk47Lmz02qaJX632g/OhyaaLK8u5OWixoqIsjdN
	fSgBKNzLJQ1Jn34j3IhpzTVdvEJgKAATnz70s88q2+4EcS4IW9N5W+0BeNxZ5BF2UY5s
	srRlA4ClLQdFtWCGF8m3HmI8dRQ2tam271yfegkh3skIE6myUyvEC//uOB4jYJ0K+Qgq
	VhrzY9ZdLSNrnzp4wCXWJufHvFvG5/40/j2LFTE4LlrBegVrDZe21TRRtLk5iZ2uwV3+
	LSr4CvkgtSteO/GIhwPIe1cKYau6z5+aoevLinFeHQJMV+BwarheYGG0/PMICqTbyK5d
	QDdA==
X-Gm-Message-State: APjAAAVbCUfiK2czQHrlWTVbdPMvVIa/wSKkY4XRb7FDVI9BNKBwtAo7
	fT2l+5J5NRufoeQY1N1zHLWyOzabeT0=
X-Google-Smtp-Source: APXvYqyLo+BHNS1m8i7D/W68McxpTp2oEnpCDvTXEjSoW9ALLzC4B3dLjqrVZzFlVkCR5DAIQd2fUA==
X-Received: by 2002:adf:f1c7:: with SMTP id z7mr26483996wro.274.1555538513789; 
	Wed, 17 Apr 2019 15:01:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z84sm260606wmg.24.2019.04.17.15.01.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Apr 2019 15:01:52 -0700 (PDT)
Message-ID: <f6e345e417eb8219c0b08ba72ef4e7f6916fdf11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 23:01:51 +0100
In-Reply-To: <1555490306-29097-1-git-send-email-changqing.li@windriver.com>
References: <1541388536-121953-1-git-send-email-changqing.li@windriver.com>
	<1555490306-29097-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH V4] dbus: fix ptest failure
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
X-List-Received-Date: Wed, 17 Apr 2019 22:01:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-17 at 16:38 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 1. since one bug in run-ptest, testcase test-bus have never been
> actually run (althrough it's result is PASS).
> 
> After commit 0828850, test-bus can actually run but it
> did not install:
>   test-service, test-shell-service, test-segfault, and
>   dbus-daemon-launch-helper-test
> Add the configure flag:
>   --enable-embedded-tests
> to generate binary dbus-daemon-launch-helper-test, then install
> them so that test-bus will now pass.
> 
> 2. fix testcase test-dbus-daemon failed
> we enable --enable-verbose-mode in recipe dbus-test, and don't
> enable it in recipe dbus. This will make below test code get
> unexpect result of have_verbose and assert.
> disable --enable-verbose-mode for recipe dbus-test to fix it.
> 
>  #ifdef DBUS_ENABLE_STATS
>   g_assert_true (have_stats);
>  #else
>   g_assert_false (have_stats);
>  #endif
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus-test_1.12.12.bb | 13 ++++++++++---
>  meta/recipes-core/dbus/dbus/run-ptest       | 16 ++++++++++++----
>  2 files changed, 22 insertions(+), 7 deletions(-)

I'm wondering if some of these tests were intentionally not run due to
the length of time they take? It takes the dbus-ptest time from 26s to
250+s. Can you see which test that is and why its taking so long
please?

Cheers,

Richard



