Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (unknown [209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 74AE865F09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:33:11 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f51so2357168qge.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 02:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a3lyFEH7y8okYgUChC11mOOU9RKr6uA3lqHFQg3/dWI=;
	b=jH1NSQdpJt/G3Yv5IhIAUaBvRLTIOexefCYE94IAh1DzqJB8BlA9VUHwP7DAU9wSCt
	Aoar+dW4rPYJc7qDEiG3LiYBT+K4lwHV4U3H6Yqz3pR8N3INsxzClT7OTaQeOhqo2OW0
	oiP4UNfFjudVSqFG/kuRAk0DdeiKaRWdZxqz455yKBVwnu9RoXv0YU/WHf3KZpaevU8c
	dsZybIov597KNDIjITzmZGOGH3Zy6rNjDr7+v0nsJbTJKqaWpAwRqRww/4C1rbUQ9tHf
	/rY7Sj81Ia3tsZzP7PCZV6JRYUe0neto0OvdFK7BN5Pz/ZvsDmoNbQI6s8rN2LbXWFPB
	VhkQ==
X-Gm-Message-State: ALoCoQk3lD48jwVmo5QvCHSk3Gqd6yahmSNyvru419qz6ZVnBrtkyBiDjVGI7D2ja2csQSyfrQkC
X-Received: by 10.140.28.3 with SMTP id 3mr3660812qgy.71.1400059992784; Wed,
	14 May 2014 02:33:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 14 May 2014 02:32:52 -0700 (PDT)
In-Reply-To: <1400054003.31891.216.camel@ted>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
	<1399896893-486-3-git-send-email-ross.burton@intel.com>
	<5372F106.4060700@linux.intel.com>
	<2A7DAC5C-A9C7-4EE2-80C1-2E6D0270C8E8@dominion.thruhere.net>
	<1400054003.31891.216.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 May 2014 10:32:52 +0100
Message-ID: <CAJTo0LY3OuWVXhC=KyYovM7cBP-u0LBej_h87P-25YNBkFTcuQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Wed, 14 May 2014 09:33:12 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2014 08:53, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> Its an odd error, why would a build of freetype be looking into the
> sysroot for a freetype.la file?

Someone on oe-devel hit this too and I noticed it was looking in the
sysroot, which I didn't spot when Saul first encounted this error.

Freetype now has an optional dependency on harfbuzz, but harfbuzz
depends on freetype.  The changelog implies this is opt-in but I
suspect it's automatically detected, which is why we're hitting this
breakage.  I'll replicate and force-disable the harfbuzz linking in
freetype if that's the problem.

Ross

