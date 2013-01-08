Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsc55-0004TC-Mn
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:31:25 +0100
Received: from mail-qc0-f200.google.com ([209.85.216.200])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 08:15:02 -0800
Received: by mail-qc0-f200.google.com with SMTP id l42so1157614qco.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 08:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=hD+Zm4VpY7GrquKn3XZZNoJOIWx+Kuc/hPMp/sTUcmg=;
	b=ka3lD4vGUyT9kE2frcDTmVHPKEfOjG8KOpdh8TUAGIzORDiKUWs/+5AYD/Q0zTXVo1
	iT6HLo58BsIT6vAh+PNyVDtCtmEMyPVNVXtVr7sQS8jIxCVYbgvCetumGhW5oqi2jlbs
	66HvYgPbcehM89A0ou+a57CdEjjKlnAKS/PkmGvO9sLjzc5lAwVFOfJ+m/uK/zOn/fre
	e1XSid0SawLYHumDk4i3vbQKvPkMmdYqtyP3AeaGSQQnfRVslvY6U0abPgtV43RNNR83
	vpj4m078N0SZ5JRuvVOLhYSnUKZO+rR91Ys3rHXV71NB2jAStwWEpJa+KWAj5JLrTRjN
	59ww==
X-Received: by 10.52.17.70 with SMTP id m6mr75928963vdd.92.1357661762879;
	Tue, 08 Jan 2013 08:16:02 -0800 (PST)
Received: by 10.52.17.70 with SMTP id m6mr75928950vdd.92.1357661762729; Tue,
	08 Jan 2013 08:16:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 08:15:42 -0800 (PST)
In-Reply-To: <lyd2xfmzg8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1357658627-31689-1-git-send-email-ross.burton@intel.com>
	<lyd2xfmzg8.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 16:15:42 +0000
Message-ID: <CAJTo0LZFg-7eu2TSyVdvzk5iisQH=BHPdKjDE7Aje_5VmRg_xg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQlyRS4axlr0K48LGqr8mcAMeZwDIjls+orD89tX2nlzzmjOF3qoDUdnwER2Dc1lrZ/jMcqD+R6AilfN/6TxOrllSDfIEj09v1F4OcQ69HdaznW02EbbwhZZC1vAT9wSdpOJMK+snkGdB5pprphpaNyW9JEQhnkAm8pyG0lqX9EdRm3mc2D56xA1ye5e2FfZ35awN2da
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pkgconfig: add -native script that uses the native sysroot instead of target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 16:31:28 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2013 16:06, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> how will you call this wrapper when e.g. makefile contains:
>
> | foo_CFLAGS = $(shell pkg-config --cflags foo)

You use PKG_CONFIG_FOR_BUILD, along with CC_FOR_BUILD etc.

> A more powerful approach might be to install it as 'pkg-config' under
> ${STAGING_BINDIR_NATIVE}/pkg-config-native/ and prepend this dir to
> $PATH when executing the makefile above.

This is for when cross-compiling a package that needs a native tool,
and building that tool is easiest with pkg-config.  The pkg-config
binaries *need* to have different names.

Concrete example: I've a patch to GTK+3 which uses
PKG_CONFIG_FOR_BUILD to find a host gdk-pixbuf so it can build a
native gtk-update-icon-cache instead of depending on gtk+3-native.
This pkg-config needs a different name as otherwise it would be used
instead of the cross-pkg-config.

Ross


