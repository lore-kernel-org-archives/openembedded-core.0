Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id DAB626C109
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 08:15:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r6so3197214wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=nhIrUMTKY2jqtqxUf91ZwkFJ7ZTXla7IQlm23WQyS5c=;
	b=F0QOhH6UtcTH82KQ+OWcNm3bnyZ8Xbst7cooOsLJytitZjVsbe59NCEeu/WTMZ8RK4
	wNVJn43+mYMaX9FRGlCQHFJkbDLxvloizRzT4JGCa89ql63g6o21igsA5Vh+tn+E0tXk
	0flmKTDgcWzYfkggWSxnIiSUhCIFq5J+5fO2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=nhIrUMTKY2jqtqxUf91ZwkFJ7ZTXla7IQlm23WQyS5c=;
	b=HP71NxJ4HdghKYodeiqQqvV5rhm4OybOp5cjeH9LfTGD8hskcAGR9hr3HBIODKz4Iq
	CVe1ft/4Kh0LkSGF2ldjucwMgoGwm5ad53NnBJ7NvQM7j12HW3cqPHKXR38YwrmYXmC5
	IzyG9q0IUGpsykoyPWl1uJxpSz3t3MF3CZ8pD5/kx7/p+3b6bGLq5ouIPvA0zGzyTNMi
	aKlOMpz0LEpN9y09Gk04+DBzowPK/mMvZ86j/vM69fdis2TT7FxUNTiCm9JndlSVzAJ7
	Q66Zy3VJ6Gp/XwpP5KAekE6UVMTJUyTWhghDouTODWprhTSWeHoq0uSc3HAcrg4Ppl5b
	TWRg==
X-Gm-Message-State: APjAAAX6uMx1M8KSJc8g5zNUZhBv9DRYbe4GOEfWzLiSNGvHALz2QDc0
	sZDi0eR2rJnbAtOC8qA7GTe+Ng==
X-Google-Smtp-Source: APXvYqxQFwmUEdmnIlj1X/KZODRfoxZTgwOj3L+AXKhJtZomK5OHrLUsbtJXhHgANJ5chhr6xexvug==
X-Received: by 2002:adf:eb0b:: with SMTP id s11mr31378907wrn.140.1556266532509;
	Fri, 26 Apr 2019 01:15:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x84sm29992371wmg.13.2019.04.26.01.15.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 01:15:31 -0700 (PDT)
Message-ID: <5ad32df1a1e0d73cd750320acfececa4e56c4ace.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 09:15:30 +0100
In-Reply-To: <1555710460-29774-1-git-send-email-alejandr@xilinx.com>
References: <1555710460-29774-1-git-send-email-alejandr@xilinx.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] run-postinsts: Fix full execution of scripts at first boot
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
X-List-Received-Date: Fri, 26 Apr 2019 08:15:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-19 at 14:47 -0700, Alejandro Enedino Hernandez
Samaniego wrote:
> run-postinsts runs a given set of scripts during the first boot of
> the
> device, when one of these scripts prints something to stdout (isnt
> daemonized correctly), since stdout is not available at that time,
> the script execution immediately returns with an error
> (exit_group()),
> this error causes the script to terminate all threads within the
> process,
> causing undesired behavior since the script might still had to
> execute
> some other code.
> 
> Replace eval built-in with $(), since $() executes in a different
> shell,
> even if one of the scripts exits, all threads of that process will
> only
> be within that session, this ensures other scripts meant to be run
> are
> still run afterwards.
> 
> This was only required on the line that actually executes the
> scripts:
> "eval sh -c $i $append_log", other replacements were put for
> consistency,
> and generally, it is recommended to use $() instead of eval anyway.
> 
> [YOCTO #13266]
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandr@xilinx.com>

This seems to cause:

oe-selftest -r runtime_test.Postinst.test_postinst_rootfs_and_boot

to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/429

(both on the autobuilder and locally)

Cheers,

Richard




