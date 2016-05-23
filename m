Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCFC960796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 05:29:06 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id f8so4930674pag.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2016 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=idPl14VUZ4laSXaQoqeKebtBm5hKCzIoFFQUF4JXreI=;
	b=xjduIrB7vyi2bPgEMZQvD0zMWVlA709H9Hllk4xL6EcJXVwcSKSdMWCqv4luxdD9I1
	5q2kpnt17BFFH41T7ZH9hdh4yqUsbB+Ge47chGcu1vwHiNGv9TgXQuhmFhs3/rr1Tudd
	ZwwFoVHt/sB4f+sAcRaDJdrc+JFKeuDzoXOW6HVEam9KapFBq17OxWNNwWMP1da8jUwH
	H7n9403O6DPjYrRtCWehlgKi/sHfkHxRDdj4uPCqZUXgpCNWyJQOWob7dENOrJjjxyc/
	+VColKyaT4D30RqkGLwnKsAZVLvTXabtJPXfPkc5mX66E7sVxfyN4eoP5cFmYG6jYM2S
	XF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=idPl14VUZ4laSXaQoqeKebtBm5hKCzIoFFQUF4JXreI=;
	b=SSMqnlepZ2aDaXkkB65h2SARv0IrjMFtBRR8Q0MHQhE4WQo8P5hw4fAx0CtMGnuxys
	7Fqd3l8Qg92CQuu/4XI7aZuGYfXltvk8InaN8XQafxcyEO14bnoWTDONtV+Qshud7YbK
	xgePYXHO0eUDY7mFMt6XUJeDOlaRSfFOHAYC3FOaxKoTa616E5lltYdApq8rZcncW8hR
	nTAUYYkJUiU0zGen+cDXNSVboeDUleLHoffp2uD2QGPHyjn6LrcTMPYl1wDT4JDw+3Nh
	gNw0q0zIQNQJ4hs0epXFKWE5e+Snki6BQzYix/CwpYnKICJggYTaToTMKmAWLYtSfhcB
	RmhQ==
X-Gm-Message-State: AOPr4FUmYKrOHaTQmU2TDTBLfp2smH41BkKrL2v5YRDphzo3+QEKEgCvhkKs2PllsvhBXA==
X-Received: by 10.66.73.193 with SMTP id n1mr24351474pav.70.1463981347621;
	Sun, 22 May 2016 22:29:07 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	x89sm42996559pfa.87.2016.05.22.22.29.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2016 22:29:06 -0700 (PDT)
To: Anders Darander <anders@chargestorm.se>,
	openembedded-core@lists.openembedded.org
References: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <574294A2.9000806@gmail.com>
Date: Sun, 22 May 2016 22:26:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
Subject: Re: [krogoth][PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Mon, 23 May 2016 05:29:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/22/2016 10:03 PM, Anders Darander wrote:
> In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
> for images using opkg, which included openssl was fixed.
> 
> However, that broke the generation of the opkg-based images, that lacks
> openssl. The error is a python stack trace, showing that shutil.copytree
> tries to copy a non-existing directory.
> 
> This relates to [YOCTO #9040].
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b)

pulled in.

thanks.
Armin
> ---
>  meta/lib/oe/rootfs.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 95fd3ab..41f08f5 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -121,6 +121,8 @@ class Rootfs(object):
>  
>          bb.note("  Copying back package database...")
>          for dir in dirs:
> +            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
> +                continue
>              bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir))
>              shutil.copytree(self.image_rootfs + '-orig' + dir, self.image_rootfs + dir, symlinks=True)
>  
> 

