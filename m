Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (unknown [209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1407F660F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:52:28 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so5352320qcq.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 03:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wLTwuZm5lvwTlU/t5E6cLmrHwg3LnbTA6TwO4rCmaCc=;
	b=nDVxLk5THyVsO9/qwuxFRoYXIq27xnvYfg/0iK0V9Dgf4Mo0fjYUn9OJT0kycQMUxx
	Zqv6aKBFCwV87Z8p3f6fIJ6b1TCOJxQxVg3ZTaLi1uTZHhfzlcaO/4cHNsfPW1+7kxNk
	RNBY3olLKKafMr9P7kIMoReiUuVCdrXVJ22HnzK4TFB/+ovlFbfxw7QoJ7NsyXpoy32k
	+q+beuTFqwD+jQc2Rz/vzX71y0RW2niRHxVgHeTi1kOMcXAv/Tmx9Ex4ewz0LtsOc8y4
	K7NAXBCsPlyfwtE6yjT+Wl8U84UVxIe9KEgo7FeT3n/yTDIvupWllTw5OQojI3Zn4yXh
	BWnA==
X-Gm-Message-State: ALoCoQlIlqyYr5S+k4Pqpa0fT1b5XR9/jZdzv3cEXAcVQc+YHMrLILpnqRyaCJ1ryqojaoPkWoFj
X-Received: by 10.224.32.138 with SMTP id c10mr66360197qad.35.1400755949630;
	Thu, 22 May 2014 03:52:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 22 May 2014 03:52:09 -0700 (PDT)
In-Reply-To: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
References: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 May 2014 11:52:09 +0100
Message-ID: <CAJTo0LYT6ujkqgE1Z3HjovsFJTBD3XMG6jDM+Yj_C-sHLeokBw@mail.gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Added test case numbers to test cases to aid in future automation of testopia status change.
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
X-List-Received-Date: Thu, 22 May 2014 10:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On 21 May 2014 16:10, Lucian Musat <georgex.l.musat@intel.com> wrote:
> -    def test_bitbakelayers_showcrossdepends(self):
> +    def test_bitbakelayers_showcrossdepends_tc_756(self):

That's a bit ugly, and not very easy to extract.

Assuming that we control the logging, I'd suggest using a decorator to
add the test case numbers to the function objects:

# This decorator takes an argument and sets it as the test_case member
def testcase(number):
    def decorator(func):
        func.test_case = number
        return func
    return decorator

@testcase(42)
def test_method():
    print "Hello, world!"

print "Executing test (test case %d)" % test_method.test_case
test_method()

Now you can extract the test case programatically, instead of relying
on the method name containing the number.  The decorator can be
extended to set more fields to other useful information too.

Ross

