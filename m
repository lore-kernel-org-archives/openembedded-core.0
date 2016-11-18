Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 156AA719E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 20:23:07 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n21so278118729qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zwnfjcJL9k99k+nTiYOfGagM7DQRGCpxP8CiCg/ztAw=;
	b=rO5l6IEWxSm3x0UC9M+7h6aPEp5mCJomjiwUXVGmZRKxevnr/Ro6QdPxb/+Zl03fsM
	VT7O16xb/S/Tu7uApE6fpw0cD0SxuiJyfColaRt8XkGmQ+daSa28w1OQ0K2p8YG97j2N
	oFvwVe+Q8oYlwpdkosxrdoxhW7qkhVEmk+ZWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zwnfjcJL9k99k+nTiYOfGagM7DQRGCpxP8CiCg/ztAw=;
	b=IQMGpRolNgyxB5NWm1vdEs1BSTicZVC8ADRRNOKUcKciyUuYBvRUyv5MiLPGKmqTPs
	rOs+kp02M4iydQSSEWgjCgKrLDW7Px4yzcfMpyZ76EHEAbGplQ5zrCe/uSJjqQtuTVVG
	LEgv8gdU8OiB/SD3XzXM4Ed8/8q+VJUQSPobRLJ0Nvj42V0/toLYfuXbEUxEnklQm9sT
	j0s/jEL4r/RxO3XCYLltR16rmYwtZMeJS0nEJAApWwY4jUkbtL49VtY6w11Fpw07pi4y
	TAE032P9806hDx7sZZFKodBA99YTjIgsCIuE+gqODVmcq3eM4KE6oaw7RY3F8T6XWvt4
	a2LA==
X-Gm-Message-State: AKaTC00VY3RwMO9sdvE+4hH3c+OQViyGTN4BMTQeebMBqL+HbhVgF6SQh9RZiYp4bOQjpA==
X-Received: by 10.55.5.65 with SMTP id 62mr2026158qkf.308.1479500587307;
	Fri, 18 Nov 2016 12:23:07 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	h47sm4864793qtc.27.2016.11.18.12.22.36
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 18 Nov 2016 12:22:36 -0800 (PST)
Date: Fri, 18 Nov 2016 15:22:05 -0500
From: Tom Rini <trini@konsulko.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Message-ID: <20161118202205.GP2546@bill-the-cat>
References: <1479415791-28938-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1479415791-28938-1-git-send-email-nathan_lynch@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: enable fractional sleep arguments
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
X-List-Received-Date: Fri, 18 Nov 2016 20:23:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2016 at 02:49:51PM -0600, Nathan Lynch wrote:
> Fractional durations (e.g. 0.5s) for the sleep command are useful and
> not terribly uncommon in practice, especially in scripts associated
> with test cases (e.g. mdadm, lttng-tools).  Enable FEATURE_FLOAT_SLEEP
> by default in order to avoid having to patch every instance of a
> script using a fractional sleep.
> 
> The busybox binary gains a few hundred bytes in text (armv5e shown):
> 
> $ size -x busybox.nosuid.{before,after}
>    text	   data	    bss	    dec	    hex	filename
> 0x89382	  0x71d	 0x2250	 572655	  8bcef	busybox.nosuid.before
> 0x8954e	  0x721	 0x2250	 573119	  8bebf	busybox.nosuid.after
> 
> Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>

It's also something I've seen customer use as well in their scripts so
this would remove the need to add it to the local layer.

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

