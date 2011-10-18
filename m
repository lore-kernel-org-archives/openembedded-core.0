Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGG51-0001aL-1s
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:16:07 +0200
Received: by pzk33 with SMTP id 33so2503783pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Rak39i6eYL2YWV/lT+q17TasE6Nj8Uw59DPPoyopcNg=;
	b=k/OVuzaqqEHhMxcY0ESYUIo276kBFFeNcWEAM+xy5xwQPFo00+Z+dDfB77WuGUZaTN
	X4DqgU832SfPIlJ/wIWv7hxJnYO1Z3/wg3b681L2nLaurqMMBRwXFw+6YYk9geJpNFzl
	oFqYdIlKaAJA+BEScWUXk+Eo60IjIrykpC4eI=
Received: by 10.68.17.193 with SMTP id q1mr6990618pbd.98.1318968613073; Tue,
	18 Oct 2011 13:10:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Tue, 18 Oct 2011 13:09:43 -0700 (PDT)
In-Reply-To: <20111018183520.GB556@jama.jama.net>
References: <20111018183520.GB556@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2011 13:09:43 -0700
Message-ID: <CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Race condition or something when fetching local files?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 20:16:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 18, 2011 at 11:35 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I have noticed that even local patches are stored in downloads dir,
> but today I've noticed that wrong file was used later in do_patch.
> I have latest oe-core/meta-oe + latest bitbake.
>
> Pulseaudio was building here for first time
>
> downloads/buildfix.patch is from previous build of xf86-video-intel-2.16.0
> $ head downloads/buildfix.patch

looking in bitbake lib/bb/fetch2/local.py it seems it searches DL_DIR
before other
search paths. cleansstate might not have information that the patch
was downloaded
and not applied from local metadata after the recipe is updated.


