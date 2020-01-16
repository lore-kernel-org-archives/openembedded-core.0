Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 977417F265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 13:13:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47z4Q60KMCz3w;
	Thu, 16 Jan 2020 14:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579180415;
	bh=PJDBuvOwGVhKwRQOn0DoNJLhR546cIrUGphBhck48MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j82zOoI4lC6W3x09vG4yRF56N+8+ZKwbm7Ig1hOnnblyBEK7sif+a2yR2m/jSXnHf
	Q6vrgT0M4NIIr5iS96ESrDDwALKfw3EcV686QH/kAFdr1IcNRIVIiANQTrMph1sd2r
	cLCen0N6WGHsQM2HhJjYtLMWS+GrDHGxIR3m4/Z/RwKlZYsDJX5wuO7TmfQglpYwJ1
	X2JZ084cBvKoUTo9PRDRW7S09e+fzLDwtMVN6S9rNVYSqSf4+uE1//9NjTi//q6rgo
	a5dipUXkmKZIlAT9TNlHgtblAvoYXgQ5rK9ich40xrVHiZUZntncnpr+hEoA9eR8fB
	QYvDCh5gPWMpb2c9cBkQV4CiW8jZT5h8FTY652gSE59lX7OyqVUwnWVbucBLVr6g+C
	CY1p36GqiJfPmikXPts4tQBLhseWHlT+qaggWgqekI7DRyJjlYuOCsqBFKfVSFmC5s
	xbS3SITV8Vd6fg2giScq2TPMkd5W182Rlv+uqDjDJc3/iQMEc23B3lPSo1RmDUKsSf
	pYU1hrpsOfflEZEWe/xJfmKooPbVMjztdBTzlxzt9f/IbnBq7Vr97rw4Ft1M+NOLKn
	IhFZToUQis11DhqVx51+AvUOdVnNZt9H2KXjFEnvgsSuevOPyTYgP+hLiJ3u7hHB/s
	lHbBSTve+bHVg5slrbw9WYf4=
Date: Thu, 16 Jan 2020 15:13:30 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200116131330.GA2546@localhost>
References: <20200116044609.3902260-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200116044609.3902260-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Thu, 16 Jan 2020 13:13:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 15, 2020 at 08:46:09PM -0800, Khem Raj wrote:
> Clang detects that getcwd is being re-declared and signatures don't
> match, simple solution is to let clang use overloadable attribute
>...
> +Fixes
> +dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
>...
> +-char *getcwd ();
>...

Looks like a bug in clang to me, and should be fixed there.

The code does not tell anything regarding the parameters,
but clang seems to misinterpret it as "no parameters".

cu
Adrian

