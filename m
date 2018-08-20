Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 44EC479023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 16:56:39 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g33-v6so3516832wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WMnej7GKRMdEY8Wol+SaFmWv0yTmBJjqgeOn3F2rvH8=;
	b=f6HBoGhrOe35TddKuJ2vRm1neULfdfuweEvSj7JY2IGAQAFtU3alQliqfyotkWZULC
	AVYct+2MoHrqfxfFeeEfTj6WQg/K80dPM0sjyMsDdvQ9WDIOjGj67nB8XF6i1moZPXW8
	utdB2ofRcMOrbTTdRn84HNrvhF69eIs89d4Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WMnej7GKRMdEY8Wol+SaFmWv0yTmBJjqgeOn3F2rvH8=;
	b=WrKgg7cghWs+WZ/rHjK4Mb1PxNbxJY5jAKCXiGWLrv7pVUWC/qlsyib/KKuJfWDt/F
	uS+nbuu+19wJ9JUZjWreNGaNvzg5nG4hXM46KyeK5qhyvimiHM2RXIZAAfpgwD7y0HD7
	hFDkDwaLJ1ZCxEG9Dr2ny+shSvbr4/79+6ui0HGkPHV2GNmiJbuk9mou6HXioKoyMuMn
	JjayBEUAXctYZq+4lO5yu2xrGD9M2dxg7P333g+9m7POCRY9lwS3s6W5RqEwcXp9sSPf
	dpL43qJ4tbXoQdh5ow3L+2eIgoevsIsO6PdZyVileUiQx3pO7xiyTtsf0ptJVPRixZmf
	DQuw==
X-Gm-Message-State: AOUpUlHggeBxxETxjJPMeRP1711ISnrUs8DFly+/7u67i7eaIvp2Mijj
	mkV2rY8Qyc4kwePZK10mK0EnKA==
X-Google-Smtp-Source: AA+uWPw/2kQJnDSpss+z50FTzrXVXsvsM2mniza2wIUJhSMSRedlT8Wzr4ilxN1FCswh0b5A2tZMWA==
X-Received: by 2002:a5d:6550:: with SMTP id
	z16-v6mr28597680wrv.194.1534784199974; 
	Mon, 20 Aug 2018 09:56:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z101-v6sm22353132wrb.55.2018.08.20.09.56.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Aug 2018 09:56:38 -0700 (PDT)
Message-ID: <642beb5c90ef1688101d93947be8f91eb1324d92.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 17:56:37 +0100
In-Reply-To: <20180820155440.12626-1-JPEWhacker@gmail.com>
References: <20180820024342.15484-1-JPEWhacker@gmail.com>
	<20180820155440.12626-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH v2] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Mon, 20 Aug 2018 16:56:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-20 at 10:54 -0500, Joshua Watt wrote:
> Replaces usage of the deprecated oe.utils.getstatusoutput() with
> Python
> subprocess calls.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/package.bbclass | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 4ce9de2f573..3976811d19f 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -380,6 +380,7 @@ def splitdebuginfo(file, dvar, debugdir,
> debuglibdir, debugappend, debugsrcdir,
>      # sourcefile is also generated containing a list of debugsources
>  
>      import stat
> +    import subprocess
>  
>      src = file[len(dvar):]
>      dest = debuglibdir + os.path.dirname(src) + debugdir + "/" +
> os.path.basename(src) + debugappend
> @@ -409,16 +410,10 @@ def splitdebuginfo(file, dvar, debugdir,
> debuglibdir, debugappend, debugsrcdir,
>  
>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>  
> -    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
> -    (retval, output) = oe.utils.getstatusoutput(cmd)
> -    if retval:
> -        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> +    subprocess.check_output([objcopy, '--only-keep-debug', file, debugfile])

Sorry, I just realised it needs a stderr=subprocess.STDOUT in there to
ensure the right things happen with logging...

Cheers,

Richard

