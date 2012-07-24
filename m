Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Stfn9-0003SM-8R
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 16:08:51 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 24 Jul 2012 06:57:21 -0700
Received: by qabj34 with SMTP id j34so1605738qab.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 06:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=jKysku2Jw75/5uoAJ062JSC793JpzX0+pu0wXkL9JYE=;
	b=E4/WtIcLX3WNi2zLf5xQDzHY+F+8pU/hSB+UEmaf7OlK8PkG6DOl764b6zJRz3vgym
	i1XchxXusUNODhRKQVqQPB/SKzUv97LyCgewWs8UNbRLQExWiJbkF8cIOLKW6BfVui6d
	lV5W+SH1XESV2vmTM6Zf3f75MwPWQT5My00bFOylEl04sZbtI1WsGzz0o5Rkrj8lPn3Z
	iyS6h4b1LoKSxC7evZ2timAAxU0LkRRGZtEnEN/zow+N62nL/mUSpgKr5FMB5XazezY2
	qr1K7O5eHaIdv8NuvDFMa/BqPTCmXuQ9QxzDW3bMazAbBXMwKIDCSsCRvwHoHxlpegXy
	E0vA==
Received: by 10.60.7.197 with SMTP id l5mr5629256oea.33.1343138240927; Tue, 24
	Jul 2012 06:57:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Tue, 24 Jul 2012 06:57:00 -0700 (PDT)
In-Reply-To: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jul 2012 14:57:00 +0100
Message-ID: <CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQncMKZ4b9ZPd0mdJh3rSIachMou0z/VyVFmlbKtiBqA1vRVsUKtBSzFo8jeN/l96Gq3Ecc0
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 14:08:51 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
> when bzip2-native is installed in parallel to sysroot, it is possible that
> some packages are using bzip2 to unpack, there are chances that bzip2 is
> installed to sysroot but libbz2.so.0 not installed yet because parallel
> installation.
> link bzip2 and bzip2recover statically to avoid this problem and don't lose
> parallel installation. libbz2.so is still available.

Is it me, or is this officially getting silly?  This probably happens
for *every* binary in the sysroot that links to a library, which is
probably a fair proportion of them.  Statically linking every single
one and then special-casing further problems where a static link isn't
sufficient (see pythonnative) just isn't going to scale.

Ross


