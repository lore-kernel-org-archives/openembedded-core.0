Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA8C7F8CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 18:18:40 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n15so7525103wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 11:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZC/OLIzKZlOiY8YNINAg9XrzpOaFnH5ED3nQD+08FMA=;
	b=L9jBArfxHGfFrJqAaEjJFB93LPgQeB6cEKZt/8NDXIDqcLJym5l6BdomK+JUFfB1Er
	Fr/Y+6OLGZR8+0owPDaqhiBZI0aOkmUg0jl57GtkEqLj5iJXKWBpeVgIsKHG1wzETSTK
	MZGWpVITIiWTzWRygBI7tlcUUQ0gfKK3ZDVdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZC/OLIzKZlOiY8YNINAg9XrzpOaFnH5ED3nQD+08FMA=;
	b=gsrNklsseapdS4kjNJbpzjf+1kVCvj+uCZsz02Ni3Nslh8qTMUvNLSC00wNY1Pr/hF
	POBt62DXpM5ND7p4s1k4nLKXkBDZyd02oDvhHeo3PJ3GWfeE9dayHdCSyN2bHynJxBU6
	+mvqfNb3CXaiX87Ki0Qrae7qnl7htNGcoGsQx7maVOg3S3fXfPJyuf5mnZjZHbGKrbA+
	8hFC9V3jZGdAmpjZhkAzSfA7xGQyQ5rDgR8QfdvcXgkTX4g7haxJYjteGzgJq4Tj3GL6
	/3yyGXx+GQfLEvqSDxBoAS3HHRfrJKkkchKih8ImXcfGQ7E1T6ysnaercmszgYPEWn7g
	12WQ==
X-Gm-Message-State: APjAAAWBgeLrGZsNSK6NAf/AjN0EFH996OPvgyz7oPQR8ca9lHtSguDG
	uEhgH7jaML8L18HWue1Nvgjb3Q==
X-Google-Smtp-Source: APXvYqyWE4QoEv76ARh74Yt1cB7kdZ4Zm9cc2SJ3E6ljUSsleyewSsvDh6p6HTCW/L4tJG3V1fQCiQ==
X-Received: by 2002:adf:de84:: with SMTP id w4mr12775784wrl.342.1572200321709; 
	Sun, 27 Oct 2019 11:18:41 -0700 (PDT)
Received: from hex ([109.190.253.11]) by smtp.gmail.com with ESMTPSA id
	l14sm9302935wrr.37.2019.10.27.11.18.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 11:18:40 -0700 (PDT)
Message-ID: <2bf2e46efd847d3771fa62f0cfe9cc508f0b4c2d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 27 Oct 2019 18:18:38 +0000
In-Reply-To: <52271207-9556-e9cb-667b-0b2d9916a0d1@gmail.com>
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
	<52271207-9556-e9cb-667b-0b2d9916a0d1@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 18:18:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-10-27 at 07:56 -0700, akuster808 wrote:
> 
> On 10/27/19 2:57 AM, Richard Purdie wrote:
> > I've been trying to figure out why we get a weird build failure
> > with
> > hash equivalence enabled. Armin has also been searching for an odd
> > issue with warrior and the qemu tests. I may have a lead.
> > 
> > If you build a standard qemu:
> > 
> > "bitbake qemu-system-native"
> > 
> > and save off the resulting qemu-system-XXX binaries, then add:
> > 
> > PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
> > PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"
> > PACKAGECONFIG_append_pn-qemu-system-native = " glx"
> > 
> > to local.conf, then:
> > 
> > "bitbake qemu-system-native"
> > 
> > it rebuilds as expected, save off the qemu-system-XXX binaries,
> > 
> > then remove the local.conf entries and:
> > 
> > "bitbake qemu-system-native -c configure -f"
> > "bitbake qemu-system-native"
> > 
> > then save off the resulting qemu-system-XXX binaries, you'll find
> > that
> > whilst these first and last sets should match, they don't. Its
> > obvious
> > with "ldd qemu-system-x86_64" that the linked libraries persist
> > from
> > the second to third set when they should not.
> > 
> > The reason is that when configuration changes, autotools.bbclass
> > will
> > wipe out ${B} however qemu doesn't use the autotools class and
> > hence B
> > is not cleaned for changes in configuration.
> > 
> > We could abstract the pieces of autotools.bbclass which do this
> > into a
> > separate class, or, easier, have qemu's do_configure wipe ${B}.
> > 
> > Armin: This may be the issue you're searching for with warrior?
> You mean the virgl failure? I did set the native packconfig to make
> the
> selftest and that had no affect. In facted, Zeus has the same
> mismatch.
> Alex's patches I believe align them to match.
> 
> The virgl failure is fixed using an updated version of libdrm. I
> thought I sent an email about that.

I'm travelling so a little out of sync, I see the email now. I think I
managed to hit the rebuild issue when I tried to debug it which is why
it seemed related to me.

For the libdrm issue in warrior, we could:

a) Break policy and upgrade libdrm
b) Just upgrade libdrm-native and nativesdk
c) Mark f30 as broken in warrior for qemugl and not expected to work.

Any thougts?

I'm tempted by c).

Cheers,

Richard


