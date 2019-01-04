Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id E080C7BDAD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 00:02:36 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t24so28374609ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 16:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XJ6cpVNm+6BlBYBv26dN8lt0EposB2amQvFDvwgfJws=;
	b=lGR32iBacRtgsMqnbfQd/ZklM2ip+bl22TeJmV+wAEtGVUZFtdwHOKBy1icWr5g3Gv
	ghD1+relkc1AI6Hu5e6epNKT42Yqg8IgkhVYN6mkuovXtKs/BfYzuLg8euc6M13yzDLt
	oNk6+1dsA07E3soYB7UIPj0eKsDe83mXhc4fBR0u1s75unJla4QoqBNiwtZ6fDm5mQ0d
	Z95o2TTLxWkqNWUjUn9ZhNLpKba7jV8Iqcpo3q1RZEnTr71nC1Xo0SqyV5g+QfWqQHRs
	4xVupVr2qbyQsBvkphysKbfxODOfoXqioNoKLME0hxtcpAK5akNi9XZ6DsyyowcxTcCm
	OeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XJ6cpVNm+6BlBYBv26dN8lt0EposB2amQvFDvwgfJws=;
	b=bRU3hH6E/Mu/0kWWqYZfj69kaLvAWidRAwfsMnzbE4bsgJnMsi2woMyv/fawFDuaxz
	z2wa61JNrUt0bGXefVfgLo+SQPXHbMJjgkw3HKCCX2of81mjoi42woQcInKti0sSAKqC
	JqJjx5jXdV4v6274GShN6ps9CEJpteTBHK//t6SRNvmM++zO3YwgVICF/nu+f8zL12S9
	dMJ38eJzf16bLVgknYG2Ziap8T+NtqhnBvwxll2Qj+MQKXOHijwvCN/FQRbYKCh1kMkE
	gHxkDdYHbMD5taMP5PDJvHjLNbxskIbDGRjjmBpyyt6dVKWJUTtlFRajfUrvyRy3hENC
	rmkA==
X-Gm-Message-State: AJcUukdEnMRTSe6nKtdU55DAUZ2IQBIvDLbdYMKrNnHDzirMvH9Eqrtp
	UToPJXW0nCAGrafKOIDPtC7oBe7xrzw8KMwY34it8g==
X-Google-Smtp-Source: ALg8bN5NV/Xrv0BuxfHj1lY9Rxh1dAZxhzGYy316nZSMzJ9m7klOh5BZ+0IXPdINhJ3Yh4APud5S3A3IZCzgBvVW29E=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr5014242iom.201.1546560157885; 
	Thu, 03 Jan 2019 16:02:37 -0800 (PST)
MIME-Version: 1.0
References: <20190103231826.31290-1-alistair.francis@wdc.com>
In-Reply-To: <20190103231826.31290-1-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Jan 2019 00:02:26 +0000
Message-ID: <CAJTo0LYQH+=kx8=jmxsRB6SAgf4Un+vK_0ea+NdRbVpB9Yr47w@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] swig: Fix configure failure
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
X-List-Received-Date: Fri, 04 Jan 2019 00:02:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jan 2019 at 23:18, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> Fix the swig build by calling autogen.sh before running configure.

But...

> @@ -45,6 +45,7 @@ do_configure() {
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
>      install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> +    (cd ${S} && ./autogen.sh)
>      oe_runconf

Now this is literally just reimplementing the default do_configure
from autotools.  The first three lines are gnuconfigize, autogen.sh is
generally just autoreconf in modern systems, and then oe_runconf.

If do_configure is just deleted, what breaks?

Ross

