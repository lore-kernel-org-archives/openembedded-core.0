Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C19F67F845
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 12:19:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so19198940wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 04:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eRaPUbEtxQiPDHZjurzW6hvT8RCO/2jdPPh7WBMSfx0=;
	b=eWyIfYP+AtGiEvWjvoTABiWwJ1F0bqg1W80c4T//r2fa6dQp1OPjQsN7DfAhFc1jJx
	v12S+T8myAO1XfaQQr5wJ+lBl/NWdPnJi9r0vBA3tnStvIwqA7MBghNMqtodvqY+8CYc
	jd8XmzrlPgB8K69hI/dlXefR4MlQQsOqq4efQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eRaPUbEtxQiPDHZjurzW6hvT8RCO/2jdPPh7WBMSfx0=;
	b=nVLBwHxt7aHy8+and7/Ua2BbV6eMWcuNCxd1qiZaSJZBrA44jP2iZgvMTsLB2tOqJ8
	uRbRbgyf7XngD+RimQ2f4b+WxsUHGZlVS1ktPdb0Xo9dmAvHpugvyuKt9OL3IDHOLh+Y
	30avJ6+wot1K+4/iXmjoOUqzY4DcMSdrtxVwsyryBkh6sQVyLZ6darpdqr/aMDOkUSqW
	XsypGt8gcYeqsfL+5IF+/v4pY0VvY7chH+lJ6B5M2DRfusUoYaadaIc1wyFvR/Kp5AVf
	TtVXkd/xaTxZJEKHoyWww/OKUuaVpf4Z92jh95STDB8RH0uFZnTz+6rVffcHP1mUFRw9
	q4PQ==
X-Gm-Message-State: APjAAAWvJIgega1sH0NA7HvyE5gSRlixv0eGDiECfm0wtXz9w/w5UPOn
	CkR8XEuBH2TjYTQLeN+6FLQcYt5fn90=
X-Google-Smtp-Source: APXvYqxYcAkugOtSKnHbEQMuip8OvCaJRu7P/prnDDIKohDyojkxtcgRDN59S0RDen+MasfysQaLlg==
X-Received: by 2002:adf:e28f:: with SMTP id v15mr28866483wri.130.1574079558278;
	Mon, 18 Nov 2019 04:19:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w4sm19175585wmi.39.2019.11.18.04.19.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 04:19:17 -0800 (PST)
Message-ID: <4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 12:19:16 +0000
In-Reply-To: <7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Mon, 18 Nov 2019 12:19:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-14 at 15:47 +0100, Stefan Agner wrote:
> On 2019-11-08 10:14, Stefan Agner wrote:
> > From: Stefan Agner <stefan.agner@toradex.com>
> > 
> > Zstd is a very fast compression algorithm and has gained quite some
> > popularity recently. An upcoming patch allows to compress rootfs
> > using Zstd. Moving Zstd to oe-core allows this new conversion
> > formats
> > to be automatically tested by the oe-selftest
> > imagefeatures.ImageFeatures.test_image_fstypes test.
> > 
> > Furthermore there are three packages in oe-core which allow to
> > enable
> > Zstd support through packageconfig currently.
> 
> Any update/thoughts on this?

I've not made a final decision on whether to merge it fails selftests
due to a lack of a maintainer:

2019-11-16 20:13:49,922 - oe-selftest - INFO - distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
2019-11-16 20:13:49,922 - oe-selftest - INFO -  ... FAIL
2019-11-16 20:13:49,923 - oe-selftest - INFO - 2: 29/40 153/378 (109.44s) (distrodata.Distrodata.test_maintainers)
2019-11-16 20:13:49,923 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/distrodata.py", line 84, in test_maintainers
    """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
  File "/usr/lib/python3.6/unittest/case.py", line 670, in fail
    raise self.failureException(msg)
AssertionError: 
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
zstd (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-extended/zstd/zstd_1.4.4.bb)

To reproduce, run: "oe-selftest -r distrodata.Distrodata.test_maintainers"

Cheers,

Richard



