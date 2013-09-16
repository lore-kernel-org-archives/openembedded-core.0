Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D16BB615CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:58:07 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8GGw4de027876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 16 Sep 2013 18:58:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1379350687;
	bh=rQCTiVAkpMlaL14NjfazlSAUriZhgoBvx84k+VbGEpE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=BlVI/Dj5PhtYy90sxaI6KnDGbvfbQ85uODxFfZljWRyTCx/TKKzaW4ZKnKnfeNkuj
	Z22pjSqQ9h5BiK4UWadTOqz0mTelApO9gtPyY8vBqSzBYhHmur4s4ixGWaszAOHXgi
	auAuONKm1PHwRmAiq8QsolHXaAtbAFXfibaFFV24=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8GGvwrV012554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Sep 2013 18:58:00 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VLc7a-0007vE-OL; Mon, 16 Sep 2013 18:57:58 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1378728762-11206-1-git-send-email-ross.burton@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 16 Sep 2013 18:57:58 +0200
In-Reply-To: <1378728762-11206-1-git-send-email-ross.burton@intel.com> (Ross
	Burton's message of "Mon, 9 Sep 2013 13:12:42 +0100")
Message-ID: <lybo3sd7qh.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] systemd: split out systemd-binfmt as a separate package
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
X-List-Received-Date: Mon, 16 Sep 2013 16:58:08 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> If binfmt_misc was compiled as a module but isn't installed then systemd-binfmt
> will put an automounter on /proc/sys/fs/binfmt_misc and when it attempts to
> automount (e.g. when df is called) it can't find support for the filesystem, and
> throws an error.
>
> As binfmt_misc isn't commonly used, split this helper into it's own package, add
> a dependency on kernel-module-binfmt-misc, and ensure the service gets started
> when it's installed.
> ...
> + Conflicts=shutdown.target
> ...
> +SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

This seems to trigger some strange behavior in the systemd.bbclass which
adds 'Conflicts' (and 'Also') to the FILES list.  E.g. after this, the
'shutdown.target' file is moved into the 'systemd-binfmt' package.  This
in turn causes 'systemd-binfmt' becoming a rdependency of 'systemd' due
to dead symlinks.

I would avoid the 'inherit systemd' in the systemd recipe and package
the files and .target.wants/ symlinks as-is in ${systemd_unitdir}.




Enrico

