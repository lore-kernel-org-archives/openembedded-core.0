Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B26487E83A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 15:51:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so10558365wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EV+SYAapU09xOdC16oUfnSEBIqMxrrwv7uWnCLWW1To=;
	b=cGprVseW+fC8PdV3tYRhhRTaN5oVB3y7RHWTDCpTEGIebrxEgdNuganVYBMWNEtBaT
	CrfZcmlX1G6HLA5LlDLvJ0x12BHMtI7L35z3xpmuTqC44wPvwG2y2s680wyISqT1RWtX
	yWzGUnHcrZrI4D19FP5lGb2M+dY6zY8jqO1E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EV+SYAapU09xOdC16oUfnSEBIqMxrrwv7uWnCLWW1To=;
	b=f9e8qMLfRonFjlwZhnwDG3wlGm33WW2H/iTttv2kjhzm6zSIx3YeA9CqqhY4pgcJYh
	Id5rFEHgtOAYQy2zOBe5yVX4Yq1gtQVbm1sv2ogYo3b3ve8LbqdhIce3vmApS7upN0d9
	uQP6+Mx4Z6nJ5qjI3Gm+5gcgM+zHfmtms7H4fxyxI+0k3bP3gMzhdMBuelf5f2P6lSrx
	ZLzAmHQ2cQgZ/+pNSFB+0ZNHOPeBGwjX/LV+QYkFy78GOp+EB6H6XtF8de1Cvc31ZwmP
	YtQZjBLciVaq72Z5Lvr4iW5kI4xM4kD/E5QFsB3LfNqze9P31++t/sI5ru1dIjokQNh/
	SRbQ==
X-Gm-Message-State: APjAAAXdB1yxZSJ/UtMjFDGPWpYHz7BHNCr0KIORwIQkwtCKOfONGtSZ
	pRXW0VsZTUAbDveyVQqZOUlbfw==
X-Google-Smtp-Source: APXvYqw9GGIy3omYc+2k+/8RQZEphRyCMC8OJ30Z+mL8MdhqBrC9PQ3B3LaPjOMquBT6wH43npjPuQ==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr63499804wrf.78.1560786704350; 
	Mon, 17 Jun 2019 08:51:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d1sm11253685wru.41.2019.06.17.08.51.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 08:51:43 -0700 (PDT)
Message-ID: <1776c2e6d791cffa71e5f3bd8d375f94dec1cb70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 16:51:42 +0100
In-Reply-To: <04e801ca1c0747dbf5e932a159d35968a6bf938c.1560760310.git.Qi.Chen@windriver.com>
References: <cover.1560760310.git.Qi.Chen@windriver.com>
	<04e801ca1c0747dbf5e932a159d35968a6bf938c.1560760310.git.Qi.Chen@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] pkgdata: fix test_find_path to consider multilib
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
X-List-Received-Date: Mon, 17 Jun 2019 15:51:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-17 at 16:32 +0800, Chen Qi wrote:
> Fix test_find_path test case to take into consideration of multilib
> being enabled. After this change, no matter multilib is enabled or
> not, the test case should pass.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
> index 833a180..2bd15eb 100644
> --- a/meta/lib/oeqa/selftest/cases/pkgdata.py
> +++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
> @@ -47,10 +47,11 @@ class OePkgdataUtilTests(OESelftestTestCase):
>          self.assertGreater(pkgsize, 1, "Size should be greater than 1. %s" % result.output)
>  
>      def test_find_path(self):
> -        result = runCmd('oe-pkgdata-util find-path /lib/libz.so.1')
> -        self.assertEqual(result.output, 'zlib: /lib/libz.so.1')
> +        base_libdir = get_bb_var('base_libdir')
> +        result = runCmd('oe-pkgdata-util find-path %s/libz.so.1' % base_libdir)
> +        self.assertEqual(result.output, 'zlib: %s/libz.so.1' % base_libdir)
>          result = runCmd('oe-pkgdata-util find-path /usr/bin/m4')
> -        self.assertEqual(result.output, 'm4: /usr/bin/m4')
> +        self.assertTrue('m4: /usr/bin/m4' in result.output)
>          result = runCmd('oe-pkgdata-util find-path /not/exist', ignore_status=True)
>          self.assertEqual(result.status, 1, "Status different than 1. output: %s" % result.output)
>          self.assertEqual(result.output, 'ERROR: Unable to find any package producing path /not/exist')

For selftest we really want a "known" configuration so I'm not sure we
want to go down this route as there are a lot of configurations which
could confuse the test results. 

It would probably be better to have selftest only build a clean config
and accept a limited number of variables. The parallel execution code
did go a long way to getting us to the point where it would do that.

Cheers,

Richard



