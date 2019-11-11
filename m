Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36F997FBE4
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:55:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s5so3876486wrw.2
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Xmk4T+lhT71LAT9nkrnbmuJLDgLzFBHos8bt8/2L8jo=;
	b=f8tCSj1nzSdjOeMMGyxoEMF+U6IY/dPPqe7sIvUegqFpQEVMoZeCrOUzxv4t76ibeg
	sUweWgjuo84BGaypMGaKowdqv0n00IXFXUwrNG+SH503ZdM4Q0YaGkMchZ+ZFSm3xKVn
	TFkhkwoNwdp+VVKTkifHKhEST/JMEwR3KdsOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Xmk4T+lhT71LAT9nkrnbmuJLDgLzFBHos8bt8/2L8jo=;
	b=r4N88mJHsVSGyhj3AYwkab7Krz42XCBRGM+Zd1F36bWGd5sbzWSVJRc7g7+Rvu6cJL
	DiiYTP5ngKU77WeSAUySE4C6kKzHbLfWj2cDD7PFceq6bg9OyogeSTabwxMUp3GNUGjt
	/w/wQPYEwEP4lba+VqZQ4WRDOYbJzyYMQB3UwMVHXC88JotkpoFe1GoHK3rlwRHgqWGl
	qnZZ8sPk1s1j6ohy5x+7B0JcSmB+Wcjoi13AXbNQXRMNT96tJIkZCtBNew+lNVNcoUrO
	VLzkRX0LIFYe1hsIlG1Zaci2Jq0q0aObSuEBBHdTjEowdZKGwj8d5Qrm/o00JcJFTYY/
	xrlw==
X-Gm-Message-State: APjAAAWEzWvziN9DKyE6WZHuav+KQ1SkVB9MJsoi1GFY+7o1pEFWyK6i
	E/9yW3/6Yobbe7NF3YPwX0Fgrnqj0ww=
X-Google-Smtp-Source: APXvYqz6xCKTXGxPGKjgqlb7cH8XTzzpljj+Bfp0hHyTyWfwgPpuI0PN+Tzt1dV78X/tq4tmlBLfKA==
X-Received: by 2002:adf:afef:: with SMTP id y47mr20781159wrd.190.1573484123955;
	Mon, 11 Nov 2019 06:55:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g11sm15954319wmh.27.2019.11.11.06.55.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 06:55:23 -0800 (PST)
Message-ID: <0623b9ecfac85a32bacc7b7d4fc7ba6335db5983.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2019 14:55:22 +0000
In-Reply-To: <25f98f5a-1d22-918b-29d5-6a381844631a@topic.nl>
References: <25f98f5a-1d22-918b-29d5-6a381844631a@topic.nl>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Getting "File name too long" errors in warrior for sstate-cache names
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
X-List-Received-Date: Mon, 11 Nov 2019 14:55:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-11 at 14:49 +0000, Mike Looijmans wrote:
> Starting with warrior build, I'm getting build fails due to "File
> name too 
> long" in sstate-cache filenames. This is probably related to having
> long names 
> for machines, but this did not happen in previous releases. For
> example:
> 
> OSError: [Errno 36] File name too long: 
> '/mnt/.../sstate-cache/52/sigtask.9u_r4yv2' -> 
> '/mnt/.../sstate-cache/52/sstate:u-boot-
> xlnx:topic_miamilite_florida_test_xc7z010-oe-linux-gnueabi:v2019.01-
> xilinx-
> v2019.1+gitAUTOINC+d895ac5e94:r0:topic_miamilite_florida_test_xc7z010
> :3:52cb29cef3922da53a752f38e9bbfdef878af51813dc095d9c1451d572844f93_p
> repare_recipe_sysroot.tgz.siginfo'
> 
> 
> What can I do about this? There's no hint in the error message and
> searching 
> for the message text doesn't show much except issues with crypto
> filesystems, 
> which doesn't apply. The filesystem is just plain ext4.

There have been a few reports of this and an open bug. The trigger was
probably the switch from md5 to sha256. Unfortunately we haven't
figured out a good patch to address it yet. In your case it looks like
a long recipe name combined with git versions (also longer). Truncating
the PN and/or PV would probably help work around it, the hash is the
key piece for sstate and the rest is just to help humans.

Cheers,

Richard




