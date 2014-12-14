Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2A371790
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Dec 2014 03:47:27 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hn15so3477907igb.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/XSH7zEOXN+xmauwc/en3tYz5a8PofNfjNLPVHyGURs=;
	b=QKlCx0URk0YERIuN6sfW9G/r6gKmUEpawvDjM4JDI+9pjpezMxBzR7jkGw4ZOR/Y1B
	jFZaduKkJmRjFPvhDQod51VUvV7aHdkeet52zaTYhaBBgK8KqDhpzRgn7j3Mib4+e+p6
	G1KVRez5GcH2r3gmNv2aCuxoLBlHLC4FicLkWayMyjj5oCEXYeQV4bb2L5Y2aYVfnuer
	54qnqPEpX/PwajHCzT+6hqurtVcD3HkS4saXTLcewMME8usKVMrr69FuSDV5CS39KIon
	+Wzcs7XbtC+YAs6ASiblI5CHJNiNW0w5VwE/xfRxp3mu01qKMu2jATzPW0dIIyZ9Ss5R
	UsLA==
X-Gm-Message-State: ALoCoQkNQZB33LM18XGOHrxzZGpM3MnQjscrMTnknIshP2w7d6Zc5PRC29fwe6Zxvu3DwZdmkuTA
X-Received: by 10.43.44.201 with SMTP id uh9mr22014488icb.51.1418528847653;
	Sat, 13 Dec 2014 19:47:27 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id
	g139sm2881729iog.41.2014.12.13.19.47.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 Dec 2014 19:47:26 -0800 (PST)
Message-ID: <548D0844.4010404@linaro.org>
Date: Sat, 13 Dec 2014 22:47:16 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5487463A.3030103@linaro.org>
	<1504553.gLyqLqD1E0@peggleto-mobl5.ger.corp.intel.com>
	<4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Sun, 14 Dec 2014 03:47:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/11/14 12:14, Paul Eggleton wrote:
>> It's not supposed to behave this way, although I have reproduced it here - I
>> think I hadn't actually tested rebuilding an image with a recipe in the
>> workspace added to the image. The problem is that the do_compile task is
>> being marked as nostamp, but the way bitbake behaves now, that doesn't
>> cause any dependent task signatures to be changed and thus no dependent
>> tasks get run afterwards. Either I'll have to change that or work out a
>> different way of ensuring do_compile and dependent tasks get run  - either
>> way, you should only have to run a build that calls for the recipe (be it
>> the recipe itself or something that depends upon it), no cleaning/resetting
>> should be needed. I'll try to fix this tomorrow.
> OK, I've fixed this on the branch as well. You should now find that rebuilding 
> the image always triggers a compile -> install -> package etc. of the 
> recipe(s) in the workspace first. (It'll end up triggering other recipes to 
> rebuild as well if they are in the chain; we may have to address that 
> differently later for cases where that's annoying).

Ok great. I've re-tested and it all seems good.

