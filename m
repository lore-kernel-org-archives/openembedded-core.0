Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 30AFD78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:38:01 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f13so22455234wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AA6f/U8OXfGzUGOT5zz42t8REn9DC9eXyWhFlaIC5Mk=;
	b=td7LUfmeWWo7mwRulXTwR/p7yYXWbVVVgQz+wq1YcbIlw1xLfjrAw8Ru7/U8iPWbNf
	w2CHNGB0Ohit1WvQDrczOMyAaRigjGZq1Dbb/7ViXEFOXNdcg3lGJoKdHp31xmmJ564P
	sN/Yy7xlxW4x+6U0f6wXOo6wWCltK1wiyK4zUZNBYLDed8hH1zlHSvcmGDZb0k7rOKBV
	QMD9RDswUeNOss4YAfGOjfPLVrUUJ8GC8g/QloRuEd483j2WK3ReqBbaMnwXno3MqDNx
	8dEaxVxRYtOy0OX1CEP8qWdcMUyuT+CMqrfpWmji8SJoPe9b2wx8N+Y9Q3Jhl29v95gq
	GE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AA6f/U8OXfGzUGOT5zz42t8REn9DC9eXyWhFlaIC5Mk=;
	b=nt12aPMzeCtnc6HPe4WyJycuLp/Y9yf6IIf5LhR3e44z8Cd7wndZ3Sb2aCJdB/1lRq
	DjEhvBYR1cCmzdCn2EELLshFp74MhsYz2phiy/aepdwvrDIiimRvc1w8FAB2uzVIkBwt
	d5AWp0DYu5J9nK0deoErzhWiZ780mruEhDpaHLlJDyEgr4g/R9I5s7iXZMmeX2PlgYJp
	uFCqz2yHeij5aV5kLjsQr6TSzRxBQndYOOlekouix09sDCCT44+wCNeRZIEb/n8jwMOP
	Q5WsnAtxorl0MJEfOomWDPBE8oSpY8eTgBreSB6pmTy3bKWs7I18OLH41BRx+iPOL0gZ
	aQ+g==
X-Gm-Message-State: AHYfb5g6Z0BVplY6Mo9tiM2GSGuBjJ7JArS77bPmy5W7crgonE5a1NGV
	wOLd3CR6KebLxvxPpVTmo9lm9KDbqn1k
X-Received: by 10.28.52.195 with SMTP id b186mr352566wma.54.1504039082680;
	Tue, 29 Aug 2017 13:38:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.184.147 with HTTP; Tue, 29 Aug 2017 13:38:02 -0700 (PDT)
In-Reply-To: <cover.1504036763.git.pkj@axis.com>
References: <cover.1504036763.git.pkj@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 29 Aug 2017 13:38:02 -0700
Message-ID: <CAJ86T=VajsxSGRakyVVmTZcEWwwLaVZxKpcsE+ZU75bGrsUkbQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Tue, 29 Aug 2017 20:38:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 29, 2017 at 1:00 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Occasionally, we see errors on our autobuilders where a setscene task
> fails to retrieve a file from our global sstate cache. It typically
> looks something like this:
>
> WARNING: zip-3.0-r2 do_populate_sysroot_setscene: Failed to fetch URL
> file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz, attempting
> MIRRORS if available
> ERROR: zip-3.0-r2 do_populate_sysroot_setscene: Fetcher failure:
> Unable to find file
> file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
> downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
> 66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz anywhere. The
> paths that were searched were:
>     /home/pkj/.openembedded/sstate-cache

To trigger this, do you have SSTATE_MIRRORS pointing to
"/home/pkj/.openembedded/sstate-cache" and SSTATE_DIR pointed
somewhere else? Or are they both pointing to the same local directory?
Or something else?

> ERROR: zip-3.0-r2 do_populate_sysroot_setscene: No suitable staging
> package found
> WARNING: Setscene task
> (meta/recipes-extended/zip/zip_3.0.bb:do_populate_sysroot_setscene)
> failed with exit code '1' - real task will be run instead
>

