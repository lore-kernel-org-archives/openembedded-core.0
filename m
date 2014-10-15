Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD2C65D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:43:03 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id w8so596217qac.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eBRFs7UFCeirqrUVy2jf4zMZuuKNx2sQqRpX5fVARm0=;
	b=IwanPPL154Ovp6UqfZc3syr6RsfnCKdS6K/Y/KpGeTZpmVuEe+xOpe8Sct8fCj/SwR
	l7fa00nTFHeoSj1SEFh2SsnZ91Yy/7X8Fc3ptXG6YpfRbOeoZq5WjFn4BPVjqF9tel0v
	2MpTzDFYYAzezzFHqtbB7pSAV9HEgcOY/PPz6nWsG07uKmHtMshH6LDKddq9yg05eMzz
	OG+fHby9JyOzqY5YepX839S7d0XLSs3EYcaE7Pf22Punp0zDlXf9lEIcXDmtJb0o0j0O
	zULHT/UJjjHr/E+UyCWWMocF5LWe37Wt9NU+uyv3l5NAFwrvWqyOJjE/z1SvXggIrnGY
	6QFw==
X-Gm-Message-State: ALoCoQn/S9zfWjLy5qQbcO6R3Ts7ck9yO095HkNmZAZyw4eeGkbz/AzPSmtWzU5ubddSOGUXcfag
X-Received: by 10.224.28.68 with SMTP id l4mr18713412qac.22.1413369784446;
	Wed, 15 Oct 2014 03:43:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Wed, 15 Oct 2014 03:42:44 -0700 (PDT)
In-Reply-To: <b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
References: <cover.1413341569.git.Chong.Lu@windriver.com>
	<b2f5f79f9e08f008043508392775c2bb52f819b3.1413341569.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 11:42:44 +0100
Message-ID: <CAJTo0LboKNAOi7_tx31+m2KOxF_HEKEGePU2wnHXSzGpoeGTgA@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 15 Oct 2014 10:43:07 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 03:54, Chong Lu <Chong.Lu@windriver.com> wrote:
> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
> in the sdk:
> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> gconf-3.2.6-r0.0.x86_64
>
> Split org.gnome.GConf.service to ${PN}-service, the conflict was fixed.

Why are both ML variants of gconf being installed?    Presumably for
libgconf, which needs to have ML variants and is packaged into $PN.
$PN also contains the binaries and data files, which are not
ML-specific and can only be installed once.

So, gconf should split the daemon/binaries from the libraries.  I
suggested this back in July as it seems the logical answer, instead of
splitting the daemon binary and the service file that defines where
the binary is.

Ross

