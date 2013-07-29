Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 88C516B436
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:59:50 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 15so438090vea.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=5UNwzlRJjUZ/GoYGxhNubt8ymfkOSpU8r8xqrFyJeeM=;
	b=kDxgmHtb8RtvvMuK4zjF5YcLZ1ohnQ2spW+Ui+VVGwRuQk/a729hHv5S6OHJ1DwZpf
	BRgTmyf7dIJWbqHhO5BZqSvtcF9DwqFOg1qeNp0EObeS7BQOKAxbgAHc78mLAbdTmgbC
	fq/DV7pQqwrOhDFQvokRTmAB6uCxQKKUmo7dpR/fi2/yMl0o8mSYXQ1jl81MWepIhSNf
	YFsTpP9B0g5qGLgdjKhtXmfPK5VY249Sbx/eNSPVDeCfp5zCPK4XIH83gM2hYn1O244Z
	hiywTNXHIAbOCbn31ZqqBIHo45HjJnTu9wO0bELqaabcHdH3U4ZfwxJHeiW4iSH/9l/p
	BtoQ==
X-Received: by 10.52.103.84 with SMTP id fu20mr17336893vdb.51.1375113590939;
	Mon, 29 Jul 2013 08:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 08:59:30 -0700 (PDT)
In-Reply-To: <6e09df864b4a870ac23c7e443dfee302962b811b.1375065009.git.Qi.Chen@windriver.com>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<6e09df864b4a870ac23c7e443dfee302962b811b.1375065009.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 16:59:30 +0100
Message-ID: <CAJTo0LZNX0DXiZVu6cL+7dEbD77g1c6KPj7XXT59VV6Tm4sX4g@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQlk1tiyFzT827AoUjAALl6sUpmOzJDb5yfQVAKiSGElqHZ5DusQj74bEDf6kAHVlxvZE3e9
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 10/10] openssh: make /etc/ssh directory writable in read-only rootfs
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
X-List-Received-Date: Mon, 29 Jul 2013 15:59:50 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 03:33,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> If the rootfs is read-only and the ssh keys are not available at system
> start-up, the init script will generate ssh keys into /etc/ssh, thus
> causing a 'read-only file system' error.
>
> Make this directory writable in case of a read-only rootfs.
> Note that if the ssh keys are pregenerated, they will not be lost,
> as there's a copying process before bind mounting.

I'm not very keen on the idea of every oe-core system having a tmpfs
on /etc/openssh just for read-only-root configurations where there
isn't a pre-generated key.

At least one better option would be to handle the read-only / with no
pre-generated keys situation in the init script, and write keys to
/run.

Ross

