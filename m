Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C586278D39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:19:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id 20-v6so6233161wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 01:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=akY3tnwtkrtnO3W/iq/0H91XQCiM7UJUVvlCzCUqaPQ=;
	b=Fsz5gLfYBr6wSjiRNEd4ZD9T7xSdtN5tBStnPY/E0MXgW5mGItb54taATOyfWjgD9i
	BjEkWaFo0wF0/2QyOaNCM6tSICu5BTeWI3aeIf3WRBk/SQMUkZtYCf+R/8dSZoJM+GBA
	EqFiFnRFKTleinuX4jBdW//NorkWUDSALaeg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=akY3tnwtkrtnO3W/iq/0H91XQCiM7UJUVvlCzCUqaPQ=;
	b=od03OR4+dB4vzKd/a1rHNDVbPLJ9OuNFR58Snps4VXYzVK0KSl7WKRJOAYMER+CZR+
	0OgSjbsvKJyTXXE8eQPOpKJwwT/EKsgz6l1N7r67PrYAWiQ/+G3nSrDjJyA7PMCT9CJd
	eifJs19BQNP9VZ2JXkYHU9W+PQE0Rok5VKDNwlnuew4A9gIqgNXkG0I5Q2+FTR1AUIwB
	dMwAdFSZ3PSBPzzCDBtJfgGXXtfxOa4XRm2YjgrQGnUoj7BjjUifpmVLIXfdaYgBQGtb
	5W1hpQHfpUgry5LB/b26xmwuQ99V0H2wupEJqZ4ACS9pzOa1yztLNtUvgPBcbI3LTKBi
	hy4w==
X-Gm-Message-State: APzg51BqA3kp84y2JWcoSyQr8K9INLcmQ0DIA7NWX/7Fy+1GUmMNHt+q
	mkQKYGf5hcJhHeuOTHmdTeCrhQ==
X-Google-Smtp-Source: ANB0Vdb+sE2zcXzP/jkfn8PSGwa+6ipfAGlHAtRjCXh0h0mKLvI/634PSAQdJ7cxeNEbu3nqJSCxlw==
X-Received: by 2002:adf:f749:: with SMTP id z9-v6mr4737864wrp.85.1534753156318;
	Mon, 20 Aug 2018 01:19:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j66-v6sm9718654wrj.28.2018.08.20.01.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Aug 2018 01:19:15 -0700 (PDT)
Message-ID: <f31411d21297235d7324b6d55ffd588f44c439fd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 09:19:14 +0100
In-Reply-To: <20180820024342.15484-1-JPEWhacker@gmail.com>
References: <20180820024342.15484-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] classes/package: Clean up getstatusoutput
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
X-List-Received-Date: Mon, 20 Aug 2018 08:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-08-19 at 21:43 -0500, Joshua Watt wrote:
> Replaces usage of the deprecated oe.utils.getstatusoutput() with Python
> subprocess calls.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/package.bbclass | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4ce9de2f573..b05d2858281 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -380,6 +380,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>      # sourcefile is also generated containing a list of debugsources
>  
>      import stat
> +    import subprocess
>  
>      src = file[len(dvar):]
>      dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
> @@ -409,16 +410,18 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>  
>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>  
> -    cmd = "'%s' --only-keep-debug '%s' '%s'" % (objcopy, file, debugfile)
> -    (retval, output) = oe.utils.getstatusoutput(cmd)
> -    if retval:
> -        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> +    cmd = (objcopy, '--only-keep-debug', file, debugfile)
> +    try:
> +        subprocess.check_output(cmd)
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (e.returncode, ' '.join(cmd), ":\n%s" % output.decode('utf-8') if e.output else ""))
>  
>      # Set the debuglink to have the view of the file path on the target
> -    cmd = "'%s' --add-gnu-debuglink='%s' '%s'" % (objcopy, debugfile, file)
> -    (retval, output) = oe.utils.getstatusoutput(cmd)
> -    if retval:
> -        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (retval, cmd, ":\n%s" % output if output else ""))
> +    cmd = (objcopy, '--add-gnu-debuglink', debugfile, file)
> +    try:
> +        subprocess.check_output(cmd)
> +    except subprocess.CalledProcessError as e:
> +        bb.fatal("objcopy failed with exit code %s (cmd was %s)%s" % (e.returncode, ' '.join(cmd), ":\n%s" % output.decode('utf-8') if e.output else ""))
>  
>      if newmode:
>          os.chmod(file, origmode)

I appreciate this is a direct replacement and functionally equivalent
but are these custom exceptions any real use? Its hard to actually get
them right and I suspect we may be better off without them using the
standard formatter?

Cheers,

Richard

